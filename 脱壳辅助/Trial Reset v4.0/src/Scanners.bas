Attribute VB_Name = "Scanners"

Function ACProtect_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If UCase(AllKeys(i)) = AllKeys(i) And Len(AllKeys(i)) > 13 And Replace(AllKeys(i), " ", "") = AllKeys(i) Then
            
            If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\" & AllKeys(i)) = 0 And CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\" & AllKeys(i)) = 1 And ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\" & AllKeys(i), "") = False Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\" & AllKeys(i)
            
        End If

    Next
    
    TheFiles = Dir("C:\*.*", vbHidden)

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 10) And (FileLen("C:\" & TheFiles) = 10) Then
            If UCase(TheFiles) <> "CONFIG.SYS" Then AddFile "C:\" & TheFiles
        End If

        TheFiles = Dir
    Loop

End Function

Function ASProtect_License_Scan()

    On Error Resume Next

    EnumAllRegKeysLog HKEY_LOCAL_MACHINE, "Software", 1
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, AllKeys(i), "key"))

        If Right(TheValue, 1) = "=" And Len(TheValue) > 20 Then AddRegKey "HKEY_LOCAL_MACHINE\" & AllKeys(i), "ASProtect License"

    Next

    EnumAllRegKeysLog HKEY_CURRENT_USER, "Software", 1

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        TheValue = Trim(ReadValue(HKEY_CURRENT_USER, AllKeys(i), "key"))

        If Right(TheValue, 1) = "=" And Len(TheValue) > 20 Then AddRegKey "HKEY_CURRENT_USER\" & AllKeys(i), "ASProtect License"
    Next
    
End Function

Function ASProtect_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CLASSES_ROOT, "CLSID\"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
      
        TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), ""))

        If TheValue = "" Then
            TheValueP = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\ProgID", ""))
            TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\TypeLib", ""))
            TheValueS = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\InprocServer32", ""))
            
            If TheValue <> "" And Replace(LCase(TheValueS), "microsoft shared\ink\mraut.dll", "") = LCase(TheValueS) And Replace(TheValueP, "NisLUCbk.", "") = TheValueP And Replace(TheValueP, "NppBHO", "") = TheValueP Then

                EnumKeys HKEY_CLASSES_ROOT, "TypeLib\" & TheValue, 1

                If UCase(AllKeys(i)) = AllKeys(i) And UBound(AllKeys1) = 0 And VerifyCLSID_Hook(AllKeys(i)) = True Then
                    AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)

                    ExistKeyAdd HKEY_CLASSES_ROOT, "TypeLib\" & TheValue & "\"
                End If
            End If
        End If
        
        TheValue1 = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\InProcServer32", ""))
        TheValue2 = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\ProgID", ""))

        If TheValue <> "" And TheValue1 = "" And TheValue2 = "" Then

            EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), 1

            If UCase(AllKeys(i)) = AllKeys(i) And UBound(AllKeys1) = 2 And VerifyCLSID_Hook(AllKeys(i)) = True Then
                If (AllKeys1(1) = "InProcServer32" Or AllKeys1(2) = "InProcServer32") Then
                    If (AllKeys1(1) = "ProgID" Or AllKeys1(2) = "ProgID") Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
                End If
            End If

        End If
    
    Next

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If ExistKey(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\Verb") = True And VerifyCLSID_Hook(AllKeys(i)) = True And Len(TheValue) = 38 Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\ASProtect"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
                
        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\TypeLib", ""))
        TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))
            
        If TheValue1 <> "" And TheValue <> "" Then

            EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\TypeLib\" & TheValue, 1

            If UBound(AllKeys1) = 0 Then
                TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\TypeLib\" & TheValue, ""))

                If TheValue1 = "" And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\TypeLib\" & TheValue) = True And VerifyCLSID_Hook(AllKeys(i)) = True Then
                    AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
                    AddRegKey "HKEY_CLASSES_ROOT\TypeLib\" & TheValue
                End If
            End If
                
        End If
    
    Next
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))

        If TheValue <> "" And VerifyCLSID_Hook(AllKeys(i)) = True Then

            EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1

            NoASP = 0

            For Z = 1 To UBound(AllKeys1)
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(Z), ""))
                KeyCount = CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(Z))
                Valuecount = CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(Z))

                If TheValue <> "" And KeyCount = 0 And Valuecount = 0 Then NoASP = 1
            Next
                
            TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))

            If NoASP = 0 And Right(TheValue, 1) = "=" And VerifyCLSID_Hook(AllKeys(i)) = True Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)

        End If
 
    Next

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\TypeLib", ""))
        
        NoASP = 0
        
        If ExistKey(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\TypeLib") = True Then
        
            EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), 1

            For t = 1 To UBound(AllKeys1)
                TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & AllKeys1(t), ""))

                If CountKeys(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & AllKeys1(t)) > 0 Then NoASP = 1: Exit For
                If CountValues(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & AllKeys1(t)) > 0 Then NoASP = 1: Exit For
            Next

            If ExistKey(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\TypeLib") = False Then NoASP = 1
            TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\TypeLib", ""))
        Else
            NoASP = 1
        End If

        If ExistFile(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\LocalServer32\", "")) = True And LS32Value <> "" Then NoASP = 1
        
        If ExistKey(HKEY_CLASSES_ROOT, "TypeLib\" & TheValue & "\") = False Then NoASP = 1

        If VerifyCLSID_Hook(AllKeys(i)) = False Then NoASP = 1

        RVal = ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\", "")
        
        If RVal <> "" And NoASP = 0 And TheValue <> "" And UCase(TheValue) = TheValue And UCase(AllKeys(i)) = AllKeys(i) Then

            NotAdd = 0
            
            If Left(RVal, 19) = "MsRdpSessionManager" Or Left(RVal, 15) = "SENS Subscriber" Or RVal = "WiaBroker Class" Then NotAdd = 1

            If NotAdd = 0 Then
                AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
                AddRegKey "HKEY_CLASSES_ROOT\TypeLib\" & TheValue
            End If
        End If

    Next

    ExistKeyAdd HKEY_CURRENT_USER, "SOFTWARE\ASProtect"
        
End Function

Function ActiveMark_Scan()

    On Error Resume Next
    
    EnumKeysLog HKEY_CLASSES_ROOT, "CLSID\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        
        If CountKeys(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i)) > 0 Then

            EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\Implemented Categories", 1

            If UBound(AllKeys1) > 3 Then
                NoAM = 0

                For y = 1 To UBound(AllKeys1) - 1

                    If Left(AllKeys1(y), 2) <> Left(AllKeys1(y + 1), 2) Then NoAM = 1
  
                Next

                If NoAM = 0 And VerifyCLSID_Hook(AllKeys(i)) = True Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i) & "\"

            End If
        End If

    Next
            
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function
    
    AMFile = Dir(ProgramFilesDir & "TryMedia\ActiveMark\data\*.*", vbHidden + vbSystem)
    
    Do While AMFile <> ""

        AddFile ProgramFilesDir & "TryMedia\ActiveMark\data\" & AMFile
        
        AMFile = Dir

    Loop
    
    AMFile = Dir(CAppDataDir & "\TryMedia\data\*.*", vbSystem + vbHidden + vbReadOnly)

    Do While AMFile <> ""
        
        AddFile CAppDataDir & "\TryMedia\data\" & AMFile
        
        AMFile = Dir

    Loop
    
    ExistDirAdd CAppDataDir & "\TryMedia\data\"
    
    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Trymedia Systems"

    ExistKeyAdd HKEY_CURRENT_USER, "SOFTWARE\Macrovision"

    For t = 0 To FRMMain.MNDrive.Count - 1

        If DisDHSS = 0 And FRMMain.MNDrive(t).Checked = True And GetDriveType(FRMMain.MNDrive(t).Caption) = 3 And FRMMain.MNDrive(t).Caption <> "" Then

            DoEvents

            EnumDirLog FRMMain.MNDrive(t).Caption & "\"

            For Z = 1 To UBound(AllDirsList)

                UpdateProgress Z, UBound(AllDirsList)

                If Abort = 1 Then Exit Function

                If Replace(LCase(AllDirsList(Z)), "trymedia", "") <> LCase(AllDirsList(Z)) Then
                    
                    AMFile = Dir(AllDirsList(Z) & "\data\*.*", vbSystem + vbHidden + vbReadOnly)

                    Do While AMFile <> ""
        
                        AddFile AllDirsList(Z) & "\data\" & AMFile
        
                        AMFile = Dir

                    Loop
                    
                    ExistDirAdd AllDirsList(Z) & "\data\"
                
                End If

            Next

        End If

    Next

End Function

Function Armadillo_Scan()

    On Error Resume Next

    EnumValuesAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Licenses"

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Licenses"

    EnumValuesAdd HKEY_CURRENT_USER, "SOFTWARE\Licenses"

    ExistKeyAdd HKEY_CURRENT_USER, "SOFTWARE\Licenses"

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1

        If UBound(AllKeys1) = 1 Then
            If LCase(AllKeys1(1)) = "version" And VerifyCLSID_Hook(AllKeys(i)) = True Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
        End If

    Next
    
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1

        EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)

        NoArma = 0
        IsArma = 0

        For Z = 1 To UBound(AllValues)

            If Val(AllValues(Z).DataType) <> REG_SZ Then NoArma = 1
            
            ArmValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), AllValues(Z).Name))

            For c = 1 To Len(ArmValue) Step 1

                If Mid(ArmValue, c, 1) = Chr(45) Or Mid(ArmValue, c, 1) = Chr(32) Or Mid(ArmValue, c, 1) = Chr(46) Then NoArma = 1: Exit For
            Next

            If IsWord(AllValues(Z).Name, 4) = True And AllValues(1).Name <> "" And UBound(AllValues) = 1 Then IsArma = 1
            If IsWord(AllValues(Z).Name, 2) = False And AllValues(Z).Name <> "" And UBound(AllValues) = 1 Then IsArma = 1
    
        Next

        If NoArma = 0 And UBound(AllValues) > 2 Then NoArma = 0 Else NoArma = 1
        If IsArma = 1 And UBound(AllValues) > 4 Then IsArma = 1 Else IsArma = 0
        If NoArma = 0 Or IsArma = 1 Then
            AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
        End If
            
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1

        For Z = 1 To UBound(AllKeys1)
            TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(Z), ""))
        
            If Mid(TheValue, 2, 2) <> ":\" And Replace(AllKeys1(Z), " ", "") = AllKeys1(Z) Then
                If IsWord(AllKeys1(Z), 4) = True And AllKeys1(Z) <> "" Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i): Exit For
            End If
        
        Next
        
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)

        For Z = 1 To UBound(AllValues)
            ArmValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), AllValues(Z).Name))

            If VerifyCLSID_Hook(AllKeys(i)) = True And (Len(ArmValue) >= 32) And IsWord(AllValues(Z).Name, 2) And Len(AllValues(Z).Name) = 4 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            If VerifyCLSID_Hook(AllKeys(i)) = True And (IsHex(AllValues(Z).Name) = False Or UCase(AllValues(Z).Name) <> AllValues(Z).Name) And (Len(ArmValue) >= 16) And IsWord(AllValues(Z).Name, 4) Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            If VerifyCLSID_Hook(AllKeys(i)) = True And Val(AllValues(Z).DataType) = REG_BINARY And Left(ArmValue, 4) = Chr(114) & Chr(154) & Chr(26) & Chr(196) Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
        Next
    
    Next
    
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumKeysLog HKEY_CURRENT_USER, "SOFTWARE\Classes"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumValues HKEY_CURRENT_USER, "SOFTWARE\Classes\" & AllKeys(i)

        For Z = 1 To UBound(AllValues)
            ArmValue = Trim(ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Classes\" & AllKeys(i), AllValues(Z).Name))

            If (Len(ArmValue) >= 32) And IsWord(AllValues(Z).Name, 2) And Len(AllValues(Z).Name) = 4 Then AddRegKey "HKEY_CURRENT_USER\SOFTWARE\Classes\" & AllKeys(i)
            If (IsHex(AllValues(Z).Name) = False Or UCase(AllValues(Z).Name) <> AllValues(Z).Name) And (Len(ArmValue) >= 32) And IsWord(AllValues(Z).Name, 4) Then AddRegKey "HKEY_CURRENT_USER\SOFTWARE\Classes\" & AllKeys(i)
            If Val(AllValues(Z).DataType) = REG_BINARY And Left(ArmValue, 4) = Chr(114) & Chr(154) & Chr(26) & Chr(196) Then AddRegKey "HKEY_CURRENT_USER\SOFTWARE\Classes\" & AllKeys(i)
        Next
    
    Next
   
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\The Silicon Realms Toolworks\Armadillo"
    ExistKeyAdd HKEY_CURRENT_USER, "SOFTWARE\The Silicon Realms Toolworks\Armadillo"
    ExistKeyAdd HKEY_CURRENT_USER, "Software\Licenses\"
    ExistKeyAdd HKEY_USERS, ".DEFAULT\SOFTWARE\The Silicon Realms Toolworks\"
    ExistKeyAdd HKEY_USERS, ".DEFAULT\Software\Licenses\"

    TheFiles = Dir(TempDir & "*.tmp")

    Do Until Len(TheFiles) = 0

        If (Left(TheFiles, 1) <> "~") And (Len(TheFiles) = 12) And (FileLen(TempDir & TheFiles) < 1000) Then AddFile TempDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(CAppDataDir & "\TEMP\*.tmp")

    Do Until Len(TheFiles) = 0

        If (Left(TheFiles, 1) <> "~") And (Len(TheFiles) = 12) And (FileLen(CAppDataDir & "\TEMP\" & TheFiles) < 1000) Then AddFile CAppDataDir & "\TEMP\" & TheFiles
        TheFiles = Dir
    Loop

    ExistDirAdd CAppDataDir & "\TEMP\"
    ExistFileAdd CAppDataDir & "\TEMP"
End Function

Function DBPE_Scan()

    On Error Resume Next

    ExistKeyAdd HKEY_CLASSES_ROOT, "wrifile\shell\open\command\config"

End Function

Function EXECryptor_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved"

    If UBound(AllKeys) > 0 Then

        For i = 1 To UBound(AllKeys)
            UpdateProgress i, UBound(AllKeys)

            If Abort = 1 Then Exit Function

            If ExistKey(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved\" & AllKeys(i)) = True Then AddRegKey "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved\" & AllKeys(i)
            
        Next

    End If

    ExistKeyAdd HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved"
    
End Function

Function EncryptPE_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Setup"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        
        If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\" & AllKeys(i)) = 0 Then
            
            TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\" & AllKeys(i), ""))

            If TheValue <> "" Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\" & AllKeys(i)
            
        End If

    Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If Right(AllKeys(i), 1) = "}" And Left(AllKeys(i), 1) = "{" And Len(AllKeys(i)) = 38 And Len(Replace(AllKeys(i), "-", "")) = Len(AllKeys(i)) - 4 Then

            If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\" & AllKeys(i)) = 0 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\" & AllKeys(i)
        End If

    Next

    TheFiles = Dir(SystemDir & "{*-*-*-*-*}")

    Do Until Len(TheFiles) = 0
        DoEvents

        If (Len(TheFiles) = 38) Then AddFile SystemDir & TheFiles

        TheFiles = Dir
    Loop

    TheFiles = Dir(TempDir & "{*-*-*-*-*}")

    Do Until Len(TheFiles) = 0
        DoEvents

        If (Len(TheFiles) = 38) Then AddFile TempDir & TheFiles

        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "{*-*-*-*-*}")

    Do Until Len(TheFiles) = 0
        DoEvents

        If (Len(TheFiles) = 38) Then AddFile WindowsDir & TheFiles

        TheFiles = Dir
    Loop

    Set FSO = CreateObject("Scripting.FileSystemObject")

    TheFiles = Dir(TempDir & "$*.*{*-*-*-*-*}", vbDirectory + vbHidden + vbSystem)

    Do Until Len(TheFiles) = 0
        DoEvents

        If (Len(TheFiles) >= 38) Then AddDir TempDir & TheFiles & "\"
        
        TheFiles = Dir
    Loop

End Function

Function EnigmaFull_Scan()

    On Error Resume Next

    EnumAllRegKeysLog HKEY_LOCAL_MACHINE, ""
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, AllKeys(i) & "\ProductID", "ID"))

        If TheValue <> "" And ExistKey(HKEY_LOCAL_MACHINE, AllKeys(i) & "\ProductID") = True Then AddRegKey "HKEY_LOCAL_MACHINE\" & AllKeys(i)
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumAllRegKeysLog HKEY_USERS, ""
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue = Trim(ReadValue(HKEY_CURRENT_USER, AllKeys(i) & "\ProductID", "ID"))

        If TheValue <> "" And ExistKey(HKEY_CURRENT_USER, AllKeys(i) & "\ProductID") = True Then AddRegKey "HKEY_LOCAL_MACHINE\" & AllKeys(i)
    Next

    EnumValuesAdd HKEY_CURRENT_USER, "SOFTWARE\Enigma Protector"

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Enigma Protector\ProductID"
    
    ExistKeyAdd HKEY_CURRENT_USER, "SOFTWARE\Enigma Protector"

End Function

Function Enigma_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\ProductID", "ID"))

        If VerifyCLSID_Hook(AllKeys(i)) = True And TheValue <> "" And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\ProductID") = True Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
    Next
    
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumAllRegKeysLog HKEY_LOCAL_MACHINE, "Software", 1

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, AllKeys(i) & "\ProductID", "ID"))

        If TheValue <> "" And ExistKey(HKEY_LOCAL_MACHINE, AllKeys(i) & "\ProductID") = True Then AddRegKey "HKEY_LOCAL_MACHINE\" & AllKeys(i)
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumAllRegKeysLog HKEY_CURRENT_USER, "Software"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        
        TheValue = Trim(ReadValue(HKEY_CURRENT_USER, AllKeys(i) & "\ProductID", "ID"))

        If TheValue <> "" And ExistKey(HKEY_CURRENT_USER, AllKeys(i) & "\ProductID") = True Then AddRegKey "HKEY_LOCAL_MACHINE\" & AllKeys(i)
    Next
    
    EnumValuesAdd HKEY_CURRENT_USER, "SOFTWARE\Enigma Protector"

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Enigma Protector\ProductID"
    
    ExistKeyAdd HKEY_CURRENT_USER, "SOFTWARE\Enigma Protector"

