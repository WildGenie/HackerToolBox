Attribute VB_Name = "CodeSplicing"
Option Explicit

Private FuckedUp    As Boolean
Public ValidUndo    As Boolean

Dim NonContig       As Boolean

Public Sub DoCodeSplicing()
    Dim TPtr        As Long
    Dim FarPtr      As Long
    Dim DFPtr       As Double
    Dim FarStr      As String
    Dim I           As Long
    Dim OldProtect  As Long
    Dim NewProtect  As Long
    Dim RetVal      As Long
    Dim LastUpdate  As Long
    
    'DebugMode = True
    'DBDespliceTextSample ("D:\Temp\Sample.txt")
    'Stop
    
    Report ""
    Report "------- Code Splicing -------"
    ValidUndo = False
    If Not CSAcquire Then
        Report "Failed to fix code."
        Exit Sub
    End If
    Report "Fixing spliced segments..."
    
    FuckedUp = False
    NonContig = False
    TPtr = 0
    NumSegments = 0
    LastUpdate = GetTickCount
    Do Until TPtr >= TLength
        If Target(TPtr) = &HE9 Then 'JMP to splice
            FarStr = "&H" & ZeroPad(Hex(Target(TPtr + 4))) & ZeroPad(Hex(Target(TPtr + 3))) & ZeroPad(Hex(Target(TPtr + 2))) & ZeroPad(Hex(Target(TPtr + 1)))
            DFPtr = CDbl(TStart + TPtr + 5) + CDbl(Val(FarStr))
            If DFPtr >= CDbl(SStart) And DFPtr < CDbl(SStart + SLength) Then
                FarPtr = (TStart + TPtr + 5) + Val(FarStr)
                FixSplice TPtr + TStart, FarPtr
                NumSegments = NumSegments + 1
            End If
        End If
        TPtr = TPtr + 1
        DoEvents
        If GetTickCount - LastUpdate > 100 Then
            LastUpdate = GetTickCount
            frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
            Report CStr(NumSegments) & " splices repaired..."
        End If
    Loop
    
    If NumSegments = 0 Then
        Report "No splices found."
        Exit Sub
    End If
    frmMain.lstConsole.RemoveItem (frmMain.lstConsole.ListCount - 1)
    Report CStr(NumSegments) & " splices repaired."
    Report "Splice repairing complete. Patching process..."
    
    NewProtect = PAGE_EXECUTE_READWRITE
    RetVal = VirtualProtectEx(hProcess, ByVal TStart, TLength, PAGE_EXECUTE_READWRITE, OldProtect)
    If RetVal = 0 Then
        Report "Unable to VirtualProtectEx target memory."
        Exit Sub
    End If
    RetVal = WriteProcessMemory(hProcess, ByVal TStart, Target(0), TLength, NumBytes)
    If RetVal = 0 Then
        Report "Unable to write target memory."
        Exit Sub
    End If
    RetVal = VirtualProtectEx(hProcess, ByVal TStart, TLength, OldProtect, NewProtect)
    If RetVal = 0 Then
        Report "Recoverable error: Unable to reprotect process memory."
        Exit Sub
    End If
    If FuckedUp Then
        Report "Patch completed with some errors. Code section is probably invalid."
        Report "It is recommended that you 'Undo', check your parameters and try again."
    Else
        Report "Patch succesful."
    End If
    
    frmMain.lstProcesses.Enabled = True
    frmMain.lstModules.Enabled = True
End Sub

