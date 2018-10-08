COMMENT *

AspackDie 1.41
--------------

Target: Aspack 2k/2k1/2.1/2.11/2.11c/2.11d/2.12/2.12a/2.12b/??1/??2/??3
(executables and libraries)

This unpacker doesn't unpack or decrypt anything by hand. It hooks
the 'GetProcAddress' calls of the loader. The 3rd one is the first call
of the Import Table handler, after which the exe is dumped (with untouched
Import Table and unpacked sections). I just have to past the original EntryPoint RVA
and the RVA of the original Import Table and I'm done :)...
Resource realigning is not really needed coz they are just splitted to 2 sections.

Internal stuff:
The way of realizing the Api hook stub is different for NT OSs because on NT I don't know of a simple
way to get shared memory...
This proggy has to use the debug APIs to unpack executables because on win2k the IAT isn't initialized
after creating a process in suspended mode :(
An other thing on win2k is that I need to make the debuggee load User32.dll because Aspack's IT doesn't
contain any user API's. User32 is needed for the SendMessage calls of the GetProcAddress stub.

Unpacking PE libraries is realized like this:
- Make a copy of the dll file to the windows temporary directory because the cleanup works to the raw file
  image seem to be a bit complicated.
- A BP (INT3) is written to the EntryPoint of the dll copy.
- On non-NT OSs an exception handler is installed by 'SetUnhandledExceptionFilter'. Because on NT
  exceptions in 'DllMain' are caught neither by SEH frames nor exception handlers being set by
  'SetUnhandledExceptionFilter', the 'KiUserExceptionDispatcher' is hooked and used as exception handler.
- The dll copy is loaded simply by 'LoadLibrary'. (Note that the whole dll image is accessable in the same
  memory context.)
- When the exception of the BP at the EntryPoint occurs, the BP will be wiped and the 'GetProcAddress'
  thunk will be overwritten with the address of our hook procedure.
- When 'DllMain' passes the third time control to the 'GetProcAddress' hook procedure, the library image
  is copied to a separate buffer and rebuilded analog to executable files with the exception that the
  module handle of the loaded dll is stamped into the dumped PE image as new ImageBase. This is needed
  because of the possibliy that the dll was realocated.

Pls report any ideas, comments and suggestions to LordPE@gmx.net.

yoda

*

.386
.model flat, stdcall
option casemap:none

INCLUDE    \masm32\include\kernel32.inc
INCLUDE    \masm32\include\user32.inc
INCLUDE    \masm32\include\comdlg32.inc
INCLUDE    \masm32\include\imagehlp.inc
INCLUDELIB \masm32\lib\kernel32.lib
INCLUDELIB \masm32\lib\user32.lib
INCLUDELIB \masm32\lib\comdlg32.lib
INCLUDELIB \masm32\lib\imagehlp.lib
INCLUDELIB ForceLibrary.lib

INCLUDE    \masm32\include\windows.inc
INCLUDE    ForceLibrary.INC
INCLUDELIB msvcrt.lib
INCLUDE    msvcrt.inc

;
; prototypes
;
UnpackDaFucker            PROTO :LPSTR
ProcessExecutable         PROTO
DumpAndSave               PROTO
DbgWndProc                PROTO :HWND,   :UINT,   :WPARAM, :LPARAM
DbgWindowProc             PROTO :LPVOID
CreateDbgWindow           PROTO
memset                    PROTO :LPVOID, :DWORD,  :DWORD
IsNT                      PROTO
PasteTradeMark            PROTO :LPVOID, :LPSTR
ProcessLibrary            PROTO
ExceptionHandler          PROTO :LPVOID
HandleEntryHookExct       PROTO :LPVOID
LibraryGetProcHook        PROTO
WriteFileByte             PROTO :LPSTR,  :DWORD,  :BYTE
DumpAndSaveLibrary        PROTO
FixPEImage                PROTO
MemToFile                 PROTO :LPSTR,  :LPVOID, :DWORD
ExtractFileName           PROTO :LPSTR,  :DWORD
GetFileExt                PROTO :LPSTR,  :DWORD
AssembleJump              PROTO :LPVOID, :LPVOID
HookKiUserExceptionDispatcher      PROTO :LPVOID
UnhookKiUserExceptionDispatcher    PROTO
GetSizeOfExtraData                 PROTO :LPVOID, :DWORD,  :LPVOID

;DEBUG_APIHOOK EQU 1

;------ STRUCTs ----------------------------------------------------------------------------------
APIHOOKSTUB STRUCT 1
	_PUSHAD                   DB 060h
  IFDEF DEBUG_APIHOOK
	_INT3                     DB 0CCh
  ENDIF
	_PUSH0                    DW 0006Ah
	_PUSH0_2                  DW 0006Ah
	_PUSHDW                   DB 068h
	_PUSHWM                   DD WM_DEBUGGEE_GETPROC_CALL
	_PUSHDW_2                 DB 068h
	_PUSHHWND                 DD ?			; debug window handle
	_MOVEAXDW                 DB 0B8h
	_MOVVAL                   DD ?			; address of SendMessage API
	_CALLEAX                  DW 0D0FFh
	_POPAD                    DB 061h
	_JMPDW                    DB 0E9h
	_JMPADDR                  DD ?			; jump related address of GetProcAddress API
APIHOOKSTUB ENDS

;------ CONST ---------------------------------------------------------------------------------
.CONST
D                         EQU DWORD PTR
W                         EQU WORD PTR
B                         EQU BYTE PTR
VA_SHARED                 EQU 08000000h			; Undocumented flag for "VirtualAlloc" to get shared memory
							; on 9x/ME
WM_DEBUGGEE_GETPROC_CALL  EQU WM_USER + "y"
DEPACK_WAIT_COUNT         EQU 3000
DEBUGGEE_KILL_VALUE       EQU 4321
OFN_SAVE_FLAGS            EQU OFN_FILEMUSTEXIST + OFN_PATHMUSTEXIST + OFN_LONGNAMES + OFN_EXPLORER + \
    					OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT
    					
szNtDll                   DB "NTDLL", 0
szKiUserExctDisp          DB "KiUserExceptionDispatcher", 0
szNtCont                  DB "NtContinue", 0
KUED_Entry1               DB 08Bh, 04Ch, 024h, 004h                   ; MOV ECX, [ESP + 4]  (4 bytes)
KUED_Entry2               DB 08Bh, 01Ch, 024h, 000h                   ; MOV EBX, [ESP]      (3 bytes)

szNoPromptArg             DB "/NO_PROMPT", 0

szCurDir                  DB ".",0
szFilter                  DB "EXE/DLL/OCX files", 0, "*.exe;*.dll;*.ocx", 0, "all files", 0, "*.*", 0, 0
szOfnAllFilter            DB "All files",0,"*.*",0,0
szOfnOpen                 DB "[AspackDie 1.41] by yoda - Select the target file...",0
szOfnSave                 DB "Select filename for saving...",0
szU32                     DB "USER32",0
szK32                     DB "KERNEL32",0
szGetProcAddress          DB "GetProcAddress",0
szSendMessage             DB "SendMessageA",0
szVAllocEx                DB "VirtualAllocEx", 0
szVFreeEx                 DB "VirtualFreeEx", 0
szWndCls                  DB "EVENT LOG WINDOW",0
szWndTitle                DB "AspackDie",0
szUnpacked                DB "unpacked.ExE",0
szUnpackedLib             DB "unpacked", 0                                     ; extension must be stamped
szLoadU32Err              DB "Couldn't force debuggee to load User32.dll :(",0
szSign                    DB "[AspackDie!]",0
szAP??                    DB "unsupported", 0
szAP2k                    DB "Aspack 2.000", 0
szAP2k1                   DB "Aspack 2.001", 0
szAP21                    DB "Aspack 2.1", 0
szAP211                   DB "Aspack 2.11", 0
szAP211cd                 DB "Aspack 2.11c/d", 0
szAP212                   DB "Aspack 2.12/2.12a/2.12b", 0
szAPU1                    DB "Aspack Unknown 1", 0
szAPU2                    DB "Aspack Unknown 2", 0
szAPU3                    DB "Aspack Unknown 3", 0

; user output strings
szShit                    DB "AspackDie - SHIT!",0
szSmile                   DB "AspackDie - :D",0
szInfo                    DB "AspackDie - Info", 0
szMapErr                  DB "Couldn't map file :(",0
szPeErr                   DB "Invalid PE file !",0
szRvaErr                  DB "RVA convertion error !", 0
szSigErr                  DB "Compressor version probably not support !", 13, 10
                          DB "Continue unpacking procedure ?", 0
szFindThunkErr            DB "Couldn't find 'GetProcAddress'-thunk :(",0
szProcCreateErr           DB "Error during process creation !",0
szApiStubMemErr           DB "Couldn't get memory for API hook stub :(",0
szIATFixErr               DB "Couldn't modify IAT :(",0
szMemErr                  DB "Not enough memory available !",0
szDumpErr                 DB "Couldn't read process memory :(",0
szFileCreateErr           DB "Couldn't create file :(",0
szUnknownErr              DB "Unknown error !",0
szNoEntryErr              DB "No EntryPoint defined in the PE Image !", 0
szUnpackDone              DB "File seems to be unpacked successfully.", 00Dh, 00Ah
                          DB "Compressor: %s", 00Dh, 00Ah
                          DB "Output: %s", 0               
szVFAEErr                 DB "The needed APIs VirtualAllocEx/VirtualFreeEx aren't available !", 0
szEntryBPErr              DB "Couldn't set BP on the EntryPoint of the raw PE image !", 0
;szEntryRestoreErr         DB "Couldn't restore the byte at the EntryPoint :(", 0
szEPITFixErr              DB "Couldn't fix EntryPoint RVA and ImportTable RVA !!!", 0
szDllCopyErr              DB "Error while copying the selected file to the temporary directory !", 0
szKUEDHookErr             DB "Couldn't hook KiUserExceptionDispatcher! Maybe NTDLL.DLL version unsupported.", 0
szXtrDatInfo              DB "AspackDie has found extra data at the end of the input file (size=%08lXh) ?", 00Dh, 00Ah
                          DB "Append it at the output file ?", 0
szXtrDatErr               DB "Error while writing extra data to the output file :(", 0

;------ DATA ----------------------------------------------------------------------------------
.DATA
cFname                    DB MAX_PATH DUP (0)
cDllCopyPath              DB MAX_PATH DUP (0)
cBuff                     DB MAX_PATH + 150 DUP (0)
ofn                       OPENFILENAME <SIZEOF OPENFILENAME>
pMap                      DD 0
dwMapSize                 DD 0
dwBytesRead               DD 0
dwBytesWritten            DD 0
pStub                     DD 0
dwStubSize                DD 0
pAspSecRva                DD 0
pNTH                      DD 0
pGetProcAddrThunkRva      DD 0
hInst                     DD 0
hDbgWnd                   DD 0
PI_                       PROCESS_INFORMATION <>
SI_                       STARTUPINFO <SIZEOF STARTUPINFO>
ApiHookStub               APIHOOKSTUB <>
dwApiCallCnt              DD 0
pDump                     DD 0
dwDumpSize                DD 0
pAspSecObj                DD 0
bNT                       DD 0
DB_                       DEBUG_EVENT <>
dwContStat                DD 0
dwBPCnt                   DD 0
dwEntryVa                 DD 0
dwEntryRva                DD 0
_VirtualAllocEx           DD 0
_VirtualFreeEx            DD 0
_GetProcAddress           DD 0
dwOrgExceptFilter         DD 0
dwDllBase                 DD 0
dwNewFSize                DD 0
bLibrary                  DD 0
pOrgKiUserExctDisp        DD ?
_NtContinue               DD ?
szAPVerStr                DD ?
dwcExtra                  DD ?                                       ; size of extra data
bAppendExtraData          DD ?
argv                      DD ?
argc                      DD ?
envp                      DD ?
szCmdIn                   DD ?                                       ; input  (from cmd line)
szCmdOut                  DD ?                                       ; output (from cmd line)
g_bNoPrompt               DD ?

;------ CODE ----------------------------------------------------------------------------------
.CODE

ShowError PROC szErrStr:LPSTR
        cmp     [g_bNoPrompt], TRUE
        jz      @@exit
        push    MB_ICONERROR
        push    offset szShit
        push    szErrStr
        push    0
        call    MessageBoxA
  @@exit:
        ret
ShowError ENDP

ShowInfo PROC szInfoStr:LPSTR
        cmp     [g_bNoPrompt], TRUE
        jz      @@exit
        push    MB_ICONINFORMATION
        push    offset szInfo
        push    szInfoStr
        push    0
        call    MessageBoxA
 @@exit:
        ret
ShowInfo ENDP

AskUser PROC szQuestion : LPSTR
        mov     eax, IDYES                                                               ; emulate a YES press
        cmp     [g_bNoPrompt], TRUE
        jz      @@exit
        push    MB_ICONWARNING or MB_YESNO
        push    offset szInfo
        push    szQuestion
        push    0
        call    MessageBoxA
  @@exit:
        ret
AskUser ENDP

Main:
	;-> some initialization works
	INVOKE GetModuleHandle, NULL
	MOV    hInst, EAX
	INVOKE IsNT
	MOV    bNT, EAX

	INVOKE LoadLibrary, OFFSET szK32
	XCHG   EAX, EBX                                                                  ; EBX -> kernel32 base
	INVOKE GetProcAddress, EBX, OFFSET szVAllocEx
	MOV    [_VirtualAllocEx], EAX
	INVOKE GetProcAddress, EBX, OFFSET szVFreeEx
	MOV    [_VirtualFreeEx], EAX	
	.IF bNT && (!_VirtualAllocEx || !_VirtualFreeEx) ; <- TODO
;		INVOKE MessageBox, 0, OFFSET szVFAEErr, OFFSET szShit, MB_ICONERROR
                invoke ShowError, OFFSET szVFAEErr
		JMP    @@Quit
	.ENDIF
	
	INVOKE GetProcAddress, EBX, OFFSET szGetProcAddress
	MOV    _GetProcAddress, EAX
	
	;-> command line handling
	INVOKE __getmainargs, OFFSET argc, OFFSET argv, OFFSET envp, FALSE, OFFSET dwBytesRead
	MOV    ECX, D [argc]                                                             ; ECX -> argc
	MOV    EDX, D [argv]                                                             ; EDX -> argv
	CMP    ECX, 1
	JZ     @F
	PUSH   [EDX + 4]
	POP    szCmdIn
	CMP    ECX, 3
	JL     @F
	PUSH   [EDX + 8]
	POP    szCmdOut
	; /NO_PROMPT in argument list ?
;	int    3
	cmp    ecx, 4
	jb     @F
	invoke lstrcmpi, offset szNoPromptArg, [edx + 12]
	or     eax, eax
	jnz    @F
	inc    eax
	mov    g_bNoPrompt, eax
  @@:
  	;-> input file path handling
	.IF !szCmdIn
		;-> get a file path
		MOV    ofn.lpstrFilter, OFFSET szFilter
		MOV    ofn.lpstrInitialDir, OFFSET szCurDir
		MOV    ofn.Flags, OFN_FILEMUSTEXIST + OFN_PATHMUSTEXIST + OFN_LONGNAMES + OFN_EXPLORER + \
	    					OFN_HIDEREADONLY
	    	MOV    ofn.lpstrFile, OFFSET cFname
	    	MOV    ofn.nMaxFile, SIZEOF cFname
	    	MOV    ofn.lpstrTitle, OFFSET szOfnOpen
		INVOKE GetOpenFileName, OFFSET ofn
		OR     EAX, EAX
		JZ     @@Quit
	.ELSE
		INVOKE lstrcpy, OFFSET cFname, szCmdIn
	.ENDIF
	PUSH   OFFSET cFname
	CALL   UnpackDaFucker
	
  @@Quit:	
	INVOKE ExitProcess, 0	
	
UnpackDaFucker PROC szFname : LPSTR
	;---- MAP THE FILE ----
	INVOKE CreateFile, szFname, GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
	INC    EAX
	JZ     @@MapErr
	DEC    EAX
	MOV    ESI, EAX										; ESI -> hFile
	INVOKE GetFileSize, EAX, NULL
	MOV    dwMapSize, EAX
	INVOKE VirtualAlloc, NULL, EAX, MEM_COMMIT, PAGE_EXECUTE_READWRITE
	OR     EAX, EAX
	.IF ZERO?
		INVOKE CloseHandle, ESI
		JMP    @@MapErr
	.ENDIF	
	MOV    pMap, EAX
	INVOKE ReadFile, ESI, EAX, dwMapSize, OFFSET dwBytesRead, NULL
	INVOKE CloseHandle, ESI
	
	;---- check "PE" ----
	INVOKE ImageNtHeader, pMap
	OR     EAX, EAX
	JZ     @@PeErr
	MOV    pNTH, EAX
	
	;---- GET THE ASPACK SECTION AND DO A SIGNATURE CHECK ! ----
	MOV    ESI, EAX
	ASSUME ESI : PTR IMAGE_NT_HEADERS							; ESI -> NT header
	PUSH   [ESI].OptionalHeader.SizeOfImage
	POP    dwDumpSize	
	MOV    EBX, [ESI].OptionalHeader.AddressOfEntryPoint                                    ; EBX -> EntryPoint Rva
	.IF !EBX
		JMP @@NoEntryErr
	.ENDIF
	MOV    dwEntryRva, EBX
	INVOKE ImageRvaToSection, ESI, pMap, EBX
	.IF !EAX
		JMP @@RvaConvErr
	.ENDIF
	MOV    EDI, EAX
	SUB    EAX, pMap
	MOV    pAspSecObj, EAX
	ASSUME EDI : PTR IMAGE_SECTION_HEADER							; EDI -> section header
	PUSH   [EDI].VirtualAddress
	POP    pAspSecRva
	
	; check for NOP, PUSHAD at the start of the aspack section
	MOV    EBX, pMap									; EBX -> asp section base
	ADD    EBX, [EDI].PointerToRawData
	CMP    W [EBX], 06090h
	JZ     @F
;	INVOKE MessageBox, 0, OFFSET szSigErr, OFFSET szShit, MB_ICONWARNING OR MB_YESNO
        invoke AskUser, OFFSET szSigErr
	CMP    EAX, IDNO
	JZ     @@ExitProc1	
  @@:
	
	;---- GET ADDRESS OF THE "GetProcAddress" THUNK ----
	PUSH   EBX
	PUSH   EDI
	PUSH   ESI
	MOV    pGetProcAddrThunkRva, 0
	INVOKE ImageRvaToVa, ESI, pMap, [ESI].OptionalHeader.DataDirectory[8].VirtualAddress, NULL
	.IF !EAX
		JMP @@RvaConvErr
	.ENDIF
	MOV    EBX, EAX
	ASSUME EBX : PTR IMAGE_IMPORT_DESCRIPTOR
	.WHILE [EBX].FirstThunk
		;-> scan the thunk chain
		MOV    EDI, [EBX].FirstThunk						; EDI -> real IAT pointer
		MOV    ESI, [EBX].OriginalFirstThunk					; ESI -> IT data pointer
		.IF !ESI
			MOV    ESI, EDI
		.ENDIF
		
		;-> get image pointers
		INVOKE ImageRvaToVa, pNTH, pMap, ESI, NULL
		OR     EAX, EAX
		JZ     @@SkipIID
		MOV    ESI, EAX
		.WHILE D [ESI]
			INVOKE ImageRvaToVa, pNTH, pMap, D [ESI], NULL
			OR     EAX, EAX
			JZ     @@SkipThunk
			ADD    EAX, 2
			;-> Is it the right thunk ?
			INVOKE lstrcmp, EAX, OFFSET szGetProcAddress
			OR     EAX, EAX
			.IF ZERO?
				MOV    pGetProcAddrThunkRva, EDI
			.ENDIF
		  @@SkipThunk:
			ADD    ESI, 4
			ADD    EDI, 4
		.ENDW
		
	  @@SkipIID:
	  	ADD    EBX, SIZEOF IMAGE_IMPORT_DESCRIPTOR	  
	.ENDW	
	ASSUME EBX : NOTHING
	POP    ESI
	POP    EDI
	POP    EBX
	CMP    pGetProcAddrThunkRva, 0
	JZ     @@FindThunkErr

	;---- CHECK FOR LIBRARY CHARACTERISTIC FLAG AND GO ON ----
	MOVZX  EAX, [ESI].FileHeader.Characteristics
	AND    EAX, 02000h
	.IF EAX
	     MOV  bLibrary, TRUE
	     CALL ProcessLibrary
	.ELSEIF
	     CALL ProcessExecutable
	.ENDIF	
	
	;---- CLEAN UP ----
  @@ExitProc1:
	INVOKE VirtualFree, pMap, dwMapSize, MEM_DECOMMIT
  @@ExitProc:
	RET
  
        ;---- ERROR MESSAGES ----
  @@MapErr:
;  	INVOKE MessageBox, 0, OFFSET szMapErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szMapErr
  	JMP    @@ExitProc
  @@PeErr:
;  	INVOKE MessageBox, 0, OFFSET szPeErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szPeErr
  	JMP    @@ExitProc1
  @@FindThunkErr:
;  	INVOKE MessageBox, 0, OFFSET szFindThunkErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szFindThunkErr
  	JMP    @@ExitProc1
  @@NoEntryErr:
;  	INVOKE MessageBox, 0, OFFSET szNoEntryErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szNoEntryErr
  	JMP    @@ExitProc1
  @@RvaConvErr:
;  	INVOKE MessageBox, 0, OFFSET szRvaErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szRvaErr
  	JMP    @@ExitProc1
UnpackDaFucker ENDP

;
; Regs:
; ESI - NT header
; EDI - section header
;
ProcessExecutable PROC
	;---- CREATE A NEW PROCESS ----
	INVOKE CreateProcess, OFFSET cFname, NULL, NULL, NULL, FALSE, \
	         CREATE_SUSPENDED OR DEBUG_PROCESS OR DEBUG_ONLY_THIS_PROCESS, \
		 NULL, NULL, OFFSET SI_, OFFSET PI_
	OR     EAX, EAX
	JZ     @@ProcCreateErr
	
	;---- GET MEMORY, CREATE DEBUG WINDOW, AND CREATE API STUB ----
	MOV    dwStubSize, SIZEOF APIHOOKSTUB
	.IF !bNT
		INVOKE VirtualAlloc, NULL, dwStubSize, MEM_COMMIT OR VA_SHARED, PAGE_EXECUTE_READWRITE
	.ELSE
	        PUSH   PAGE_EXECUTE_READWRITE
	        PUSH   MEM_COMMIT
	        PUSH   dwStubSize
	        PUSH   NULL
	        PUSH   PI_.hProcess
		CALL   _VirtualAllocEx
	.ENDIF
	OR     EAX, EAX
	.IF ZERO?
		INVOKE CloseHandle, PI_.hProcess
		INVOKE CloseHandle, PI_.hThread
		INVOKE TerminateProcess, PI_.hProcess, DEBUGGEE_KILL_VALUE
		JMP    @@ApiStubMemErr
	.ENDIF
	MOV    pStub, EAX
	
	CALL   CreateDbgWindow
	
	PUSH   hDbgWnd
	POP    ApiHookStub._PUSHHWND
	INVOKE GetModuleHandle, OFFSET szU32
	INVOKE GetProcAddress, EAX, OFFSET szSendMessage
	MOV    ApiHookStub._MOVVAL, EAX
	;INVOKE GetModuleHandle, OFFSET szK32
	;INVOKE GetProcAddress, EAX, OFFSET szGetProcAddress
	MOV    EAX, _GetProcAddress
	SUB    EAX, pStub
	SUB    EAX, OFFSET ApiHookStub._JMPADDR - OFFSET ApiHookStub._PUSHAD + 4
	MOV    ApiHookStub._JMPADDR, EAX

	.IF !bNT
		;-> copy hook stub structure to allocated shared memory
		PUSH   ESI
		PUSH   EDI
		MOV    ESI, OFFSET ApiHookStub
		MOV    EDI, pStub
		MOV    ECX, SIZEOF ApiHookStub
	  	REP    MOVSB
	  	POP    EDI
	  	POP    ESI
	.ELSE
		;-> write hook stub to memory in the debuggee's process memory
		INVOKE WriteProcessMemory, PI_.hProcess, pStub, OFFSET ApiHookStub, SIZEOF APIHOOKSTUB,\
			OFFSET dwBytesWritten
	.ENDIF

  	;---- EXECUTE MAIN THREAD ----
  	INVOKE ResumeThread, PI_.hThread
  	
  	;---- ENTER DEBUG LOOP ----
  	MOV    dwBPCnt, 0
  	MOV    EAX, [ESI].OptionalHeader.ImageBase
  	ADD    EAX, dwEntryRva
  	MOV    dwEntryVa, EAX
 	
  	.WHILE TRUE
  		INVOKE WaitForDebugEvent, OFFSET DB_, INFINITE
  		OR     EAX, EAX
  		.IF ZERO?
  			.BREAK
  		.ENDIF
  		MOV   dwContStat, DBG_EXCEPTION_NOT_HANDLED
  		
  		.IF DB_.dwDebugEventCode == EXCEPTION_DEBUG_EVENT
  			.IF DB_.u.Exception.pExceptionRecord.ExceptionCode == EXCEPTION_BREAKPOINT
  				INC    dwBPCnt
  				.IF dwBPCnt == 1
  					INVOKE TrapEntry, dwEntryVa, OFFSET PI_
  					OR     EAX, EAX
  					JZ     @@LoadU32Err
  					
  				.ELSEIF dwBPCnt == 2
  					INVOKE ForceLibraryDBG, OFFSET szU32, dwEntryVa, OFFSET PI_
  					OR     EAX, EAX
  					JZ     @@LoadU32Err
  					
  				.ELSEIF dwBPCnt == 3
  					INVOKE PerformCleanup, dwEntryVa, OFFSET PI_
  					OR     EAX, EAX
  					JZ     @@LoadU32Err
  					
				  	;---- HOOK IAT ----
				  	MOV    EDX, [ESI].OptionalHeader.ImageBase
				  	ADD    EDX, pGetProcAddrThunkRva
				  	INVOKE WriteProcessMemory, PI_.hProcess, EDX, OFFSET pStub, 4, OFFSET dwBytesWritten
				  	OR     EAX, EAX
				  	.IF ZERO?
						JMP    @@IATFixErr
				  	.ENDIF
  				.ENDIF
  				MOV    dwContStat, DBG_CONTINUE
  			.ENDIF
  			
  		.ELSEIF DB_.dwDebugEventCode == EXIT_PROCESS_DEBUG_EVENT
  			.IF DB_.u.ExitProcess.dwExitCode != DEBUGGEE_KILL_VALUE  ; did we kill the process ?
  				.BREAK
  			.ENDIF
		.ENDIF
  		INVOKE ContinueDebugEvent, DB_.dwProcessId, DB_.dwThreadId, dwContStat
  	.ENDW
  	
  	; -- UNKNOWN ERROR --
;  	INVOKE MessageBox, 0, OFFSET szUnknownErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szUnknownErr
  	
  @@ExitProc2:
	INVOKE TerminateProcess, PI_.hProcess, DEBUGGEE_KILL_VALUE
	.IF !bNT
		INVOKE VirtualFree, pStub, dwStubSize, MEM_DECOMMIT
	.ELSE
	        PUSH   MEM_DECOMMIT
	        PUSH   dwStubSize
	        PUSH   pStub
	        PUSH   PI_.hProcess
		CALL   _VirtualFreeEx
	.ENDIF
	INVOKE CloseHandle, PI_.hProcess
	INVOKE CloseHandle, PI_.hThread 	  	
	
        ;---- ERROR MESSAGES ----	
  @@ExitProc1:
  	RET	
  @@ProcCreateErr:
;  	INVOKE MessageBox, 0, OFFSET szProcCreateErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szProcCreateErr
  	JMP    @@ExitProc1
  @@ApiStubMemErr:
;  	INVOKE MessageBox, 0, OFFSET szApiStubMemErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szApiStubMemErr
  	JMP    @@ExitProc1
  @@IATFixErr:
;  	INVOKE MessageBox, 0, OFFSET szIATFixErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szIATFixErr
  	JMP    @@ExitProc2
  @@LoadU32Err:
;  	INVOKE MessageBox, 0, OFFSET szLoadU32Err, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szLoadU32Err
  	JMP    @@ExitProc2
ProcessExecutable ENDP

DumpAndSave PROC
	ASSUME EDI : PTR IMAGE_SECTION_HEADER
	ASSUME ESI : PTR IMAGE_NT_HEADERS
	
  	;---- DUMP THE PROCESS AND KILL IT ----
  	INVOKE SuspendThread, PI_.hThread
  	INVOKE ImageNtHeader, pMap
  	MOV    ESI, EAX
  	;-> free api stub memory
  	.IF !bNT
		INVOKE VirtualFree, pStub, dwStubSize, MEM_DECOMMIT
	.ELSE
		PUSH   MEM_DECOMMIT
		PUSH   dwStubSize
		PUSH   pStub
		PUSH   PI_.hProcess
		CALL   _VirtualFreeEx
	.ENDIF
	;PUSH   [ESI].OptionalHeader.SizeOfImage
	;POP    dwDumpSize
	INVOKE GlobalAlloc, GPTR, dwDumpSize
	OR     EAX, EAX
	.IF ZERO?
		INVOKE CloseHandle, PI_.hProcess
		INVOKE CloseHandle, PI_.hThread
		INVOKE TerminateProcess, PI_.hProcess, DEBUGGEE_KILL_VALUE
		JMP    @@MemErr
	.ENDIF
	MOV    pDump, EAX
	INVOKE ReadProcessMemory, PI_.hProcess, [ESI].OptionalHeader.ImageBase, pDump, dwDumpSize, OFFSET dwBytesRead
	OR     EAX, EAX
	.IF ZERO?
		INVOKE GlobalFree, pDump
		INVOKE TerminateProcess, PI_.hProcess, DEBUGGEE_KILL_VALUE
		INVOKE CloseHandle, PI_.hProcess
		INVOKE CloseHandle, PI_.hThread
		JMP    @@DumpErr
	.ENDIF
	INVOKE TerminateProcess, PI_.hProcess, DEBUGGEE_KILL_VALUE
	INVOKE CloseHandle, PI_.hProcess
	INVOKE CloseHandle, PI_.hThread
	
        ;---- REBUILDING ----	
	INVOKE FixPEImage
        
        ;---- SAVE THE EXE IMAGE TO DISK ----
	;-> build output path
	.IF !szCmdOut
        	INVOKE ExtractFileName, OFFSET cFname, SIZEOF cFname
        	INVOKE lstrcpy, EAX, OFFSET szUnpacked
        .ELSE
        	INVOKE lstrcpy, OFFSET cFname, szCmdOut
        .ENDIF
        ;-> save image to disk
	INVOKE MemToFile, OFFSET cFname, pDump, dwNewFSize
	TEST   EAX, EAX
	.IF ZERO?
;		INVOKE MessageBox, 0, OFFSET szFileCreateErr, OFFSET szShit, MB_ICONERROR
                invoke ShowError, OFFSET szFileCreateErr
		JMP    SkipFileSaving
	.ENDIF
	;-> success msg
	INVOKE wsprintf, OFFSET cBuff, OFFSET szUnpackDone, szAPVerStr, OFFSET cFname
;      	INVOKE MessageBox, 0, OFFSET cBuff, OFFSET szSmile, MB_ICONINFORMATION
        invoke ShowInfo, offset cBuff
       	
  SkipFileSaving:
	INVOKE GlobalFree, pDump
	
	;---- CLEAN UP ----
  @@ExitProc1:
	INVOKE VirtualFree, pMap, dwMapSize, MEM_DECOMMIT
  @@ExitProc:
	RET
	
;---- ERROR MESSAGES ----
  @@MemErr:
;  	INVOKE MessageBox, 0, OFFSET szMemErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szMemErr
  	JMP    @@ExitProc1
  @@DumpErr:
;  	INVOKE MessageBox, 0, OFFSET szDumpErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szDumpErr
  	JMP    @@ExitProc1
  @@RvaConvErr:
;  	INVOKE MessageBox, 0, OFFSET szRvaErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szRvaErr
  	JMP    SkipFileSaving
DumpAndSave ENDP

DbgWndProc PROC USES ESI EDI EBX, hWnd : HWND, Msg : UINT, wParam : WPARAM, lParam : LPARAM
	.IF Msg == WM_CLOSE
		INVOKE DestroyWindow, hWnd
		JMP    @@ExitProc
		
	.ELSEIF Msg == WM_CREATE
		XOR    EAX, EAX
		MOV    dwApiCallCnt, EAX
		
	.ELSEIF Msg == WM_DEBUGGEE_GETPROC_CALL  ; Debuggee is calling "GetProcAddress"
		INC    dwApiCallCnt
		.IF dwApiCallCnt == 3
			CALL   DumpAndSave
			INVOKE ExitProcess, 0
		.ENDIF	
	.ENDIF	
	INVOKE DefWindowProc, hWnd, Msg, wParam, lParam
  @@ExitProc:
	RET
DbgWndProc ENDP

DbgWindowProc PROC pArg : LPVOID
	LOCAL wc   : WNDCLASS
	LOCAL msg  : MSG

	;---- CREATE WINDOW ----
	INVOKE memset, ADDR wc, SIZEOF wc, 0
	MOV    wc.style, CS_HREDRAW OR CS_VREDRAW
	MOV    wc.lpfnWndProc, OFFSET DbgWndProc
	MOV    wc.hbrBackground, COLOR_WINDOW
	MOV    wc.lpszClassName, OFFSET szWndCls
	PUSH   hInst
	POP    wc.hInstance
	INVOKE RegisterClass, ADDR wc
	INVOKE CreateWindowEx, NULL, OFFSET szWndCls, OFFSET szWndTitle, WS_OVERLAPPED, 0, 0, 100, 100, NULL, 0, hInst, NULL
	MOV    hDbgWnd, EAX
	
	;---- MSG LOOP ----
	.WHILE TRUE
		INVOKE GetMessage, ADDR msg, NULL, 0, 0
		OR     EAX, EAX
		JZ     @@ExitMsgLoop
		INVOKE TranslateMessage, ADDR msg
		INVOKE DispatchMessage, ADDR msg
	.ENDW
  @@ExitMsgLoop:	
	RET
DbgWindowProc ENDP

CreateDbgWindow PROC 
	LOCAL dwThId : DWORD

	INVOKE CreateThread, NULL, 0, OFFSET DbgWindowProc, NULL, 0, ADDR dwThId
	INVOKE WaitForSingleObject, EAX, 500 ; wait a bit until the new thread created the window
	RET
CreateDbgWindow ENDP

memset PROC USES EDI ECX, pAddr : LPVOID, dwSize : DWORD, dwByte : DWORD
	;-> zero buffer
	MOV    EDI, pAddr
	MOV    ECX, dwSize
	MOV    EAX, dwByte
      @@ZeroLoop:
        STOSB
        LOOP   @@ZeroLoop	
	RET
memset ENDP

; returns TRUE if a NT OS is present else FALSE
IsNT PROC USES ECX EDX
	INVOKE GetVersion
	SHR    EAX, 31
	XOR    EAX, 1
	RET
IsNT ENDP

PasteTradeMark PROC USES ECX EDI ESI, pPE : LPVOID, szTradeMark : LPSTR
	INVOKE ImageNtHeader, pPE
	OR     EAX, EAX
	JZ     @@ExitProc
	LEA    EDI, (IMAGE_NT_HEADERS PTR [EAX]).FileHeader.TimeDateStamp
	MOV    ESI, szTradeMark
	INVOKE lstrlen, szTradeMark
	MOV    ECX, EAX
	REP    MOVSB
  @@ExitProc:
	RET
PasteTradeMark ENDP

;
; Regs:
; ESI - NT header
; EDI - section header
;
ProcessLibrary PROC
	;---- COPY DLL TO THE WINDOWS TEMOPARY DIRECTORY ----
	INVOKE GetTempPath, SIZEOF cDllCopyPath, OFFSET cDllCopyPath
	INVOKE ExtractFileName, OFFSET cFname, SIZEOF cFname
	INVOKE lstrcat, OFFSET cDllCopyPath, EAX
	INVOKE CopyFile, OFFSET cFname, OFFSET cDllCopyPath, FALSE
	OR     EAX, EAX
	JZ     @@DllCopyErr
	
	;---- SET BP ON ENTRY ----
	MOV    EBX, dwEntryRva                                                           ; EBX -> Entry RVA
	INVOKE ImageRvaToSection, ESI, pMap, EBX                                         ; EAX -> Entry Section
	SUB    EBX, [EAX].IMAGE_SECTION_HEADER.VirtualAddress
	ADD    EBX, [EAX].IMAGE_SECTION_HEADER.PointerToRawData                          ; EBX -> Entry Offset
	INVOKE WriteFileByte, OFFSET cDllCopyPath, EBX, 0CCh
	OR     EAX, EAX
	JZ     @@EntryBPErr
	
	;---- INSTALL EXCEPTION HANDLER AND LOAD DLL ----
	;-> install exception handler
	.IF bNT == TRUE
		LEA    EAX, [OFFSET KUED_Hook]
		INVOKE HookKiUserExceptionDispatcher, EAX
		OR     EAX, EAX
		JZ     @@KUEDHookErr
	.ELSE
		INVOKE SetUnhandledExceptionFilter, OFFSET ExceptionHandler
		MOV    dwOrgExceptFilter, EAX
	.ENDIF
	;-> load dll copy
	;INT    3
	INVOKE LoadLibrary, OFFSET cDllCopyPath
	
	;
	;... UNKNOWN ERROR (this code should never be reached)
	INVOKE FreeLibrary, EAX
	.IF bNT == TRUE
		INVOKE UnhookKiUserExceptionDispatcher
	.ELSE
		INVOKE SetUnhandledExceptionFilter, dwOrgExceptFilter
	.ENDIF
		
;        INVOKE  MessageBox, 0, OFFSET szUnknownErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szUnknownErr

  @@ExitProc:
	RET
  @@EntryBPErr:
;  	INVOKE MessageBox, 0, OFFSET szEntryBPErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szEntryBPErr
  	JMP    @@ExitProc
  @@DllCopyErr:
;  	INVOKE MessageBox, 0, OFFSET szDllCopyErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szDllCopyErr
  	JMP    @@ExitProc
  @@KUEDHookErr:
;  	INVOKE MessageBox, 0, OFFSET szKUEDHookErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szKUEDHookErr
  	JMP    @@ExitProc
ProcessLibrary ENDP

;
; exception handler for unpacking dlls on Win9x
;
ExceptionHandler PROC USES EBX EDI ESI, pExcPtrs : LPVOID
	LOCAL dwRet   : DWORD
	LOCAL dwBuff  : DWORD
	
	;INT    3
	MOV    dwRet, EXCEPTION_CONTINUE_SEARCH                                          ; Result = unhandled exception
	
	;-> handle our entry hack	
	MOV    EAX, pExcPtrs
	INVOKE HandleEntryHookExct, [EAX].EXCEPTION_POINTERS.pExceptionRecord
	OR     EAX, EAX
	JZ     @F
	
	;-> reset old exception handler
	INVOKE SetUnhandledExceptionFilter, dwOrgExceptFilter
	
	MOV    dwRet, EXCEPTION_EXECUTE_HANDLER                                          ; Result = handled exception
  @@:
  	MOV    EAX, dwRet                                                                ; EAX -> Result
	RET
ExceptionHandler ENDP

;
; exception handler for unpacking dlls on NT
;
; Stack:
; [ESP]      - struct EXCEPTION_RECORD*   \
; [ESP + 4]  - struct _CONTEXT*           -  struct _EXCEPTION_POINTERS
; (no return address !)
;
KUED_Hook:
	;INT    3
	;-> overwritten code from KUED entry
	MOV    ECX, [ESP + 4]                                                       ; ECX = struct _CONTEXT*
	MOV    EBX, [ESP]                                                           ; EBX = struct EXCEPTION_RECORD*
	
	;-> handle our entry hack
	INVOKE HandleEntryHookExct, EBX
	OR     EAX, EAX
	JZ     @F
	
	;-> unhook KiUserExceptionDispatcher
	CALL   UnhookKiUserExceptionDispatcher
	
	;-> increment EIP and call "NtContinue" - handle exception
	ADD    [ECX].CONTEXT.regEip, 1
	PUSH   0
	PUSH   ECX
	CALL   _NtContinue
  @@:
	;-> KUED jump
	MOV    EAX, pOrgKiUserExctDisp
	ADD    EAX, 7
	JMP    EAX

;
; Returns:
; TRUE - if the exception fits to the BP at the entry and the dll image was patched successfully
;
HandleEntryHookExct PROC USES EBX ECX EDX EDI ESI, pExceptionRecord : LPVOID
	LOCAL  dwBuff : DWORD
	
	SUB    ESI, ESI                                                                  ; ESI -> Result

	;---- IS IT THE EXCEPTION OF THE BP AT THE DLL ENTRYPOINT ? ----
	;-> check exception type
	MOV    EBX, pExceptionRecord                                                     ; EBX -> PEXCEPTION_RECORD
	CMP    [EBX].EXCEPTION_RECORD.ExceptionCode, EXCEPTION_BREAKPOINT
	JNZ    @F
	;-> check exception address
	INVOKE GetModuleHandle, OFFSET cDllCopyPath
	MOV    dwDllBase, EAX
	MOV    EDI, EAX                                                                  ; EDI -> dll base (maybe relocated)
	ADD    EAX, dwEntryRva
	PUSH   EAX                                                                       ; EAX -> ptr to EntryPoint
	.IF bNT == FALSE                                    ; in the unhandled exception filter (Win9x) it's
		INC EAX                                     ; exception_address + 1 !
	.ENDIF
	CMP    EAX, [EBX].EXCEPTION_RECORD.ExceptionAddress
	POP    EAX
	JNZ    @F
	
	;---- WIPE BP + HOOK THE GetProcAddress THUNK IN THE DLL IMAGE IN THE MEMORY ----
	;-> wipe EntryPoint BP
	MOV    EBX, EAX
	INVOKE VirtualProtect, EBX, 1, PAGE_EXECUTE_READWRITE, ADDR dwBuff
	MOV    B [EBX], 060h
	
	;-> hook GetProcAddress
	MOV    EDX, pGetProcAddrThunkRva
	LEA    EBX, [EDX + EDI]                                                          ; EBX -> ptr to GetProcAddress thunk
	INVOKE VirtualProtect, EBX, 4, PAGE_EXECUTE_READWRITE, ADDR dwBuff
	MOV    D [EBX] , OFFSET LibraryGetProcHook
	
	;-> OK
	INC    ESI
  @@:
  	MOV    EAX, ESI
  	RET
HandleEntryHookExct ENDP

LibraryGetProcHook PROC
	;INT    3
	INC    dwBPCnt
	.IF dwBPCnt == 3
		CALL   DumpAndSaveLibrary
		INVOKE ExitProcess, 0	
	.ENDIF
	JMP    _GetProcAddress
LibraryGetProcHook ENDP

;
; Returns: BOOL
;
WriteFileByte PROC USES EBX ECX EDX EDI ESI, szFilePath : LPSTR, dwOffset : DWORD, by : BYTE
	LOCAL dwBuff : DWORD
	
	XOR    ESI, ESI                                                                  ; ESI = result
	INVOKE CreateFile, szFilePath, GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, \
	    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
	MOV    EDI, EAX                                                                  ; EDI -> file handle
	INC    EAX
	JZ     @@ExitProc
	INVOKE SetFilePointer, EDI, dwOffset, NULL, FILE_BEGIN
	INC    EAX
	JZ     @@ExitProc1
	INVOKE WriteFile, EDI, ADDR by, 1, ADDR dwBuff, NULL
	DEC    EAX
	JNZ    @@ExitProc1
	INC    ESI                                                                       ; OK !
  @@ExitProc1:
	INVOKE CloseHandle, EDI
  @@ExitProc:
  	XCHG    ESI, EAX                                                                 ; EAX -> result
	RET
WriteFileByte ENDP

DumpAndSaveLibrary PROC
	;---- COPY LIBRARY MEMORY TO BUFFER ----
	INVOKE VirtualAlloc, NULL, dwDumpSize, MEM_COMMIT, PAGE_EXECUTE_READWRITE
	OR     EAX, EAX
	JZ     @@NoMemErr
	MOV    pDump, EAX
	MOV    ECX, dwDumpSize
	MOV    ESI, dwDllBase
	MOV    EDI, EAX
	REP    MOVSB	
	
        ;---- REBUILDING ----
        INVOKE FixPEImage
        
        ;---- SAVE THE EXE IMAGE TO DISK ----
	;-> build output path
	.IF !szCmdOut
	        INVOKE GetFileExt, OFFSET cFname, SIZEOF cFname
	        .IF EAX != NULL
	        	INVOKE lstrcpy, OFFSET cDllCopyPath, EAX                       ; cDllCopyPath -> input file ext
	        .ELSE
	        	MOV B [cDllCopyPath], 0                                        ; lstrcat shouldn't fail later
	        .ENDIF
	        INVOKE ExtractFileName, OFFSET cFname, SIZEOF cFname
	        INVOKE lstrcpy, EAX, OFFSET szUnpackedLib
	        INVOKE lstrcat, OFFSET cFname, OFFSET cDllCopyPath
	.ELSE
		INVOKE lstrcpy, OFFSET cFname, szCmdOut
	.ENDIF
  @@:
	;-> save image to disk
        INVOKE MemToFile, OFFSET cFname, pDump, dwNewFSize
        TEST   EAX, EAX
        .IF ZERO?
;        	INVOKE MessageBox, 0, OFFSET szFileCreateErr, OFFSET szShit, MB_ICONERROR
                invoke ShowError, OFFSET szFileCreateErr
        	JMP    @F
        .ENDIF
        ;-> success msg
        INVOKE wsprintf, OFFSET cBuff, OFFSET szUnpackDone, szAPVerStr, OFFSET cFname
;        INVOKE MessageBox, 0, OFFSET cBuff, OFFSET szSmile, MB_ICONINFORMATION
        invoke ShowInfo, OFFSET cBuff
  @@:                  
	;-> Cleanup        
	INVOKE VirtualFree, pDump, dwMapSize, MEM_DECOMMIT
	INVOKE VirtualFree, pMap, dwMapSize, MEM_DECOMMIT
        
  @@ExitProc:
	RET
  @@NoMemErr:
;  	INVOKE MessageBox, 0, OFFSET szMemErr, OFFSET szShit, MB_ICONERROR
        invoke ShowError, OFFSET szMemErr
  	JMP    @@ExitProc
DumpAndSaveLibrary ENDP

;
; Input:
; pDump   - ptr to dumped PE image
;
FixPEImage PROC USES EBX ECX EDX EDI ESI
	LOCAL dwEPRva    : DWORD
	LOCAL dwITRva    : DWORD
	
	;---- FIX IAT RVA AND EP !!! ----
	INVOKE ImageNtHeader, pDump
	;-> find asp section
	MOV    ESI, EAX									; ESI -> NT header of dumped image
	MOV    EDI, pAspSecObj
	ADD    EDI, pDump                                                               ; EDI -> ".aspack" section header
	MOV    EBX, pDump
	ADD    EBX, [EDI].VirtualAddress						; EBX -> dumped image (asp object)
	
	;---- DLL: STAMP CURRENT IMAGEBASE (MAYBE THE DLL WAS RELOCATED) ----
	.IF bLibrary == TRUE
		PUSH   dwDllBase
		POP    [ESI].OptionalHeader.ImageBase
	.ENDIF
	
;	INT    3
	
	.IF B [EBX + 2] == 0E9h         	     ; Aspack 2.11
		PUSH   D [EBX + 07Dh]
		POP    dwEPRva
		PUSH   D [EBX + 081h]
		POP    dwITRva
		MOV    szAPVerStr, OFFSET szAP211
		
	.ELSEIF D [EBX + 03B2h] == 0000001B8h        ; Aspack 2.12
	        PUSH   D [EBX + 039Bh]
	        POP    dwEPRva
	        PUSH   D [EBX + 0279h]
	        POP    dwITRva
	        MOV    szAPVerStr, OFFSET szAP212
	        
        .ELSEIF D [EBX + 03B3h] == 0000001B8h        ; Aspack Unknown3
                PUSH   D [EBX + 039Ch]
                POP    dwEPRva
                PUSH   D [EBX + 027Ah]
                POP    dwITRva
                MOV    szAPVerStr, OFFSET szAPU3

	.ELSEIF D [EBX + 04F4h] == 0000001B8h        ; Aspack 2.000
		PUSH   D [EBX + 0D2h]
		POP    dwEPRva
		PUSH   D [EBX + 0CEh]
		POP    dwITRva
		MOV    szAPVerStr, OFFSET szAP2k
		
	.ELSEIF D [EBX + 04F6h] == 0000001B8h && \   ; Aspack 2.001
	        D [EBX + 04DFh] == 000442A4Eh
		PUSH   D [EBX + 0D2h]
		POP    dwEPRva
		PUSH   D [EBX + 0CEh]
		POP    dwITRva
		MOV    szAPVerStr, OFFSET szAP2k1
	        
	.ELSEIF D [EBX + 04F6h] == 0000001B8h && \   ; Aspack 2.1
	        D [EBX + 04DFh] == 000443A02h
		PUSH   D [EBX + 0D2h]
		POP    dwEPRva
		PUSH   D [EBX + 02Ch]
		POP    dwITRva
		MOV    szAPVerStr, OFFSET szAP21
	        
	.ELSEIF D [EBX + 04F6h] == 0000001B8h && \   ; Aspack Unknown2
	        D [EBX + 04DFh] == 0004439FDh
		PUSH   D [EBX + 0CDh]
		POP    dwEPRva
		PUSH   D [EBX + 02Ch]
		POP    dwITRva
		MOV    szAPVerStr, OFFSET szAPU2        
	        
	.ELSEIF W [EBX + 03BAh] == 07561h            ; Aspack Unknown1
		PUSH   D [EBX + 08Dh]
		POP    dwEPRva
		PUSH   D [EBX + 091h]
		POP    dwITRva
		MOV    szAPVerStr, OFFSET szAPU1
	        
	.ELSEIF B [EBX + 2] == 0E8h		     ; Aspack 2.11c/1.11d
		PUSH   D [EBX + 08Dh]
		POP    D dwITRva
		PUSH   D [EBX + 03A1h]
		POP    D dwEPRva
		MOV    szAPVerStr, OFFSET szAP211cd
	.ELSE
	        ; unsupported version (debugging purposes)
		MOV    dwITRva, 0FFFFFFFFh
		MOV    dwEPRva, 0FFFFFFFFh
;		INVOKE MessageBox, 0, OFFSET szEPITFixErr, OFFSET szShit, MB_ICONERROR
                invoke ShowError, OFFSET szEPITFixErr
		MOV    szAPVerStr, OFFSET szAP??
	.ENDIF

	PUSH   dwEPRva
	POP    D [ESI].OptionalHeader.AddressOfEntryPoint
	PUSH   dwITRva
	POP    D [ESI].OptionalHeader.DataDirectory[8].VirtualAddress
	
	;---- FIX SECTION TABLE ----
	MOV    EDI, ESI
	ADD    EDI, 0F8h
	MOVZX  EDX, [ESI].FileHeader.NumberOfSections
	
	OR     [EDI].Characteristics, 0E0000060h                               ; add executable flags to 1st section
	
	.WHILE EDX
		PUSH   [EDI].VirtualAddress
        	POP    [EDI].PointerToRawData
        	PUSH   [EDI].Misc.VirtualSize
        	POP    [EDI].SizeOfRawData
        	ADD    EDI, SIZEOF IMAGE_SECTION_HEADER
        	DEC    EDX
        .ENDW
        
        ;---- WIPE ASPACK DATA SECTION ----
        ; ...the code section contains sometimes a TLS table backup or several resource shit therefore we simply don't
        ; wipe it
        MOV    EDI, pAspSecObj
        ADD    EDI, pDump
        ADD    EDI, SIZEOF IMAGE_SECTION_HEADER							; EDI -> aspack data section
        DEC    [ESI].FileHeader.NumberOfSections  
        
        ;-> fix ImageSize
        MOV    EBX, [EDI].SizeOfRawData
        SUB    [ESI].OptionalHeader.SizeOfImage, EBX
        PUSH   [ESI].OptionalHeader.SizeOfImage
        POP    dwNewFSize
        
        ;---- HANDLE EXTRA DATA ----
        INVOKE GetSizeOfExtraData, pMap, dwMapSize, OFFSET dwcExtra
        OR     EAX, EAX
        JZ     @@SkipXtrDat
        CMP    dwcExtra, 0
        JZ     @@SkipXtrDat
        INVOKE wsprintf, OFFSET cBuff, OFFSET szXtrDatInfo, dwcExtra
;        INVOKE MessageBox, 0, OFFSET cBuff, OFFSET szInfo, MB_YESNO OR MB_ICONWARNING
        invoke AskUser, OFFSET cBuff
        MOV    bAppendExtraData, 0
        CMP    EAX, IDYES
        JNZ    @@SkipXtrDat
        INC    bAppendExtraData
  @@SkipXtrDat:
        
        ;---- paste trademark :) ----
        INVOKE PasteTradeMark, pDump, OFFSET szSign	
	RET
