' EXECryptor API 2.3

' return values for VerifySerialNumber[Ex]/DecodeSerialNumber/IsRegistered

CONST vrInvalid = 0
CONST vrExpired = 1
CONST vrStolen = 2
CONST vrOK = 3

TYPE LicenseInfo
  DEF LicType AS UINT     ' 0..15 (license type)
  DEF UserParam AS UINT   ' 0..1023
  DEF ExpiryMonth AS UINT ' 1..12
  DEF ExpiryYear AS UINT  ' 2004..2024
  DEF F1 AS SCHAR
  DEF F2 AS SCHAR
  DEF F3 AS SCHAR
  DEF F4 AS SCHAR
  DEF F5 AS SCHAR
  DEF F6 AS SCHAR
ENDTYPE

$ifndef EXECRYPTOR_MAIN
DECLARE EXTERN EXECryptor_IsAppProtected(), SCHAR
DECLARE EXTERN EXECryptor_GetEXECryptorVersion(), STRING
DECLARE EXTERN GetReleaseDate (DateDay AS INT BYREF, DateMonth AS INT BYREF, DateYear AS INT BYREF)
DECLARE EXTERN EXECryptor_AntiDebug()
DECLARE EXTERN EXECryptor_ProtectImport()
DECLARE EXTERN GetHardwareID(), STRING
DECLARE EXTERN SafeGetDate (DateDay AS INT BYREF, DateMonth AS INT BYREF, DateYear AS INT BYREF)
DECLARE EXTERN EXECryptor_GetTrialDaysLeft(TrialPeriod AS INT), INT
DECLARE EXTERN EXECryptor_GetTrialRunsLeft(TrialRuns AS INT), INT
DECLARE EXTERN EncryptStr (Src AS STRING BYREF), STRING
DECLARE EXTERN DecryptStr (Src AS STRING BYREF), STRING
DECLARE EXTERN SecureRead(ValName AS STRING BYREF), STRING
DECLARE EXTERN SecureWrite(ValName AS STRING BYREF, Value AS STRING BYREF), INT
DECLARE EXTERN EXECryptor_MessageBox(hwnd AS INT,lpText AS STRING,lpCaption AS STRING,wType AS INT),INT

DECLARE EXTERN VerifySerialNumber (RegistrationName AS STRING BYREF, SerialNumber AS STRING BYREF), INT
DECLARE EXTERN VerifySerialNumberEx (RegistrationName AS STRING BYREF, SerialNumber AS STRING BYREF, LicInfo AS LicenseInfo BYREF), INT
DECLARE EXTERN DecodeSerialNumber (RegistrationName AS STRING BYREF, SerialNumber AS STRING BYREF, LicInfo AS LicenseInfo BYREF), INT

DECLARE EXTERN EXECryptor_IsRegistered(),INT
DECLARE EXTERN EXECryptor_RegConst_0(),INT
DECLARE EXTERN EXECryptor_RegConst_1(),INT
DECLARE EXTERN EXECryptor_RegConst_2(),INT
DECLARE EXTERN EXECryptor_RegConst_3(),INT
DECLARE EXTERN EXECryptor_RegConst_4(),INT
DECLARE EXTERN EXECryptor_RegConst_5(),INT
DECLARE EXTERN EXECryptor_RegConst_6(),INT
DECLARE EXTERN EXECryptor_RegConst_7(),INT
$endif
