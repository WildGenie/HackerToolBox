Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    SetPluginInfo "Aborange Software Trial-Reset Plugin"

    AddToLog "Searching Aborange Software trial keys"
    
    EnumKeys HKEY_CURRENT_USER, "Software\Microsoft"
    
    For T = 1 To UBound(AllKeys)
    
        UpdateProgress T, UBound(AllKeys)
    
        If ExistValue(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(T), "") = False And CountKeys(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(T)) = 0 And ExistValue(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(T), "UpdateVer") = True Then

            TheValue = ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(T), "UpdateVer", ValType)
            
            If Len(TheValue) = 8 And ValType = REG_BINARY Then AddToList TRRegKey, "Aborange", "HKEY_CURRENT_USER\Software\Microsoft\" & AllKeys(T)
            
        End If
        
        
        If ExistValue(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(T), "LastTime") = True Then
        
            TheValue = ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\" & AllKeys(T), "LastTime", ValType)
            
            If Len(TheValue) = 8 And ValType = REG_BINARY Then AddToList TRRegVal, "Aborange", "HKEY_CURRENT_USER\Software\Microsoft\" & AllKeys(T) & "\\LastTime"
            
        End If


    Next
    
    EnumValues HKEY_CURRENT_USER, "Software\Microsoft"
    
    For T = 1 To UBound(AllValues)
    
        UpdateProgress T, UBound(AllValues)
        
        If Left(AllValues(T).Name, 1) = "{" And Right(AllValues(T).Name, 1) = "}" Then
        
            TheValue = ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\", AllValues(T).Name)
            
            If Len(TheValue) = 8 And AllValues(T).DataType = REG_BINARY Then AddToList TRRegVal, "Aborange", "HKEY_CURRENT_USER\Software\Microsoft\\" & AllValues(T).Name
            
        End If

    Next
    
    AddToListIfExist TRRegVal, "Aborange", "HKEY_CURRENT_USER\Software\Microsoft\\IEVer_Launch"
    
End Function
