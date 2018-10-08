VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Key Generator for VB"
   ClientHeight    =   4665
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4665
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Exit"
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   4200
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Generate"
      Default         =   -1  'True
      Height          =   375
      Left            =   1440
      TabIndex        =   5
      Top             =   4200
      Width           =   1095
   End
   Begin VB.TextBox tRegistrationKey 
      Height          =   1335
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      Top             =   2760
      Width           =   4215
   End
   Begin VB.TextBox tHardwareID 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   2160
      Width           =   4215
   End
   Begin VB.TextBox tUserInfo 
      Alignment       =   2  'Center
      Height          =   1455
      Left            =   120
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   " Registered User (user@user.com)"
      Top             =   360
      Width           =   4215
   End
   Begin VB.Label Label2 
      Caption         =   "Registration key"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   2520
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Hardware ID"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   1920
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "User information"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  tRegistrationKey.Text = KeyGenText(tUserInfo.Text, tHardwareID.Text)
  KeyGenFile (tRegistrationKey.Text)
End Sub

Private Sub Command2_Click()
  End
End Sub
