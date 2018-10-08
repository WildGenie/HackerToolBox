Attribute VB_Name = "Nanomites"
Option Explicit

Private FileName            As String
Private Running             As Boolean
Private Nano()              As Nanomite
Private NumNanos            As Long
Private ReportedTotal       As Boolean

Public CmdLine              As String
Public RStruct              As UPDATE_REPORT

Public LastTally            As Long

Private Sub PruneNanomites()
    Dim I           As Long
    Dim NewCount    As Long
    Dim Clean()     As Nanomite
    
    ReDim Clean(NumNanos)
    For I = 0 To NumNanos
        If Nano(I).JumpType > 1 Then
            Clean(NewCount) = Nano(I)
            NewCount = NewCount + 1
        End If
    Next I
    
    ReDim Nano(NewCount)
    For I = 0 To NewCount - 1
        Nano(I) = Clean(I)
    Next I
    If NumNanos <> NewCount Then
        Report CStr(NumNanos - NewCount) & " useless Nanomites discarded."
        NumNanos = NewCount
    End If
End Sub

Public Sub UpdateCB(TStruct As UPDATE_REPORT)
    Dim Tally   As Long
    
    DoEvents
    If Not ReportedTotal Then
        ReportedTotal = True
        Tally = TStruct.NumNanos
        If Tally > 0 Then Tally = Tally - 1
        Report CStr(Tally) & " potential INT3 found."
        Report "0 INT3 processed..."
    End If
    If TStruct.CurrentNano > 0 Then
        frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
        Report CStr(TStruct.CurrentNano) & " INT3 processed..."
    End If
    RStruct = TStruct
    
    LastTally = Tally
End Sub

Public Sub LocateNanomites()
    Dim RetryWithManualName     As Boolean
    Dim FName                   As String
    Report ""
    Report "------ Nanomites ------"
    If frmMain.chkManual.Value = vbChecked Then RetryWithManualName = True
Retry:
    ReportedTotal = False
    If CmdLine <> "" Then RetryWithManualName = True
    If Not NLAcquire(RetryWithManualName) Then Exit Sub
    If FileName = "" Then
        FName = ""
    Else
        FName = """" & Left(FileName, Len(FileName) - 1) & """ " & CmdLine
    End If
    If Not RetryWithManualName Then Report "Attempting to use automatic filename..."
    Report "Initialising..."
    ExternNanomites AddressOf UpdateCB, RStruct, FName, ProcessID, TStart, TLength
    If RStruct.CurrentNano = 0 Then
        If FileName = "" Then
            frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
            frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
            frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
            Report "Proceeding manually..."
            RetryWithManualName = True
            GoTo Retry
        Else
            frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
            If LastTally > 0 Then
                Report "Process didn't attempt to repair Nanomites."
            Else
                Report "No Nanomites found."
            End If
            Report "Failed."
            Exit Sub
        End If
    End If
    frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
    If (RStruct.CurrentNano - RStruct.NumDuf) <= 0 Then
        Report "Process didn't attempt to repair Nanomites."
    Else
        NumNanos = RStruct.CurrentNano - 1
        'If RStruct.Inconsistency Then
        '    Report "Some jumps were found to be inconsistent. Proceed with caution."
        'Else
        '    Report "All jumps appear to be consistent."
        'End If
        ReDim Nano(NumNanos)
        ExternPopulate Nano(0)
        PruneNanomites
        Report CStr(RStruct.CurrentNano - 1) & " INT3 found, " & CStr(NumNanos) & " successfully analysed."
        
        frmMain.cmdSaveNanomites.Enabled = True
        frmMain.cmdRemoveNanomites.Enabled = True
    End If
End Sub

Private Function NLAcquire(AskForFilename As Boolean) As Boolean
    Dim LastPath As String
    
    TStart = Val("&H" & frmMain.txtTargetStart.Text & "&")
    TLength = Val("&H" & frmMain.txtTargetLength.Text & "&")
    ProcessID = Val("&H" & frmMain.txtPID.Text & "&")
    
    If ProcessID <= 0 Then Exit Function
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, ProcessID)
    If hProcess = 0 Then
        Report "Invalid Process ID."
        Exit Function
    End If
    If TLength <= 0 Then
        Report "Section length must be positive."
        Exit Function
    End If
    If TStart <= 0 Then
        Report "Start addresses must be positive."
        Exit Function
    End If
    
    ReDim Target(TLength)
    
    RPMRet = ReadProcessMemory(hProcess, ByVal TStart, Target(0), TLength, NumBytes)
    If RPMRet = 0 Or (NumBytes <> TLength) Then
        Report "Unable to read target code memory."
        Exit Function
    End If
    
    Report "Process memory buffered successfully."
    
