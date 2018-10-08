;@goto exit

; #########################################################################
;
;          Build this DLL from the batch file called BldDLL.bat
;
; #########################################################################

    .586
    .model flat, stdcall
    option casemap :none   ; case sensitive

; #########################################################################

    include     windows.inc
    include     my.mac
    include     operands.inc
    include     ntddk.inc
    include_    kernel32
    include_    ntdll
    include_    comdlg32
    include_    \usasm\usr\PE_Tools\yzPELib\lib\yzpelib

; #########################################################################

.data
    szFilter                db "PE Files (*.exe)",0
    szDefExt                db "*.exe",0
                            db "All Files (*.*)",0,"*.*",0,0

.data?
    szBuffer1               db 1024 dup (?)
    ofn                     OPENFILENAME <>
    buffer                  db 256 dup (?)
    dwBuff                  dd ?
    lpStartupInfo           STARTUPINFO <>
    lpProcessInformation    PROCESS_INFORMATION <>
    lpContext               CONTEXT <>
    BytesWritten            dd ?
    pMem                    dd ?
    lpEP                    dd ?
    mf                      MAP_FILE <>
    pbi                     PROCESS_BASIC_INFORMATION <>

; ##########################################################################

SEH struct
    PrevLink                dd ? ; адрес предыдущего SEH-фрейма
    CurrentHandler          dd ? ; адрес обработчика исключений
    SafeOffset              dd ? ; Смещение безопасного места
    PrevEsp                 dd ? ; Старое значение esp
    PrevEbp                 dd ? ; Старое значение ebp
SEH ends

.code
; ##########################################################################

InjectProc equ $
    pushad

    call    @F

    szLibName1 db 255 dup (0)
@@: call    @F
    szLibName2 db 255 dup (0)
@@: mov_esi pLoadLibraryA
    call    esi
    call    esi

    popad
    push_   @OldEP
    ret
InjectSize equ $ - InjectProc

start:
    ; корректируем InjectCode
    invoke  GetCurrentDirectory,sizeof szLibName1,addr szLibName1
    invoke  lstrcpy,addr szLibName2,addr szLibName1
    invoke  lstrcat,addr szLibName1,$CT0("\\fileworks.dll")
    invoke  lstrcat,addr szLibName2,$CT0("\\cadt.dll")
    m2m     pLoadLibraryA,[LoadLibraryA]

    mov     ofn.lStructSize,sizeof OPENFILENAME
    mov     ofn.lpstrFilter,offset szFilter
    mov     ofn.lpstrFile,offset szBuffer1
    mov     ofn.nMaxFile,sizeof szBuffer1
    mov     ofn.lpstrTitle,$CT0("Please Choose the Input File")
    mov     ofn.lpstrDefExt,offset szDefExt
    mov     ofn.Flags,OFN_FILEMUSTEXIST or OFN_HIDEREADONLY or OFN_EXPLORER or OFN_LONGNAMES
    invoke  GetOpenFileName,offset ofn

    ; заполняем структуру STARTUPINFO
    mov     lpStartupInfo.cb,sizeof lpStartupInfo
    mov     lpStartupInfo.wShowWindow,SW_SHOW
    ; запускаем упакованный файл с флагом CREATE_SUSPENDED
    invoke  CreateProcess,0,offset szBuffer1,0,0,0,CREATE_SUSPENDED,0,0,addr lpStartupInfo,addr lpProcessInformation
    ; получаем EP
    mov     lpContext.ContextFlags,CONTEXT_FULL
    invoke  GetThreadContext,lpProcessInformation.hThread,addr lpContext
    ; lpContext.regEip указывает на 7C810665
    ; где видно что EntryPoint хранится в eax и заносится в стек, а в последствии вызывается через call [ebp+8]
    mov     eax,lpContext.regEip
    m2m     @OldEP,lpContext.regEax
    ; выделяем в нем память для нашего кода и пишем туда его
    invoke  VirtualAllocEx,lpProcessInformation.hProcess,0,InjectSize,MEM_COMMIT or MEM_RESERVE,PAGE_EXECUTE_READWRITE
    mov     pMem,eax
    invoke  WriteProcessMemory,lpProcessInformation.hProcess,pMem,offset InjectProc,offset InjectSize,addr BytesWritten
    ; меняем EP и запускаем тред
    m2m     lpContext.regEax,pMem
    invoke  SetThreadContext,lpProcessInformation.hThread,addr lpContext
    invoke  ResumeThread,lpProcessInformation.hThread

    invoke  ExitProcess,0

; ##########################################################################

end start

; ##########################################################################

; :exit
; @echo off
; set cmpl=\usasm
; set proj=loader
; %cmpl%\bin\ml /nologo /c /coff /Cp /I%cmpl%\include\ %proj%.bat
; rem %cmpl%\bin\link /SUBSYSTEM:WINDOWS /LIBPATH:%cmpl%\lib /DLL /RELEASE /align:16 /IGNORE:4078,4060,4108 /STUB:%cmpl%\bin\stub.exe /OPTidata /DEF:%proj%.def %proj%.obj
; %cmpl%\bin\link /SUBSYSTEM:WINDOWS /LIBPATH:%cmpl%\lib /RELEASE /SECTION:.text,RWE %proj%.obj
; rem %cmpl%\bin\elink /MAP:%proj%.map /BASE:0x0400000 /DLL /FIXED:NO /SUBSYSTEM:WINDOWS /LIBPATH:%cmpl%\lib /DEF:%proj%.def %proj%.obj
; del *.obj
; rem del *.exp
; rem del *.lib

; rem ######################################################################