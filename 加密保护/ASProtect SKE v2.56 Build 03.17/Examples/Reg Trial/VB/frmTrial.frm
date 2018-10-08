VERSION 5.00
Begin VB.Form frmTrial 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Trial"
   ClientHeight    =   2190
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2190
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnTrialExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   2520
      TabIndex        =   2
      Top             =   1680
      Width           =   1695
   End
   Begin VB.CommandButton btnTrialReg 
      Caption         =   "Registration"
      Height          =   375
      Left            =   480
      TabIndex        =   1
      Top             =   1680
      Width           =   1455
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "TRIAL EXPIRED !"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1080
      TabIndex        =   0
      Top             =   240
      Width           =   2325
   End
End
Attribute VB_Name = "frmTrial"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnTrialExit_Click()
  End
End Sub

Private Sub btnTrialReg_Click()
  frmRegistration.Show 1
End Sub

Private Sub Form_Unload(Cancel As Integer)
  End
End Sub

