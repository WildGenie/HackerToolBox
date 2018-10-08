' EXECryptor 2.3 include file for PB8

MACRO CRYPT_START = ! DB &HEB, &H06, &HEB, &HFC, &HEB, &HFC, &HFF, &HF8
MACRO CRYPT_END = ! DB &HEB, &H06, &HEB, &HFC, &HEB, &HFC, &HFF, &HFF
MACRO CRYPT_REG = ! DB &HEB, &H06, &HEB, &HFC, &HEB, &HFC, &HFF, &HF9
MACRO CRYPT_UNREG = ! DB &HEB, &H06, &HEB, &HFC, &HEB, &HFC, &HFF, &HFA
MACRO RESERVE_SPACE = ! DB &H90, &H90, &H90, &H90, &H90

' return values for VerifySerialNumber[Ex]/DecodeSerialNumber/IsRegistered
%VR_Invalid = 0
%VR_Expired = 1
%VR_Stolen  = 2
%VR_OK      = 3

TYPE LicenseInfo
  LicType AS DWORD     ' 0..15 (license type)
  UserParam AS DWORD   ' 0..1023
  ExpiryMonth AS DWORD ' 1..12
  ExpiryYear AS DWORD  ' 2004..2024
  F1 AS BYTE
  F2 AS BYTE
  F3 AS BYTE
  F4 AS BYTE
  F5 AS BYTE
  F6 AS BYTE
END TYPE

SUB AntiDebug SDECL ALIAS "EXECryptor_AntiDebug" () EXPORT
  RESERVE_SPACE
END SUB

SUB ProtectImport SDECL ALIAS "EXECryptor_ProtectImport" () EXPORT
  RESERVE_SPACE
END SUB

FUNCTION IsAppProtected SDECL ALIAS "EXECryptor_IsAppProtected" () EXPORT AS BYTE
  RESERVE_SPACE
  FUNCTION = 0
END FUNCTION

FUNCTION EXECryptor_GetEXECryptorVersion SDECL () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 0
END FUNCTION

FUNCTION GetEXECryptorVersion SDECL () AS STRING
  LOCAL ver AS LONG, temp AS STRING, ptemp AS ASCIIZ PTR
  ver = EXECryptor_GetEXECryptorVersion()
  IF ver = 0 THEN
      FUNCTION = "UNPROTECTED"
  ELSE
    ptemp = ver
    FUNCTION = @ptemp
  END IF
END FUNCTION

FUNCTION EXECryptor_GetHardwareID SDECL () EXPORT AS DWORD
  RESERVE_SPACE
  FUNCTION = 0
END FUNCTION

FUNCTION GetHardwareID () AS STRING
  FUNCTION = HEX$(EXECryptor_GetHardwareID(),8)
END FUNCTION

FUNCTION EXECryptor_GetDate SDECL () EXPORT AS DWORD
  LOCAL t1 AS FILETIME
  LOCAL t2 AS FILETIME
  LOCAL datedt AS WORD
  LOCAL tt AS WORD
  GetSystemTimeAsFileTime(t1)
  FileTimeToLocalFileTime(t1,t2)
  FileTimeToDosDateTime(t2,datedt,tt)
  FUNCTION = datedt
END FUNCTION

SUB SafeGetDate (BYREF DateDay AS LONG, BYREF DateMonth AS LONG, BYREF DateYear AS LONG)
  CRYPT_START
  LOCAL datedt AS DWORD
  datedt = EXECryptor_GetDate()
  DateDay = datedt AND &H1F
  SHIFT RIGHT datedt, 5
  DateMonth = datedt AND &HF
  SHIFT RIGHT datedt, 4
  DateYear = datedt + 1980
  CRYPT_END
END SUB

FUNCTION EXECryptor_GetReleaseDate SDECL () EXPORT AS DWORD
  LOCAL t1 AS FILETIME
  LOCAL t2 AS FILETIME
  LOCAL datedt AS WORD
  LOCAL tt AS WORD
  GetSystemTimeAsFileTime(t1)
  FileTimeToLocalFileTime(t1,t2)
  FileTimeToDosDateTime(t2,datedt,tt)
  FUNCTION = datedt
END FUNCTION

SUB GetReleaseDate (BYREF DateDay AS LONG, BYREF DateMonth AS LONG, BYREF DateYear AS LONG)
  CRYPT_START
  LOCAL datedt AS DWORD
  datedt = EXECryptor_GetReleaseDate()
  DateDay = datedt AND &H1F
  SHIFT RIGHT datedt, 5
  DateMonth = datedt AND &HF
  SHIFT RIGHT datedt, 4
  DateYear = datedt + 1980
  CRYPT_END