End Function

Function ExeShield_Scan()

    On Error Resume Next

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\ExeShield"

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\WindowsShellCMD"
    
    TheFiles = Dir(WindowsDir & "*.Lic")

    Do Until Len(TheFiles) = 0
    
        AddFile WindowsDir & TheFiles
   
        TheFiles = Dir
    Loop

    ExistFileAdd WindowsDir & "netctrl.ini"

    If ExistFile(WindowsDir & "win.ini") = True Then
    
        Set fs2 = CreateObject("Scripting.FileSystemObject")
        Set a = fs2.openTextFile(WindowsDir & "Win.ini")
        WinT = a.ReadAll
        a.Close

        If Replace(WinT, "StartDate", "") <> WinT Then AddFile WindowsDir & "win.ini"
    End If

    TheFiles = Dir(TempDir & "*.sdf")

    Do Until Len(TheFiles) = 0
    
        AddFile TempDir & TheFiles

        TheFiles = Dir

    Loop
    
    TheFiles = Dir(TempDir & "*.sd*")

    Do Until Len(TheFiles) = 0
    
        AddFile TempDir & TheFiles

        TheFiles = Dir

    Loop
        
    ESF = Dir(CAppDataDir, vbDirectory + vbHidden + vbSystem)
        
    Do While ESF <> ""
                
        If ESF <> "" And Replace(ESF, ".", "") = ESF Then
            If GetAttr(CAppDataDir & ESF) <> 9238 Then
                If ExistFile(CAppDataDir & ESF & "\netctrl.ini") = True Then
                    AddFile CAppDataDir & ESF & "\netctrl.ini"
                    AddDir CAppDataDir & ESF & "\"
                End If
            End If
        End If

        ESF = Dir

    Loop
    
    ESF = Dir(TempDir, vbDirectory + vbHidden + vbSystem)
        
    Do While ESF <> ""
                
        If ESF <> "" And Replace(ESF, ".", "") = ESF Then
            If GetAttr(TempDir & ESF) <> 9238 Then
                If ExistFile(TempDir & ESF & "\netctrl.ini") = True Then
                    AddFile TempDir & ESF & "\netctrl.ini"
                    AddDir TempDir & ESF & "\"
                End If
                
            End If
        End If

        ESF = Dir

    Loop

End Function

