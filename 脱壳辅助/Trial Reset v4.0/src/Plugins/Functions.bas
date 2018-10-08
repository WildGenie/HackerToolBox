Attribute VB_Name = "Functions"
Option Explicit

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
Declare Function DdeCreateStringHandle _
        Lib "user32" _
        Alias "DdeCreateStringHandleA" (ByVal idInst As Long, _
                                        ByVal psz As String, _
                                        ByVal iCodePage As Long) As Long
Declare Function DdeDisconnect Lib "user32" (ByVal hConv As Long) As Long
Declare Function DdeFreeStringHandle _
        Lib "user32" (ByVal idInst As Long, _
                      ByVal hsz As Long) As Long
Declare Function DdeInitialize _
        Lib "user32" _
        Alias "DdeInitializeA" (pidInst As Long, _
                                ByVal pfnCallback As Long, _
                                ByVal afCmd As Long, _
                                ByVal ulRes As Long) As Integer
Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Declare Function GetCurrentProcess Lib "kernel32" () As Long
Declare Function GetModuleHandle _
        Lib "kernel32" _
        Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Declare Function GetProcAddress _
        Lib "kernel32" (ByVal hModule As Long, _
                        ByVal lpProcName As String) As Long
Declare Function GetSystemDirectory _
        Lib "kernel32.dll" _
        Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, _
                                     ByVal nSize As Long) As Long
Declare Function GetTempPath _
        Lib "kernel32.dll" _
        Alias "GetTempPathA" (ByVal nBufferLength As Long, _
                              ByVal lpBuffer As String) As Long
Declare Function GetWindowsDirectory _
        Lib "kernel32.dll" _
        Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, _
                                      ByVal nSize As Long) As Long
Declare Function IsWow64Process _
        Lib "kernel32" (ByVal hProc As Long, _
                        bWow64Process As Boolean) As Long
Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Declare Function RegCloseKey Lib "ADVAPI32.dll" (ByVal hKey As Long) As Long
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
Declare Function RegQueryValueEx _
        Lib "ADVAPI32.dll" _
        Alias "RegQueryValueExA" (ByVal hKey As Long, _
                                  ByVal lpValueName As String, _
                                  ByVal lpReserved As Long, _
                                  lpType As Long, _
                                  lpData As Any, _
                                  lpcbData As Long) As Long
Declare Function SHGetSpecialFolderPath _
        Lib "shell32.dll" _
        Alias "SHGetSpecialFolderPathA" (ByVal hwnd As Long, _
                                         ByVal pszPath As String, _
                                         ByVal csidl As Long, _
                                         ByVal fCreate As Long) As Long
Declare Function Wow64EnableWow64FsRedirection _
        Lib "kernel32" (ByVal Enable As Boolean) As Boolean

Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)

Type RegValue

    Name As String
    DataType As Long
        
End Type

Type FILETIME

    dwLowDateTime As Long
    dwHighDateTime As Long

End Type

Type CONVCONTEXT

    cb As Long
    wFlags As Long
    wCountryID As Long
    iCodePage As Long
    dwLangID As Long
    dwSecurity As Long
    qos As Long

End Type

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

Enum WowState

    WAuto = 0
    W32bit = 1
    W64bit = 2
    WBoth = 3

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

Public Const APPCMD_CLIENTONLY = &H10&

Public Const MF_POSTMSGS = &H4000000

Public Const MF_SENDMSGS = &H2000000

Public Const KEY_ENUMERATE_SUB_KEYS = &H8

Public Const KEY_READ = &H20019

Public Const ERROR_SUCCESS = 0&

Public Const KEY_QUERY_VALUE = &H1

Public Const XTYP_POKE = (&H90 Or &H4000)

Public Const CP_WINANSI = 1004

Public Const CF_TEXT = 1

Public Const KEY_WOW64_64KEY = &H100

Public Const KEY_WOW64_32KEY = &H200

Global WoW64Translation As Long

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

Global AllValues()      As RegValue

Global AllKeys()        As String

Global AllKeys1()       As String

Global AllKeys2()       As String

Global AllDirsList()    As String

Global g_lInstID        As Long

Global g_hService       As Long

Global g_hTopic         As Long

Global g_hItem          As Long

Global g_hDDEConv       As Long

Global LastProgress     As Long

