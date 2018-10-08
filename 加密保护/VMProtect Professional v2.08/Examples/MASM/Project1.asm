; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

      .486                      ; create 32 bit code
      .model flat, stdcall      ; 32 bit memory model
      option casemap :none      ; case sensitive

      include \masm32\include\dialogs.inc
      include Project1.inc
      include VMProtectSDK.inc

      dlgproc PROTO :DWORD,:DWORD,:DWORD,:DWORD

      IDC_PASSWORD equ 101
      IDC_CHECKPASSWORD equ 102

    .code

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

start:

      mov hInstance, FUNC(GetModuleHandle,NULL)

      call main

      invoke ExitProcess,eax

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

main proc

    Dialog "VMProtect test [MASM]","MS Sans Serif",8, \     ; caption,font,pointsize
            WS_OVERLAPPED or WS_SYSMENU or DS_CENTER, \     ; style
            3, \                                            ; control count
            0,0,205,40, \                                   ; x y co-ordinates
            1024                                            ; memory buffer size

    DlgStatic "Password:",SS_LEFT,5,8,34,8,100
    DlgEdit   WS_TABSTOP or WS_BORDER,41,6,75,12,IDC_PASSWORD
    DlgButton "Check password",WS_TABSTOP or BS_DEFPUSHBUTTON,123,5,74,15,IDC_CHECKPASSWORD

    CallModalDialog hInstance,0,dlgproc,NULL

    ret

main endp

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

dlgproc proc hWin:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD

    local buffer[100]:BYTE

    invoke VMProtectBegin,SADD("Test marker")

    .if uMsg == WM_COMMAND
      .if wParam == IDC_CHECKPASSWORD
        invoke GetDlgItemText,hWin,IDC_PASSWORD,addr buffer,sizeof buffer
        invoke atodw, addr buffer
        cdq 
        mov ecx, 17
        idiv ecx 
        .if edx == 13 
          invoke VMProtectDecryptStringA,SADD("Correct password")
          invoke MessageBox,hWin,eax,SADD("Information"),MB_ICONINFORMATION or MB_OK
        .else
          invoke VMProtectDecryptStringA,SADD("Incorrect password")
          invoke MessageBox,hWin,eax,SADD("Error"),MB_ICONERROR or MB_OK
          invoke GetDlgItem,hWin,IDC_PASSWORD 
   	  invoke SetFocus,eax
        .endif 
      .endif

    .elseif uMsg == WM_CLOSE
      invoke EndDialog,hWin,0

    .endif

    xor eax, eax

    invoke VMProtectEnd

    ret

dlgproc endp

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                  	
end start
