Attribute VB_Name = "ProcessViewer"
Option Explicit

Public Type TModule
    Base        As Long
    Name        As String
    FileName    As String
End Type

Public Type TProcess
    PID         As Long
    Name        As String
    FileName    As String
    NumModules  As Long
    Modules()   As TModule
End Type

Public NumProcesses     As Long
Public PIDs()           As Long
Public Processes()      As TProcess

Public Sub QuickSort(Arr() As Long, Optional NumEls As Long = -1, Optional Descending As Boolean = False)
    Dim Value As Long, Temp As Long
    Dim SP As Integer
    Dim LeftStk(32) As Long, RightStk(32) As Long
    Dim LeftNdx As Long, RightNdx As Long
    Dim I As Long, J As Long

    ' Account for optional arguments
    If NumEls = -1 Then NumEls = UBound(Arr)
    ' Initialise Pointers
    LeftNdx = LBound(Arr)
    RightNdx = NumEls
    ' Initialise Stack
    SP = 1
    LeftStk(SP) = LeftNdx
    RightStk(SP) = RightNdx

    Do
        If RightNdx > LeftNdx Then
            Value = Arr(RightNdx)
            I = LeftNdx - 1
            J = RightNdx
            ' Find the pivot item
            If Descending Then
                Do
                    Do: I = I + 1: Loop Until Arr(I) <= Value
                    Do: J = J - 1: Loop Until J = LeftNdx Or Arr(J) >= Value
                    Temp = Arr(I)
                    Arr(I) = Arr(J)
                    Arr(J) = Temp
                Loop Until J <= I
            Else
                Do
                    Do: I = I + 1: Loop Until Arr(I) >= Value
                    Do: J = J - 1: Loop Until J = LeftNdx Or Arr(J) <= Value
                    Temp = Arr(I)
                    Arr(I) = Arr(J)
                    Arr(J) = Temp
                Loop Until J <= I
            End If
            ' Swap found items
            Temp = Arr(J)
            Arr(J) = Arr(I)
            Arr(I) = Arr(RightNdx)
            Arr(RightNdx) = Temp
            ' Push on the stack the pair of pointers that differ most
            SP = SP + 1
            If (I - LeftNdx) > (RightNdx - I) Then
                LeftStk(SP) = LeftNdx
                RightStk(SP) = I - 1
                LeftNdx = I + 1
            Else
                LeftStk(SP) = I + 1
                RightStk(SP) = RightNdx
                RightNdx = I - 1
            End If
        Else
            ' Pop a new pair of pointers off the stacks
            LeftNdx = LeftStk(SP)
            RightNdx = RightStk(SP)
            SP = SP - 1
            If SP = 0 Then Exit Do
        End If
    Loop
End Sub

