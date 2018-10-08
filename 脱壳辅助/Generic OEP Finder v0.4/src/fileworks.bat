;@goto exit

; #########################################################################
;
;                Main Library Injected In Targed process
;
; #########################################################################

    .586
    .model flat, stdcall
    option casemap :none   ; case sensitive

; #########################################################################

    include     windows.inc
    include     my.mac
;   include     TEB.inc
    include_    user32
    include_    kernel32
    include_    \usasm\usr\PE_Tools\yzPELib\lib\yzpelib
    include_    cadt
    include_    GDI32
    include_    masm32
    include_    shell32
    include_    comdlg32
    include_    hde


; #########################################################################

    HookProc                PROTO :DWORD,:DWORD,:DWORD
    HookProc2               PROTO :DWORD,:DWORD,:DWORD
    hex                     PROTO :DWORD,:DWORD
    WndProc                 PROTO :DWORD,:DWORD,:DWORD,:DWORD
    DrawButton              PROTO :DWORD
    MakeDialogTransparent   PROTO :DWORD,:DWORD
    ShowDlgItem             PROTO :DWORD,:DWORD,:DWORD
    PrintString             PROTO :DWORD
    StopThreads             PROTO
    RunThreads              PROTO
    VEHHandler              PROTO :DWORD
    HideModuleFromPEB       PROTO :DWORD
    GetMsgProc              PROTO :DWORD,:DWORD,:DWORD

; #########################################################################

    CreateRect macro lpRect,left,top,right,bottom
        lea     eax,lpRect
        mov     dpt [eax],left
        mov     dpt [eax+4],top
        mov     dpt [eax+8],right
        mov     dpt [eax+12],bottom
    endm

; #########################################################################

.const
    ID_BUTTON1 equ 301
    ID_BUTTON2 equ 302
    ID_BUTTON3 equ 303
    ID_BUTTON4 equ 304
    ID_BUTTON5 equ 305
    ID_BUTTON6 equ 306

    IDC_TEXT1 equ 2001
    IDC_TEXT2 equ 2002
    IDC_TEXT3 equ 2003
    IDC_TEXT4 equ 2004
    IDC_TEXT5 equ 2005
    IDC_TEXT6 equ 2006
    IDC_TEXT7 equ 2007

    ID_EDIT1 equ 101
    ID_EDIT2 equ 102
    ID_EDIT3 equ 103
    ID_EDIT4 equ 104
    ID_EDIT5 equ 105
    ID_EDIT6 equ 106
    ID_EDIT7 equ 107
    ID_EDIT8 equ 108
    ID_EDIT9 equ 109
    IDR_ACCEL equ 400

    MAINTIMERID     equ 3748h

; #########################################################################

.data?
    buffer          db 256 dup (?)
    lpStack         dd ?
    dwImageBase     dd ?
    dwImageSize     dd ?
    lpSec           dd ?
    dwSecSize       dd ?
    dwKernelBase    dd ?
    dwKernelSize    dd ?
    SectionAlignment   dd ?
    oldProt         dd ?
    hInstance       dd ?
    dwCadtBase      dd ?

    hEdit1          dd ?
    adrr            db ?
    lpfnEdit1Proc   dd ?
    szEDIT1         db 2048 dup (?)
    szBuffer        db 1024 dup (?)
    FileName        db 1024 dup (?)

    dwOEP           dd ?
    hFile           dd ?
    SizeRW          dd ?

    OEPList         dd 100 dup (?)
    ofn             OPENFILENAME <>
    hde_struc       HDE_STRUCT <>
    bImports        db ?

; ##########################################################################

.data
    szButton1       db "YES         ",0
    szButton2       db "NEXT        ",0
    szButton3       db "About       ",0
    szButton4       db "OK          ",0
    szButton5       db "  Open  ",0

    szFilter        db "PE Files (*.exe, *.dll)",0
    szDefExt        db "*.exe;*.dll",0
                    db "All Files (*.*)",0,"*.*",0,0

    szNum           db "00"
    szDumpTxt       db "OK, Now you can dump your process",13,10
    szOEPtxt        db "OEP:  00000000",13,10
    szROEP          db "ROEP: 00000000",13,10
                    db "- Logged OEP -",13,10,0
    szOEP           db "   00000000",0
    szCRLF          db 13,10
    szhModule       db "00000000:"

; ##########################################################################

.code
; ##########################################################################
  include     Catchy32.inc