Function AddToList(Ktype As TRKeyType, TrialName As String, KeyName As String)

    SendItem "TR_ADDKEY", TrialName & vbTab & MakeKeyDesc(Ktype) & vbTab & KeyName
    
End Function

Function AddToListIfExist(Ktype As TRKeyType, TrialName As String, KeyName As String)

    SendItem "TR_ADDKEYVERIFY", TrialName & vbTab & MakeKeyDesc(Ktype) & vbTab & KeyName
    
End Function

Function AddToLog(LogStr As String)

    SendItem "TR_LOG", LogStr
            
End Function

Function CountKeys(ByVal hKey As RegistryPaths, ByVal SubKey As String) As Long

    Dim ReadHandle  As Long
    
    Dim ReturnValue As Long

    Dim KeyName     As String

    Dim ClassName   As String

    Dim LastWrite   As FILETIME

    Dim Index       As Long
    
    Dim ValueLen    As Long
    
    Dim DataLen     As Long
    
    Dim KeyCount    As Long
    
    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_ENUMERATE_SUB_KEYS + WoW64Translation, ReadHandle)

    Index = 0

    While ReturnValue = 0

        KeyName = Space(255)
        ClassName = Space(255)
        ValueLen = 255
        DataLen = 255

        ReturnValue = RegEnumKeyEx(ReadHandle, Index, KeyName, ValueLen, ByVal 0, ClassName, DataLen, LastWrite)

        If ReturnValue = 0 Then
            KeyName = Left(KeyName, ValueLen)

            If KeyName <> "" Then KeyCount = KeyCount + 1
        End If

        Index = Index + 1

    Wend

    ReturnValue = RegCloseKey(ReadHandle)
    CountKeys = Val(KeyCount)
End Function

Function CountValues(ByVal hKey As RegistryPaths, ByVal SubKey As String) As Long

    On Error Resume Next

    Dim Index          As Long

    Dim ValueName      As String

    Dim ValueLen       As Long

    Dim DataType       As Long
    
    Dim ReturnValue    As Long
    
    Dim ValueCount     As Long
    
    Dim ReadHandle     As Long
    
    Dim Data(0 To 254) As Byte
    
    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_QUERY_VALUE + WoW64Translation, ReadHandle)
    
    Index = 0

    ValueCount = 0

    While ReturnValue = 0

        ValueName = Space(2550)
        ValueLen = 2550
        
        ReturnValue = RegEnumValue(ReadHandle, Index, ValueName, ValueLen, ByVal 0, DataType, ByVal 0, ByVal 0)

        If ReturnValue = 0 And ValueLen > 0 Then ValueCount = ValueCount + 1
        
        Index = Index + 1

    Wend

    ReturnValue = RegCloseKey(ReadHandle)
    
    CountValues = ValueCount

End Function

Function DDE_Connect() As Long

    Dim udtConvCont As CONVCONTEXT

    Dim hDDEConv    As Long
        
    udtConvCont.iCodePage = CP_WINANSI
    udtConvCont.cb = Len(udtConvCont)
    
    hDDEConv = 0
    
    hDDEConv = DdeConnect(g_lInstID, g_hService, g_hTopic, udtConvCont)

    DDE_Connect = hDDEConv
    
End Function

Function DDE_CreateStringHandles(ByRef sTheService As String, _
                                 ByRef sTheTopic As String, _
                                 ByRef sTheItem As String)
    
    g_hService = DdeCreateStringHandle(g_lInstID, sTheService, CP_WINANSI)
    g_hTopic = DdeCreateStringHandle(g_lInstID, sTheTopic, CP_WINANSI)
    g_hItem = DdeCreateStringHandle(g_lInstID, sTheItem, CP_WINANSI)

End Function

Function DDE_Disconnect()
            
    If g_hDDEConv Then
        
        DdeDisconnect g_hDDEConv
        
        g_hDDEConv = 0
    
    End If

End Function

Function DDE_FreeStringHandles()

    If (g_hService <> 0) Then
    
        DdeFreeStringHandle g_lInstID, g_hService
        DdeFreeStringHandle g_lInstID, g_hTopic
    
    End If
    
    If (g_hItem <> 0) Then DdeFreeStringHandle g_lInstID, g_hItem
       
    g_hService = 0
    g_hTopic = 0
    g_hItem = 0

End Function
    
