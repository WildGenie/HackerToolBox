PPF_NORMALIZED equ 1
PEB_BASE equ 07FFDF000h

;LIST_ENTRY STRUCT
;    Flink DWORD ?
;    Blink DWORD ?
;LIST_ENTRY ENDS

CLIENT_ID STRUCT
    UniqueProcess           HANDLE ?            ; 00h
    UniqueThread            HANDLE ?            ; 04h
CLIENT_ID ENDS

; UNICODE_STRING STRUCT
;   union
;     ULength          USHORT ?
;     woLength         USHORT ?
;   ends
;   MaximumLength    USHORT ?
;   Buffer           PWSTR  ?
; UNICODE_STRING ENDS

RTL_USER_PROCESS_PARAMETERS STRUCT
    AllocationSize          ULONG ?             ; 00h
    dwSize                  ULONG ?             ; 04h
    Flags                   ULONG ?             ; 08h
    DebugFlags              ULONG ?             ; 0Ch
    hConsole                HANDLE ?            ; 10h
    ProcessGroup            ULONG ?             ; 14h
    hStdInput               HANDLE ?            ; 18h
    hStdOutput              HANDLE ?            ; 1Ch
    hStdError               HANDLE ?            ; 20h
    CurrentDirectoryName    UNICODE_STRING <>   ; 24h
    CurrentDirectoryHandle  HANDLE ?            ; 28h
    DllPath                 UNICODE_STRING <>   ; 2Ch
    ImagePathName           UNICODE_STRING <>   ; 30h
    CommandLine             UNICODE_STRING <>   ; 34h
    Environment             PWSTR ?             ; 38h
    dwX                     ULONG ?             ; 3Ch
    dwY                     ULONG ?             ; 40h
    dwXSize                 ULONG ?             ; 44h
    dwYSize                 ULONG ?             ; 48h
    dwXCountChars           ULONG ?             ; 4Ch
    dwYCountChars           ULONG ?             ; 50h
    dwFillAttribute         ULONG ?             ; 54h
    dwFlags                 ULONG ?             ; 58h
    wShowWindow             ULONG ?             ; 5Ch
    WindowTitle             UNICODE_STRING <>   ; 60h
    DesktopInfo             UNICODE_STRING <>   ; 64h
    ShellInfo               UNICODE_STRING <>   ; 68h
    RuntimeInfo             UNICODE_STRING <>   ; 6Ch
RTL_USER_PROCESS_PARAMETERS ENDS


;NT_TIB STRUCT
;    ; ptr to _EXCEPTION_REGISTRATION_RECORD
;    ExceptionList           DWORD ?             ; 00h
;    StackBase               PVOID ?             ; 04h
;    StackLimit              PVOID ?             ; 08h
;    SubSystemTib            PVOID ?             ; 0Ch
;    UNION
;      FiberData             DWORD ?             ; 10h
;      Version               DWORD ?             ; 10h
;    ENDS
;    ArbitraryUserPointer    PVOID ?             ; 14h
;    ; ptr to _NT_TIB
;    Self                    DWORD ?             ; 18h
;NT_TIB ENDS

CURDIR STRUCT
    DosPath                 UNICODE_STRING <>   ; 00h
    Handle                  PVOID ?             ; 04h
CURDIR ENDS

RTL_DRIVE_LETTER_CURDIR STRUCT
    Flags                   USHORT ?            ; 00h
    dwLength                USHORT ?            ; 04h
    TimeStamp               ULONG ?             ; 08h
    DosPath                 UNICODE_STRING <>   ; 0Ch
RTL_DRIVE_LETTER_CURDIR ENDS

PEB_FREE_BLOCK STRUCT
    ; ptr to _PEB_FREE_BLOCK
    Next                    DWORD ?             ; 00h
    iSize                   ULONG ?             ; 04h
PEB_FREE_BLOCK ENDS


PEB_LDR_DATA STRUCT
    iLength                 ULONG ?             ; 00h
    Initialized             dword ?             ; 04h
    SsHandle                PVOID ?             ; 08h
    InLoadOrderModuleList   LIST_ENTRY <>       ; 0Ch ; pLDR_MODULE
    InMemoryOrderModuleList LIST_ENTRY <>       ; 14h ;
    InInitializationOrderModuleList LIST_ENTRY <>;1Ch ;
PEB_LDR_DATA ENDS

