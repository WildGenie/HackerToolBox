Attribute VB_Name = "Registry"

Public Const KEY_ENUMERATE_SUB_KEYS = &H8

Public Const KEY_READ = &H20019

Public Const ERROR_SUCCESS = 0&

Public Const KEY_QUERY_VALUE = &H1

Public Const KEY_WRITE = &H20006

Public Const KEY_WOW64_64KEY = &H100

Public Const KEY_WOW64_32KEY = &H200

Function CountKeys(ByVal hKey As RegistryPaths, ByVal SubKey As String) As Long

    Dim ReadHandle As Long

    Dim KeyName    As String

    Dim ClassName  As String

    Dim LastWrite  As FILETIME

    Dim Index      As Long
    
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
    CountKeys = KeyCount
End Function

Function CountValues(ByVal hKey As RegistryPaths, ByVal SubKey As String) As Long

    On Error Resume Next

    Dim Index          As Long

    Dim ValueName      As String

    Dim ValueLen       As Long

    Dim DataType       As Long
    
    Dim Data(0 To 254) As Byte
    
    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_QUERY_VALUE + WoW64Translation, ReadHandle)
    
    Index = 0

    Valuecount = 0

    While ReturnValue = 0

        ValueName = Space(2550)
        ValueLen = 2550
        
        ReturnValue = RegEnumValue(ReadHandle, Index, ValueName, ValueLen, ByVal 0, DataType, ByVal 0, ByVal 0)

        If ReturnValue = 0 And ValueLen > 0 Then Valuecount = Valuecount + 1
        
        Index = Index + 1

    Wend

    ReturnValue = RegCloseKey(ReadHandle)
    
    CountValues = Valuecount

End Function

Function CreateKey(hKey As RegistryPaths, SubKey As String) As Long

    CreateKey = RegCreateKey(hKey, SubKey, hKey)
    RegCloseKey hKey

End Function

Function DeleteKey(ByVal hKey As RegistryPaths, ByVal SubKey As String) As Boolean

    Dim ReadHandle As Long, handle As Long

    ReturnValue = RegOpenKeyEx(hKey, "", 0, KEY_WRITE + WoW64Translation, ReadHandle)

    If ReturnValue = 0 Then
        ReturnValue = RegDeleteKey(ReadHandle, SubKey)
        
        If ReturnValue <> 0 Then LastError = " (" & ApiErrorText(ReturnValue) & ")"

        RegCloseKey ReadHandle
        
    End If
    
    If ExistKey(hKey, SubKey) = True Then
    
        hLib = LoadLibraryA("Advapi32")

        handle = GetProcAddress(GetModuleHandle("Advapi32"), "RegDeleteKeyExA")

        If handle <> 0 Then
            FreeLibrary hLib
            
            ReturnValue = RegDeleteKeyEx(hKey, SubKey, WoW64Translation, ByVal 0)

            If ReturnValue <> 0 Then LastError = " (" & ApiErrorText(ReturnValue) & ")"
        End If
    End If

    DeleteKey = True
    
    If ExistKey(hKey, SubKey) = True Then DeleteKey = False
End Function

Function DeleteValue(ByVal hKey As RegistryPaths, _
                     ByVal SubKey As String, _
                     ByVal ValueName As String) As Boolean
    
    Dim ReadHandle As Long

    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_WRITE + WoW64Translation, ReadHandle)

    If ReturnValue = 0 Then
        ReturnValue = RegDeleteValue(ReadHandle, ValueName)
        
        If ApiErrorText(ReturnValue) <> "" Then LastError = " (" & ApiErrorText(ReturnValue) & ")"

        RegCloseKey ReadHandle
        
        DeleteValue = True
        
    Else
        DeleteValue = False
    End If

End Function

Function EnumAllRegKeys(ByVal hKey As RegistryPaths, _
                        ByVal SubKey As String, _
                        Optional FastScan = 0)

    Erase AllKeys()
    
    ReDim AllKeys(0) As String

    EnumAllRegKeysExecute hKey, SubKey, FastScan

End Function

Function EnumAllRegKeysExecute(ByVal hKey As RegistryPaths, _
                               ByVal SubKey As String, _
                               ByVal FastScan As Integer)

    On Error GoTo Err

    Dim ReadHandle As Long

    Dim Index      As Long

    Dim KeyName    As String

    Dim TempKey    As String
    
    Dim ClassName  As String

    Dim LastWrite  As FILETIME

    If RegOpenKeyEx(hKey, SubKey, 0, KEY_ENUMERATE_SUB_KEYS + WoW64Translation, ReadHandle) Then Exit Function
    
    If FastScan = 1 Then
        If Replace(LCase(SubKey), "software\classes", "") <> LCase(SubKey) Then Exit Function
        If Replace(LCase(SubKey), "software\microsoft", "") <> LCase(SubKey) Then Exit Function
    End If

    If ReadHandle <> 0 Then

        Do While ReturnValue = 0
            KeyName = Space(255)
            ValueLen = 255
        
            ReturnValue = RegEnumKeyEx(ReadHandle, Index, KeyName, ValueLen, ByVal 0, ClassName, DataLen, LastWrite)
             
            Index = Index + 1
             
            KeyName = Left(KeyName, ValueLen)
        
            If SubKey <> "" Then
                TempKey = SubKey & "\" & KeyName
            Else
                TempKey = KeyName
            End If
        
            If ReturnValue = 0 Then
                ReDim Preserve AllKeys(UBound(AllKeys) + 1) As String
                AllKeys(UBound(AllKeys)) = TempKey
   
                If LCase(KeyName) <> "wow6432node" And Replace(KeyName, Chr(0), "") = KeyName Then
                    Call EnumAllRegKeysExecute(hKey, TempKey, FastScan)
                End If
            End If
             
            DoEvents

            If Abort = 2 Then SubPause
            If Abort = 1 Then Exit Function
        Loop

    End If

