Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    SetPluginInfo "Zylom Games Trial-Reset"
    
    AddToLog "Searching Zylom keys in HKEY_CURRENT_USER\Software\Classes\CLSID\"

    EnumKeys HKEY_CURRENT_USER, "Software\Classes\CLSID\"
    
    If UBound(AllKeys) > 0 Then

        For I = 1 To UBound(AllKeys)
        
            UpdateProgress I, UBound(AllKeys)

            If ExistValue(HKEY_CURRENT_USER, "Software\Classes\CLSID\" & AllKeys(I), "") = False Then
                
                If IsHex(Replace(Replace(Replace(AllKeys(I), "-", ""), "{", ""), "}", "")) = False And UCase(AllKeys(I)) = AllKeys(I) Then
                    AddToList TRRegKey, "Zylom", "HKEY_CURRENT_USER\Software\Classes\CLSID\" & AllKeys(I)
                End If
                
            End If
            
        Next
    
    End If

    CurFile = Dir(AppDataDir & "\Identities\" & "{*}", vbDirectory)

    Set fs2 = CreateObject("Scripting.FileSystemObject")

    Do While Replace(CurFile, ".", "") <> ""
        
        If IsHex(Replace(Replace(Replace(CurFile, "-", ""), "{", ""), "}", "")) = False Then
        
            AddToList TRDir, "Zylom", AppDataDir & "\Identities\" & CurFile

        End If
        
        CurFile = Dir
       
    Loop
    
End Function