Function Expressor_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\"
   
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1

        If UBound(AllKeys1) = 1 Then
            If LCase(AllKeys1(1)) = "typelib" Then
                        
                If CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\TypeLib") = 0 Then

                    EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\TypeLib"
                            
                    TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\TypeLib", AllValues(1).Name))

                    If Right(TheValue, 1) = "}" And Left(TheValue, 1) = "{" And Replace(TheValue, "-", "") <> TheValue Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
                End If
            End If
        End If

    Next
   
    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\"
  
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), 1

        If UBound(AllKeys1) = 0 Then
                        
            If CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = 0 Then

                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), ""))

                If TheValue <> "" And TheValue = AllKeys(i) And Replace(TheValue, ".", "") = TheValue And Left(TheValue, 3) <> "DTS" Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i)
            End If
        End If

    Next
    
    EnumDirLog UsersBaseDir

    For i = 1 To UBound(AllDirsList)
        CF = Dir(AllDirsList(i) & "\*.dll", vbHidden + vbSystem)

        Do While CF <> ""
                
            If Replace(CF, ".", "") <> "" And IsHex(Replace(CF, ".dll", "")) = True Then
        
                If FileLen(AllDirsList(i) & "\" & CF) = 0 And Len(CF) = 12 Then AddFile AllDirsList(i) & "\" & CF

            End If

            CF = Dir

        Loop

    Next

End Function

Function FlexNet_Scan()

    On Error Resume Next
    
    Dim SCClass()  As LongDataTime

    Dim SCCLSID()  As LongDataTime

    Dim SCIntall() As LongDataTime

    Dim SectDump() As SecList
    
    Dim SysDate    As SYSTEMTIME

    ReDim SCClass(0)
    ReDim SCCLSID(0)
    ReDim SCIntall(0)
    
    ExistProcessAdd "FNPLicensingService.exe"
    ExistProcessAdd "FNPLicensingService64.exe"
    ExistProcessAdd "AdskScSrv.exe"
    ExistProcessAdd "Adobelmsvc.exe"
    ExistProcessAdd "Macromedia Licensing.exe"
    ExistProcessAdd "CDAC11BA.EXE"

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Macrovision\"
    
    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), ""))

        If TheValue <> "" Then
            If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)) = 1 And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i) & "\CLSID") = True Then
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i) & "\CLSID", ""))

                If ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & TheValue) = False And Left(TheValue, 1) = "{" And Right(TheValue, 1) = "}" Then
                   
                    ReDim Preserve SCClass(UBound(SCClass) + 1)
                    SCClass(UBound(SCClass)).Name = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i)

                    SysDate = GetTime(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), "")

                    If SysDate.wHour >= 24 Then SysDate.wHour = SysDate.wHour - 24: SysDate.wDay = SysDate.wDay + 1

                    SCClass(UBound(SCClass)).LDate = SysDate.wYear * 365 + SysDate.wMonth * 31 + SysDate.wDay
                    SCClass(UBound(SCClass)).LTime = SysDate.wHour * 3600 + SysDate.wMinute * 60 + SysDate.wSecond
                End If
            End If
            
        End If

    Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "") = True Then
            If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = 1 And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32") = True Then
                TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32", ""))
                TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32", "ThreadingModel"))

                If TheValue1 <> "" And TheValue2 <> "" And CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32") = 0 Then

                    ReDim Preserve SCCLSID(UBound(SCCLSID) + 1)
                    SCCLSID(UBound(SCCLSID)).Name = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)

                    SysDate = GetTime(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "")

                    If SysDate.wHour >= 24 Then SysDate.wHour = SysDate.wHour - 24: SysDate.wDay = SysDate.wDay + 1

                    SCCLSID(UBound(SCCLSID)).LDate = SysDate.wYear * 365 + SysDate.wMonth * 31 + SysDate.wDay
                    SCCLSID(UBound(SCCLSID)).LTime = SysDate.wHour * 3600 + SysDate.wMinute * 60 + SysDate.wSecond

                End If

            End If
            
        End If

    Next
    
    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Active Setup\Installed Components\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Active Setup\Installed Components\" & AllKeys(i), "") = True Then
            If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Active Setup\Installed Components\" & AllKeys(i)) = 0 Then
                
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Active Setup\Installed Components\" & AllKeys(i), "IsInstalled", DType))
                TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Active Setup\Installed Components\" & AllKeys(i), "Local"))

                If DType = REG_DWORD And Replace(TheValue, Chr(0), "") = Chr(1) And TheValue1 = "EN" Then
                    ReDim Preserve SCIntall(UBound(SCIntall) + 1)
                    SCIntall(UBound(SCIntall)).Name = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\" & AllKeys(i)

                    SysDate = GetTime(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Active Setup\Installed Components\" & AllKeys(i), "")

                    If SysDate.wHour >= 24 Then SysDate.wHour = SysDate.wHour - 24: SysDate.wDay = SysDate.wDay + 1

                    SCIntall(UBound(SCIntall)).LDate = SysDate.wYear * 365 + SysDate.wMonth * 31 + SysDate.wDay
                    SCIntall(UBound(SCIntall)).LTime = SysDate.wHour * 3600 + SysDate.wMinute * 60 + SysDate.wSecond
                End If
                
            End If
            
        End If

    Next

    Dim TimeList() As Long

    ReDim TimeList(0)
    
    For t = 1 To UBound(SCClass)
        InsF = 0
        CLSIDF = 0
        ClassF = 0

        For i = 1 To UBound(SCIntall)

            If SCClass(t).LDate = SCIntall(i).LDate And SCClass(t).LTime = SCIntall(i).LTime Then InsF = InsF + 1
        Next
        
        For i = 1 To UBound(SCCLSID)

            If SCClass(t).LDate = SCCLSID(i).LDate And SCClass(t).LTime = SCCLSID(i).LTime Then CLSIDF = CLSIDF + 1
        Next
        
        For i = 1 To UBound(SCClass)

            If SCClass(t).LDate = SCClass(i).LDate And SCClass(t).LTime = SCClass(i).LTime Then ClassF = ClassF + 1
        Next
        
        If InsF = CLSIDF And ClassF = InsF Then
        
            For i = 1 To UBound(SCIntall)

                If SCClass(t).LDate = SCIntall(i).LDate And SCClass(t).LTime = SCIntall(i).LTime Then AddRegKey SCIntall(i).Name
            Next
            
            For i = 1 To UBound(SCCLSID)

                If SCClass(t).LDate = SCCLSID(i).LDate And SCClass(t).LTime = SCCLSID(i).LTime Then AddRegKey SCCLSID(i).Name
            Next
            
            For i = 1 To UBound(SCClass)

                If SCClass(t).LDate = SCClass(i).LDate And SCClass(t).LTime = SCClass(i).LTime Then AddRegKey SCClass(i).Name
            Next
            
        End If
        
    Next

    ExistDirAdd CAppDataDir & "FLEXnet\"
    
    EnumDirLog CAppDataDir

    For i = 1 To UBound(AllDirsList)
        
        ExistDirAdd AllDirsList(i) & "\Software licenses\"
        ExistDirAdd AllDirsList(i) & "\Product licenses\"

    Next
    
    If DisDHSS = 0 Then
        SectorDump 1, 0, SectDump, 0
    
        If Replace(SectDump(1).SecData, "0", "") = "" Then
            SectorDumpLog 2, 59, SectDump, -1, 0
            
            StopScan = 0
            
            For Z = 1 To UBound(SectDump)
        
                If Mid(SectDump(Z).SecData, 3, 4) = "41A0" And Left(SectDump(Z).SecData, 2) <> "FF" Then AddSector "Disk: " & SectDump(Z).DiskNum & " Sector: " & SectDump(Z).SecNum
                
                If Replace(SectDump(Z).SecData, "0", "") = "" Then StopScan = 1
                
            Next
    
        Else
            SectorDumpLog 60, -55, SectDump, -1, 1
        
            For Z = 1 To UBound(SectDump)
        
                If Mid(SectDump(Z).SecData, 3, 4) = "41A0" And Left(SectDump(Z).SecData, 2) <> "FF" Then AddSector "Disk: " & SectDump(Z).DiskNum & " Sector: " & SectDump(Z).SecNum
            Next
    
        End If
    End If

End Function

Function ICE_License_Scan()

    On Error Resume Next

    EnumAllRegKeysLog HKEY_LOCAL_MACHINE, "Software"

    For i = 1 To UBound(AllKeys)

        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
            
        If UCase(Right(AllKeys(i), 8)) = Right(AllKeys(i), 8) And IsNumeric(Right(AllKeys(i), 8)) = False And IsHex(Right(AllKeys(i), 8)) = True And Mid(AllKeys(i), Len(AllKeys(i)) - 8, 1) = "\" Then

            If CountKeys(HKEY_LOCAL_MACHINE, AllKeys(i)) = 0 Then

                EnumValues HKEY_LOCAL_MACHINE, AllKeys(i)
  
                NoICE = 0

                For Z = 1 To UBound(AllValues)
    
                    If AllValues(Z).DataType <> REG_SZ Then NoICE = 1
        
                Next

                If NoICE = 0 And CountValues(HKEY_LOCAL_MACHINE, AllKeys(i)) > 0 And UBound(AllValues) < 20 And ExistValue(HKEY_LOCAL_MACHINE, AllKeys(i), "") = False Then
                
                    AddRegKey "HKEY_LOCAL_MACHINE\" & AllKeys(i)
    
                End If
            End If
        End If

    Next
    
    EnumAllRegKeysLog HKEY_CURRENT_USER, "Software"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
                
        If UCase(Right(AllKeys(i), 8)) = Right(AllKeys(i), 8) And IsNumeric(Right(AllKeys(i), 8)) = False And IsHex(Right(AllKeys(i), 8)) = True And Mid(AllKeys(i), Len(AllKeys(i)) - 8, 1) = "\" Then
    
            If CountKeys(HKEY_CURRENT_USER, AllKeys(i)) = 0 Then
    
                EnumValues HKEY_LOCAL_MACHINE, AllKeys(i)
        
                NoICE = 0

                For Z = 1 To UBound(AllValues)
        
                    If AllValues(Z).DataType <> REG_SZ Then NoICE = 1
        
                Next
        
                If NoICE = 0 And UBound(AllValues) > 0 And UBound(AllValues) < 20 And ExistValue(HKEY_CURRENT_USER, AllKeys(i), "") = False Then
                
                    If UCase(Right(AllKeys(i), 8)) = Right(AllKeys(i), 8) And IsNumeric(Right(AllKeys(i), 8)) = False And IsHex(Right(AllKeys(i), 8)) = True And Mid(AllKeys(i), Len(AllKeys(i)) - 8, 1) = "\" Then AddRegKey "HKEY_CURRENT_USER\" & AllKeys(i)
    
                End If
            End If
        End If

    Next

End Function

Function IntelliLock_Scan()

    On Error Resume Next
    
    Dim BinaryFile(255) As Byte
    
    EnumKeysLog HKEY_CURRENT_USER, "Software\Classes\CLSID"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If Right(AllKeys(i), 1) = "}" And Left(AllKeys(i), 1) = "{" And Len(AllKeys(i)) = 38 Then
        
            If CountValues(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(i)) > 0 And CountKeys(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(i)) = 0 And ExistValue(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(i), "") = False Then
                
                EnumValues HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(i)

                notIL = 0

                For Z = 1 To UBound(AllValues)

                    If IsNumeric(AllValues(Z).Name) = False Or AllValues(Z).DataType <> REG_SZ Then
                        notIL = 1

                        Exit For

                    Else
                        TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Classes\CLSID\" & AllKeys(i), AllValues(Z).Name))

                        If Len(TheValue) < 30 Or Replace(TheValue, ".", "") <> TheValue Or Replace(TheValue, " ", "") <> TheValue Then
                            notIL = 1

                            Exit For

                        End If
                    
                    End If

                Next
                
                If notIL = 0 Then AddRegKey "HKEY_CURRENT_USER\SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\"

            End If
            
        End If

    Next

    TheFiles = Dir(CAppDataDir & "IsolatedStorage\{*}", vbHidden)

    Do Until Len(TheFiles) = 0

        If Len(TheFiles) = 38 Then AddFile CAppDataDir & "IsolatedStorage\" & TheFiles

        TheFiles = Dir
    Loop

    For t = 0 To FRMMain.MNDrive.Count - 1

        If DisDHSS = 0 And FRMMain.MNDrive(t).Checked = True And GetDriveType(FRMMain.MNDrive(t).Caption) = 3 And FRMMain.MNDrive(t).Caption <> "" Then

            DoEvents

            EnumDirLog FRMMain.MNDrive(t).Caption & "\"

            For Z = 1 To UBound(AllDirsList)
        
                UpdateProgress Z, UBound(AllDirsList)
        
                If Abort = 1 Then Exit Function
                    
                AMFile = Dir(AllDirsList(Z) & "\*.exe", vbSystem + vbHidden + vbReadOnly)
        
                Do While AMFile <> ""
        
                    Open AllDirsList(Z) & "\" & AMFile For Binary As #1
                    Get #1, , BinaryFile()
                    Close #1
                    
                    If BinaryFile(&H9A) = &H6 Then
                        If HaveAltStream(AllDirsList(Z), 0, STOut) = True Then
                            If Replace$(STOut, "{", "") <> STOut And Replace$(STOut, "}", "") <> STOut Then AddStream AllDirsList(Z)
                        End If
        
                        Exit Do
        
                    End If
        
                    AMFile = Dir
        
                Loop

            Next

        End If
    
    Next
    
End Function

Function LicenseProtector_Scan()

    On Error Resume Next
    
    ExistKeyAdd HKEY_LOCAL_MACHINE, "Software\Microsoft\Lptr"
    
    ExistKeyAdd HKEY_CURRENT_USER, "Software\Microsoft\Lptr"

End Function

Function Manco_Licensing_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "", DataType))
        TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32", "", DataType1))
        TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\TypeLib", "", DataType2))

        If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = 2 And Len(TheValue) > 100 And DataType = REG_SZ And Len(TheValue1) > 100 And DataType1 = REG_BINARY And Len(TheValue2) > 100 And DataType = REG_SZ Then
            AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
        End If

    Next

End Function

Function NETReactor_Scan()

    EnumKeysLog HKEY_CURRENT_USER, "Software\Classes\CLSID", 1

    For i = 1 To UBound(AllKeys1)
    
        UpdateProgress i, UBound(AllKeys1)
        
        TempPath = Trim(ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Classes\CLSID\" & AllKeys1(i), ""))
        
        If TempPath = "" And CountKeys(HKEY_CURRENT_USER, "SOFTWARE\Classes\CLSID\" & AllKeys1(i)) >= 1 And CountValues(HKEY_CURRENT_USER, "SOFTWARE\Classes\CLSID\" & AllKeys1(i)) = 0 Then
            
            EnumKeys HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys1(i)

            If CountKeys(HKEY_CURRENT_USER, "SOFTWARE\Classes\CLSID\" & AllKeys1(i) & "\" & AllKeys(1)) = 0 And Len(AllKeys(1)) <= 8 And IsHex(AllKeys(1)) = True Then

                EnumValues HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys1(i) & "\" & AllKeys(1)

                notIL = 0

                For Z = 1 To UBound(AllValues)

                    If IsNumeric(AllValues(Z).Name) = False Or AllValues(Z).DataType <> REG_SZ Then
                        notIL = 1

                        Exit For

                    Else
                        TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Classes\CLSID\" & AllKeys1(i) & "\" & AllKeys(1), AllValues(Z).Name))

                        If IsNumeric(TheValue) = False Or Replace(TheValue, ".", "") <> TheValue Or Replace(TheValue, " ", "") <> TheValue Then
                            notIL = 1

                            Exit For

                        End If
                    
                    End If

                Next
                
                If notIL = 0 Then AddRegKey "HKEY_CURRENT_USER\SOFTWARE\Classes\CLSID\" & AllKeys1(i)
            End If
        End If

    Next

    TheFiles = Dir(CAppDataDir & "IsolatedStorage\*", vbHidden + vbDirectory)

    Do Until Len(TheFiles) = 0

        If Len(TheFiles) = 8 And Replace$(TheFiles, ".", "") = TheFiles Then AddDir CAppDataDir & "IsolatedStorage\" & TheFiles & "\"

        TheFiles = Dir
    Loop
        
End Function

Function NTkrnl_Protector_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CURRENT_USER, "Software\Microsoft"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        
        If CountValues(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(i) & "\") = 1 And ExistValue(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(i) & "\", "") = False Then

            If CountKeys(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(i)) = 0 Then

                EnumValues HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(i)
                    
                TheValue1 = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(i), AllValues(1).Name))
  
                If Len(TheValue1) > 64 And TheValue1 <> "" And Val(AllValues(1).DataType) = REG_BINARY Then AddRegKey "HKEY_CURRENT_USER\Software\Microsoft\" & AllKeys(i)

            End If

        End If
        
    Next
     
End Function

Function Nalpeiron_Scan()
    
    Dim SectDump() As SecList
    
    If DisDHSS = 0 Then
        'ExistProcessAdd "AstSrv.exe"
    
        SectorDump 1, 0, SectDump, 0
    
        AutoEnd = 3
        
        If Replace(SectDump(1).SecData, "0", "") = "" Then AutoEnd = 50
        
        SectorDumpLog 60, -20, SectDump, -1, AutoEnd
    
        For Z = 1 To UBound(SectDump)
    
            If Left(SectDump(Z).SecData, 2) = "FF" Then AddSector "Disk: " & SectDump(Z).DiskNum & " Sector: " & SectDump(Z).SecNum
        Next

    End If

End Function

Function NoCopy_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        
        EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), 2
    
        If UBound(AllKeys1) > 0 Then
            If AllKeys1(1) = AllKeys(i) Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i) & "\"
        End If

    Next
            
