'==============================================================================
'
'  EXECryptor Demo
'
'==============================================================================


'------------------------------------------------------------------------------
' Metastatements
'
#COMPILE EXE
#DIM ALL

#INCLUDE "Win32API.inc"
#INCLUDE "DDT.inc"
#INCLUDE "execryptor.inc"

'------------------------------------------------------------------------------
' Equates and global variables
'

GLOBAL hDlg AS DWORD

%IDOK       = 1
%IDRUN      = 2
%IDLIST     = 100

'------------------------------------------------------------------------------

SUB WriteMsg(BYREF S AS STRING)
  LISTBOX ADD hDlg, %IDLIST, S
  CONTROL REDRAW hDlg, %IDLIST
END SUB

'------------------------------------------------------------------------------

FUNCTION vr2text(vr AS LONG) AS STRING
  SELECT CASE vr
    CASE %VR_Invalid
      FUNCTION = "VR_Invalid"
    CASE %VR_Expired
      FUNCTION = "VR_Expired"
    CASE %VR_Stolen
      FUNCTION = "VR_Stolen"
    CASE %VR_OK
      FUNCTION = "VR_OK"
  END SELECT
END FUNCTION

'------------------------------------------------------------------------------

CALLBACK FUNCTION OkButton () AS LONG
  IF CBCTLMSG = %BN_CLICKED THEN
    DIALOG END CBHNDL, 1
    FUNCTION = 1
  END IF
END FUNCTION