Public Sub SelectModule(P As Long, M As Long)
    Dim Handle          As Long
    Dim HeaderOffset    As Long
    Dim Size            As Long ' DWORD from PE header
    Dim TSBase          As Long ' Target code section base address
    Dim TSLength        As Long ' Target code section length
    Dim MI              As MEMORY_BASIC_INFORMATION
    Dim Cands           As Long ' Number of candidates
    Dim Cand()          As Long ' Holds candidates for CS sections or IAT entries
    Dim Sample()        As Byte ' Buffer for remote code/data
    Dim Hits            As Long ' Number of JMPs to code section in Code Splicing section candidate
    Dim TPtr            As Long
    Dim FarStr          As String
    Dim DFPtr           As Double
    Dim ABase           As Long     '
    Dim AProtect        As Long     '
    Dim MProtect        As Long     ' Used to compare VirtualQuery properties
    Dim MState          As Long     '
    Dim Mean            As Double   '
    Dim IATS            As Long ' IAT Start
    Dim IATE            As Long ' IAT End
    Dim SBase           As Long ' Start of data sample containing IAT
    Dim SEnd            As Long ' End of "
    Dim PrevNull        As Boolean ' Previous IAT entry was null
    Dim Entry           As Double ' Representing a DWORD IAT entry
    Dim SampleSize      As Long ' How big a sample to take from code
    Dim MinDLL          As Long
    Dim Retry           As Boolean
    Dim IATFound        As Boolean
    Dim CSFound         As Boolean
    Dim IATSize         As Long
    Dim I               As Long
    Dim J               As Long
    
    frmMain.txtPID = Hex(Processes(P).PID)
    frmMain.txtTargetStart = Hex(Processes(P).Modules(M).Base + &H1000&)
    frmMain.txtTargetLength = ""
    Handle = OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_VM_READ, 0, Processes(P).PID)
    If Handle = 0 Then
        Report "Failed."
        Exit Sub
    End If
    If ReadProcessMemory(Handle, ByVal (Processes(P).Modules(M).Base + &H3C&), HeaderOffset, 4, NumBytes) > 0 Then
        ' Get .text section
        If ReadProcessMemory(Handle, ByVal (Processes(P).Modules(M).Base + HeaderOffset + &H100), Size, 4, NumBytes) > 0 Then
            frmMain.txtTargetLength = Hex(RoundUp(Size, &H1000&))
            TSBase = Processes(P).Modules(M).Base + &H1000&
            TSLength = Size
        End If
        ' Get .text1 section
        If ReadProcessMemory(Handle, ByVal (Processes(P).Modules(M).Base + HeaderOffset + &H17C), Size, 4, NumBytes) > 0 Then
            frmMain.txtIATRebase = Hex(RoundUp(Size + Processes(P).Modules(M).Base, &H1000&))
        End If
    End If
    
    ' Estimate specifics:
    
    'Code Splicing
    If frmMain.mnuACS.Checked Then
        Report "Searching for Code Splicing..."
        Cands = 0
        ReDim Cand(10)
        I = Processes(P).Modules(0).Base
        ' Scan for pages satisfying CS criteria
        Do While I < &HFFF0000
            If VirtualQueryEx(Handle, ByVal I, MI, Len(MI)) <> 0 Then
                If MI.State <> &H10000 Then 'Not Free
                    If MI.lType = &H20000 Then 'Private
                        If MI.Protect = &H20 Then 'Read_Execute
                            If (MI.AllocationBase Mod &H10000) = 0 Then
                                If Cands > UBound(Cand) Then
                                    ReDim Preserve Cand(Cands + 10)
                                End If
                                Cand(Cands) = MI.AllocationBase
                                Cands = Cands + 1
                            End If
                        End If
                    End If
                End If
                ' Skip over rest of block
                If I < MI.BaseAddress + MI.RegionSize - &H1000 Then
                    I = MI.BaseAddress + MI.RegionSize - &H1000
                End If
            End If
            I = I + &H1000&
            DoEvents
        Loop
        Cands = Cands - 1
        If Cands = -1 Then
            Report "Target appears to be free of Code Splicing."
        Else
            Report "Done (" & CStr(Cands + 1) & " potential pages found). Scanning..."
        End If
        
        frmMain.txtSpliceStart.Text = ""
        frmMain.txtSpliceLength.Text = ""
        DoEvents
        ' Check candidates for JMPs to .text section
        For I = Cands To 0 Step -1
            Hits = 0
            ReDim Sample(&H1000&)
            If ReadProcessMemory(Handle, ByVal Cand(I), Sample(0), &H1000&, NumBytes) > 0 Then
                Do While TPtr < &HFF0
                    If Sample(TPtr) = &HE9& Then
                        FarStr = "&H" & ZeroPad(Hex(Sample(TPtr + 4))) & ZeroPad(Hex(Sample(TPtr + 3))) & ZeroPad(Hex(Sample(TPtr + 2))) & ZeroPad(Hex(Sample(TPtr + 1)))
                        DFPtr = CDbl(Cand(I) + TPtr + 5) + CDbl(Val(FarStr))
                        If DFPtr >= CDbl(TSBase) And DFPtr < CDbl(TSBase + TSLength) Then
                            Hits = Hits + 1
                            If Hits > 50 Then
                                'Page found
                                VirtualQueryEx Handle, ByVal Cand(I), MI, Len(MI)
                                frmMain.txtSpliceStart.Text = Hex(Cand(I))
                                frmMain.txtSpliceLength = Hex(MI.RegionSize)
                                CSFound = True
                            End If
                        End If
                    End If
                    TPtr = TPtr + 1
                    DoEvents
                Loop
            End If
        Next I
        If Cands > -1 Then
            If CSFound Then
                Report "Code Splicing section located."
            Else
                Report "No Code Splicing present."
            End If
        End If
    End If
    
    ' IAT Rebasing
    If frmMain.mnuAIAT.Checked Then
        Report "Locating IAT..."
        
        'Find memory bound
        MinDLL = &H7FFFFFFF
        If Processes(P).NumModules = 0 Then Exit Sub
        For I = 1 To Processes(P).NumModules - 1
            If Processes(P).Modules(I).Base < MinDLL Then MinDLL = Processes(P).Modules(I).Base
            DoEvents
        Next I
        'Allow for stolens
        MinDLL = &H100000
        
        ' Find sample [in the middle] of the .text section
        'TPtr = TSLength / 4
        'If (TPtr Mod &H1000&) > 0 Then
        '    TPtr = (TPtr \ &H1000&) * &H1000&
        'End If
        'If TPtr >= TSLength - SampleSize Then TPtr = 0
        'TPtr = TPtr + TSBase
            
        Retry = False
