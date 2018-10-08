Attribute VB_Name = "Declarations"
Declare Function CloseHandle Lib "kernel32.dll" (ByVal handle As Long) As Long
Declare Function CreatePipe _
        Lib "kernel32" (phReadPipe As Long, _
                        phWritePipe As Long, _
                        lpPipeAttributes As Any, _
                        ByVal nSize As Long) As Long
Declare Function CreateProcess _
        Lib "kernel32.dll" _
        Alias "CreateProcessA" (ByVal lpApplicationName As String, _
                                ByVal lpCommandLine As String, _
                                ByRef lpProcessAttributes As Any, _
                                ByRef lpThreadAttributes As Any, _
                                ByVal bInheritHandles As Long, _
                                ByVal dwCreationFlags As Long, _
                                ByRef lpEnvironment As Any, _
                                ByVal lpCurrentDriectory As String, _
                                ByRef lpStartupInfo As STARTUPINFO, _
                                ByRef lpProcessInformation As PROCESS_INFORMATION) As Long
Declare Function CreateToolhelp32Snapshot _
        Lib "kernel32" (ByVal dwFlags As Long, _
                        ByVal dwProcessId As Long) As Long
Declare Function CreateToolhelpSnapshot _
        Lib "kernel32" _
        Alias "CreateToolhelp32Snapshot" (ByVal lFlags As Long, _
                                          lProcessID As Long) As Long
Declare Function DdeClientTransaction _
        Lib "user32" (ByVal pData As String, _
                      ByVal cbData As Long, _
                      ByVal hConv As Long, _
                      ByVal hszItem As Long, _
                      ByVal wFmt As Long, _
                      ByVal wType As Long, _
                      ByVal dwTimeout As Long, _
                      pdwResult As Long) As Long
Declare Function DdeConnect _
        Lib "user32" (ByVal idInst As Long, _
                      ByVal hszService As Long, _
                      ByVal hszTopic As Long, _
                      pCC As Any) As Long
Declare Function DdeCreateDataHandle _
        Lib "user32" (ByVal idInst As Long, _
                      ByVal pSrc As String, _
                      ByVal cb As Long, _
                      ByVal cbOff As Long, _
                      ByVal hszItem As Long, _
                      ByVal wFmt As Long, _
                      ByVal afCmd As Long) As Long
Declare Function DdeCreateStringHandle _
        Lib "user32" _
        Alias "DdeCreateStringHandleA" (ByVal idInst As Long, _
                                        ByVal psz As String, _
                                        ByVal iCodePage As Long) As Long
Declare Function DdeDisconnect Lib "user32" (ByVal hConv As Long) As Long
Declare Function DdeFreeDataHandle Lib "user32" (ByVal hData As Long) As Long
Declare Function DdeFreeStringHandle _
        Lib "user32" (ByVal idInst As Long, _
                      ByVal hsz As Long) As Long
Declare Function DdeGetData _
        Lib "user32" (ByVal hData As Long, _
                      ByVal pDst As String, _
                      ByVal cbMax As Long, _
                      ByVal cbOff As Long) As Long
Declare Function DdeGetLastError Lib "user32" (ByVal idInst As Long) As Long
Declare Function DdeInitialize _
        Lib "user32" _
        Alias "DdeInitializeA" (pidInst As Long, _
                                ByVal pfnCallback As Long, _
                                ByVal afCmd As Long, _
                                ByVal ulRes As Long) As Integer
Declare Function DdeNameService _
        Lib "user32" (ByVal idInst As Long, _
                      ByVal hsz1 As Long, _
                      ByVal hsz2 As Long, _
                      ByVal afCmd As Long) As Long
Declare Function DdeQueryString _
        Lib "user32" _
        Alias "DdeQueryStringA" (ByVal idInst As Long, _
                                 ByVal hsz As Long, _
                                 ByVal psz As String, _
                                 ByVal cchMax As Long, _
                                 ByVal iCodePage As Long) As Long
Declare Function DdeUninitialize Lib "user32" (ByVal idInst As Long) As Long
Declare Function DuplicateHandle _
        Lib "kernel32" (ByVal hSourceProcessHandle As Long, _
                        ByVal hSourceHandle As Long, _
                        ByVal hTargetProcessHandle As Long, _
                        lpTargetHandle As Long, _
                        ByVal dwDesiredAccess As Long, _
                        ByVal bInheritHandle As Long, _
                        ByVal dwOptions As Long) As Long