END SUB

FUNCTION GetTrialDaysLeft SDECL ALIAS "EXECryptor_GetTrialDaysLeft" (BYVAL TrialPeriod AS LONG) EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = TrialPeriod
END FUNCTION

FUNCTION GetTrialRunsLeft SDECL ALIAS "EXECryptor_GetTrialRunsLeft" (BYVAL TrialRuns AS LONG) EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = TrialRuns
END FUNCTION

SUB EXECryptor_EncryptStr SDECL (BYVAL Src AS ASCIIZ PTR,BYVAL Dst AS BYTE PTR) EXPORT
  POKE$ Dst, @Src
  @Dst[LEN(@Src)] = 0
END SUB

FUNCTION EncryptStr (BYREF Src AS STRING) AS STRING
  CRYPT_START
  LOCAL temp AS STRING, ptemp AS ASCIIZ PTR
  temp = SPACE$(2*LEN(Src)+1)
  ptemp = STRPTR(temp)
  CALL EXECryptor_EncryptStr (STRPTR(Src), ptemp)
  FUNCTION = @ptemp
  CRYPT_END
END FUNCTION

SUB EXECryptor_DecryptStr SDECL (BYVAL Src AS ASCIIZ PTR, BYVAL Dst AS BYTE PTR) EXPORT
  POKE$ Dst, @Src
  @Dst[LEN(@Src)] = 0
END SUB

FUNCTION DecryptStr (BYREF Src AS STRING) AS STRING
  CRYPT_START
  LOCAL temp AS STRING, ptemp AS ASCIIZ PTR
  temp = SPACE$(LEN(Src)+1)
  ptemp = STRPTR(temp)
  CALL EXECryptor_DecryptStr (STRPTR(Src), ptemp)
  FUNCTION = @ptemp
  CRYPT_END
END FUNCTION

$TestKeyPath = "Software\EXECryptorTestKeys"

FUNCTION EXECryptor_SecureWrite SDECL (BYVAL VName AS ASCIIZ PTR, BYVAL Value AS ASCIIZ PTR) EXPORT AS BYTE
  LOCAL KeyHandle AS LONG
  IF RegCreateKey(%HKEY_CURRENT_USER, $TestKeyPath, KeyHandle) = %ERROR_SUCCESS THEN
    RegSetValueEx(KeyHandle, @VName, 0, %REG_BINARY, @Value, LEN(@Value)+1)
    RegCloseKey(KeyHandle)
    FUNCTION = 1
  ELSE
    FUNCTION = 0
  END IF
END FUNCTION

FUNCTION SecureWrite(BYREF ValName AS STRING, BYREF Value AS STRING) AS BYTE
  FUNCTION = EXECryptor_SecureWrite(STRPTR(ValName), STRPTR(Value))
END FUNCTION

FUNCTION EXECryptor_SecureRead SDECL (BYVAL VName AS ASCIIZ PTR, BYVAL Value AS ASCIIZ PTR) EXPORT AS BYTE
  LOCAL KeyHandle AS LONG, sz AS LONG, tp AS LONG
  LOCAL Result AS BYTE
  Result = 0
  IF RegOpenKeyEx(%HKEY_CURRENT_USER, $TestKeyPath, 0, %KEY_QUERY_VALUE, KeyHandle) = %ERROR_SUCCESS THEN
    tp = %REG_BINARY
    sz = 4096
    IF RegQueryValueEx(KeyHandle, @VName, 0, tp, @Value, sz) = %ERROR_SUCCESS THEN
      Result = 1
    END IF
    RegCloseKey(KeyHandle)
  END IF
  FUNCTION = Result
END FUNCTION

FUNCTION SecureRead(BYREF ValName AS STRING) AS STRING
  LOCAL Value AS STRING, pValue AS ASCIIZ PTR
  Value = SPACE$(4096)
  pValue = STRPTR(Value)
  IF EXECryptor_SecureRead(STRPTR(ValName),pValue) THEN
    FUNCTION = @pValue
  ELSE
    FUNCTION = ""
  END IF
END FUNCTION