DoRetry:
        If Retry Then
            ' Grab entire code section
            TPtr = TSBase
            SampleSize = TSLength
        Else
            'Grab last SampleSize
            SampleSize = &H4000&
            TPtr = TSBase + TSLength - SampleSize
        End If
        
        ReDim Sample(SampleSize)
        ReDim Cand(250)
        If ReadProcessMemory(Handle, ByVal TPtr, Sample(0), SampleSize, NumBytes) > 0 Then
            TPtr = 0
            Cands = 0
            ' Search for CALL DWORD PTR
            Do While TPtr < (SampleSize - 10)
                If Sample(TPtr) = &HFF& Then
                    If Sample(TPtr + 1) = &H15& Or Sample(TPtr + 1) = &H25& Then
                        If Cands > UBound(Cand) Then
                            ReDim Preserve Cand(UBound(Cand) + 250)
                        End If
                        TPtr = TPtr + 1
                        FarStr = "&H" & ZeroPad(Hex(Sample(TPtr + 4))) & ZeroPad(Hex(Sample(TPtr + 3))) & ZeroPad(Hex(Sample(TPtr + 2))) & ZeroPad(Hex(Sample(TPtr + 1)))
                        Cand(Cands) = Val(FarStr)
                        Cands = Cands + 1
                    End If
                End If
                TPtr = TPtr + 1
                DoEvents
            Loop
            Cands = Cands - 1
            If Cands < 0 And Not Retry Then
                Report "Quick analysis failed. Using brute-force mode..."
                Retry = True
                GoTo DoRetry
            End If
            If Cands >= 0 Then
                Report "Success. Determining IAT hive..."
                Mean = 0
                ' Calculate mean JMP destination
                For I = 0 To Cands
                    Mean = Mean + Cand(I)
                Next I
                Mean = Mean / (Cands + 1)
                TPtr = CLng(Mean)
                
                ' Find index closest to mean
                'J = 0
                'For I = 1 To Cands
                '    If Abs(CSng(Cand(I)) - TPtr) < Abs(CSng(Cand(J)) - TPtr) Then J = I
                'Next I
                'TPtr = Cand(J)
                
                'Use median
                QuickSort Cand, Cands
                TPtr = Cand(Cands \ 2)
                
                If VirtualQueryEx(Handle, ByVal TPtr, MI, Len(MI)) > 0 Then
                    ' Take sample containing IAT (max size 0x10000)
                    SBase = TPtr - &H5000&
                    If SBase < MI.AllocationBase Then SBase = MI.AllocationBase
                    If SBase < MI.BaseAddress Then SBase = MI.BaseAddress
                    SEnd = SBase + &H10000
                    If SEnd > MI.RegionSize Then SEnd = MI.RegionSize
                    ReDim Sample(SEnd)
                    
                    If ReadProcessMemory(Handle, ByVal SBase, Sample(0), SEnd, NumBytes) > 0 Then
                        TPtr = TPtr - SBase
                        IATE = TPtr + 4
                        IATS = TPtr - 4
                        
                        'Find Start
                        PrevNull = False
                        Do Until IATS <= 0
                            Entry = Sample(IATS + 3)
                            Entry = Entry * &H1000000 + Sample(IATS + 2) * &H10000 + Sample(IATS + 1) * &H100& + Sample(IATS)
                            If Entry = 0 Then
                                If PrevNull Then
                                    'Found Start
                                    IATS = IATS + 8
                                    Exit Do
                                End If
                                'Is Null
                                PrevNull = True
                            Else
                                'Isn't Null
                                PrevNull = False
                                If Entry < MinDLL Or Entry > CDbl(&H7FFFFFFF) Then
                                    'Not DLL Function
                                    IATS = IATS + 4
                                    Exit Do
                                End If
                            End If
                            IATS = IATS - 4
                            DoEvents
                        Loop
                        If IATS <= 0 Then IATS = 0
                        IATS = IATS + SBase
                        frmMain.txtIATStart.Text = Hex(IATS)
                        DoEvents
                        
                        'Find End
                        PrevNull = False
                        Do Until IATE >= SEnd - 3
                            Entry = Sample(IATE + 3)
                            Entry = Entry * &H1000000 + Sample(IATE) * &H10000 + Sample(IATE + 1) * &H100& + Sample(IATE + 2)
                            If Entry = 0 Then
                                If PrevNull Then
                                    'Found End
                                    Exit Do
                                End If
                                'Is Null
                                PrevNull = True
                            Else
                                'Isn't Null
                                PrevNull = False
                                If Sample(IATE + 3) = &H90& Then
                                    If Sample(IATE + 2) = &H90& And Sample(IATE + 1) = &H90& And Sample(IATE) = &H90& Then
                                        'NOPs mark the end of system DLLs
                                        Exit Do
                                    End If
                                End If
                                If Entry < MinDLL Or Entry > CDbl(&H7FFFFFFF) Then
                                    'Not DLL Function
                                    Exit Do
                                End If
                            End If
                            IATE = IATE + 4
                            DoEvents
                        Loop
                        If IATE > SEnd Then IATE = SEnd
                        IATSize = IATE - IATS + SBase
                        frmMain.txtIATLength = Hex(IATSize)
                        IATFound = True
                        DoEvents
                    End If
                End If
            End If
        End If
        If IATFound Then
            If IATSize <= 16 Then
                Report "IAT size is supiciously small. It may be fragmented."
            Else
                Report "A possible IAT has been located."
            End If
        Else
            Report "No likely IAT could be located. The .text or .data section may be encrypted."
        End If
    End If
