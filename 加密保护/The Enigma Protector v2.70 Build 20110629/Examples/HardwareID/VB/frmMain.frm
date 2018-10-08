VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Registered application"
   ClientHeight    =   3360
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5235
   LinkTopic       =   "Form1"
   ScaleHeight     =   3360
   ScaleWidth      =   5235
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnDelete 
      Caption         =   "Delete local key"
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   2400
      Width           =   1335
   End
   Begin VB.CommandButton btnRegister 
      Caption         =   "Register"
      Height          =   375
      Left            =   2160
      TabIndex        =   8
      Top             =   2400
      Width           =   1335
   End
   Begin VB.TextBox tKey 
      Height          =   285
      Left            =   120
      TabIndex        =   7
      Top             =   1920
      Width           =   4935
   End
   Begin VB.TextBox tUserInfo 
      Height          =   285
      Left            =   120
      TabIndex        =   5
      Top             =   1320
      Width           =   4935
   End
   Begin VB.TextBox tHardware 
      Height          =   315
      Left            =   1440
      TabIndex        =   3
      Top             =   600
      Width           =   3615
   End
   Begin VB.CommandButton btnClose 
      Caption         =   "Close"
      Height          =   375
      Left            =   3720
      TabIndex        =   0
      Top             =   2400
      Width           =   1335
   End
   Begin VB.Label lbUserInfo 
      Caption         =   "NOT REGISTERED"
      Height          =   255
      Left            =   1800
      TabIndex        =   11
      Top             =   2880
      Width           =   3255
   End
   Begin VB.Label Label5 
      Caption         =   "Registered user:"
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   2880
      Width           =   1455
   End
   Begin VB.Label Label4 
      Caption         =   "Registration key"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1680
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "User information"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "HardwareID"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   1095
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "This is example of using of Enigma API for VB application"
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
      TabIndex        =   1
      Top             =   120
      Width           =   5055
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub btnClose_Click()
    End
End Sub

Private Sub btnDelete_Click()
    EP_RegDeleteKey
End Sub

Private Sub btnRegister_Click()
    Dim Name As String
    Dim Key As String
      
  If EP_RegCheckAndSaveKey(tUserInfo.Text, tKey.Text) = 1 Then
    If EP_RegLoadKey(Name, Key) = 1 Then
      lbUserInfo.Caption = Name
      MsgBox "Thanks for registration", vbInformation
    End If
  Else
    MsgBox "Invalid key", vbExclamation
  End If
End Sub

Private Sub Form_Load()
    Dim Name As String
    Dim Key As String

  tHardware.Text = EP_RegHardwareID
  If EP_RegLoadAndCheckKey = 1 Then
    If EP_RegLoadKey(Name, Key) = 1 Then
      tUserInfo.Text = Name
      tKey.Text = Key
      lbUserInfo.Caption = Name
    End If
  Else
    MsgBox "Register this software to remove message!", vbExclamation
  End If
     
End Sub