LibMain proc uses ebx esi edi hInstDLL,reason,unused

    .if reason == DLL_PROCESS_ATTACH
        m2m     hInstance,hInstDLL
        assume  fs:nothing
        xor     eax,eax
        mov     eax,fs:[eax].TEB.Peb
        mov     eax,[eax].PEB.Ldr
        lea     eax,[eax].PEB_LDR_DATA.InLoadOrderModuleList
        mov     eax,[eax].LIST_ENTRY.Flink
        mov     esi,[eax].LDR_MODULE.BaseAddress
        mov     dwImageBase,esi
        add     esi,[esi+3Ch]
        m2m     dwImageSize,[esi].IMAGE_NT_HEADERS.OptionalHeader.SizeOfImage
        m2m     SectionAlignment,[esi].IMAGE_NT_HEADERS.OptionalHeader.SectionAlignment

        invoke  HideModuleFromPEB,hInstDLL
        invoke  GetModuleHandle,$CT0("cadt.dll")
        mov     dwCadtBase,eax
        invoke  HideModuleFromPEB,eax

        invoke  GetSection,dwImageBase,1,SEC_BYNUM
        mov     esi,eax
        mov     eax,[esi].IMAGE_SECTION_HEADER.VirtualAddress
        add     eax,dwImageBase
        invoke  AlignDown,eax,SectionAlignment
        mov     lpSec,eax

        mov     eax,[esi].IMAGE_SECTION_HEADER.Misc.VirtualSize
        invoke  AlignUp,eax,SectionAlignment
        mov     dwSecSize,eax

        invoke  CreateFile,$CT0("Get\*ProcAddress.log"),GENERIC_READ or GENERIC_WRITE,FILE_SHARE_READ,0,CREATE_ALWAYS,0,0
        mov     hFile,eax

        invoke  VirtualProtect,dwImageBase,dwImageSize,PAGE_EXECUTE_READWRITE or PAGE_GUARD,addr oldProt
;       invoke  VirtualProtect,dwImageBase,dwImageSize,PAGE_NOACCESS,addr oldProt

        scall   HookProcByName,$CT0("kernel32.dll"),$CT0("Get\*ProcAddress"),offset myGetProcAddress,offset oldGetProcAddress
        scall   HookProcByName,$CT0("kernel32.dll"),$CT0("Virtual\*Protect"),offset myVirtualProtect,offset oldVirtualProtect
        scall   HookProcByName,$CT0("kernel32.dll"),$CT0("Load\*LibraryA"),  offset myLoadLibraryA,  offset oldLoadLibraryA

        invoke  GetModuleHandle,$CT0("kernel32.dll")
        invoke  GetProcAddress,eax,$CT0("AddVectored\*ExceptionHandler")
        .if !eax
            invoke  MessageBox,0,$CT0("Your system doesn't support Vectored Exception Handler"),$CT0("Error"),0
            invoke  ExitProcess,0
        .endif
        scall   eax,0,offset VEHHandler

        return  TRUE
    .endif
    return  TRUE

LibMain endp

; ##########################################################################

MakeDump proc
    invoke  CloseHandle,hFile
    invoke  VirtualProtect,dwImageBase,dwImageSize,PAGE_EXECUTE_READWRITE,addr oldProt
    mov     eax,dwImageBase
    add     eax,[eax+3Ch]
    lea     eax,[eax].IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint
    mov     ecx,dwOEP
    sub     ecx,dwImageBase
    mov     [eax],ecx

    xor     eax,eax
    mov     eax,fs:[eax].TEB.Peb
    mov     eax,[eax].PEB.Ldr
    lea     eax,[eax].PEB_LDR_DATA.InLoadOrderModuleList
    mov     eax,[eax].LIST_ENTRY.Flink
    m2m     [eax].LDR_MODULE.EntryPoint,dwOEP

; обычно masm32 генерирует переходники ввиде jmp dword ptr [xxxxxxxx],
; у меня нет :) если у вас так, то нужно раскомментировать.
;
;     mov     edi,dword ptr [GetProcAddress+2]
;     mov     edi,[edi]

    mov     edi,dword ptr [GetProcAddress]

    push    0
    invoke  VirtualProtect,edi,5,PAGE_EXECUTE_READWRITE,esp
    mov     esi,offset oldGetProcAddress
    mov     ecx,5
    rep     movsb
    pop     eax
    push    eax
    invoke  VirtualProtect,edi,5,eax,esp
    pop     eax

    set     hAccel,$invoke(LoadAccelerators,hInstance,IDR_ACCEL)
    invoke  DialogBoxParam,hInstance,$CT0("DIALOG"),0,addr WndProc,0
    invoke  DestroyAcceleratorTable,hAccel
    invoke  ExitProcess,0
    return  TRUE
MakeDump endp

; ##########################################################################

VEHHandler proc uses edx ebx esi edi dwRecord:DWORD

    call    StopThreads

    mov     eax,dwRecord
    mov     edx,[eax].EXCEPTION_POINTERS.pExceptionRecord
    .if dword ptr [edx] == 080000001h ; PAGE_GUARD