Function DDECallback(ByVal uType As Long, _
                     ByVal uFmt As Long, _
                     ByVal hConv As Long, _
                     ByVal hszString1 As Long, _
                     ByVal hszString2 As Long, _
                     ByVal hData As Long, _
                     ByVal dwData1 As Long, _
                     ByVal dwData2 As Long) As Long

End Function

Function DisableFileRedirection(BolVal As Boolean)

    On Error Resume Next
    
    Dim handle As Long, hLib As Long

    hLib = LoadLibraryA("kernel32")

    handle = GetProcAddress(GetModuleHandle("kernel32"), "Wow64EnableWow64FsRedirection")

    If handle > 0 Then

        FreeLibrary hLib
        Call Wow64EnableWow64FsRedirection(BolVal)

    End If

End Function

Function EnumAllRegKeys(ByVal hKey As RegistryPaths, ByVal SubKey As String)

    Erase AllKeys()
    
    ReDim AllKeys(0) As String

    EnumAllRegKeysExecute hKey, SubKey

End Function

Function EnumAllRegKeysExecute(ByVal hKey As RegistryPaths, ByVal SubKey As String)

    On Error GoTo Err

    Dim ReadHandle As Long

    Dim Index      As Long

    Dim KeyName    As String

    Dim TempKey    As String
    
    Dim ClassName  As String
    
    Dim DataLen    As Long
    
    Dim ValueLen   As Long

    Dim LastWrite  As FILETIME

    If RegOpenKeyEx(hKey, SubKey, 0, KEY_READ + WoW64Translation, ReadHandle) Then Exit Function
    
    Do
        KeyName = Space(255)
        ValueLen = 255

        If RegEnumKeyEx(ReadHandle, Index, KeyName, ValueLen, ByVal 0, ClassName, DataLen, LastWrite) <> ERROR_SUCCESS Then Exit Do
        Index = Index + 1
        KeyName = Left(KeyName, ValueLen)
    
        If SubKey <> "" Then
            TempKey = SubKey & "\" & KeyName
        Else
            TempKey = KeyName
        End If

        ReDim Preserve AllKeys(UBound(AllKeys) + 1) As String
        AllKeys(UBound(AllKeys)) = TempKey

        If LCase(KeyName) <> "wow6432node" And Replace(KeyName, Chr(0), "") = KeyName Then
            Call EnumAllRegKeysExecute(hKey, TempKey)
        End If

    Loop

Err:
    RegCloseKey ReadHandle
End Function

Function EnumDir(ByVal Path As String)

    On Error Resume Next
    
    Erase AllDirsList()
    ReDim AllDirsList(1) As String
    AllDirsList(1) = Path
    ExecuteEnumDir Path, 2

End Function

Function EnumKeys(ByVal hKey As RegistryPaths, _
                  ByVal SubKey As String, _
                  Optional ArrayIndex = 0)

    Dim ReadHandle  As Long

    Dim KeyName     As String

    Dim ClassName   As String

    Dim LastWrite   As FILETIME

    Dim Index       As Long
    
    Dim ValueLen    As Long
    
    Dim DataLen     As Long
    
    Dim ReturnValue As Long

    Dim FoundPath   As String
    
    Select Case ArrayIndex

        Case 0
            Erase AllKeys()
    
            ReDim AllKeys(0) As String

        Case 1
            Erase AllKeys1()
    
            ReDim AllKeys1(0) As String

        Case 2
            Erase AllKeys2()
    
            ReDim AllKeys2(0) As String
                
    End Select
    
    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_ENUMERATE_SUB_KEYS + WoW64Translation, ReadHandle)

    Index = 0

    While ReturnValue = 0

        KeyName = Space(255)
        ClassName = Space(255)
        ValueLen = 255
        DataLen = 255

        ReturnValue = RegEnumKeyEx(ReadHandle, Index, KeyName, ValueLen, ByVal 0, ClassName, DataLen, LastWrite)

        If ReturnValue = 0 Then
            KeyName = Left(KeyName, ValueLen)
            ClassName = Left(ClassName, DataLen)
            FoundPath = KeyName

            Select Case ArrayIndex

                Case 0
                    ReDim Preserve AllKeys(UBound(AllKeys) + 1) As String
                    AllKeys(UBound(AllKeys)) = FoundPath

                Case 1
                    ReDim Preserve AllKeys1(UBound(AllKeys1) + 1) As String
                    AllKeys1(UBound(AllKeys1)) = FoundPath

                Case 2
                    ReDim Preserve AllKeys2(UBound(AllKeys2) + 1) As String
                    AllKeys2(UBound(AllKeys2)) = FoundPath
                
            End Select

        End If

        Index = Index + 1

    Wend

    ReturnValue = RegCloseKey(ReadHandle)
