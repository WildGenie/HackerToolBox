
option casemap:none 
.486p
.model flat,stdcall

public Decode_Small
public GetDecodeSmallFuncSize

Decode_Small PROTO :DWORD, :DWORD, :DWORD
GetDecodeSmallFuncSize PROTO

include Codec_0_EntryPoints.inc
.data
db 'Codec0',0

.code
;-----------------------------------------------------------------------------------
; DecodeSmall  (DecodeFast's smaller but slower brother)
;
; The DecodeSmall function must be self-contained in a 
; contiguous memory block between the labels _DecodeSmall
; and _DecodeSmall_e. Static data references need a delta
; offset applied. References outside this data block will
; fail. 
;
; API Calls: 
;  API calls through the CODEC Host Module's imports will
;  crash quite well. You must instead import any needed
;  APIs with the supplied LoadLibrary/GetProcAddress pointers
;  in the lpvExtra parameter's data structure).
;
; Static Data:
;  strings and other data can be included as long as it
;  is within the bounds of the block below. You should
;  not switch to a data section (i.e. .data), else the
;  data will be moved to another area and the contiguous
;  memory block will be no more. You must calculate
;  a delta offet when referencing it though. 
;
; Variables:
;  You should use local variables instead of global unless there
;  is a compelling reason not to.
; 
;
_DecodeSmall:
;------start DecodeSmall code/data block-----
Decode_Small proc stdcall uses ebx edi esi lpvSource:DWORD, lpvDest:DWORD, lpvExtra:DWORD	
	;LOCAL dwLocalVariable:DWORD	; sample local variable
	LOCAL pLoadLibraryA:DWORD
	LOCAL pGetProcAddress:DWORD
	LOCAL pMessageBoxA:DWORD
	LOCAL hUser32:DWORD	
	
	;
	; - sample reference of static data /w delta offst
	; - GET_DELTA is a macro that uses call/pop/sub method of delta offset calculation
	;
	GET_DELTA ebx					; put delta offset in ebx  	
	;lea eax,szSampleString[ebx]    ; eax->sample string
	;
	
	;
	; Sample code to invoke WIN32 APIs
	;
	
	;
	; first let's get the loadlibrary and getprocaddress addresses
	;
	mov esi,lpvExtra
	mov eax,[esi+PEC2_DECODE_EXTRA.pLoadLibraryA]
	mov pLoadLibraryA,eax
	mov eax,[esi+PEC2_DECODE_EXTRA.pGetProcAddress]
	mov pGetProcAddress,eax
		
	;
	; now import MessageBoxA
	; (delta offset in ebx already, see above)
	;
	lea eax,szUser32[ebx]
	push eax
	call pLoadLibraryA
	test eax,eax
	jz error_skip
	mov hUser32,eax
	
	lea ecx,szMessageBoxA[ebx]
	push ecx
	push hUser32
	call pGetProcAddress
	test eax,eax
	jz error_skip
	mov pMessageBoxA,eax
	
	push 0   ; flags
	lea eax,szSampleCaption[ebx]
	push eax
	lea eax,szSampleText[ebx]
	push eax
	push 0    ; hwnd parent
	call pMessageBoxA
		
	;
	; todo: we might want to do some cleanup, like calling FreeLibrary..but for kernel32 and user32 this usually isn't important
	;		
	
	jmp shown_mbox
	
error_skip:
	;
	; todo: if an error, handle it here	
	;
	
shown_mbox:	

	mov esi,lpvSource
	cmp ([esi]+CODEC_0_HEADER.dwSignature),CODEC_0_SIGNATURE
	jnz _ret_error
	
	mov edi,lpvDest
	mov ecx,([esi]+CODEC_0_HEADER.dwDecodedSize)
	add esi,size CODEC_0_HEADER
	
	push ecx  ; save for return value
	
	; fast movs (dwords then remaining bytes)
	mov eax,ecx
	sar	ecx,2
    rep	movsd
    add	ecx,eax
    and	ecx,3
    rep	movsb		
    
    pop eax		; eax=decoded size
	ret	

  _ret_error:
	xor	eax,eax	
  	ret
Decode_Small endp

szUser32 db 'user32.dll',0 
szMessageBoxA db 'MessageBoxA',0
szSampleText db 'This is a sample MessageBox call',0
szSampleCaption db 'This is a caption',0
szSampleString db 'SampleString-Reference me with a delta offset sice this block is extracted and relocated.',0

;------end DecodeSmall code/data block-----
_DecodeSmall_e:

;-----------------------------------------------------------------------------------
; GetDecodeSmallFuncSize
;
; Simply returns the size of the DecodeSmall code/data block above.
; There is no hard limit up to the 32-bit space boundary on the size 
; the DecodeSmall function.
;
GetDecodeSmallFuncSize proc stdcall
	mov eax,offset _DecodeSmall_e-offset _DecodeSmall
	ret
GetDecodeSmallFuncSize endp

END