;   .if dword ptr [edx] == 0C0000005h ; ACCES_VIOLITION
        mov     edx,[eax].EXCEPTION_POINTERS.ContextRecord
        mov     edx,[edx].CONTEXT.regEip
        invoke  IfInRange,edx,dwCadtBase,0000E000h
        test    eax,eax
        jnz     @SkipOEP
        invoke  IfInRange,edx,hInstance,00008000h
        test    eax,eax
        jnz     @SkipOEP
        invoke  IfInRange,edx,dwImageBase,dwImageSize
        .if eax
            invoke  IsBadReadPtr,edx,4
            .if !eax
                invoke  hde_disasm,edx,offset hde_struc
                cmp     hde_struc.p_rep,0   ; no    rep & rep(n)z prefix: 0xF2 or 0xF3
                jnz     @SkipOEP
                cmp     hde_struc.p_lock,0  ; no    lock prefix 0xF0
                jnz     @SkipOEP
                xor     eax,eax
                mov     al,hde_struc.opcode
                .if al == 0Fh
                    mov     al,hde_struc.opcode2
                    mov     al,byte ptr [eax + OEPopcodeTableEx]
                .else
                    mov     al,byte ptr [eax + OEPopcodeTable]
                .endif

                cmp     al,1
                jz      @SkipOEP

                cmp     hde_struc.p_seg,03Eh ; segment ss
                je      @F

                cmp     al,2
                jnz     @test2
                cmp     hde_struc.modrm_mod,11b
                jz      @F
                jmp     @SkipOEP

                @test2:
;                 cmp     al,3
;                 jnz     @F
;                 cmp     hde_struc.disp32,0
;                 jne     @F
;                 jmp     @SkipOEP

                @@:
                lea     esi,OEPList
            @@: lodsd
                test    eax,eax
                jz      @EndOEPList
                cmp     edx,eax
                jz      @SkipOEP
                jmp     @B
                @EndOEPList:
                mov     dword ptr [esi-4],edx
                mov     dwOEP,edx

                mov     hAccel,$invoke(LoadAccelerators,hInstance,IDR_ACCEL)
                invoke  DialogBoxParam,hInstance,$CT0("DIALOG"),0,addr WndProc,dwOEP
                .if eax
                    mov     eax,dwRecord
                    mov     edx,[eax].EXCEPTION_POINTERS.ContextRecord
                    mov     [edx].CONTEXT.regEip,offset MakeDump
                .endif
                invoke  DestroyAcceleratorTable,hAccel

                @SkipOEP:
                call    RunThreads
                return  EXCEPTION_CONTINUE_EXECUTION
            .endif
        .endif
    .endif
    call    RunThreads
    return  EXCEPTION_CONTINUE_SEARCH
VEHHandler endp

; ##########################################################################

HookProcByName proc szLibName,szProcName,pNewProc,pCodeBuffer
    pushad
    invoke  GetModuleHandle,szLibName
    invoke  GetProcAddress,eax,szProcName
    test    eax,eax
    jz      @returnFALSE
    invoke  HookProc,eax,pNewProc,pCodeBuffer
    popad
    return  0
@returnFALSE:
    popad
    return  -1
HookProcByName endp

;-----------------------------------------------------------------------------------------;

HookProc2 proc lpProc,pNewProc,pCodeBuffer
    pushad
    mov     edi,lpProc
    sub     edi,5
    push    0
    invoke  VirtualProtect,edi,7,PAGE_EXECUTE_READWRITE,esp
    mov     al,0E9h
    stosb
    mov     eax,pNewProc
    sub     eax,4
    sub     eax,edi
    stosd
    mov     ax,0F9EBh
    stosw
    mov     edi,pCodeBuffer
    mov     al,68h
    stosb
    mov     eax,lpProc
    stosd
    mov     al,0C3h
    stosb
    pop     eax
    push    eax
    invoke  VirtualProtect,edi,7,eax,esp
    pop     eax
    popad
    return  0
HookProc2 endp

;-----------------------------------------------------------------------------------------;

HookProc proc lpProc,pNewProc,pCodeBuffer
    pushad

    mov     eax,lpProc
    mov     esi,eax
    mov     edi,pCodeBuffer
    add     pCodeBuffer,5
@@: call    c_Catchy
    mov     ecx,eax
    rep     movsb
    cmp     edi,pCodeBuffer
    jb      @B
    mov     al,0E9h
    stosb
    mov     eax,lpProc
    sub     eax,edi
    inc     eax
    stosd
    mov     edi,lpProc
    push    0
    invoke  VirtualProtect,edi,5,PAGE_EXECUTE_READWRITE,esp
    mov     al,0E9h
    stosb
    mov     eax,pNewProc
    sub     eax,4
    sub     eax,edi
    stosd
    pop     eax
    push    eax
    invoke  VirtualProtect,lpProc,5,eax,esp
    pop     eax
    popad
    return  0