End Function

Function ORiEN_Scan()
    
    EnumAllRegKeysLog HKEY_LOCAL_MACHINE, ""

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        
        EnumValues HKEY_LOCAL_MACHINE, AllKeys(i)

        For Z = 1 To UBound(AllValues)

            If Len(AllValues(Z).Name) > 2 Then
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, AllKeys(i), AllValues(Z).Name))

                If Len(TheValue) = 7 And IsHex(AllValues(Z).Name) = True And Left(AllValues(Z).Name, 2) = "00" And Val(AllValues(Z).DataType) > 10000 Then AddRegVal "HKEY_LOCAL_MACHINE\" & AllKeys(i) & "\" & AllValues(Z).Name
            End If

        Next

    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function
    
    EnumAllRegKeysLog HKEY_USERS, ""

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumValues HKEY_USERS, AllKeys(i)

        For Z = 1 To UBound(AllValues)

            If Len(AllValues(Z).Name) > 2 Then
                TheValue = Trim(ReadValue(HKEY_USERS, AllKeys(i), AllValues(Z).Name))

                If Len(TheValue) = 7 And IsHex(AllValues(Z).Name) = True And Left(AllValues(Z).Name, 2) = "00" And Val(AllValues(Z).DataType) > 10000 Then AddRegVal "HKEY_USERS\" & AllKeys(i) & "\" & AllValues(Z).Name
            End If

        Next

    Next

End Function

Function Obsidium_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CLASSES_ROOT, "CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), ""))

        If TheValue = "Picture (Metafile)" Or TheValue = "Immagine (Metafile)" Then
            TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), "AppID"))

            If TheValue <> "" And VerifyCLSID_Hook(AllKeys(i)) = True Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
        End If
        
    Next

    EnumKeysLog HKEY_CURRENT_USER, "SOFTWARE\Obsidium"
    
    For i = 1 To UBound(AllKeys)
        AddRegKey "HKEY_CURRENT_USER\Software\Obsidium\" & AllKeys(i)
    Next
    
    ExistKeyAdd HKEY_CURRENT_USER, "Software\Obsidium"
           
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function
    
    EnumValues HKEY_CLASSES_ROOT, "CLSID\{FAE3D380-FEA4-4623-8C75-C6B61110B681}\Namespaces"

    Dim NamSpaces() As String

    ReDim NamSpaces(UBound(AllValues))

    For Z = 1 To UBound(AllValues)

        NamSpaces(Z) = ReadValue(HKEY_CLASSES_ROOT, "CLSID\{FAE3D380-FEA4-4623-8C75-C6B61110B681}\Namespaces", AllValues(Z).Name)

    Next
                
    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If VerifyCLSID_Hook(AllKeys(i)) = False Then NoObsidium = 1 Else NoObsidium = 0
        
        TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))
        TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "AppID"))
        TheValue3 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32", ""))
             
        If UCase(AllKeys(i)) = AllKeys(i) And NoObsidium = 0 And TheValue1 <> "" And Left(TheValue2, 1) = "{" And Right(TheValue2, 1) = "}" And Len(TheValue2) = 38 Then
            If Right(TheValue2, 14) <> Right(AllKeys(i), 14) Then
                       
                EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1
 
                If UBound(AllKeys1) >= 0 And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\AppID\" & TheValue2) = False Then

                    If UBound(AllKeys1) <> 1 Or ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = False Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
                End If
            End If
        End If
        
        TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "CLSID"))

        If UCase(AllKeys(i)) = AllKeys(i) And NoObsidium = 0 And TheValue1 <> "" And Left(TheValue2, 1) = "{" And Right(TheValue2, 1) = "}" And Len(TheValue2) = 38 Then
            If Right(TheValue2, 14) <> Right(AllKeys(i), 14) Then
                       
                EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1
 
                If UBound(AllKeys1) >= 0 And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\AppID\" & TheValue2) = False Then

                    If UBound(AllKeys1) <> 1 Or ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = False Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
                End If
            End If
        End If

        If UCase(AllKeys(i)) = AllKeys(i) And NoObsidium = 0 Then
            NoObs = 0
            
            If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "MetadataFormat") = True Then
                TheValue4 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "MetadataFormat"))

                For Z = 1 To UBound(NamSpaces)

                    If LCase(NamSpaces(Z)) = LCase(TheValue4) Then NoObs = 1
        
                Next

                If NoObs = 0 And Left(TheValue4, 1) = "{" And Right(TheValue4, 1) = "}" And Len(TheValue4) = 38 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            End If
            
            If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "ISV") = True Then
                TheValue4 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "ISV"))
    
                If Left(TheValue4, 1) = "{" And Right(TheValue4, 1) = "}" And Len(TheValue4) = 38 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            End If
            
            If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "Element") = True Then
                TheValue4 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "Element"))
    
                If Left(TheValue4, 1) = "{" And Right(TheValue4, 1) = "}" And Len(TheValue4) = 38 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            End If
            
            'If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "Vendor") = True Then
            '    TheValue4 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "Vendor"))
    
            '    If NoObs = 0 And Left(TheValue4, 1) = "{" And Right(TheValue4, 1) = "}" And Len(TheValue4) = 38 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            'End If

        End If

        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1

        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))
        
        If UCase(AllKeys(i)) = AllKeys(i) And NoObsidium = 0 And TheValue = "" And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = True And UBound(AllKeys1) = 0 Then
            TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "AppID"))

            If ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\AppID\" & TheValue) = False Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
        End If

    Next
 
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    TempPath = AppDataDir & "Obsidium\"

    TheFiles = Dir(TempPath & "*.*")

    Do Until Len(TheFiles) = 0
    
        AddFile TempPath & TheFiles
        TheFiles = Dir
    Loop

    ExistDirAdd TempPath

    If ExistFile(WindowsDir & "Win.ini") = True Then
        Set FSO = CreateObject("Scripting.FileSystemObject")
        Set a = FSO.openTextFile(WindowsDir & "Win.ini")
        WinT = a.ReadAll
        a.Close

        If Replace(LCase(WinT), "[obsidium]", "") <> LCase(WinT) Then AddFile WindowsDir & "Win.ini"
    End If
        
End Function

Function OneWay_Scan()

    On Error Resume Next
    
    EnumKeysLog HKEY_USERS, UBase2 & "CLSID\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If CountKeys(HKEY_USERS, UBase2 & "CLSID\" & AllKeys(i)) = 0 Then AddRegKey "HKEY_USERS\" & UBase2 & "CLSID\" & AllKeys(i) & "\"
    Next

    EnumKeysLog HKEY_USERS, ".DEFAULT\CLSID\"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If CountKeys(HKEY_USERS, ".DEFAULT\CLSID\" & AllKeys(i)) = 0 Then AddRegKey "HKEY_USERS\.DEFAULT\CLSID\" & AllKeys(i) & "\"

    Next

    ExistFileAdd WindowsDir & "trfntw32.cfg"

    ExistFileAdd WindowsDir & "WSYS049.SYS"

    ExistFileAdd CDocumentsDir & "msdrls.dat"
    
    ExistDirAdd CDocumentsDir & "Sys\"
    
End Function

Function PCGuard_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CLASSES_ROOT, ""
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
            
        TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, AllKeys(i), Chr(32), DataType))

        If TheValue <> "" And DataType = REG_BINARY Then AddRegKey "HKEY_CLASSES_ROOT\" & AllKeys(i)

    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumKeysLog HKEY_CURRENT_USER, ""
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
            
        TheValue = Trim(ReadValue(HKEY_CURRENT_USER, AllKeys(i), Chr(32), DataType))

        If TheValue <> "" And DataType = REG_BINARY Then AddRegKey "HKEY_CURRENT_USER\" & AllKeys(i)
          
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function
    
    ExistKeyAdd HKEY_CURRENT_USER, "Software\Microsoft\MSDAIPP\Provider"

    TheFiles = Dir(Left(WindowsDir, 3) & "*.*", vbHidden + vbSystem)

    Do Until Len(TheFiles) = 0

        If Left(TheFiles, 8) = "PCGWIN32" Then AddFile Left(WindowsDir, 3) & TheFiles

        TheFiles = Dir
    Loop

    EnumDirLog CAppDataDir

    For i = 1 To UBound(AllDirsList)
        TheFiles = Dir(AllDirsList(i) & "\PCGWIN32.li*", vbHidden + vbSystem)

        Do Until Len(TheFiles) = 0
            DoEvents

            If Left(TheFiles, 8) = "PCGWIN32" Then
                AddFile AllDirsList(i) & "\" & TheFiles
                AddDir AllDirsList(i) & "\"
        
            End If

            TheFiles = Dir
        Loop

    Next

    TheFiles = Dir(WindowsDir & "*.*", vbHidden + vbSystem)

    Do Until Len(TheFiles) = 0
        DoEvents

        If Left(TheFiles, 8) = "PCGWIN32" Then AddFile WindowsDir & TheFiles

        TheFiles = Dir
    Loop

    TheFiles = Dir(SystemDir & "*.*", vbHidden + vbSystem)

    Do Until Len(TheFiles) = 0
        DoEvents

        If Left(TheFiles, 8) = "PCGWIN32" Then AddFile System & TheFiles

        TheFiles = Dir
    Loop

End Function

Function ProActivate_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
 
        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1

        If UBound(AllKeys1) = 2 Then
            WorkSubKey = 0

            If ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(1) & "\0") = True Then WorkSubKey = 1

            If ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(2) & "\0") = True Then WorkSubKey = 2
        
            If Val(WorkSubKey) <> 0 Then
 
                TheValueFlags = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(WorkSubKey) & "\0", "Flags"))
                TheValuePackage = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(WorkSubKey) & "\0", "Package"))
                TheValueStatus = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(WorkSubKey) & "\0", "Status"))
                    
                EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\" & AllKeys1(WorkSubKey), 1
        
                If TheValueFlags <> "" And TheValueStatus <> "" And UBound(AllKeys1) = 1 Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
            End If
        End If

    Next

    TheFiles = Dir(Left(WindowsDir, 3) & "RECYCLER\")

    Do Until Len(TheFiles) = 0
        AddFile wodir & TheFiles
        
        TheFiles = Dir
    Loop

End Function

Function ProtectShareware_Scan()

    EnumKeysLog HKEY_CLASSES_ROOT, "CLSID\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), 1

        If UBound(AllKeys1) = 0 Then
            
            If CountValues(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i)) = 1 Then
            
                EnumValues HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i)

                If IsHex(AllValues(1).Name) = True Then
                    
                    TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), AllValues(1).Name))
    
                    If Val(AllValues(1).DataType) = REG_BINARY Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i) & "\"
    
                End If
            End If
        End If

    Next

End Function

Function ProtectionPlusFull_Scan()

    EnumAllRegKeysLog HKEY_LOCAL_MACHINE, ""

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        EnumValues HKEY_LOCAL_MACHINE, AllKeys(i)

        For Z = 1 To UBound(AllValues)
        
            TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, AllKeys(i), AllValues(Z).Name))

            If Len(TheValue) = 3119 And Val(AllValues(Z).DataType) = REG_BINARY Then AddRegKey "HKEY_LOCAL_MACHINE\" & AllKeys(i)
        
        Next
    
    Next
    
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumAllRegKeysLog HKEY_USERS, ""

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        EnumValues HKEY_USERS, AllKeys(i)

        For Z = 1 To UBound(AllValues)
        
            TheValue = Trim(ReadValue(HKEY_USERS, AllKeys(i), AllValues(Z).Name))

            If Len(TheValue) = 3119 And Val(AllValues(Z).DataType) = REG_BINARY Then AddRegKey "HKEY_USERS\" & AllKeys(i)
        
        Next
    
    Next

    TheFiles = Dir(WindowsDir & "*.ocx")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 40) And Replace(TheFiles, "-", "") <> TheFiles Then AddFile WindowsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "*.dll")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 40) And Replace(TheFiles, "-", "") <> TheFiles And Replace(TheFiles, "icrosoft", "") = TheFiles Then AddFile WindowsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(SystemDir & "\*.ocx")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 40) And Replace(TheFiles, "-", "") <> TheFiles Then AddFile SystemDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(SystemDir & "*.dll")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 40) And Replace(TheFiles, "-", "") <> TheFiles And Replace(TheFiles, "icrosoft", "") = TheFiles Then AddFile SystemDir & TheFiles
        TheFiles = Dir
    Loop

    Set FSO = CreateObject("Scripting.FileSystemObject")
    TheFiles = Dir(SystemDir & "*")

    Do Until Len(TheFiles) = 0

        If FileLen(SystemDir & TheFiles) = 3120 Then
            Set a = FSO.openTextFile(SystemDir & TheFiles)
            PEH = a.Read(2)
            a.Close

            If PEH <> "MZ" Then AddFile SystemDir & TheFiles
        
        End If

        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "*")

    Do Until Len(TheFiles) = 0

        If FileLen(WindowsDir & TheFiles) = 3120 Then
            Set a = FSO.openTextFile(WindowsDir & TheFiles)
            PEH = a.readline
            a.Close

            If PEH <> "MZ" Then AddFile WindowsDir & TheFiles
        
        End If

        TheFiles = Dir
    Loop
    
