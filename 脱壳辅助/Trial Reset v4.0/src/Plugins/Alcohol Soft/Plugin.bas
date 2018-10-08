Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    SetPluginInfo "Alcohol 120% 1.4x/1.9x/2.x"
    
    AddToLog "Searching Alcohol 120% keys in HKEY_CURRENT_USER\Software\Microsoft\"

    EnumAllRegKeys HKEY_CURRENT_USER, "Software\Microsoft"

    For I = 1 To UBound(AllKeys)
    
        UpdateProgress I, UBound(AllKeys)

        If CountValues(HKEY_CURRENT_USER, AllKeys(I)) >= 3 And Trim(ReadValue(HKEY_CURRENT_USER, AllKeys(I), "")) = "" Then

            EnumValues HKEY_CURRENT_USER, AllKeys(I)
            
            NoAlcohol = 0
            
            For z = 1 To UBound(AllValues)
            
                TheValue = Trim(ReadValue(HKEY_CURRENT_USER, AllKeys(I), AllValues(z).Name))

                If Left(AllValues(1).Name, 2) <> Left(AllValues(z).Name, 2) Or IsNumeric(TheValue) = False Or TheValue <= 0 Or AllValues(z).DataType <> 1 Then NoAlcohol = 1: Exit For
                
                ValSum = ValSum + Val(TheValue)
            
            Next

            If ValSum > 10 And NoAlcohol = 0 Then AddToList TRRegKey, "Alcohol 1.x/2.x", "HKEY_CURRENT_USER\" & AllKeys(I)
        
        End If

    Next

    EnumValues HKEY_CURRENT_USER, "Software\Microsoft\Internet Explorer\Main"
    
    For z = 1 To UBound(AllValues)
    
        TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\Internet Explorer\Main", AllValues(z).Name))

        If IsNumeric(TheValue) = True And TheValue > 0 And AllValues(z).DataType = 1 Then

            For T = 1 To UBound(AllValues) - 1

                If T <> z And Left(AllValues(z).Name, 2) = Left(AllValues(T).Name, 2) And Left(AllValues(z).Name, 2) = Left(AllValues(T + 1).Name, 2) And AllValues(T).DataType = 1 And AllValues(T).DataType = 1 Then
                    TheValue = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\Internet Explorer\Main", AllValues(z).Name))
                    TheValue1 = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\Internet Explorer\Main", AllValues(T).Name))
                    TheValue2 = Trim(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\Internet Explorer\Main", AllValues(T + 1).Name))

                    If IsNumeric(TheValue) And IsNumeric(TheValue1) And IsNumeric(TheValue2) Then AddToList TRRegVal, "Alcohol 1.x/2.x", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\" & AllValues(z).Name
                End If

            Next
        
        End If
    
    Next

End Function
