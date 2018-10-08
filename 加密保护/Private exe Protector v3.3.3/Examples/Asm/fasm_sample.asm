
; fasm sample

include 'include\win32ax.inc'
include '..\..\Markers SDK\Asm\asm_include.inc'


.code

  start:

	begin_hide

	; do we have a key?
	invoke	GetProcAddress, 0,0
	cmp eax, 0

	end_hide

	je no_key
	; we have a key
	begin_key
	 invoke  GetProcAddress, 0,1
	 invoke  MessageBox,HWND_DESKTOP,eax,"Registered to",MB_OK
	 invoke  ExitProcess,0
	end_key

      no_key:
	; get licenseid for registration
	begin_vm
	 invoke  GetProcAddress, 0,3
	 cmp eax, 0 ; no protection?
	end_vm
	je no_protection
	invoke	MessageBox,HWND_DESKTOP,eax,"LicenseID",MB_OK
	invoke	ExitProcess,0

     no_protection:
       begin_morph
	invoke	MessageBox,HWND_DESKTOP,"File not protected!","Information",MB_OK
	invoke	ExitProcess,0
       end_morph


.end start