Err:
    RegCloseKey ReadHandle
End Function

Function EnumAllRegKeysLog(ByVal hKey As RegistryPaths, _
                           ByVal SubKey As String, _
                           Optional FastScan = 0)

    If Is64bitFast = True Then If WoW64Translation = KEY_WOW64_64KEY Then RegST = " 64bit" Else RegST = " 32bit"

    AddToLog "Searching " & PackerList(PackerIDX).Name & RegST & " keys in " & RegHKtoStr(hKey, SubKey)
    
    EnumAllRegKeys hKey, SubKey, FastScan

End Function

Function EnumKeys(ByVal hKey As RegistryPaths, _
                  ByVal SubKey As String, _
                  Optional ArrayIndex = 0)

    Dim ReadHandle As Long

    Dim KeyName    As String

    Dim ClassName  As String

    Dim LastWrite  As FILETIME

    Dim Index      As Long

    Dim FoundPath  As String
    
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

        If Abort = 2 Then SubPause
        If Abort = 1 Then Exit Function

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

Function EnumKeysLog(ByVal hKey As RegistryPaths, _
                     ByVal SubKey As String, _
                     Optional ArrayIndex = 0)
    
    If Is64bitFast = True Then If WoW64Translation = KEY_WOW64_64KEY Then RegST = " 64bit" Else RegST = " 32bit"
    AddToLog "Searching " & PackerList(PackerIDX).Name & RegST & " keys in " & RegHKtoStr(hKey, SubKey)
    
    EnumKeys hKey, SubKey, ArrayIndex

End Function

Function EnumValues(ByVal hKey As RegistryPaths, ByVal SubKey As String)

    On Error Resume Next

    Dim Index          As Long

    Dim ValueName      As String

    Dim ValueLen       As Long

    Dim DataLen        As Long

    Dim DataType       As Long

    Dim FoundValueData As String
    
    Erase AllValues()
    
    ReDim AllValues(0)

    On Error Resume Next

    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_QUERY_VALUE + WoW64Translation, ReadHandle)

    While ReturnValue = 0

        ValueName = Space(255)
        ValueLen = 255
        DataLen = 255

        If Abort = 2 Then SubPause
        If Abort = 1 Then Exit Function
    
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

Function EnumValuesAdd(ByVal hKey As RegistryPaths, ByVal SubKey As String)

    On Error Resume Next

    Dim Index          As Long

    Dim ValueName      As String

    Dim ValueLen       As Long

    Dim DataLen        As Long

    Dim DataType       As Long

    Dim Data(0 To 254) As Byte

    Dim FoundValueName As String

    Dim FoundValueData As String

    Dim TempValue      As String

    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_QUERY_VALUE + WoW64Translation, ReadHandle)
    Index = 0

    While ReturnValue = 0

        ValueName = Space(255)
        ValueLen = 255

        If Abort = 2 Then SubPause
        If Abort = 1 Then Exit Function

        ReturnValue = RegEnumValue(ReadHandle, Index, ValueName, ValueLen, ByVal 0, DataType, ByVal 0, ByVal 0)

        If ReturnValue = 0 Then
            ValueName = Left(ValueName, ValueLen)
 
            If PackerIDX <> 0 Then AddRegVal RegHKtoStr(hKey, SubKey) & "\" & ValueName

        End If
   
        Index = Index + 1

    Wend

    ReturnValue = RegCloseKey(ReadHandle)

End Function

Function EnumValuesDel(ByVal hKey As RegistryPaths, ByVal SubKey As String)

    On Error Resume Next

    Dim Index          As Long

    Dim ValueName      As String

    Dim ValueLen       As Long

    Dim DataLen        As Long

    Dim DataType       As Long

    Dim Data(0 To 254) As Byte

    On Error Resume Next

    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_QUERY_VALUE + WoW64Translation, ReadHandle)

    While ReturnValue = 0

        ValueName = Space(255)
        ValueLen = 255
        DataLen = 255
        
        ReturnValue = RegEnumValue(ReadHandle, Index, ValueName, ValueLen, ByVal 0, DataType, Data(0), DataLen)

        If ReturnValue = 234 Then ReturnValue = RegEnumValue(ReadHandle, Index, ValueName, ValueLen, ByVal 0, DataType, ByVal 0, ByVal 0)
        
        DeleteValue hKey, SubKey, Left(ValueName, ValueLen)
        
        Index = Index + 1

    Wend
  
    ReturnValue = RegCloseKey(ReadHandle)

