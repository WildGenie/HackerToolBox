;########################################################################################
; Name		: ASProtect trial keys cleaner
; Version	: 2.0
; Author	: PE_Kill
;########################################################################################
.486
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\advapi32.inc
include \masm32\include\comctl32.inc
include include\msvcrt.inc

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\advapi32.lib
includelib \masm32\lib\comctl32.lib
includelib include\msvcrt.lib

;################################## PROTOTYPES ##########################################

;-- WINDOWS -----------------------------------------------------------------------------
DlgProc 		PROTO :DWORD,:DWORD,:DWORD,:DWORD
DlgProcA 		PROTO :DWORD,:DWORD,:DWORD,:DWORD
AddLog 			PROTO :DWORD
;-- REGISTRY ----------------------------------------------------------------------------
EnumSubKeys		PROTO :DWORD, :DWORD
RegDelAllKeys	PROTO :DWORD, :DWORD
CheckKey 		PROTO :DWORD, :DWORD
IsTypeLib 		PROTO :DWORD, :DWORD
GetSubKeysCount PROTO :DWORD
ReadKeyValue	PROTO :DWORD, :DWORD
;-- OTHER -------------------------------------------------------------------------------
GetStrLen		PROTO :DWORD
AC_ConvertKey	PROTO :DWORD, :DWORD
DelASPrKeys		PROTO

;##################################### CONST ###########################################
.CONST
;-- size of code :) --------------------------------------------------------------------
  D                         EQU DWORD PTR
  W                         EQU WORD PTR
  B                         EQU BYTE PTR
;-- MAIN DLG ---------------------------------------------------------------------------
  BTN_OPEN       			EQU 3001
  BTN_FIND		   			EQU 3002
  BTN_ABOUT       			EQU 3004
  EDT_LOG					EQU 4001
;-- ABOUT DLG --------------------------------------------------------------------------
  BTN_A_OK					EQU 1003

;###################################### DATA ###########################################
.DATA
;-- WINDOWS ----------------------------------------------------------------------------
  szCaption					DB "ASProtect trial keys cleaner. Version 2.0 - Public",0
  szDlgName 				DB "DLG_MAIN",0
  szDlgAbout				DB "DLG_ABOUT",0
  szIcon					DB "MAIN",0
;-- CMD LINE ---------------------------------------------------------------------------
  szNoGUI					DB "/NOGUI",0
;-- REGISTRY ---------------------------------------------------------------------------
 szSpecData						DB "Software\ASProtect\SpecData",0
 szCLSID						DB "CLSID",0
 szCLSIDSub						DB "CLSID\\",0
								DB 100h DUP (0)
 szTypeLib						DB "TypeLib",0
 szClass						DB "TypeLib\\" ,0
 								DB 100 DUP (0)
;-- FOR LOG ----------------------------------------------------------------------------
 szLogFakeCLSID					DB "Fake CLSID: %s ",13,10,0  
 szLogFakeTypeLib				DB "Fake TypeLib: %s ",13,10,0
 szStart						DB "Start...",13,10,0
 szFinish						DB "Finish!",13,10,0
 
;###################################### BSS #############################################

.DATA?
  hInstance 				HINSTANCE 	?
  hWndMain					HWND		?
  hWndLog					HWND		?
  szLogStr					DB 255		DUP (?)
  hBTN_FIND					DD ?
  hProgress					DD ?
  dwDummy					DD ? 
  
  KeyHash						DB 10h DUP(?)
  szCurrentKey					DB 100h DUP(?)
  szKeyValue					DB 27h DUP(?)
  pLabels						DD ?   
  dwKeysCount					DD ?
  
  arg_array                 DD ?
  arg_count                 DD ?
  envp                      DD ?
;########################################################################################
; 										CODE
;########################################################################################  
.CODE
MAIN:
    invoke __getmainargs, ADDR arg_count, ADDR arg_array, ADDR envp, FALSE, ADDR dwDummy
    mov eax,D [arg_count]
    cmp eax,1
    je @F
    mov eax,D [arg_array]
    push offset szNoGUI
    push D [eax+4]
    call lstrcmpi
    or eax,eax
    jnz @F
    call DelASPrKeys
    jmp @exit
@@:
	invoke GetModuleHandle, NULL
	mov    hInstance,eax
	invoke DialogBoxParam, hInstance, ADDR szDlgName,NULL,ADDR DlgProc,NULL
@exit:	
	invoke ExitProcess,eax
	invoke InitCommonControls

ALIGN DWORD

DlgProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
	.if uMsg==WM_INITDIALOG
		invoke LoadIcon,hInstance,ADDR szIcon
		invoke SendMessage,hWnd,WM_SETICON,1,eax
		invoke SetWindowText,hWnd,ADDR szCaption
		push hWnd
		pop  hWndMain
		;-- save handle of Log Edit --
		invoke GetDlgItem,hWnd,EDT_LOG
		mov hWndLog,eax
		;-- save handle of progress --
		invoke GetDlgItem,hWnd,5555
		mov hProgress,eax
		;
		invoke GetDlgItem,hWnd,BTN_FIND
		mov hBTN_FIND,eax
	.elseif uMsg==WM_CLOSE
		invoke EndDialog, hWnd,NULL
	.elseif uMsg==WM_COMMAND
		mov eax,wParam
		.if lParam==0
		.else
			mov edx,wParam
			shr edx,16
			.if dx==BN_CLICKED
				.if ax==BTN_ABOUT
					invoke DialogBoxParam,hInstance,ADDR szDlgAbout, hWnd, ADDR DlgProcA,NULL
				.elseif ax==BTN_OPEN
					invoke PostMessage,hWnd,WM_CLOSE,0,0
				.elseif ax==BTN_FIND
				    invoke CreateThread,NULL,NULL,ADDR DelASPrKeys,NULL,NULL,ADDR dwDummy
				.endif	
			.endif
		.endif
	.else
		xor eax,eax
		jmp @ret_dlg
	.endif
	push 1
	pop eax
@ret_dlg:
  ret	
DlgProc endp

AddLog proc pStr:LPSTR
  invoke SendMessage,hWndLog,EM_GETLINECOUNT,0,0
  dec eax
  invoke SendMessage,hWndLog,EM_LINEINDEX,eax,0
  invoke SendMessage,hWndLog,EM_SETSEL,eax,eax
  invoke SendMessage,hWndLog,EM_REPLACESEL,FALSE,pStr
  ret
AddLog endp

DlgProcA proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
	.if uMsg==WM_INITDIALOG
	.elseif uMsg==WM_CLOSE
		invoke EndDialog, hWnd,NULL
	.elseif uMsg==WM_COMMAND
		mov eax,wParam
		.if lParam==0
		.else
			mov edx,wParam
			shr edx,16
			.if dx==BN_CLICKED
				.if ax==BTN_A_OK
					invoke PostMessage,hWnd,WM_CLOSE, 0, 0
				.endif	
			.endif
		.endif
	.else
		xor eax,eax
		jmp @ret_dlg
	.endif
	push 1
	pop eax
@ret_dlg:
  ret	
DlgProcA endp

include include\ASProtectCrypto.inc

;-- MAIN PROC ------------------------------------------------------------------------
DelASPrKeys proc
  local hKey			 : DWORD
  local dwValuesCount	 : DWORD
  local dwValLen		 : DWORD
  local dwValType		 : DWORD
  invoke EnableWindow,hBTN_FIND,FALSE
  invoke SetWindowText,hWndLog,ADDR szStart
;-- FOR PROGRESS BAR  
  push -1
  pop dwKeysCount
;-- Open ASProtect key
  invoke RegOpenKeyEx,HKEY_CURRENT_USER,ADDR szSpecData,NULL,KEY_READ,ADDR hKey
  test eax,eax
  jnz @end
;-- Get hashes count  
  invoke RegQueryInfoKey,hKey,NULL,NULL,NULL,NULL,NULL,NULL,ADDR dwValuesCount,	NULL,NULL,NULL,NULL
  mov esi,dwValuesCount
  cmp esi,1
  jbe @reg_close
;-- Allocate memory for hashes  
  lea eax,[esi*8]
  invoke GlobalAlloc,GPTR,eax
  test eax,eax
  jz @reg_close
  mov pLabels,eax
  xchg edi,eax
  xor ebx,ebx  
@read_values:  	
  push 17
  pop dwValLen
  xor eax,eax
  mov dwValType,eax
  mov B [szCurrentKey],al
  invoke RegEnumValue,hKey,ebx,ADDR szCurrentKey,ADDR dwValLen,NULL,ADDR dwValType,NULL,NULL
;-- Verify hash  
  cmp dwValType,REG_BINARY
  jne @next_value
  invoke GetStrLen,ADDR szCurrentKey
  cmp eax,16
  jne @next_value
;-- Convert hash and save to memory  
  push esi
  mov esi,offset szCurrentKey
  xor ecx,ecx
  mov cl,4
  call AC_StrToHexRev
  add esi,8
  add edi,4
  mov cl,4
  call AC_StrToHexRev
  add edi,4
  pop esi