Declare Function DwmIsCompositionEnabled Lib "dwmapi" (ByRef pfEnabled As Long) As Long
Declare Function FileTimeToLocalFileTime _
        Lib "kernel32.dll" (ByRef lpFileTime As FILETIME, _
                            ByRef lpLocalFileTime As FILETIME) As Long
Declare Function FileTimeToSystemTime _
        Lib "kernel32.dll" (ByRef lpFileTime As FILETIME, _
                            ByRef lpSystemTime As SYSTEMTIME) As Long
Declare Function FindWindow _
        Lib "user32.dll" _
        Alias "FindWindowA" (ByVal lpClassName As String, _
                             ByVal lpWindowName As String) As Long
Declare Function FindWindowEx _
        Lib "user32.dll" _
        Alias "FindWindowExA" (ByVal hWnd1 As Long, _
                               ByVal hWnd2 As Long, _
                               ByVal lpsz1 As String, _
                               ByVal lpsz2 As String) As Long
Declare Function FormatMessage _
        Lib "kernel32" _
        Alias "FormatMessageA" (ByVal dwFlags As Long, _
                                lpSource As Any, _
                                ByVal dwMessageId As Long, _
                                ByVal dwLanguageId As Long, _
                                ByVal lpBuffer As String, _
                                ByVal nSize As Long, _
                                Arguments As Long) As Long
Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Declare Function GetCurrentProcess Lib "kernel32" () As Long
Declare Function GetCurrentProcessId Lib "kernel32.dll" () As Long
Declare Function GetCurrentThread Lib "kernel32.dll" () As Long
Declare Function GetDriveType _
        Lib "kernel32.dll" _
        Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Declare Function GetModuleHandle _
        Lib "kernel32" _
        Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Declare Function GetOpenFileName _
        Lib "comdlg32.dll" _
        Alias "GetOpenFileNameA" (pOpenfilename As OpenFilename) As Long
Declare Function GetProcAddress _
        Lib "kernel32" (ByVal hModule As Long, _
                        ByVal lpProcName As String) As Long
Declare Function GetSaveFileName _
        Lib "comdlg32.dll" _
        Alias "GetSaveFileNameA" (pOpenfilename As OpenFilename) As Long
Declare Function GetShortPathName _
        Lib "kernel32.dll" _
        Alias "GetShortPathNameA" (ByVal lpszLongPath As String, _
                                   ByVal lpszShortPath As String, _
                                   ByVal cchBuffer As Long) As Long
Declare Function GetSystemDirectory _
        Lib "kernel32.dll" _
        Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, _
                                     ByVal nSize As Long) As Long
                                     
Declare Function GetTempPath _
        Lib "kernel32.dll" _
        Alias "GetTempPathA" (ByVal nBufferLength As Long, _
                              ByVal lpBuffer As String) As Long
Declare Function GetVersionExA _
        Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer
Declare Function GetWindowLong _
        Lib "user32" _
        Alias "GetWindowLongA" (ByVal hwnd As Long, _
                                ByVal nIndex As Long) As Long
Declare Function GetWindowThreadProcessId _
        Lib "user32.dll" (ByVal hwnd As Long, _
                          ByRef lpdwProcessId As Long) As Long
Declare Function GetWindowsDirectory _
        Lib "kernel32.dll" _
        Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, _
                                      ByVal nSize As Long) As Long
Declare Function IsUserAnAdmin Lib "shell32" () As Long
Declare Function IsWow64Process _
        Lib "kernel32" (ByVal hProc As Long, _
                        bWow64Process As Boolean) As Long
Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Declare Function OemToCharBuff _
        Lib "user32" _
        Alias "OemToCharBuffA" (lpszSrc As Any, _
                                ByVal lpszDst As String, _
                                ByVal cchDstLength As Long) As Long
Declare Function OpenProcess _
        Lib "kernel32.dll" (ByVal dwDesiredAccessas As Long, _
                            ByVal bInheritHandle As Long, _
                            ByVal dwProcId As Long) As Long
Declare Function OpenThread _
        Lib "kernel32" (ByVal dwDesiredAccess As Long, _
                        ByVal bInheritHandle As Long, _
                        ByVal dwProcessId As Long) As Long
