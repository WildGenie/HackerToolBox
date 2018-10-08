;@goto end

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

.486
.model flat, stdcall
option casemap :none

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

    include     windows.inc
    include     my.mac
    include_    user32
    include_    GDI32
    include_    comdlg32
    include_    kernel32
;   include     Res_Rebuild_Engine.inc
    ;include_    \usasm\usr\MyLib\MyLib
    include_    <\usasm\usr\PE_Tools\yzPELib\lib\yzpelib>

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

    WndProc     proto :DWORD,:DWORD,:DWORD,:DWORD
    DlgProc     proto :DWORD,:DWORD,:DWORD,:DWORD
    CopyMemory  proto :DWORD,:DWORD,:DWORD
    DrawButton  proto :DWORD
    Unpack      proto :DWORD,:DWORD

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

.const
    IDC_STATIC      equ -1
    ID_BUTTON1_1    equ 401

    ID_EDIT1        equ 101
    ID_EDIT2        equ 102

    ID_CBUTTON1     equ 201
    ID_CBUTTON2     equ 202

    ID_BUTTON1      equ 301
    ID_BUTTON2      equ 302
    ID_BUTTON3      equ 303

    IDC_ABOUT       equ 1000
    IDB_LOGO        equ 501
    IDC_STATIC1     equ 2002


;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

.data?
    hWnd            dd ?

    hEdit1          dd ?
    hEdit2          dd ?

    hButn1          dd ?
    hButn2          dd ?
    hButn3          dd ?

    hCButn1         dd ?
    hCButn2         dd ?

    hInstance       dd ?
    hIcon           dd ?

    szEDIT1         db 1024 dup (?)
    szEDIT2         db 1024 dup (?)

    szBuffer        db 1024 dup (?)

    ofn             OPENFILENAME <>

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

.data
    szFilter        db "Packed PE Files (*.exe, *.dll)",0
    szDefExt        db "*.exe;*.dll",0
                    db "All Files (*.*)",0,"*.*",0,0

    szAbout1        db "Please Choose the Input File",0
    szAbout2        db "Please Choose the Output File",0

    szButton1       db "[ Unpack ]",0
    szButton2       db "[ Exit ]",0
    szButton3       db "[ About ]",0
    szButton4       db "[ OK ]",0
    szButton5       db "[ ... ]",0

    dlgname         db "DIALOG",0
    statClass       db "STATIC",0

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

.code
start:
    xor     ebx,ebx
    invoke  GetModuleHandle,ebx
    mov     hInstance,eax
    invoke  DialogBoxParam,hInstance,ADDR dlgname,ebx,ADDR WndProc,ebx
    invoke  ExitProcess,eax

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

    include unpacker.inc

    @UnknownError:
    scall   ShowError,$CT0("Unknown Error"),eax,GetOutaHere1

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

WndProc proc hWin:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
local Lon:DWORD
local hBrush:DWORD
local rect_:RECT
local LogBrush:LOGBRUSH

    pusha
    mov     eax,uMsg
    .if eax == WM_INITDIALOG
        mov     eax, hWin
        mov     hWnd, eax
        invoke  SendMessage,hWin,WM_SETTEXT,0,ADDR dlgTitle
        invoke  LoadIcon,hInstance,200
        mov     hIcon, eax
        invoke  SendMessage,hWin,WM_SETICON,1,hIcon

        invoke  GetDlgItem,hWin,ID_EDIT1
        mov     hEdit1, eax
        invoke  GetDlgItem,hWin,ID_EDIT2
        mov     hEdit2, eax

        invoke  GetDlgItem,hWin,ID_BUTTON1
        mov     hButn1, eax
        invoke  GetDlgItem,hWin,ID_BUTTON2
        mov     hButn2, eax
        invoke  GetDlgItem,hWin,ID_BUTTON3
        mov     hButn3, eax

        invoke  GetDlgItem,hWin,ID_CBUTTON1
        mov     hCButn1, eax
        invoke  GetDlgItem,hWin,ID_CBUTTON1
        mov     hCButn2, eax

    .elseif eax == WM_ERASEBKGND
        mov     LogBrush.lbStyle,BS_SOLID
        mov     LogBrush.lbColor,010101h
        invoke  CreateBrushIndirect,addr LogBrush
        mov     hBrush,eax
        invoke  GetClientRect,hWnd,addr rect_
        invoke  FillRect,wParam,addr rect_,hBrush
        xor     eax,eax
        inc     eax
        ret
    .elseif eax == WM_CTLCOLORSTATIC || eax == WM_CTLCOLOREDIT
        invoke  GetDlgCtrlID,lParam
        .if eax == ID_EDIT1 || eax == ID_EDIT2
            invoke  SetTextColor,wParam,0ffffffh
            invoke  SetBkColor,wParam,0303030h
            invoke  CreateSolidBrush,0303030h
        .elseif eax == IDC_STATIC
            invoke  SetTextColor,wParam,00080ffh
            invoke  SetBkColor,wParam,010101h
            invoke  CreateSolidBrush,010101h
        .endif
        ret
    .elseif eax == WM_DRAWITEM
        invoke  DrawButton,lParam
        xor     eax,eax
        inc     eax
        ret
    .elseif uMsg == WM_LBUTTONDOWN
        invoke  SendMessage, hWin, WM_NCLBUTTONDOWN, HTCAPTION, lParam
        ret
    .elseif eax == WM_COMMAND
        .if wParam == ID_BUTTON1

            ;-GENERATOR--------------------------
            InstSehFrame ofs @UnknownError
            invoke  GetWindowText,hEdit1,offset szEDIT1,1024
            invoke  GetWindowText,hEdit2,offset szEDIT2,1024
            invoke  Unpack,offset szEDIT1,offset szEDIT2
            KillSehFrame
            GetOutaHere1 equ $
            ;-GENERATOR--------------------------

        .elseif wParam == ID_BUTTON2
            jmp     GetOutaHere
        .elseif wParam == ID_BUTTON3
            invoke  DialogBoxParam,hInstance, IDC_ABOUT, hWin, OFFSET DlgProc,NULL
        .elseif wParam == ID_CBUTTON1
            mov     ofn.lStructSize,sizeof OPENFILENAME
            m2m     ofn.hWndOwner,hWin
            m2m     ofn.hInstance,hInstance
            mov     ofn.lpstrFilter,offset szFilter
            mov     ofn.lpstrFile,offset szBuffer
            mov     ofn.nMaxFile,sizeof szBuffer
            mov     ofn.lpstrTitle,offset szAbout1
            mov     ofn.lpstrDefExt,offset szDefExt
            mov     ofn.Flags,OFN_FILEMUSTEXIST or OFN_HIDEREADONLY or OFN_EXPLORER or OFN_LONGNAMES
            invoke  GetOpenFileName,offset ofn
            invoke  SetWindowText,hEdit1,offset szBuffer
            .IF (byte ptr [szBuffer] != 0)