@next_value:
  inc ebx
  dec esi
  jnz @read_values
;-- Make list of CLSIDs and verify it!  
  invoke EnumSubKeys,ADDR szCLSID,ADDR CheckKey
  invoke GlobalFree,pLabels  
@reg_close:
  invoke RegCloseKey,hKey
;-- Delete ASProtect key
  invoke RegDelAllKeys,HKEY_CURRENT_USER,ADDR szSpecData
@end:
  invoke AddLog,ADDR szFinish
  invoke EnableWindow,hBTN_FIND,TRUE
  ret  
DelASPrKeys endp

;-- Check CLSID key
CheckKey proc uses ebx esi edi, hKey:DWORD, lpKey:LPSTR
  invoke SendMessage,hProgress,PBM_STEPIT,0,0
  xor ebx,ebx
  invoke lstrcpy,ADDR szCLSIDSub+06,lpKey
;-- Some check params  
  invoke GetSubKeysCount,ADDR szCLSIDSub
  cmp eax,03h
  jbe @end
  cmp eax,0Ah
  jnb @end
;-- Find subkey "TypeLib"  
  invoke EnumSubKeys,ADDR szCLSIDSub,ADDR IsTypeLib
  test al,al
  jz @end ; not found? Go on...
;-- Restore CLSID key string  
  invoke GetStrLen,ADDR szCLSIDSub
  lea edi,[eax+offset szCLSIDSub]
  mov W [edi],005Ch
;-- Read value of subkey "TypeLib"  
  invoke lstrcat,ADDR szCLSIDSub,ADDR szTypeLib
  mov esi,offset szKeyValue
  invoke ReadKeyValue,ADDR szCLSIDSub,esi
  test al,al
  jz @end
;-- Some check  
  cmp B [esi],00
  je @end
  cmp B [esi],"{"
  jne @end
  xor al,al
  stosb
;-- Make hash of TypeLib value  
  mov edi,offset KeyHash
  invoke AC_ConvertKey,esi,edi
  mov esi,offset szCLSIDSub
  invoke GetStrLen, esi
  push eax
  mov eax,edi
  mov ecx,esi
  mov edx,10h
  call AC_GenerateHash
  mov ecx,pLabels
  sub ecx,4
;-- Find hash in saved hashes  
@@:
  add ecx,4
  cmp D [ecx],0
  je @end
  mov eax,[ecx]
  add ecx,4
  cmp eax,[edi]
  jne @B
  mov eax,[ecx]
  cmp eax,[edi+04]
  jne @B
;-- Kill hash in array
  lea edi,[ecx-4]
@@:  
  cmp D [edi],0
  je @F
  xor eax,eax
  push 8
  pop ecx
  rep stosb
  sub edi,8
  push D [edi+8]
  pop D [edi]
  push D [edi+8+4]
  pop D [edi+4]
  add edi,8
  jmp @B
@@:  
  mov edi,pLabels
  cmp D [edi],0
  jne @F
  inc ebx
  invoke SendMessage,hProgress,PBM_SETPOS,dwKeysCount,0
@@:  
;-- Add key to log and kill in registry
  invoke wsprintf,ADDR szLogStr,ADDR szLogFakeTypeLib,ADDR szKeyValue
  invoke AddLog,ADDR szLogStr
  invoke lstrcpy,ADDR szClass+8,ADDR szKeyValue
  invoke RegDelAllKeys,HKEY_CLASSES_ROOT,ADDR szClass
  invoke wsprintf,ADDR szLogStr,ADDR szLogFakeCLSID,ADDR szCLSIDSub+6
  invoke AddLog,ADDR szLogStr
  invoke RegDelAllKeys,hKey,ADDR szCLSIDSub+6
@end:
  xchg eax,ebx
  ret
CheckKey endp

;-- lpKey is "TypeLib" string?
IsTypeLib proc uses esi edi, hKey:DWORD, lpKey:LPSTR
  invoke GetStrLen,lpKey
  mov ecx,eax
  inc ecx
  .if eax==7
    mov esi,offset szTypeLib
    mov edi,lpKey
    repe cmpsb
  .endif
  test ecx,ecx
  sete al
  ret
IsTypeLib endp

