Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    SetPluginInfo "Glenn Alcott Software Trial-Reset Plugin"
    
    AddToLog "Searching Glenn Alcott Software trial keys"
    
    EnumKeys HKEY_CURRENT_USER, "Software"
    
    For T = 1 To UBound(AllKeys)
    
        UpdateProgress T, UBound(AllKeys)
    
        If ExistValue(HKEY_CURRENT_USER, "Software\" & AllKeys(T), "") = False And CountKeys(HKEY_CURRENT_USER, "Software\" & AllKeys(T)) = 0 And ExistValue(HKEY_CURRENT_USER, "Software\" & AllKeys(T), "Start") = True Then

            TheValue = ReadValue(HKEY_CURRENT_USER, "Software\" & AllKeys(T), "Start", ValType)
            
            If Len(TheValue) = 8 And ValType = REG_BINARY Then AddToList TRRegKey, "GAlcott", "HKEY_CURRENT_USER\Software\" & AllKeys(T)
            
        End If

    Next
    
End Function