FUNCTION SafeMessageBox SDECL ALIAS "EXECryptor_MessageBox" (BYVAL hWnd AS DWORD, _
    lpText AS ASCIIZ, lpCaption AS ASCIIZ, BYVAL dwType AS DWORD) EXPORT AS LONG
  FUNCTION = MessageBox(hWnd,lpText,lpCaption,dwType)
END FUNCTION

FUNCTION EXECryptor_VerifySerialNumber SDECL ( _
    BYVAL RegistrationName AS ASCIIZ PTR, BYVAL SerialNumber AS ASCIIZ PTR, _
    LicInfo AS LicenseInfo, BYVAL HardwareID AS ASCIIZ PTR) EXPORT AS LONG
  LicInfo.LicType = 0
  LicInfo.UserParam = 0
  LicInfo.F1 = 1
  LicInfo.F2 = 1
  LicInfo.F3 = 1
  LicInfo.F4 = 1
  LicInfo.F5 = 1
  LicInfo.F6 = 1
  FUNCTION = %VR_OK
END FUNCTION

FUNCTION VerifySerialNumber (BYREF RegistrationName AS STRING, _
    BYREF SerialNumber AS STRING) AS LONG
  CRYPT_START
  LOCAL LicInfo AS LicenseInfo
  LOCAL HWID AS STRING
  HWID = GetHardwareID()
  FUNCTION = EXECryptor_VerifySerialNumber( _
    STRPTR(RegistrationName), STRPTR(SerialNumber), _
    LicInfo, STRPTR(HWID))
  CRYPT_END
END FUNCTION

FUNCTION VerifySerialNumberEx ( _
    BYREF RegistrationName AS STRING, BYREF SerialNumber AS STRING, _
    LicInfo AS LicenseInfo) AS LONG
  CRYPT_START
  LOCAL HWID AS STRING
  HWID = GetHardwareID()
  FUNCTION = EXECryptor_VerifySerialNumber( _
    STRPTR(RegistrationName), STRPTR(SerialNumber), _
    LicInfo, STRPTR(HWID))
  CRYPT_END
END FUNCTION

FUNCTION EXECryptor_DecodeSerialNumber SDECL ( _
    BYVAL RegistrationName AS ASCIIZ PTR, BYVAL SerialNumber AS ASCIIZ PTR, _
    LicInfo AS LicenseInfo, BYVAL HardwareID AS ASCIIZ PTR) EXPORT AS LONG
  LicInfo.LicType = 0
  LicInfo.UserParam = 0
  LicInfo.F1 = 1
  LicInfo.F2 = 1
  LicInfo.F3 = 1
  LicInfo.F4 = 1
  LicInfo.F5 = 1
  LicInfo.F6 = 1
  FUNCTION = %VR_OK
END FUNCTION

FUNCTION DecodeSerialNumber ( _
    BYREF RegistrationName AS STRING, BYREF SerialNumber AS STRING, _
    LicInfo AS LicenseInfo) AS LONG
  CRYPT_START
  LOCAL HWID AS STRING
  HWID = GetHardwareID()
  FUNCTION = EXECryptor_DecodeSerialNumber( _
    STRPTR(RegistrationName), STRPTR(SerialNumber), _
    LicInfo, STRPTR(HWID))
  CRYPT_END
END FUNCTION

FUNCTION IsRegistered SDECL ALIAS "EXECryptor_IsRegistered" () EXPORT AS DWORD
  RESERVE_SPACE
  FUNCTION = %VR_OK
END FUNCTION

FUNCTION RegConst_0 SDECL ALIAS "EXECryptor_RegConst_0" () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 0
END FUNCTION

FUNCTION RegConst_1 SDECL ALIAS "EXECryptor_RegConst_1" () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 1
END FUNCTION

FUNCTION RegConst_2 SDECL ALIAS "EXECryptor_RegConst_2" () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 2
END FUNCTION

FUNCTION RegConst_3 SDECL ALIAS "EXECryptor_RegConst_3" () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 3
END FUNCTION

FUNCTION RegConst_4 SDECL ALIAS "EXECryptor_RegConst_4" () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 4
END FUNCTION

FUNCTION RegConst_5 SDECL ALIAS "EXECryptor_RegConst_5" () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 5
END FUNCTION

FUNCTION RegConst_6 SDECL ALIAS "EXECryptor_RegConst_6" () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 6
END FUNCTION

FUNCTION RegConst_7 SDECL ALIAS "EXECryptor_RegConst_7" () EXPORT AS LONG
  RESERVE_SPACE
  FUNCTION = 7
END FUNCTION