;-- Read value of TypeLib
ReadKeyValue proc uses ebx, lpKey:LPSTR, lpBuf:LPSTR
  local hKey 		:DWORD
  local dwValueType	:DWORD
  local dwBufSize	:DWORD
  local szValueName[255]
  xor ebx,ebx
  invoke RegOpenKeyEx,HKEY_CLASSES_ROOT,lpKey,NULL,KEY_READ,ADDR hKey
  test eax,eax
  jnz @end
  xor eax,eax
  mov dwValueType,eax
  mov dwBufSize,eax
  mov B szValueName[0],al
  invoke RegQueryValueEx,hKey,ADDR szValueName,NULL,ADDR dwValueType,NULL,ADDR dwBufSize
  test eax,eax
  jnz @reg_close
  mov eax,dwValueType
  dec eax
  sub eax,2
  jnb @reg_close
  cmp dwBufSize,27h
  jne @reg_close
  invoke RegQueryValueEx,hKey,ADDR szValueName,NULL,ADDR dwValueType,lpBuf,ADDR dwBufSize
  inc ebx
@reg_close:
  invoke RegCloseKey,hKey
@end:
  xchg eax,ebx
  ret  
ReadKeyValue endp

GetSubKeysCount proc lpKey:LPSTR
  local hKey		: DWORD
  local dwSubKeys	: DWORD
  mov dwSubKeys,0
  invoke RegOpenKeyEx,HKEY_CLASSES_ROOT,lpKey,NULL,KEY_READ,ADDR hKey
  test eax,eax
  jnz @F
  invoke RegQueryInfoKey,hKey,NULL,NULL,NULL,ADDR dwSubKeys,NULL,NULL,NULL,NULL,NULL,NULL,NULL
  invoke RegCloseKey,hKey
@@:
  mov eax,dwSubKeys
  ret  
GetSubKeysCount endp

;-- Delete key whith sub keys
RegDelAllKeys proc uses ebx, hKey:DWORD, pKeySub:LPSTR
  local hCurrentKey: DWORD
  local szSubKeyName[MAX_PATH]
;------------------------------  
  xor ebx,ebx
  invoke RegOpenKey,hKey,pKeySub,ADDR hCurrentKey
  cmp eax,ERROR_SUCCESS
  jne @ret
@@:  
  invoke RegEnumKey,hCurrentKey, 0, ADDR szSubKeyName, MAX_PATH
  cmp eax, ERROR_NO_MORE_ITEMS
  je @F
  invoke RegDelAllKeys,hCurrentKey,ADDR szSubKeyName
  cmp al,TRUE
  je @B
@@:
  invoke RegCloseKey,hCurrentKey
  invoke RegDeleteKey,hKey,pKeySub
  cmp eax,ERROR_SUCCESS
  jne @ret
  inc ebx
@ret:
  xchg eax,ebx  
  ret
RegDelAllKeys endp

EnumSubKeys proc uses ebx esi edi, lpKey:LPSTR, pCALLBACK:DWORD
; variables -------------------
 local hKey 			: DWORD
 local dwSubKeys  		: DWORD
 local dwMaxSubKeyLen	: DWORD
 local dwKeyLen			: DWORD
;------------------------------
  xor esi,esi
  invoke RegOpenKeyEx,HKEY_CLASSES_ROOT,lpKey,NULL,KEY_READ,ADDR hKey
  test eax,eax
  jnz @end
  invoke RegQueryInfoKey,hKey,NULL,NULL,NULL,ADDR dwSubKeys,\
  		 	ADDR dwMaxSubKeyLen,NULL,NULL,NULL,NULL,NULL,NULL
  test eax,eax
  jnz @reg_close
  mov eax,dwSubKeys
  cmp eax,1
  jbe @reg_close
;-- INIT PROGRESS BAR --  
  .if dwKeysCount==0FFFFFFFFh
    mov dwKeysCount,eax
  	shl eax,16
  	invoke SendMessage,hProgress,PBM_SETRANGE,0,eax
  	invoke SendMessage,hProgress,PBM_SETSTEP,1,0    
  .endif    
  mov edi,dwMaxSubKeyLen
  inc edi
  xor ebx,ebx
  mov esi,dwSubKeys
@@:  
  mov dwKeyLen,edi
  invoke RegEnumKeyEx,hKey,ebx,ADDR szCurrentKey,ADDR dwKeyLen,NULL,NULL,NULL,NULL
  push offset szCurrentKey
  push hKey
  call pCALLBACK
  test al,al
  jnz @reg_close
  inc ebx
  dec esi
  jnz @B
@reg_close:
  invoke RegCloseKey,hKey
@end:  
  test esi,esi
  setne al
  ret  
EnumSubKeys endp

GetStrLen proc pStr:LPSTR
  mov edx,edi
  mov edi,pStr
  or ecx,-1
  xor al,al
  repne scasb
  push -2
  pop eax
  sub eax,ecx
  mov edi,edx
  ret
GetStrLen endp

END MAIN