End Function

Function EnumValues(ByVal hKey As RegistryPaths, ByVal SubKey As String)

    On Error Resume Next

    Dim Index          As Long

    Dim ValueName      As String

    Dim ValueLen       As Long

    Dim DataLen        As Long

    Dim DataType       As Long
    
    Dim ReturnValue    As Long
    
    Dim ReadHandle     As Long

    Dim FoundValueData As String
    
    Erase AllValues()
    
    ReDim AllValues(0)

    On Error Resume Next

    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_QUERY_VALUE + WoW64Translation, ReadHandle)

    While ReturnValue = 0

        ValueName = Space(255)
        ValueLen = 255
        DataLen = 255
  
        ReturnValue = RegEnumValue(ReadHandle, Index, ValueName, ValueLen, ByVal 0, DataType, ByVal 0, DataLen)

        If ReturnValue = 234 Then ReturnValue = RegEnumValue(ReadHandle, Index, ValueName, ValueLen, ByVal 0, DataType, ByVal 0, ByVal 0)

        If ReturnValue = 0 Then
            ValueName = Left(ValueName, ValueLen)
            
            ReDim Preserve AllValues(UBound(AllValues) + 1)
            AllValues(UBound(AllValues)).Name = ValueName
            AllValues(UBound(AllValues)).DataType = DataType
        End If
        
        Index = Index + 1

    Wend
  
    ReturnValue = RegCloseKey(ReadHandle)

End Function

Private Function ExecuteEnumDir(ByVal Path As String, StartPos As Long)

    On Error GoTo 55
    
    Dim FSO

    Dim WDir  As String

    Dim FWDir As String

    Dim T     As Integer
    
    Set FSO = CreateObject("Scripting.FileSystemObject")
    
    If Right(Path, 1) <> "\" Then Path = Path & "\"
                
    WDir = Dir(Path, vbDirectory + vbHidden + vbSystem + vbReadOnly)
    
    Do While WDir <> ""
 
        If WDir <> "" And Replace(WDir, ".", "") <> "" Then
            FWDir = Path & WDir

            If Right(FWDir, 1) <> "\" Then FWDir = FWDir & "\"
            If FSO.FolderExists(FWDir) = True Then
                If GetAttr(FWDir) <> 9238 Then
                    ReDim Preserve AllDirsList(UBound(AllDirsList) + 1) As String
                    AllDirsList(UBound(AllDirsList)) = FWDir

                End If
            End If
        End If
        
        WDir = Dir
    Loop

55

    For T = StartPos To UBound(AllDirsList)
        ExecuteEnumDir AllDirsList(T), UBound(AllDirsList) + 1
    Next

End Function

Function ExistDir(FilePath As String) As Boolean

    Dim FSO
    
    Set FSO = CreateObject("Scripting.FileSystemObject")
    ExistDir = FSO.FolderExists(Left(FilePath, Len(FilePath) - 1))
End Function

Function ExistFile(FilePath As String) As Boolean

    Dim FSO

    Set FSO = CreateObject("Scripting.FileSystemObject")
    ExistFile = FSO.FileExists(FilePath)
End Function

Function ExistKey(ByVal hKey As RegistryPaths, ByVal SubKey As String) As Boolean
    
    Dim ReturnValue, ReadHandle As Long
    
    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_READ + WoW64Translation, ReadHandle)

    If ReturnValue = 0 Then
        
        ExistKey = True
    
    Else
        ExistKey = False

    End If
    
    RegCloseKey ReadHandle
End Function

Function ExistValue(ByVal hKey As RegistryPaths, _
                    ByVal SubKey As String, _
                    ByVal ValueName As String) As Boolean

    Dim FoundValue As String
    
    Dim DataType, ReturnValue, ReadHandle As Long

    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_READ + WoW64Translation, ReadHandle)

    If ReturnValue = 0 Then
        
        FoundValue = Space(3200)
        ReturnValue = RegQueryValueEx(ReadHandle, ValueName, 0, DataType, ByVal FoundValue, 3200)
        
        If ReturnValue = 0 Then
            ExistValue = True
        Else
            ExistValue = False
        End If
    
    Else
        ExistValue = False

    End If
    
    RegCloseKey ReadHandle