Declare Function PathUnmakeSystemFolder _
        Lib "shlwapi.dll" _
        Alias "PathUnmakeSystemFolderA" (ByVal pszPath As String) As Long
Declare Function PostMessage _
        Lib "user32.dll" _
        Alias "PostMessageA" (ByVal hwnd As Long, _
                              ByVal wMsg As Long, _
                              ByVal wParam As Long, _
                              ByVal lParam As Long) As Long
Declare Function ProcessFirst _
        Lib "kernel32" _
        Alias "Process32First" (ByVal hSnapshot As Long, _
                                uProcess As PROCESSENTRY32) As Long
Declare Function ProcessNext _
        Lib "kernel32" _
        Alias "Process32Next" (ByVal hSnapshot As Long, _
                               uProcess As PROCESSENTRY32) As Long
Declare Function ReadFile _
        Lib "kernel32" (ByVal hFile As Long, _
                        lpBuffer As Any, _
                        ByVal nNumberOfBytesToRead As Long, _
                        lpNumberOfBytesRead As Long, _
                        lpOverlapped As Any) As Long
Declare Function RegCloseKey Lib "ADVAPI32.dll" (ByVal hKey As Long) As Long
Declare Function RegCreateKey _
        Lib "ADVAPI32.dll" _
        Alias "RegCreateKeyA" (ByVal hKey As Long, _
                               ByVal lpSubKey As String, _
                               phkResult As Long) As Long
Declare Function RegDeleteKey _
        Lib "ADVAPI32.dll" _
        Alias "RegDeleteKeyA" (ByVal hKey As Long, _
                               ByVal lpSubKey As String) As Long
Declare Function RegDeleteKeyEx _
        Lib "ADVAPI32.dll" _
        Alias "RegDeleteKeyExA" (ByVal hKey As Long, _
                                 ByVal lpSubKey As String, _
                                 ByVal ulOptions As Long, _
                                 ByVal samDesired As Long) As Long
Declare Function RegDeleteValue _
        Lib "ADVAPI32.dll" _
        Alias "RegDeleteValueA" (ByVal hKey As Long, _
                                 ByVal lpValueName As String) As Long
Declare Function RegEnumKey _
        Lib "ADVAPI32.dll" _
        Alias "RegEnumKeyA" (ByVal hKey As Long, _
                             ByVal dwIndex As Long, _
                             ByVal lpName As String, _
                             ByVal cbName As Long) As Long
Declare Function RegEnumKeyEx _
        Lib "ADVAPI32.dll" _
        Alias "RegEnumKeyExA" (ByVal hKey As Long, _
                               ByVal dwIndex As Long, _
                               ByVal lpName As String, _
                               lpcbName As Long, _
                               lpReserved As Long, _
                               ByVal lpClass As String, _
                               lpcbClass As Long, _
                               lpftLastWriteTime As FILETIME) As Long
Declare Function RegEnumValue _
        Lib "ADVAPI32.dll" _
        Alias "RegEnumValueA" (ByVal hKey As Long, _
                               ByVal dwIndex As Long, _
                               ByVal lpValueName As String, _
                               lpcbValueName As Long, _
                               ByVal lpReserved As Long, _
                               lpType As Long, _
                               lpData As Byte, _
                               lpcbData As Long) As Long
Declare Function RegOpenKeyEx _
        Lib "ADVAPI32.dll" _
        Alias "RegOpenKeyExA" (ByVal hKey As Long, _
                               ByVal lpSubKey As String, _
                               ByVal ulOptions As Long, _
                               ByVal samDesired As Long, _
                               phkResult As Long) As Long
Declare Function RegQueryInfoKey _
        Lib "ADVAPI32.dll" _
        Alias "RegQueryInfoKeyA" (ByVal hKey As Long, _
                                  ByVal lpClass As String, _
                                  ByRef lpcbClass As Long, _
                                  ByRef lpReserved As Long, _
                                  ByRef lpcSubKeys As Long, _
                                  ByRef lpcbMaxSubKeyLen As Long, _
                                  ByRef lpcbMaxClassLen As Long, _
                                  ByRef lpcValues As Long, _
                                  ByRef lpcbMaxValueNameLen As Long, _
                                  ByRef lpcbMaxValueLen As Long, _
                                  ByRef lpcbSecurityDescriptor As Long, _
                                  ByRef lpftLastWriteTime As FILETIME) As Long
