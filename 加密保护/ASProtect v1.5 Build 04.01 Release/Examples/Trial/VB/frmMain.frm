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
   Begin VB.CommandButton btnRegistration 
      Caption         =   "Registration"
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
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
      Height          =   615
      Left            =   1080
      TabIndex        =   2
      Top             =   960
      Width           =   2295
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

Private Sub btnRegistration_Click()
  frmRegistration.Show
End Sub

Private Sub Command1_Click(Index As Integer)
  End
End Sub
Private Sub Form_Load()
  
Dim RegInfo As String
      
    MsgBox "This example shows the work in trial mode" + Chr(13) + Chr(10) + "Don't  forget to protect the example in order to see the work of ASProtect API", vbInformation, "Information"
     
    RegInfo = GetRegName
    
    ' Check to see if they are registered?
    
    If Len(RegInfo) <> 0 Then
       
       btnRegistration.Visible = False
    
       ' If Yes, then get the registered user info so that it can be displayed.
       
       ' NOTE: You can put few marks here for an isolating of code
       '
       ' You should use the following format of marks:
       ' "[MARK_BEGINxx]" - mark of fragment's begin
       ' "[MARK_ENDxx]"   - mark of fragment's end
       ' xx - any number
       
       Const asBEGIN1 = "[MARK_BEGIN1]"
       
       lRegInfo.Caption = "Registered version" + Chr(13) + Chr(10) + "User : " + RegInfo
       
       Const asEND1 = "[MARK_END1]"
       
       Const asBEGIN2 = "[MARK_BEGIN2]"
       
       MsgBox "Registered Action !", vbInformation, "Registration Info"
       
       Const asEND2 = "[MARK_END2]"
    
    Else
       ' If No, then check to see how many days left in the trial period.
       
       If apiGetTrialDays <= 0 Then
          Hide
          frmTrial.Show
       Else
         lRegInfo.Caption = "UNREGISTERED VERSION" + Chr(13) + Chr(10) + Chr(13) + Chr(10) + "You have" + Str(apiGetTrialDays) + " day(s) left !"
       End If
       
    End If
  
End Sub

Private Sub Form_Unload(Cancel As Integer)
  End
End Sub