End Function

Function GetDirectories()

    Dim Buffer As String * 255
    
    Dim T      As Integer

    SHGetSpecialFolderPath 0, Buffer, 40, 1
    UsersBaseDir = Replace(Buffer, Chr(0), "")
    
    For T = Len(UsersBaseDir) To 3 Step -1

        If Mid(UsersBaseDir, T, 1) = "\" Then Exit For
    Next
    
    If T > 3 Then UsersBaseDir = Left(UsersBaseDir, T)
    
    Buffer = String(255, Chr(0))
    SHGetSpecialFolderPath 0, Buffer, 35, 1
    ProgramDataDir = Replace(Buffer, Chr(0), "")
    
    Buffer = String(255, Chr(0))
    SHGetSpecialFolderPath 0, Buffer, 296, 1
    CurUserDir = Replace(Buffer, Chr(0), "")
    
    T = GetTempPath(255, Buffer)
    TempDir = Left(Buffer, T)
    T = GetWindowsDirectory(Buffer, 255)
    WindowsDir = Left(Buffer, T)
    T = GetSystemDirectory(Buffer, 255)
    SystemDir = Left(Buffer, T)

    CAppDataDir = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Common AppData"))
    AppDataDir = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "AppData"))
    CDocumentsDir = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Common Documents"))
    ProgramFilesDir = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion", "ProgramFilesDir"))
    CommonFilesDir = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion", "CommonFilesDir"))
    
    If Right(WindowsDir, 1) <> "\" Then WindowsDir = WindowsDir & "\"
    If Right(SystemDir, 1) <> "\" Then SystemDir = SystemDir & "\"
    If Right(TempDir, 1) <> "\" Then TempDir = TempDir & "\"
    If Right(CAppDataDir, 1) <> "\" Then CAppDataDir = CAppDataDir & "\"
    If Right(AppDataDir, 1) <> "\" Then AppDataDir = AppDataDir & "\"
    If Right(CDocumentsDir, 1) <> "\" Then CDocumentsDir = CDocumentsDir & "\"
    If Right(ProgramFilesDir, 1) <> "\" Then ProgramFilesDir = ProgramFilesDir & "\"
    If Right(CommonFilesDir, 1) <> "\" Then CommonFilesDir = CommonFilesDir & "\"
    If Right(UsersBaseDir, 1) <> "\" Then UsersBaseDir = UsersBaseDir & "\"
    If Right(ProgramDataDir, 1) <> "\" Then ProgramDataDir = ProgramDataDir & "\"
    If Right(CurUserDir, 1) <> "\" Then CurUserDir = CurUserDir & "\"
    
End Function

Function Is64bit() As Boolean

    On Error Resume Next

    Dim handle  As Long

    Dim Enabled As Boolean

    Dim hLib    As Long
    
    Is64bit = False
    
    hLib = LoadLibraryA("kernel32")

    handle = GetProcAddress(GetModuleHandle("kernel32"), "IsWow64Process")

    If handle > 0 Then

        FreeLibrary hLib
        Call IsWow64Process(GetCurrentProcess(), Enabled)

        If (Enabled) Then Is64bit = True
    End If
    
End Function

Sub Main()

    If App.LogMode <> 0 Then DdeInitialize g_lInstID, AddressOf DDECallback, APPCMD_CLIENTONLY Or MF_SENDMSGS Or MF_POSTMSGS, 0
    
    If TRWoW_State = W64bit Then
        SetWoW64Translation 64
    Else
        SetWoW64Translation 32
    End If
    
    Plugin_Execute
    
    If TRWoW_State = WBoth Then
        SetWoW64Translation 64
        Plugin_Execute
    End If

    If App.LogMode <> 0 Then DDE_Disconnect

End Sub

