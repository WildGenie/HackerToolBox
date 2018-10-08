Attribute VB_Name = "Plugin"


Function Plugin_Execute()

    SetPluginInfo "Empty keys search:" & vbCrLf & _
                  "-Empty CLSID" & vbCrLf & _
                  "-Empty TypeLib" & vbCrLf & _
                  "-Empty File Extension" & vbCrLf & _
                  "-Empty Uninstall"

    If Is64bit = True Then If WoW64Translation = 0 Then PSign = " 32bit" Else PSign = " 64bit"
    
    AddToLog "Searching empty CLSID" & PSign
    
    EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID"

    If UBound(AllKeys) > 0 Then
        
        For I = 1 To UBound(AllKeys)
        
            UpdateProgress I, UBound(AllKeys)

            If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(I), "") = False And CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(I)) = 0 And CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\CLSID\" & AllKeys(I)) = 0 Then
                AddToList TRRegKey, "Empty CLSID", "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\" & AllKeys(I)
            End If

        Next

    End If

    AddToLog "Searching empty TypeLib" & PSign
    
    EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\TypeLib"

    If UBound(AllKeys) > 0 Then

        For I = 1 To UBound(AllKeys)
        
            UpdateProgress I, UBound(AllKeys)

            If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\TypeLib\" & AllKeys(I), "") = False And CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\TypeLib\" & AllKeys(I)) = 0 And CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\TypeLib\" & AllKeys(I)) = 0 Then
                AddToList TRRegKey, "Empty TypeLib", "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\" & AllKeys(I)
            End If

        Next
    
    End If

    AddToLog "Searching empty File Extension" & PSign

    EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Classes"

    If UBound(AllKeys) > 0 Then

        For I = 1 To UBound(AllKeys)
        
            UpdateProgress I, UBound(AllKeys)

            If Left(AllKeys(I), 1) = "." Then
                If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(I), "") = False And CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(I)) = 0 And CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\Classes\" & AllKeys(I)) = 0 Then
                    AddToList TRRegKey, "Empty File Extension", "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & AllKeys(I)
                End If
            End If

        Next
    
    End If
    
    AddToLog "Searching empty Uninstall" & PSign
    
    EnumKeys HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"

    If UBound(AllKeys) > 0 Then

        For I = 1 To UBound(AllKeys)
        
            UpdateProgress I, UBound(AllKeys)

            If ExistValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(I), "") = False And CountKeys(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(I)) = 0 And CountValues(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(I)) = 0 Then
                AddToList TRRegKey, "Empty Uninstall", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & AllKeys(I)
            End If

        Next
    
    End If
    
    If Is64bit = True And WoW64Translation = 0 And TRWoW_State = WAuto Then SetWoW64Translation 64: Plugin_Execute

End Function