FixPEImage ENDP

;
; Returns: BOOL
;
MemToFile PROC USES EBX EDI ESI, szFilePath : LPSTR, pBuff : LPVOID, dwBuffSize : DWORD
	LOCAL  dwc : DWORD
	INVOKE CreateFile, szFilePath, GENERIC_WRITE + GENERIC_READ, FILE_SHARE_WRITE + FILE_SHARE_READ,\
	           NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
	INC    EAX
	OR     EAX, EAX
	JZ     @F
	LEA    EBX, [EAX - 1]                                                            ; EBX -> file handle
	INVOKE WriteFile, EBX, pBuff, dwBuffSize, ADDR dwc, NULL        	
	
	;-> handle extra data
	.IF bAppendExtraData == TRUE
		MOV    EDX, pMap
		ADD    EDX, dwMapSize
		SUB    EDX, dwcExtra
		INVOKE WriteFile, EBX, EDX, dwcExtra, ADDR dwc, NULL
		.IF EAX == FALSE
;			INVOKE MessageBox, 0, OFFSET szXtrDatErr, OFFSET szShit, MB_ICONERROR
                        invoke ShowError, OFFSET szXtrDatErr
		.ENDIF
	.ENDIF
	
	INVOKE CloseHandle, EBX
	; EAX = 1 (TRUE) through "CloseHandle"
  @@:
	RET
