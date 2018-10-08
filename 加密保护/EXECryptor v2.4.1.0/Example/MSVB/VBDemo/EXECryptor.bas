Attribute VB_Name = "EXECryptor"
' EXECryptor API 2.3

Option Explicit

' code encryption marks
Public Declare Sub EXECryptor_CRYPT_START Lib "execryptorvb.dll" ()
Public Declare Sub EXECryptor_CRYPT_REG Lib "execryptorvb.dll" ()
Public Declare Sub EXECryptor_CRYPT_UNREG Lib "execryptorvb.dll" ()
Public Declare Sub EXECryptor_CRYPT_END Lib "execryptorvb.dll" ()

' general API
Public Declare Function EXECryptor_IsAppProtected Lib "execryptorvb.dll" () As Boolean

Private Declare Function EXECryptor_GetHardwareID Lib "execryptorvb.dll" () As Long
Private Declare Function EXECryptor_GetDate Lib "execryptorvb.dll" () As Long
Private Declare Function EXECryptor_GetReleaseDate Lib "execryptorvb.dll" () As Long
Private Declare Function EXECryptor_GetTrialDaysLeft Lib "execryptorvb.dll" (ByVal TrialPeriod As Long) As Long
Private Declare Function EXECryptor_GetTrialRunsLeft Lib "execryptorvb.dll" (ByVal TrialRuns As Long) As Long
Private Declare Sub EXECryptor_EncryptStr Lib "execryptorvb.dll" (ByVal Src As String, ByVal Dst As String)
Private Declare Sub EXECryptor_DecryptStr Lib "execryptorvb.dll" (ByVal Src As String, ByVal Dst As String)
Private Declare Function EXECryptor_SecureWrite Lib "execryptorvb.dll" (ByVal Name As String, ByVal value As String) As Boolean
Private Declare Function EXECryptor_SecureRead Lib "execryptorvb.dll" (ByVal Name As String, ByVal value As String) As Boolean
Private Declare Function EXECryptor_MessageBox Lib "execryptorvb.dll" (ByVal hWnd As Long, ByVal Text As String, ByVal Caption As String, ByVal DlgType As Long) As Long

' serial number support
Public Enum VerifyResult
  vrInvalid = 0
  vrExpire = 1
  vrStolen = 2
  vrOK = 3
End Enum

Public Type LicenseInfo
  LicType As Long
  UserParam As Long
  ExpireMonth As Long
  ExpireYear As Long
  F1 As Byte
  F2 As Byte
  F3 As Byte
  F4 As Byte
  F5 As Byte
  F6 As Byte
End Type

Private Declare Function EXECryptor_VerifySerialNumber Lib "execryptorvb.dll" ( _
  ByVal RegName As String, ByVal SerialNum As String, _
  ByRef LicInfo As LicenseInfo, ByVal HardwareID As String) As VerifyResult
Private Declare Function EXECryptor_DecodeSerialNumber Lib "execryptorvb.dll" ( _
  ByVal RegName As String, ByVal SerialNum As String, _
  ByRef LicInfo As LicenseInfo, ByVal HardwareID As String) As VerifyResult
Private Declare Function EXECryptor_IsRegistered Lib "execryptorvb.dll" () As VerifyResult

Public Function IsRegistered() As VerifyResult
  Call EXECryptor_CRYPT_START
  IsRegistered = EXECryptor_IsRegistered()
  Call EXECryptor_CRYPT_END
End Function

Public Function VerifySerialNumber( _
    ByVal RegName As String, ByVal SerialNum As String) As VerifyResult
  Call EXECryptor_CRYPT_START
  Dim LicInfo As LicenseInfo
  VerifySerialNumber = EXECryptor_VerifySerialNumber(RegName, SerialNum, _
    LicInfo, GetHardwareID)
  Call EXECryptor_CRYPT_END
End Function

Public Function VerifySerialNumberEx( _
    ByVal RegName As String, ByVal SerialNum As String, _
    ByRef LicInfo As LicenseInfo) As VerifyResult
  Call EXECryptor_CRYPT_START
  VerifySerialNumberEx = EXECryptor_VerifySerialNumber(RegName, SerialNum, _
    LicInfo, GetHardwareID)
  Call EXECryptor_CRYPT_END