@returnFALSE:
    popad
    return  -1
HookProc endp

; ##########################################################################

myGetProcAddress proc C hModule,lpProcName
    .if bImports
        mov     eax,[esp+4]
        invoke  IfInRange,eax,dwImageBase,dwImageSize
        .if eax
            invoke  GetModuleFileName,hModule,addr szBuffer,sizeof szBuffer
            invoke  lstrlen,addr szBuffer
            mov     word ptr [szBuffer+eax],'!'
            inc     eax
            invoke  WriteFile,hFile,addr szBuffer,eax,addr SizeRW,0
            .if lpProcName > 0FFFFh
                invoke  lstrlen,lpProcName
                invoke  WriteFile,hFile,lpProcName,eax,addr SizeRW,0
            .else
                invoke  wsprintf,addr szBuffer,$CT0("#%lu"),lpProcName
                invoke  lstrlen,addr szBuffer
                mov     ecx,eax
                invoke  WriteFile,hFile,addr szBuffer,ecx,addr SizeRW,0
            .endif
            invoke  WriteFile,hFile,addr szCRLF,2,addr SizeRW,0
        .endif
    .else
        invoke  lstrcmp,lpProcName,$CT0("RtlDll\*Shutdown\*InProgress")
        .if !eax
            mov     bImports,TRUE
        .endif
    .endif
    invoke  VirtualProtect,dwImageBase,dwImageSize,PAGE_EXECUTE_READWRITE or PAGE_GUARD,addr oldProt
    pop     ebp
myGetProcAddress endp
oldGetProcAddress db 20 dup (?)

;-----------------------------------------------------------------------------------------;

myLoadLibraryA proc C lpLibFileName
    invoke  VirtualProtect,dwImageBase,dwImageSize,PAGE_EXECUTE_READWRITE or PAGE_GUARD,addr oldProt
    pop     ebp
myLoadLibraryA endp
oldLoadLibraryA db 20 dup (?)

;-----------------------------------------------------------------------------------------;

myVirtualProtect proc C lpAddress,dwSize,flNewProtect,lpflOldProtect
    pop     ebp
    mov     eax,[esp]
    invoke  IfInRange,eax,hInstance,00008000h
    .if !eax
        scall   hekk,dwImageBase,dwImageSize,PAGE_EXECUTE_READWRITE or PAGE_GUARD,offset oldProt
        retn    4*4
    .endif
myVirtualProtect endp
hekk equ $
oldVirtualProtect db 20 dup (?)

;-----------------------------------------------------------------------------------------;

hex proc lpStr,dwNum
    pushad
    mov edi,lpStr
    add edi,7
    mov ecx,8
    mov ebx,dwNum
    next:
	mov eax,ebx
	and al,0fh
	add al,90h
	daa
	adc al,40h
	daa
	shr ebx,4
	mov [edi],al
	dec edi
	dec ecx
	jne next
    popad
	ret
hex endp

;-----------------------------------------------------------------------------------------;

WndProc proc hWin:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
local Lon:DWORD,hBrush:DWORD,rect_:RECT,LogBrush:LOGBRUSH,tmpFont:LOGFONT
local Options:TMnemonicOptios,dwCommands:DWORD,Command:TDisCommand,Instr1:TInstruction
local Len,cPtr:DWORD


    pushad
    setm    hWnd,hWin
    mov     eax,uMsg
    switch eax
    case WM_INITDIALOG
        invoke  MakeDialogTransparent,hWin,240
