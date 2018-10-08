Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    SetPluginInfo "ABBYY License supported Software:" & vbCrLf & "-FineReader 9/10" & vbCrLf & "-PDF Transformer 3" & vbCrLf & "-ScreenshotReader" & vbCrLf & "-Lingvo x3" & vbCrLf & "-PDF Transformer" & vbCrLf & vbCrLf & "For complete the process restart the system"
    
    AddToLog "Searching ABBYY License trial keys"

    AddToListIfExist TRProcess, "ABBYY License", "NetworkLicenseServer.exe"

    EnumDir CAppDataDir & "ABBYY\"
    
    For T = 1 To UBound(AllDirsList)

        If ExistFile(AllDirsList(T) & "Licensing.cnt") = True Then AddToList TRFile, "ABBYY License", AllDirsList(T) & "Licensing.cnt"
        If ExistFile(AllDirsList(T) & "Licensing.bin") = True Then AddToList TRFile, "ABBYY License", AllDirsList(T) & "Licensing.bin"
        If ExistFile(AllDirsList(T) & "ProductLicensing.log") = True Then AddToList TRFile, "ABBYY License", AllDirsList(T) & "ProductLicensing.log"
    Next

    EnumKeys HKEY_CURRENT_USER, "Software\Classes\CLSID"
    
    For T = 1 To UBound(AllKeys)
    
        UpdateProgress T, UBound(AllKeys)
    
        If ExistKey(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories") = True And ExistValue(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(T), "") = True And ExistValue(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories", "") = False Then

            EnumKeys HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories", 1

            If UBound(AllKeys1) > 1 Then

                For z = 1 To UBound(AllKeys1)
                    
                    If Left(AllKeys1(z), 1) = "{" And Right(AllKeys1(z), 1) = "}" And Len(AllKeys1(z)) = 38 Then
                    
                        TheValue = ReadValue(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories\" & AllKeys1(z), "", Ktype)
                        
                        If Left(TheValue, 1) = "{" And Right(TheValue, 1) = "}" And Len(TheValue) = 38 And Ktype = REG_SZ Then
                            AddToList TRRegKey, "ABBYY License", "HKEY_CURRENT_USER\SOFTWARE\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories\" & AllKeys1(z)
                            HKLMBase = AllKeys(T)
                        End If
                    End If

                Next

            End If
        End If

    Next
    
    EnumKeys HKEY_LOCAL_MACHINE, "Software\Classes\CLSID"
    
    For T = 1 To UBound(AllKeys)
    
        UpdateProgress T, UBound(AllKeys)
    
        If ExistKey(HKEY_LOCAL_MACHINE, "Software\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories") = True And ExistValue(HKEY_LOCAL_MACHINE, "Software\Classes\CLSID\" & AllKeys(T), "") = True And ExistValue(HKEY_LOCAL_MACHINE, "Software\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories", "") = False Then

            EnumKeys HKEY_LOCAL_MACHINE, "Software\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories", 1

            If UBound(AllKeys1) > 1 Then

                For z = 1 To UBound(AllKeys1)
                    
                    If Left(AllKeys1(z), 1) = "{" And Right(AllKeys1(z), 1) = "}" And Len(AllKeys1(z)) = 38 And ExistKey(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & HKLMBase & "\Implemented Categories\" & AllKeys1(z)) = True Then
                    
                        TheValue = ReadValue(HKEY_LOCAL_MACHINE, "Software\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories\" & AllKeys1(z), "", Ktype)
                        
                        If Left(TheValue, 1) = "{" And Right(TheValue, 1) = "}" And Len(TheValue) = 38 And Ktype = REG_SZ Then
                            AddToList TRRegKey, "ABBYY License", "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(T) & "\Implemented Categories\" & AllKeys1(z)
                        End If
                    End If

                Next

            End If
        End If

    Next
    
End Function
