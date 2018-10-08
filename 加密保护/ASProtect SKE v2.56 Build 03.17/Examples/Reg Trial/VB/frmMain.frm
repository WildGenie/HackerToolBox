VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Trial Example for VB"
   ClientHeight    =   3195
   ClientLeft      =   5295
   ClientTop       =   4560
   ClientWidth     =   4500
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4500
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnBuy 
      Caption         =   "Buy"
      Height          =   375
      Left            =   1680
      TabIndex        =   4
      Top             =   2640
      Width           =   1095
   End
   Begin VB.CommandButton btnRegistration 
      Caption         =   "Registration"
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton btnMainExit 
      Caption         =   "Exit"
      Height          =   375
      Index           =   0
      Left            =   240
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label lRegInfo 
      Alignment       =   2  'Center
      Caption         =   "Label2"
      Height          =   1695
      Left            =   360
      TabIndex        =   2
      Top             =   720
      Width           =   3855
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Advanced Application 1.0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   840
      TabIndex        =   0
      Top             =   240
      Width           =   2895
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub btnBuy_Click()
  Call ShellExecute(GetDesktopWindow, "open", "http://www.aspack.com/register.htm", "", "", 1)
End Sub

Private Sub btnMainExit_Click(Index As Integer)
  End
End Sub

Private Sub btnRegistration_Click()
  frmRegistration.Show 1
End Sub

Function ProcessRegistration()
Dim UserKey As String
Dim UserName As String

Dim ModeName As String
Dim ModeStatus As TModeStatus

Dim TrialDaysTotal As Long
Dim TrialDaysLeft As Long

    lRegInfo.Caption = "TRIAL EXPIRED!"
    GetRegistrationInformation 0, UserKey, UserName

    ' Check to see if they are registered?

    If Len(UserKey) > 0 Then

       ' If Yes, then get the registered user info so that it can be displayed.

       ' NOTE: You can put few marks here for an isolating of code
       '
       ' You should use the following format of marks:
       ' "[MARK_BEGINxx]" - mark of fragment's begin
       ' "[MARK_ENDxx]"   - mark of fragment's end
       ' xx - any sections number (1..15)

       Const asBEGIN1 = "[MARK_BEGIN1]"

       Call GetModeInformation(0, ModeName, ModeStatus)

       btnBuy.Visible = False
       ' btnRegistration.Visible = False

       lRegInfo.Caption = "Registered version:" + vbCrLf
       lRegInfo.Caption = lRegInfo.Caption + "Key: " + vbCrLf + UserKey + vbCrLf
       lRegInfo.Caption = lRegInfo.Caption + "Name: " + vbCrLf + UserName + vbCrLf + vbCrLf
       lRegInfo.Caption = lRegInfo.Caption + "Mode Name: " + ModeName

       If ModeStatus.IsRegistered Then
          lRegInfo.Caption = lRegInfo.Caption + vbCrLf + "Mode is REGISTERED!"
       End If

       Const asEND1 = "[MARK_END001]"


       Const asBEGIN2 = "[MARK_BEGIN01]"

       MsgBox "Registered Action !", vbInformation, "Registration Info"

       Const asEND2 = "[MARK_END1]"

    Else
       ' If No, then check to see how many days left in the trial period.

       If apiGetTrialDays(0, TrialDaysTotal, TrialDaysLeft) Then

        If TrialDaysLeft = 0 Then
           btnBuy.Visible = True
           lRegInfo.Caption = "TRIAL EXPIRED!"

           ' or
           Hide
           frmTrial.Show
          Else
           lRegInfo.Caption = "UNREGISTERED VERSION" + Chr(13) + Chr(10) + Chr(13) + Chr(10) + "You have" + Str(TrialDaysLeft) + " day(s) left !"
          End If

       End If

    End If

End Function

Private Sub Form_Load()
    MsgBox "This example shows the work in Trial mode", vbInformation, "Information"
    ProcessRegistration
End Sub

Private Sub Form_Unload(Cancel As Integer)
  End
End Sub