;       invoke  GetDlgItemText,hWin,IDC_TEXT3,addr szBuffer,sizeof szBuffer
;       lea     eax,szBuffer
;       add     eax,3
;       invoke  SendMessage,hWin,WM_SETTEXT,0,eax
        set     hIcon,$invoke(LoadIcon,hInstance,200)
        invoke  SendMessage,hWin,WM_SETICON,1,hIcon
        mov     hEdit1,$invoke(GetDlgItem,hWin,ID_EDIT1)
        set     hEdit2,$invoke(GetDlgItem,hWin,ID_EDIT2)
        set     hButn1,$invoke(GetDlgItem,hWin,ID_BUTTON1)
        set     hButn2,$invoke(GetDlgItem,hWin,ID_BUTTON2)
        set     hButn3,$invoke(GetDlgItem,hWin,ID_BUTTON3)
        set     hButn4,$invoke(GetDlgItem,hWin,ID_BUTTON4)
        invoke  ShowWindow,hButn4,SW_HIDE
        invoke  ShowDlgItem,hWin,IDC_TEXT2,SW_HIDE
        invoke  ShowDlgItem,hWin,IDC_TEXT7,SW_HIDE
        set     hBrush1,$invoke(CreateSolidBrush,RGB(0,128,128))
        set     hBrush2,$invoke(CreateSolidBrush,RGB(0,0,0))
        set     hBrush3,$invoke(CreateSolidBrush,RGB(128,255,0))
        set     hBrush4,$invoke(CreateSolidBrush,RGB(0,0,080h))
        set     hBrush6,$invoke(CreateSolidBrush,RGB(040h,040h,040h))
        set     hBrush7,$invoke(CreateSolidBrush,RGB(0,255,255))
        invoke  HyperLink,hWin,IDC_TEXT7
        invoke  GetCurrentThreadId
        set     hHook,$invoke(SetWindowsHookEx,WH_GETMESSAGE,addr GetMsgProc,NULL,eax)

        .if lParam
            invoke  GetDlgItemText,hWin,IDC_TEXT3,addr buffer,sizeof buffer
            .if szNum[1] == '9'
                inc szNum[0]
                mov szNum[1],'0'
            .else
                inc szNum[1]
            .endif
            mov     esi,offset buffer + 2
            m2m     word ptr [esi],word ptr [szNum]
            invoke  SetDlgItemText,hWin,IDC_TEXT3,addr buffer

            lea     eax,buffer
            mov     bpt [eax],0
            invoke  SetWindowText,hEdit1,offset buffer

                xor     eax,eax
                lea     edi,Options
                mov     ecx,sizeof Options
                rep     stosb
                mov     Options.RealtiveOffsets,TRUE
                mov     Options.AddAddresPart,TRUE
                mov     Options.AlternativeAddres,0
                mov     Options.AddHexDump,TRUE
                mov     Options.MnemonicAlign,26
                mov     dwCommands,13
                m2m     cPtr,lParam
                .while dwCommands
                    xor     eax,eax
                    lea     edi,Instr1
                    mov     ecx,sizeof TInstruction
                    rep     stosb
                    lea     edi,Command
                    mov     ecx,sizeof TDisCommand
                    rep     stosb
                    lea     edi,buffer
                    mov     ecx,sizeof buffer
                    rep     stosb
                    invoke  InstrDecode,cPtr,addr Instr1,FALSE
                    add     cPtr,eax
                    invoke  InstrDasm,addr Instr1,addr Command,FALSE
                    invoke  MakeMnemonic,addr buffer,addr Command,addr Options
                    invoke  PrintString,addr buffer
                    dec     dwCommands
                .endw
        .else
            invoke  GetDlgItemText,hWin,IDC_TEXT3,addr buffer,sizeof buffer
            m2m     word ptr [buffer + 2],word ptr [szNum]
            invoke  SetDlgItemText,hWin,IDC_TEXT3,addr buffer
            invoke  hex,offset [szOEPtxt+6],dwOEP
            mov     eax,dwOEP
            sub     eax,dwImageBase
            invoke  hex,offset [szROEP+6],eax
            invoke  SetWindowText,hEdit1,offset szDumpTxt

                lea     esi,OEPList
            @@: lodsd
                test    eax,eax
                jz      @EndOEPList
                invoke  hex,offset [szOEP+3],eax
                invoke  PrintString,addr szOEP
                jmp     @B
                @EndOEPList:

        .endif

        popad
        return  1

    case WM_ERASEBKGND
        mov     ebx,wParam
        mov     LogBrush.lbStyle,BS_SOLID
        mov     LogBrush.lbColor,RGB(1,1,1)
        set     hBrush5,$invoke(CreateBrushIndirect,addr LogBrush)
        invoke  GetClientRect,hWin,addr rect_
        invoke  FillRect,ebx,addr rect_,hBrush5
        invoke  DeleteObject,hBrush5
        call    wndEraseBkg
        popad
        return  hBrush1

    case WM_CTLCOLORDLG
        popad
        return  0;hBrush2

    .elseif eax == WM_CTLCOLORSTATIC || eax == WM_CTLCOLOREDIT
        invoke  SelectObject,wParam,hBrush2
        invoke  GetDlgCtrlID,lParam
        .if eax == ID_EDIT1 || eax == ID_EDIT2
            invoke  SetTextColor,wParam,RGB(0,255,255)
            invoke  SetBkColor,wParam,RGB(0,0,128)
            m2m     [esp].PUSHADS.regEax,hBrush4
        .elseif eax == IDC_TEXT5 || eax == IDC_TEXT4 || eax == IDC_TEXT6
            invoke  SetTextColor,wParam,RGB(0,0,0)
            invoke  SetBkMode,wParam,TRANSPARENT
            m2m     [esp].PUSHADS.regEax,hBrush4
        .elseif eax == IDC_TEXT3
            invoke  SetTextColor,wParam,RGB(0,0,0)
            invoke  SetBkMode,wParam,TRANSPARENT
            m2m     [esp].PUSHADS.regEax,hBrush1
        .elseif eax == IDC_TEXT2
            invoke  SetTextColor,wParam,RGB(0,255,255)
            invoke  SetBkMode,wParam,TRANSPARENT
            m2m     [esp].PUSHADS.regEax,hBrush4
        .elseif eax == -1
            invoke  SetTextColor,wParam,RGB(0C0h,0C0h,0C0h)
            invoke  SetBkMode,wParam,TRANSPARENT
            m2m     [esp].PUSHADS.regEax,hBrush2
        .elseif eax == IDC_TEXT7
            mov     edx,$invoke(SendMessage,hWin,WM_GETFONT,0,0)
            invoke  GetObject,edx,sizeof LOGFONT,addr tmpFont
            mov     tmpFont.lfUnderline,TRUE
            mov     ebx,$invoke(CreateFontIndirect,addr tmpFont)
            invoke  SelectObject,wParam,ebx
            invoke  SetTextColor,wParam,RGB(255,255,255)
            invoke  SetBkMode,wParam,TRANSPARENT
            invoke  DeleteObject,ebx
            invoke  GetStockObject,HOLLOW_BRUSH
            m2m     [esp].PUSHADS.regEax,hBrush4
        .endif
        popad
        return

    case WM_DRAWITEM
        invoke  DrawButton,lParam
        popad
        return  0

    case WM_LBUTTONDOWN
        invoke  SendMessage,hWin,WM_NCLBUTTONDOWN,HTCAPTION,lParam
        popad
        return

    case WM_COMMAND
        movzx  eax,word ptr [wParam]
        switch eax
        case ID_BUTTON1 ;yes
        cmd1:
            .if !bAbout
            xor     esi,esi
            inc     esi
            jmp     GetOutaHere
            .endif

        case ID_BUTTON2 ; no
        cmd2:
            .if !bAbout
            xor     esi,esi
            jmp     GetOutaHere
            .else
            jmp     cmd4
            .endif

        case ID_BUTTON3
        cmd3:
            .if !bAbout
            invoke  ShowWindow,hButn1,SW_HIDE
            invoke  ShowWindow,hButn2,SW_HIDE
            invoke  ShowWindow,hButn3,SW_HIDE
            invoke  ShowWindow,hEdit1,SW_HIDE
            invoke  ShowWindow,hEdit2,SW_HIDE
            invoke  ShowWindow,hButn4,SW_SHOW
            invoke  ShowDlgItem,hWin,IDC_TEXT4,SW_HIDE
            invoke  ShowDlgItem,hWin,IDC_TEXT5,SW_HIDE
            invoke  ShowDlgItem,hWin,IDC_TEXT6,SW_HIDE
            CreateRect rect_,35,47,465,157
            mov     ecx,$invoke(GetDC,hWin)
            invoke  FillRect,ecx,addr rect_,hBrush2
            set     bAbout,1
            invoke  ShowDlgItem,hWin,IDC_TEXT2,SW_SHOW
            invoke  ShowDlgItem,hWin,IDC_TEXT7,SW_SHOW
            .endif

        case ID_BUTTON4
        cmd4:
            .if bAbout
            invoke  ShowDlgItem,hWin,IDC_TEXT2,SW_HIDE
            invoke  ShowDlgItem,hWin,IDC_TEXT7,SW_HIDE
            invoke  ShowWindow,hButn4,SW_HIDE
            invoke  ShowWindow,hButn1,SW_SHOW
            invoke  ShowWindow,hButn2,SW_SHOW
            invoke  ShowWindow,hButn3,SW_SHOW
            mov     ebx,$invoke(GetDC,hWin)
            call    wndEraseBkg
            invoke  ShowWindow,hEdit1,SW_SHOW
            invoke  ShowWindow,hEdit2,SW_SHOW
            invoke  ShowDlgItem,hWin,IDC_TEXT4,SW_SHOW
            invoke  ShowDlgItem,hWin,IDC_TEXT5,SW_SHOW
            invoke  ShowDlgItem,hWin,IDC_TEXT6,SW_SHOW
            mov     bAbout,0
            .endif

        case ID_BUTTON5
            invoke  ExitProcess,0

        endsw
        popad
        return  1

    case WM_CLOSE
        xor     esi,esi
        GetOutaHere:
        invoke  DeleteObject,hBrush1
        invoke  DeleteObject,hBrush2
        invoke  DeleteObject,hBrush3
        invoke  DeleteObject,hBrush4
        invoke  DeleteObject,hBrush5
        invoke  DeleteObject,hBrush6
        invoke  DeleteObject,hBrush7
        invoke  KillTimer,hWin,MAINTIMERID
        invoke  UnhookWindowsHookEx,hHook
        invoke  EndDialog,hWin,esi

    endsw

    popad
    return  0

    wndEraseBkg:
        CreateRect rect_,0,16,500,180
        invoke  FillRect,ebx,addr rect_,hBrush4
        CreateRect rect_,5,23,495,175
        invoke  FrameRect,ebx,addr rect_,hBrush7
        inc     rect_.left
        dec     rect_.right
        invoke  FrameRect,ebx,addr rect_,hBrush7
        invoke  InflateRect,addr rect_,-3,-3
        invoke  FrameRect,ebx,addr rect_,hBrush7
        inc     rect_.left
        dec     rect_.right
        invoke  FrameRect,ebx,addr rect_,hBrush7
        retn    0