;                 int     3
                mov     esi,offset szBuffer
                invoke  lstrlen,esi
                mov     ecx,eax
                add     esi,eax
                lea     edi,[esi+1]
                @@:
                mov     al,bpt [esi]
                mov     bpt [edi],al
                cmp     al,'.'
                je      @lastsymbol
                dec     esi
                dec     edi
                dec     ecx
                jnz     @B

                @lastsymbol:
                mov     bpt [edi-1],'_'
                invoke  SetWindowText,hEdit2,offset szBuffer
            .ENDIF
        .elseif wParam == ID_CBUTTON2
            mov     ofn.lStructSize,sizeof OPENFILENAME
            m2m     ofn.hWndOwner,hWin
            m2m     ofn.hInstance,hInstance
            mov     ofn.lpstrFilter,offset szFilter
            mov     ofn.lpstrFile,offset szBuffer
            mov     ofn.nMaxFile,sizeof szBuffer
            mov     ofn.lpstrTitle,offset szAbout2
            mov     ofn.lpstrDefExt,offset szDefExt
            mov     ofn.Flags,OFN_OVERWRITEPROMPT or OFN_HIDEREADONLY or OFN_EXPLORER or OFN_LONGNAMES
            invoke  GetSaveFileName,offset ofn
            invoke  SetWindowText,hEdit2,offset szBuffer
        .endif
    .elseif eax == WM_CLOSE
        GetOutaHere:
        invoke  EndDialog,hWnd,0
    .endif

    popa
    xor     eax, eax
    ret

WndProc endp

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

DlgProc proc hDlg:DWORD, uMsg:DWORD, wParam:WPARAM, lParam:DWORD
local Lon:DWORD
local hBrush:DWORD
local rect:RECT
local LogBrush:LOGBRUSH

    mov     eax,uMsg
    .if eax == WM_INITDIALOG
    .elseif eax == WM_CLOSE
        invoke  EndDialog,hDlg,NULL
    .elseif eax == WM_ERASEBKGND
        mov     LogBrush.lbStyle,BS_SOLID
        mov     LogBrush.lbColor,010101h
        invoke  CreateBrushIndirect,addr LogBrush
        mov     hBrush,eax
        invoke  GetClientRect,hDlg,addr rect
        invoke  FillRect,wParam,addr rect,hBrush
        xor     eax,eax
        inc     eax
        ret
    .elseif eax == WM_CTLCOLORSTATIC || eax == WM_CTLCOLOREDIT
        invoke  SetTextColor,wParam,00080ffh
        invoke  SetBkColor,wParam,010101h
        invoke  CreateSolidBrush,010101h
        ret
    .elseif eax == WM_DRAWITEM
        invoke  DrawButton,lParam
        xor     eax,eax
        inc     eax
        ret
    .elseif eax == WM_LBUTTONDOWN
        invoke  SendMessage, hDlg, WM_NCLBUTTONDOWN, HTCAPTION, lParam
        ret
    .elseif eax == WM_COMMAND
        xor     eax, eax
        mov     eax, wParam
        .if eax == ID_BUTTON1_1
            invoke  EndDialog, hDlg, NULL
        .endif
    .endif

    xor eax,eax
    ret