Declare Function RegQueryValueEx _
        Lib "ADVAPI32.dll" _
        Alias "RegQueryValueExA" (ByVal hKey As Long, _
                                  ByVal lpValueName As String, _
                                  ByVal lpReserved As Long, _
                                  lpType As Long, _
                                  lpData As Any, _
                                  lpcbData As Long) As Long
Declare Function RegSetValueEx _
        Lib "ADVAPI32.dll" _
        Alias "RegSetValueExA" (ByVal hKey As Long, _
                                ByVal lpValueName As String, _
                                ByVal Reserved As Long, _
                                ByVal dwType As Long, _
                                ByVal lpData As String, _
                                ByVal cbData As Long) As Long
Declare Function ResumeThread Lib "kernel32.dll" (ByVal hThread As Long) As Long
Declare Function RtlAdjustPrivilege _
        Lib "ntdll" (ByVal Privilege As Long, _
                     ByVal NewValue As Long, _
                     ByVal NewThread As Long, _
                     OldValue As Long) As Long
Declare Function SHGetSpecialFolderPath _
        Lib "shell32.dll" _
        Alias "SHGetSpecialFolderPathA" (ByVal hwnd As Long, _
                                         ByVal pszPath As String, _
                                         ByVal csidl As Long, _
                                         ByVal fCreate As Long) As Long
Declare Function SendMessage _
        Lib "user32.dll" _
        Alias "SendMessageA" (ByVal hwnd As Long, _
                              ByVal wMsg As Long, _
                              ByVal wParam As Long, _
                              ByRef lParam As Any) As Long
Declare Function SetFocus Lib "user32.dll" (ByVal hwnd As Long) As Long
Declare Function SetForegroundWindow Lib "user32.dll" (ByVal hwnd As Long) As Long
Declare Function SetLayeredWindowAttributes _
        Lib "user32.dll" (ByVal hwnd As Long, _
                          ByValcrKey As Long, _
                          ByVal bAlpha As Byte, _
                          ByVal dwFlags As Long) As Boolean
Declare Function SetSystemTime _
        Lib "kernel32.dll" (ByRef lpSystemTime As SYSTEMTIME) As Long
Declare Function SetThreadPriority _
        Lib "kernel32.dll" (ByVal hThread As Long, _
                            ByVal nPriority As Long) As Long
Declare Function SetWindowLong _
        Lib "user32" _
        Alias "SetWindowLongA" (ByVal hwnd As Long, _
                                ByVal nIndex As Long, _
                                ByVal dwNewLong As Long) As Long
Declare Function SetWindowPos _
        Lib "user32.dll" (ByVal hwnd As Long, _
                          ByVal hWndInsertAfter As Long, _
                          ByVal x As Long, _
                          ByVal y As Long, _
                          ByVal cx As Long, _
                          ByVal cy As Long, _
                          ByVal wFlags As Long) As Long
Declare Function ShellExecute _
        Lib "shell32.dll" _
        Alias "ShellExecuteA" (ByVal hwnd As Long, _
                               ByVal lpOperation As String, _
                               ByVal lpFile As String, _
                               ByVal lpParameters As String, _
                               ByVal lpDirectory As String, _
                               ByVal nShowCmd As Long) As Long
Declare Function ShellExecuteEx _
        Lib "shell32.dll" (ByRef lpExecInfo As SHELLEXECUTEINFO) As Long
Declare Function Shell_NotifyIcon _
        Lib "shell32" _
        Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, _
                                   lpData As NOTIFYICONDATA) As Long
Declare Function ShowWindow _
        Lib "user32.dll" (ByVal hwnd As Long, _
                          ByVal nCmdShow As Long) As Long
Declare Function SuspendThread Lib "kernel32.dll" (ByVal hThread As Long) As Long
Declare Function TerminateProcess _
        Lib "kernel32" (ByVal hProcess As Long, _
                        ByVal uExitCode As Long) As Long
Declare Function Thread32First _
        Lib "kernel32" (ByVal hObject As Long, _
                        p As THREADENTRY32) As Boolean