MemToFile ENDP

;
; Returns:
; Pointer to file name
;
ExtractFileName PROC USES EBX EDI ESI, szPath : LPSTR, dwc : DWORD
	STD
	MOV    AL, '\'
	MOV    ECX, dwc
	MOV    EDI, szPath
	ADD    EDI, dwc
	DEC    EDI
	REPNZ  SCASB
	ADD    EDI, 2                                                                    ; EDI -> address of dll name
	CLD
	CMP    ECX, 0                                                                    ; sth found ?
	JNZ    @F
	DEC    EDI
  @@:
	XCHG   EDI, EAX
	RET
ExtractFileName ENDP

;
; Returns:
; NULL - if either '\' occurred before a '.' or nothing of them was found in the string
; ELSE - ptr to extension
;
GetFileExt PROC USES EBX EDI ESI, szPath : LPSTR, dwc : DWORD
	MOV    ECX, dwc
	MOV    EBX, szPath                                                               ; EBX -> str address
	LEA    EDI, [EBX + ECX - 1]
	.WHILE EDI != EBX
		XOR   EAX, EAX
		CMP   B [EDI], "\"
		JZ    @@ExitProc
		CMP   B [EDI], "."
		JNZ   @F
		XCHG  EAX, EDI
		JMP   @@ExitProc
		@@:
		DEC   EDI
	.ENDW
  @@ExitProc:	
	RET