WndProc endp

;-----------------------------------------------------------------------------------------;

GetMsgProc proc uses ebx dwCode,wParam,lParam

    mov     ebx,lParam
    .if [ebx].MSG.message >= WM_KEYFIRST && [ebx].MSG.message <= WM_KEYLAST
        invoke  TranslateAccelerator,hWnd,hAccel,lParam
        .if eax
            mov [ebx].MSG.message,WM_NULL
        .endif
    .endif

    invoke  CallNextHookEx,hHook,dwCode,wParam,lParam
    return
GetMsgProc endp

;-----------------------------------------------------------------------------------------;

PrintString proc lpMessage:DWORD
local pMem:DWORD

    pushad
    invoke  GlobalAlloc,GMEM_FIXED or GMEM_ZEROINIT,10000
    mov     pMem,eax
    invoke  GetWindowText,hEdit1,pMem,10000
    invoke  lstrcat,pMem,lpMessage
    invoke  lstrcat,pMem,$CT0("\n")
    invoke  SetWindowText,hEdit1,pMem
    invoke  GlobalFree,pMem
    popad
    return

PrintString endp

;-----------------------------------------------------------------------------------------;

DrawButton proc lParam:DWORD
local DI_:DRAWITEMSTRUCT,FR:RECT,FColor:DWORD,BColor:DWORD,hFont:DWORD,hMemFont:DWORD,GotFocus:DWORD

    invoke  MemCopy,lParam,addr DI_,sof DI_

    mov     eax,DI_.CtlID

    mov     BColor,$invoke(SetBkColor,DI_.hdc,RGB(0,128,128))
    mov     FColor,$invoke(SetTextColor,DI_.hdc,RGB(0,0,0))
    invoke  FillRect,DI_.hdc,addr DI_.rcItem,hBrush2
    invoke  SelectObject,DI_.hdc,hBrush2

    mov     eax,DI_.CtlID
    switch  eax
    case    ID_BUTTON1
    invoke  DrawText,DI_.hdc,ofs szButton1,sof szButton1 - 1,addr DI_.rcItem, DT_LEFT or DT_VCENTER or DT_SINGLELINE
    case    ID_BUTTON2
    invoke  DrawText,DI_.hdc,ofs szButton2,sof szButton2 - 1,addr DI_.rcItem, DT_LEFT or DT_VCENTER or DT_SINGLELINE
    case    ID_BUTTON3
    invoke  DrawText,DI_.hdc,ofs szButton3,sof szButton3 - 1,addr DI_.rcItem, DT_LEFT or DT_VCENTER or DT_SINGLELINE
    case    ID_BUTTON4
    invoke  DrawText,DI_.hdc,ofs szButton4,sof szButton4 - 1,addr DI_.rcItem, DT_LEFT or DT_VCENTER or DT_SINGLELINE
    endsw

    invoke  SetTextColor,DI_.hdc,FColor
    invoke  SetBkColor,DI_.hdc,BColor
    invoke  SelectObject,DI_.hdc,hMemFont

    ret