LDR_MODULE STRUCT
    InLoadOrderModuleList           LIST_ENTRY <>   ; 00h
    InMemoryOrderModuleList         LIST_ENTRY <>   ; 08h
    InInitializationOrderModuleList LIST_ENTRY <>   ; 10h
    BaseAddress                     PVOID ?         ; 18h
    EntryPoint                      ULONG ?         ; 1Ch
    ResidentSize                    ULONG ?         ; 20h
    FullDllName                     UNICODE_STRING <> ; 24h
    BaseDllName                     UNICODE_STRING <> ; 2Ch
    Flags                           ULONG ?         ; 34h
    LoadCount                       WORD ?          ; 38h
    TlsIndex                        WORD ?          ; 3Ah
    SectionHandle                   HANDLE ?        ; 3Ch
    CheckSum                        ULONG ?         ; 40h
    TimeDateStamp                   ULONG ?         ; 44h
LDR_MODULE ENDS

PEB STRUCT
    InheritedAddressSpace   UCHAR ?             ; 00h
    ReadImageFileExecOptions UCHAR ?            ; 01h
    BeingDebugged           UCHAR ?             ; 02h
    SpareBool               BOOLEAN ?           ; 03h
    Mutant                  HANDLE ?            ; 04h
    ImageBaseAddress        PVOID ?             ; 08h
    ; ptr to PEB_LDR_DATA
    Ldr                     DWORD ?             ; 0Ch
    ; ptr to RTL_USER_PROCESS_PARAMETERS
    ProcessParameters       DWORD ?             ; 10h
    SubSystemData           PVOID ?             ; 14h
    ProcessHeap             PVOID ?             ; 18h
    FastPebLock             PVOID ?             ; 1Ch
    ; ptr to PEBLOCKROUTINE
    FastPebLockRoutine      DWORD ?             ; 20h
    ; ptr to PEBLOCKROUTINE
    FastPebUnlockRoutine    DWORD ?             ; 24h
    EnvironmentUpdateCount  ULONG ?             ; 28h
    KernelCallbackTable     PVOID ?             ; 2Ch
    EventLogSection         PVOID ?             ; 30h
    EventLog                PVOID ?             ; 34h
    ; ptr to PEB_FREE_BLOCK
    FreeList                DWORD ?             ; 38h
    TlsExpansionCounter     ULONG ?             ; 3Ch
    TlsBitmap               PVOID ?             ; 40h
    TlsBitmapBits1          ULONG ?             ; 44h
    TlsBitmapBits2          ULONG ?             ; 48h
    ReadOnlySharedMemoryBase    PVOID ?         ; 4Ch
    ReadOnlySharedMemoryHeap    PVOID ?         ; 50h
    ReadOnlyStaticServerData    PVOID ?         ; 54h
    AnsiCodePageData            PVOID ?         ; 58h
    OemCodePageData             PVOID ?         ; 5Ch
    UnicodeCaseTableData        PVOID ?         ; 60h
    NumberOfProcessors          ULONG ?         ; 64h
    NtGlobalFlag                ULONG ?         ; 68h
    CriticalSectionTimeout      LARGE_INTEGER <>; 70h
    HeapSegmentReserve          ULONG ?         ; 78h
    HeapSegmentCommit           ULONG ?         ; 7Ch
    HeapDeCommitTotalFreeThreshold  ULONG ?     ; 80h
    HeapDeCommitFreeBlockThreshold  ULONG ?     ; 84h
    NumberOfHeaps               ULONG ?         ; 88h
    MaximumNumberOfHeaps        ULONG ?         ; 8Ch
    ProcessHeaps                PVOID ?         ; 90h
    GdiSharedHandleTable        PVOID ?         ; 94h
    ProcessStarterHelper        PVOID ?         ; 98h
    GdiDCAttributeList          PVOID ?         ; 9Ch
    LoaderLock                  PVOID ?         ; A0h
    OSMajorVersion              ULONG ?         ; A4h
    OSMinorVersion              ULONG ?         ; A8h
    OSBuildNumber               USHORT ?        ; ACh
    OSCSDVersion                USHORT ?        ; AEh
    OSPlatformId                ULONG ?         ; B0h
    ImageSubSystem              ULONG ?         ; B4h
    ImageSubSystemMajorVersion  ULONG ?         ; B8h
    ImageSubSystemMinorVersion  ULONG ?         ; BCh
    ImageProcessAffinityMask    ULONG ?         ; C0h
    GdiHandleBuffer             ULONG 22h dup (?);C4h
    PostProcessInitRoutine      PVOID ?         ; 14Ch
    TlsExpansionBitmap          PVOID ?         ; 150h
    TlsExpansionBitmapBits      ULONG 20h dup (?);154h
    SessionId                   ULONG ?         ; 1D4h
    AppCompatInfo               PVOID ?         ; 1D8h
    CSDVersion                  UNICODE_STRING <>; 1DCh