Declare Function Thread32Next _
        Lib "kernel32" (ByVal hObject As Long, _
                        p As THREADENTRY32) As Boolean
Declare Function WaitForInputIdle _
        Lib "user32.dll" (ByVal hProcess As Long, _
                          ByVal dwMilliseconds As Long) As Long
Declare Function Wow64EnableWow64FsRedirection _
        Lib "kernel32" (ByVal Enable As Boolean) As Boolean

Declare Sub GetSystemTime Lib "kernel32.dll" (ByRef lpSystemTime As SYSTEMTIME)
Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)
'Type declaration

Type SECURITY_ATTRIBUTES

    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long

End Type

Type SHELLEXECUTEINFO

    cbSize As Long
    fMask As Long
    hwnd As Long
    lpVerb As String
    lpFile As String
    lpParameters As String
    lpDirectory As String
    nShow As Long
    hInstApp As Long
    lpIDList As Long
    lpClass As String
    hkeyClass As Long
    dwHotKey As Long
    hIcon As Long
    hProcess As Long

End Type

Type SECURITY_QUALITY_OF_SERVICE

    Length As Long
    Impersonationlevel As Integer
    ContextTrackingMode As Integer
    EffectiveOnly As Long

End Type

Type CONVCONTEXT

    cb As Long
    wFlags As Long
    wCountryID As Long
    iCodePage As Long
    dwLangID As Long
    dwSecurity As Long
    qos As SECURITY_QUALITY_OF_SERVICE

End Type

Type PROCESSENTRY32

    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szExeFile As String * 260

End Type

Type THREADENTRY32

    dwSize As Long
    cntUsage As Long
    th32ThreadID As Long
    th32OwnerProcessID As Long
    tpBasePri As Long
    tpDeltaPri As Long
    dwFlags As Long

End Type

Type OSVERSIONINFO

    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128

End Type

Type SHFILEINFO

    hIcon As Long
    iIcon As Long
    dwAttributes As Long
    szDisplayName As String * 260
    szTypeName As String * 80

End Type

Type PROCESS_INFORMATION

    hProcess As Long
    hThread As Long
    dwProcessId As Long
    dwThreadId As Long

End Type

Type STARTUPINFO

    cb As Long
    lpReserved As Long
    lpDesktop As Long
    lpTitle As Long
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Byte
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long

End Type

Type GUID

    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(7) As Byte

End Type

Type NOTIFYICONDATA

    cbSize As Long
    hwnd As Long
    uID As Long
    uFlags As Long
    uCallbackMessage As Long
    hIcon As Long
    szTip As String * 128
    dwState As Long
    dwStateMask As Long
    szInfo As String * 256
    uTimeoutAndVersion As Long
    szInfoTitle As String * 64
    dwInfoFlags As Long
    guidItem As GUID

End Type

Type FILETIME

    dwLowDateTime As Long
    dwHighDateTime As Long

End Type
    
Type SYSTEMTIME

    wYear As Integer
    wMonth As Integer
    wDayOfWeek As Integer
    wDay As Integer
    wHour As Integer
    wMinute As Integer
    wSecond As Integer
    wMilliseconds As Integer

End Type

Type OpenFilename

    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long

    iFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String

End Type

Type RegValue

    Name As String
    DataType As Long
        
End Type

Type LongDataTime

    Name As String
    LTime As Long
    LDate As Long
        
End Type

Type PackerDes

    Name As String
    Value As Long
    Platform As Long
    FileName As String
    HomePage As String
    SupVer As String
    LastVer As String

End Type

Type SecList

    DiskNum As Integer
    SecNum As Integer
    SecData As String

End Type

Enum PlatType

    P32bit = 1
    P64bit = 2
    PAll = 3
    
End Enum

Enum ValueTypes

    REG_NONE = 0
    REG_SZ = 1
    REG_EXPAND_SZ = 2
    REG_BINARY = 3
    REG_DWORD = 4
    REG_DWORD_LITTLE_ENDIAN = 4
    REG_DWORD_BIG_ENDIAN = 5
    REG_LINK = 6
    REG_MULTI_SZ = 7
    REG_RESOURCE_LIST = 8

End Enum

Enum RegistryPaths

    HKEY_CLASSES_ROOT = &H80000000
    HKEY_CURRENT_USER = &H80000001
    HKEY_LOCAL_MACHINE = &H80000002
    HKEY_USERS = &H80000003

