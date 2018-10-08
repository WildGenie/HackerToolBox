
;	Zprotect DEMO for Masm By Anskya

.386
.model flat, stdcall
option casemap :none

;=================================================
include \masm32\include\windows.inc

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\gdi32.inc
include	\masm32\include\comctl32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\comctl32.lib
;=================================================

include ZProtect_SDK.inc ; include this file to use Zprotect SDK in MASM applications

BUTTON_Check	equ	101
EDIT_PassWord	equ	102

.data?
	g_hInstance			dd	?
	g_hCursor			dd	?
	
	g_hBtn_Check		dd	?
	g_hEdit_PassWord	dd	?
	
	g_hStatic_Input		dd	?
	g_hStatic_ABout		dd	?

.data
	szClassName		db	'WindowClass_0', 0
	szWindowName	db	'Zprotect DEMO for Masm', 0
	szFaceName		db	'Verdana', 0
	szButton_Class	db	'BUTTON', 0
	szEdit_Class	db	'EDIT', 0
	szStatic_Class	db	'STATIC', 0
	
	szBtn_Check		db	'Check', 0	
	szInputText		db	'Input password:', 0

	szAboutText		db	'!! This demo only shows how to use Zprotect VM Marker in MASM !!', 0
	
	szPassWord		db	'Zprotect', 0
	
	szMsgText		db	'Zprotect VM Demo', 0
	szSuccessMsg	db	'Great! You have input a right password!', 0
	szErrorMsg		db	'Sorry! You input a wrong password, please try again!', 0
	
.code

xstrcmp proc uses esi edi lpStr1, lpStr2

	mov		ecx, lpStr1
	mov		edx, lpStr2
	xor		esi, esi

cmst:
	mov		al, [ecx+esi]
	cmp		al, [edx+esi]
	jne		no_match
	inc		esi
	test	al, al         ; check for terminator
	jne		cmst

	sub		eax, eax
	inc		eax
	jmp		cmpout

no_match:
	xor		eax, eax        ; return zero on no match

cmpout:
	ret

xstrcmp endp

WndProc proc hwnd, message, wParam, lParam
	local	@szBuffer[MAX_PATH]:BYTE
	
	mov		eax, message
	.if		eax == WM_CREATE
		invoke	CreateFont, 0FFFFFFF5h, 0, 0, 0, FW_NORMAL, FALSE, FALSE,\
					FALSE, DEFAULT_CHARSET, 0, 0, 0, 0, offset szFaceName
		mov		[wParam], eax
		
		;	Create Button
		invoke	CreateWindowEx, 0, offset szButton_Class,\
					offset szBtn_Check,\
					WS_CHILD or WS_VISIBLE,\
					360, 40, 70, 20,\
					hwnd,\
					BUTTON_Check,\
					[g_hInstance],\
					NULL
		mov		[g_hBtn_Check], eax
		invoke	SendMessage, eax, WM_SETFONT, [wParam], 0
		
		;	Create Static
		invoke	CreateWindowEx, 0, offset szStatic_Class,\
					offset szInputText,\
					WS_CHILD or WS_VISIBLE,\
					20, 20, 100, 20,\
					hwnd,\
					NULL,\
					[g_hInstance],\
					NULL
		invoke	SendMessage, eax, WM_SETFONT, [wParam], 0
		
		invoke	CreateWindowEx, 0, offset szStatic_Class,\
					offset szAboutText,\
					WS_CHILD or WS_VISIBLE,\
					20, 80, 420, 20,\
					hwnd,\
					NULL,\
					[g_hInstance],\
					NULL
		invoke	SendMessage, eax, WM_SETFONT, [wParam], 0
	
		;	Create Edit
		invoke	CreateWindowEx, 0, offset szEdit_Class,\
					NULL,\
					WS_CHILD or WS_VISIBLE or WS_BORDER,\
					20, 40, 330, 20,\
					hwnd,\
					0,\
					[g_hInstance],\
					NULL
		mov		[g_hEdit_PassWord], eax
		invoke	SendMessage, eax, WM_SETFONT, [wParam], 0
	
	.elseif eax == WM_NCHITTEST
		invoke	DefWindowProc, hwnd, message, wParam, lParam
		.if		eax == 1
				mov		eax, 2
		.endif
	
	.elseif eax == WM_COMMAND
		mov		eax, [wParam]
		.if		ax == BUTTON_Check
				
				invoke	GetWindowText, g_hEdit_PassWord, addr @szBuffer, MAX_PATH
				
				;	use Zprotect VM Marker
				ZProtect_VM_START
				invoke	xstrcmp, addr @szBuffer, offset szPassWord
				ZProtect_VM_END
				
				.if		(eax > 0)
						invoke	MessageBox, 0, offset szSuccessMsg, offset szMsgText, MB_OK
				.else
						invoke	MessageBox, 0, offset szErrorMsg, offset szMsgText, MB_OK
				.endif
		.endif
		
		
	.elseif eax == WM_CLOSE
		invoke	PostQuitMessage, 0
		mov		eax, 0
		
	.else
		invoke DefWindowProc, hwnd, message, wParam, lParam
	.endif

	ret
WndProc	endp

WinMain proc hInstance: DWORD, hPrevInstance:DWORD, lpCmdLine:DWORD, nCmdShow:DWORD	
	local	@stWCEx: WNDCLASSEX
	local	@hWnd: HWND
	local	@stMsg: MSG
		
	mov		[@stWCEx.cbSize], sizeof WNDCLASSEX
	mov		[@stWCEx.style], CS_HREDRAW or CS_VREDRAW
	mov		[@stWCEx.lpfnWndProc], offset WndProc
	mov		[@stWCEx.cbClsExtra], 0
	mov		[@stWCEx.cbWndExtra], 0
	push	[hInstance]
	pop		[@stWCEx.hInstance]
	mov		[@stWCEx.hbrBackground], COLOR_BTNSHADOW
	mov		[@stWCEx.lpszMenuName], NULL
	mov		[@stWCEx.lpszClassName], offset szClassName
	
	invoke	LoadIcon, [hInstance], 0
	mov		[@stWCEx.hIcon], eax
	mov		[@stWCEx.hIconSm], eax
	
	invoke	LoadCursor, 0, IDC_ARROW
	mov		[@stWCEx.hCursor], eax
	
	invoke	RegisterClassEx, addr @stWCEx
	invoke	CreateWindowEx, WS_OVERLAPPED,\
				offset szClassName,\
				offset szWindowName,\
				WS_CAPTION or WS_SYSMENU,\
				CW_USEDEFAULT,\
				CW_USEDEFAULT,\
				468,\
				140,\
				NULL,\
				NULL,\
				hInstance,\
				NULL
	mov		@hWnd, eax
	invoke	ShowWindow, @hWnd, SW_SHOWNORMAL
	invoke	UpdateWindow, @hWnd
	.while	TRUE
		invoke	GetMessage, addr @stMsg, NULL, 0, 0
		.break	.if eax	== 0
		invoke	TranslateMessage, addr @stMsg
		invoke	DispatchMessage, addr @stMsg
	.endw
	mov		eax, @stMsg.wParam
	ret

WinMain endp
    
strat:
	invoke	InitCommonControls
	invoke	GetModuleHandle, NULL
	mov		[g_hInstance], eax
	
	invoke	LoadCursor, [g_hInstance], 103
	mov		[g_hCursor], eax
	
	invoke	WinMain, [g_hInstance], 0, 0, 1
	
	invoke	ExitProcess, 0
	ret
	
end strat