PEB ENDS

GDI_TEB_BATCH STRUCT
    dwOffset                    ULONG ?         ; 00h
    HDC                         ULONG ?         ; 04h
    Buffer                      ULONG 136h dup (?)
GDI_TEB_BATCH ENDS

TEB STRUCT
    Tib                         NT_TIB <>       ; 00h
    EnvironmentPointer          PVOID ?         ; 1Ch
    dwCid                       CLIENT_ID <>    ; 20h
    ActiveRpcInfo               PVOID ?         ; 28h
    ThreadLocalStoragePointer   PVOID ?         ; 2Ch
    ; ptr to PEB
    Peb                         DWORD ?         ; 30h
    LastErrorValue              ULONG ?         ; 34h
    CountOfOwnedCriticalSections DWORD ?        ; 38h
    CsrClientThread             PVOID ?         ; 3Ch
    ; ptr to _W32THREAD
    Win32ThreadInfo             DWORD ?         ; 40h
    Win32ClientInfo             ULONG 1Fh dup (?) ; 44h
    WOW32Reserved               PVOID ?         ; C0h
    CurrentLocale               LCID ?          ; C4h
    FpSoftwareStatusRegister    ULONG ?         ; C8h
    SystemReserved1             PVOID 36h dup (?) ; CCh
    Spare1                      PVOID ?         ; 1A4h
    ExceptionCode               LONG ?          ; 1A8h
    SpareBytes1                 UCHAR 28h dup (?) ; 1ACh
    SystemReserved2             PVOID 0Ah dup (?) ; 1D4h
    GdiTebBatch                 GDI_TEB_BATCH <>; 1FCh
    gdiRgn                      ULONG ?         ; 6DCh
    gdiPen                      ULONG ?         ; 6E0h
    gdiBrush                    ULONG ?         ; 6E4h
    RealClientId                CLIENT_ID <>    ; 6E8h
    GdiCachedProcessHandle      PVOID ?         ; 6F0h
    GdiClientPID                ULONG ?         ; 6F4h
    GdiClientTID                ULONG ?         ; 6F8h
    GdiThreadLocaleInfo         PVOID ?         ; 6FCh
    UserReserved                PVOID 5 dup (?)   ; 700h
    glDispatchTable             PVOID 118h dup (?); 714h
    glReserved1                 ULONG 1Ah dup (?) ; B74h
    glReserved2                 PVOID ?         ; BDCh
    glSectionInfo               PVOID ?         ; BE0h
    glSection                   PVOID ?         ; BE4h
    glTable                     PVOID ?         ; BE8h
    glCurrentRC                 PVOID ?         ; BECh
    glContext                   PVOID ?         ; BF0h
    LastStatusValue             DWORD ?         ; BF4h
    StaticUnicodeString         UNICODE_STRING <>; BF8h
    StaticUnicodeBuffer         WCHAR 105h dup (?); C00h
    DeallocationStack           PVOID ?         ; E0Ch
    TlsSlots                    PVOID 40h dup (?) ; E10h
    TlsLinks                    LIST_ENTRY <>   ; F10h
    Vdm                         PVOID ?         ; F18h
    ReservedForNtRpc            PVOID ?         ; F1Ch
    DbgSsReserved               PVOID 2 dup (?)   ; F20h
    HardErrorDisabled           ULONG ?         ; F28h
    Instrumentation             PVOID 10h dup (?) ; F2Ch
    WinSockData                 PVOID ?         ; F6Ch
    GdiBatchCount               ULONG ?         ; F70h
    Spare2                      USHORT ?        ; F74h
    IsFiber                     BOOLEAN ?       ; F76h
    Spare3                      UCHAR ?         ; F77h
    Spare4                      ULONG ?         ; F78h
    Spare5                      ULONG ?         ; F7Ch
    ReservedForOle              PVOID ?         ; F80h
    WaitingOnLoaderLock         ULONG ?         ; F84h
    Unknown                     ULONG 11 dup (?)  ; F88h
    FlsSlots                    PVOID ?         ; FB4h
    WineDebugInfo               PVOID ?         ; Needed for WINE DLL's
TEB ENDS