GetFileExt ENDP

;
; Args:
; pAddr       - address where the jump should be assembled to
; pJumpTarget - jump target addresse
;
AssembleJump PROC USES EBX ESI EDI, pAddr : LPVOID, pJumpTarget : LPVOID
	MOV    EDI, pAddr                                                      ; EDI -> assemble address
	MOV    BYTE PTR [EDI], 0E9h                                            ; stamp jump opcode
	MOV    EAX, pJumpTarget
	SUB    EAX, EDI
	SUB    EAX, 5
	MOV    DWORD PTR [EDI + 1], EAX                                        ; stamp jump target
	RET
AssembleJump ENDP

;
; Returns: BOOL
;
HookKiUserExceptionDispatcher PROC USES EBX ECX EDX ESI EDI, pNewHandler : LPVOID
	LOCAL  dwBuff : DWORD
	
	SUB    ESI, ESI                                                        ; ESI = Result
	
	;-> get API entry
	INVOKE LoadLibrary, OFFSET szNtDll
	MOV    EBX, EAX                                                        ; EBX -> NtDll base
	INVOKE GetProcAddress, EBX, OFFSET szNtCont
	OR     EAX, EAX
	JZ     @@ExitProc
	MOV    _NtContinue, EAX
	INVOKE GetProcAddress, EBX, OFFSET szKiUserExctDisp
	OR     EAX, EAX
	JZ     @@ExitProc
	MOV    pOrgKiUserExctDisp, EAX
	MOV    EDI, EAX                                                        ; EDI -> pKUED
	
	;-> signature check
	MOV    EAX, DWORD PTR [EDI]
	CMP    EAX, DWORD PTR [KUED_Entry1]
	JNZ    @@ExitProc
	MOV    EAX, DWORD PTR [EDI + 4]
	AND    EAX, 000FFFFFFh
	CMP    EAX, DWORD PTR [KUED_Entry2]
	JNZ    @@ExitProc
	
	;-> overwrite API entry
	INVOKE VirtualProtect, EDI, 5, PAGE_EXECUTE_READWRITE, ADDR dwBuff
	OR     EAX, EAX
	JZ     @@ExitProc
	INVOKE AssembleJump, EDI, pNewHandler	
	
	;-> OK
	INC    ESI
	
  @@ExitProc:
        XCHG   EAX, ESI
	RET