Function MakeKeyDesc(Ktype As TRKeyType) As String

    If Ktype = TRNone And WoW64Translation = 0 Then MakeKeyDesc = "32"
    If Ktype = TRNone And WoW64Translation = KEY_WOW64_64KEY Then MakeKeyDesc = "64"
    If Ktype = TRRegKey And WoW64Translation = 0 Then MakeKeyDesc = "Reg32Key"
    If Ktype = TRRegKey And WoW64Translation = 0 Then MakeKeyDesc = "Reg32Key"
    If Ktype = TRRegKey And WoW64Translation = KEY_WOW64_64KEY Then MakeKeyDesc = "Reg64Key"
    If Ktype = TRRegVal And WoW64Translation = 0 Then MakeKeyDesc = "Reg32Val"
    If Ktype = TRRegVal And WoW64Translation = KEY_WOW64_64KEY Then MakeKeyDesc = "Reg64Val"
    If Ktype = TRFile And WoW64Translation = 0 Then MakeKeyDesc = "File32"
    If Ktype = TRDir And WoW64Translation = 0 Then MakeKeyDesc = "Dir32"
    If Ktype = TRFile And WoW64Translation = KEY_WOW64_64KEY Then MakeKeyDesc = "File64"
    If Ktype = TRDir And WoW64Translation = KEY_WOW64_64KEY Then MakeKeyDesc = "Dir64"
    If Ktype = TRProcess Then MakeKeyDesc = "Process"
    If Ktype = TRSector Then MakeKeyDesc = "Sector"
    If Ktype = TRShell Then MakeKeyDesc = "Shell"
    If Ktype = TRStream And WoW64Translation = 0 Then MakeKeyDesc = "Stream32"
    If Ktype = TRStream And WoW64Translation = KEY_WOW64_64KEY Then MakeKeyDesc = "Stream64"
    
End Function

Function ReadValue(ByVal hKey As RegistryPaths, _
                   ByVal SubKey As String, _
                   ByVal ValueName As String, _
                   Optional DataType = 0)

    Dim ReadHandle  As Long

    Dim FoundValue  As String

    Dim ValueSize   As Long
    
    Dim ValueData   As String

    Dim ReturnValue As String

    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_READ + WoW64Translation, ReadHandle)

    If ReturnValue = 0 Then
        FoundValue = Space(3200)
        ValueSize = 3200
        ReturnValue = RegQueryValueEx(ReadHandle, ValueName, 0, DataType, ByVal FoundValue, ValueSize)

        If ValueSize <> 0 And DataType = 1 Then FoundValue = Left(FoundValue, ValueSize - 1)
        If ValueSize <> 0 And DataType <> 1 Then FoundValue = Left(FoundValue, ValueSize)
        
        ValueData = ""
        ValueData = FoundValue
        ReturnValue = RegCloseKey(ReadHandle)
        ReadValue = ValueData
    End If

End Function

Function SendItem(PluginCMD As String, DDEParam As String)

    If App.LogMode = 0 Then Exit Function
    
    DDE_CreateStringHandles "Trial_Reset", "Plugin", PluginCMD
    
    If g_hDDEConv = 0 Then g_hDDEConv = DDE_Connect
    
    If g_hDDEConv Then DdeClientTransaction DDEParam, Len(DDEParam), g_hDDEConv, g_hItem, CF_TEXT, XTYP_POKE, 2000, 0

    DDE_FreeStringHandles
End Function

Function SetPluginInfo(Plugin_Info As String)

    SendItem "TR_INFO", Plugin_Info
End Function

Function SetWoW64Translation(OSType As Long)

    If OSType = 32 Then
        WoW64Translation = 0
        DisableFileRedirection True
    End If
    
    If OSType = 64 Then
        WoW64Translation = KEY_WOW64_64KEY
        DisableFileRedirection False
    End If
    
    GetDirectories
 
End Function

Function TRWoW_State() As Integer

    On Error Resume Next

    TRWoW_State = 1
    
    If Is64bit = True Then TRWoW_State = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "WoW64")

End Function

Function UpdateProgress(Value, MaxValue As Long)

    If Int((Value / MaxValue) * 100 / 5) * 5 <> LastProgress Then
        LastProgress = Int((Value / MaxValue) * 100 / 5) * 5
        SendItem "TR_PROGRESS", Str(LastProgress)
    End If
            
End Function

Function IsHex(InString As String) As Boolean

    Dim UCInString As String

    UCInString = UCase(InString)
    UCInString = Replace(UCInString, "A", "")
    UCInString = Replace(UCInString, "B", "")
    UCInString = Replace(UCInString, "C", "")
    UCInString = Replace(UCInString, "D", "")
    UCInString = Replace(UCInString, "E", "")
    UCInString = Replace(UCInString, "F", "")

    If IsNumeric(UCInString) = True Then IsHex = True Else IsHex = False
End Function