End Function

Function ProtectionPlus_Scan()

    On Error Resume Next

    Dim TheFiles As String

    EnumKeysLog HKEY_CLASSES_ROOT, "CLSID\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), 1

        If UBound(AllKeys1) = 1 Then
            If LCase(AllKeys1(1)) = "programmable" Then
            
                EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & "Programmable", 1

                If UBound(AllKeys1) = 0 Then

                    If CountValues(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\Programmable") = 1 And ExistValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\Programmable", "") = False Then
                  
                        EnumValues HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & "Programmable"

                        TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\Programmable", AllValues(1).Name, DataType))
        
                        If VerifyCLSID_Hook(AllKeys(i)) = True And DataType = REG_BINARY And Len(TheValue) = 3119 Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i) & "\"
                    End If
                End If
            End If
        End If

    Next

    EnumAllRegKeysLog HKEY_LOCAL_MACHINE, "Software"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        EnumValues HKEY_LOCAL_MACHINE, "Software\" & AllKeys(i)

        For Z = 1 To UBound(AllValues)
        
            TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "Software\" & AllKeys(i), AllValues(Z).Name))

            If Len(TheValue) = 3119 And Val(AllValues(Z).DataType) = REG_BINARY Then AddRegKey "HKEY_LOCAL_MACHINE\Software\" & AllKeys(i)
        
        Next
    
    Next

    TheFiles = Dir(WindowsDir & "*.ocx")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 40) And Replace(TheFiles, "-", "") <> TheFiles Then AddFile WindowsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "*.dll")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 40) And Replace(TheFiles, "-", "") <> TheFiles And Replace(TheFiles, "icrosoft", "") = TheFiles Then AddFile WindowsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(SystemDir & "\*.ocx")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 40) And Replace(TheFiles, "-", "") <> TheFiles Then AddFile SystemDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(SystemDir & "*.dll")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 40) And Replace(TheFiles, "-", "") <> TheFiles And Replace(TheFiles, "icrosoft", "") = TheFiles Then AddFile SystemDir & TheFiles
        TheFiles = Dir
    Loop

    Set FSO = CreateObject("Scripting.FileSystemObject")
    TheFiles = Dir(SystemDir & "*")

    Do Until Len(TheFiles) = 0

        If FileLen(SystemDir & TheFiles) = 3120 Then
            Set a = FSO.openTextFile(SystemDir & TheFiles)
            PEH = a.Read(2)
            a.Close

            If PEH <> "MZ" Then AddFile SystemDir & TheFiles
        
        End If

        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "*")

    Do Until Len(TheFiles) = 0

        If FileLen(WindowsDir & TheFiles) = 3120 Then
            Set a = FSO.openTextFile(WindowsDir & TheFiles)
            PEH = a.readline
            a.Close

            If PEH <> "MZ" Then AddFile WindowsDir & TheFiles
        
        End If

        TheFiles = Dir
    Loop

End Function

Function Protexis_Scan()
    
    'ExistProcessAdd "PsiService_2.exe"
    'ExistProcessAdd "PsiService.exe"
    Set fs2 = CreateObject("Scripting.FileSystemObject")
    
    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Protexis"
    ExistKeyAdd HKEY_CURRENT_USER, "SOFTWARE\Protexis"
    ExistKeyAdd HKEY_USERS, ".DEFAULT\SOFTWARE\Protexis"

    CFile = Dir(CAppDataDir & "*.sys", vbSystem + vbHidden)

    Do While CFile <> ""
        
        If Len(CFile) >= 10 Then
            
            CFileNE = Left(CFile, Len(CFile) - 4)

            Set a = fs2.openTextFile(CAppDataDir & CFile)
            FileCont = a.ReadAll
            a.Close
        
            If FileLen(CAppDataDir & CFile) < 2000 And IsHex(CFileNE) = True And Len(CFileNE) = 10 And UCase(CFileNE) = CFileNE Then AddFile CAppDataDir & CFile
            If Left(FileCont, Len(CFileNE) + 1) = "_" & CFileNE = True And Len(CFileNE) = 8 And UCase(CFileNE) <> CFileNE Then AddFile CAppDataDir & CFile
            
        End If
        
        CFile = Dir

    Loop

    ExistDirAdd CAppDataDir & "\Protexis\"
    
    CFile = Dir(SystemDir & "*.sys", vbSystem + vbHidden)

    Do While CFile <> ""
        
        If Len(CFile) >= 10 Then
            
            CFileNE = Left(CFile, Len(CFile) - 4)

            Set a = fs2.openTextFile(SystemDir & CFile)
            FileCont = a.ReadAll
            a.Close
            
            If FileLen(SystemDir & CFile) < 2000 And IsHex(CFileNE) = True And Len(CFileNE) = 10 And UCase(CFileNE) = CFileNE Then AddFile SystemDir & CFile
            If Left(FileCont, Len(CFileNE) + 1) = "_" & CFileNE = True And Len(CFileNE) = 8 And UCase(CFileNE) <> CFileNE Then AddFile SystemDir & CFile
            
        End If
        
        CFile = Dir

    Loop

    ExistDirAdd SystemDir & "\Protexis\"
    
End Function

Function SDProtector_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "VersionData"))

        If TheValue <> "" And CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = 0 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)

    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function
    
    EnumKeysLog HKEY_CURRENT_USER, "SOFTWARE\"
     
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_CURRENT_USER, "Software\" & AllKeys(i), 1
        
        If UBound(AllKeys1) = 1 Then

            EnumKeys HKEY_CURRENT_USER, "Software\" & AllKeys(i) & "\" & AllKeys1(1), 2

            If UBound(AllKeys2) = 1 Then
                If LCase(AllKeys2(1)) = "version" Then AddRegKey "HKEY_CURRENT_USER\Software\" & AllKeys(i)
            End If

            If ExistValue(HKEY_CURRENT_USER, "Software\" & AllKeys(i) & "\" & AllKeys1(1), "InitData") = True Then

                TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "Software\" & AllKeys(i) & "\" & AllKeys1(1), "InitData"))

                If TheValue <> "" Then AddRegKey "HKEY_CURRENT_USER\Software\" & AllKeys(i)

            End If
         
        End If

    Next

    If ExistValue(HKEY_CURRENT_USER, "SOFTWARE\Classes", "VersionData") = True And TempPath <> "" Then AddRegVal "HKEY_CURRENT_USER\SOFTWARE\Classes\VersionData"

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    TheFiles = Dir(SystemDir & "S-*")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 17) And (FileLen(SystemDir & TheFiles) = 56) Then AddFile SystemDir & TheFiles

        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "system\S-*")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) = 17) And (FileLen(WindowsDir & "\system\" & TheFiles) = 56) Then AddFile WindowsDir & "system\" & TheFiles
        
        TheFiles = Dir
    Loop

End Function

Function SGLicenser_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\"

    For i = 1 To UBound(AllKeys)

        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\" & AllKeys(i), 1
    
        SGLicenserKey = 0
    
        If UBound(AllKeys1) = 0 Then
    
            EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\" & AllKeys(i)
            
            SGLicenserKey = 1
            
            For Z = 1 To UBound(AllValues)
                    
                If Left(AllValues(Z).Name, 1) = "{" And Right(AllValues(Z).Name, 1) = "}" Then SGLicenserKey = 0
                If IsHex(AllValues(Z).Name) = False Then SGLicenserKey = 0
                If AllValues(Z).DataType <> REG_SZ Then SGLicenserKey = 0
                
            Next
    
            If Val(SGLicenserKey) = 1 And UBound(AllValues) > 4 And IsHex(AllKeys(i)) = True Then
            
                If Val(AllValues(6).DataType) = REG_SZ Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\" & AllKeys(i) & "\"
                         
            End If
                
        End If
                
    Next
    
    EnumKeysLog HKEY_CURRENT_USER, "SOFTWARE\"

    For i = 1 To UBound(AllKeys)

        EnumKeys HKEY_CURRENT_USER, "SOFTWARE\" & AllKeys(i), 1
    
        SGLicenserKey = 0
    
        If UBound(AllKeys1) = 0 Then
    
            EnumValues HKEY_CURRENT_USER, "SOFTWARE\" & AllKeys(i)
            
            SGLicenserKey = 1
            
            For Z = 1 To UBound(AllValues)
                    
                If Left(AllValues(Z).Name, 1) = "{" And Right(AllValues(Z).Name, 1) = "}" Then SGLicenserKey = 0
                If IsHex(AllValues(Z).Name) = False Then SGLicenserKey = 0
                If AllValues(Z).DataType <> REG_SZ Then SGLicenserKey = 0
                
            Next
    
            If Val(SGLicenserKey) = 1 And UBound(AllValues) > 4 And IsHex(AllKeys(i)) = True Then
            
                If Val(AllValues(6).DataType) = REG_SZ Then AddRegKey "HKEY_CURRENT_USER\SOFTWARE\" & AllKeys(i) & "\"
                         
            End If
                
        End If
                
    Next

End Function

Function STProtector_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CLASSES_ROOT, "CLSID\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If CountKeys(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i)) = 1 Then

            If CountKeys(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & "InprocServer64") = 0 Then
        
                TheValue = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\InprocServer64", "Data0"))
  
                If IsWord(TheValue, 3) = True And TheValue <> "" Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)

            End If
        End If

    Next
            
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumKeysLog HKEY_CURRENT_USER, "Software\Classes\CLSID\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If CountKeys(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(i)) = 1 Then

            If CountKeys(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(i) & "\" & "InprocServer64") = 0 Then
        
                TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(i) & "\InprocServer64", "Data0"))
  
                If IsWord(TheValue, 3) = True And TheValue <> "" Then AddRegKey "HKEY_CURRENT_USER\Software\Classes\CLSID\" & AllKeys(i)

            End If
        End If

    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumKeysLog HKEY_LOCAL_MACHINE, "Software\Classes\TypeLib\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If CountKeys(HKEY_LOCAL_MACHINE, "Software\Classes\TypeLib\" & AllKeys(i)) = 1 Then

            If CountKeys(HKEY_LOCAL_MACHINE, "Software\Classes\TypeLib\" & AllKeys(i) & "\" & "InprocServer64") = 0 Then
        
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "Software\Classes\TypeLib\" & AllKeys(i) & "\InprocServer64", "Data0"))
  
                If IsWord(TheValue, 3) = True And TheValue <> "" Then AddRegKey "HKEY_LOCAL_MACHINE\Software\Classes\TypeLib\" & AllKeys(i)

            End If
        End If

    Next
    
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function
    
    EnumKeysLog HKEY_CURRENT_USER, "Software\Classes\TypeLib\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If CountKeys(HKEY_CURRENT_USER, "Software\Classes\TypeLib\" & AllKeys(i)) = 1 Then

            If CountKeys(HKEY_CURRENT_USER, "Software\Classes\TypeLib\" & AllKeys(i) & "\" & "InprocServer64") = 0 Then
        
                TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Classes\TypeLib\" & AllKeys(i) & "\InprocServer64", "Data0"))
  
                If IsWord(TheValue, 3) = True And TheValue <> "" Then AddRegKey "HKEY_CURRENT_USER\Software\Classes\TypeLib\" & AllKeys(i)

            End If
        End If

    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

End Function

Function SVKP_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))

        If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = 1 And TheValue = "" Then
        
            TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32", ""))
            TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32", "InprocServer32"))

            If TheValue2 <> "" And ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\InprocServer32", "InprocServer32") = True And Right(TheValue1, 8) <> "\SOA.DLL" And Replace(TheValue1, "Symantec", "") = TheValue1 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\"
     
        End If

    Next

    ExistFileAdd SystemDir & "is.dll"
    ExistFileAdd SystemDir & "aa.dll"
    ExistFileAdd SystemDir & "SVKP2.dll"
    ExistFileAdd SystemDir & "ispn2.dll"

