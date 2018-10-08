Attribute VB_Name = "RebaseIAT"
Option Explicit

Private Calls()     As DLLCall
Private Shortlist() As Long
Private Thunks()    As Long
Private NumThunks   As Long
Private NumShort    As Long
Private IATBase     As Long
Private IATLength   As Long
Private NewIATBase  As Long
Private RawIAT()    As Byte
Private Modules()   As Long
Private DLLCount    As Long

Public Sub DoRebaseIAT()
    Report ""
    Report "------- Rebasing IAT -------"
    If Not RebaseIATAcquire Then
        Report "Failed to rebase IAT."
        Exit Sub
    End If
    GetAllDLLCalls
End Sub

Private Sub GetAllDLLCalls()
    Dim I       As Long
    Dim J       As Long
    Dim FarStr  As String
    Dim FarPtr  As Long
    Dim LastUpd As Long
    Dim MNeeded     As Long
    Dim Min         As Long
    Dim Swap        As Long
    Dim CModule     As Long
    Dim CShort      As Long
    Dim ThunkIndex  As Long
    
    NumDLLCalls = 0
    NumShort = 0
    ReDim Calls(100)
    ReDim Modules(256)
    ReDim Shortlist(100)
    
    LastUpd = GetTickCount
    Report "0 DLL calls found..."
    For I = 0 To TLength
        If Target(I) = &HFF Or Target(I) = &H8B Or Target(I) = &H8D Or Target(I) = &HA1 Then
            If Target(I) <> &HA1 Then I = I + 1
            If Target(I) = &H5 Or Target(I) = &H15 Or Target(I) = &H25 Or Target(I) = &H35 Or _
               Target(I) = &HD Or Target(I) = &H1D Or Target(I) = &H2D Or Target(I) = &H3D Or Target(I) = &HA1 Then
                FarStr = "&H" & ZeroPad(Hex(Target(I + 4))) & ZeroPad(Hex(Target(I + 3))) & ZeroPad(Hex(Target(I + 2))) & ZeroPad(Hex(Target(I + 1)))
                FarPtr = Val(FarStr)
                
                If FarPtr >= IATBase And FarPtr < IATBase + IATLength Then
                    NumDLLCalls = NumDLLCalls + 1
                    If NumDLLCalls > UBound(Calls) Then
                        ReDim Preserve Calls(NumDLLCalls + 100)
                    End If
                    Calls(NumDLLCalls).Address = I + TStart - 1
                    FarStr = "&H" & ZeroPad(Hex(RawIAT(FarPtr - IATBase + 3))) & ZeroPad(Hex(RawIAT(FarPtr - IATBase + 2))) & ZeroPad(Hex(RawIAT(FarPtr - IATBase + 1))) & ZeroPad(Hex(RawIAT(FarPtr - IATBase)))
                    FarPtr = Val(FarStr)
                    Calls(NumDLLCalls).Destination = FarPtr
                    I = I + 4
                End If
            End If
            If Target(I) <> &HA1 Then I = I - 1
        End If
        DoEvents
        If GetTickCount - LastUpd > 100 Then
            LastUpd = GetTickCount
            If frmMain.lstConsole.ListCount > 0 Then frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
            Report CStr(NumDLLCalls) & " DLL calls found..."
        End If
    Next I
    frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
    Report CStr(NumDLLCalls) & " DLL calls found total."
    Report "Analysing..."
    
    GenerateShortlist
    
    If NumShort = 0 Then
        MsgBox "No referenced entries within stated IAT bounds."
        Exit Sub
    End If
    ReDim Thunks(0)
    DLLCount = 1
    
    NumBytes = EnumProcessModules(hProcess, Modules(0), 256, MNeeded)
    MNeeded = MNeeded / Len(Modules(0))
    If NumBytes = 0 Then
        Report "Unable to enumerate process modules."
        Exit Sub
    End If
    If MNeeded > 256 Then
        ReDim Modules(MNeeded)
        NumBytes = EnumProcessModules(hProcess, ByVal Modules(0), MNeeded, NumBytes)
        If NumBytes = 0 Then
            Report "Unable to enumerate process modules."
            Exit Sub
        End If
    End If
    Modules(MNeeded) = &H7FFFFFFF
    
    'Insertion Sort
    Min = 0
    For I = 0 To MNeeded - 1
        Min = I
        For J = I To MNeeded - 1
            If Modules(J) < Modules(Min) Then Min = J
        Next J
        Swap = Modules(I)
        Modules(I) = Modules(Min)
        Modules(Min) = Swap
    Next I
    
    DLLCount = 0
    CShort = 1
    CModule = 0
    Swap = 0 'Num imports in current DLL
    ThunkIndex = 0
    Do
        I = 0
        Swap = 0
        If Shortlist(CShort) < Modules(0) Then
            'Invalid IAT entry
            MsgBox "Referenced IAT entry points to an invalid location: " & ZeroPad(Hex(Shortlist(CShort)), 8)
            Exit Sub
        End If
        Do Until Shortlist(CShort) >= Modules(I) And Shortlist(CShort) < Modules(I + 1)
            I = I + 1
        Loop
        Do Until CShort > NumShort
            If Shortlist(CShort) >= Modules(I + 1) Then Exit Do
            Thunks(ThunkIndex) = Shortlist(CShort)
            ThunkIndex = ThunkIndex + 1
            NumThunks = NumThunks + 1
            If NumThunks > UBound(Thunks) Then ReDim Preserve Thunks(UBound(Thunks) + 50)
            CShort = CShort + 1
            Swap = Swap + 1
        Loop
        ThunkIndex = ThunkIndex + 1
        NumThunks = NumThunks + 1
        If NumThunks > UBound(Thunks) Then ReDim Preserve Thunks(UBound(Thunks) + 50)
        DLLCount = DLLCount + 1
    Loop Until CShort > NumShort
    
    Report CStr(NumShort) & " API functions referenced from " & CStr(DLLCount) & " DLLs."
    Report "Redirecting DLL references:"
    
    If Not Redirect Then Exit Sub
    
    Report "Patching process..."
    NumBytes = VirtualProtectEx(hProcess, ByVal NewIATBase, NumThunks * 4, &H40&, OldProtect)
    If NumBytes = 0 Then
        Report "Unable to VirtualProtect address space for new IAT."
        Exit Sub
    End If
    RPMRet = WriteProcessMemory(hProcess, ByVal NewIATBase, Thunks(0), NumThunks * 4, NumBytes)
    If NumBytes <> NumThunks * 4 Or RPMRet = 0 Then
        Report "Unable to write new IAT."
        Exit Sub
    End If
    NumBytes = VirtualProtectEx(hProcess, ByVal NewIATBase, NumThunks * 4, OldProtect, I)
    
    NumBytes = VirtualProtectEx(hProcess, ByVal TStart, TLength, &H40&, OldProtect)
    If NumBytes = 0 Then
        Report "Unable to VirtualProtect target code memory."
        Exit Sub
    End If
    RPMRet = WriteProcessMemory(hProcess, ByVal TStart, Target(0), TLength, NumBytes)
    If NumBytes <> TLength Or RPMRet = 0 Then
        Report "Unable to save patched DLL calls."
        Exit Sub
    End If
    NumBytes = VirtualProtectEx(hProcess, ByVal TStart, TLength, OldProtect, I)
    
    Report "Process succesfully patched."
