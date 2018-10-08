.386
.model flat,stdcall
option casemap:none

include	HelloWorld.Inc


.code


DllEntry proc hInst:HINSTANCE, reason:DWORD, reserved1:DWORD

	push	hInst
	pop		hInstance
	mov		eax,TRUE
	ret

DllEntry Endp


LoadPlugin proc 

	mov		eax, offset PluginName ; return Name of the plugin
	ret

LoadPlugin endp


ExecutePlugin proc hWnd:HWND, WindowHandle:HWND

	invoke	MessageBox, hWnd, addr PluginMsg, addr PluginName, MB_ICONINFORMATION
	ret

ExecutePlugin endp


End DllEntry
