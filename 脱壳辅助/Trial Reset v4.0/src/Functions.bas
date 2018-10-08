Attribute VB_Name = "Functions"

Function AddDir(SubKey, Optional PackName = "")

    AddToList TRDir, SubKey, PackName
End Function

Function AddFile(SubKey, Optional PackName = "")

    AddToList TRFile, SubKey, PackName
End Function

Function AddPacker(PackIndex, _
                   PackName, _
                   Optional PlugName = "", _
                   Optional Platform = P32bit, _
                   Optional HomePage = "", _
                   Optional SupVer = "", _
                   Optional LastVer = "")

    PackerList(UBound(PackerList)).Name = PackName
    PackerList(UBound(PackerList)).Value = PackIndex
    PackerList(UBound(PackerList)).FileName = PlugName
    PackerList(UBound(PackerList)).HomePage = HomePage
    PackerList(UBound(PackerList)).SupVer = SupVer
    PackerList(UBound(PackerList)).LastVer = LastVer
    PackerList(UBound(PackerList)).Platform = Platform
    
    If PackIndex <> UBound(PackerList) Then MsgBox PackName & " wrong IDX", vbCritical
    
    ReDim Preserve PackerList(UBound(PackerList) + 1)
End Function

Function AddProcess(SubKey, Optional PackName = "")

    AddToList TRProcess, SubKey, PackName
End Function

Function AddRegKey(SubKey, Optional PackName = "")

    AddToList TRRegKey, SubKey, PackName
End Function

Function AddRegVal(SubKey, Optional PackName = "")

    AddToList TRRegVal, SubKey, PackName
End Function

Function AddSector(SubKey, Optional PackName = "")

    AddToList TRSector, SubKey, PackName
End Function

Function AddStream(SubKey, Optional PackName = "")

    AddToList TRStream, SubKey, PackName
End Function

Function AddToList(KType As TRKeyType, _
                   SubKey, _
                   Optional PackName = "", _
                   Optional KeyType = "")

    On Error Resume Next

    If KeyType = "" Then
        If KType = 0 Then
            KeyType = GetAutoType(DecodePath(SubKey, 32))
        Else

            If KType = TRRegKey And WoW64Translation = 0 Then KeyType = "Reg32Key"
            If KType = TRRegKey And WoW64Translation = KEY_WOW64_64KEY Then KeyType = "Reg64Key"
            If KType = TRRegVal And WoW64Translation = 0 Then KeyType = "Reg32Val"
            If KType = TRRegVal And WoW64Translation = KEY_WOW64_64KEY Then KeyType = "Reg64Val"
            If KType = TRFile And WoW64Translation = 0 Then KeyType = "File32"
            If KType = TRDir And WoW64Translation = 0 Then KeyType = "Dir32"
            If KType = TRFile And WoW64Translation = KEY_WOW64_64KEY Then KeyType = "File64"
            If KType = TRDir And WoW64Translation = KEY_WOW64_64KEY Then KeyType = "Dir64"
            If KType = TRProcess Then KeyType = "Process"
            If KType = TRSector Then KeyType = "Sector"
            If KType = TRShell Then KeyType = "Shell"
            If KType = TRStream And WoW64Translation = 0 Then KeyType = "Stream32"
            If KType = TRStream And WoW64Translation = KEY_WOW64_64KEY Then KeyType = "Stream64"

        End If

    Else
        
        If LCase(KeyType) = "file" Or LCase(KeyType) = "dir" Then KeyType = KeyType & "32"
    End If

    KeyName = DecodePath(SubKey, KeyType)
    KeyName = FormatKey(KeyName, KeyType)
    CurKeyTag = PackerIDX

    If CurKeyTag = 0 And PackName <> "" Then CurKeyTag = ParsePackValue(PackName)
    If PackName = "" Then PackName = ParsePackName(CurKeyTag)
    If PackName = "" Then PackName = "Custom"

    If PackerList(CurKeyTag).FileName <> "" Then
        Icon = FindIcon("PLG_" & ParsePackName(CurKeyTag))
    Else
        Icon = FindIcon(ParsePackName(CurKeyTag))
    End If

    If CurKeyTag <> 0 And Icon = 1 Then Icon = FindIcon(PackName)

    For i = 1 To FRMMain.ListView1.ListItems.Count

        If PackName = FRMMain.ListView1.ListItems(i).Text And UCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = UCase(KeyType) And UCase(FRMMain.ListView1.ListItems(i).SubItems(2)) = UCase(KeyName) Then
            GetKeyInformation FRMMain.ListView1.ListItems(i).SubItems(2), FRMMain.ListView1.ListItems(i).SubItems(1), KeyDate, ExistK
            FRMMain.ListView1.ListItems(i).SubItems(3) = KeyDate
            FRMMain.ListView1.ListItems(i).SubItems(4) = ExistK
            
            Exit Function

        End If

    Next

    If FRMProtect.LSTProt.ListItems.Count > 0 And FRMMain.MNHideProtectedKey.Checked = True Then

        For i = 1 To FRMProtect.LSTProt.ListItems.Count

            If FRMProtect.LSTProt.ListItems(i).Checked = True Then
                If Len(KeyName) > Len(FRMProtect.LSTProt.ListItems(i).SubItems(2)) Then ll = Len(FRMProtect.LSTProt.ListItems(i).SubItems(2)) Else ll = Len(KeyName)
                If Left(LCase(KeyName), ll) = Left(LCase(FRMProtect.LSTProt.ListItems(i).SubItems(2)), ll) And LCase(KeyType) = LCase(FRMProtect.LSTProt.ListItems(i).SubItems(1)) Then
                    If Len(KeyName) > 3 Then HiddenKeyFound = HiddenKeyFound + 1

                    Exit Function

                End If
            End If

        Next

    End If

    GetKeyInformation KeyName, KeyType, KeyDate, ExistK

    If Len(KeyName) > 3 Then
    
        If FRMMain.ListView1.ListItems.Count > 0 Then
            ItemsCount = ItemsCount + 1
        Else
            ItemsCount = 1
        End If
        
        Set Lister = FRMMain.ListView1.ListItems.Add()
        Lister.SmallIcon = Icon
        Lister.Text = PackName
        Lister.SubItems(1) = KeyType
        Lister.SubItems(2) = KeyName
        Lister.SubItems(3) = KeyDate
        Lister.SubItems(4) = ExistK
        Lister.SubItems(5) = Format(ItemsCount, "000")
        Lister.Checked = True
        Lister.Tag = CurKeyTag
        
        ResizeWin 1

        DoEvents
    End If

End Function

Function AddToLog(ByVal Text As String, Optional NotShow = 0)

    On Error Resume Next

    Text = Replace(Replace(Text, " All ", " "), "_", " ")
    Text = Replace(Text, "HKEY CLASSES ROOT", "HKEY_CLASSES_ROOT")
    Text = Replace(Text, "HKEY LOCAL MACHINE", "HKEY_LOCAL_MACHINE")
    Text = Replace(Text, "HKEY USERS", "HKEY_USERS")
    Text = Replace(Text, "HKEY CURRENT USER", "HKEY_CURRENT_USER")
    Text = Replace(Text, "  ", " ")

    If NotShow = 0 Then FRMMain.StatusBar1.Panels(1).Text = Text

    myName = VB.App.Path & "\TrialReset.log"

    If FRMMain.MNCreateLog.Checked = True Then
        Set fs2 = CreateObject("Scripting.FileSystemObject")
        Set F1 = fs2.GetFile(myName)
        ass = F1.Size
        Set F1 = fs2.openTextFile(myName)
        Txtr = F1.Read(ass)

        Set a1 = fs2.CreateTextFile(myName, True)
        a1.write Txtr
        CLL = ("[" & Date & " " & Time & "] " & Replace(Text, "  ", " "))
        a1.writeline CLL
        a1.Close
    End If

End Function

Function AddToProtList(PackName As String, KeyName As String, KeyType, IsChecked)

    Set Lister = FRMProtect.LSTProt.ListItems.Add()
    Lister.Text = Replace(PackName, Chr(0), "")
    Lister.SubItems(1) = KeyType
    Lister.SubItems(2) = FormatKey(KeyName, KeyType)
    Lister.Checked = Replace(Replace(IsChecked, 1, True), 0, False)
        
End Function

Function AddToSTClear(PackName As String, KeyName As String, KeyType, IsChecked)
    
    Set Lister = FRMSTClear.LSTC.ListItems.Add()
    Lister.Text = Replace(PackName, Chr(0), "")
    Lister.SubItems(1) = KeyType
    Lister.SubItems(2) = FormatKey(KeyName, KeyType)
    Lister.Checked = Replace(Replace(IsChecked, 1, True), 0, False)
    
End Function

Function AddTrayIcon(Icon As Long, hWndID As Long, Optional ToolTip As String)

    TrayOPT.cbSize = Len(TrayOPT)
    TrayOPT.hwnd = hWndID
    TrayOPT.uID = vbNull
    TrayOPT.uFlags = 2 Or 4 Or 1
    TrayOPT.uCallbackMessage = &H200
    TrayOPT.hIcon = Icon
    TrayOPT.szTip = ToolTip & vbNullChar
    Shell_NotifyIcon 0, TrayOPT
End Function

Function AnalizeOperation(i) As Boolean

    AnalizeOperation = False

    If PackerIDX = PSAll Then AnalizeOperation = True
    If FRMMain.MNShowCheckBox.Checked = True And FRMMain.ListView1.ListItems(i).Checked = True And PackerIDX = PSCheck Then AnalizeOperation = True
    If FRMMain.ListView1.ListItems(i).Selected = True And PackerIDX = PSSel Then AnalizeOperation = True
    If PackerIDX >= 0 Then If Val(FRMMain.ListView1.ListItems(i).Tag) = PackerList(PackerIDX).Value Then AnalizeOperation = True
End Function

Function ApiErrorText(ByVal ErrNum As Long) As String

    Dim msg  As String

    Dim nRet As Long

    msg = Space(1024)
    nRet = FormatMessage(&H1000, ByVal 0&, ErrNum, 0&, msg, Len(msg), ByVal 0&)

    If nRet Then
        ApiErrorText = Replace(Replace(Left(msg, nRet), vbCrLf, ""), ".", "")
    Else
        ApiErrorText = ""
    End If

End Function