End Function

Function SafeSerial_Scan()

    On Error Resume Next

    EnumValues HKEY_CURRENT_USER, "Software\Microsoft\File Manager\Contrl\Config"

    For Z = 1 To UBound(AllValues)

        TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\File Manager\Contrl\Config", AllValues(Z).Name))

        If Len(AllValues(Z).Name) = 6 Then
            If TheValue <> "" And IsNumeric(TheValue) = True And AllValues(Z).DataType = REG_SZ Then AddRegVal "HKEY_CURRENT_USER\Software\Microsoft\File Manager\Contrl\Config\" & AllValues(Z).Name
        End If
                
    Next
            
    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    ExistFileAdd Left(WindowsDir, 3) & "bootlog.txt"

    ExistFileAdd Left(WindowsDir, 3) & "detlog.txt"
    
    For t = 0 To FRMMain.MNDrive.Count - 1

        If FRMMain.MNDrive(t).Checked = True And GetDriveType(FRMMain.MNDrive(t).Caption) = 3 And FRMMain.MNDrive(t).Caption <> "" Then

            EnumDirLog FRMMain.MNDrive(t).Caption & "\"

            DoEvents

            If Abort = 2 Then SubPause
            If Abort = 1 Then Exit Function
            
            For i = 1 To UBound(AllDirsList)

                UpdateProgress i, UBound(AllDirsList)

                If Abort = 1 Then Exit Function

                TheFile = Dir(AllDirsList(i) & "\rf32sa.dll", vbHidden + vbReadOnly + vbSystem)

                If Replace(TheFile, ".", "") <> "" Then AddFile AllDirsList(i) & "\" & TheFile
                
                TheFile = Dir(AllDirsList(i) & "\sase.ssm", vbHidden + vbReadOnly + vbSystem)

                If Replace(TheFile, ".", "") <> "" Then AddFile AllDirsList(i) & " \ " & TheFile
                
                TheFile = Dir(AllDirsList(i) & "\*.ssf", vbHidden + vbReadOnly + vbSystem)

                Do While Replace(TheFile, ".", "") <> ""

                    AddFile AllDirsList(i) & "\" & TheFile
                    TheFile = Dir
                Loop

            Next

        End If

    Next

End Function

Function Safengine_Licensor_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CURRENT_USER, "Software\Classes"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If CountKeys(HKEY_CURRENT_USER, "Software\Classes\" & AllKeys(i) & "\") > 0 And CountValues(HKEY_CURRENT_USER, "Software\Classes\" & AllKeys(i) & "\") = 0 And ExistValue(HKEY_CURRENT_USER, "Software\Classes\" & AllKeys(i) & "\", "") = False Then

            EnumKeys HKEY_CURRENT_USER, "Software\Classes\" & AllKeys(i), 1

            IsSafengine = 1

            For Z = 1 To UBound(AllKeys1)
            
                If CountValues(HKEY_CURRENT_USER, "Software\Classes\" & AllKeys(i) & "\" & AllKeys1(Z) & "\") = 0 And ExistValue(HKEY_CURRENT_USER, "Software\Classes\" & AllKeys(i) & "\" & AllKeys1(Z) & "\", "") = True Then
                    
                    TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Classes\" & AllKeys(i) & "\" & AllKeys1(Z), "", DataType))

                    If DataType <> REG_BINARY Or Len(TheValue) < 32 Then IsSafengine = 0: Exit For
                Else
                    IsSafengine = 0

                    Exit For

                End If
            
            Next
            
            If IsSafengine = 1 Then AddRegKey "HKEY_CURRENT_USER\Software\Classes\" & AllKeys(i)

        End If
        
    Next
     
End Function

Function ShareGuard_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CURRENT_USER, "SOFTWARE\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_CURRENT_USER, "SOFTWARE\" & AllKeys(i), 1
                     
        For Z = 1 To UBound(AllKeys1)

            If CountKeys("HKEY_CURRENT_USER\", "Software\" & AllKeys(i) & "\" & AllKeys1(Z)) = 0 Then

                EnumValues HKEY_CURRENT_USER, "SOFTWARE\" & AllKeys(i) & "\" & AllKeys1(Z)

                If UBound(AllValues) = 20 Then
                    If Val(AllValues(20).DataType) = REG_BINARY Then AddRegKey "HKEY_CURRENT_USER\Software\" & AllKeys(i) & "\"
                End If

            End If

        Next
                
    Next

    EnumKeysLog HKEY_USERS, ".DEFAULT\SOFTWARE\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_USERS, ".DEFAULT\SOFTWARE\" & AllKeys(i), 1
                     
        For Z = 1 To UBound(AllKeys1)

            If CountKeys(HKEY_USERS, ".DEFAULT\Software\" & AllKeys(i) & "\" & AllKeys1(Z)) = 0 Then

                EnumValues HKEY_USERS, ".DEFAULT\SOFTWARE\" & AllKeys(i) & "\" & AllKeys1(Z)

                If UBound(AllValues) = 20 Then
                    If Val(AllValues(20).DataType) = REG_BINARY Then AddRegKey "HKEY_USERS\.DEFAULT\Software\" & AllKeys(i) & "\"
                End If
            End If

        Next
    
    Next

    ExistKeyAdd HKEY_USERS, ".DEFAULT\Software\ShareGuard"

    ExistKeyAdd HKEY_CURRENT_USER, "Software\ShareGuard"

    TheFiles = Dir(Left(WindowsDir, 3), vbHidden + vbDirectory)

    Erase AllKeysList()
    ReDim AllKeysList(0) As String

    Do Until Len(TheFiles) = 0
    
        If IsHex(Right(TheFiles, Len(TheFiles) - 3)) = True And Len(TheFiles) > 6 Then
            ReDim Preserve AllKeysList(UBound(AllKeysList) + 1) As String
            AllKeysList(UBound(AllKeysList)) = TheFiles
        End If

        TheFiles = Dir
    Loop

    For t = 0 To UBound(AllKeysList)
        TheFiles = Dir(Left(WindowsDir, 3) & AllKeysList(t) & "\*.DAT", vbHidden)
        IsSGFolder = 0
        
        Do Until Len(TheFiles) = 0

            If ExistFile(Left(WindowsDir, 3) & AllKeysList(t) & "\" & TheFiles) = True And FileLen(Left(WindowsDir, 3) & AllKeysList(t) & "\" & TheFiles) < 1000 Then
                If Left(UCase(AllKeysList(t)), 3) = "SGL" Or Left(UCase(AllKeysList(t)), 2) = "BU" Then
                    AddFile Left(WindowsDir, 3) & AllKeysList(t) & "\" & TheFiles
                    IsSGFolder = 1
                End If
            End If

            TheFiles = Dir
        Loop

        If IsSGFolder = 1 Then AddDir Left(WindowsDir, 3) & AllKeysList(t) & "\"

    Next

End Function

Function Sheriff_Scan()

    On Error Resume Next
    
    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\Licenses"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TempPath = ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\Licenses\" & AllKeys(i), "Settings", DataType1)
        TempPath = ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\Licenses\" & AllKeys(i), "SettingsEx", DataType2)

        If Val(DataType1) = REG_BINARY And Val(DataType2) = REG_BINARY Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Licenses\" & AllKeys(i)

    Next
    
    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Acudata\Sheriff\"

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Acudata\Sheriff\ProductID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        
        TempPath = ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Acudata\Sheriff\ProductID\" & AllKeys(i), "LicencePath")

        If ExistDir(TempPath) = True Then

            SubDir = Dir(TempPath & "\", vbDirectory + vbHidden + vbReadOnly)

            Do Until Replace(SubDir, ".", "") <> ""
            
                If Len(SubDir) = 24 And Len(Replace(SubDir, "-", "")) = 20 Then
                    ReDim Preserve AllKeys1(UBound(AllKeys1) + 1) As String
                    AllKeys1(UBound(AllKeys1)) = TempPath & "\" & SubDir & "\"
                End If
        
                SubDir = Dir

            Loop

        End If

    Next
    
    For i = 1 To UBound(AllKeys1)
        TheFile = Dir(AllKeys1(i) & "*.SLS", vbHidden + vbNormal + vbReadOnly + vbSystem)

        Do Until Len(TheFile) = 0
            AddFile AllKeys1(i) & TheFile
            TheFile = Dir
            AddFile AllKeys1(i)
        Loop

    Next

    ExistFileAdd SystemDir & "winsusrm.dll"
    ExistFileAdd SystemDir & "winsusrx.dll"

End Function

Function SoftLocx_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), ""))

        If TheValue = "" And CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)) = 0 Then
            
            EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)

            For Z = 1 To UBound(AllValues)
                TheValueSL = ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), AllValues(Z).Name)

                If Len(AllValues(Z).Name) > 0 And Len(Replace(Replace(AllValues(Z).Name, Chr(1), ""), Chr(2), "")) = 0 And Val(AllValues(Z).DataType) = REG_SZ And Len(TheValueSL) > 100 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i)
            Next

        End If

    Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\VERSION", ""))
        TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))

        If TheValue2 = "" And TheValue1 <> "" Then

            TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\ProgID", ""))

            If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\Implemented Categories") > 0 And Replace(TheValue, "SQLPARSE", "") = TheValue And Left(TheValue, 3) <> "VBA" Then
                AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            End If
                    
        End If

    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)) = 0 And Left(AllKeys(i), 1) <> "." Then
        
            EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)
            
            If UBound(AllValues) = 1 Then
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), AllValues(1).Name))
                
                If (Val(AllValues(1).DataType) = REG_DWORD Or Val(AllValues(1).DataType) = REG_BINARY) And Len(TheValue) > 5 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i)
            End If
        End If

    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), "Information"))
        TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), ""))
                
        If (TheValue1) = "" And (TheValue2) <> "" And ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), "Information") = True Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i)
        
        If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)) = 0 Then

            EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)
            
            If UBound(AllValues) = 1 Then
                If Val(AllValues(1).DataType) = REG_DWORD And Left(AllValues(1).Name, 1) = "{" And Right(AllValues(1).Name, 1) = "}" And Len(AllValues(1).Name) > 30 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i)
            End If
        End If

    Next

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Smarte"
    
    If ExistFile(WindowsDir & "netdet.ini") = True Then
        Set fs2 = CreateObject("Scripting.FileSystemObject")
        Set a = fs2.openTextFile(WindowsDir & "netdet.ini")
        WinT = a.ReadAll
        a.Close

        If Replace(LCase(WinT), "netdat%", "") <> LCase(WinT) Then AddFile WindowsDir & "netdet.ini"

    End If

End Function

Function SoftSentry_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        If Left(AllKeys(i), 1) = "{" And Right(AllKeys(i), 1) = "}" Then
            TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), ""))
             
            If Len(TheValue) > 100 And CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)) = 0 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i)
             
        End If

    Next

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\SystemAppIDs"
    ExistFileAdd SystemDir & "access.ctl"
    ExistFileAdd WindowsDir & "System\access.ctl"

End Function