End Sub

Public Sub ListModules(Index As Long)
    Dim TName   As String
    Dim I       As Long
    
    If Index = 0 Then
        frmMain.lstModules.Clear
        frmMain.txtPID.Text = ""
        frmMain.txtTargetStart.Text = ""
        frmMain.txtTargetLength.Text = ""
        frmMain.txtIATStart.Text = ""
        frmMain.txtIATLength.Text = ""
        frmMain.txtIATRebase.Text = ""
        Exit Sub
    End If
    DoEvents
    frmMain.lstModules.Clear
    For I = 0 To Processes(Index).NumModules - 1
        TName = Processes(Index).Modules(I).Name
        If TName = UCase(TName) Then
            TName = LCase(TName)
        Else
            If UCase(Right(TName, 4)) = ".EXE" Then
                TName = Left(TName, Len(TName) - 4) & ".exe"
            Else
                If UCase(Right(TName, 4)) = ".DLL" Then
                    TName = Left(TName, Len(TName) - 4) & ".dll"
                End If
            End If
        End If
        frmMain.lstModules.AddItem TName
    Next I
    frmMain.lstModules.Selected(0) = True
End Sub

Public Function RefreshProcesses() As Boolean
    Dim MaxFNLen    As Long
    Dim Needed      As Long
    Dim Handle      As Long
    Dim NumModules  As Long
    Dim SlashPoint  As Long
    Dim FName       As String
    Dim MName       As String
    Dim TName       As String
    Dim MHs()       As Long
    Dim Index       As Long
    Dim I           As Long
    Dim J           As Long
    
    frmMain.txtPID.Text = ""
    frmMain.txtTargetStart.Text = ""
    frmMain.txtTargetLength.Text = ""
    frmMain.lstProcesses.Clear
    frmMain.lstModules.Clear
    frmMain.lstProcesses.AddItem "Refreshing..."
    DoEvents
    NumProcesses = 32
    MaxFNLen = 1024
    Do
        NumProcesses = NumProcesses * 2
        ReDim PIDs(NumProcesses)
        If EnumProcesses(PIDs(0), 4 * UBound(PIDs), Needed) = 0 Then
            Report "Unable to list processes."
            Return
        End If
    Loop While Needed >= NumProcesses * 4
    NumProcesses = Needed \ 4
    
    ReDim Processes(NumProcesses - 1)
    For I = 2 To NumProcesses - 1
        Handle = OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_VM_READ, 0, PIDs(I))
        If Handle > 0 Then
            With Processes(I)
                NumModules = 1
                Do
                    NumModules = NumModules * 2
                    ReDim MHs(NumModules)
                    If EnumProcessModules(Handle, MHs(0), 4 * UBound(MHs), Needed) = 0 Then
                        Report "Unable to list process modules (" & Hex(PIDs(I)) & ")."
                        Needed = 0
                        Exit Do
                    End If
                Loop While Needed >= NumModules * 4
                NumModules = Needed \ 4
                
                .NumModules = NumModules
                ReDim .Modules(NumModules)
            End With
            For J = 0 To NumModules
                DoEvents
                With Processes(I).Modules(J)
                    .Base = MHs(J)
                    MName = String(MaxFNLen, 0)
                    If GetModuleFileNameExA(Handle, MHs(J), MName, MaxFNLen) = 0 Then
                        .Name = "[Couldn't open module]"
                        .FileName = ""
                    Else
                        .FileName = Replace((MName), Chr(0), "")
                        SlashPoint = InStr(1, StrReverse(.FileName), "\")
                        If SlashPoint > 0 Then
                            .Name = Right(.FileName, SlashPoint - 1)
                        Else
                            .Name = .FileName
                        End If
                    End If
                End With
            Next J
            Processes(I).Name = Processes(I).Modules(0).Name
            Processes(I).FileName = Processes(I).Modules(0).FileName
            Processes(I).PID = PIDs(I)
        Else
            ReDim Processes(I).Modules(0)
            Processes(I).NumModules = 0
            Processes(I).Modules(0).Base = 0
            Processes(I).Modules(0).Name = ""
            Processes(I).Modules(0).FileName = ""
            Processes(I).Name = "[Couldn't open process]"
            Processes(I).PID = PIDs(I)
            Processes(I).FileName = ""
        End If
        CloseHandle Handle
    Next I
    
    frmMain.lstProcesses.Clear
    DoEvents
    Index = 0
    For I = NumProcesses - 1 To 0 Step -1
        If Processes(I).NumModules > 0 Then
            TName = Processes(I).Name
            If TName = UCase(TName) Then
                TName = LCase(TName)
            Else
                If UCase(Right(TName, 4)) = ".EXE" Then
                    TName = Left(TName, Len(TName) - 4) & ".exe"
                Else
                    If UCase(Right(TName, 4)) = ".DLL" Then
                        TName = Left(TName, Len(TName) - 4) & ".dll"
                    End If
                End If
            End If
            TName = TName & " (" & Hex(Processes(I).PID) & ")"
            frmMain.lstProcesses.AddItem TName
            frmMain.lstProcesses.ItemData(Index) = I
            Index = Index + 1
        End If
    Next I
    frmMain.lstProcesses.AddItem "[System]"
    frmMain.lstProcesses.ItemData(Index) = 0
    
    DoEvents
    frmMain.lstProcesses.Selected(0) = True
    frmMain.lstProcesses.SetFocus
End Function