Function Backup()

    On Error Resume Next
    
    Dim BackupName As String
        
    Dim si         As STARTUPINFO

    Dim pi         As PROCESS_INFORMATION
    
    Dim hKey       As RegistryPaths
        
    Set FSO = CreateObject("Scripting.FileSystemObject")
       
    MkDir (BackupPath)

    For i = 1 To FRMMain.ListView1.ListItems.Count
                
        If AnalizeOperation(i) Then
        
            AddToLog "Backup " & FRMMain.ListView1.ListItems(i).SubItems(2)
            
            If LCase(Left(FRMMain.ListView1.ListItems(i).SubItems(1), 3)) = "reg" Then
            
                CurKey = FRMMain.ListView1.ListItems(i).SubItems(2)

                SetWoW64Translation FRMMain.ListView1.ListItems(i).SubItems(1)

                ParseKey CurKey, hKey, SubKeyAdd
            
                If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "reg32val" Or LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "reg64val" Then
                    
                    Mypos = Len(SubKeyAdd)

                    Do
                        Mypos = Mypos - 1
                    Loop While Mid(SubKeyAdd, Mypos, 1) <> "\"
                    
                    KeyValue = Right(SubKeyAdd, Len(SubKeyAdd) - Mypos)
                    SubKeyAdd = Left(SubKeyAdd, Mypos)

                    Mypos = Len(CurKey)

                    Do
                        Mypos = Mypos - 1
                    Loop While Mid(CurKey, Mypos, 2) <> "\\"
                    
                    ShellKey = Left(CurKey, Mypos)

                    If ExistValue(hKey, SubKeyAdd, KeyValue) = False Then GoTo 6
                Else
                    KeyValue = ""
                    ShellKey = CurKey

                    If ExistKey(hKey, SubKeyAdd) = False Then GoTo 6
                End If
                
                Do
                    GetSystemTime pt
                    BackupName = BackupPath & FixFileName(FRMMain.ListView1.ListItems(i).Text & "_" & String(2 - Len(Month(Date)), "0") & Month(Date) & "_" & String(2 - Len(Day(Date)), "0") & Day(Date) & "_" & Year(Date) & "_" & String(2 - Len(Hour(Time)), "0") & Hour(Time) & "_" & String(2 - Len(Minute(Time)), "0") & Minute(Time) & "_" & String(2 - Len(Second(Time)), "0") & Second(Time) & "_" & String(3 - Len(pt.wMilliseconds), "0") & pt.wMilliseconds & ".reg")
                Loop While ExistFile(BackupName) = True
                
                KillF TempDir & "Reg.Temp"
                TheCmd = WindowsDir & "regedit /e """ & TempDir & "Reg.Temp"" """ & ShellKey & """"
                ExecuteCommand WindowsDir & "regedit.exe", "/e """ & TempDir & "Reg.Temp"" """ & ShellKey & """"
                BackCont = BackCont + 1
            
                Set a = FSO.GetFile(TempDir & "Reg.Temp")
                RegSize = a.Size
                Set a = FSO.openTextFile(TempDir & "Reg.Temp")
                RegTXT = a.Read(RegSize)

                If RegTXT = "" Then BackError = BackError + 1
                a.Close
                Kill (TempDir & "Reg.Temp")
                RegTXT = Replace(RegTXT, Chr(0), "")
                RegTXT = ParseRegData(RegTXT, KeyValue)
                    
                Set a = FSO.CreateTextFile(BackupName, True)
                a.write RegTXT
                a.Close

                If ExistFile(BackupName) = False Then BackError = BackError + 1
                 
                SetWoW64Translation 32
            End If

            If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "process" Then
                
            End If

            If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "sector" Then
                DiskSec = Replace(Right(FRMMain.ListView1.ListItems(i).SubItems(2), Len(FRMMain.ListView1.ListItems(i).SubItems(2)) - 5), """", "")

                If Left(DiskSec, 1) = " " Then DiskSec = Right(DiskSec, Len(DiskSec) - 1)
                DiskID = Val(DiskSec)
                Mypos = InStr(1, DiskSec, ":", 1)

                If Mypos <> 0 Then
                    SecID = Right(DiskSec, Len(DiskSec) - Mypos)

                    If Left(SecID, 1) = " " Then SecID = Right(SecID, Len(SecID) - 1)
                    
                    If SecID >= 0 And IsNumeric(DiskID) = True Then

                        Dim SectDump() As SecList

                        SectorDump SecID, 0, SectDump, DiskID

                        If UBound(SectDump) = 1 Then
                    
                            ReDim FileBinary(0)
                            ReDim FileBinary(Len(SectDump(1).SecData) / 2 - 1)
                    
                            For Z = 1 To Len(SectDump(1).SecData) / 2
                                FileBinary(Z - 1) = Val("&h" & Mid(SectDump(1).SecData, Z * 2 - 1, 2))
                            Next
                            
                            Do
                                GetSystemTime pt
                                BackupName = BackupPath & FixFileName(FRMMain.ListView1.ListItems(i).Text & "_" & "Disk" & DiskID & "_Sector" & SecID & "_" & String(2 - Len(Month(Date)), "0") & Month(Date) & "_" & String(2 - Len(Day(Date)), "0") & Day(Date) & "_" & Year(Date) & "_" & String(2 - Len(Hour(Time)), "0") & Hour(Time) & "_" & String(2 - Len(Minute(Time)), "0") & Minute(Time) & "_" & String(2 - Len(Second(Time)), "0") & Second(Time) & "_" & String(3 - Len(pt.wMilliseconds), "0") & pt.wMilliseconds & ".bin")
                            Loop While ExistFile(BackupName) = True
            
                            Open BackupName For Binary As #1
                            Put #1, , FileBinary()
                            Close #1
                            BackCont = BackCont + 1

                            If ExistFile(BackupName) = False Then BackError = BackError + 1

                        End If
                    End If
                End If
        
            End If

            If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 4) = "file" Or Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 3) = "dir" Then
                
                SP = 1
                SetWoW64Translation FRMMain.ListView1.ListItems(i).SubItems(1)

                Do While Left(Right(FRMMain.ListView1.ListItems(i).SubItems(2), SP), 1) <> "\"
                    SP = SP + 1
                Loop

                BFileName = Right(FRMMain.ListView1.ListItems(i).SubItems(2), SP - 1)
                BaseDir = Left(FRMMain.ListView1.ListItems(i).SubItems(2), Len(FRMMain.ListView1.ListItems(i).SubItems(2)) - SP + 1)
                BackCont = BackCont + 1

                If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 4) = "file" Then
                    
                    If ExistFile(FRMMain.ListView1.ListItems(i).SubItems(2)) = False Then GoTo 6
                    
                    Do
                        GetSystemTime pt
                        BackupName = FRMMain.ListView1.ListItems(i).Text & "_" & String(2 - Len(Month(Date)), "0") & Month(Date) & "_" & String(2 - Len(Day(Date)), "0") & Day(Date) & "_" & Year(Date) & "_" & String(2 - Len(Hour(Time)), "0") & Hour(Time) & "_" & String(2 - Len(Minute(Time)), "0") & Minute(Time) & "_" & String(2 - Len(Second(Time)), "0") & Second(Time) & "_" & String(3 - Len(pt.wMilliseconds), "0") & pt.wMilliseconds & "\"
                    Loop While ExistDir(BackupPath & BackupName) = True
                                              
                    BATFile = "Copy """ & BackupName & BFileName & """ """ & BaseDir & """"
                        
                    MkDir BackupPath & BackupName
                        
                    Set a = FSO.GetFile(FRMMain.ListView1.ListItems(i).SubItems(2))
                    a.Copy BackupPath & BackupName & "\"

                    Set a = FSO.CreateTextFile(BackupPath & Replace(BackupName, "\", "") & ".bat", True)
                    a.write BATFile
                    a.Close

                    If ExistFile(BackupPath & Replace(BackupName, "\", "") & ".bat") = False Then BackError = BackError + 1
                Else

                    If ExistDir(FRMMain.ListView1.ListItems(i).SubItems(2)) = False Then GoTo 6
                    BaseDir = Left(BaseDir, Len(BaseDir) - 1)
                    SP = 1

                    Do While Right(BaseDir, 1) <> "\"
                        BaseDir = Left(BaseDir, Len(BaseDir) - 1)
                    Loop

                    BaseDir = Left(BaseDir, Len(BaseDir) - 1)
                    
                    Do
                        GetSystemTime pt
                        BackupName = FRMMain.ListView1.ListItems(i).Text & "_" & String(2 - Len(Month(Date)), "0") & Month(Date) & "_" & String(2 - Len(Day(Date)), "0") & Day(Date) & "_" & Year(Date) & "_" & String(2 - Len(Hour(Time)), "0") & Hour(Time) & "_" & String(2 - Len(Minute(Time)), "0") & Minute(Time) & "_" & String(2 - Len(Second(Time)), "0") & Second(Time) & "_" & String(3 - Len(pt.wMilliseconds), "0") & pt.wMilliseconds & "\"
                    Loop While ExistDir(BackupPath & BackupName) = True

                    BATFile = "XCopy """ & Left(BackupName, Len(BackupName) - 1) & """ """ & BaseDir & """ /E"
                                        
                    MkDir (BackupPath & BackupName)

                    Set a = FSO.GetFolder(FRMMain.ListView1.ListItems(i).SubItems(2))
                    a.Copy BackupPath & BackupName & "\"
                    Set a = FSO.CreateTextFile(BackupPath & Left(BackupName, Len(BackupName) - 1) & ".bat", True)
                    a.write BATFile
                    a.Close
                    
                    If ExistFile(BackupPath & Left(BackupName, Len(BackupName) - 1) & ".bat") = False Then BackError = BackError + 1

                End If
                
                SetWoW64Translation 32
            End If
        End If

6   Next
    
    PackerName = PackerList(PackerIDX).Name
    
    If BackError > 0 Then
        AddToLog (Val(BackCont) - Val(BackError)) & " " & PackerName & " keys backup and " & BackError & " errors"
    Else
        AddToLog (Val(BackCont)) & " " & PackerName & " keys backup"
    End If
    
End Function

Function Command_Line(CLine)

    If UCase(CLine) = "/AUTOCLEANING" Then
        ACDelay = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Autocleaning Delay")

        If IsNumeric(ACDelay) = False Then ACDelay = 5000
        Sleep ACDelay
        STLClear

        Exit Function

    End If

    If ExistFile(CLine) = True Then
        LoadF CLine
    Else
        
        If Replace(CLine, "/silent", "") = CLine Then FRMMain.Show
        
        CLine = CLine & "/"

        Do While Replace(CLine, "/", "") <> CLine
            Mypos = InStr(1, CLine, "/", 1)
            CCommReal = Left(CLine, Mypos - 1)
            CCOmm = Replace(CCommReal, " ", "")
            CLine = Right(CLine, Len(CLine) - Mypos)
            
            If CCOmm <> "" Then ComLineCount = ComLineCount + 1
            
            For t = 1 To UBound(PackerList)

                If Replace(LCase(PackerList(t).Name), " ", "") = LCase(CCOmm) And CCOmm <> "" Then
                    PackerIDX = PackerList(t).Value
                    Operation 1, "", 1
                    ComLineCountCE = ComLineCountCE + 1
                End If

            Next
            
            If CCOmm = "enigmafull" Then PackerIDX = Enigma: Operation 5: ComLineCountCE = ComLineCountCE + 1
            If CCOmm = "protectionplusfull" Then PackerIDX = ProtectionPlus:  Operation 5: ComLineCountCE = ComLineCountCE + 1

            If CCOmm = "all" Then PackerIDX = PSAll: Operation 1, "", 1: ComLineCountCE = ComLineCountCE + 1
            
            If Left(CCOmm, 4) = "file" Then
                PackerIDX = PSAll
                CCOmm = Right(CCommReal, Len(CCommReal) - 4)

                If Left(CCOmm, 1) = " " Then CCOmm = Right(CCOmm, Len(CCOmm) - 1)
                If Replace(CCOmm, "\", "") = CCOmm And ExistFile(CCOmm) = False Then CCOmm = KeysListPath & CCOmm
                If ExistFile(CCOmm) = True Then LoadF CCOmm: ComLineCountCE = ComLineCountCE + 1
            End If
            
            If Left(CCOmm, 6) = "plugin" Then
                CCOmm = Right(CCommReal, Len(CCommReal) - 6)

                If Left(CCOmm, 1) = " " Then CCOmm = Right(CCOmm, Len(CCOmm) - 1)
                If Right(CCOmm, 1) = " " Then CCOmm = Left(CCOmm, Len(CCOmm) - 1)
                If Right(CCOmm, 1) = " " Then CCOmm = Left(CCOmm, Len(CCOmm) - 1)
                If Right(CCOmm, 4) = ".dll" Then CCOmm = Left(CCOmm, Len(CCOmm) - 4)
                PackerIDX = ParsePackValue(CCOmm)

                If PackerIDX <> 0 Then LoadPlugin PackerList(PackerIDX).FileName, 0: ComLineCountCE = ComLineCountCE + 1
            End If
            
            If CCOmm = "backup" Then MakeBack = 1: ComLineCountCE = ComLineCountCE + 1
            If CCOmm = "clear" Then MakeClear = 1: ComLineCountCE = ComLineCountCE + 1
            If CCOmm = "silent" Then IsSilent = 1: ComLineCountCE = ComLineCountCE + 1
        Loop
        
        If Val(MakeBack) = 1 Then PackerIDX = PSAll: Operation 3
        If Val(MakeClear) = 1 Then PackerIDX = PSAll: Operation 2
        If Val(IsSilent) = 1 Then KillApp GetCurrentProcessId
        
        CLStatus = Val(ComLineCountCE) & " Commands executed, "
        
        If Val(ComLineCountCE) < Val(ComLineCount) Then CLStatus = CLStatus & (Val(ComLineCount) - Val(ComLineCountCE)) & " Commands Errors, "
         
        CLStatus = CLStatus & FRMMain.ListView1.ListItems.Count & " Keys Found"
        
        AddToLog CLStatus
            
    End If

End Function

Function DDECallback(ByVal uType As Long, _
                     ByVal uFmt As Long, _
                     ByVal hConv As Long, _
                     ByVal hszTopic As Long, _
                     ByVal hszItem As Long, _
                     ByVal hData As Long, _
                     ByVal dwData1 As Long, _
                     ByVal dwData2 As Long) As Long
    
    Dim iCount  As Long

    Dim Buffers As String

    Dim Ret     As Long
    
    Select Case uType

        Case XTYP_CONNECT
            Ret = DDE_FACK

        Case XTYP_POKE

            iCount = DdeQueryString(lInstID, hszItem, vbNullString, 0, CP_WINANSI)
            Buffers = Space(iCount)
            DdeQueryString lInstID, hszItem, Buffers, iCount + 1, CP_WINANSI

            Buffers = UCase(Buffers)
            
            DDE_Count = DDE_Count + 1
            
            Select Case Buffers

                Case "TR_ADDKEY"

                    If Val(PluginInfo) = 0 Then
                        iCount = DdeGetData(ByVal hData, vbNullString, 0, 0)
                        Buffers = Space(iCount)
                        DdeGetData ByVal hData, Buffers, iCount, 0
                        CL = Buffers
                        
                        If Buffers <> "" Then
                                    
                            Mypos = InStr(1, CL, vbTab, 1)
                            PackName = Mid(CL, 1, Mypos - 1)
                            KeyName = Right(CL, Len(CL) - Mypos)
                            
                            If Replace(KeyName, vbTab, "") = KeyName Then
                                KeyType = GetAutoType(KeyName)
                            Else
                                Mypos = InStr(1, KeyName, vbTab, 1)
                                KeyType = Mid(KeyName, 1, Mypos - 1)
                                KeyName = Right(KeyName, Len(KeyName) - Mypos)

                                If Val(KeyType) = 32 Or Val(KeyType) = 64 Then KeyType = GetAutoType(KeyName, Val(KeyType))
                            End If

                            AddToList 0, KeyName, PackName, KeyType
                        End If
                    End If

                    Ret = DDE_FACK
                    
                Case "TR_ADDKEYVERIFY"

                    If Val(PluginInfo) = 0 Then
                        iCount = DdeGetData(ByVal hData, vbNullString, 0, 0)
                        Buffers = Space(iCount)
                        DdeGetData ByVal hData, Buffers, iCount, 0
                        CL = Buffers
                        
                        If Buffers <> "" Then
                                    
                            Mypos = InStr(1, CL, vbTab, 1)
                            PackName = Mid(CL, 1, Mypos - 1)
                            KeyName = Right(CL, Len(CL) - Mypos)

                            If Replace(KeyName, vbTab, "") = KeyName Then
                                KeyType = GetAutoType(KeyName)
                            Else
                                Mypos = InStr(1, KeyName, vbTab, 1)
                                KeyType = Mid(KeyName, 1, Mypos - 1)
                                KeyName = Right(KeyName, Len(KeyName) - Mypos)
                            
                                If Val(KeyType) = 32 Or Val(KeyType) = 64 Then KeyType = GetAutoType(KeyName, Val(KeyType))
                            End If
                               
                            If GetKeyInformation(KeyName, KeyType, KeyDate, ExistK, 1) = True Then AddToList 0, KeyName, PackName, KeyType
                        End If
                    End If

                    Ret = DDE_FACK

                Case "TR_INFO"
                    
                    If Val(PluginInfo) = 1 Then
                        iCount = DdeGetData(ByVal hData, vbNullString, 0, 0)
                        Buffers = Space(iCount)
                        DdeGetData ByVal hData, Buffers, iCount, 0
                        DDE_Count = -1
                                
                        If Buffers <> "" Then

                            CurPluginPID = FindProcess(PackerList(PackerIDX).FileName)

                            If CurPluginPID <> 0 Then KillApp CurPluginPID

                            MsgBox Buffers, vbInformation

                        End If
                        
                    End If
            
                    Ret = DDE_FACK

                Case "TR_MSG"

                    iCount = DdeGetData(ByVal hData, vbNullString, 0, 0)
                    Buffers = Space(iCount)
                    DdeGetData ByVal hData, Buffers, iCount, 0
                                
                    If Buffers <> "" Then MsgBox Buffers, vbInformation
                    Ret = DDE_FACK
                    
                Case "TR_PROGRESS"

                    If Val(PluginInfo) = 0 Then
                        iCount = DdeGetData(ByVal hData, vbNullString, 0, 0)
                        Buffers = Space(iCount)
                        DdeGetData ByVal hData, Buffers, iCount, 0
                                    
                        If Val(Buffers) <= 100 And Val(Buffers) >= 0 Then FRMMain.StatusBar1.Panels(3) = Int(Val(Buffers)) & "%"
                    End If
                    
                    Ret = DDE_FACK
                    
                Case "TR_LOG"

                    If Val(PluginInfo) = 0 Then
                        iCount = DdeGetData(ByVal hData, vbNullString, 0, 0)
                        Buffers = Space(iCount)
                        DdeGetData ByVal hData, Buffers, iCount, 0
                                
                        If Buffers <> "" Then AddToLog Buffers
                    End If
                    
                    Ret = DDE_FACK
                    
                Case "TR_SCAN"

                    If Val(PluginInfo) = 0 Then
                        iCount = DdeGetData(ByVal hData, vbNullString, 0, 0)
                        Buffers = Space(iCount)
                        DdeGetData ByVal hData, Buffers, iCount, 0
   
                        DDEID = ParsePackValue(Buffers)
                        
                        If DDEID <> 0 Then
                            CurPluginPID = FindProcess(PackerList(PackerIDX).FileName)
                            SuspendResumeProcess CurPluginPID, True
                            PackerIDXOld = PackerIDX
                            PackerIDX = DDEID
                            Operation 1
                            PackerIDX = PackerIDXOld
                            SuspendResumeProcess CurPluginPID, False
                        Else
                            AddToLog "Unknown scan name " & Buffers, 1
                        End If

                    End If

                Case "TR_ENDMSG"
                
                    If Val(PluginInfo) = 0 Then
                        iCount = DdeGetData(ByVal hData, vbNullString, 0, 0)
                        Buffers = Space(iCount)
                        DdeGetData ByVal hData, Buffers, iCount, 0
                                
                        If Buffers <> "" Then PlugEndMSG = Buffers
                    End If
                    
                    Ret = DDE_FACK

                Case "TR_NOPE"

                    Ret = DDE_FACK
                    
                Case "TR_LOCK"

                    FRMMain.Enabled = False
                    
                    Ret = DDE_FACK
                    
                Case "TR_UNLOCK"
                
                    FRMMain.Enabled = True

                    Ret = DDE_FACK
                    
                Case Else
                    Ret = DDE_FNOTPROCESSED
                
            End Select
                                    
    End Select
    
    DDECallback = Ret

End Function

Function DecodePath(IniPath, KType) As String

    Path = IniPath

    If Mid(Path, 2, 2) = ":\" Or Left(Path, 1) = "%" Or Left(LCase(Path), 5) = "file:" Or Left(LCase(Path), 4) = "dir:" Then
        OldTran = WoW64Translation
        SetWoW64Translation KType
        Path = Replace(Path, "%S\", SystemDir)
        Path = Replace(Path, "%W\", WindowsDir)
        Path = Replace(Path, "%T\", TempDir)
        Path = Replace(Path, "%C\", CAppDataDir)
        Path = Replace(Path, "%P\", ProgramFilesDir)
        Path = Replace(Path, "%A\", AppDataDir)
        Path = Replace(Path, "%D\", CDocumentsDir)
        Path = Replace(Path, "%F\", CommonFilesDir)
        Path = Replace(Path, "%U\", CurUserDir)
        Path = Replace(Path, "%PD\", ProgramDataDir)
        Path = Replace(Path, "%UB\", UsersBaseDir)
        SetWoW64Translation OldTran
    End If
    
    If Left(UCase(Path), 5) = "HKLM\" Then Path = "HKEY_LOCAL_MACHINE" & Right(Path, Len(Path) - 4)
    If Left(UCase(Path), 5) = "HKCU\" Then Path = "HKEY_CURRENT_USER" & Right(Path, Len(Path) - 4)
    If Left(UCase(Path), 5) = "HKCR\" Then Path = "HKEY_CLASSES_ROOT" & Right(Path, Len(Path) - 4)
    If Left(UCase(Path), 4) = "HKU\" Then Path = "HKEY_USERS" & Right(Path, Len(Path) - 3)
    
    If Left(UCase(Path), 5) = "HKEY_" Or Left(LCase(Path), 5) = "reg32" Or Left(LCase(Path), 5) = "reg64" Then
        Path = Replace(Path, "%B\", UBase2)
        'Used for import old file
        Path = Replace(Path, "%B_\", UBase1)
        Path = Replace(Path, "%B1\", UBase1)
        Path = Replace(Path, "%B2\", UBase2)
        
        If Left(UCase(Path), Len(UBase2) + 11) = "HKEY_USERS\" & UCase(UBase2) Then Path = "HKEY_CURRENT_USER\" & Right(Path, Len(Path) - (Len(UBase2) + 11))
        If Left(UCase(Path), 36) = "HKEY_LOCAL_MACHINE\SOFTWARE\CLASSES\" Then Path = "HKEY_CLASSES_ROOT\" & Right(Path, Len(Path) - 36)
        
    End If

    DecodePath = Path
    
End Function

Function DeleteDirBat(DirPath)

    On Error Resume Next

    Dim ShoP    As String * 512

    Dim ShoPBat As String * 512
    
    If Right(DirPath, 1) <> "\" Then DirPath = DirPath & "\"
    
    If ExistDir(DirPath) = False Then Exit Function

    GetShortPathName DirPath, ShoP, Len(DirPath)
    DelDir = Replace(TrimNull(ShoP), Chr(32), "")

    SPos = Len(DelDir) - 1

    Do While Mid(DelDir, SPos, 1) <> "\"
        SPos = SPos - 1
    Loop

    BaseDir = Left(DelDir, SPos)

    Set fs2 = CreateObject("Scripting.FileSystemObject")
    Set a1 = fs2.CreateTextFile(BaseDir & "SuperRemove.bat", True)
    a1.writeline ("RMDIR /q /s " & DelDir)
    a1.write ("del " & BaseDir & "\SuperRemove.bat")
    a1.Close

    ExecuteCommand BaseDir & "SuperRemove.bat", ""
    
    Do While ExistFile(BaseDir & "SuperRemove.bat") = True
        Sleep 50
    Loop

End Function

Function DisableFileRed(BolVal)

    On Error GoTo Not64

    hLib = LoadLibraryA("kernel32")

    Dim handle As Long, bolFunc As Boolean

    handle = GetProcAddress(GetModuleHandle("kernel32"), "Wow64EnableWow64FsRedirection")

    If handle > 0 Then

        FreeLibrary hLib
        Call Wow64EnableWow64FsRedirection(BolVal)

    End If
    
    GetDirectories

Not64:

End Function

Function Empty_Array()
    
    Erase AllKeys()
    ReDim AllKeys(0) As String
    Erase AllKeys1()
    ReDim AllKeys1(0) As String
    Erase AllKeys2()
    ReDim AllKeys2(0) As String
    Erase AllKeysList()
    ReDim AllKeysList(0) As String
    Erase AllDirsList()
    ReDim AllDirsList(0) As String
    Erase AllValues()
    ReDim AllValues(0) As RegValue

End Function

Function EncodePath(IniPath, KType) As String

    Path = IniPath
    OldTran = WoW64Translation
    SetWoW64Translation KType

    If UCase(Left(Path, Len(SystemDir))) = UCase(SystemDir) Then Path = "%S\" & Right(Path, Len(Path) - Len(SystemDir))
    If UCase(Left(Path, Len(WindowsDir))) = UCase(WindowsDir) Then Path = "%W\" & Right(Path, Len(Path) - Len(WindowsDir))
    If UCase(Left(Path, Len(TempDir))) = UCase(TempDir) Then Path = "%T\" & Right(Path, Len(Path) - Len(TempDir))
    If UCase(Left(Path, Len(CAppDataDir))) = UCase(CAppDataDir) Then Path = "%C\" & Right(Path, Len(Path) - Len(CAppDataDir))
    If UCase(Left(Path, Len(ProgramFilesDir))) = UCase(ProgramFilesDir) Then Path = "%P\" & Right(Path, Len(Path) - Len(ProgramFilesDir))
    If UCase(Left(Path, Len(AppDataDir))) = UCase(AppDataDir) Then Path = "%A\" & Right(Path, Len(Path) - Len(AppDataDir))
    If UCase(Left(Path, Len(CDocumentsDir))) = UCase(CDocumentsDir) Then Path = "%D\" & Right(Path, Len(Path) - Len(CDocumentsDir))
    If UCase(Left(Path, Len(CommonFilesDir))) = UCase(CommonFilesDir) Then Path = "%F\" & Right(Path, Len(Path) - Len(CommonFilesDir))
    If UCase(Left(Path, Len(CurUserDir))) = UCase(CurUserDir) Then Path = "%U\" & Right(Path, Len(Path) - Len(CurUserDir))
    If UCase(Left(Path, Len(ProgramDataDir))) = UCase(ProgramDataDir) Then Path = "%PD\" & Right(Path, Len(Path) - Len(ProgramDataDir))
    If UCase(Left(Path, Len(UsersBaseDir))) = UCase(UsersBaseDir) Then Path = "%UB\" & Right(Path, Len(Path) - Len(UsersBaseDir))
    
    Base1 = "HKEY_USERS\" & UBase1

    If UCase(Left(Path, Len(Base1))) = UCase(Base1) Then Path = "HKEY_USERS\%B1\" & Right(Path, Len(Path) - Len(Base1))
    
    Base1 = "HKEY_USERS\" & UBase2

    If UCase(Left(Path, Len(Base1))) = UCase(Base1) Then Path = "HKEY_USERS\%B\" & Right(Path, Len(Path) - Len(Base1))
    
    If Left(UCase(Path), 19) = "HKEY_LOCAL_MACHINE\" Then Path = "HKLM" & Right(Path, Len(Path) - 18)
    If Left(UCase(Path), 18) = "HKEY_CURRENT_USER\" Then Path = "HKCU" & Right(Path, Len(Path) - 17)
    If Left(UCase(Path), 18) = "HKEY_CLASSES_ROOT\" Then Path = "HKCR" & Right(Path, Len(Path) - 17)
    If Left(UCase(Path), 11) = "HKEY_USERS\" Then Path = "HKU" & Right(Path, Len(Path) - 10)
    
    EncodePath = Path
    
    SetWoW64Translation OldTran
End Function

Function EnumDir(ByVal Path As String)

    On Error Resume Next
    
    Erase AllDirsList()
    ReDim AllDirsList(1) As String
    AllDirsList(1) = Path
    ExecuteEnumDir Path, 2

End Function

Function EnumDirLog(ByVal Path As String)

    If Is64bitFast = True Then If WoW64Translation = KEY_WOW64_64KEY Then RegST = " 64bit" Else RegST = " 32bit"
    
    AddToLog "Searching " & PackerList(PackerIDX).Name & RegST & " files in " & Path
    
    EnumDir Path

End Function

Function ExecuteCommand(MainExe, Optional CommandL = "", Optional ShowW = 0) As Long

    If CommandL <> "" Then CommandL = " " & CommandL
    
    If ShowW = 1 Then
        ExecuteCommand = Shell(MainExe & CommandL, vbNormalFocus)
    Else
        ExecuteCommand = Shell(MainExe & CommandL, vbHide)
    End If

End Function
    
Private Function ExecuteEnumDir(ByVal Path As String, StartPos)

    On Error GoTo 55
    
    Set FSO = CreateObject("Scripting.FileSystemObject")
    
    If Right(Path, 1) <> "\" Then Path = Path & "\"

    DoEvents

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function
                
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

    For t = StartPos To UBound(AllDirsList)
        ExecuteEnumDir AllDirsList(t), UBound(AllDirsList) + 1
    Next

End Function

Function ExecuteScan(OPType)

    Empty_Array
    
    PackerValue = PackerIDX

    If Is64bitFast = True Then If WoW64Translation = KEY_WOW64_64KEY Then RegST = " 64bit" Else RegST = " 32bit"
        
    If PackerValue > 0 Then AddToLog "Scanning " & PackerList(PackerValue).Name & RegST

    If PackerIDX >= 0 Then PackerValue = PackerList(PackerIDX).Value

    If PackerValue = ACProtect Then ACProtect_Scan
    If PackerValue = ActiveMark Then ActiveMark_Scan
    If PackerValue = Armadillo Then Armadillo_Scan
    If PackerValue = ASProtect Then
        
        If OPType = 5 Then
            ASProtect_License_Scan
        Else
            ASProtect_Scan
        End If

    End If

    If PackerValue = DBPE Then DBPE_Scan
    If PackerValue = EncryptPE Then EncryptPE_Scan
    If PackerValue = Enigma Then

        If OPType = 5 Then
            EnigmaFull_Scan
        Else
            Enigma_Scan
        End If

    End If
    
    If PackerValue = EXECryptor Then EXECryptor_Scan
    If PackerValue = ExeShield Then ExeShield_Scan
    If PackerValue = Expressor Then Expressor_Scan
    If PackerValue = FlexNet Then FlexNet_Scan
    If PackerValue = ICELicense Then ICE_License_Scan
    If PackerValue = IntelliLock Then IntelliLock_Scan
    If PackerValue = LicenseProtector Then LicenseProtector_Scan
    If PackerValue = MancoLicensing Then Manco_Licensing_Scan
    If PackerValue = Nalpeiron Then Nalpeiron_Scan
    If PackerValue = NETReactor Then NETReactor_Scan
    If PackerValue = NoCopy Then NoCopy_Scan
    If PackerValue = NTkrnlProtector Then NTkrnl_Protector_Scan
    If PackerValue = Obsidium Then Obsidium_Scan
    If PackerValue = OneWay Then OneWay_Scan
    If PackerValue = ORiEN Then ORiEN_Scan
    If PackerValue = PCGuard Then PCGuard_Scan
    If PackerValue = ProActivate Then ProActivate_Scan
    
    If PackerValue = ProtectionPlus Then
    
        If OPType = 5 Then
            ProtectionPlusFull_Scan
        Else
            ProtectionPlus_Scan
        End If

    End If

    If PackerValue = ProtectShareware Then ProtectShareware_Scan
    If PackerValue = Protexis Then Protexis_Scan
    If PackerValue = SafengineLicensor Then Safengine_Licensor_Scan
    If PackerValue = SafeSerial Then SafeSerial_Scan
    If PackerValue = SDProtector Then SDProtector_Scan
    If PackerValue = Sheriff Then Sheriff_Scan
    If PackerValue = SGLicenser Then SGLicenser_Scan
    If PackerValue = ShareGuard Then ShareGuard_Scan
    If PackerValue = SoftLocx Then SoftLocx_Scan
    If PackerValue = SoftSentry Then SoftSentry_Scan
    If PackerValue = SoftWrap Then SoftWrap_Scan
    If PackerValue = STProtector Then STProtector_Scan
    If PackerValue = SVKP Then SVKP_Scan
    If PackerValue = Thinstall Then Thinstall_Scan
    If PackerValue = VBOLock Then VBOLock_Scan
    If PackerValue = VBox Then VBox_Scan
    If PackerValue = VisualProtect Then VisualProtect_Scan
    If PackerValue = WinLicense Then WinLicense_Scan
    If PackerValue = XheoLicensing Then Xheo_Licensing_Scan
    If PackerValue = XProtector Then XProtector_Scan
    If PackerValue = ZipWorx Then ZipWorx_Scan
    If PackerValue = ZProtect Then ZProtect_Scan
    If PackerValue = ZXProtector Then ZXProtector_Scan

End Function

Function ExecuteScanTrans(OPType)

    If FRMMain.MNWoW64(0).Checked = True Then
        If PackerList(PackerIDX).Platform = P32bit Or PackerList(PackerIDX).Platform = PAll Then
            If FRMMain.MNWoW64(2).Checked = False Then SetWoW64Translation 32: ExecuteScan OPType
        End If
        
        Empty_Array

        If Abort = 2 Then SubPause
        If Abort = 1 Then Exit Function
                    
        If PackerList(PackerIDX).Platform = P64bit Or PackerList(PackerIDX).Platform = PAll Then
            If FRMMain.MNWoW64(1).Checked = False And Is64bitFast = True Then SetWoW64Translation 64: ExecuteScan OPType: SetWoW64Translation 64
        End If
    End If
    
    If FRMMain.MNWoW64(3).Checked = True Then
        SetWoW64Translation 32
        ExecuteScan OPType
        Empty_Array

        If Abort = 2 Then SubPause
        If Abort = 1 Then Exit Function
        If Is64bitFast = True Then
            SetWoW64Translation 64
            ExecuteScan OPType
            SetWoW64Translation 32
        End If
    End If
    
    If FRMMain.MNWoW64(1).Checked = True Then
        SetWoW64Translation 32
        ExecuteScan OPType
        Empty_Array
    End If
    
    If FRMMain.MNWoW64(2).Checked = True And Is64bitFast = True Then
        SetWoW64Translation 64
        ExecuteScan OPType
        SetWoW64Translation 32
        Empty_Array
    End If
    
    Empty_Array
    
End Function

Function ExistDir(FilePath) As Boolean

    Set FSO = CreateObject("Scripting.FileSystemObject")
    FilePath = FilePath & "\"
    ExistDir = FSO.FolderExists(Left(Replace(FilePath, "\\", "\"), Len(FilePath) - 1))

End Function

Function ExistDirAdd(FilePath)

    If ExistDir(FilePath) = True Then AddToList TRDir, FilePath

End Function

Function ExistFile(FilePath) As Boolean

    Set FSO = CreateObject("Scripting.FileSystemObject")
    ExistFile = FSO.FileExists(FilePath)
End Function

Function ExistFileAdd(FilePath)

    If ExistFile(FilePath) = True Then AddToList TRFile, FilePath

End Function

Function ExistProcessAdd(ProName)

    If FindProcess(ProName) <> 0 Then AddToList TRProcess, ProName
End Function

Function FindIcon(PackName) As Integer

    For i = 1 To FRMMain.IconList.ListImages.Count

        If LCase(FRMMain.IconList.ListImages(i).Tag) = LCase(PackName) Then FindIcon = i: Exit Function
    Next

    FindIcon = 1
End Function

Function FindMyName(MyPID) As String

    Dim uProcess      As PROCESSENTRY32

    Dim rProcessFound As Long

    Dim hSnapshot     As Long

    On Local Error GoTo Err
    
    uProcess.dwSize = Len(uProcess)
    hSnapshot = CreateToolhelpSnapshot(2&, 0&)
    rProcessFound = ProcessFirst(hSnapshot, uProcess)

    Do While rProcessFound

        If MyPID = uProcess.th32ProcessID Then FindMyName = LCase(Left(uProcess.szExeFile, InStr(1, uProcess.szExeFile, Chr(0)) - 1))
        rProcessFound = ProcessNext(hSnapshot, uProcess)
    Loop

Err:
    Call CloseHandle(hSnapshot)

End Function

Function FindParent(ParPID) As String

    Dim uProcess      As PROCESSENTRY32

    Dim rProcessFound As Long

    Dim hSnapshot     As Long

    Dim szExename     As String

    Dim i             As Integer

    On Local Error GoTo Err
    
    uProcess.dwSize = Len(uProcess)
    hSnapshot = CreateToolhelpSnapshot(2&, 0&)
    rProcessFound = ProcessFirst(hSnapshot, uProcess)

    Do While rProcessFound

        If ParPID = uProcess.th32ParentProcessID Then FindParent = Left(uProcess.szExeFile, InStr(1, uProcess.szExeFile, Chr(0)) - 1)

        rProcessFound = ProcessNext(hSnapshot, uProcess)
    Loop
    
Err:
    Call CloseHandle(hSnapshot)

End Function

Function FindProcess(ProcName, Optional NumProcess = 0) As Long

    Dim uProcess      As PROCESSENTRY32

    Dim rProcessFound As Long

    Dim hSnapshot     As Long

    Dim szExename     As String

    On Local Error GoTo Err
    
    uProcess.dwSize = Len(uProcess)
    hSnapshot = CreateToolhelpSnapshot(2&, 0&)
    rProcessFound = ProcessFirst(hSnapshot, uProcess)
    
    Do While rProcessFound
        
        szExename = LCase(Left(uProcess.szExeFile, InStr(1, uProcess.szExeFile, Chr(0)) - 1))
        
        If LCase(Right(szExename, Len(ProcName))) = LCase(ProcName) Then
    
            If FindProcess = 0 Then FindProcess = uProcess.th32ProcessID
            
            NumProcess = Val(NumProcess) + 1
        Else
        
            If Len(ProcName) > 15 Then
                If LCase(szExename) = LCase(Left(ProcName, Len(szExename))) Then
                    If FindProcess = 0 Then FindProcess = uProcess.th32ProcessID
                    
                    NumProcess = Val(NumProcess) + 1
                End If
            End If

        End If

        rProcessFound = ProcessNext(hSnapshot, uProcess)
    Loop

Err:
    Call CloseHandle(hSnapshot)
    
End Function

Function FindProcessList(ProcName, ProcessList() As Long) As Long

    Dim uProcess      As PROCESSENTRY32

    Dim rProcessFound As Long

    Dim hSnapshot     As Long

    Dim szExename     As String

    On Local Error GoTo Err
    
    ReDim ProcessList(0)
    FindProcessList = 0
    
    uProcess.dwSize = Len(uProcess)
    hSnapshot = CreateToolhelpSnapshot(2&, 0&)
    rProcessFound = ProcessFirst(hSnapshot, uProcess)

    Do While rProcessFound
        
        szExename = LCase(Left(uProcess.szExeFile, InStr(1, uProcess.szExeFile, Chr(0)) - 1))
        
        If LCase(Right(szExename, Len(ProcName))) = LCase(ProcName) Then
    
            ReDim Preserve ProcessList(UBound(ProcessList) + 1)
            
            ProcessList(UBound(ProcessList)) = uProcess.th32ProcessID
            
            FindProcessList = FindProcessList + 1

        End If

        rProcessFound = ProcessNext(hSnapshot, uProcess)
    Loop

Err:
    Call CloseHandle(hSnapshot)
    
End Function

Function FixFileName(InName) As String

    FixFileName = InName
    FixFileName = Replace(FixFileName, "\", "")
    FixFileName = Replace(FixFileName, "/", "")
    FixFileName = Replace(FixFileName, ":", "")
    FixFileName = Replace(FixFileName, "*", "")
    FixFileName = Replace(FixFileName, "?", "")
    FixFileName = Replace(FixFileName, """", "")
    FixFileName = Replace(FixFileName, ">", "")
    FixFileName = Replace(FixFileName, "<", "")
    FixFileName = Replace(FixFileName, "|", "")