Private Sub FixSplice(Address As Long, Redirect As Long)
    Dim AltRoute()  As Byte
    Dim RouteLength As Long
    Dim RPtr        As Long
    Dim FarPtr      As Long
    Dim FarStr      As String
    Dim Opcodes     As String
    Dim Instrs()    As Instruction
    Dim NumInstr    As Long
    Dim I           As Long
    Dim J           As Long
    Dim Asm(256)    As Byte
    Dim LenAsm      As Long
    Dim DPtr        As Double
    
    Opcodes = String(128, 0)
    RPtr = Redirect - SStart
    NumInstr = 0
    Do
        Do Until (Spliced(RPtr) = &HE9 Or Spliced(RPtr) = &HC3)
            RPtr = RPtr + 1
            If RPtr > UBound(Spliced) - 4 Then
                Report "Failed to find end of splice at 0x" & Hex(Address) & "."
                NumSegments = NumSegments - 1
                FuckedUp = True
                Exit Sub
            End If
        Loop
        FarStr = "&H" & ZeroPad(Hex(Spliced(RPtr + 4))) & ZeroPad(Hex(Spliced(RPtr + 3))) & ZeroPad(Hex(Spliced(RPtr + 2))) & ZeroPad(Hex(Spliced(RPtr + 1)))
        DPtr = CDbl(SStart + RPtr + 5)
        DPtr = DPtr + CDbl(Val(FarStr))
        If Abs(DPtr - Address - 5) < 1 Then
            FarPtr = SStart + RPtr + 5 + Val(FarStr)
            RouteLength = RPtr - Redirect + SStart
            Exit Do
        End If
        RPtr = RPtr + 1
    Loop
    ReDim Instrs(RouteLength)
    RPtr = Redirect - SStart
    Do
        NumBytes = Disassemble(Spliced(RPtr), Redirect, ByVal Opcodes, DAStruct, 0)
        Instrs(NumInstr).Opcode = Left(Opcodes, NumBytes)
        Instrs(NumInstr).Length = DAStruct.Instruction_Length
        
        For I = 0 To DAStruct.Instruction_Length - 1
            Instrs(NumInstr).Bytes(I) = Spliced(RPtr + I)
        Next I
        
        RPtr = RPtr + DAStruct.Instruction_Length
        NumInstr = NumInstr + 1
        If NumInstr > UBound(Instrs) Then
            ReDim Preserve Instrs(NumInstr + 10)
        End If
    Loop Until RPtr >= Redirect + RouteLength - SStart
    NumInstr = NumInstr - 1
    
    For I = 0 To NumInstr
        Instrs(I).Active = True
    Next I
    DoRC Instrs(), 0, NumInstr
    
    'Experimental:
RedoWithoutEdis:
    Dim K As Long
    For I = 0 To NumInstr
        If Not Instrs(I).Active Then
            J = I  'First
            Exit For
        End If
    Next I
    For I = NumInstr To 0 Step -1
        If Not Instrs(I).Active Then
            K = I  'Last
            Exit For
        End If
    Next I
    If J <> K Then
        For I = J To K
            If Instrs(I).Active Then
                If Instrs(J).Opcode = "MOV EDI,EDI" Then
                    Instrs(J).Active = True
                    Report "Potential residue after 0x" & Hex(Address) & " (be prepared to fix manually)."
                    GoTo RedoWithoutEdis
                ElseIf Instrs(K).Opcode = "MOV EDI,EDI" Then
                    Instrs(K).Active = True
                    Report "Potential residue after 0x" & Hex(Address) & " (be prepared to fix manually)."
                    GoTo RedoWithoutEdis
                Else
                        Report "Non-contiguous code at 0x" & Hex(Address) & " (fix this manually)."
                        If Not NonContig Then
                            MsgBox "Non-contiguous code generated.", vbCritical
                            NonContig = True
                        End If
                        Exit Sub
                End If
            End If
        Next I
    End If
    
    'Compile new code
    ValidUndo = True
    LenAsm = 0
    For I = 0 To NumInstr
        If Instrs(I).Active Then
            For J = 0 To Instrs(I).Length
                Asm(LenAsm + J) = Instrs(I).Bytes(J)
            Next J
            LenAsm = LenAsm + Instrs(I).Length
        End If
    Next I
    
    'Insert into buffer
    If TLength < Address + LenAsm - TStart - 1 Then
        TLength = Address + LenAsm - TStart - 1
        ReDim Target(TLength)
    End If
    
    For I = 0 To LenAsm - 1
        Target(Address + I - TStart) = Asm(I)
    Next I
End Sub

