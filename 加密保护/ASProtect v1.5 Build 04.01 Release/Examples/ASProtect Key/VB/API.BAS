Attribute VB_Name = "Module1"
Option Explicit

' There are run-time only calls of asprotect.dll
' You can play with run-time parameters by changing asprotect.ini
' They will be replaced with ASProtect API calls after protection

Declare Function apiGetRegistrationBuffer Lib "asprotect.dll" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function apiGetTrialDays Lib "asprotect.dll" () As Long
Declare Function apiGetTrialExecs Lib "asprotect.dll" () As Long

Sub Main()
Dim RegInfo As String
      
    RegInfo = GetRegName
    
    ' Check to see if they are registered?
    
    If Len(RegInfo) <> 0 Then
    
       ' If Yes, then get the registered user info so that it can be displayed.
       
       ' NOTE: You can put few marks here for an isolating of code
       '
       ' You should use the following format of marks:
       ' "[MARK_BEGINxx]" - mark of fragment's begin
       ' "[MARK_ENDxx]"   - mark of fragment's end
       ' xx - any number
       
       Const asBEGIN1 = "[MARK_BEGIN1]"
       RegInfo = "Registered version" + Chr(13) + Chr(10) + "User : " + RegInfo
       MsgBox RegInfo, vbInformation, "Registration Info"
       Const asEND1 = "[MARK_END1]"
       
       Const asBEGIN2 = "[MARK_BEGIN2]"
       MsgBox "Registered Action !", vbInformation, "Registration Info"
       Const asEND2 = "[MARK_END2]"
    
    Else
          
       ' If No, then check to see how many days left in the trial period.
             
       MsgBox "Unregistered version! You have" + Str(apiGetTrialDays) + " day(s) left !", vbCritical
       
       ' or you can use
       ' MsgBox "Software was not registered ! You have" + Str(apiGetTrialExecs) + " execution(s) left !", vbCritical
       
    End If
    
End Sub
Function GetRegName() As String
Dim RegName As String
   
    ' Receive a Registration Info from API's apiGetRegInfo function
    
     RegName = String$(255, 0)
     GetRegName = Left(RegName, apiGetRegistrationBuffer(RegName, InStr(RegName, Chr(0)) - 1))
  
End Function