End Function

Function FormatKey(DStr, KeyType) As String

    DStr = Replace(DStr, Chr(0), "")

    Do
        DStr = Replace(DStr, "\\", "\")
        
    Loop While DStr <> Replace(DStr, "\\", "\")
    
    If LCase(KeyType) = "reg32val" Or LCase(KeyType) = "reg64val" Then
        Mypos = Len(DStr)

        If Right(DStr, 1) = "\" Then DStr = Left(DStr, Len(DStr) - 1)
        
        Do
            Mypos = Mypos - 1
        Loop While Mid(DStr, Mypos, 1) <> "\"
        
        DStr = Left(DStr, Mypos) & "\" & Right(DStr, Len(DStr) - Mypos)
        
    End If
    
    If LCase(KeyType) = "reg32key" Or LCase(KeyType) = "reg64key" Or LCase(KeyType) = "dir32" Or LCase(KeyType) = "dir64" Then
        If Right(DStr, 1) <> "\" Then DStr = DStr & "\"
        If Right(DStr, 2) = Chr(1) & "\" Then DStr = Left(DStr, Len(DStr) - 2) & "\" & Chr(1)
    End If
    
    If LCase(KeyType) = "file32" Or LCase(KeyType) = "file64" Then
        If Right(DStr, 1) = "\" Then DStr = Left(DStr, Len(DStr) - 1)
    End If
    
    FormatKey = DStr
End Function

Function GetAutoType(InKeyName, Optional SubSystem As Long = 32) As String

    KeyName = DecodePath(InKeyName, SubSystem)

    If Left(UCase(KeyName), 5) = "HKEY_" And Replace(KeyName, "\\", "\") = KeyName And SubSystem = 32 Then GetAutoType = "Reg32Key"
    If Left(UCase(KeyName), 5) = "HKEY_" And Replace(KeyName, "\\", "\") <> KeyName And SubSystem = 32 Then GetAutoType = "Reg32Val"
    If Mid(KeyName, 2, 2) = ":\" And Right(KeyName, 1) = "\" And SubSystem = 32 Then GetAutoType = "Dir32"
    If Mid(KeyName, 2, 2) = ":\" And Right(KeyName, 1) <> "\" And SubSystem = 32 Then GetAutoType = "File32"
    If Left(UCase(KeyName), 5) = "HKEY_" And Replace(KeyName, "\\", "\") = KeyName And SubSystem = 64 Then GetAutoType = "Reg64Key"
    If Left(UCase(KeyName), 5) = "HKEY_" And Replace(KeyName, "\\", "\") <> KeyName And SubSystem = 64 Then GetAutoType = "Reg64Val"
    If Mid(KeyName, 2, 2) = ":\" And Right(KeyName, 1) = "\" And SubSystem = 64 Then GetAutoType = "Dir64"
    If Mid(KeyName, 2, 2) = ":\" And Right(KeyName, 1) <> "\" And SubSystem = 64 Then GetAutoType = "File64"
    If Left(LCase(KeyName), 4) = "disk" Then KeyType = "Sector"
    If Left(LCase(KeyName), 7) = "process" Then KeyType = "Process"
    If Left(LCase(KeyName), 5) = "shell" And SubSystem = 32 Then KeyType = "Shell32"
    If Left(LCase(KeyName), 5) = "shell" And SubSystem = 64 Then KeyType = "Shell64"
    If Left(LCase(KeyName), 6) = "stream" And SubSystem = 32 Then KeyType = "Stream32"
    If Left(LCase(KeyName), 6) = "stream" And SubSystem = 64 Then KeyType = "Stream64"
    
End Function

Public Function GetCommandOutput(sCommandLine As String, _
                                 Optional blnStdOut As Boolean = True, _
                                 Optional blnStdErr As Boolean = False, _
                                 Optional blnOEMConvert As Boolean = True) As String

    Dim hPipeRead   As Long, hPipeWrite1 As Long, hPipeWrite2 As Long

    Dim hCurProcess As Long

    Dim sa          As SECURITY_ATTRIBUTES

    Dim si          As STARTUPINFO

    Dim pi          As PROCESS_INFORMATION

    Dim baOutput()  As Byte

    Dim sNewOutput  As String

    Dim lBytesRead  As Long

    Dim fTwoHandles As Boolean

    Dim lRet        As Long

    Const BUFSIZE = 1024
    
    If (Not blnStdOut) And (Not blnStdErr) Then
        Err.Raise 5
    End If

    fTwoHandles = blnStdOut And blnStdErr

    ReDim baOutput(BUFSIZE - 1) As Byte

    With sa
        .nLength = Len(sa)
        .bInheritHandle = 1
    End With

    If CreatePipe(hPipeRead, hPipeWrite1, sa, BUFSIZE) = 0 Then

        Exit Function

    End If

    hCurProcess = GetCurrentProcess()

    Call DuplicateHandle(hCurProcess, hPipeRead, hCurProcess, hPipeRead, 0&, 0&, 2 Or 1)

    If fTwoHandles Then
        Call DuplicateHandle(hCurProcess, hPipeWrite1, hCurProcess, hPipeWrite2, 0&, 1&, 2)
    End If

    With si
        .cb = Len(si)
        .dwFlags = 1 Or &H100
        .wShowWindow = 0

        If fTwoHandles Then
            .hStdOutput = hPipeWrite1
            .hStdError = hPipeWrite2
        ElseIf blnStdOut Then
            .hStdOutput = hPipeWrite1
        Else
            .hStdError = hPipeWrite1
        End If

    End With

    If CreateProcess(vbNullString, sCommandLine, ByVal 0&, ByVal 0&, 1, 0&, ByVal 0&, vbNullString, si, pi) Then

        Call CloseHandle(pi.hThread)
        
        Call CloseHandle(hPipeWrite1)
        hPipeWrite1 = 0

        If hPipeWrite2 Then
            Call CloseHandle(hPipeWrite2)
            hPipeWrite2 = 0
        End If

        Do

            If ReadFile(hPipeRead, baOutput(0), BUFSIZE, lBytesRead, ByVal 0&) = 0 Then

                Exit Do

            End If

            If blnOEMConvert Then
                sNewOutput = String$(lBytesRead, 0)
                Call OemToCharBuff(baOutput(0), sNewOutput, lBytesRead)
            Else
                sNewOutput = Left$(StrConv(baOutput(), vbUnicode), lBytesRead)
            End If

            GetCommandOutput = GetCommandOutput & sNewOutput
        Loop

        Call CloseHandle(pi.hProcess)
    Else
        GetCommandOutput = "Failed to create process, check the path of the command line."
    End If

    Call CloseHandle(hPipeRead)

    If hPipeWrite1 Then
        Call CloseHandle(hPipeWrite1)
    End If

    If hPipeWrite2 Then
        Call CloseHandle(hPipeWrite2)
    End If

End Function

Function GetDirectories()

    Dim Buffer As String * 255

    SHGetSpecialFolderPath FRMMain.hwnd, Buffer, 40, 1
    UsersBaseDir = Replace(Buffer, Chr(0), "")
    
    For t = Len(UsersBaseDir) To 3 Step -1

        If Mid(UsersBaseDir, t, 1) = "\" Then Exit For
    Next
    
    If t > 3 Then UsersBaseDir = Left(UsersBaseDir, t)
    
    Buffer = String(255, Chr(0))
    SHGetSpecialFolderPath FRMMain.hwnd, Buffer, 35, 1
    ProgramDataDir = Replace(Buffer, Chr(0), "")
    
    Buffer = String(255, Chr(0))
    SHGetSpecialFolderPath FRMMain.hwnd, Buffer, 296, 1
    CurUserDir = Replace(Buffer, Chr(0), "")
    
    n = GetTempPath(255, Buffer)
    TempDir = Left(Buffer, n)
    n = GetWindowsDirectory(Buffer, 255)
    WindowsDir = Left(Buffer, n)
    n = GetSystemDirectory(Buffer, 255)
    SystemDir = Left(Buffer, n)

    If Right(SystemDir, 1) <> "\" Then SystemDir = SystemDir & "\"
    
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

Function GetIco(PlugName, Optional NTag = "")

    On Error GoTo 55
    
    Dim BinaryFile() As Byte

    Dim BinICO()     As Byte
    
    If PlugName = "" Then Exit Function
    Set fs5 = CreateObject("Scripting.FileSystemObject")
    
    IconName = PlugName

    Open PlugName For Binary As #1
    ReDim BinaryFile(0 To LOF(1) - 1)
    Get #1, , BinaryFile()
    Close #1

    FilePos = 1

    For FilePos = FilePos To UBound(BinaryFile) - 100

        If BinaryFile(FilePos) = (40) And BinaryFile(FilePos + 1) = (0) And BinaryFile(FilePos + 2) = (0) And BinaryFile(FilePos + 3) = (0) And BinaryFile(FilePos + 4) = (32) And BinaryFile(FilePos + 5) = (0) And BinaryFile(FilePos + 6) = (0) And BinaryFile(FilePos + 7) = (0) And BinaryFile(FilePos + 8) = (64) And BinaryFile(FilePos + 9) = (0) And BinaryFile(FilePos + 10) = (0) And BinaryFile(FilePos + 11) = (0) And BinaryFile(FilePos + 12) = (1) And BinaryFile(FilePos + 13) = (0) Then Exit For

    Next
    
    If FilePos >= UBound(BinaryFile) - 100 Then
        FilePos = 1
        
        For FilePos = FilePos To UBound(BinaryFile) - 100
    
            If BinaryFile(FilePos) = (40) And BinaryFile(FilePos + 1) = (0) And BinaryFile(FilePos + 2) = (0) And BinaryFile(FilePos + 3) = (0) And BinaryFile(FilePos + 4) = (16) And BinaryFile(FilePos + 5) = (0) And BinaryFile(FilePos + 6) = (0) And BinaryFile(FilePos + 7) = (0) And BinaryFile(FilePos + 8) = (32) And BinaryFile(FilePos + 9) = (0) And BinaryFile(FilePos + 10) = (0) And BinaryFile(FilePos + 11) = (0) And BinaryFile(FilePos + 12) = (1) And BinaryFile(FilePos + 13) = (0) Then Exit For
    
        Next
    
    End If

    If FilePos >= UBound(BinaryFile) - 100 Then GoTo 55
    Erase BinICO()
    ReDim BinICO(2238)

    BinICO(0) = (0)
    BinICO(1) = (0)
    BinICO(2) = (1)
    BinICO(3) = (0)
    BinICO(4) = (1)
    BinICO(5) = (0)
    BinICO(6) = (&H20)
    BinICO(7) = (&H20)
    BinICO(8) = (&H10)
    BinICO(9) = (0)
    BinICO(10) = (0)
    BinICO(11) = (0)
    BinICO(12) = (&H80)
    BinICO(13) = (0)
    BinICO(14) = (&HA8)
    BinICO(15) = (&H8)
    BinICO(16) = (0)
    BinICO(17) = (0)
    BinICO(18) = (&H16)
    BinICO(19) = (0)
    BinICO(20) = (0)
    BinICO(21) = (0)

    IconPos = 22

    EndPos = FilePos + 2215

    If EndPos > UBound(BinaryFile) Then EndPos = UBound(BinaryFile) - 1
    
    For i = FilePos To EndPos
        BinICO(IconPos) = BinaryFile(i)
        IconPos = IconPos + 1
    Next

    IconName = TempDir & "\Plug_icon.ico"
    Open IconName For Binary As #1
    Put #1, , BinICO()
    Close #1
55
    FRMMain.Picture1.Picture = LoadPicture("")

    If TestIco(IconName) = True Then
        FRMMain.IconList.ListImages.Add , , FRMMain.Picture1.Picture
    Else
        FRMMain.IconList.ListImages.Add , , FRMMain.Icon
    End If
        
    FRMMain.IconList.ListImages(FRMMain.IconList.ListImages.Count).Tag = NTag

    If LCase(PlugName) <> LCase(IconName) Then Kill IconName

End Function

Function GetKeyInformation(InKey, InType, KeyDate, ExistK, Optional Force = 0) As Boolean

    On Error Resume Next

    KeyName = InKey
    KeyDate = 0
    GetKeyInformation = False
   
    If Left(LCase(InType), 3) = "reg" Then
    
        InTypeOld = WoW64Translation
        SetWoW64Translation InType
    
        Dim HKName As RegistryPaths
    
        ParseKey KeyName, HKName, SubName
    
        If LCase(InType) = "reg32key" Or LCase(InType) = "reg64key" Then
            SubKey = SubName

            SubValue = ""

            ExistK = ExistKey(HKName, SubKey)

            If Right(SubKey, 1) = Chr(1) Then ExistK = True

        Else
                    
            Mypos = Len(SubName)

            Do
                Mypos = Mypos - 1
            Loop While Mid(SubName, Mypos, 1) <> "\"
                    
            SubKey = Left(SubName, Mypos)

            SubValue = Right(SubName, Len(SubName) - Mypos)

            Do While Left(SubValue, 1) = "\"
                SubValue = Right(SubValue, Len(SubValue) - 1)

            Loop

            Do While Right(SubValue, 1) = "\"
                SubValue = Left(SubValue, Len(SubValue) - 1)

            Loop
            
            ExistK = ExistValue(HKName, SubKey, SubValue)

        End If

        If ExistK = True Then
    
            Dim SysDate As SYSTEMTIME
        
            ExistK = "Found"

            If Right(SubKey, 1) = Chr(1) Then ExistK = "Hidden"

            SysDate = GetTime(HKName, SubKey, SubValue)
            
            If SysDate.wHour >= 24 Then SysDate.wHour = SysDate.wHour - 24: SysDate.wDay = SysDate.wDay + 1
            KeyDate = Format(SysDate.wMonth, "00") & "/" & Format(SysDate.wDay, "00") & "/" & SysDate.wYear & " " & Format(SysDate.wHour, "00") & ":" & Format(SysDate.wMinute, "00") & ":" & Format(SysDate.wSecond, "00")

            If SysDate.wYear = 1601 Or Replace(KeyDate, "-", "") <> KeyDate Then KeyDate = "Not Found"
    
        Else
            KeyDate = "Not Found"
            ExistK = "Not Found"
        End If
    
        SetWoW64Translation InTypeOld
        
    End If
    
    If Left(LCase(InType), 5) = "shell" Then
        ExistK = "None"
        KeyDate = "None"
    End If

    If LCase(InType) = "sector" Then
        If Force = 1 Then
            DiskSec = Replace(Right(KeyName, Len(KeyName) - 5), """", "")

            If Left(DiskSec, 1) = " " Then DiskSec = Right(DiskSec, Len(DiskSec) - 1)
            DiskID = Val(DiskSec)
            Mypos = InStr(1, DiskSec, ":", 1)

            If Mypos <> 0 Then
                SecID = Right(DiskSec, Len(DiskSec) - Mypos)

                If Left(SecID, 1) = " " Then SecID = Right(SecID, Len(SecID) - 1)
                
                If SecID >= 0 And IsNumeric(DiskID) = True Then

                    Dim SectDump() As SecList

                    SectorDump SecID, 0, SectDump, DiskID

                    If UBound(SectDump) = 1 Then
                        
                        If Replace(SectDump(1).SecData, "0", "") = "" Then
                            ExistK = "Not Found"
                        Else
                            ExistK = "Found"
                        End If

                    Else
                        ExistK = "Not Found"
                    End If
                End If

            Else
                ExistK = "Not Found"
            End If

        Else
            ExistK = "Found"
        End If
        
        KeyDate = "None"
    End If
    
    If LCase(InType) = "process" Then
        ProcName = KeyName

        If Left(ProcName, 1) = " " Then ProcName = Right(ProcName, Len(ProcName) - 1)
        PIDList = ""
        
        If Left(UCase(ProcName), 4) = "PID:" Then
            ProcName = Replace(ProcName, " ", "")

            If IsRun(Right(ProcName, Len(ProcName) - 4)) = True Then PIDList = UCase(ProcName)
        Else

            Dim ProcLst() As Long

            FindProcessList ProcName, ProcLst()

            For t = 1 To UBound(ProcLst)
                PIDList = PIDList & "; PID:" & ProcLst(t)
            Next
            
            If Len(PIDList) > 0 Then PIDList = Right(PIDList, Len(PIDList) - 2)
            
        End If
        
        If PIDList <> "" Then
            ExistK = "Found"
            
            If IsRun(KeyDate) = False Then ExistK = "Not Found"
            KeyDate = PIDList
                
        Else
            ExistK = "Not Found"
            KeyDate = "Not Found"
        End If
     
    End If

    If Left(LCase(InType), 4) = "file" Or Left(LCase(InType), 3) = "dir" Or Left(LCase(InType), 6) = "stream" Then
        InTypeOld = WoW64Translation
        SetWoW64Translation InType
        Set FSO = CreateObject("Scripting.FileSystemObject")

        If Left(LCase(InType), 4) = "file" Or (Left(LCase(InType), 6) = "stream" And Right(KeyName, 1) <> "\") Then

            If ExistFile(KeyName) = True Then
                ExistK = "Found"
                Set FS = FSO.GetFile(KeyName)
                KeyDate = FS.DateLastModified
                KeyDate = Format(Month(KeyDate), "00") & "/" & Format(Day(KeyDate), "00") & "/" & Year(KeyDate) & " " & Format(Hour(KeyDate), "00") & ":" & Format(Minute(KeyDate), "00") & ":" & Format(Second(KeyDate), "00")
            Else
                KeyDate = "Not Found"
                ExistK = "Not Found"
            End If

        Else

            If ExistDir(KeyName) = True Then
                ExistK = "Found"
                Set FS = FSO.GetFolder(KeyName)
                KeyDate = FS.DateLastModified
                KeyDate = Format(Month(KeyDate), "00") & "/" & Format(Day(KeyDate), "00") & "/" & Year(KeyDate) & " " & Format(Hour(KeyDate), "00") & ":" & Format(Minute(KeyDate), "00") & ":" & Format(Second(KeyDate), "00")
            Else
                KeyDate = "Not Found"
                ExistK = "Not Found"
            End If
        End If

        SetWoW64Translation InTypeOld
    End If
    
    If Left(LCase(InType), 6) = "stream" Then
        
        If HaveAltStream(InKey) = True Then
            ExistK = "Found"
        Else
            ExistK = "Not Found"
            KeyDate = "Not Found"
        End If

    End If

    If ExistK = "Found" Then GetKeyInformation = True

End Function

Function HaveAltStream(FileName, _
                       Optional DeleteStream = 0, _
                       Optional RetVal = "") As Boolean

    On Error Resume Next
    
    Dim Reschunk() As Byte
    
    Reschunk = LoadResData(1, "STREAMS")

    Open TempDir & "TRStreams.exe" For Binary As #1
    Put #1, , Reschunk()
    Close #1
    
    If DeleteStream = 1 Then AppCmd = "-d "
    
    STOut = GetCommandOutput(TempDir & "\TRStreams.exe " & AppCmd & """" & FileName & """")
    
    HaveAltStream = False
    
    If Right(Replace$(STOut, vbCrLf, ""), 20) <> "www.sysinternals.com" And Replace$(STOut, "No files with streams found", "") = STOut And Replace$(STOut, "The specified volume does not support streams", "") = STOut Then HaveAltStream = True
    
    KillF TempDir & "\TRStreams.exe"
    
    RetVal = STOut

End Function

Function IniPlugin()

    On Error Resume Next

    Dim PlugA() As String

    ReDim PlugA(0)

    Set fs5 = CreateObject("Scripting.FileSystemObject")
    
    PLG = Dir(PlugPath & "*")

    Do While Replace(PLG, ".", "") <> ""
        ReDim Preserve PlugA(UBound(PlugA) + 1)
        PlugA(UBound(PlugA)) = PLG
        PLG = Dir
    Loop

    For i = 1 To UBound(PlugA)
        varSwap = PlugA(i)

        For j = i To 2 Step -1

            If UCase(varSwap) < UCase(PlugA(j - 1)) Then
                PlugA(j) = PlugA(j - 1)
            Else

                Exit For

            End If

        Next

        PlugA(j) = varSwap

    Next
    
    PlugBase = Val(i = FRMMain.Toolbar1.Buttons.Count) + 3
    
    PlugIDX = 0

    For Z = 0 To UBound(PlugA) - 1
        PLG = PlugA(Z + 1)

        If Replace(PLG, ".", "") <> PLG Then
            i = Len(PLG)

            Do While Mid(PLG, i, 1) <> "."
                i = i - 1
            Loop

            PLGName = (Left(PLG, i - 1))
        Else
            PLGName = PLG
        End If

        Set aa = fs5.openTextFile(PlugPath & PLG)
        Textff = ""
        Textff = aa.Read(2)
        aa.Close

        If PLG <> "" And Textff = "MZ" Then
            
            GetIco PlugPath & PLG, "PLG_" & PLGName
            AddPacker MaxPacker + PlugIDX, PLGName, PLG
            
            PlugIDX = PlugIDX + 1

        End If

    Next

End Function

Function IniToolBar()

    FRMMain.Toolbar1.ImageList = FRMMain.IconList
    
    FRMMain.Toolbar1.Buttons.Clear

    For t = 1 To UBound(PackerList)
        
        If t < UBound(PackerList) Then
            CPack = Replace(PackerList(t).Name, " ", "_")
            
            PLGSign = ""
            
            If PackerList(t).FileName <> "" Then
                PLGSign = "PLG_"
            End If
            
            FRMMain.Toolbar1.Buttons.Add t, 1 & "_" & PLGSign & PackerList(t).Name, "", 5, FindIcon(PLGSign & PackerList(t).Name)
            FRMMain.Toolbar1.Buttons(t).ToolTipText = PackerList(t).Name
            FRMMain.Toolbar1.Buttons(t).Tag = PackerList(t).Value
            FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 1, 1 & "_" & PLGSign & PackerList(t).Name, "Scan"
            FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 2, 3 & "_" & PLGSign & PackerList(t).Name, "Backup"
            FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 3, 2 & "_" & PLGSign & PackerList(t).Name, "Clear"
            FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 4, 4 & "_" & PLGSign & PackerList(t).Name, "Information"

            If PackerList(t).Value = Enigma Or PackerList(t).Value = ProtectionPlus Then
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Clear
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 1, 1 & "_" & PackerList(t).Name, "Scan Generic"
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 2, 5 & "_" & PackerList(t).Name, "Scan Full"
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 3, 3 & "_" & PackerList(t).Name, "Backup"
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 4, 2 & "_" & PackerList(t).Name, "Clear"
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 5, 4 & "_" & PackerList(t).Name, "Information"
            End If
            
            If PackerList(t).Value = ASProtect Then
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Clear
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 1, 1 & "_" & PackerList(t).Name, "Scan"
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 2, 5 & "_" & PackerList(t).Name, "Scan License"
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 3, 3 & "_" & PackerList(t).Name, "Backup"
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 4, 2 & "_" & PackerList(t).Name, "Clear"
                FRMMain.Toolbar1.Buttons(t).ButtonMenus.Add 5, 4 & "_" & PackerList(t).Name, "Information"
            End If
           
        End If

    Next

    If FRMMain.MNHideFLTB.Checked = False Then
        CFile = Dir(KeysListPath & "*.txt")

        If Replace(CFile, ".", "") <> "" Then
            CPack = "FileList"
            i = FRMMain.Toolbar1.Buttons.Count + 1
            FRMMain.Toolbar1.Buttons.Add i, "1_" & CPack, "", 5, FindIcon(CPack)
            FRMMain.Toolbar1.Buttons(i).ToolTipText = "Keys List"
            FRMMain.Toolbar1.Buttons(i).Tag = PSFileAll
            FCount = 1

            Do While Replace(CFile, ".", "") <> ""

                If Replace(CFile, ".", "") <> CFile Then
                    Z = Len(CFile)
        
                    Do While Mid(CFile, Z, 1) <> "."
                        Z = Z - 1
                    Loop
        
                    CFileName = (Left(CFile, Z - 1))
                Else
                    CFileName = CFile
                End If
        
                FRMMain.Toolbar1.Buttons(i).ButtonMenus.Add FCount, CFile & "_" & CPack, CFileName
                FRMMain.Toolbar1.Buttons(i).ButtonMenus(FRMMain.Toolbar1.Buttons(i).ButtonMenus.Count).Tag = CFile
                FCount = FCount + 1
                CFile = Dir
            Loop
        
        End If
    End If
                    
    If FRMMain.MNShowCheckBox.Checked = True Then
        CPack = "Checked"
        i = FRMMain.Toolbar1.Buttons.Count + 1
        FRMMain.Toolbar1.Buttons.Add i, "3_Checked", "", 5, FindIcon(CPack)
        FRMMain.Toolbar1.Buttons(i).ToolTipText = CPack
        FRMMain.Toolbar1.Buttons(i).Tag = PSCheck
        FRMMain.Toolbar1.Buttons(i).ButtonMenus.Add 1, "3_Checked", "Backup"
        FRMMain.Toolbar1.Buttons(i).ButtonMenus.Add 2, "2_Checked", "Clear"
        FRMMain.Toolbar1.Buttons(i).ButtonMenus.Add 3, "AddProtLST_Checked", "Add to Protect List"
        FRMMain.Toolbar1.Buttons(i).ButtonMenus.Add 4, "AddSTCLST_Checked", "Add to Autocleaning List"
    End If
    
    CPack = "All"
    i = FRMMain.Toolbar1.Buttons.Count + 1
    
    FRMMain.Toolbar1.Buttons.Add i, "1_All", "", 5, FindIcon(CPack)
    FRMMain.Toolbar1.Buttons(i).ToolTipText = CPack
    FRMMain.Toolbar1.Buttons(i).Tag = PSAll
    FRMMain.Toolbar1.Buttons(i).ButtonMenus.Add 1, "1_" & CPack, "Scan"
    FRMMain.Toolbar1.Buttons(i).ButtonMenus.Add 2, "3_" & CPack, "Backup"
    FRMMain.Toolbar1.Buttons(i).ButtonMenus.Add 3, "2_" & CPack, "Clear"
    
End Function

Function Is64bit() As Boolean

    On Error GoTo Not64

    hLib = LoadLibraryA("kernel32")

    Dim handle As Long, bolFunc As Boolean

    handle = GetProcAddress(GetModuleHandle("kernel32"), "IsWow64Process")

    If handle > 0 Then

        FreeLibrary hLib
        Call IsWow64Process(GetCurrentProcess(), Enabled)

        If (Enabled) Then Is64bit = True
    Else
        Is64bit = False
    End If

    Exit Function

Not64:
    Is64bit = False
End Function

Function IsAeroEnabled() As Boolean

    On Error GoTo NotVista

    hLib = LoadLibraryA("dwmapi")

    If hLib <> 0 Then
        FreeLibrary hLib
        Call DwmIsCompositionEnabled(Enabled)

        If Val(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\ThemeManager", "ThemeActive")) = 1 Then
            IsAeroEnabled = True
        Else
            IsAeroEnabled = False
        End If

        'If (Enabled) Then IsAeroEnabled = True
    Else
        IsAeroEnabled = False
    End If

    Exit Function

NotVista:
    IsAeroEnabled = False
End Function

Function IsHex(InString) As Boolean

    UCInString = UCase(InString)
    UCInString = Replace(UCInString, "A", "")
    UCInString = Replace(UCInString, "B", "")
    UCInString = Replace(UCInString, "C", "")
    UCInString = Replace(UCInString, "D", "")
    UCInString = Replace(UCInString, "E", "")
    UCInString = Replace(UCInString, "F", "")

    If IsNumeric(UCInString) = True Then IsHex = True Else IsHex = False
End Function

Function IsRun(ProcPID) As Boolean

    Dim uProcess      As PROCESSENTRY32

    Dim rProcessFound As Long

    Dim hSnapshot     As Long

    On Local Error GoTo Err

    IsRun = False
    uProcess.dwSize = Len(uProcess)
    hSnapshot = CreateToolhelpSnapshot(2&, 0&)
    rProcessFound = ProcessFirst(hSnapshot, uProcess)

    Do While rProcessFound

        If Val(uProcess.th32ProcessID) = Val(ProcPID) Then IsRun = True
        rProcessFound = ProcessNext(hSnapshot, uProcess)
        
    Loop

Err:
    Call CloseHandle(hSnapshot)

End Function

Function IsWord(IniString, WordFactor As Integer) As Boolean

    For t = 1 To Len(IniString)
        CChar = Mid(IniString, t, 1)

        If UCase(CChar) = " " Or UCase(CChar) = "J" Or UCase(CChar) = "Y" Or UCase(CChar) = "A" Or UCase(CChar) = "E" Or UCase(CChar) = "I" Or UCase(CChar) = "O" Or UCase(CChar) = "U" Then
            IsVoc = 0
        Else
            IsVoc = IsVoc + 1

            If IsVocMax < IsVoc Then IsVocMax = IsVoc
        End If

        If UCase(CChar) <> "X" And UCase(CChar) <> " " And UCase(CChar) <> "J" And UCase(CChar) <> "Y" And UCase(CChar) <> "A" And UCase(CChar) <> "E" And UCase(CChar) <> "I" And UCase(CChar) <> "O" And UCase(CChar) <> "U" Then
            IsChar = 0
        Else
            IsChar = IsChar + 1

            If IsCharm < IsChar Then IsCharMax = IsChar
        End If

        If Len(IniString) > 2 And IniString <> "DTSTransform" And IniString <> "LUA" And IniString <> "FriendlyName" And IniString <> "BaseMsgCls" And IniString <> "FormStg" And IniString <> "MsgCls" And IniString <> "MenuTextPUI" And IniString <> "ThreadingModel" And IniString <> "RTFClassName" And UCase(IniString) <> "COLLECTIONCLSID" And UCase(IniString) <> "WMSDKMERIT" And IniString <> "ControlMDTPrivate" And IniString <> "HTMLControl" Then

            If IsVocMax > WordFactor Then IsWord = True

            If IsCharMax > Len(IniString) Then IsWord = True

            If IsVocMax / Len(IniString) > 0.6 Then IsWord = True

            If IsCharMax / Len(IniString) > 0.6 Then IsWord = True

        End If

    Next

    If IsNumeric(IniString) = True Then IsWord = False

    If Len(IniString) = 37 And Right(IniString, 1) = "}" And Left(IniString, 1) = "{" And Mid(IniString, 10, 1) = "-" And Mid(IniString, 15, 1) = "-" And Mid(IniString, 20, 1) = "-" Then IsWord = False

    If Len(IniString) = 38 And Mid(IniString, 1, 1) = "{" And Mid(IniString, 10, 1) = "-" And Mid(IniString, 15, 1) = "-" And Mid(IniString, 20, 1) = "-" And Mid(IniString, 25, 1) = "-" And Mid(IniString, 38, 1) = "}" Then IsWord = False

End Function

Function KillApp(ProcPID)

    On Local Error Resume Next

    Dim uProcess  As PROCESSENTRY32

    Dim myProcess As Long

    Dim udtOSInfo As OSVERSIONINFO
     
    udtOSInfo.dwOSVersionInfoSize = 148
    udtOSInfo.szCSDVersion = Space(128)

    GetVersionExA udtOSInfo

    Select Case udtOSInfo.dwPlatformId

        Case 1
            myProcess = OpenProcess(0, False, ProcPID)
            AppKill = TerminateProcess(myProcess, exitCode)

        Case 2
            myProcess = OpenProcess(1&, -1&, ProcPID)
            AppKill = TerminateProcess(myProcess, 0&)
    End Select

    Call CloseHandle(myProcess)

End Function

Function KillChild(ParPID)

    Dim uProcess      As PROCESSENTRY32

    Dim rProcessFound As Long

    Dim hSnapshot     As Long

    Dim szExename     As String

    Dim i             As Integer

    On Local Error GoTo Err
    
    uProcess.dwSize = Len(uProcess)
    hSnapshot = CreateToolhelpSnapshot(2&, 0&)
    rProcessFound = ProcessFirst(hSnapshot, uProcess)

    Do While rProcessFound

        If ParPID = uProcess.th32ParentProcessID Then KillApp uProcess.th32ProcessID

        rProcessFound = ProcessNext(hSnapshot, uProcess)
    Loop
    
Err:
    Call CloseHandle(hSnapshot)

End Function

Function KillF(FileN) As Boolean

    On Error GoTo Err

    Kill (FileN)
    
    KillF = True
    
    Exit Function

Err:
    KillF = False
End Function

Function LoadF(FileName, Optional ForceLoad = 0, Optional VerifyLoad = 0)

    On Error GoTo 55

    Dim Lister As ListItem

    If FileName = "" Or ExistFile(FileName) = False Then Exit Function
    If FRMMain.Toolbar1.Enabled = False And ForceLoad = 0 Then Exit Function

    If VerifyLoad = 0 Then FRMMain.ListView1.ListItems.Clear
    
    AddToLog "Loading File: " & FileName
    
    Set fs2 = CreateObject("Scripting.FileSystemObject")
    Set a1 = fs2.openTextFile(FileName)

    Do While a1.AtEndOfStream = False
        CL = a1.readline
    
        If CL <> "" And Left(Replace(CL, " ", ""), 1) <> "#" Then
            CL = Replace(CL, "\\", "\\\")
    
            If Len(Replace(CL, vbTab, "")) + 2 <> Len(CL) And Len(Replace(CL, vbTab, "")) + 3 <> Len(CL) Then
                If VerifyLoad = 0 Then MsgBox "Invalid File!", vbCritical

                Exit Function

            End If
            
            If Left(CL, 2) = "1" & vbTab Or Left(CL, 2) = "0" & vbTab Then
                IsChecked = Left(CL, 1)
                CL = Right(CL, Len(CL) - 2)
            Else
                IsChecked = 1
            End If
        
            Mypos = InStr(1, CL, vbTab, 1)
            
            PackName = Mid(CL, 1, Mypos - 1)
            KeyName = Right(CL, Len(CL) - Mypos)

            If Replace(KeyName, vbTab, "") = KeyName Then
                KeyType = GetAutoType(KeyName)
            Else
                Mypos = InStr(1, KeyName, vbTab, 1)
                KeyType = Mid(KeyName, 1, Mypos - 1)
                KeyName = Right(KeyName, Len(KeyName) - Mypos)
            End If

            If (Left(LCase(KeyType), 4) = "file" Or Left(LCase(KeyType), 3) = "dir") And Replace(KeyName, "*", "") <> KeyName And Replace(KeyName, "\", "") <> KeyName Then
                
                Mypos = Len(KeyName)

                Do
                    Mypos = Mypos - 1
                Loop While Mid(KeyName, Mypos, 1) <> "\"
                
                BasDir = Left(KeyName, Mypos)
                
                If Left(LCase(KeyType), 3) = "dir" Then FDTag = vbDirectory
                
                CF = Dir(KeyName, FDTag + vbDirectory + vbHidden + vbNormal + vbReadOnly + vbSystem)

                Do While Replace(CF, ".", "") <> ""
                
                    If VerifyLoad = 0 Then
                        AddToList 0, BasDir & CF, PackName, KeyType
                    Else

                        If GetKeyInformation(DecodePath(KeyName, KeyType), KeyType, Kdate, Kexist, 1) = True Then AddToList 0, KeyName, PackName, KeyType
                    End If
                    
                    CF = Dir
                
                Loop
            
            Else

                If VerifyLoad = 0 Then
                    AddToList 0, KeyName, PackName, KeyType
                Else

                    If GetKeyInformation(DecodePath(KeyName, KeyType), KeyType, Kdate, Kexist, 1) = True Then AddToList 0, KeyName, PackName, KeyType
                End If
            End If

        End If

    Loop

55  a1.Close
    ResizeWin

    If VerifyLoad = 0 Then AddToLog FRMMain.ListView1.ListItems.Count & " Keys loaded from file"

End Function

Function LoadPlugin(PluginName, GetInformation)

    On Error Resume Next

    Dim si As STARTUPINFO

    Dim pi As PROCESS_INFORMATION
    
    PluginInfo = GetInformation
    
    PlugEndMSG = ""

    If DdeInitialize(lInstID, AddressOf DDECallback, 0, 0) Then Exit Function
    
    If GetInformation = 0 Then AddToLog "Loading Plugin: " & PluginName
  
    hszDDEServer = DdeCreateStringHandle(lInstID, "Trial_Reset", CP_WINANSI)
    hszDDETopic = DdeCreateStringHandle(lInstID, "Plugin", CP_WINANSI)

    DdeNameService lInstID, hszDDEServer, 0, DNS_REGISTER
    
    DDE_Count = 0
    
    Result = CreateProcess(PlugPath & PluginName, "", ByVal 0, ByVal 0, ByVal 0, &H10, ByVal 0, VB.App.Path, si, pi)
    
    CurPluginPID = pi.dwProcessId

    If Result <> 1 Then CurPluginPID = ExecuteCommand(PlugPath & PluginName, "")
    
    If CurPluginPID = 0 Then CurPluginPID = FindProcess(PluginName)
    
    If CurPluginPID <> 0 Then

        Do
            DoEvents
            Sleep 5

            If Abort = 1 Then
                SuspendResumeProcess CurPluginPID, True
                KillChild CurPluginPID
                KillApp CurPluginPID
            End If
            
            If Abort = 2 Then SuspendResumeProcess CurPluginPID, True: Sleep 300: SubPause: PrevAbort = 2
            If Abort = 0 And PrevAbort = 2 Then SuspendResumeProcess CurPluginPID, False: PrevAbort = 0
            
        Loop While IsRun(CurPluginPID) = True And CurPluginPID <> 0

    End If
    
    DdeFreeStringHandle lInstID, hszDDEServer
    DdeFreeStringHandle lInstID, hszDDETopic
    
    DdeNameService lInstID, hszDDEServer, 0, DNS_UNREGISTER

    DdeUninitialize lInstID
    
    FRMMain.Enabled = True

    lInstID = 0
    
    If DDE_Count = 0 And Abort = 0 Then
        If ExistFile(TempDir & "\TRP_data.tmp") = True Then
            If GetInformation = 0 Then LoadF TempDir & "\TRP_data.tmp", 1
            KillF TempDir & "\TRP_data.tmp"
            MsgBox "The Plugin '" & PluginName & "' has not fully compatible with Trial-Reset 4.x.!", vbCritical
        Else
            MsgBox "Invalid Plugin '" & PluginName & "'!", vbCritical
        End If
    End If
     
    If DDE_Count > 0 And GetInformation = 1 And Abort = 0 Then MsgBox "The Plugin '" & PluginName & "' not has information!", vbCritical

End Function

Function LoadProtectLST()

    On Error GoTo 55

    Dim Lister   As ListItem

    Dim KeyName  As String

    Dim PackName As String

    FRMProtect.LSTProt.ListItems.Clear
    
    Set fs2 = CreateObject("Scripting.FileSystemObject")
    
    Set a = fs2.openTextFile(VB.App.Path & "\ProtectedList.ini")
    
    Do
        CL = a.readline
    
        If (Left(CL, 1) <> "0" And Left(CL, 1) <> "1") Or (Len(Replace(CL, vbTab, "")) + 2 <> Len(CL) And Len(Replace(CL, vbTab, "")) + 3 <> Len(CL)) Then
            KeyName = CL
            PackName = ""
            IsChecked = 0
        Else
            IsChecked = Left(CL, 1)
            CL = Right(CL, Len(CL) - 2)
            Mypos = InStr(1, CL, vbTab, 1)
            PackName = Mid(CL, 1, Mypos - 1)
            KeyName = Right(CL, Len(CL) - Mypos)

            If Replace(KeyName, vbTab, "") = KeyName Then
                KeyType = GetAutoType(KeyName)
            Else
                Mypos = InStr(1, KeyName, vbTab, 1)
                KeyType = Mid(KeyName, 1, Mypos - 1)
                KeyName = Right(KeyName, Len(KeyName) - Mypos)
            End If
            
        End If
        
        AddToProtList PackName, DecodePath(KeyName, KeyType), KeyType, IsChecked

    Loop While a.AtEndOfStream = False

55  a.Close
    SaveProt

End Function

Function LoadSTLST()

    On Error GoTo 55

    Dim Lister   As ListItem

    Dim KeyName  As String

    Dim PackName As String

    FRMSTClear.LSTC.ListItems.Clear
    
    Set fs2 = CreateObject("Scripting.FileSystemObject")
    
    Set a = fs2.openTextFile(VB.App.Path & "\AutocleaningList.ini")

    Do
        CL = a.readline
    
        If (Left(CL, 1) <> "0" And Left(CL, 1) <> "1") Or (Len(Replace(CL, vbTab, "")) + 2 <> Len(CL) And Len(Replace(CL, vbTab, "")) + 3 <> Len(CL)) Then
            KeyName = CL
            PackName = ""
            IsChecked = 0
        Else
            IsChecked = Left(CL, 1)
            CL = Right(CL, Len(CL) - 2)
            Mypos = InStr(1, CL, vbTab, 1)
            PackName = Mid(CL, 1, Mypos - 1)
            KeyName = Right(CL, Len(CL) - Mypos)

            If Replace(KeyName, vbTab, "") = KeyName Then
                KeyType = GetAutoType(KeyName)
            Else
                Mypos = InStr(1, KeyName, vbTab, 1)
                KeyType = Mid(KeyName, 1, Mypos - 1)
                KeyName = Right(KeyName, Len(KeyName) - Mypos)
            End If
            
        End If
    
        AddToSTClear PackName, DecodePath(KeyName, KeyType), KeyType, IsChecked

    Loop While a.AtEndOfStream = False

55  a.Close
    SaveSTClear

End Function

Function NTAPI(RegKey)

    Dim Reschunk() As Byte
    
    Reschunk = LoadResData(1, "NTAPI")
    
    RegKey = Replace(RegKey, "HKEY_LOCAL_MACHINE", "Machine")
    RegKey = Replace(RegKey, "HKEY_USERS", "User")
    RegKey = Replace(RegKey, "HKEY_CLASSES_ROOT", "Machine\SOFTWARE\Classes")
    RegKey = Replace(RegKey, "HKEY_CURRENT_USER\", "User\" & UBase2)
    
    PatchPos = 14008

    For i = 1 To Len(RegKey)
        Reschunk(PatchPos) = Asc(Mid(RegKey, i, 1))
        PatchPos = PatchPos + 2
    Next

    Reschunk(PatchPos) = 0

    Open TempDir & "\NTAPI.exe" For Binary As #1
    Put #1, , Reschunk()
    Close #1

    ExecuteCommand TempDir & "\NTAPI.exe", ""

End Function

Function Operation(OPType, Optional LFilename As String = "", Optional IsCL = 0)
    
    Dim STime    As SYSTEMTIME

    Dim ETime    As SYSTEMTIME

    Dim PassTime As Long

    On Error Resume Next
    
    If OPType <> 4 Then
        FRMMain.CMDPause.Caption = "Pause"
        FRMMain.CMDAbort.Visible = True
        FRMMain.CMDPause.Visible = True
        FRMMain.StatusBar1.Panels(2).MinWidth = 1496.03
        FRMMain.StatusBar1.Panels(3) = "0%"
    End If
    
    FRMMain.Toolbar1.Enabled = False
    FRMMain.File.Enabled = False
    FRMMain.Help.Enabled = False
    FRMMain.Options.Enabled = False
    FRMMain.POP.Enabled = False
    
    ResizeWin
    HiddenKeyFound = 0
    Abort = 0
    DisablePop = 1

    DoEvents
    
    PauseTime = 0
    
    GetSystemTime STime
    
    If OPType = 1 Or OPType = 5 Then
        If FRMMain.MNNotClearLSTScan.Checked = False And IsCL = 0 Then
            FRMMain.ListView1.ListItems.Clear
        Else
            'Call FRMMain.MNRefresh_Click
        End If

        NumOfKey = FRMMain.ListView1.ListItems.Count
        
        PackerName = PackerList(PackerIDX).Name
        
    End If

    If OPType = 2 Then Remove
    If OPType = 3 Then Backup

    If PackerList(PackerIDX).FileName = "" Then
        If OPType = 4 Then ShowInfo
        
        If OPType = 1 Or OPType = 5 Then
            If FRMMain.MNWoW64(2).Checked = False Then SetWoW64Translation 32
            If FRMMain.MNWoW64(2).Checked = True Then SetWoW64Translation 64

            If PackerIDX = PSAll Or PackerIDX = PSFileAll Or PackerIDX = PSFile Then
        
                If PackerIDX = PSAll Then

                    For t = 1 To UBound(PackerList) - 1
                        PackerIDX = t
                        
                        If t >= MaxPacker Then LoadPlugin PackerList(PackerIDX).FileName, 0
                        If t < MaxPacker And t <> ORiEN Then ExecuteScanTrans 1
    
                        If Abort = 2 Then SubPause
                        If Abort = 1 Then Exit For
                    Next

                End If
                
                SetWoW64Translation 32
                
                If FRMMain.MNHideFLTB.Checked = False Then
                    If PackerIDX <> PSFile Then
                        PackerIDX = PSAll
                        CFile = Dir(KeysListPath & "*.txt")
                
                        Do While Replace(CFile, ".", "") <> ""
        
                            If Abort = 1 Then Exit Do
                            LoadF KeysListPath & CFile, 1, 1
                            CFile = Dir
                        Loop

                    Else
                        LoadF KeysListPath & LFilename, 1, 1
                    End If
                End If

                PackerIDX = PSAll

            Else
                
                ExecuteScanTrans OPType
                
                SetWoW64Translation 32
            
            End If

        End If
        
    Else

        If OPType = 4 Then LoadPlugin PackerList(PackerIDX).FileName, 1
        If OPType = 1 Or OPType = 5 Then LoadPlugin PackerList(PackerIDX).FileName, 0
    End If

    FRMMain.File.Enabled = True
    FRMMain.Help.Enabled = True
    FRMMain.POP.Enabled = True
    FRMMain.Options.Enabled = True
    FRMMain.Toolbar1.Enabled = True
    FRMMain.CMDAbort.Visible = False
    FRMMain.CMDPause.Visible = False
    FRMMain.CMDPause.Caption = "Pause"
    FRMMain.Timer2.Enabled = False
    FRMMain.StatusBar1.Panels(2).MinWidth = 1
    ResizeWin
    DisablePop = 0
    GetSystemTime ETime
    
    PassTime = (ETime.wHour - STime.wHour) * 3600 + (ETime.wMinute - STime.wMinute) * 60 + (ETime.wSecond - STime.wSecond) - PauseTime

    If OPType = 1 Or OPType = 5 Then
        If HiddenKeyFound > 0 Then
            AddToLog FRMMain.ListView1.ListItems.Count - NumOfKey & " (" & HiddenKeyFound & " Hidden) " & PackerName & " Keys found"
        Else
            AddToLog FRMMain.ListView1.ListItems.Count - NumOfKey & " " & PackerName & " Keys found"
        End If
    End If
    
    If PackerIDX > 0 Then If PackerList(PackerIDX).FileName <> "" And OPType = 1 And PlugEndMSG <> "" Then AddToLog PlugEndMSG: PlugEndMSG = ""

    OPTime = PassTime * 1000 + (ETime.wMilliseconds - STime.wMilliseconds) & " ms"
    
    If Val(OPTime) >= 1000 Then OPTime = Format(Round(Val(OPTime) / 1000, 2), "0.00") & " s"

    If OPType <> 4 Then FRMMain.StatusBar1.Panels(3).Text = OPTime

    If Abort = 1 Then MsgBox "Operation aborted by user!", vbExclamation
    Abort = 0
    PackerIDX = 0

End Function

Function ParsePackName(nValue) As String

    For t = 1 To UBound(PackerList)

        If PackerList(t).Value = nValue Then ParsePackName = PackerList(t).Name: Exit Function

    Next

    ParsePackName = "Custom"
End Function

Function ParsePackPLG(PackName) As Long

    For t = 1 To UBound(PackerList)

        If PackerList(t).Name = PackName Then ParsePackPLG = PackerList(t).FileName: Exit Function

    Next

    ParsePackPLG = ""
End Function

Function ParsePackValue(PackName) As Long

    For t = 1 To UBound(PackerList)

        If LCase(PackerList(t).Name) = LCase(PackName) Then ParsePackValue = PackerList(t).Value: Exit Function

    Next

    ParsePackValue = 0
End Function

Function ParseRegData(RegTXT, SubValue)

    Set fs2 = CreateObject("Scripting.FileSystemObject")
    
    If SubValue = "" Then

        Do While Left(RegTXT, 1) <> "["
            RegTXT = Right(RegTXT, Len(RegTXT) - 1)
        Loop

        RegTXT = "REGEDIT4" & vbCrLf & vbCrLf & RegTXT
                
        RegTXT = Replace(RegTXT, vbCrLf + vbCrLf + vbCrLf, vbCrLf + vbCrLf)

        If Right(RegTXT, 2) = vbCrLf Then RegTXT = Left(RegTXT, Len(RegTXT) - 2)

    Else
        Set a = fs2.CreateTextFile(TempDir & "Reg.Temp", True)
        a.write (Replace(RegTXT, Chr(13), ""))
        a.Close
        ValueTXT = ""
        IsFoundValue = 0
        UnusedLine = 0
        Set a = fs2.openTextFile(TempDir & "Reg.Temp")

        Do
            CL = a.readline

            If Left(CL, 2) = Chr(255) & Chr(254) Then CL = Right(CL, Len(CL) - 2)
            If Replace(CL, " ", "") <> "" And Left(Replace(CL, " ", ""), 8) <> "REGEDIT4" And Left(Replace(CL, " ", ""), 32) <> "WindowsRegistryEditorVersion5.00" Then

                If IsFoundValue = 1 And (CL = "" Or Left(CL, 1) = """" Or (Left(CL, 1) = "[")) Then Exit Do

                If UnusedLine = 0 Then ValueTXT = ValueTXT & vbCrLf & CL

                If Len(CL) > Len(SubValue) Then If Left(Replace(CL, """", ""), Len(SubValue)) = SubValue Then IsFoundValue = 1: ValueTXT = ValueTXT & vbCrLf & CL: UnusedLine = 0

                If IsFoundValue = 0 And Left(CL, 1) = "[" Then UnusedLine = 1
            End If

        Loop While a.AtEndOfStream = False

        a.Close
        Kill (TempDir & "Reg.Temp")
        RegTXT = (Right(ValueTXT, Len(ValueTXT) - 2))

        Do While Left(RegTXT, 1) <> "["
            RegTXT = Right(RegTXT, Len(RegTXT) - 1)
        Loop

        RegTXT = "REGEDIT4" & vbCrLf & vbCrLf & RegTXT

        RegTXT = Replace(RegTXT, vbCrLf + vbCrLf + vbCrLf, vbCrLf + vbCrLf)

        If Right(RegTXT, 2) = vbCrLf Then RegTXT = Left(RegTXT, Len(RegTXT) - 2)

    End If
    
    ParseRegData = RegTXT

End Function

Function RegEditJump(ByVal strRegKey As String, ByVal strValueName As String)

    Dim hndRegEdit           As Long

    Dim hndTreeView          As Long

    Dim hndListView          As Long

    Dim hndProcess           As Long

    Dim strTmp               As String

    Dim lngVK                As Long

    Dim Ret                  As Long
    
    Const WM_KEYDOWN         As Long = &H100

    Const WM_CHAR            As Long = &H102

    Const VK_LEFT            As Long = &H25

    Const VK_RIGHT           As Long = &H27

    Const VK_HOME            As Long = &H24

    Const INFINITE           As Long = &HFFFFFFFF

    Const PROCESS_ALL_ACCESS As Long = (&HF0000 Or &H100000 Or &HFFF)
    
    hndRegEdit = FindWindow("RegEdit_RegEdit" & vbNullChar, vbNullString)

    If hndRegEdit = 0 Then ExecuteCommand WindowsDir & "regedit.exe", "", 1
    
    Sleep (750)
    
    hndRegEdit = FindWindow("RegEdit_RegEdit" & vbNullChar, vbNullString)
    
    If hndRegEdit = 0 Then
        MsgBox "Unable to launch RegEdit.", vbCritical

        Exit Function

    End If
    
    Ret = ShowWindow(hndRegEdit, 5)
    Ret = SetForegroundWindow(hndRegEdit)
    
    hndTreeView = FindWindowEx(hndRegEdit, 0, "SysTreeView32" & vbNullChar, vbNullString)
    
    Ret = SetForegroundWindow(hndTreeView)
    Ret = SetFocus(hndTreeView)
    
    Ret = GetWindowThreadProcessId(hndTreeView, hndProcess)
    Ret = OpenProcess(PROCESS_ALL_ACCESS, False, hndProcess)
    
    For j = 1 To 30
        Ret = SendMessage(hndTreeView, WM_KEYDOWN, VK_RIGHT, 0)
    Next

    Ret = WaitForInputIdle(hndProcess, INFINITE)
    
    For j = 1 To Len(strRegKey)
        strTmp = Mid(strRegKey, j, 1)

        If strTmp = "\" Then
            Ret = SendMessage(hndTreeView, WM_KEYDOWN, VK_RIGHT, 0)
            Ret = WaitForInputIdle(hndProcess, INFINITE)
        Else
            lngVK = Asc(UCase(strTmp))
            Ret = SendMessage(hndTreeView, WM_CHAR, lngVK, 0)
        End If

    Next
    
    Ret = CloseHandle(hndProcess)
    
    If strValueName <> "" Then
        hndListView = FindWindowEx(hndRegEdit, 0, "SysListView32" & vbNullChar, vbNullString)

        Ret = SetForegroundWindow(hndListView)
        Ret = SetFocus(hndListView)

        Sleep (1000)
        
        Ret = SendMessage(hndListView, WM_KEYDOWN, VK_HOME, 0)
        
        For j = 1 To Len(strValueName)
            lngVK = Asc(UCase(strValueName))
            Ret = SendMessage(hndListView, WM_CHAR, lngVK, 0)
        Next

    End If

    Ret = SetForegroundWindow(hndRegEdit)
    Ret = SetFocus(hndRegEdit)
End Function

Function RegHKtoStr(RegHK, SubKey) As String
   
    If RegHK = HKEY_CLASSES_ROOT Then RegHKtoStr = "HKEY_CLASSES_ROOT\" & SubKey
    If RegHK = HKEY_CURRENT_USER Then RegHKtoStr = "HKEY_CURRENT_USER\" & SubKey
    If RegHK = HKEY_LOCAL_MACHINE Then RegHKtoStr = "HKEY_LOCAL_MACHINE\" & SubKey
    If RegHK = HKEY_USERS Then RegHKtoStr = "HKEY_USERS\" & SubKey
    
    RegHKtoStr = DecodePath(RegHKtoStr, 32)

End Function

Function Remove()
    
    On Error Resume Next
    
    Dim hKey As RegistryPaths
        
    Set FSO = CreateObject("Scripting.FileSystemObject")
    
    If FRMMain.MNAutoBackup.Checked = True Then Backup
    
    OldSortKey = FRMMain.ListView1.SortKey
    FRMMain.ListView1.SortKey = 5

    For i = 1 To FRMMain.ListView1.ListItems.Count

        If Abort = 2 Then SubPause
        If Abort = 1 Then Exit For

        If FRMMain.ListView1.ListItems(i).Text = "WinLicense" And Right(FRMMain.ListView1.ListItems(i).SubItems(2), 13) = "\oreans32.sys" Then OreanMsg = 1
        
        If AnalizeOperation(i) = True Then

            For ty = 1 To FRMProtect.LSTProt.ListItems.Count

                If FRMProtect.LSTProt.ListItems(ty).Checked = True Then
                    If Len(FRMMain.ListView1.ListItems(i).SubItems(2)) > Len(FRMProtect.LSTProt.ListItems(ty).ListSubItems(2)) Then ll = Len(FRMProtect.LSTProt.ListItems(ty).ListSubItems(2)) Else ll = Len(FRMMain.ListView1.ListItems(i).SubItems(2))
                    If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = LCase(FRMProtect.LSTProt.ListItems(ty).ListSubItems(1)) And Left(FRMMain.ListView1.ListItems(i).SubItems(2), ll) = Left(FRMProtect.LSTProt.ListItems(ty).ListSubItems(2), ll) Then
                        Ask = MsgBox("""" & FRMMain.ListView1.ListItems(i).SubItems(2) & """ is a Protect-list Key!" & vbCrLf & vbCrLf & "Do you want Delete?", vbYesNo + vbQuestion)

                        If Ask = vbNo Then GoTo 6
                    End If
                End If

            Next

            AddToLog "Deleting " & FRMMain.ListView1.ListItems(i).SubItems(2)
                
            RemoveStatus = 0
                
            NTStatus = 0

            If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 3) = "reg" Then
            
                CurKey = FRMMain.ListView1.ListItems(i).SubItems(2)
                SetWoW64Translation FRMMain.ListView1.ListItems(i).SubItems(1)

                If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "reg32key" Or LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "reg64key" Then
                    
2                   ParseKey CurKey, hKey, SubKey
                        
                    If ExistKey(hKey, SubKey) = True Then

                        EnumAllRegKeys hKey, SubKey
                    
                        Do
                            OldKey = UBound(AllKeys)

                            EnumValuesDel hKey, AllKeys(j)

                            For j = 1 To UBound(AllKeys)

                                EnumValuesDel hKey, AllKeys(j)

                                DeleteKey hKey, AllKeys(j)
                            Next

                            EnumAllRegKeys hKey, SubKey

                        Loop While UBound(AllKeys) > 0 And OldKey <> UBound(AllKeys)

                        If DeleteKey(hKey, SubKey) = False Then

                            EnumAllRegKeys hKey, SubKey

                            For j = 1 To UBound(AllKeys)

                                EnumValuesDel hKey, AllKeys(j)

                            Next

                            EnumValuesDel hKey, SubKey

                        End If

                        If ExistKey(hKey, SubKey) = True Then RemoveStatus = 1
                        
                    Else
                        RemoveStatus = 2
                    End If
                    
                    If Right(SubKey, 1) = Chr(1) Then
                        SPos = Len(SubKey) - 1
                
                        Do While Mid(SubKey, SPos, 1) <> "\"
                            SPos = SPos - 1
                        Loop
                
                        NTAPI Left(SubKey, SPos)

                        Do While KillF(TempDir & "NTAPI.exe") = False And ExistFile(TempDir & "NTAPI.exe") = True
                            Sleep (100)
                        Loop
                    
                        If NTStatus = 0 Then NTStatus = 1: RemoveStatus = 0
                    End If
            
                End If

                If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "reg32val" Or LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "reg64val" Then
                    ParseKey CurKey, hKey, SubKey

                    Mypos = Len(SubKey)

                    Do
                        Mypos = Mypos - 1
                    Loop While Mid(SubKey, Mypos, 1) <> "\"

                    SubValue = Right(SubKey, Len(SubKey) - Mypos)

                    SubKey = Left(SubKey, Mypos)
                    
                    Do While Right(SubValue, 1) = "\"
                        SubValue = Left(SubValue, Len(SubValue) - 1)

                    Loop
                        
                    If ExistValue(hKey, SubKey, SubValue) = True Then
                        DeleteValue hKey, SubKey, SubValue
                        
                        If ExistValue(hKey, SubKey, SubValue) = True Then RemoveStatus = 1
                    Else
                        RemoveStatus = 2
                    End If
                End If
                
                SetWoW64Translation 32
            End If
            
            If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "sector" Then

                DoEvents
                DiskSec = Replace(Right(FRMMain.ListView1.ListItems(i).SubItems(2), Len(FRMMain.ListView1.ListItems(i).SubItems(2)) - 5), """", "")

                If Left(DiskSec, 1) = " " Then DiskSec = Right(DiskSec, Len(DiskSec) - 1)
                DiskID = Val(DiskSec)
                Mypos = InStr(1, DiskSec, ":", 1)

                If Mypos <> 0 Then
                    SecID = Right(DiskSec, Len(DiskSec) - Mypos)

                    If Left(SecID, 1) = " " Then SecID = Right(SecID, Len(SecID) - 1)
                    
                    If Val(SecID) > 0 And IsNumeric(DiskID) = True Then
                        If SectorDelete(DiskID, Val(SecID)) = True Then
                            RemoveStatus = 0
                        Else
                            RemoveStatus = 1
                        End If
                    End If

                Else
                    RemoveStatus = 2
                End If
            End If
            
            If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 5) = "shell" Then
                SetWoW64Translation FRMMain.ListView1.ListItems(i).SubItems(1)
                ExecuteCommand "cmd.exe", "/c" & FRMMain.ListView1.ListItems(i).SubItems(2)
                SetWoW64Translation 32
                RemoveStatus = 3
            End If
            
            If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 6) = "stream" Then
                If HaveAltStream(FRMMain.ListView1.ListItems(i).SubItems(2), 1) = True Then
                    RemoveStatus = 0
                Else
                    RemoveStatus = 2
                End If
            End If
            
            If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "process" Then
                ProcName = FRMMain.ListView1.ListItems(i).SubItems(2)

                If Left(ProcName, 1) = " " Then ProcName = Right(ProcName, Len(ProcName) - 1)
                
                Dim ProcLst() As Long

                ReDim ProcLst(0)
                
                If Left(UCase(ProcName), 4) = "PID:" Then
                    ProcName = Replace(ProcName, " ", "")

                    If IsRun(Right(ProcName, Len(ProcName) - 4)) = True Then ReDim ProcLst(1): ProcLst(1) = Right(ProcName, Len(ProcName) - 4)
                Else
                    FindProcessList ProcName, ProcLst()
                End If
                
                RemoveStatus = 0
                
                For t = 1 To UBound(ProcLst)
                
                    SuspendResumeProcess ProcLst(t), True
                    
                Next
                                
                For t = 1 To UBound(ProcLst)
                
                    If ProcLst(t) <> 0 Then KillApp ProcLst(t)
                    
                Next
                
                Sleep 100
                
                For t = 1 To UBound(ProcLst)

                    If ProcLst(t) <> 0 And IsRun(ProcLst(t)) = True Then RemoveStatus = 1

                Next

                If UBound(ProcLst) = 0 Then RemoveStatus = 2
                    
            End If

            If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 4) = "file" Or Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 3) = "dir" Then
                SetWoW64Translation FRMMain.ListView1.ListItems(i).SubItems(1)

                If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 4) = "file" Then
                    If ExistFile(FRMMain.ListView1.ListItems(i).SubItems(2)) = True Then
                        SetAttr FRMMain.ListView1.ListItems(i).SubItems(2), vbNormal
                        Kill FRMMain.ListView1.ListItems(i).SubItems(2)

                        If ExistFile(FRMMain.ListView1.ListItems(i).SubItems(2)) Then RemoveStatus = 1
                    Else
                        RemoveStatus = 2
                    End If
                End If

                If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 3) = "dir" Then
                        
                    If ExistDir(FRMMain.ListView1.ListItems(i).SubItems(2)) = True Then
                            
                        PathUnmakeSystemFolder FRMMain.ListView1.ListItems(i).SubItems(2)
                        
                        FSO.DeleteFolder Left(FRMMain.ListView1.ListItems(i).SubItems(2), Len(FRMMain.ListView1.ListItems(i).SubItems(2)) - 1), True

                        If ExistDir(FRMMain.ListView1.ListItems(i).SubItems(2)) = True Then
                                
                            EnumDir (FRMMain.ListView1.ListItems(i).SubItems(2))

                            For Z = 1 To UBound(AllDirsList)
                                     
                                DFile = Dir(AllDirsList(Z) & "\", vbHidden + vbReadOnly + vbSystem)

                                Do While DFile <> ""
                                    SetAttr AllDirsList(Z) & "\" & DFile, vbNormal
                                    Kill AllDirsList(Z) & "\" & DFile
                                    DFile = Dir
                                Loop

                            Next
                                
                            For Z = 1 To UBound(AllDirsList)
                                SetAttr AllDirsList(Z), vbNormal
                                RmDir (AllDirsList(Z) & "\")
                            Next
    
                            SetAttr FRMMain.ListView1.ListItems(i).SubItems(2), vbNormal
                            RmDir (FRMMain.ListView1.ListItems(i).SubItems(2))
                            FSO.DeleteFolder Left(FRMMain.ListView1.ListItems(i).SubItems(2), Len(FRMMain.ListView1.ListItems(i).SubItems(2)) - 1), True
                            
                            If ExistDir(FRMMain.ListView1.ListItems(i).SubItems(2)) = True Then
                                DeleteDirBat FRMMain.ListView1.ListItems(i).SubItems(2)
                            End If
                            
                        End If
                            
                    Else
                        RemoveStatus = 2
                    End If
                        
                    If ExistDir(FRMMain.ListView1.ListItems(i).SubItems(2)) = True Then RemoveStatus = 1

                End If

                If RemoveStatus = 1 Then
                    FRMMain.ListView1.ListItems(i).SubItems(4) = "Error" & LastError: LastError = "": DeleteError1 = 1
                End If

                SetWoW64Translation 32
            End If
                
            If RemoveStatus = 1 And FRMMain.MNNativeAPI.Checked = False And FRMMain.MNNativeAPI.Visible = True Then MsgBox "Enable Native API Support for delete this Key!", vbExclamation
            If RemoveStatus = 1 And FRMMain.MNNativeAPI.Checked = True And Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 3) = "reg" Then
                ParseKey FRMMain.ListView1.ListItems(i).SubItems(2), hKey, SubKey
                    
                NTAPI (FRMMain.ListView1.ListItems(i).SubItems(2))
                    
                Do While KillF(TempDir & "NTAPI.exe") = False And ExistFile(TempDir & "NTAPI.exe") = True
                    Sleep (100)
                Loop
                    
                If NTStatus = 0 Then NTStatus = 1: RemoveStatus = 0: SetWoW64Translation FRMMain.ListView1.ListItems(i).SubItems(1): GoTo 2
            End If

            If RemoveStatus = 0 Then
                FRMMain.ListView1.ListItems(i).SubItems(4) = "Deleted"
            ElseIf RemoveStatus = 1 Then
                FRMMain.ListView1.ListItems(i).SubItems(4) = "Error" & LastError: LastError = "": DeleteError1 = 1
                ErrorCont = ErrorCont + 1
            ElseIf RemoveStatus = 2 Then
                FRMMain.ListView1.ListItems(i).SubItems(4) = "Not Found"
                ErrorCont = ErrorCont + 1
            ElseIf RemoveStatus = 3 Then
                FRMMain.ListView1.ListItems(i).SubItems(4) = "Done"
            End If
                
            DelCont = DelCont + 1
        End If

6   Next

    FRMMain.ListView1.SortKey = OldSortKey
    
    PackerName = PackerList(PackerIDX).Name
        
    AddToLog (Val(DelCont) - ErrorCont) & " " & PackerName & " Keys deleted"
       
    If OreanMsg = 1 Then MsgBox "To complete the remove of WinLicense Ring-0 must be restarts the computer!", vbExclamation
End Function

Function RemoveTrayIcon()

    Shell_NotifyIcon 2, TrayOPT
End Function

Function ResizeWin(Optional IsFast = 0)

    On Error Resume Next
    
    IsAero = FRMMain.MNAERO.Checked
    AEROHack = 0

    If IsAero = True Then AEROHack = 200
    
    If FRMMain.WindowState = 0 Then
        If FRMMain.Width >= VB.Screen.Width - 200 Then FRMMain.Width = VB.Screen.Width - 200
        If FRMMain.Height >= VB.Screen.Height - 450 Then FRMMain.Height = VB.Screen.Height - 450
    End If

    If FRMMain.CMDPause.Visible = True Then FRMMain.Timer2.Enabled = True
    If FRMMain.Height < 3000 Then FRMMain.Height = 3000
    If FRMMain.Width < 3000 Then FRMMain.Width = 3000
    FRMMain.ListView1.Height = FRMMain.Height - 950 - AEROHack

    FRMMain.CMDPause.Top = FRMMain.StatusBar1.Top + 60
    FRMMain.CMDAbort.Top = FRMMain.StatusBar1.Top + 60
    
    TBCol = 1
    
    For t = 0 To FRMMain.MNTBCol.UBound

        If FRMMain.MNTBCol(t).Checked = True Then TBCol = t + 1: Exit For
    Next
    
    DTBHack = (TBCol - 1) * 540 + 10

    If IsAero = True Then DTBHack = (TBCol - 1) * 570 + 180
    
    FRMMain.ListView1.Width = FRMMain.Width - 660 - DTBHack

    If FRMMain.CMDAbort.Visible = True Then
        FRMMain.StatusBar1.Panels(1).Width = FRMMain.Width - 2750
    Else
        FRMMain.StatusBar1.Panels(1).Width = FRMMain.Width - 1400
    End If

    FRMMain.CMDPause.Left = FRMMain.StatusBar1.Panels(1).Width + 60
    FRMMain.CMDAbort.Left = FRMMain.StatusBar1.Panels(1).Width + 780

    If FRMMain.Width < 2055 Then FRMMain.ListView1.Height = FRMMain.ListView1.Height - 250 - AEROHack
    
    If FRMMain.MNFixedSizeList.Checked = False Then

        If FRMMain.ListView1.ListItems.Count > (FRMMain.ListView1.Height - 310) / 255 And FRMMain.Height > 1245 Then ScrollBCoef = 250
        
        If FRMMain.Height <= 1500 And FRMMain.Width <= 2055 Then ScrollBCoef = 0

        If FRMMain.MNHideTypeCol.Checked = True Then
            FRMMain.ListView1.ColumnHeaders(2).Width = 0
        Else
            FRMMain.ListView1.ColumnHeaders(2).Width = 1000
        End If
        
        If FRMMain.MNShowOrdCol.Checked = True Then
            FRMMain.ListView1.ColumnHeaders(6).Width = 500
        Else
            FRMMain.ListView1.ColumnHeaders(6).Width = 0
        End If
        
        If FRMMain.MNDataTimeColumn.Checked = False Then
            FRMMain.ListView1.ColumnHeaders(3).Width = FRMMain.Width - 5000 - ScrollBCoef - DTBHack - FRMMain.ListView1.ColumnHeaders(2).Width - FRMMain.ListView1.ColumnHeaders(6).Width
            FRMMain.ListView1.ColumnHeaders(4).Width = 1725
        Else
            FRMMain.ListView1.ColumnHeaders(3).Width = FRMMain.Width - 3285 - ScrollBCoef - DTBHack - FRMMain.ListView1.ColumnHeaders(2).Width - FRMMain.ListView1.ColumnHeaders(6).Width
            FRMMain.ListView1.ColumnHeaders(4).Width = 0
        End If
        
        If FRMMain.ListView1.ColumnHeaders(3).Width < 2000 Then FRMMain.ListView1.ColumnHeaders(3).Width = 2000

        If FRMMain.Width - 3000 - ScrollBCoef < 0 Then
            FRMMain.ListView1.ColumnHeaders(3).Width = 0
            FRMMain.ListView1.ColumnHeaders(5).Width = 750 + FRMMain.Width - 3000 - ScrollBCoef

            If 750 + FRMMain.Width - 3000 - ScrollBCoef < 0 Then
                FRMMain.ListView1.ColumnHeaders(5).Width = 0
                FRMMain.ListView1.ColumnHeaders(1).Width = 1600 + (FRMMain.Width - 2235 - ScrollBCoef)
            End If

        Else
            FRMMain.ListView1.ColumnHeaders(1).Width = 1600
            FRMMain.ListView1.ColumnHeaders(5).Width = 950
        End If
    End If
        
    If IsAero = False Then
        FRMMain.Toolbar1.Width = 545 * TBCol + 30 '1130
        FRMMain.ListView1.Left = 540 * TBCol + 30 '1110
    Else
        FRMMain.Toolbar1.Width = 575 * TBCol + 30 '1200
        FRMMain.ListView1.Left = 570 * TBCol + 30 '1180
    End If
    
    If IsFast = 0 Then SaveOptions
End Function

Function STLClear()

    On Error GoTo 55

    Dim Lister As ListItem

    FRMProtect.LSTProt.ListItems.Clear
    Set fs2 = CreateObject("Scripting.FileSystemObject")
    Set a = fs2.openTextFile(VB.App.Path & "\AutocleaningList.ini")

    Do While a.AtEndOfStream = False
        CL = a.readline

        If (Left(CL, 1) <> "0" And Left(CL, 1) <> "1") Or (Len(Replace(CL, vbTab, "")) + 2 <> Len(CL) And Len(Replace(CL, vbTab, "")) + 3 <> Len(CL)) Then
            KeyName = CL
            PackName = ""
            IsChecked = 0
            KeyType = ""
        Else
            IsChecked = Left(CL, 1)
            CL = Right(CL, Len(CL) - 2)
            Mypos = InStr(1, CL, vbTab, 1)
            PackName = Mid(CL, 1, Mypos - 1)
            KeyName = Right(CL, Len(CL) - Mypos)

            If Replace(KeyName, vbTab, "") = KeyName Then
                KeyType = GetAutoType(KeyName)
            Else
                Mypos = InStr(1, KeyName, vbTab, 1)
                KeyType = Mid(KeyName, 1, Mypos - 1)
                KeyName = Right(KeyName, Len(KeyName) - Mypos)
            End If
        End If

        If IsChecked = 1 Then AddToList 0, DecodePath(KeyName, KeyType), PackName, KeyType
    Loop

    a.Close
55
    PackerIDX = PSAll
    Operation 2
    PackerIDX = 0
    
    CPID = GetCurrentProcessId
    KillApp CPID
End Function

Function SaveF(FileName)

    For i = 1 To FRMMain.ListView1.ListItems.Count

        If FRMMain.ListView1.ListItems(i).Checked = True Then IsChecked = 1 Else IsChecked = 0

        CurKey = EncodePath(FRMMain.ListView1.ListItems(i).SubItems(2), FRMMain.ListView1.ListItems(i).SubItems(1))
        CurType = FRMMain.ListView1.ListItems(i).SubItems(1)
        CHStr = ""

        If FRMMain.MNShowCheckBox.Checked = True Then CHStr = IsChecked & vbTab
        
        CLine = CLine & vbCrLf & CHStr & FRMMain.ListView1.ListItems(i).Text & vbTab & CurType & vbTab & CurKey
    Next

    CLine = Right(CLine, Len(CLine) - 2)

    Set fs2 = CreateObject("Scripting.FileSystemObject")
    Set a = fs2.CreateTextFile(FileName, True)
    a.write (CLine)
    a.Close
    AddToLog FRMMain.ListView1.ListItems.Count & " keys saved to file"
End Function

Function SaveOptions()

    If FRMMain.Visible = False Then Exit Function

    CreateKey HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset"
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Version", Vers
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBarItems", FRMMain.Toolbar1.Buttons.Count
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Enable Log", Replace(Replace(FRMMain.MNCreateLog.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Stay on Top", Replace(Replace(FRMMain.MNStayOnTop.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Minimize to System Tray", Replace(Replace(FRMMain.MNMinimizeOnTray.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Enable Native API", Replace(Replace(FRMMain.MNNativeAPI.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Only One Instance", Replace(Replace(FRMMain.MNOnlyOneInstance.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Auto Backup", Replace(Replace(FRMMain.MNAutoBackup.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Disable Sector Scan", Replace(Replace(FRMMain.MNDisableSectScan.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Vista Graphic", Replace(Replace(FRMMain.MNAERO.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Auto Size List", Replace(Replace(FRMMain.MNFixedSizeList.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "No DataTime Column", Replace(Replace(FRMMain.MNDataTimeColumn.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Save Window Position", Replace(Replace(FRMMain.MNSaveWindowPosition.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Hide Protect Key", Replace(Replace(FRMMain.MNHideProtectedKey.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Disable delete before scan", Replace(Replace(FRMMain.MNNotClearLSTScan.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Show CheckBox", Replace(Replace(FRMMain.MNShowCheckBox.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Hide File-List Button", Replace(Replace(FRMMain.MNHideFLTB.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Hide Type Column", Replace(Replace(FRMMain.MNHideTypeCol.Checked, True, 1), False, 0)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Order Column", Replace(Replace(FRMMain.MNShowOrdCol.Checked, True, 1), False, 0)

    For t = 0 To FRMMain.MNTBCol.UBound

        If FRMMain.MNTBCol(t).Checked = True Then SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBar Columns", t + 1: Exit For
    Next
    
    If FRMMain.MNSTCleanerE.Checked = True Then
        myName = VB.App.Path & "\" & FindMyName(GetCurrentProcessId)
        SetValue HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Run", "Trial-Reset", myName & " /AUTOCLEANING"
    End If

    If FRMMain.MNWoW64(0).Checked = True Then RegTran = 0
    If FRMMain.MNWoW64(1).Checked = True Then RegTran = 1
    If FRMMain.MNWoW64(2).Checked = True Then RegTran = 2
    If FRMMain.MNWoW64(3).Checked = True Then RegTran = 3

    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "WoW64", RegTran

    SortBy = 0

    If FRMMain.MNLVSort(1).Checked = True Then SortBy = 1
    If FRMMain.MNLVSort(2).Checked = True Then SortBy = 2
    If FRMMain.MNLVSort(3).Checked = True Then SortBy = 3
    If FRMMain.MNLVSort(4).Checked = True Then SortBy = 4
    If FRMMain.MNLVSort(5).Checked = True Then SortBy = 5
    If FRMMain.MNLVSort(6).Checked = True Then SortBy = 6

    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Sort Columns", Val(SortBy)

    If FRMMain.MNRegJumpNormal.Checked = True Then RegJ = 1
    If FRMMain.MNRegJumpAdvanced.Checked = True Then RegJ = 2

    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Regedit Jump Mode", RegJ

    If FRMMain.MNPriorityL(0).Checked = True Then Priority = -15
    If FRMMain.MNPriorityL(1).Checked = True Then Priority = -2
    If FRMMain.MNPriorityL(2).Checked = True Then Priority = -1
    If FRMMain.MNPriorityL(3).Checked = True Then Priority = 0
    If FRMMain.MNPriorityL(4).Checked = True Then Priority = 1
    If FRMMain.MNPriorityL(5).Checked = True Then Priority = 2
    If FRMMain.MNPriorityL(6).Checked = True Then Priority = 15

    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Priority", Priority

    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Window State", FRMMain.WindowState

    If FRMMain.WindowState = 0 Then
        SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Width", FRMMain.Width
        SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Height", FRMMain.Height
        SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Left", FRMMain.Left
        SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Top", FRMMain.Top
    End If

End Function

Function SaveProt()

    On Error Resume Next

    If FRMProtect.LSTProt.ListItems.Count = 0 Then
        Kill VB.App.Path & "\ProtectedList.ini"

        Exit Function

    End If

    ListPos = 1

    For i = 1 To FRMProtect.LSTProt.ListItems.Count - 1

        If FRMProtect.LSTProt.ListItems(ListPos).SubItems(2) = FRMProtect.LSTProt.ListItems(ListPos + 1).SubItems(2) And FRMProtect.LSTProt.ListItems(ListPos).SubItems(1) = FRMProtect.LSTProt.ListItems(ListPos + 1).SubItems(1) Then FRMProtect.LSTProt.ListItems.Remove (ListPos): ListPos = ListPos - 1
        ListPos = ListPos + 1
    Next

    For i = 1 To FRMProtect.LSTProt.ListItems.Count
        IsChecked = Replace(Replace(FRMProtect.LSTProt.ListItems(i).Checked, True, 1), False, 0)

        KeyType = FRMProtect.LSTProt.ListItems(i).SubItems(1)
        KeyName = EncodePath(FRMProtect.LSTProt.ListItems(i).SubItems(2), FRMProtect.LSTProt.ListItems(i).SubItems(1))
        
        ProtFile = ProtFile & vbCrLf & IsChecked & vbTab & FRMProtect.LSTProt.ListItems(i).Text & vbTab & KeyType & vbTab & KeyName
    Next

    ProtFile = Right(ProtFile, Len(ProtFile) - 2)

    Set fs2 = CreateObject("Scripting.FileSystemObject")
    Set a1 = fs2.CreateTextFile(VB.App.Path & "\ProtectedList.ini", True)
    a1.write (ProtFile)
    a1.Close

End Function

Function SaveSTClear()

    On Error Resume Next

    If FRMSTClear.LSTC.ListItems.Count = 0 Then
        Kill VB.App.Path & "\AutocleaningList.ini"

        Exit Function

    End If

    ListPos = 1

    For i = 1 To FRMSTClear.LSTC.ListItems.Count - 1

        If FRMSTClear.LSTC.ListItems(ListPos).SubItems(2) = FRMSTClear.LSTC.ListItems(ListPos + 1).SubItems(2) And FRMSTClear.LSTC.ListItems(ListPos).SubItems(1) = FRMSTClear.LSTC.ListItems(ListPos + 1).SubItems(1) Then FRMSTClear.LSTC.ListItems.Remove (ListPos): ListPos = ListPos - 1
        ListPos = ListPos + 1
    Next

    For i = 1 To FRMSTClear.LSTC.ListItems.Count

        IsChecked = Replace(Replace(FRMSTClear.LSTC.ListItems(i).Checked, True, 1), False, 0)

        KeyType = FRMSTClear.LSTC.ListItems(i).SubItems(1)
        KeyName = EncodePath(FRMSTClear.LSTC.ListItems(i).SubItems(2), FRMSTClear.LSTC.ListItems(i).SubItems(1))

        ACleanFile = ACleanFile & vbCrLf & IsChecked & vbTab & FRMSTClear.LSTC.ListItems(i).Text & vbTab & KeyType & vbTab & KeyName
    Next

    ACleanFile = Right(ACleanFile, Len(ACleanFile) - 2)

    Set fs2 = CreateObject("Scripting.FileSystemObject")
    Set a1 = fs2.CreateTextFile(VB.App.Path & "\AutocleaningList.ini", True)
    a1.write (ACleanFile)
    a1.Close

End Function

Function SectorDelete(DiskID, SecNum) As Boolean

    On Error Resume Next

    Dim hndSelDisk    As Long

    Dim hndSelDiskTXT As Long
    
    Dim hndZero       As Long
    
    Dim hndNext       As Long
    
    Dim hndSecVer     As Long
    
    Dim hndMain       As Long

    Dim Ret           As Long
    
    Dim strBuff       As String

    Dim lngLen        As Long
    
    Dim Reschunk()    As Byte
      
    Const WM_KEYDOWN  As Long = &H100
    
    Const WM_KEYUP    As Long = &H101

    Const VK_EXECUTE  As Long = &H2B
    
    Const VK_DOWN     As Long = &H28
    
    Const VK_UP       As Long = &H26
    
    Const VK_SPACE    As Long = &H20
    
    SectorDelete = False
    
    If FRMMain.MNDisableSectScan.Checked = True Then Exit Function

    Reschunk = LoadResData(1, "DISKEDIT")
    
    TMPFilename = "LLDISKEDIT.exe"
    
    Sleep 100
   
    BinP = TempDir & TMPFilename

    Open BinP For Binary As #1
    Put #1, , Reschunk()
    Close #1
    
    DEPID = ExecuteCommand(BinP, "")
        
    Do
        Sleep (10)
        hndMain = FindWindow("#32770" & vbNullChar, "TR Sector Editor" & vbNullString)
    Loop While hndMain = 0
    
    GetWindowThreadProcessId hndMain, HPID
    
    If DEPID <> HPID Then MsgBox "Error!", vbCritical: GoTo 2
    
    hndChange = FindWindowEx(hndMain, 0, "Button" & vbNullChar, "Change" & vbNullString)
    
    NOTr = 0

    Do
        Sleep (10)
        hndSelDisk = FindWindow("#32770" & vbNullChar, "TR Select Disk" & vbNullString)
        NOTr = NOTr + 1

        If NOTr = 100 Then
            NOTr = 0
            Ret = PostMessage(hndChange, WM_KEYDOWN, VK_SPACE, 0)
            Ret = PostMessage(hndChange, WM_KEYUP, VK_SPACE, 0)
        End If

    Loop While hndSelDisk = 0

    hndSelDiskTXT = FindWindowEx(hndSelDisk, 0, "ComboBox" & vbNullChar, vbNullString)
    NumDisk = SendMessage(hndSelDiskTXT, &H146, 0, 0)
    
    hndZero = FindWindowEx(hndMain, 0, "Button" & vbNullChar, "Zero" & vbNullString)
    hndSave = FindWindowEx(hndMain, 0, "Button" & vbNullChar, "Save" & vbNullString)
    hndNext = FindWindowEx(hndMain, 0, "Button" & vbNullChar, "Next" & vbNullString)
    hndPrev = FindWindowEx(hndMain, 0, "Button" & vbNullChar, "Prev" & vbNullString)
        
    hndSecVer = FindWindowEx(hndMain, 0, "Static" & vbNullChar, vbNullString)
            
    Sleep 150

    NOTr = 0

    Do
        Sleep (10)
        hndSelDisk = FindWindow("#32770" & vbNullChar, "TR Select Disk" & vbNullString)
        NOTr = NOTr + 1

        If NOTr = 100 Then
            NOTr = 0
            Ret = PostMessage(hndChange, WM_KEYDOWN, VK_SPACE, 0)
            Ret = PostMessage(hndChange, WM_KEYUP, VK_SPACE, 0)
        End If

    Loop While hndSelDisk = 0

    hndSelDiskTXT = FindWindowEx(hndSelDisk, 0, "ComboBox" & vbNullChar, vbNullString)
    
    NumDisk = SendMessage(hndSelDiskTXT, &H146, 0, 0)

    For t = 1 To NumDisk - 1
        Ret = PostMessage(hndSelDiskTXT, WM_KEYDOWN, VK_DOWN, 0)
        Ret = PostMessage(hndSelDiskTXT, WM_KEYUP, VK_DOWN, 0)
        Sleep 100
        lngLen = SendMessage(hndSelDiskTXT, &HE, 0, 0) + 1
    
        If lngLen > 1 Then
            strBuff = String(lngLen, vbNullChar)
            lngLen = SendMessage(hndSelDiskTXT, &HD, lngLen, ByVal strBuff)
            WindowTextGet = Replace(Left(strBuff, lngLen), " ", "")

            If WindowTextGet = "Physical" & DiskID Then Exit For
        Else

            GoTo 2

        End If
        
        DoEvents

        If Abort = 1 Then GoTo 2
            
    Next
    
    If WindowTextGet = "Physical" & DiskID Then
        
        Ret = PostMessage(hndSelDiskTXT, WM_KEYDOWN, VK_EXECUTE, 0)
        Ret = PostMessage(hndSelDiskTXT, WM_KEYUP, VK_EXECUTE, 0)
    
        Sleep 200
                
        For t = 1 To Val(SecNum)
            Ret = PostMessage(hndNext, WM_KEYDOWN, VK_SPACE, 0)
            Ret = PostMessage(hndNext, WM_KEYUP, VK_SPACE, 0)

            DoEvents

            If Abort = 1 Then GoTo 2
        Next
            
        Sleep 100

        lngLen = SendMessage(hndSecVer, &HE, 0, 0) + 1

        If lngLen > 1 Then
            strBuff = String(lngLen, vbNullChar)
            lngLen = SendMessage(hndSecVer, &HD, lngLen, ByVal strBuff)
            CurSec = Val(Replace(Replace(Left(strBuff, lngLen), " ", ""), vbCrLf, ""))
        End If

        Do While CurSec <> Val(SecNum)

            If CurSec < Val(SecNum) Then
                Ret = PostMessage(hndNext, WM_KEYDOWN, VK_SPACE, 0)
                Ret = PostMessage(hndNext, WM_KEYUP, VK_SPACE, 0)
            End If
            
            If CurSec > Val(SecNum) Then
                Ret = PostMessage(hndPrev, WM_KEYDOWN, VK_SPACE, 0)
                Ret = PostMessage(hndPrev, WM_KEYUP, VK_SPACE, 0)
            End If
                    
            Sleep 100
        
            lngLen = SendMessage(hndSecVer, &HE, 0, 0) + 1

            If lngLen > 1 Then
                strBuff = String(lngLen, vbNullChar)
                lngLen = SendMessage(hndSecVer, &HD, lngLen, ByVal strBuff)
                CurSec = Val(Replace(Replace(Left(strBuff, lngLen), " ", ""), vbCrLf, ""))
            End If

            DoEvents

            If Abort = 1 Then GoTo 2
            
        Loop
            
        If Val(CurSec) = Val(SecNum) And Val(SecNum) <> 0 Then

            Sleep 100
                        
            Ret = PostMessage(hndZero, WM_KEYDOWN, VK_SPACE, 0)
            Ret = PostMessage(hndZero, WM_KEYUP, VK_SPACE, 0)
                        
            Sleep 100
                        
            Ret = PostMessage(hndSave, WM_KEYDOWN, VK_SPACE, 0)
            Ret = PostMessage(hndSave, WM_KEYUP, VK_SPACE, 0)
            
            Sleep 200
            
            SectorDelete = True
                    
        End If
        
    End If

2
    KillApp DEPID
    Sleep 200
    KillApp DEPID
    
    KillF BinP
    
End Function

Function SectorDump(StartSector, _
                    SecLen, _
                    SecDump() As SecList, _
                    Optional DiskID = -1, _
                    Optional AutoEnd = 2)

    On Error Resume Next

    Dim hndSelDisk    As Long

    Dim hndSelDiskTXT As Long

    Dim hndDump       As Long
    
    Dim hndChange     As Long
    
    Dim hndNext       As Long
    
    Dim hndPrev       As Long
    
    Dim hndSecVer     As Long
    
    Dim hndMain       As Long

    Dim Ret           As Long
    
    Dim EndMsg        As String
    
    Dim strBuff       As String

    Dim lngLen        As Long
    
    Dim DumpByte(600) As Byte
    
    Dim Reschunk()    As Byte
    
    Dim DickA()       As Integer
   
    Const WM_KEYDOWN  As Long = &H100
    
    Const WM_KEYUP    As Long = &H101

    Const VK_EXECUTE  As Long = &H2B
    
    Const VK_DOWN     As Long = &H28
    
    Const VK_UP       As Long = &H26
    
    Const VK_SPACE    As Long = &H20
   
    Dim si            As STARTUPINFO

    Dim pi            As PROCESS_INFORMATION

    ReDim SecDump(0)
    
    If FRMMain.MNDisableSectScan.Checked = True Then Exit Function

    Reschunk = LoadResData(1, "DISKEDIT")

    TMPFilename = "LLDISKEDIT.exe"
    
    Sleep 100
    
    BinP = TempDir & TMPFilename

    Open BinP For Binary As #1
    Put #1, , Reschunk()
    Close #1
    
1   DEPID = ExecuteCommand(BinP, "")
    
    DoEvents

    Do
        Sleep (10)
        hndMain = FindWindow("#32770" & vbNullChar, "TR Sector Editor" & vbNullString)
    Loop While hndMain = 0
    
    GetWindowThreadProcessId hndMain, HPID
    
    If DEPID <> HPID Then MsgBox "Error!", vbCritical: GoTo 2
    
    hndChange = FindWindowEx(hndMain, 0, "Button" & vbNullChar, "Change" & vbNullString)
    
    NOTr = 0

    Do
        Sleep (10)
        hndSelDisk = FindWindow("#32770" & vbNullChar, "TR Select Disk" & vbNullString)
        NOTr = NOTr + 1

        If NOTr = 100 Then
            NOTr = 0
            Ret = PostMessage(hndChange, WM_KEYDOWN, VK_SPACE, 0)
            Ret = PostMessage(hndChange, WM_KEYUP, VK_SPACE, 0)
        End If

    Loop While hndSelDisk = 0

    hndSelDiskTXT = FindWindowEx(hndSelDisk, 0, "ComboBox" & vbNullChar, vbNullString)
    NumDisk = SendMessage(hndSelDiskTXT, &H146, 0, 0)

    ReDim DickA(0)

    If DiskID = -1 Then

        For t = 1 To NumDisk - 1
            Ret = PostMessage(hndSelDiskTXT, WM_KEYDOWN, VK_DOWN, 0)
            Ret = PostMessage(hndSelDiskTXT, WM_KEYUP, VK_DOWN, 0)
            Sleep 100
            lngLen = SendMessage(hndSelDiskTXT, &HE, 0, 0) + 1
    
            If lngLen > 1 Then
                strBuff = String(lngLen, vbNullChar)
                lngLen = SendMessage(hndSelDiskTXT, &HD, lngLen, ByVal strBuff)
                WindowTextGet = Replace(Left(strBuff, lngLen), " ", "")
    
                If Left(WindowTextGet, 8) = "Physical" Then
                    DickA(UBound(DickA)) = Right(WindowTextGet, Len(WindowTextGet) - 8)
                    ReDim Preserve DickA(UBound(DickA) + 1)
                End If
            End If

            DoEvents

            If Abort = 1 Then GoTo 2
        
        Next

        For t = 1 To NumDisk
            Ret = PostMessage(hndSelDiskTXT, WM_KEYDOWN, VK_UP, 0)
            Ret = PostMessage(hndSelDiskTXT, WM_KEYUP, VK_UP, 0)
        Next

    Else
        ReDim DickA(1)
        DickA(0) = DiskID
    End If
    
    hndNext = FindWindowEx(hndMain, 0, "Button" & vbNullChar, "Next" & vbNullString)
    hndPrev = FindWindowEx(hndMain, 0, "Button" & vbNullChar, "Prev" & vbNullString)

    hndDump = FindWindowEx(hndMain, 0, "Edit" & vbNullChar, vbNullString)
        
    hndSecVer = FindWindowEx(hndMain, 0, "Static" & vbNullChar, vbNullString)
    
    If SecLen < 0 Then Dstep = -1 Else Dstep = 1
            
    For DskID = 0 To UBound(DickA) - 1

        Sleep 150

        NOTr = 0

        Do
            Sleep (10)
            hndSelDisk = FindWindow("#32770" & vbNullChar, "TR Select Disk" & vbNullString)
            NOTr = NOTr + 1

            If NOTr = 100 Then
                NOTr = 0
                Ret = PostMessage(hndChange, WM_KEYDOWN, VK_SPACE, 0)
                Ret = PostMessage(hndChange, WM_KEYUP, VK_SPACE, 0)
            End If
            
            DoEvents

            If Abort = 1 Then GoTo 2
            
        Loop While hndSelDisk = 0

        hndSelDiskTXT = FindWindowEx(hndSelDisk, 0, "ComboBox" & vbNullChar, vbNullString)
    
        NumDisk = SendMessage(hndSelDiskTXT, &H146, 0, 0)

        For t = 1 To NumDisk - 1
            Ret = PostMessage(hndSelDiskTXT, WM_KEYDOWN, VK_DOWN, 0)
            Ret = PostMessage(hndSelDiskTXT, WM_KEYUP, VK_DOWN, 0)
            Sleep 100
            lngLen = SendMessage(hndSelDiskTXT, &HE, 0, 0) + 1
    
            If lngLen > 1 Then
                strBuff = String(lngLen, vbNullChar)
                lngLen = SendMessage(hndSelDiskTXT, &HD, lngLen, ByVal strBuff)
                WindowTextGet = Replace(Left(strBuff, lngLen), " ", "")

                If WindowTextGet = "Physical" & DickA(DskID) Then Exit For
            End If
            
            DoEvents

            If Abort = 1 Then GoTo 2
        
        Next
    
        If WindowTextGet = "Physical" & DickA(DskID) Then
        
            Ret = PostMessage(hndSelDiskTXT, WM_KEYDOWN, VK_EXECUTE, 0)
            Ret = PostMessage(hndSelDiskTXT, WM_KEYUP, VK_EXECUTE, 0)
    
            Sleep 200

            For t = 1 To StartSector
                Ret = PostMessage(hndNext, WM_KEYDOWN, VK_SPACE, 0)
                Ret = PostMessage(hndNext, WM_KEYUP, VK_SPACE, 0)
            Next
            
            ZSC = 0
            
            For Sec = StartSector To StartSector + SecLen Step Dstep
                
                UpdateProgress (DskID) * (Abs(SecLen) + 1) + Abs(Sec - StartSector), (UBound(DickA)) * (Abs(SecLen) + 1)
                
                If Abort = 1 Then GoTo 2
                
                DoEvents
                
                lngLen = SendMessage(hndSecVer, &HE, 0, 0) + 1
    
                If lngLen > 1 Then
                    strBuff = String(lngLen, vbNullChar)
                    lngLen = SendMessage(hndSecVer, &HD, lngLen, ByVal strBuff)
                    CurSec = Val(Replace(Replace(Left(strBuff, lngLen), " ", ""), vbCrLf, ""))
                End If
                
                Do While CurSec <> Sec
                
                    If CurSec < Sec Then
                        Ret = PostMessage(hndNext, WM_KEYDOWN, VK_SPACE, 0)
                        Ret = PostMessage(hndNext, WM_KEYUP, VK_SPACE, 0)
                    End If
                    
                    If CurSec > Sec Then
                        Ret = PostMessage(hndPrev, WM_KEYDOWN, VK_SPACE, 0)
                        Ret = PostMessage(hndPrev, WM_KEYUP, VK_SPACE, 0)
                    End If
                    
                    Sleep 100
                
                    lngLen = SendMessage(hndSecVer, &HE, 0, 0) + 1
    
                    If lngLen > 1 Then
                        strBuff = String(lngLen, vbNullChar)
                        lngLen = SendMessage(hndSecVer, &HD, lngLen, ByVal strBuff)
                        CurSec1 = CurSec
                        CurSec = Val(Replace(Replace(Left(strBuff, lngLen), " ", ""), vbCrLf, ""))
                    Else
                        KillApp DEPID
                        Sleep 200
                        GoTo 1
                    End If
                    
                    DoEvents

                    If Abort = 1 Then GoTo 2

                Loop
                
                lngLen = SendMessage(hndDump, &HE, 0, 0) + 1

                If lngLen > 1 Then
                    strBuff = String(lngLen, vbNullChar)
                    lngLen = SendMessage(hndDump, &HD, lngLen, ByVal strBuff)
                    WindowTextGet = Replace(Replace(Left(strBuff, lngLen), " ", ""), vbCrLf, "")

                End If
            
                If Val(CurSec) = Sec Then
                    ReDim Preserve SecDump(UBound(SecDump) + 1)
                    SecDump(UBound(SecDump)).DiskNum = DickA(DskID)
                    SecDump(UBound(SecDump)).SecNum = Sec
                    SecDump(UBound(SecDump)).SecData = WindowTextGet

                    If Replace(WindowTextGet, "0", "") = "" Then ZSC = ZSC + 1 Else ZSC = 0
                    
                    If ZSC >= AutoEnd And AutoEnd <> 0 Then Exit For
                Else
                    KillApp DEPID
                    Sleep 200
                    GoTo 1
                End If
                
                Sleep 100
    
            Next
        
        End If
        
        Ret = PostMessage(hndChange, WM_KEYDOWN, VK_SPACE, 0)
        Ret = PostMessage(hndChange, WM_KEYUP, VK_SPACE, 0)
    
    Next

2
    UpdateProgress 1, 1
    KillApp DEPID
    Sleep 200
    KillApp DEPID
    
    KillF BinP

End Function

Function SectorDumpLog(StartSector, _
                       SecLen, _
                       SecDump() As SecList, _
                       Optional DiskID = -1, _
                       Optional AutoEnd = 2)

    If FRMMain.MNDisableSectScan.Checked = False Then AddToLog "Searching " & PackerList(PackerIDX).Name & " Sector"
    
    SectorDump StartSector, SecLen, SecDump, DiskID, AutoEnd
End Function

Function SetCorrectTime(ByVal TimePassed As Integer)

    Dim TimeInSeconds As Double

    Dim iHours        As Double

    Dim iMinutes      As Double

    Dim iSeconds      As Double

    TimeInSeconds = Val(pt.wHour) * 3600 + Val(pt.wMinute) * 60 + Val(pt.wSecond) + Int(TimePassed * (FRMMain.Timer1.Interval / 1000))
    
    iHours = Int(TimeInSeconds / 3600)
    iMinutes = Int((TimeInSeconds - (iHours * 3600)) / 60)
    iSeconds = TimeInSeconds - iHours * 3600 - iMinutes * 60

    If iSeconds >= 60 Then
        iSeconds = iSeconds - 60
        iMinutes = iMinutes + 1
    End If

    If iMinutes >= 60 Then
        iMinutes = iMinutes - 60
        iHours = iHours + 1
    End If

    If iHours >= 24 Then
        iHours = iHours - 24
        iDay = iDay + 1
    Else
        iDay = 0
    End If
    
    pt.wHour = iHours
    pt.wMinute = iMinutes
    pt.wSecond = iSeconds
    pt.wDay = pt.wDay + iDay

    SetSystemTime pt

End Function

Function SetWoW64Translation(InRegT)

    If WoW64Translation <> 0 And (Left(LCase(InRegT), 8) = "stream32" Or Left(LCase(InRegT), 7) = "shell32" Or Left(LCase(InRegT), 5) = "dir32" Or Left(LCase(InRegT), 6) = "file32" Or Left(LCase(InRegT), 5) = "reg32" Or Val(InRegT) = 32 Or Val(InRegT) = 0) Then WoW64Translation = 0: DisableFileRed True
    If WoW64Translation <> KEY_WOW64_64KEY And (Left(LCase(InRegT), 8) = "stream64" Or Left(LCase(InRegT), 7) = "shell64" Or Left(LCase(InRegT), 5) = "dir64" Or Left(LCase(InRegT), 6) = "file64" Or Left(LCase(InRegT), 5) = "reg64" Or Val(InRegT) = 64 Or Val(InRegT) = KEY_WOW64_64KEY) And Is64bitFast = True Then WoW64Translation = KEY_WOW64_64KEY: DisableFileRed False
 
    DisDHSS = 0
    
    If Is64bitFast = True And FRMMain.MNWoW64(0).Checked = True And WoW64Translation = 0 Then DisDHSS = 1
End Function

Public Function ShowFileDialog(ByVal Action As Integer, _
                               tOpenFile As OpenFilename) As String

    Dim lMaxSize       As Long

    Dim sFileNameBuff  As String

    Dim sFileTitleBuff As String

    On Error Resume Next

    tOpenFile.lStructSize = Len(tOpenFile)
    tOpenFile.lpstrFilter = Replace$(tOpenFile.lpstrFilter, "|", Chr(0)) & Chr(0)
    
    lMaxSize = 255

    sFileNameBuff = tOpenFile.lpstrFile

    While Len(sFileNameBuff) < lMaxSize - 1

        sFileNameBuff = sFileNameBuff & " "

    Wend

    If lMaxFileSize = 0 Then
        sFileNameBuff = Mid(sFileNameBuff, 1, lMaxSize - 1)
    Else
        sFileNameBuff = Mid(sFileNameBuff, 1, lMaxFileSize - 1)
    End If

    sFileNameBuff = sFileNameBuff & Chr(0)
    tOpenFile.lpstrFile = sFileNameBuff

    If lMaxFileSize <> 255 Then tOpenFile.nMaxFile = 255

    sFileTitleBuff = tOpenFile.lpstrFileTitle

    While Len(sFileTitleBuff) < lMaxSize - 1

        sFileTitleBuff = sFileTitleBuff & " "

    Wend

    If lMaxFileSize = 0 Then
        sFileTitleBuff = Mid(sFileTitleBuff, 1, lMaxSize - 1)
    Else
        sFileTitleBuff = Mid(sFileTitleBuff, 1, lMaxFileSize - 1)
    End If

    tOpenFile.lpstrFileTitle = sFileTitleBuff & Chr(0)

    If Action = 1 Then lApiReturn = GetOpenFileName(tOpenFile)
    If Action = 2 Then lApiReturn = GetSaveFileName(tOpenFile)

    If lApiReturn = 1 Then ShowFileDialog = Replace(tOpenFile.lpstrFile, Chr(0), "")

End Function

Function ShowInfo()
    
    PackerName = PackerList(PackerIDX).Name

    InfoMSG = "For Remove " & PackerName & " trial system:" + vbCrLf + "-Clear " & PackerName & " with Trial-Reset"
    WarningMSG = vbCrLf + vbCrLf + "Attention: If you have a legally registered " & PackerName & " program, Trial-Reset remove the License Key!"
    RestartMSG = "For Remove " & PackerName & " trial system:" + vbCrLf + "-Uninstall the Program" + vbCrLf + "-Clear " & PackerName & " with Trial-Reset" + vbCrLf + "-Reinstall the Program"

    If PackerIDX = Nalpeiron Or PackerIDX = EncryptPE Or PackerIDX = EXECryptor Or PackerIDX = Armadillo Or PackerIDX = SoftSentry Or PackerIDX = SoftLocx Or PackerIDX = SDProtector Or PackerIDX = PCGuard Or PackerIDX = STProtector Or PackerIDX = ProtectShareware Or PackerIDX = DBPE Or PackerIDX = ICELicense Then MsgBox InfoMSG + WarningMSG, vbInformation: Exit Function

    If PackerIDX = VBox Or PackerIDX = VisualProtect Or PackerIDX = VBOLock Or PackerIDX = SoftWrap Or PackerIDX = LicenseProtector Then MsgBox RestartMSG, vbInformation: Exit Function
    
    If PackerIDX = Enigma Then MsgBox InfoMSG & vbCrLf & vbCrLf & "Generic Scan is fast but doesn't find all keys." & vbCrLf & "Full Scan find all keys but is very slow." & WarningMSG, vbInformation: Exit Function
    
    If PackerIDX = ProtectionPlus Then MsgBox InfoMSG + vbCrLf + vbCrLf + "TrialCreator 1.x and Instant PLUS 2.x as the same keys of " & PackerName, vbInformation: Exit Function
       
    If PackerIDX = WinLicense Then MsgBox InfoMSG + vbCrLf + "-Restart the computer (Ring-0 only)", vbInformation: Exit Function
    
    If PackerIDX = FlexNet Then MsgBox InfoMSG + vbCrLf + vbCrLf + "SafeCast 2.x  as the same keys of " & PackerName + WarningMSG, vbInformation: Exit Function

    MsgBox InfoMSG, vbInformation

End Function

Function SubPause()
    
    Dim STime As SYSTEMTIME

    Dim ETime As SYSTEMTIME
    
    GetSystemTime STime

    Do While Abort = 2
        Sleep (100)

        DoEvents
    Loop
    
    GetSystemTime ETime
    
    PauseTime = (ETime.wHour - STime.wHour) * 3600 + (ETime.wMinute - STime.wMinute) * 60 + (ETime.wSecond - STime.wSecond)

End Function

Public Function SuspendResumeProcess(ByVal ProcID As Long, _
                                     ByVal SuspendResume As Boolean) As Boolean

    Dim hSnapshot As Long

    Dim htthread  As Long

    Dim pthread   As Boolean

    Dim pt        As THREADENTRY32

    If nrs1 = 1 Then Exit Function

    SuspendResumeProcess = False

    hSnapshot = CreateToolhelp32Snapshot(&H4, 0)

    pt.dwSize = Len(pt)

    pthread = Thread32First(hSnapshot, pt)

    While pthread

        If pt.th32OwnerProcessID = ProcID Then
            htthread = OpenThread(THREAD_ALL_ACCESS, 0, pt.th32ThreadID)
        
            If htthread <> 0 Then
                If SuspendResume Then SuspendThread (htthread) Else ResumeThread (htthread)
                CloseHandle htthread
                SuspendResumeProcess = True
            End If
        End If

        pthread = Thread32Next(hSnapshot, pt)

    Wend

    CloseHandle hSnapshot
End Function

Function TestIco(IconPath)

    On Error GoTo 55

    FRMMain.Picture1.Picture = LoadPicture(IconPath)
    TestIco = True

    Exit Function

55  TestIco = False
End Function

Function ToolBarSort(ByRef PDArray() As PackerDes)

    Dim varSwap As PackerDes

    For i = 2 To UBound(PDArray) - 1
        varSwap.Name = PDArray(i).Name
        varSwap.FileName = PDArray(i).FileName
        varSwap.Value = PDArray(i).Value
        
        For j = i To 2 Step -1

            If UCase(varSwap.Name) < UCase(PDArray(j - 1).Name) Then
                PDArray(j).Name = PDArray(j - 1).Name
                PDArray(j).FileName = PDArray(j - 1).FileName
                PDArray(j).Value = PDArray(j - 1).Value
            Else

                Exit For

            End If

        Next

        PDArray(j).Name = varSwap.Name
        PDArray(j).FileName = varSwap.FileName
        PDArray(j).Value = varSwap.Value

    Next
    
    For i = 1 To UBound(PDArray) - 1
        PDArray(i).Value = i
    Next

End Function

Function TrayEvent(MouseX As Single) As String
   
    TrayEvent = ""

    Select Case MouseX / Screen.TwipsPerPixelX

        Case &H201
            TrayEvent = "LEFTDOWN"

        Case &H202
            TrayEvent = "LEFTUP"

        Case &H203
            TrayEvent = "LEFTDOUBLE"

        Case &H204
            TrayEvent = "RIGHTDOWN"

        Case &H205
            TrayEvent = "RIGHTUP"

        Case &H206
            TrayEvent = "RIGHTDOUBLE"
    End Select

End Function

Function TrimNull(StartStr As String) As String

    pos = InStr(StartStr, Chr(0))

    If pos Then
        TrimNull = Left(StartStr, pos - 1)

        Exit Function

    End If

    TrimNull = StartStr
End Function

Function UpdateProgress(Value, MaxV)

    If Int((Value / MaxV) * 100 / 5) * 5 <> CPercent Then
        CPercent = Int((Value / MaxV) * 100 / 5) * 5
        FRMMain.StatusBar1.Panels(3) = CPercent & "%":

        DoEvents

        If Abort = 2 Then SubPause
    End If
            
End Function

Function UpdateViewFRM()

    FRMView.TXTData = ""
    
    If FRMView.MNHex.Checked = False Then

        For t = 0 To UBound(FileBinary)
            TemdData = TemdData & Chr(FileBinary(t))
        Next

        FRMView.TXTData = TemdData
    Else

        For t = 0 To UBound(FileBinary)
            TemdData = TemdData & " " & String(2 - Len(Hex(FileBinary(t))), "0") & Hex(FileBinary(t))
        Next
        
        FRMView.TXTData = Right(TemdData, Len(TemdData) - 1)
    End If

End Function

Function VerifyCLSID_Hook(SubKey) As Boolean

    VerifyCLSID_Hook = True

    If ExistKey(HKEY_CLASSES_ROOT, "CLSID\" & SubKey & "\ProgID") = True Then
        PIDValue = ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & SubKey & "\ProgID", "")
        
        If PIDValue <> "" And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & PIDValue) = True Then
            CLSIDValue = ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & PIDValue & "\CLSID", "")

            If CLSIDValue <> "" And Left(CLSIDValue, 1) = "{" And Right(CLSIDValue, 1) = "}" And CLSIDValue = SubKey Then VerifyCLSID_Hook = False
        End If

    End If

    If ExistKey(HKEY_CLASSES_ROOT, "CLSID\" & SubKey & "\VersionIndependentProgID") = True Then
        PIDValue = ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & SubKey & "\VersionIndependentProgID", "")
        
        If PIDValue <> "" And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & PIDValue) = True Then
            CLSIDValue = ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & PIDValue & "\CLSID", "")

            If CLSIDValue <> "" And Left(CLSIDValue, 1) = "{" And Right(CLSIDValue, 1) = "}" And CLSIDValue = SubKey Then VerifyCLSID_Hook = False
        End If

    End If

End Function