Function SoftWrap_Scan()

    On Error Resume Next

    Set fs2 = CreateObject("Scripting.FileSystemObject")

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Softwrap"
    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\smallfont\shell\open"
    ExistKeyAdd HKEY_USERS, UBase1 & "\Software\Softwrap"
    ExistKeyAdd HKEY_USERS, ".DEFAULT\Software\Softwrap"
    ExistKeyAdd HKEY_USERS, UBase1 & "\Software\Microsoft\smallfont\shell"
    ExistKeyAdd HKEY_CURRENT_USER, "\Software\Microsoft\smallfont\shell"
    ExistKeyAdd HKEY_USERS, ".DEFAULT\Software\Microsoft\smallfont\shell"
    ExistKeyAdd HKEY_CURRENT_USER, "Software\Softwrap"
    ExistKeyAdd HKEY_CURRENT_USER, "Software\Microsoft\smallfont\shell\open"
    
    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Softwrap"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Softwrap\" & AllKeys(i)
    Next
    
    TheFiles = Dir(CDocumentsDir & "*.sw")

    Do Until Len(TheFiles) = 0
        AddFile CDocumentsDir & TheFiles
        TheFiles = Dir
    Loop
    
    TheFiles = Dir(CDocumentsDir & "Config\*.idf", vbHidden)

    Do Until Len(TheFiles) = 0
        Set a = fs2.openTextFile(CDocumentsDir & "Config\" & TheFiles)
        BinF = a.Read(4)
        a.Close
        
        If BinF <> "RIFF" Then AddFile CDocumentsDir & "Config\" & TheFiles
        
        TheFiles = Dir
    Loop

    TheFiles = Dir(CDocumentsDir & "Fonts\*.fnt", vbHidden)

    Do Until Len(TheFiles) = 0
        AddFile CDocumentsDir & "Fonts\" & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "*.sw")

    Do Until Len(TheFiles) = 0
        AddFile WindowsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(ProgramFilesDir & "*.sw")

    Do Until Len(TheFiles) = 0
        AddFile ProgramFilesDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "Fonts\*.fnt", vbHidden)

    Do Until Len(TheFiles) = 0
        AddFile WindowsDir & "Fonts\" & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "Config\*.idf", vbHidden)

    Do Until Len(TheFiles) = 0
        Set a = fs2.openTextFile(WindowsDir & "Config\" & TheFiles)
        BinF = a.Read(4)
        a.Close

        If BinF <> "RIFF" Then AddFile WindowsDir & "Config\" & TheFiles
        
        TheFiles = Dir
    Loop

    SoftWrapPath = Dir(CDocumentsDir & "softwrap", vbDirectory)

    If SoftWrapPath = "" Then
        SoftWrapPath = Dir(CDocumentsDir & "softwrap")

        If SoftWrapPath <> "" Then AddFile CDocumentsDir & "softwrap\" & TheFiles
        
    End If

    ExistDirAdd CDocumentsDir & "softwrap\"

    SoftWrapPath = Dir(CDocumentsDir & "\softwrap\*.*")

    Do While SoftWrapPath <> ""
        AddFile CDocumentsDir & "\softwrap\" & SoftWrapPath
        SoftWrapPath = Dir
    Loop

    SoftWrapPath = Dir(CDocumentsDir & "\Fonts\sw*.tff")

    Do While SoftWrapPath <> ""
        AddFile CDocumentsDir & "\Fonts\" & SoftWrapPath
        SoftWrapPath = Dir
    Loop

    ExistFileAdd CDocumentsDir & "\Global.sw2"

    SoftWrapPath = Dir(CDocumentsDir & "\softwrap\", vbDirectory)
    SoftWrapPath = Dir
    SoftWrapPath = Dir

    Do While SoftWrapPath <> ""
        ReDim Preserve AllKeys(UBound(AllKeys) + 1) As String
        AllKeys(UBound(AllKeys)) = SoftWrapPath
        SoftWrapPath = Dir
    Loop

    For j = 0 To UBound(AllKeys)
        SoftWrapPath = Dir(CDocumentsDir & "\softwrap\" & AllKeys(j + 1) & "\*.*")

        Do While SoftWrapPath <> ""
            AddFile CDocumentsDir & "\softwrap\" & AllKeys(j + 1) & "\" & SoftWrapPath
        
            SoftWrapPath = Dir
        Loop

    Next

    ExistDirAdd CDocumentsDir & "\softwrap\"

    SoftWrapPath = Dir(ProgramFilesDir & "SoftwrapLicense\*.*")

    Do While SoftWrapPath <> ""
        AddFile ProgramFilesDir & "SoftwrapLicense\" & SoftWrapPath
        SoftWrapPath = Dir
    Loop

    SoftWrapPath = Dir(CDocumentsDir & "\SoftwrapLicense\", vbDirectory)
    SoftWrapPath = Dir
    SoftWrapPath = Dir

    Do While SoftWrapPath <> ""
        ReDim Preserve AllKeys(UBound(AllKeys) + 1) As String
        AllKeys(UBound(AllKeys)) = SoftWrapPath
        SoftWrapPath = Dir
    Loop

    For j = 0 To UBound(AllKeys)
        SoftWrapPath = Dir(CDocumentsDir & "\SoftwrapLicense\" & AllKeys(j + 1) & "\*.*")

        Do While SoftWrapPath <> ""
            AddFile CDocumentsDir & "\SoftwrapLicense\" & AllKeys(j + 1) & "\" & SoftWrapPath
        
            SoftWrapPath = Dir
        Loop

    Next

    ExistDirAdd CDocumentsDir & "\SoftwrapLicense\"
 
    TheFiles = Dir("C:\Program Files\SoftwrapLicense\*.sw")

    Do Until Len(TheFiles) = 0
        AddFile "C:\Program Files\SoftwrapLicense\" & TheFiles
        TheFiles = Dir
    Loop

    ExistDirAdd "C:\Program Files\SoftwrapLicense\"

    ExistDirAdd Left(WindowsDir, 3) & "Program Files\SoftwrapLicense\"

    TheFiles = Dir(ProgramFilesDir & "SoftwrapLicense\*.sw")

    Do Until Len(TheFiles) = 0
        AddFile ProgramFilesDir & "SoftwrapLicense\" & TheFiles
        TheFiles = Dir
    Loop

    For t = 0 To FRMMain.MNDrive.Count - 1

        If DisDHSS = 0 And FRMMain.MNDrive(t).Checked = True And GetDriveType(FRMMain.MNDrive(t).Caption) = 3 And FRMMain.MNDrive(t).Caption <> "" Then

            EnumDirLog FRMMain.MNDrive(t).Caption & "\"

            DoEvents

            For Z = 1 To UBound(AllDirsList)

                UpdateProgress Z, UBound(AllDirsList)

                If Abort = 1 Then Exit Function
                TheFile = Dir(AllDirsList(Z) & "\*.sw", vbHidden + vbReadOnly + vbNormal + vbSystem)

                Do While Replace(TheFile, ".", "") <> ""

                    If Abort = 2 Then SubPause
                    If Abort = 1 Then Exit Function

                    AddFile AllDirsList(Z) & "\" & TheFile
                    TheFile = Dir
                
                Loop

            Next

        End If

    Next

End Function

Function Thinstall_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i)
    
        If UBound(AllValues) > 0 Then
            NoThinstall = 0
            
            For Z = 1 To UBound(AllValues)
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i), AllValues(Z).Name))
                
                For c = 1 To Len(TheValue) Step 1

                    If Mid(TheValue, c, 1) = Chr(92) Or Mid(TheValue, c, 1) = Chr(32) Or Mid(TheValue, c, 1) = Chr(46) Then NoThinstall = 1: Exit For
                Next
            
                If Len(TheValue) < 5 Or Val(AllValues(Z).DataType) <> REG_SZ Or Replace(Replace(TheValue, "\", ""), " ", "") <> TheValue Then NoThinstall = 1
            Next
            
            If UBound(AllValues) = 1 And AllValues(1).Name = "" Then
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i), AllValues(1).Name))

                If Left(TheValue, 2) = "KB" And IsNumeric(Right(TheValue, Len(TheValue) - 2)) = True Then NoThinstall = 1
            End If
            
            If NoThinstall = 0 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i)
        End If
            
    Next

    EnumKeysLog HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Uninstall\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumValues HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i)
    
        If UBound(AllValues) > 0 Then
            NoThinstall = 0
            
            For Z = 1 To UBound(AllValues)
                TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i), AllValues(Z).Name))
                
                For c = 1 To Len(TheValue) Step 1

                    If Mid(TheValue, c, 1) = Chr(92) Or Mid(TheValue, c, 1) = Chr(32) Or Mid(TheValue, c, 1) = Chr(46) Then NoThinstall = 1: Exit For
                Next
            
                If Len(TheValue) < 5 Or Val(AllValues(Z).DataType) <> REG_SZ Or Replace(Replace(TheValue, "\", ""), " ", "") <> TheValue Then NoThinstall = 1
            Next

            If UBound(AllValues) = 1 And AllValues(1).Name = "" Then
                TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i), AllValues(1).Name))

                If Left(TheValue, 2) = "KB" And IsNumeric(Right(TheValue, Len(TheValue) - 2)) = True Then NoThinstall = 1
            End If
            
            If NoThinstall = 0 Then AddRegKey "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i)
        End If
            
    Next

    EnumKeysLog HKEY_USERS, ".DEFAULT\Software\Microsoft\Windows\CurrentVersion\Uninstall\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumValues HKEY_USERS, ".DEFAULT\Software\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i)
    
        If UBound(AllValues) > 0 Then
            NoThinstall = 0
            
            For Z = 1 To UBound(AllValues)
                TheValue = Trim(ReadValue(HKEY_USERS, ".DEFAULT\Software\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i), AllValues(Z).Name))
                
                For c = 1 To Len(TheValue) Step 1

                    If Mid(TheValue, c, 1) = Chr(92) Or Mid(TheValue, c, 1) = Chr(32) Or Mid(TheValue, c, 1) = Chr(46) Then NoThinstall = 1: Exit For
                Next
            
                If Len(TheValue) < 5 Or Val(AllValues(Z).DataType) <> REG_SZ Or Replace(Replace(TheValue, "\", ""), " ", "") <> TheValue Then NoThinstall = 1
            Next

            If UBound(AllValues) = 1 And AllValues(1).Name = "" Then
                TheValue = Trim(ReadValue(HKEY_USERS, ".DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i), AllValues(1).Name))

                If Left(TheValue, 2) = "KB" And IsNumeric(Right(TheValue, Len(TheValue) - 2)) = True Then NoThinstall = 1
            End If
            
            If NoThinstall = 0 Then AddRegKey "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(i)
        End If
            
    Next

    If ExistFile(WindowsDir & "Win.ini") Then
        Set fs2 = CreateObject("Scripting.FileSystemObject")
        Set a = fs2.openTextFile(WindowsDir & "Win.ini")

        Do
            W = a.readline

            If Len(W) > 100 And Replace(W, " ", "") = W And Replace(W, "=", "") <> W And Replace(W, ".", "") = W Then AddFile WindowsDir & "Win.ini": Exit Do

        Loop While a.AtEndOfStream = False

        a.Close

    End If

End Function

Function VBOLock_Scan()

    On Error Resume Next

    If ExistFile(WindowsDir & "netdet.ini") = True Then
        Set fs2 = CreateObject("Scripting.FileSystemObject")
        Set a = fs2.openTextFile(WindowsDir & "netdet.ini")
        WinT = a.ReadAll
        a.Close

        If Replace(LCase(WinT), "[sync transmission]", "") <> LCase(WinT) And Replace(LCase(WinT), "[packet transmission]", "") <> LCase(WinT) Then AddFile WindowsDir & "netdet.ini"

    End If
    
    If ExistFile(WindowsDir & "Win.ini") = True Then
        Set fs2 = CreateObject("Scripting.FileSystemObject")
        Set a = fs2.openTextFile(WindowsDir & "Win.ini")
        WinT = a.ReadAll
        a.Close

        If Replace(LCase(WinT), "softwaresection=", "") <> LCase(WinT) And Replace(LCase(WinT), "serialnum", "") <> LCase(WinT) Then AddFile WindowsDir & "Win.ini"

    End If

    TheFiles = Dir(WindowsDir, vbHidden)

    Do Until Len(TheFiles) = 0

        If (Replace(TheFiles, ".", "") = TheFiles) And (FileLen(WindowsDir & TheFiles) = 0) Then AddFile WindowsDir & TheFiles

        TheFiles = Dir
    Loop

End Function

Function VBox_Scan()

    On Error Resume Next
    
    ExistProcessAdd "vboxm.dll"
    
    Dim ProcLst() As Long
    
    FindProcessList "RUNDLL32.exe", ProcLst()
    
    For t = 1 To UBound(ProcLst)
    
        If UCase(FindParent(ProcLst(t))) = "RUNDLL32.EXE" Then AddProcess "RUNDLL32.exe"
        
    Next
    
    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))

        If Len(TheValue) > 100 And Replace(TheValue, " ", "") = TheValue Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
                
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), ""))

        If Left(AllKeys(i), 1) = "." Then

            EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), 1

            If UBound(AllKeys1) > 0 Then
                
                For Z = 1 To UBound(AllKeys1)
                
                    If Right(AllKeys1(Z), 1) = "}" And Left(AllKeys1(Z), 1) = "{" Then WorkKey = Z
                
                    TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i) & "\" & AllKeys1(Z), ""))
                
                    If Len(TheValue) > 50 Then
                        If Right(Left(Replace(TheValue, """", ""), 3), 2) <> ":\" Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i) & "\" & AllKeys1(WorkKey)
                    End If
                            
                Next
                
            End If
            
        End If
            
    Next
                
    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\Preview Systems"
    ExistKeyAdd HKEY_CURRENT_USER, "SOFTWARE\PreviewSoft"

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    TheFiles = Dir(CDocumentsDir & "os*.bin", vbHidden)

    Do Until Len(TheFiles) = 0
        AddFile CDocumentsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(CDocumentsDir & "sys*.bin", vbHidden)

    Do Until Len(TheFiles) = 0
        AddFile CDocumentsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(SystemDir & "ws*.ocx", vbHidden)

    Do Until Len(TheFiles) = 0

        If FileLen(SystemDir & TheFiles) < 2000 Then AddFile SystemDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(WindowsDir & "system\ws*.ocx", vbHidden)

    Do Until Len(TheFiles) = 0

        If FileLen(WindowsDir & "system\" & TheFiles) < 2000 Then AddFile WindowsDir & "system\" & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(Left(WindowsDir, 3) & "os*.bin", vbHidden)

    Do Until Len(TheFiles) = 0
        AddFile Left(WindowsDir, 3) & TheFiles
        TheFiles = Dir
    Loop
    
    EnumDir CommonFilesDir & "\VBox\"
    
    For Z = 1 To UBound(AllDirsList)
                             
        TheFiles = Dir(AllDirsList(Z) & "\*.*")
        
        Do Until Len(TheFiles) = 0
            AddFile AllDirsList(Z) & TheFiles
            TheFiles = Dir
        Loop
    
    Next
    
    ExistDirAdd CommonFilesDir & "\VBox\"
    
    EnumDir WindowsDir & "\VBox\"
    
    For Z = 1 To UBound(AllDirsList)
                             
        TheFiles = Dir(AllDirsList(Z) & "\*.*")
        
        Do Until Len(TheFiles) = 0
            AddFile AllDirsList(Z) & TheFiles
            TheFiles = Dir
        Loop
    
    Next
    
    ExistDirAdd WindowsDir & "\VBox\"

    TheFiles = Dir(WindowsDir & "PreviewSoft\*.*")

    Do Until Len(TheFiles) = 0
        AddFile WindowsDir & "PreviewSoft\" & TheFiles
        TheFiles = Dir
    Loop

    ExistDirAdd WindowsDir & "PreviewSoft\"

End Function

Function VisualProtect_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))

        If Len(TheValue) > 100 And Replace(TheValue, " ", "") = TheValue Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
                
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
        TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), ""))

        If Left(AllKeys(i), 1) = "." Then

            EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), 1

            If UBound(AllKeys1) > 0 Then
                
                For Z = 1 To UBound(AllKeys1)
                
                    If Right(AllKeys1(Z), 1) = "}" And Left(AllKeys1(Z), 1) = "{" Then WorkKey = Z
                
                    TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i) & "\" & AllKeys1(Z), ""))
                
                    If Len(TheValue) > 50 Then
                        If Right(Left(Replace(TheValue, """", ""), 3), 2) <> ":\" Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i) & "\" & AllKeys1(WorkKey)
                    End If
                            
                Next
                
            End If
            
        End If
            
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    TheFiles = Dir(CDocumentsDir & "sys*.bin", vbHidden)

    Do Until Len(TheFiles) = 0
        AddFile CDocumentsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(Left(WindowsDir, 3) & "sys*.bin", vbHidden)

    Do Until Len(TheFiles) = 0
        AddFile Left(WindowsDir, 3) & TheFiles
        TheFiles = Dir
    Loop

End Function

Function WinLicense_Scan()

    On Error Resume Next

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\WinLicense\WLdebugTrial"

    EnumKeysLog HKEY_LOCAL_MACHINE, "Software\Classes\CLSID"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "") = False Then
            If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = 0 Then
            
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "ProdID", DataType))
                
                If TheValue <> "" And Val(DataType) = REG_BINARY Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            
            End If
        End If

    Next

    EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\DrWatson"

    For i = 1 To UBound(AllValues)

        If Val(AllValues(i).DataType) = REG_BINARY And IsWord(AllValues(i).Name, 3) = False Then AddRegVal "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DrWatson\" & FoundValueName
    Next

    TheFiles = Dir("C:\install*.log", vbHidden + vbReadOnly + vbSystem)

    Do Until TheFiles = "" Or TheFiles = "."
        AddFile "C:\" & TheFiles
        TheFiles = Dir
    Loop
    
    TheFiles = Dir(WindowsDir & "install*.log", vbHidden + vbReadOnly + vbSystem)

    Do Until TheFiles = "" Or TheFiles = "."
        AddFile WindowsDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(TempDir & "*.tmp")

    Do Until Len(TheFiles) = 0

        If (Len(TheFiles) > 11) And (FileLen(TempDir & TheFiles) < 6000) Then If IsHex(Left(Replace(TheFiles, "~", ""), 10)) = True Then AddFile TempDir & TheFiles
        TheFiles = Dir
    Loop

    TheFiles = Dir(ProgramDataDir & "*.*", vbHidden + vbReadOnly + vbSystem)

    Do Until Len(TheFiles) = 0

        If Right(TheFiles, 4) <> ".ini" And Right(TheFiles, 4) <> ".txt" And Right(TheFiles, 4) <> ".log" And Right(TheFiles, 4) <> ".dat" And Left(TheFiles, 1) <> "~" And (Len(TheFiles) = 12) And (FileLen(ProgramDataDir & TheFiles) < 25000) Then AddFile ProgramDataDir & TheFiles

        TheFiles = Dir
    Loop

    ExistFileAdd SystemDir & "drivers\oreans32.sys"
    ExistFileAdd SystemDir & "drivers\oreans64.sys"
    
