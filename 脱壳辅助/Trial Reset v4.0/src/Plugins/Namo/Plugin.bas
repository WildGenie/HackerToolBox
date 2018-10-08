Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    SetPluginInfo "Namo License supported Software:" & vbCrLf & _
                  "-Namo WebEditor 8" & vbCrLf & _
                  "-Namo WebEditor 2006" & vbCrLf & _
                  "-Namo WebCanvas 2006" & vbCrLf & _
                  "-Probably older versions"
    
    AddToLog "Searching Namo keys in HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\"

    EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\"

    For I = 1 To UBound(AllKeys)
    
        UpdateProgress I, UBound(AllKeys)

        TheValue1 = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(I), "AppID"))
        TheValue2 = Trim(ReadValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(I), "Class"))

        If ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\AppID\" & TheValue1) = False And TheValue1 <> "" And TheValue2 <> "" And Left(TheValue1, 1) = "{" And Right(TheValue1, 1) = "}" And Left(TheValue2, 1) = "{" And Right(TheValue2, 1) = "}" Then
            AddToList TRRegKey, "Namo", "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(I)
        End If

        If ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\AppID\" & TheValue1) = False And CountKeys(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(I)) = 0 And TheValue1 <> "" And Left(TheValue1, 1) = "{" And Right(TheValue1, 1) = "}" Then
            AddToList TRRegKey, "Namo", "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(I)
        End If

    Next

End Function
