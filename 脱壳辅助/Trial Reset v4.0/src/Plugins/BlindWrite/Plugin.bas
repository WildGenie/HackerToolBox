Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    SetPluginInfo "BlindWrite 5.x/6.x"
    
    AddToLog "Searching BlindWrite keys in HKEY_CURRENT_USER\Software\VSO\"

    EnumAllRegKeys HKEY_CURRENT_USER, "Software\VSO"

    For I = 1 To UBound(AllKeys)
    
        UpdateProgress I, UBound(AllKeys)

        If ExistValue(HKEY_CURRENT_USER, AllKeys(I), "TrialKey") = True Then
            AddToList TRRegVal, "BlindWrite", "HKEY_CURRENT_USER\" & AllKeys(I) & "\TrialKey"
        End If

        If ExistValue(HKEY_CURRENT_USER, AllKeys(I), "TrialBegin") = True Then
            AddToList TRRegVal, "BlindWrite", "HKEY_CURRENT_USER\" & AllKeys(I) & "\TrialBegin"
        End If
    Next
    
    AddToLog "Searching BlindWrite keys in HKEY_LOCAL_MACHINE\Software\VSO\"

    EnumAllRegKeys HKEY_LOCAL_MACHINE, "Software\VSO"

    For I = 1 To UBound(AllKeys)
    
        UpdateProgress I, UBound(AllKeys)

        If ExistValue(HKEY_LOCAL_MACHINE, AllKeys(I), "TrialKey") = True Then
            AddToList TRRegVal, "BlindWrite", "HKEY_LOCAL_MACHINE\" & AllKeys(I) & "\TrialKey"
        End If

        If ExistValue(HKEY_LOCAL_MACHINE, AllKeys(I), "TrialBegin") = True Then
            AddToList TRRegVal, "BlindWrite", "HKEY_LOCAL_MACHINE\" & AllKeys(I) & "\TrialBegin"
        End If
    Next

End Function