CALLBACK FUNCTION RunButton () AS LONG
  IF CBCTLMSG = %BN_CLICKED THEN
    CRYPT_START
      ' code between CRYPT_START and CRYPT_END prtected from
      ' reversing and modfication

      CALL AntiDebug
      CALL WriteMsg("AntiDebug OK")

      CALL ProtectImport
      CALL WriteMsg("ProtectImport OK")

      CALL WriteMsg ("IsAppProtected: "+STR$(IsAppProtected()))
      CALL WriteMsg ("GetEXECryptorVersion: "+GetEXECryptorVersion())

      CALL WriteMsg ("HardwareID: "+GetHardwareID())

      DIM dDay AS LONG, dMonth AS LONG, dYear AS LONG
      CALL GetReleaseDate (dDay, dMonth, dYear)
      CALL WriteMsg ("GetReleaseDate: "+STR$(dDay)+"/"+STR$(dMonth)+"/"+STR$(dYear))
      CALL SafeGetDate (dDay, dMonth, dYear)
      CALL WriteMsg ("SafeGetDate: "+STR$(dDay)+"/"+STR$(dMonth)+"/"+STR$(dYear))

      CALL WriteMsg ("GetTrialDaysLeft(30) = "+STR$(GetTrialDaysLeft(30)))
      CALL WriteMsg ("GetTrialRunsLeft(100) = "+STR$(GetTrialRunsLeft(100)))

      DIM SomeText AS STRING
      DIM EncText AS STRING
      SomeText = "This is a string."
      CALL WriteMsg ("String: "+SomeText)
      EncText = EncryptStr(SomeText)
      CALL WriteMsg ("Encrypted: ("+EncText+")")
      CALL WriteMsg ("Decrypted: ("+DecryptStr(EncText)+")")

      IF SecureWrite("ABC","Some value") THEN
        CALL WriteMsg ("SecureWrite OK")
      ELSE
        CALL WriteMsg ("SecureWrite FAIL")
      END IF
      CALL WriteMsg ("SecureRead = "+SecureRead("ABC"))

      CALL SafeMessageBox (0, "Safe MessageBox", "Demo", %MB_ICONINFORMATION)

    CRYPT_END

    CALL WriteMsg ("IsRegistered = "+vr2text(IsRegistered()))
    CALL WriteMsg ("RegConst* = "+ _
      STR$(RegConst_0())+","+STR$(RegConst_1())+","+STR$(RegConst_2())+","+ _
      STR$(RegConst_3())+","+STR$(RegConst_4())+","+STR$(RegConst_5())+","+ _
      STR$(RegConst_6())+","+STR$(RegConst_7()))

    CRYPT_UNREG
      ' this code will be executed only if previous call to
      ' VerifySerialNumber(Ex) was fail or if this function not called
      CALL WriteMsg ("CRYPT_UNREG OK")
    CRYPT_END

    DIM vrRes AS LONG
    vrRes = VerifySerialNumber("John Smith","GT7B-N6AG-BYLJ")
    CALL WriteMsg ("VerifySerialNumber(John Smith,GT7B-N6AG-BYLJ) = "+vr2text(vrRes))

    CRYPT_REG
      ' this code will be executed only if previous call to
      ' VerifySerialNumber(Ex) was success
      CALL WriteMsg ("CRYPT_REG OK")
      CALL WriteMsg ("IsRegistered = "+vr2text(IsRegistered()))
      CALL WriteMsg ("RegConst* = "+ _
        STR$(RegConst_0())+","+STR$(RegConst_1())+","+STR$(RegConst_2())+","+ _
        STR$(RegConst_3())+","+STR$(RegConst_4())+","+STR$(RegConst_5())+","+ _
        STR$(RegConst_6())+","+STR$(RegConst_7()))
    CRYPT_END

    DIM LicInfo AS LicenseInfo
    vrRes = VerifySerialNumberEx("Justas","CHCE-EAJG-EFEW-2WRX",LicInfo)
    CALL WriteMsg ("VerifySerialNumber(Justas,CHCE-EAJG-EFEW-2WRX) = "+vr2text(vrRes))
    CALL WriteMsg ("LicType = "+STR$(LicInfo.LicType))
    IF LicInfo.LicType = 1 THEN
      CALL WriteMsg ("Expire after "+STR$(LicInfo.ExpiryMonth)+"/"+STR$(LicInfo.ExpiryYear))
    ELSE
      CALL WriteMsg ("UserParam = "+STR$(LicInfo.UserParam))
    END IF
    CALL WriteMsg ("Flags: "+ _
      STR$(LicInfo.F1)+","+STR$(LicInfo.F2)+","+STR$(LicInfo.F3)+","+ _
      STR$(LicInfo.F4)+","+STR$(LicInfo.F5)+","+STR$(LicInfo.F6))

    vrRes = VerifySerialNumberEx("Justas","CP9P-GJKL-J5LM-XHSR",LicInfo)
    CALL WriteMsg ("VerifySerialNumber(Justas,CP9P-GJKL-J5LM-XHSR) = "+vr2text(vrRes))
    CALL WriteMsg ("LicType = "+STR$(LicInfo.LicType))
    IF LicInfo.LicType = 1 THEN
      CALL WriteMsg ("Expire after "+STR$(LicInfo.ExpiryMonth)+"/"+STR$(LicInfo.ExpiryYear))
    ELSE
      CALL WriteMsg ("UserParam = "+STR$(LicInfo.UserParam))
    END IF
    CALL WriteMsg ("Flags: "+ _
      STR$(LicInfo.F1)+","+STR$(LicInfo.F2)+","+STR$(LicInfo.F3)+","+ _
      STR$(LicInfo.F4)+","+STR$(LicInfo.F5)+","+STR$(LicInfo.F6))

    FUNCTION = 1
  END IF
END FUNCTION

'------------------------------------------------------------------------------
' Main application entry point...
'
FUNCTION PBMAIN() AS LONG

    '  Create a new dialog template
    DIALOG NEW 0, "EXECryptor Demo",,, 300, 300 TO hDlg

    '  Add controls to it
    CONTROL ADD LISTBOX, hDlg, %IDLIST, , 8,  8, 284, 260, _
      %WS_VSCROLL, %WS_EX_CLIENTEDGE
    CONTROL ADD BUTTON, hDlg, %IDRUN, "RUN!", 40, 278, 40, 14, _
      %WS_TABSTOP CALL RunButton
    CONTROL ADD BUTTON, hDlg, %IDOK, "Exit", 204, 278, 40, 14, _
      %WS_TABSTOP CALL OkButton

    '  Display the dialog
    DIALOG SHOW MODAL hDlg

END FUNCTION
