
; -------------------------------------------------------
; PECompact v2 API Hook Module - Loader plugin-plugin
; (c)2004 Bitsum Technologies
; -------------------------------------------------------
; Compatible with MASM.
;
;

option casemap:none 
.486p
.model flat,stdcall
	
; ------------------------------------------------
; Include files
; ------------------------------------------------

include ..\pec2hooks\miscdef.inc
include ..\pec2hooks\pec2hooks.inc

; ------------------------------------------------
; public symbols
; ------------------------------------------------

public GetPointerToHookData
public GetHookDataSize	

; ------------------------------------------------
; Function prototypes
; ------------------------------------------------
GetPointerToHookData PROTO
GetHookDataSize PROTO
GetHookFlags PROTO

Initialize PROTO pFunctionInfoArray:DWORD
LoadLibraryAHook PROTO pszModule:DWORD
GetProcAddressWithHintHook PROTO hModule:DWORD, pszApi:DWORD, nHint:DWORD
TranslateAPIAddressToHookAddress PROTO pApiAddress:DWORD

.code

GetPointerToHookData proc
	lea eax,HookData
	ret
GetPointerToHookData endp

GetHookDataSize proc
	mov eax,offset HookDataEnd-offset HookData
	ret
GetHookDataSize endp

GetHookFlags proc
	mov eax,PEC2_HOOKS_FLAG_MANDATE_LAST_IN_ORDER
	ret
GetHookFlags endp

;-------------------------------------------------
; HookData 
;
; This is the beginning of a contiguous block of
; memory that contains all code and data of the API
; hook plug-in. It is prefixed with a HOOK_DATA_INFO
; object that describes the location of functions
; within the block of memory.
;
;-------------------------------------------------
HookData HookDataInfo <size HookDataInfo, PEC2_HOOKS_VERSION, \
			offset Initialize-offset HookData, \
			0, \   
			offset LoadLibraryAHook-offset HookData, \
			offset GetProcAddressWithHintHook-offset HookData,\
			offset TranslateAPIAddressToHookAddress-offset HookData>

g_pLoadLibraryA dd 0
g_pGetProcAddressWithHint dd 0
g_pTranslate dd 0

szK32 db 'kernel32',0
szGMHA db 'GetModuleHandleA',0
szGetCurrentProcess db 'GetCurrentProcess',0
szIsWow64Process db 'IsWow64Process',0
;szIsBadReadPtr db 'IsBadReadPtr',0

g_bWow64 dd 0
g_pGetModuleHandleA dd 0
;g_pIsBadReadPtr dd 0

;-------------------------------------------
;
; 
;		
Initialize proc uses ebx edi esi pFunctionInfoArray:DWORD
	LOCAL hModule:DWORD
	LOCAL bWow64:DWORD
	LOCAL pIsWow64Process:DWORD
	
	GET_DELTA ebx
	
	mov esi,pFunctionInfoArray
	lea edi,g_pLoadLibraryA[ebx]
	mov ecx,3
	cld
	rep movsd	
	
	; todo: we need to freelibrary on kernel32 -- add deinitialize func?
	lea eax,szK32[ebx]
	push eax
	call LoadLibraryAHook
	mov hModule,eax
	
	push 0
	lea ecx,szGMHA[ebx]
	push ecx
	push hModule
	call g_pGetProcAddressWithHint[ebx]
	mov g_pGetModuleHandleA[ebx],eax

;
; find IsWow64Process
;
;
	mov g_bWow64[ebx],0		;;; set to false unless we know better later
	
	push 0
	lea ecx,szIsWow64Process[ebx]
	push ecx
	push hModule
	call g_pGetProcAddressWithHint[ebx]
	test eax,eax
	jz IsNotWow64
	mov pIsWow64Process,eax

;
; find GetCurrentProcess
;
;
	push 0
	lea ecx,szGetCurrentProcess[ebx]
	push ecx
	push hModule
	call g_pGetProcAddressWithHint[ebx]

;
; get process handle
;		
	call eax

;
; is XP or 2003 (IsWow64Process exists).. so now is wow64?
;
	;; eax=process handle
	lea ecx,g_bWow64[ebx]
	push ecx
	push eax
	call [pIsWow64Process]
	;
	; global bool set
	;	