Private Sub DoRC(Ins() As Instruction, StartI As Long, EndI As Long)
    Dim I           As Long
    Dim J           As Long
    Dim K           As Long
    Dim JType       As String
    Dim JLen        As Integer
    Dim Independent As Boolean
    Dim R1          As String
    Dim R2          As String
    Dim StackCount  As Integer
    Dim Comma       As Integer
        
    'Remove all redundant single commands
    For I = EndI To StartI Step -1
        
        'If Left(Ins(I).Opcode, 3) = "JMP" Then Stop
        
        If Left(Ins(I).Opcode, 1) = "J" Then
            Ins(I).Active = False
        ElseIf Left(Ins(I).Opcode, 4) = "XCHG" Then
            Comma = InStr(1, Ins(I).Opcode, ",") - 1
            R1 = Mid(Ins(I).Opcode, 6, (Comma - 5))
            R2 = Mid(Ins(I).Opcode, Comma + 2, (Comma - 5))
            If R1 = R2 Then
                Ins(I).Active = False
            End If
        ElseIf Left(Ins(I).Opcode, 3) = "MOV" Then
            Comma = InStr(1, Ins(I).Opcode, ",") - 1
            
            'If InStr(1, Ins(I).Opcode, "[") > 0 Then
            '    R1 = Mid(Ins(I).Opcode, InStr(1, Ins(I).Opcode, "[") + 1, InStr(1, Ins(I).Opcode, "]") - InStr(1, Ins(I).Opcode, "[") - 1)
            '    Independent = True
            '    If InStr(1, R1, "EAX") > 0 Then Independent = False
            '    If InStr(1, R1, "EBX") > 0 Then Independent = False
            '    If InStr(1, R1, "ECX") > 0 Then Independent = False
            '    If InStr(1, R1, "EDX") > 0 Then Independent = False
            '    If InStr(1, R1, "EBP") > 0 Then Independent = False
            '    If InStr(1, R1, "ESP") > 0 Then Independent = False
            '    If InStr(1, R1, "EDI") > 0 Then Independent = False
            '    If InStr(1, R1, "ESI") > 0 Then Independent = False
            '    If InStr(1, Ins(I).Opcode, "FS:[0h]") > 0 Then Independent = False
            '    If Independent Then Stop
            'End If
            
            R1 = Mid(Ins(I).Opcode, 5, (Comma - 4))
            R2 = Mid(Ins(I).Opcode, Comma + 2, (Comma - 4))
            If R1 = R2 Then
                Ins(I).Active = False
            End If
        ElseIf Left(Ins(I).Opcode, 3) = "NOP" Then Ins(I).Active = False
        End If
    Next I
    
    'Remove paired redundant commands recursively
    For I = StartI To EndI
        If Ins(I).Active Then
            'Must be NOT, PUSH, XCHG, or BSWAP
            For J = I + 1 To EndI
                If AreInverse(Ins(I).Opcode, Ins(J).Opcode) Then
                    Independent = True
                    If J > I + 1 Then
                        DoRC Ins(), I + 1, J
                        
                        
                        If Left(Ins(I).Opcode, 3) = "NOT" Or Left(Ins(I).Opcode, 5) = "BSWAP" Then
                            R1 = Right(Ins(I).Opcode, Len(Ins(I).Opcode) - InStr(1, Ins(I).Opcode, " "))
                            For K = I + 1 To J - 1
                                If Ins(K).Active Then
                                    If Dependent(Ins(K).Opcode, R1) Then
                                        Independent = False
                                        Exit For
                                    End If
                                End If
                            Next K
                        ElseIf Left(Ins(I).Opcode, 4) = "PUSH" Then
                            StackCount = 0
                            R1 = Right(Ins(I).Opcode, Len(Ins(I).Opcode) - 5)
                            For K = I + 1 To J - 1
                                If Ins(K).Active Then
                                    If Left(Ins(K).Opcode, 4) = "PUSH" Then
                                        StackCount = StackCount + 1
                                    ElseIf Left(Ins(K).Opcode, 3) = "POP" Then
                                        StackCount = StackCount - 1
                                    End If
                                End If
                                If Ins(K).Active Then
                                    If Dependent(Ins(K).Opcode, R1) Then
                                        Independent = False
                                        Exit For
                                    End If
                                End If
                            Next K
                            If StackCount <> 0 Then Independent = False
                        ElseIf Left(Ins(I).Opcode, 4) = "XCHG" Then
                            Comma = InStr(1, Ins(I).Opcode, ",") - 1
                            R1 = Mid(Ins(I).Opcode, 6, (Comma - 5))
                            R2 = Mid(Ins(I).Opcode, Comma + 2, (Comma - 5))
                            For K = I + 1 To J - 1
                                If Ins(K).Active Then
                                    If Dependent(Ins(K).Opcode, R1) Then
                                        Independent = False
                                        Exit For
                                    End If
                                    If Dependent(Ins(K).Opcode, R2) Then
                                        Independent = False
                                        Exit For
                                    End If
                                End If
                            Next K
                        End If
                        
                        
                    End If
                    If Independent Then
                        If Ins(J).Active And Ins(I).Active Then
                            Ins(I).Active = False
                            Ins(J).Active = False
                            Exit For
                        End If
                    End If
                End If
            Next J
        End If
    Next I
