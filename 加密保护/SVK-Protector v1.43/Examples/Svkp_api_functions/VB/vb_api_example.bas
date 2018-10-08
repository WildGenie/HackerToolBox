Attribute VB_Name = "Module1"
Option Explicit

'There we declare SVKP's special functions'
 Public Declare Function SVKP_GetRegistrationInformation Lib "SPECIAL.DLL" _
    (ByVal reginfoptr As String) As Long

Public Declare Function SVKP_LockKeyboard Lib "SPECIAL.DLL" _
    () As Long

Public Declare Function SVKP_UnLockKeyboard Lib "SPECIAL.DLL" _
    () As Long

Public Declare Function SVKP_KillDebugger Lib "SPECIAL.DLL" _
    () As Long



Sub Main()
Dim RegistrationInformation As String
Dim Flag As Boolean

'first we will lock keyboard'
SVKP_LockKeyboard

'now we will check for debuggers'
SVKP_KillDebugger

RegistrationInformation = String$(255, 0)
Flag = False
Flag = SVKP_GetRegistrationInformation(RegistrationInformation)
If Flag = True Then
MsgBox RegistrationInformation, vbInformation, "Registered Action!"
Else
MsgBox "Unregistered user!", vbInformation, "UnRegistered Action!"
End If

SVKP_UnLockKeyboard

End Sub
