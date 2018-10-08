Attribute VB_Name = "Module1"
Private Type ASP_PARAMS
    RegInfo As String 'address of buffer for registration information
    RegInfoLen As Long 'size in bytes of registration information
    HardwareID As String 'hardware ID (base64)
    A As String 'constants from project file ('Key' section)
    E As String ' -//-
    N As String ' -//-
    RegKey As String 'buffer for registration key
    RegKeySize As Long  'size in bytes of registration key
   'Expiration date - should be 0 if you don't need it
    Day   As Byte    'Day
    Month As Byte    'Month
    Year  As Integer 'Year
End Type

Private Declare Function CheckHardwareID Lib "keygen.dll" (ByVal HardwareID As String) As Long
Private Declare Function RegistrationKeyGenerate Lib "keygen.dll" (aspParams As ASP_PARAMS) As Long
Private Declare Function RegistrationKeySave Lib "keygen.dll" (ByVal FileName As String, ByVal RegistrySubKey As String, ByVal RegistryKey As String, ByVal RegistrationKey As String) As Long
Private Declare Function RegistrationKeyGenerateProject Lib "keygen.dll" (ByVal lpProjectFileName As String, ByVal lpRegInfo As String, ByVal lpHardwareID As String, ByVal lpRegKeyFileName As String) As Long

Function KeyGenHardwareID(HardwareID As String) As Boolean

    If CheckHardwareID(HardwareID) = 0 Then
        KeyGenHardwareID = False
    Else
        KeyGenHardwareID = True
    End If

End Function

Function KeyGenText(StrUserInfo As String, StrHardwareID As String) As String
 
    Dim aspParams As ASP_PARAMS
    Dim KeyStr As String
    Dim KeyText As String

    aspParams.RegInfo = StrUserInfo & vbNullChar
    aspParams.RegInfoLen = Len(StrUserInfo)
    aspParams.HardwareID = StrHardwareID & vbNullChar

    aspParams.A = "SahqUZft3hfIzx7XhMLr/A==" & vbNullChar
    aspParams.E = "iex+hjO8FQcdxCAqVjvW20dKIBeqZDWYgW8sXAKBhxaewHwc3m3e5Wkykzt9yRX1tkK/0V2jy42o2oKULp0unkf31JTfL+TsCQWTIATt9IjrbdK/mJv0HsYAhbdJr+QQh20CVwrwocxP9foUrkUedZijKtRE8/NuOEijp5EXPH0=" & vbNullChar
    aspParams.N = "7/bjxkM0GGdnj7zMFMbN/PvBhQ5RyTNOxtoApRc3fs4qRA4EUVqbipB3LxzEChBz7CR4UWc9rvCOqsveEM53t4zdMPAGZE/9Uelt96byKlT22azRFXQvbvLF2wbAXJrEkvKoaTS9uib7e5RRRdiEyZeMnrm4vjbbGIE+7562XoE=" & vbNullChar

    KeyStr = String$(1024, 0)

    aspParams.RegKey = KeyStr
    aspParams.RegKeySize = Len(KeyStr)

    If KeyGenHardwareID(aspParams.HardwareID) = False Then
        MsgBox "Error! Invalid HardwareID key!", vbCritical
    Else

      If RegistrationKeyGenerate(aspParams) = 0 Then
          MsgBox "Error! Need " + Str(aspParams.RegKeySize) + " bytes for a buffer", vbCritical
      Else
          KeyGenText = Left(aspParams.RegKey, InStr(aspParams.RegKey, Chr(0)) - 1)
          KeyGenFile (KeyGenText)
      End If

      Call KeyGenWithProject(StrUserInfo, StrHardwareID)

    End If

End Function

Sub KeyGenFile(RegKey As String)
    Call RegistrationKeySave(App.Path & "\regkey.key", "HKEY_CURRENT_USER\SOFTWARE\Test", "Key", RegKey)
End Sub

Sub KeyGenWithProject(lpRegInfo As String, lpHardwareID As String)
    Call RegistrationKeySave(App.Path & "\regkey.key", "HKEY_CURRENT_USER\SOFTWARE\Test", "Key", RegKey)
    Call RegistrationKeyGenerateProject(App.Path & "\keygen.aspr", lpRegInfo, lpHardwareID, App.Path & "\regkey_project.key")
End Sub