DrawButton endp

;-----------------------------------------------------------------------------------------;

MakeDialogTransparent proc _handle:dword,_transvalue:dword
	pushad
    invoke  GetWindowLong,_handle,GWL_EXSTYLE
    or      eax,WS_EX_LAYERED
    invoke  SetWindowLong,_handle,GWL_EXSTYLE,eax
    invoke  SetLayeredWindowAttributes,_handle,0,_transvalue,LWA_ALPHA
	popad
	ret
MakeDialogTransparent endp

;-----------------------------------------------------------------------------------------;

ShowDlgItem proc uses ecx edx hWin:DWORD,nDlgId:DWORD,lParam:DWORD
    invoke  GetDlgItem,hWin,nDlgId
    invoke  ShowWindow,eax,lParam
    ret
ShowDlgItem endp

;-----------------------------------------------------------------------------------------;

StopThreads proc
local h:DWORD,CurrTh:DWORD,ThrHandle:DWORD,CurrPr:DWORD,Thread:THREADENTRY32

    pushad
    mov     CurrTh,$invoke(GetCurrentThreadId)
    mov     CurrPr,$invoke(GetCurrentProcessId)
    mov     h,$invoke(CreateToolhelp32Snapshot,TH32CS_SNAPTHREAD,0)

    .if h != INVALID_HANDLE_VALUE
        mov     Thread.dwSize,sof THREADENTRY32
        .if $invoke(Thread32First,h,addr Thread)
        .repeat
            mov     eax,CurrTh
            mov     ecx,CurrPr
            .if (Thread.th32ThreadID != eax) && (Thread.th32OwnerProcessID == ecx)
                mov     ThrHandle,$invoke(OpenThread,THREAD_SUSPEND_RESUME,0,Thread.th32ThreadID)
                .if ThrHandle != 0 && ThrHandle != -1
                    invoke  SuspendThread,ThrHandle
                    invoke  CloseHandle,ThrHandle
                .endif
            .endif
            invoke Thread32Next,h,addr Thread
        .until !eax
        .endif
        invoke  CloseHandle,h
    .endif
    popad
    ret
