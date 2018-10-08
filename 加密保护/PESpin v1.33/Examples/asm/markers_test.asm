COMMENT #
;************************************************************************************************
;This example shows a way how use:
	- CLEAR_START, CLEAR_END
	- CRYPT_START, CRYPT_END
	in your application
;************************************************************************************************	
#
;************************************************************************************************
;                             			MODEL
;************************************************************************************************
.586p
.model flat,stdcall

;************************************************************************************************
;                             		      INCLUDES
;************************************************************************************************

include c:\masm32\include\windows.inc

include c:\masm32\include\user32.inc
include c:\masm32\include\kernel32.inc
include c:\masm32\include\comctl32.inc
include c:\masm32\include\gdi32.inc 

includelib c:\masm32\lib\comctl32.lib
includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Gdi32.lib

include	..\pespin.inc

DlgProc		PROTO :DWORD,:DWORD,:DWORD,:DWORD
assume		fs:flat

;************************************************************************************************
;						CONST
;************************************************************************************************
.const        
        IDC_PASSWORD	equ 1000
        IDC_CHECK	equ 1001
        IDC_EXIT	equ 1002
       	ID_ICON 	equ 666 	


;************************************************************************************************
;                             			DATA?
;************************************************************************************************	
.data

	dlgname         db "MARKERS",0
	MutexName	db "Markers_test",0
	szGood		db "Good!",0,0
	szBad		db "Wrong!, try password:PESpin"
;************************************************************************************************
;						DATA
;************************************************************************************************      
.data?

	hInstance	dd ?      	; handler      
	szPassword	db 7   dup(?)
	
;************************************************************************************************
;						CODE
;************************************************************************************************  
.code
start:
	
        sub	eax,eax
	push	offset MutexName
	push	eax
	push	eax
	call	CreateMutexA
	call	GetLastError
	cmp	eax,ERROR_ALREADY_EXISTS
	jz	@end
	
	;this code will decrypted before using and after use removed
	;tip: This type of blocks is very good use in initialize part of program
	;(load DLL(s), initialize data, fill some special variables and etc.)
	
	CLEAR_START
	invoke	GetModuleHandle, NULL
	mov	hInstance, eax
	invoke	DialogBoxParam,hInstance,offset dlgname,0,offset DlgProc,0
	CLEAR_END
@end:	
	invoke	ExitProcess,0


;************************************************************************************************
;                         		DIALOG PROC
;************************************************************************************************
DlgProc proc STDCALL uses ebx edi esi, hWnd:DWORD, wmsg:DWORD, _wparam:DWORD, _lparam:DWORD

	movzx	eax,word ptr [wmsg]
	cmp	ax,WM_COMMAND
	je	_wmcommand
	cmp	ax,WM_INITDIALOG
	je	_initdlg
	cmp	ax,WM_DESTROY
	je	_wmdestroy
	cmp	ax,WM_CLOSE
	je	_wmdestroy
      
     	sub	eax,eax
	ret				
	
_wmcommand:

	cmp	word ptr[_wparam],IDC_CHECK 
	je	_check

        cmp	word ptr[_wparam],IDC_EXIT
	je	_wmdestroy
	sub	eax,eax
	ret

_initdlg:

	CLEAR_START
	
	invoke	LoadIcon,hInstance,ID_ICON 	       
        invoke	SendMessage,hWnd,WM_SETICON,0,eax       
	sub	eax,eax
	
	CLEAR_END
   	ret

_wmdestroy:
	push	0			
	push	hWnd			
	call	EndDialog		
	ret			

_check:
  	CRYPT_START
	invoke	SendDlgItemMessageA,hWnd,IDC_PASSWORD,WM_GETTEXT,7,offset szPassword  ; get serial
	cmp	al,6
	CRYPT_END		;[i]CRYPT_END must be before jump, because You will skip end of encrypted block!
	jnz	@bad_password
	
	CRYPT_START
	lea	esi,szPassword
	sub	ebx,ebx
	mov	eax,dword ptr[esi]
	mov	bx,word ptr[esi+4]
	push	255
	pop	ecx
@mix:
	inc	eax
	dec	ebx
	rol	ebx,16
	xor	eax,ebx
	shr	eax,1
	xor	eax,'test'
	sub	ebx,eax
	
	loop	@mix
	add	eax,ebx
	CRYPT_END
	
	cmp	eax,0FD4B82Ah
	jnz	@bad_password
	cmp	ebx,0A70C6EFDh
	jnz	@bad_password
	
	
	CRYPT_START
	lea	eax,szGood
	invoke	SendDlgItemMessageA,hWnd,IDC_PASSWORD,WM_SETTEXT,0,eax ; ustaw text
	CRYPT_END
	ret		;[i]CRYPT_END must be before jump, because You will skip end of encrypted block!
	
@bad_password:                
	invoke MessageBoxA,0,offset szBad,offset dlgname,MB_OK or MB_ICONINFORMATION
	ret 

DlgProc endp

end start