NoProcess:
    If AskForFilename Then
        LastPath = GetSetting("ArmInline", "Settings", "LastDir", App.Path)
        FileName = OpenDialogBox(frmMain, "Executable File (*.exe)" + Chr$(0) + "*.exe", "Locate Packed Target", 1)
        If FileName = "<C>" Then Exit Function
        If FileName = "" Then Exit Function
        If InStr(1, FileName, "\") > 0 Then
            LastPath = Left(FileName, Len(FileName) - InStr(1, StrReverse(FileName), "\"))
            SaveSetting "ArmInline", "Settings", "LastPath", LastPath
        End If
    Else
        FileName = ""
    End If
    NLAcquire = True
End Function

Public Sub SaveNanoTable()
    Dim SaveName    As String
    Dim LastPath    As String
    Dim I           As Long

    LastPath = GetSetting("ArmInline", "Settings", "LastDir", App.Path)
    SaveName = OpenDialogBox(frmMain, "Nanomites File (*.nan)" + Chr$(0) + "*.nan", "Save Nanomite Table", 2)
    If SaveName = "<C>" Then Exit Sub
    If SaveName = "" Then Exit Sub
    If InStr(1, SaveName, "\") > 0 Then
        LastPath = Left(SaveName, Len(SaveName) - InStr(1, StrReverse(SaveName), "\"))
        SaveSetting "ArmInline", "Settings", "LastPath", LastPath
    End If
    If Len(SaveName) < 4 Then Exit Sub
    SaveName = Left(SaveName, Len(SaveName) - 1)
    If UCase(Right(SaveName, 4)) <> ".NAN" Then SaveName = SaveName & ".nan"
    Report "Saving Nanomites table..."
    Open SaveName For Output As #2
    Close #2
    Open SaveName For Binary As #2
        Put #2, , NumNanos
        For I = 0 To NumNanos
            Put #2, , Nano(I)
        Next I
    Close #2
    Report "Done."
End Sub

Public Sub LoadNanoTable()
    Dim LoadName    As String
    Dim LastPath    As String
    Dim I           As Long

    LastPath = GetSetting("ArmInline", "Settings", "LastDir", App.Path)
    LoadName = OpenDialogBox(frmMain, "Nanomites File (*.nan)" + Chr$(0) + "*.nan", "Load Nanomite Table", 1)
    If LoadName = "<C>" Then Exit Sub
    If LoadName = "" Then Exit Sub
    If InStr(1, LoadName, "\") > 0 Then
        LastPath = Left(LoadName, Len(LoadName) - InStr(1, StrReverse(LoadName), "\"))
        SaveSetting "ArmInline", "Settings", "LastPath", LastPath
    End If
    LoadName = Left(LoadName, Len(LoadName) - 1)
    Report "Loading Nanomites table..."
    Open LoadName For Binary As #2
        Get #2, , NumNanos
        ReDim Nano(NumNanos)
        For I = 0 To NumNanos
            Get #2, , Nano(I)
        Next I
    Close #2
    PruneNanomites
    Report "Succesfully loaded " & CStr(NumNanos) & " Nanomites."
    
    frmMain.cmdSaveNanomites.Enabled = True
    frmMain.cmdRemoveNanomites.Enabled = True
End Sub

Public Sub AppendWrapper(FixName As String)
    Dim Raw()               As Long
    Dim RawLen              As Long
    Dim OEP                 As Long
    Dim pNanos              As Long
    Dim BaseOfCode          As Long
    Dim SizeOfCode          As Long
    Dim IHeader             As Integer
    Dim NumberOfSections    As Integer
    Dim StartOfHeaders      As Long
    Dim DHeader             As SectionHeader
    Dim SectionAlignment    As Long
    Dim SizeOfImage         As Long
    Dim PointerToRaw        As Long
    Dim FileAlignment       As Long
    Dim ImageBase           As Long

    Open App.Path & "\Rwb32.bin" For Binary As #3
    Close #3
    RawLen = FileLen(App.Path & "\Rwb32.bin")
    If RawLen = 0 Then
        Kill App.Path & "\Rwb32.bin"
        MsgBox "Couldn't find Rwb32.bin.", vbCritical, "Unable to repair target"
        Exit Sub
    Else
        Open App.Path & "\Rwb32.bin" For Binary As #3
            ReDim Raw((RawLen \ 4) + 1)
            Get #3, , Raw
        Close #3
    End If
    Report "Created " & FixName & "."
    
    Open FixName For Binary As #3
        Get #3, &H3D&, IHeader
        Get #3, IHeader + 41, OEP
        Get #3, IHeader + 7, NumberOfSections
        Get #3, IHeader + &H39, SectionAlignment
        Get #3, IHeader + &H51, SizeOfImage
        Get #3, IHeader + &H3D, FileAlignment
        Get #3, IHeader + &H35, ImageBase
        BaseOfCode = Val("&H" & frmMain.txtTargetStart.Text & "&")
        SizeOfCode = Val("&H" & frmMain.txtTargetLength.Text & "&")
        StartOfHeaders = IHeader + &HF9
        
        If BaseOfCode = 0 Or SizeOfCode = 0 Then
            Get #3, StartOfHeaders, DHeader
            If BaseOfCode = 0 Then
                Report "Warning: 'Start Of Target Code' field is empty. Assuming from .text section."
                BaseOfCode = DHeader.VAddress + ImageBase
            End If
            If SizeOfCode = 0 Then
                Report "Warning: 'Length Of Target Code' field is empty. Assuming from .text section."
                SizeOfCode = DHeader.VSize
            End If
        End If
        
        If NumberOfSections >= 15 Then
            Report "Unable to add a section to the dump."
            Report "Try removing some of Armadillo's residual sections."
            Exit Sub
        End If
        Report "Adding new section header..."
        NumberOfSections = NumberOfSections + 1
        Put #3, IHeader + 7, NumberOfSections
        
        PointerToRaw = LOF(3)
        If (PointerToRaw Mod FileAlignment) <> 0 Then
            PointerToRaw = ((PointerToRaw \ FileAlignment) + 1) * FileAlignment
        End If
        
        DHeader.Character = &HE00000E0
        DHeader.Name = ".nano"
        DHeader.VSize = RawLen + (NumNanos * Len(Nano(0)))
        If (DHeader.VSize Mod SectionAlignment) <> 0 Then
            DHeader.VSize = ((DHeader.VSize \ SectionAlignment) + 1) * SectionAlignment
        End If
        DHeader.NumLine = 0
        DHeader.NumReloc = 0
        DHeader.PointerRaw = PointerToRaw
        DHeader.PointLineNo = 0
        DHeader.PointReloc = 0
        DHeader.SizeOfRaw = RawLen + (NumNanos * Len(Nano(0)))
        DHeader.VAddress = SizeOfImage
        Put #3, StartOfHeaders + (Len(DHeader) * (NumberOfSections - 1)), DHeader
        
        SizeOfImage = SizeOfImage + DHeader.VSize
        Put #3, IHeader + &H51, SizeOfImage
        
        pNanos = RawLen
        
        Report "Appending new data..."
        
        Raw(0) = OEP + ImageBase
        Raw(2) = NumNanos
        Raw(3) = pNanos
        Raw(25) = BaseOfCode
        Raw(27) = SizeOfCode
        
        OEP = DHeader.VAddress + &H70&
        Put #3, IHeader + 41, OEP
        
        Report "Ammending PE header..."
        Put #3, DHeader.PointerRaw + 1, Raw
        Put #3, DHeader.PointerRaw + RawLen + 1, Nano
    Close #3
    Report "Done."
End Sub

Public Sub RemoveNanomites()
    Dim DumpFix     As String
    Dim FName       As String
    
    Report ""
    Report "------ Removing Nanomites ------"
    FName = OpenDialogBox(frmMain, "Executable File (*.exe)" & Chr(0) & "*.exe", "Locate dump", 1)
    If FName = "" Or FName = "<C>" Then Exit Sub
    If InStr(1, FName, ".exe") = 0 Then Exit Sub
    DumpFix = Replace(FName, ".exe", " NanoFix.exe")
    FileCopy FName, DumpFix
    AppendWrapper DumpFix
End Sub
