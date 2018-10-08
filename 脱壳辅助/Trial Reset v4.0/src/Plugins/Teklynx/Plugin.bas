Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    SetPluginInfo "Teklynx supported Software:" & vbCrLf & "-LABELVIEW 8" & vbCrLf & "-LABEL ARCHIVE 3" & vbCrLf & "-CODESOFT 9" & vbCrLf & "-LABEL MATRIX 8" & vbCrLf & "-IDEAM 6" & vbCrLf & "-BACKTRACK 6" & vbCrLf & "-QUICKDRAW 8"

    AddToLog "Searching Teklynx trial keys in HKEY_CLASSES_ROOT\CLSID\"

    EnumKeys HKEY_CLASSES_ROOT, "CLSID\"
    
    For i = 1 To UBound(AllKeys)
    
        UpdateProgress i, UBound(AllKeys)

        If CountKeys(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i)) = 1 And CountValues(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i)) = 0 And ExistValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), "") = False Then

            EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i), 1
            
            If CountKeys(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & AllKeys1(1)) = 1 And Left(AllKeys1(1), 1) = "{" And Right(AllKeys1(1), 1) = "}" And CountValues(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & AllKeys1(1)) = 0 And ExistValue(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & AllKeys1(1), "") = False Then
            
                EnumKeys HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & AllKeys1(1), 2
                
                If UBound(AllKeys2) = 0 Then
                    AddToList TRRegKey, "Teklynx", "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
                Else
                    If ExistKey(HKEY_CLASSES_ROOT, "CLSID\" & AllKeys(i) & "\" & AllKeys1(1) & "\" & AllKeys2(1)) = False Then AddToList TRRegKey, "Teklynx", "HKEY_CLASSES_ROOT\CLSID\" & AllKeys(i)
                End If
                
            End If
        
        End If

    Next

End Function
