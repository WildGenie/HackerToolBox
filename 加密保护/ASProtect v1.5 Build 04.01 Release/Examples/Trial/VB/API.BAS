Attribute VB_Name = "API"
Option Explicit

' There are run-time only calls of asprotect.dll
' You can play with run-time parameters by changing asprotect.ini
' They will be replaced with ASProtect API calls after protection

Declare Function apiGetRegistrationBuffer Lib "asprotect.dll" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function apiGetHardwareID Lib "asprotect.dll" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function apiGetTrialDays Lib "asprotect.dll" () As Long
Declare Function apiGetTrialExecs Lib "asprotect.dll" () As Long

' Win API Functions

Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Declare Function GetDesktopWindow Lib "user32" () As Long
Function GetRegName() As String
Dim RegName As String
    ' Receive a Registration Info from API's apiGetRegInfo function
     RegName = String$(255, 0)
     GetRegName = Left(RegName, apiGetRegistrationBuffer(RegName, InStr(RegName, Chr(0)) - 1))
End Function
Function GetHardwareKey() As String
Dim HardwareKey As String
    ' Receive a hardware key Info from API's apiGethardwareKey function
     HardwareKey = String$(255, 0)
     GetHardwareKey = Left(HardwareKey, apiGetHardwareID(HardwareKey, InStr(HardwareKey, Chr(0)) - 1))
End Function
