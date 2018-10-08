include 'include\win32ax.inc'
include 'Zprotect_SDK.inc'

.data
 msg	 db "This is an Example program for Zprotect...!",0
 caption db "FASM Example", 0

.code

  start:
	ZProtect_VM_START
	 invoke  MessageBox, HWND_DESKTOP, msg, caption, MB_OK
	ZProtect_VM_END

	 invoke  ExitProcess,0

.end start