DlgProc endp

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

CopyMemory proc dest:DWORD,src:DWORD,len:DWORD
    pusha
    mov     ecx,len
    mov     edi,dest
    mov     esi,src
    rep     movsb
    popa
    ret
CopyMemory endp

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

DrawButton proc lParam:DWORD
local DI_:DRAWITEMSTRUCT
local FR:RECT
local FColor:DWORD
local BColor:DWORD
local hFont:DWORD
local hMemFont:DWORD
local GotFocus:DWORD
local hBrush:DWORD

    invoke  CopyMemory,addr DI_,lParam,sizeof DI_

    invoke  SetBkColor,DI_.hdc,010101h
    mov     BColor,eax
    invoke  CreateSolidBrush,010101h
    mov     hBrush,eax
    invoke  SetTextColor,DI_.hdc, 0080FFh
    mov     FColor,eax

    invoke  FillRect,DI_.hdc,addr DI_.rcItem, hBrush

    mov     eax,DI_.CtlID
    .if eax == ID_BUTTON1
       invoke  DrawText,DI_.hdc,offset szButton1,sizeof szButton1 - 1,addr DI_.rcItem, DT_CENTER Or DT_VCENTER Or DT_SINGLELINE
    .elseif eax == ID_BUTTON2
       invoke  DrawText,DI_.hdc,offset szButton2,sizeof szButton2 - 1,addr DI_.rcItem, DT_CENTER Or DT_VCENTER Or DT_SINGLELINE
    .elseif eax == ID_BUTTON3
       invoke  DrawText,DI_.hdc,offset szButton3,sizeof szButton3 - 1,addr DI_.rcItem, DT_CENTER Or DT_VCENTER Or DT_SINGLELINE
    .elseif eax == ID_CBUTTON1 || eax == ID_CBUTTON2
       invoke  DrawText,DI_.hdc,offset szButton5,sizeof szButton5 - 1,addr DI_.rcItem, DT_CENTER Or DT_VCENTER Or DT_SINGLELINE
    .elseif eax == ID_BUTTON1_1
       invoke  DrawText,DI_.hdc,offset szButton4,sizeof szButton4 - 1,addr DI_.rcItem, DT_CENTER Or DT_VCENTER Or DT_SINGLELINE
    .endif

    invoke  DeleteObject,hBrush
    invoke  SetTextColor,DI_.hdc, FColor
    invoke  SetBkColor,DI_.hdc, BColor
    invoke  SelectObject,DI_.hdc, hMemFont
    invoke  DeleteObject,hFont

    ret
DrawButton endp

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

SehHandler PROC C pExcept:DWORD,pFrame:DWORD,pContext:DWORD,pDispatch:DWORD
	mov     eax,pContext
	assume  eax:ptr CONTEXT
    m2m     [eax].regEip,SEH.SaveEip
    m2m     [eax].regEsp,SEH.OrgEsp
	m2m     [eax].regEbp,SEH.OrgEbp
	assume  eax:nothing
	return  ExceptionContinueExecution
SehHandler ENDP

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

ShowError proc lpMessage:DWORD,arg:DWORD,PreExit:DWORD
    .IF eax == arg
        invoke  MessageBox,0,lpMessage,$CT0("ERROR"),MB_ICONERROR
        m2m     dpt [esp+4],PreExit
    .ENDIF
    ret
ShowError endp

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

end start

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

;:end
;@echo off
;set cmpl=\masm32
;set proj=%~n0
;%cmpl%\bin\ml /nologo /c /coff /Cp /Sa /w /Sp16000 /I%cmpl%\include\ %proj%.bat
;%cmpl%\bin\rc usar.rc
;rem %cmpl%\bin\elink /align:16 /SUBSYSTEM:WINDOWS /stub:%cmpl%\bin\stub.exe /LIBPATH:%cmpl%\lib /MERGE:.rdata=.text /SECTION:.text,RWE %proj%.obj usar.res
;%cmpl%\bin\link /SUBSYSTEM:WINDOWS /LIBPATH:%cmpl%\lib /SECTION:.text,RWE %proj%.obj usar.res
;rem %cmpl%\bin\elink /align:16 /IGNORE:4078,4060,4108 /OPTidata /STUB:%cmpl%\bin\stub.exe /SUBSYSTEM:WINDOWS /LIBPATH:%cmpl%\lib /MERGE:.rdata=.text /MERGE:.data=.text /MERGE:.text=CODE /SECTION:CODE,RWE %proj%.obj usar.res
;rem %cmpl%\bin\Upack.exe %proj%.exe -c6 -force
;del %proj%.obj
;del usar.res

;rem HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;