End Sub

Private Function Redirect() As Boolean
    Dim I       As Long
    Dim J       As Long
    Dim Dest    As Long
    Dim Add     As Long
    Dim LastUpdate  As Long

    LastUpdate = GetTickCount
    Report "0 calls redirected..."
    For I = 1 To NumDLLCalls
        Dest = Calls(I).Destination
        Add = Calls(I).Address
        For J = 0 To NumThunks
            If Calls(I).Destination = Thunks(J) Then Exit For
        Next J
        If J > NumThunks Then
            Report "Unable to resolve DLL call at " & ZeroPad(Hex(Add), 8) & "."
            Exit Function
        End If
        Dest = J * 4 + NewIATBase
        Target(Add - TStart + 5) = (Dest And &HFF000000) \ &H1000000
        Target(Add - TStart + 4) = (Dest And &HFF0000) \ &H10000
        Target(Add - TStart + 3) = (Dest And &HFF00&) \ &H100&
        Target(Add - TStart + 2) = (Dest And &HFF&)
        DoEvents
        If GetTickCount - LastUpdate > 100 Then
            frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
            Report CStr(I) & " calls redirected..."
            LastUpdate = GetTickCount
        End If
    Next I
    
    frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
    Report CStr(I - 1) & " calls redirected total."
    Redirect = True
End Function

Private Sub GenerateShortlist()
    Dim I   As Long
    Dim J   As Long
    Dim Present As Boolean
    Dim Min     As Long
    Dim Swap    As Long
    
    For I = 1 To NumDLLCalls
        Present = False
        For J = 1 To NumShort
            If Calls(I).Destination = Shortlist(J) Then
                Present = True
                Exit For
            End If
        Next J
        If Not Present Then
            NumShort = NumShort + 1
            If NumShort > UBound(Shortlist) Then ReDim Preserve Shortlist(UBound(Shortlist) + 100)
            Shortlist(NumShort) = Calls(I).Destination
        End If
    Next I
    
    'Insertion Sort
    For I = 1 To NumShort
        Min = I
        For J = I To NumShort
            If Shortlist(J) < Shortlist(Min) Then Min = J
        Next J
        Swap = Shortlist(I)
        Shortlist(I) = Shortlist(Min)
        Shortlist(Min) = Swap
    Next I
End Sub

Private Function RebaseIATAcquire() As Boolean
    TStart = Val("&H" & frmMain.txtTargetStart.Text & "&")
    TLength = Val("&H" & frmMain.txtTargetLength.Text & "&")
    IATBase = Val("&H" & frmMain.txtIATStart & "&")
    IATLength = Val("&H" & frmMain.txtIATLength & "&")
    NewIATBase = Val("&H" & frmMain.txtIATRebase & "&")
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
        Report "Start address must be positive."
        Exit Function
    End If
    If IATBase <= 0 Then
        Report "IAT start address must be positive."
        Exit Function
    End If
    If IATLength <= 0 Or (IATLength Mod 4) <> 0 Then
        Report "IAT length must be a positive multiple of 4."
        Exit Function
    End If
    If NewIATBase <= 0 Then
        Report "New IAT base address must be positive."
        Exit Function
    End If
    
    ReDim Target(TLength)
    ReDim RawIAT(IATLength)
    
    RPMRet = ReadProcessMemory(hProcess, ByVal TStart, Target(0), TLength, NumBytes)
    If RPMRet = 0 Or NumBytes = 0 Then
        Report "Unable to read target code memory."
        Exit Function
    End If
    RPMRet = ReadProcessMemory(hProcess, ByVal IATBase, RawIAT(0), IATLength, NumBytes)
    If RPMRet = 0 Or NumBytes = 0 Then
        Report "Unable to read IAT memory."
        Exit Function
    End If
    Report "Process memory buffered successfully."
    RebaseIATAcquire = True
End Function