StopThreads endp

;-----------------------------------------------------------------------------------------;

RunThreads proc
local h:DWORD,CurrTh:DWORD,ThrHandle:DWORD,CurrPr:DWORD,Thread:THREADENTRY32

    pushad
    mov     CurrTh,$invoke(GetCurrentThreadId)
    mov     CurrPr,$invoke(GetCurrentProcessId)
    mov     h,$invoke(CreateToolhelp32Snapshot,TH32CS_SNAPTHREAD,0)
    .if h != INVALID_HANDLE_VALUE
        mov     Thread.dwSize,sof THREADENTRY32
        .if $invoke(Thread32First,h,addr Thread)
        .repeat
            mov     eax,CurrTh
            mov     ecx,CurrPr
            .if (Thread.th32ThreadID != eax) && (Thread.th32OwnerProcessID == ecx)
                mov     ThrHandle,$invoke(OpenThread,THREAD_SUSPEND_RESUME,0,Thread.th32ThreadID)
                .if ThrHandle != 0 && ThrHandle != -1
                    invoke  ResumeThread,ThrHandle
                    invoke  CloseHandle,ThrHandle
                .endif
            .endif
            invoke Thread32Next,h,addr Thread
        .until !eax
        .endif
        invoke  CloseHandle,h
    .endif
    popad
    ret
RunThreads endp

HideModuleFromPEB proc hInstDLL:DWORD
        assume  fs:nothing
        mov     esi,hInstDLL
        xor     eax,eax
        mov     eax,fs:[eax].TEB.Peb
        mov     eax,[eax].PEB.Ldr
        lea     eax,[eax].PEB_LDR_DATA.InLoadOrderModuleList
        @@:
        mov     eax,[eax].LDR_MODULE.InLoadOrderModuleList.Flink
        cmp     esi,[eax].LDR_MODULE.BaseAddress
        jnz     @B
        mov     esi,[eax].LIST_ENTRY.Flink
        mov     ebx,[eax].LIST_ENTRY.Blink
        mov     [ebx].LIST_ENTRY.Flink,esi
        mov     esi,[eax].LIST_ENTRY.Blink
        mov     ebx,[eax].LIST_ENTRY.Flink
        mov     [ebx].LIST_ENTRY.Blink,esi
        lea     eax,[eax].LDR_MODULE.InMemoryOrderModuleList
        mov     esi,[eax].LIST_ENTRY.Flink
        mov     ebx,[eax].LIST_ENTRY.Blink
        mov     [ebx].LIST_ENTRY.Flink,esi
        mov     esi,[eax].LIST_ENTRY.Blink
        mov     ebx,[eax].LIST_ENTRY.Flink
        mov     [ebx].LIST_ENTRY.Blink,esi
        ret
HideModuleFromPEB endp

end LibMain

; ##########################################################################

; :exit
; @echo off
; set cmpl=\usasm
; set proj=fileworks
; set rsrc=rsrc
; %cmpl%\bin\ml /nologo /c /coff /Cp /I%cmpl%\include\ %proj%.bat
; %cmpl%\bin\rc %rsrc%.rc
; %cmpl%\bin\link /SUBSYSTEM:WINDOWS /LIBPATH:%cmpl%\lib /DLL /RELEASE /SECTION:.text,RWE /DEF:%proj%.def %proj%.obj %rsrc%.res
; del *.obj
; del *.exp
; del fileworks.lib
; move *.dll ..\

; rem ######################################################################