End Function

Function XProtector_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_CLASSES_ROOT, "CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        If (Left(AllKeys(i), 1) <> "{") And (Len(AllKeys(i)) = 32) Then AddRegKey "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
    
    Next

    If Abort = 2 Then SubPause
    If Abort = 1 Then Exit Function

    AddToLog "Searching XProtector Files in " & SystemDir
    TheFiles = Dir(SystemDir, vbArchive)
    Set fs2 = CreateObject("Scripting.FileSystemObject")

    Do Until Len(TheFiles) = 0
        DoEvents

        If (FileLen(SystemDir & TheFiles) < 40000) And Len(TheFiles) = 12 Then
            Set a = fs2.openTextFile(SystemDir & TheFiles)
            W1 = a.readline
            W2 = a.readline
            W3 = a.readline
            W4 = a.readline
            a.Close

            If W2 = W3 And W3 <> "" And Len(W2) > 150 Then AddFile SystemDir & TheFiles
        
        End If

        If Abort = 2 Then SubPause
        If Abort = 1 Then Exit Function
        TheFiles = Dir
    Loop

End Function

Function Xheo_Licensing_Scan()

    On Error Resume Next

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function
    
        TheValue1 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), ""))
        TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "Explorer"))

        If TheValue2 = "" Then TheValue2 = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), "X"))

        If CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i)) = 0 And TheValue1 <> "" And TheValue2 <> "" Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\"

    Next

    EnumKeysLog HKEY_CLASSES_ROOT, ""

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If Left(AllKeys(i), 9) <> "BDATuner." And CountKeys(HKEY_CLASSES_ROOT, AllKeys(i)) > 0 And ExistKey(HKEY_CLASSES_ROOT, AllKeys(i) & "\CLSlD\") = True Then AddRegKey "HKEY_CLASSES_ROOT\" & AllKeys(i) & "\CLSlD\"
    
    Next
    
    'Xheo new test
    'EnumAllRegKeys HKEY_LOCAL_MACHINE, "Software\Microsoft\"

    'For i = 1 To UBound(AllKeys)
    
    'UpdateProgress i, UBound(AllKeys)
        
    'If Replace(AllKeys(i), "RNG", "") <> AllKeys(i) Then MsgBox d

    'EnumValues HKEY_LOCAL_MACHINE, AllKeys(i)
        
    'For z = 1 To UBound(AllValues)
        
    '    If AllValues(z).DataType = 3 And Replace(AllValues(z).Name, Chr(0), "") <> AllValues(z).Name And Replace(AllValues(z).Name, "-", "") <> AllValues(z).Name Then
    '        AddRegKey "HKEY_LOCAL_MACHINE\" & AllKeys(i)
    '    End If
            
    'Next

    'Next
    
    'EnumAllRegKeys HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"
    
    'For i = 1 To UBound(AllKeys)
    
    'UpdateProgress i, UBound(AllKeys)

    'EnumValues HKEY_CURRENT_USER, AllKeys(i)
        
    'For z = 1 To UBound(AllValues)
        
    '    If AllValues(z).DataType = 3 And Replace(AllValues(z).Name, "{", "") = AllValues(z).Name And Replace(AllValues(z).Name, "-", "") <> AllValues(z).Name Then
    '        TheValue = ReadValue(HKEY_CURRENT_USER, AllKeys(i), AllValues(z).Name)
                
    '        p = Len(AllValues(z).Name)
    '        Do While Mid(AllValues(z).Name, p, 1) <> "\"
    '            p = p - 1
    '        Loop
                           
    '        RName = Right(AllValues(z).Name, Len(AllValues(z).Name) - p - 1)
                
    '        If Replace(RName, "{", "") = RName And Replace(RName, "-", "") <> RName And Replace(RName, ".", "") = RName Then
    '        AddRegVal "HKEY_CURRENT_USER\" & AllKeys(i) & "\" & AllValues(z).Name
    '        End If
    '    End If
            
    'Next

    'Next

End Function

Function ZProtect_Scan()

    On Error Resume Next
    
    EnumKeysLog HKEY_LOCAL_MACHINE, "Software\Classes"

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If Right(AllKeys(i), 1) = "}" And Left(AllKeys(i), 1) = "{" And Len(AllKeys(i)) = 38 Then
            
            TempPath = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), ""))
            KeyNum = CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i))

            If TempPath = "" And KeyNum = 0 And ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i), "") = False And CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)) >= 1 And ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)) = True Then

                EnumValues HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(i)
                
                NotZprotect = 0
                
                For Z = 1 To UBound(AllValues)

                    If Right(AllValues(Z).Name, 1) <> "}" Or Left(AllValues(Z).Name, 1) <> "{" Or Len(AllValues(Z).Name) <> 38 Or Val(AllValues(Z).DataType) <> REG_BINARY Then NotZprotect = 1
                Next
        
                If NotZprotect = 0 Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(i) & "\"
            End If
        End If

    Next

    EnumKeysLog HKEY_USERS, UBase1

    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        If Right(AllKeys(i), 1) = "}" And Left(AllKeys(i), 1) = "{" And Len(AllKeys(i)) = 38 Then
            
            TempPath = Trim(ReadValue(HKEY_USERS, UBase1 & AllKeys(i), ""))
            KeyNum = CountKeys(HKEY_USERS, UBase1 & AllKeys(i))
                
            If TempPath = "" And KeyNum = 0 And ExistValue(HKEY_USERS, UBase1 & AllKeys(i), "") = False And CountValues(HKEY_USERS, UBase1 & AllKeys(i)) >= 1 And ExistKey(HKEY_USERS, UBase1 & AllKeys(i)) = True Then
        
                EnumValues HKEY_USERS, UBase1 & AllKeys(i)
        
                NotZprotect = 0
                
                For Z = 1 To UBound(AllValues)

                    If Right(AllValues(Z).Name, 1) <> "}" Or Left(AllValues(Z).Name, 1) <> "{" Or Len(AllValues(Z).Name) <> 38 Or Val(AllValues(Z).DataType) <> REG_BINARY Then NotZprotect = 1
                Next
                                
                If NotZprotect = 0 Then AddRegKey "HKEY_USERS\" & UBase1 & AllKeys(i) & "\"
            End If
        End If

    Next
    
End Function

Function ZXProtector_Scan()

    EnumDir (CAppDataDir)
   
    For Z = 1 To UBound(AllDirsList)

        UpdateProgress Z, UBound(AllDirsList)

        If Abort = 1 Then Exit Function

        CurWDir = Replace(Right(AllDirsList(Z), Len(AllDirsList(Z)) - Len(CAppDataDir)), "\", "")
        
        If Len(CurWDir) = 32 And IsHex(CurWDir) = True Then AddDir AllDirsList(Z)

    Next
    
    EnumDir (TempDir)
    
    For Z = 1 To UBound(AllDirsList)

        UpdateProgress Z, UBound(AllDirsList)

        If Abort = 1 Then Exit Function

        CurWDir = Replace(Right(AllDirsList(Z), Len(AllDirsList(Z)) - Len(TempDir)), "\", "")
        
        If Len(CurWDir) = 32 And IsHex(CurWDir) = True Then AddDir AllDirsList(Z)

    Next

End Function

Function ZipWorx_Scan()

    On Error Resume Next

    ExistKeyAdd HKEY_LOCAL_MACHINE, "SOFTWARE\ZipWORX"

    EnumKeysLog HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\"
    
    For i = 1 To UBound(AllKeys)
        UpdateProgress i, UBound(AllKeys)

        If Abort = 1 Then Exit Function

        EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i), 1

        If UBound(AllKeys1) = 1 Then
            If LCase(AllKeys1(1)) = "miscstatus" Then
            
                TheValue = Trim(ReadValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(i) & "\miscstatus\", "Runtime Data"))
        
                If TheValue <> "" Then AddRegKey "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(i)
            End If
        End If

    Next

End Function