End Sub

Private Function Dependent(Opcode As String, Register As String)
    Static Critical As Boolean
    ' Needs more rigour
    If Len(Register) = 3 Then
        If InStr(1, Opcode, Right(Register, 2)) Then Dependent = True
    ElseIf Len(Register) = 2 Then
        If InStr(1, Opcode, Register) Then Dependent = True
    Else
        If DebugMode Then
            Stop
        Else
            If Not Critical Then
                MsgBox "Critical error: Unknown register encountered.", vbCritical
                Critical = True
            End If
            Report "Critical error: Unknown register encountered."
            Exit Function
        End If
    End If
End Function

Private Function AreInverse(O1 As String, O2 As String) As Boolean
    Dim Comma   As Long
    Dim R1      As String
    Dim R2      As String
    
    If Left(O1, 3) = "NOT" Then
        If O1 = O2 Then AreInverse = True
    ElseIf Left(O1, 4) = "PUSH" Then
        If O2 = "POP" & Right(O1, Len(O1) - 4) Then AreInverse = True
    ElseIf Left(O1, 4) = "XCHG" Then
        If O1 = O2 Then AreInverse = True
        Comma = InStr(1, O1, ",") - 1
        R1 = Mid(O1, 6, (Comma - 5))
        R2 = Mid(O1, Comma + 2, (Comma - 5))
        If O2 = "XCHG " & R2 & "," & R1 Then AreInverse = True
    ElseIf Left(O1, 5) = "BSWAP" Then
        If O1 = O2 Then AreInverse = True
    End If
End Function

Private Function CSAcquire() As Boolean
    SStart = Val("&H" & frmMain.txtSpliceStart.Text & "&")
    TStart = Val("&H" & frmMain.txtTargetStart.Text & "&")
    SLength = Val("&H" & frmMain.txtSpliceLength.Text & "&")
    TLength = Val("&H" & frmMain.txtTargetLength.Text & "&")
    ProcessID = Val("&H" & frmMain.txtPID.Text & "&")
    
    If ProcessID <= 0 Then Exit Function
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, ProcessID)
    If hProcess = 0 Then
        Report "Invalid Process ID."
        Exit Function
    End If
    If SLength <= 0 Or TLength <= 0 Then
        Report "Section length must be positive."
        Exit Function
    End If
    If SStart <= 0 Or TStart <= 0 Then
        Report "Start addresses must be positive."
        Exit Function
    End If
    
    ReDim Spliced(SLength)
    ReDim Target(TLength)
    
    RPMRet = ReadProcessMemory(hProcess, ByVal SStart, Spliced(0), SLength, NumBytes)
    If RPMRet = 0 Or (NumBytes <> SLength) Then
        Report "Unable to read spliced code memory."
        Exit Function
    End If
    RPMRet = ReadProcessMemory(hProcess, ByVal TStart, Target(0), TLength, NumBytes)
    If RPMRet = 0 Or NumBytes = 0 Then
        Report "Unable to read target code memory."
        Exit Function
    End If
    
    Report "Process memory buffered successfully."
    ReDim BackupTarget(TLength)
    BackupTarget = Target
    CSAcquire = True
End Function

Private Sub DBPreviewCode(Ins() As Instruction)
    Dim I   As Long
    
    'If Not DebugMode Then Exit Sub
    Debug.Print ""
    Debug.Print "--------------------------"
    For I = 0 To UBound(Ins)
        If Ins(I).Opcode = "" Then Exit For
        If Not Ins(I).Active Then Debug.Print "* ";
        Debug.Print Ins(I).Opcode
    Next I
    Debug.Print "--------------------------"
End Sub

Private Sub DBDespliceTextSample(Path As String)
    Dim I   As Long
    Dim NumLines    As Long

    DebugMode = True
    NumLines = 0
    Dim Ins() As Instruction
    
    ReDim Ins(10)
    Open Path For Input As #1
    Do Until EOF(1)
        Ins(NumLines).Active = True
        Line Input #1, Ins(NumLines).Opcode
        NumLines = NumLines + 1
        If NumLines > UBound(Ins) Then
            ReDim Preserve Ins(UBound(Ins) + 10)
        End If
    Loop
    NumLines = NumLines - 1
    ReDim Preserve Ins(NumLines)
    Close #1
    DoRC Ins(), 0, NumLines
    DBPreviewCode Ins()
    Stop
End Sub
