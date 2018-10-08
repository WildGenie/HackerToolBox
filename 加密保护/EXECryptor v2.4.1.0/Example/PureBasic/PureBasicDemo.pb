; Example of using EXECryptor with PureBasic

XIncludeFile "execryptor.pbi"

#Form = 0

Enumeration
#Username
#UsernameLabel
#Serial
#SerialLabel
#Frame
#Editor
#Verify
EndEnumeration

If OpenWindow(#Form, 0, 0, 300, 400, #PB_Window_SystemMenu|#PB_Window_ScreenCentered, "EXECryptor test")
  If CreateGadgetList(WindowID(#Form))
    Frame3DGadget(#Frame, 10, 10, 280, 75, "Enter details")
    StringGadget(#Username, 80, 30, 200, 20, "John Smith")
    StringGadget(#Serial, 80, 55, 200, 20, "GT7B-N6AG-BYLJ")
    TextGadget(#UsernameLabel, 25, 30, 50, 15, "Username")
    TextGadget(#SerialLabel, 25, 55, 50, 15, "Serial num")
    EditorGadget(#Editor, 10, 95, 280, 270)
    ButtonGadget(#Verify, 120, 370, 60, 25, "Verify S/N")
  Else
    End
  EndIf
Else
  End
EndIf

EXECryptor_AntiDebug()
AddGadgetItem(#Editor, -1, "EXECryptor_AntiDebug OK")
EXECryptor_ProtectImport()
AddGadgetItem(#Editor, -1, "EXECryptor_ProtectImport OK")

AddGadgetItem(#Editor, -1, "EXECryptor_IsAppProtected: "+Str(EXECryptor_IsAppProtected()))
AddGadgetItem(#Editor, -1, "EXECryptor_GetEXECryptorVersion: "+EXECryptor_GetEXECryptorVersion())

; Same as Win API messagebox but with added debugger checking and breakpoint detection
EXECryptor_MessageBox(WindowID(), "Test of EXECryptor API", "Information", #MB_OK)

; Safely get date
SafeGetDate(@DateDay, @DateMonth, @DateYear)
AddGadgetItem(#Editor, -1, "Current date: Day: " + Str(DateDay) + " Month: " + Str(DateMonth) + " Year: " + Str(DateYear))

GetReleaseDate(@DateDay, @DateMonth, @DateYear)
AddGadgetItem(#Editor, -1, "Release date: Day: " + Str(DateDay) + " Month: " + Str(DateMonth) + " Year: " + Str(DateYear))

; Get hardware ID
AddGadgetItem(#Editor, -1, "Machine hardware ID: " + GetHardwareID() + Chr(10))

; Encryt/decrypt a string
String.s = "This is a string."
Encrypt.s = EncryptStr(String)
Decrypt.s = DecryptStr(Encrypt)
AddGadgetItem(#Editor, -1, "String: " + String)
AddGadgetItem(#Editor, -1, "Encrypted: " + Encrypt)
AddGadgetItem(#Editor, -1, "Decrypted: " + Decrypt + Chr(10))

; Registry example
Name.s = "Example"
WriteValue.s = "Test value"
SecureWrite(Name, WriteValue)
AddGadgetItem(#Editor, -1, "Added to registry - name: " + Name + " WriteValue: " + WriteValue)
ReadValue.s = SecureRead(Name)
AddGadgetItem(#Editor, -1, "Read from registry - name: " + Name + " ReadValue: " + ReadValue + Chr(10))

;  getting rest of trail period
AddGadgetItem(#Editor, -1, "GetTrialDaysLeft: "+Str(EXECryptor_GetTrialDaysLeft(30)) + Chr(10))
AddGadgetItem(#Editor, -1, "GetTrialRunsLeft: "+Str(EXECryptor_GetTrialRunsLeft(100)) + Chr(10))

Repeat
  Event.l = WaitWindowEvent()
  If Event = #PB_Event_Gadget
    If EventGadgetID() = #Verify

      ! CRYPT_START
        ; Check username and serial
        User.s = GetGadgetText(#Username)
        Serial.s = GetGadgetText(#Serial)
        AddGadgetItem(#Editor, -1, "Username: " + User + " Serial: " + Serial)

        SNInfo.TSerialNumberInfo
        verifyresult = VerifySerialNumberEx(User, Serial, SNInfo)

        text.s = "VerifySerialNumber result: " + Str(verifyresult) + " ("
        Select verifyresult
          Case #vrInvalid : text + "invalid)"
          Case #vrExpired : text + "expired)"
          Case #vrStolen : text + "Stolen)"
          Case #vrOK : text + "OK)"
        EndSelect
        AddGadgetItem(#Editor, -1, text)
      ! CRYPT_END

      ; The following code runs if the username/password combination is correct
      ! CRYPT_REG
        AddGadgetItem(#Editor, -1, "Username/password is correct")
        ; Display license information
        AddGadgetItem(#Editor, -1, "License type: " + Str(SNInfo\LicType))
        If SNInfo\LicType = 1
          text.s = "Expiry month: " + Str(SNInfo\ExpiryMonth)
          text + " Expiry year: " + Str(SNInfo\ExpiryYear)
        Else
          text.s = "UserParam: " + Str(SNInfo\UserParam)
        EndIf
        AddGadgetItem(#Editor, -1, text)
        text.s = "F1: " + Str(SNInfo\F1) + " F2: " + Str(SNInfo\F2) + " F3: " + Str(SNInfo\F3)
        text + " F4: " + Str(SNInfo\F4) + " F5: " + Str(SNInfo\F5) + " F6: " + Str(SNInfo\F6)
        AddGadgetItem(#Editor, -1, text)
      ! CRYPT_END
      
      ; The following code runs if the username/password combination is invalid
      ! CRYPT_UNREG
        AddGadgetItem(#Editor, -1, "Username/password is invalid")
      ! CRYPT_END
      
      ; Get the value of the last VerifySerialNumber call
      registeredresult = EXECryptor_IsRegistered()
      
      text.s = "VerifySerialNumber result: " + Str(registeredresult) + " ("
      Select registeredresult
        Case #vrInvalid : text + "invalid)"
        Case #vrExpired : text + "expired)"
        Case #vrStolen : text + "Stolen)"
        Case #vrOK : text + "OK)"
      EndSelect
      AddGadgetItem(#Editor, -1, "IsRegistered result: " + text)
      
      ; Return constants 0-7 if registered, random values if not
      text.s = "Constants 0-7: " + Str(EXECryptor_RegConst_0())
      text + " " + Str(EXECryptor_RegConst_1())
      text + " " + Str(EXECryptor_RegConst_2())
      text + " " + Str(EXECryptor_RegConst_3())
      text + " " + Str(EXECryptor_RegConst_4())
      text + " " + Str(EXECryptor_RegConst_5())
      text + " " + Str(EXECryptor_RegConst_6())
      text + " " + Str(EXECryptor_RegConst_7())
      AddGadgetItem(#Editor, -1, text + Chr(10))
    EndIf
  EndIf
Until Event = #PB_Event_CloseWindow
; ExecutableFormat=Windows
; EnableAsm
; EOF