HookKiUserExceptionDispatcher ENDP

UnhookKiUserExceptionDispatcher PROC USES EBX ECX EDX ESI EDI
	;-> rewrite the first 6 original KUED entry bytes (first 5 bytes were patched only)
	MOV    EDI, pOrgKiUserExctDisp
	MOV    EAX, DWORD PTR [KUED_Entry1]
	MOV    DWORD PTR [EDI], EAX
	MOV    EAX, DWORD PTR [KUED_Entry2]
	MOV    WORD PTR [EDI + 4], AX
	RET
UnhookKiUserExceptionDispatcher ENDP

ASSUME EDI : NOTHING
ASSUME ESI : NOTHING

;
; Args:
; pPEImage         - pointer to a PE file image
; pdwcExtraData    - address of variable to receive the size of the extra data
;
; Returns: BOOL
;
GetSizeOfExtraData PROC USES EBX ESI EDI pPEImage : LPVOID, dwRawSize : DWORD, pdwcExtraData : LPVOID
	;-> get last section ptr
	SUB    EDI, EDI                                                                  ; EDI -> Result (BOOL)
	INVOKE ImageNtHeader, pPEImage                                                   ; ECX -> NT header
	OR     EAX, EAX
	JZ     @@ExitProc
	INC    EDI                                                                       ; Result -> TRUE
	MOVZX  EBX, [EAX].IMAGE_NT_HEADERS.FileHeader.SizeOfOptionalHeader
	LEA    ESI, [EAX + EBX + 018h]                                                   ; ESI -> ptr to 1st section
	MOVZX  ECX, [EAX].IMAGE_NT_HEADERS.FileHeader.NumberOfSections
	DEC    ECX
  @@:
  	ADD    ESI, SIZEOF IMAGE_SECTION_HEADER
  	LOOP   @B                                                                        ; ESI -> last section
  	
  	;-> check for extra data
  	MOV     EDX, pdwcExtraData                                                       ; EDX -> ptr to output var
  	MOV     D [EDX], 0
  	MOV     EAX, [ESI].IMAGE_SECTION_HEADER.PointerToRawData
  	ADD     EAX, [ESI].IMAGE_SECTION_HEADER.SizeOfRawData        
	CMP     dwRawSize, EAX
	JLE     @@ExitProc
	
	;-> possibility for extra data
	MOV     EBX, dwRawSize
	SUB     EBX, EAX
	MOV     D [EDX], EBX	
	
  @@ExitProc:
  	XCHG   EAX, EDI
	RET
GetSizeOfExtraData ENDP

end Main ; -> EOF <-