IsNotWow64:
				
	ret
Initialize endp

;-------------------------------------------
;
;
LoadLibraryAHook proc uses ebx edi esi pszModule:DWORD
    GET_DELTA ebx
	push pszModule
	call g_pLoadLibraryA[ebx]
	ret
LoadLibraryAHook endp

MYSTRCMP MACRO
	LOCAL endme
	LOCAL loopme
	LOCAL endgood
	LOCAL endgreat
	LOCAL endless
	
  loopme:
	mov al,byte ptr [esi]
	mov ah,byte ptr [edi]
	inc esi
	inc edi
	test ax,ax
	jz endgood
	cmp al,ah
	ja endgreat
	jb endless
	jmp loopme
  endgood:
	xor eax,eax
	jmp endme
	endgreat:
		mov eax,1
		jmp endme
	endless:
		mov eax,-1		
	endme:		
ENDM

;-------------------------------------------
;
; GetProcAdress
;
;  uses hints
;  binary search
;  handles forwarded exports (NTDLL.Name, NTDLL.#123)
;  
;
GetProcAddressWithHintHook proc uses ebx edi esi hModule:DWORD, pszApi:DWORD, nHint:DWORD
	LOCAL nStartIndex:DWORD	
	LOCAL nExportSize:DWORD	
	LOCAL szTemp1[256]:BYTE				
		
	GET_DELTA ebx
	
	xor eax,eax
	add eax,g_bWow64[ebx]
	jz NotWow64
	;
	; if wow64, do normal GetProcAddress
	;	
	push nHint
	push pszApi
	push hModule
	call g_pGetProcAddressWithHint[ebx]
	ret
	
NotWow64:
	
	xor esi,esi
	add esi,hModule
	jz NotFound		
	
	
	;
	; v2.60: try with GetProcAddress first.. fix for new hook of all modules and combination
	;  of this hook plug-in and api is packed.
	;
	;;push 0
	;;push pszApi
	;;push hModule
	;;call g_pGetProcAddressWithHint[ebx]	
	;;test eax,eax
	;;jnz NotForwarder
	
	;push 512
	;push esi
	;call g_pIsBadReadPtr[ebx]
	;test eax,eax
	;jnz NotFound
		
	add esi,([esi]+IMAGE_DOS_HEADER.e_lfanew)
		
	; exports is first data directory
	lea edi,([esi]+IMAGE_NT_HEADER.DataDirectories)
	mov esi,[edi]
	mov eax,[edi+4]
	mov nExportSize,eax
	add esi,hModule
	; esi-> export directory
	
	mov ecx,pszApi
	cmp ecx,0ffffh
	ja ImportByName
	
  ;----------------------------------------------
  ;
  ; ImportByOrdinal 
  ;  ordinal in ecx
  ;
  ImportByOrdinal:	
	sub ecx,([esi]+ExportDirectory.Base)
	mov edi,([esi]+ExportDirectory.AddressOfFunctions)
	add edi,hModule
	shl ecx,2   ; *4
	mov eax,[edi+ecx]
	add eax,hModule
	
	;
	; see if this is a forwarded export
	; check if in export section (COFF spec)
	;
	cmp eax,esi
	jb NotForwarder
	add esi,nExportSize
	cmp eax,esi
	ja NotForwarder
	
	;
	; format:
	;   NTDLL.FuncName
	;   NTDLL.#1
	;
	; find '.'
	
	lea edi,szTemp1
	; edi->DLL name
	
	FindLastDot:		 	
	  end_loop:
	     mov cl,byte ptr [eax]
	     mov byte ptr [edi],cl	     
	     inc eax	     
	     inc edi
	     test cl,cl
	     jnz end_loop	     
	     dec edi
	     dec eax
	     ;
	     ; eax->null character in string 
	     ; edi->null character in destination string
	     ;
	  find_last_dot:
	     dec eax
		 dec edi
		 mov cl,byte ptr [eax]		 
		 cmp cl,'.'
		 jnz find_last_dot		 
		 ;
		 ; eax-> last '.' in exports
		 ; edi-> last '.' in temporary string
		 ;
		 mov byte ptr [edi],0
		 inc eax
		 lea edi,szTemp1 
		 ;
		 ; eax->API name or ordinal
		 ; edi->DLL name
		 ;		 		 		 
	  mov cl,byte ptr [eax]
	  cmp cl,'#'
	  jnz IsNamedForwarder	  	  
	  inc eax
	  push eax
	  call AsciiDecimalToDword	  
    IsNamedForwarder:	
	  mov esi,eax	  
	ImportIt:			
	  push edi
	  call g_pGetModuleHandleA[ebx]
	  test eax,eax
	  jz GotMod	
	  push edi
	  call LoadLibraryAHook	
	GotMod:
	  ; eax=module
	  test eax,eax
	  jz NotFound
	  
	  push 0
	  push esi
	  push eax
	  call GetProcAddressWithHintHook	  		  	  			
		
	NotForwarder:
	; eax= api address
		ret
	
	;--------------------------------------------------------------
	;
	; ImportByHint  (index into Name Pointer Table)
	;
	;  Hint in eax	
	;
 ImportByHint:   
	mov edi,([esi]+ExportDirectory.AddressOfNameOrdinals)
	add edi,hModule
	
	;shl eax,1
	;xor ecx,ecx
	;mov cx,[edi+eax]	
	movzx ecx,word ptr [edi+eax*2]		;; jibz suggestion 8-2-4	
	mov edx,([esi]+ExportDirectory.Base)
	add ecx, edx	
		
	jmp ImportByOrdinal
	
	;-------------------------------------------------------------
	;
	; Begin Import by name
	;	
  ImportByName:
  	
	;
	; do binary search using hint as initial mid
	;
	mov edi,([esi]+ExportDirectory.AddressOfNames)
	add edi,hModule
	
	; edi->Names Array
	; ecx=current index
	; 
	mov nStartIndex,0
	mov edx,([esi]+ExportDirectory.NumberOfNames)
	dec edx
	; edx holds end index
	
	xor eax,eax
	add eax,nHint	
	jz BinarySearch 
	cmp edx,eax
	jb BinarySearch  ;; hint out of bounds, ignore it
	
	;
	; hint is available so use it as initial mid
	;					
	mov ecx,eax
	jmp StartBinarySearchWithHint
	
  	BinarySearch:  		  		
  		mov ecx,edx
  		mov eax,nStartIndex
  		; ecx=last
  		; eax=first  		
  		cmp eax,ecx
  		jg NotFound
  		add ecx,eax  	    		
  		shr ecx,1  	 ; /2	
  		;ecx=mid ...
	 StartBinarySearchWithHint:  		
  		
  		mov eax,[edi+(ecx*4)]
		add eax,hModule
		
		push ecx
		push edx
		push edi
		push esi
		
		mov edi,pszApi
		mov esi,eax
		MYSTRCMP
		
		pop esi
		pop edi
		pop edx
		pop ecx
				
		;
		; if eax > 0 .. then current api > sought api
		; if eax < 0 ... then current api < sought api
		; 
		
		cmp eax,0
		jz FoundMatch	
		jg GreaterThan		
		;
		; LessThan
		;  - discard lower half
		inc ecx
		mov nStartIndex,ecx		;; update start ptr
		jmp BinarySearch
		
		GreaterThan:
		dec ecx		
		mov edx,ecx				;; update end ptr
		jmp BinarySearch			
		
 	FoundMatch:
 		;
		; ecx=index into names/ordinals array
		;
		mov eax,ecx
		jmp ImportByHint		
			
	NotFound:
	xor eax,eax	
	ret
GetProcAddressWithHintHook endp

; DWORD AsciiDecimalToDword(char *string);
AsciiDecimalToDword proc uses ebx edi esi src:DWORD	
	mov	esi,src
	xor	eax,eax	
	xor	ebx,ebx	
asz_loop:
	mov	bl,byte ptr [esi]
	inc	esi	
	or	bl,bl
	jz	end_as
	and ebx,0fh	
	imul eax,10
	add	eax,ebx
next_as_iter:
	jmp	asz_loop
end_as:	
	ret		
AsciiDecimalToDword endp

TranslateAPIAddressToHookAddress proc uses ebx edi esi pAPIAddress:DWORD
	GET_DELTA ebx
	push pAPIAddress
	call g_pTranslate[ebx]	
	ret
TranslateAPIAddressToHookAddress endp

HookDataEnd:
END