End Function

Function ExistKey(ByVal hKey As RegistryPaths, ByVal SubKey As String) As Boolean
    
    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_READ + WoW64Translation, ReadHandle)

    If ReturnValue = 0 Then
        
        ExistKey = True
    
    Else
        ExistKey = False

    End If
    
    RegCloseKey ReadHandle
End Function

Function ExistKeyAdd(ByVal hKey As RegistryPaths, ByVal SubKey As String)

    If ExistKey(hKey, SubKey) = True Then AddRegKey RegHKtoStr(hKey, SubKey)

End Function

Function ExistValue(ByVal hKey As RegistryPaths, _
                    ByVal SubKey As String, _
                    ByVal ValueName As String) As Boolean

    Dim FoundValue As String

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

Function ExistValueAdd(ByVal hKey As RegistryPaths, _
                       ByVal SubKey As String, _
                       ByVal ValueName As String)

    If ExistValue(hKey, SubKey, ValueName) = True Then AddRegVal RegHKtoStr(hKey, SubKey) & "\" & ValueName

End Function

Function GetTime(hKey As RegistryPaths, SubKey, SubValue) As SYSTEMTIME

    Dim LastWrite As FILETIME
    
    Dim LocalTime As FILETIME

    Dim LastTimeS As SYSTEMTIME

    If SubKey = "" Then Exit Function
    
    If Left(SubKey, 1) = "\" Then SubKey = Right(SubKey, Len(SubKey) - 1)

    RegOpenKeyEx hKey, SubKey, 0, KEY_QUERY_VALUE + WoW64Translation, QueryHandle
    ReturnValue = RegQueryInfoKey(QueryHandle, SubKey, Len(SubKey), ByVal 0, vbNull, vbNull, vbNull, vbNull, vbNull, vbNull, vbNull, LastWrite)

    FileTimeToLocalFileTime LastWrite, LocalTime
    FileTimeToSystemTime LocalTime, LastTimeS
    RegCloseKey QueryHandle
    
    GetTime = LastTimeS
End Function

Function ParseKey(KeyAdd, hKey As RegistryPaths, SubKey)

    If Left(UCase(KeyAdd), 17) = "HKEY_CLASSES_ROOT" Then
        hKey = HKEY_CLASSES_ROOT
        SubKey = Right(KeyAdd, Len(KeyAdd) - 18)
               
    ElseIf Left(UCase(KeyAdd), 17) = "HKEY_CURRENT_USER" Then
        hKey = HKEY_CURRENT_USER
        SubKey = Right(KeyAdd, Len(KeyAdd) - 18)

    ElseIf Left(UCase(KeyAdd), 18) = "HKEY_LOCAL_MACHINE" Then
        hKey = HKEY_LOCAL_MACHINE
        SubKey = Right(KeyAdd, Len(KeyAdd) - 19)
            
    ElseIf Left(UCase(KeyAdd), 10) = "HKEY_USERS" Then
        hKey = HKEY_USERS
        SubKey = Right(KeyAdd, Len(KeyAdd) - 11)

    End If

End Function

Function ReadValue(ByVal hKey As RegistryPaths, _
                   ByVal SubKey As String, _
                   ByVal ValueName As String, _
                   Optional DataType = 0)

    Dim ReadHandle    As Long

    Dim FoundValue    As String
    
    Dim FoundValueBin As Byte

    Dim ValueSize     As Long
    
    Dim ValueData     As String

    Dim TempValue     As String

    ReturnValue = RegOpenKeyEx(hKey, SubKey, 0, KEY_READ + WoW64Translation, ReadHandle)

    If ReturnValue = 0 Then
        FoundValue = Space(3200)
        ValueSize = 3200
        ReturnValue = RegQueryValueEx(ReadHandle, ValueName, 0, DataType, ByVal FoundValue, ValueSize)

        If ValueSize <> 0 Then FoundValue = Left(FoundValue, ValueSize - 1)
        
        ValueData = ""
        ValueData = FoundValue
        ReturnValue = RegCloseKey(ReadHandle)
        ReadValue = ValueData
    End If

End Function

Function SetValue(hKey As RegistryPaths, _
                  SubKey As String, _
                  Entry As String, _
                  Value, _
                  Optional DataType = REG_SZ)

    Dim WriteHandle As Long
    
    rtn = RegOpenKeyEx(hKey, SubKey, 0, KEY_WRITE, WriteHandle)
    rtn = RegSetValueEx(WriteHandle, Entry, 0, DataType, ByVal Value, Len(Value))
    RegCloseKey WriteHandle

End Function

