Attribute VB_Name = "API"
Option Explicit

Public Type TModeStatus
    ModeID               As Byte
    IsRegistered         As Boolean
    IsKeyPresent         As Boolean
    IsWrongHardwareID    As Boolean
    IsKeyExpired         As Boolean
    IsModeExpired        As Boolean
    IsBlackListedKey     As Boolean
    IsModeActivated      As Boolean
End Type

Declare Function apiGetRegistrationKeys Lib "aspr_ide.dll" Alias "GetRegistrationKeys" () As String
Declare Function apiGetRegistrationInformation Lib "aspr_ide.dll" Alias "GetRegistrationInformation" (ByVal ModeID As Byte, ByRef Key As String, ByRef Name As String) As Boolean
Declare Function apiRemoveKey Lib "aspr_ide.dll" Alias "RemoveKey" (ByVal ModeID As Byte) As Boolean
Declare Function apiCheckKey Lib "aspr_ide.dll" Alias "CheckKey" (ByVal Key As String, ByVal Name As String, ByRef ModeStatus As TModeStatus) As Boolean
Declare Function apiCheckKeyAndDecrypt Lib "aspr_ide.dll" Alias "CheckKeyAndDecrypt" (ByVal Key As String, ByVal Name As String, ByVal SaveKey As Boolean) As Boolean
Declare Function apiGetKeyDate Lib "aspr_ide.dll" Alias "GetKeyDate" (ByVal ModeID As Byte, ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer) As Boolean
Declare Function apiGetKeyExpirationDate Lib "aspr_ide.dll" Alias "GetKeyExpirationDate" (ByVal ModeID As Byte, ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer) As Boolean
Declare Function apiGetTrialDays Lib "aspr_ide.dll" Alias "GetTrialDays" (ByVal ModeID As Byte, ByRef Total As Long, ByRef Left As Long) As Boolean
Declare Function apiGetTrialExecs Lib "aspr_ide.dll" Alias "GetTrialExecs" (ByVal ModeID As Byte, ByRef Total As Long, ByRef Left As Long) As Boolean
Declare Function apiGetExpirationDate Lib "aspr_ide.dll" Alias "GetExpirationDate" (ByVal ModeID As Byte, ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer) As Boolean
Declare Function apiGetModeInformation Lib "aspr_ide.dll" Alias "GetModeInformation" (ByVal ModeID As Byte, ByRef ModeName As String, ByRef ModeStatus As TModeStatus) As Boolean
Declare Function apiGetHardwareID Lib "aspr_ide.dll" Alias "GetHardwareID" () As String
Declare Function apiGetHardwareIDEx Lib "aspr_ide.dll" Alias "GetHardwareIDEx" (ByVal ModeID As Byte) As String
Declare Function apiSetUserKey Lib "aspr_ide.dll" Alias "SetUserKey" (ByVal Key As String, ByVal KeySize As Long) As Boolean


' Win API Functions

Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Declare Function GetDesktopWindow Lib "user32" () As Long

Function GetRegistrationKeys() As String
Dim RegistrationKeys As String
   RegistrationKeys = apiGetRegistrationKeys()
   GetRegistrationKeys = Left(RegistrationKeys, InStr(RegistrationKeys, Chr(0)) - 1)
End Function

Function GetRegistrationInformation(ByVal ModeID As Byte, ByRef Key As String, ByRef Name As String) As Boolean
   
   Key = String$(255, 0)
   Name = String$(255, 0)

   GetRegistrationInformation = apiGetRegistrationInformation(ModeID, Key, Name)
   If GetRegistrationInformation Then
'      Key = Left(Key, InStr(Key, Chr(0)) - 1)
'      Name = Left(Name, InStr(Name, Chr(0)) - 1)
   Else
      Key = ""
      Name = ""
   End If
End Function

Function GetModeInformation(ByVal ModeID As Byte, ByRef ModeName As String, ByRef ModeStatus As TModeStatus)

   ModeName = String$(255, 0)

   If apiGetModeInformation(ModeID, ModeName, ModeStatus) = True Then
      ModeName = Left(ModeName, InStr(ModeName, Chr(0)) - 1)
      GetModeInformation = True
   Else
      ModeName = ""
      GetModeInformation = False
   End If

End Function