End Enum

Enum TRKeyType

    TRNone = 0
    TRRegVal = 1
    TRRegKey = 2
    TRFile = 3
    TRDir = 4
    TRProcess = 5
    TRSector = 6
    TRShell = 7
    TRStream = 8

End Enum

Enum Packers

    PSFileAll = -5
    PSFile = -4
    PSSel = -3
    PSCheck = -2
    PSAll = -1
    None
    ACProtect
    ActiveMark
    Armadillo
    ASProtect
    DBPE
    EncryptPE
    Enigma
    EXECryptor
    ExeShield
    Expressor
    FlexNet
    ICELicense
    IntelliLock
    LicenseProtector
    MancoLicensing
    Nalpeiron
    NETReactor
    NoCopy
    NTkrnlProtector
    Obsidium
    OneWay
    ORiEN
    PCGuard
    ProActivate
    ProtectionPlus
    ProtectShareware
    Protexis
    SafengineLicensor
    SafeSerial
    SDProtector
    SGLicenser
    ShareGuard
    Sheriff
    SoftLocx
    SoftSentry
    SoftWrap
    STProtector
    SVKP
    Thinstall
    VBOLock
    VBox
    VisualProtect
    WinLicense
    XheoLicensing
    XProtector
    ZipWorx
    ZProtect
    ZXProtector
    MaxPacker

End Enum

Public Const THREAD_ALL_ACCESS = &HF0000 Or &H100000 Or &H3FF

Public Const XCLASS_BOOL = &H1000

Public Const XCLASS_DATA = &H2000

Public Const XCLASS_FLAGS = &H4000

Public Const XTYPF_NOBLOCK = &H2

Public Const XTYP_CONNECT = &H60 Or XCLASS_BOOL Or XTYPF_NOBLOCK

Public Const XTYP_EXECUTE = (&H50 Or XCLASS_FLAGS)

Public Const XTYP_REQUEST = (&HB0 Or XCLASS_DATA)

Public Const XTYP_POKE = (&H90 Or XCLASS_FLAGS)

Public Const CP_WINANSI = 1004

Public Const CP_WINUNICODE = 1200

Public Const CF_TEXT = 1

Public Const CBF_SKIP_ALLNOTIFICATIONS = &H3C0000

Public Const DNS_REGISTER = &H1

Public Const DNS_UNREGISTER = &H2

Public Const DDE_FACK = &H8000

Public Const DDE_FBUSY = &H4000

Public Const DDE_FNOTPROCESSED = &H0

Global lInstID          As Long

Global ItemsCount       As Long

Global hszDDEServer     As Long

Global hszDDETopic      As Long

Global hDDEConv         As Long

Global lDDERet          As Long

Global PackerList()     As PackerDes

Global Vers             As String

Global DisDHSS          As Integer

Global FormOpacity      As String

Global WoW64Translation As Long

Global DisablePop       As Integer

Global DDE_Count        As Long

Global PackerIDX        As Long

Global PluginInfo       As String

Global PlugEndMSG       As String

Global pt               As SYSTEMTIME

Global HiddenKeyFound   As Long

Global UBase1           As String

Global UBase2           As String

Global BaseICO          As Integer

Global PlugPath         As String

Global KeysListPath     As String

Global BackupPath       As String

Global FileBinary()     As Byte

Global NukeTime         As Integer

Global SystemDir        As String

Global WindowsDir       As String

Global UsersBaseDir     As String

Global ProgramDataDir   As String

Global TempDir          As String

Global CAppDataDir      As String

Global AppDataDir       As String

Global CDocumentsDir    As String

Global ProgramFilesDir  As String

Global CommonFilesDir   As String

Global CurUserDir       As String

Global LastError        As String

Global CPercent         As Integer

Global Abort            As Integer

Global PauseTime        As Long

Global uProcess         As PROCESSENTRY32

Global FileInfo         As SHFILEINFO

Global Is64bitFast      As Boolean
 
Global hkeyName         As String

Global TrayOPT          As NOTIFYICONDATA

Global AllValues()      As RegValue

Global AllKeys()        As String

Global AllKeys1()       As String

Global AllKeys2()       As String

Global AllKeysList()    As String

Global AllDirsList()    As String