End Function

Public Function DecodeSerialNumber( _
    ByVal RegName As String, ByVal SerialNum As String, _
    ByRef LicInfo As LicenseInfo) As VerifyResult
  Call EXECryptor_CRYPT_START
  DecodeSerialNumber = EXECryptor_DecodeSerialNumber(RegName, SerialNum, _
    LicInfo, GetHardwareID)
  Call EXECryptor_CRYPT_END
End Function

Public Function SecureRead(ByVal Name As String) As String
  Call EXECryptor_CRYPT_START
  Dim buff As String
  buff = String$(4096, 0)
  Call EXECryptor_SecureRead(Name, buff)
  SecureRead = Left(buff, InStr(buff, Chr(0)) - 1)
  Call EXECryptor_CRYPT_END
End Function

Public Sub SecureWrite(ByVal Name As String, ByVal value As String)
  Call EXECryptor_CRYPT_START
  Call EXECryptor_SecureWrite(Name, value)
  Call EXECryptor_CRYPT_END
End Sub

Public Function DecryptString(ByVal s As String) As String
  Call EXECryptor_CRYPT_START
  Dim buff As String
  buff = String$(Len(s) + 1, 0)
  Call EXECryptor_DecryptStr(s, buff)
  DecryptString = Left(buff, InStr(buff, Chr(0)) - 1)
  Call EXECryptor_CRYPT_END
End Function

Public Function EncryptString(ByVal s As String) As String
  Call EXECryptor_CRYPT_START
  Dim buff As String
  buff = String$(Len(s) * 3, 0)
  Call EXECryptor_EncryptStr(s, buff)
  EncryptString = Left(buff, InStr(buff, Chr(0)) - 1)
  Call EXECryptor_CRYPT_END
End Function

Public Function GetTrialDaysLeft(ByVal TrialPeriod As Long) As Long
  Call EXECryptor_CRYPT_START
  GetTrialDaysLeft = EXECryptor_GetTrialDaysLeft(TrialPeriod)
  Call EXECryptor_CRYPT_END
End Function

Public Function GetTrialRunsLeft(ByVal TrialRuns As Long) As Long
  Call EXECryptor_CRYPT_START
  GetTrialRunsLeft = EXECryptor_GetTrialRunsLeft(TrialRuns)
  Call EXECryptor_CRYPT_END
End Function

Public Sub SafeMessageBox(ByVal Text As String, ByVal Caption As String, ByVal DlgType As Long)
  Call EXECryptor_CRYPT_START
  Call EXECryptor_MessageBox(0, Text, Caption, DlgType)
  Call EXECryptor_CRYPT_END
End Sub

Public Function GetHardwareID() As String
  Call EXECryptor_CRYPT_START
  Dim hwid, i As Long
  Dim hwids As String
  hwid = EXECryptor_GetHardwareID
  hwids = ""
  For i = 1 To 8
    hwids = hwids + Mid("0123456789ABCDEF", (hwid And &HF) + 1, 1)
    hwid = Int(hwid / 16) And &HFFFFFFF
  Next i
  GetHardwareID = hwids
  Call EXECryptor_CRYPT_END
End Function

Public Sub SafeGetDate(ByRef Year As Long, ByRef Month As Long, ByRef Day As Long)
  Call EXECryptor_CRYPT_START
  Dim dt As Long
  dt = EXECryptor_GetDate
  Day = dt And &H1F
  Month = Int(dt / 32) And &HF
  Year = Int(dt / 512) + 1980
  Call EXECryptor_CRYPT_END
End Sub

Public Sub GetReleaseDate(ByRef Year As Long, ByRef Month As Long, ByRef Day As Long)
  Call EXECryptor_CRYPT_START
  Dim dt As Long
  dt = EXECryptor_GetReleaseDate
  Day = dt And &H1F
  Month = Int(dt / 32) And &HF
  Year = Int(dt / 512) + 1980
  Call EXECryptor_CRYPT_END
End Sub

