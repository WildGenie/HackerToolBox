VERSION 5.00
Begin VB.Form frmRegistration 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Registration"
   ClientHeight    =   3450
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5205
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3450
   ScaleWidth      =   5205
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Index           =   0
      Left            =   1560
      TabIndex        =   6
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   3000
      Width           =   1215
   End
   Begin VB.TextBox tRegKey 
      Height          =   1335
      Left            =   120
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      Top             =   1560
      Width           =   4935
   End
   Begin VB.CommandButton btnSend 
      Caption         =   "Send"
      Height          =   375
      Left            =   3840
      TabIndex        =   2
      Top             =   480
      Width           =   1215
   End
   Begin VB.TextBox tHardwareID 
      BackColor       =   &H80000004&
      Height          =   315
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   3615
   End
   Begin VB.Label Label2 
      Caption         =   "Enter your registration key below, please:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Width           =   3615
   End
   Begin VB.Label Label1 
      Caption         =   "Please send yor Hardware ID to the author"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
End
Attribute VB_Name = "frmRegistration"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnSend_Click()
  Call ShellExecute(0, "open", "mailto:support@aspack.com?subject= Hardware ID" + tHardwareID.Text, "", "", 1)
End Sub

Private Sub Command1_Click()
Const HKEY_CURRENT_USER = &H80000001
Dim Rs As Boolean

  Rs = UpdateKey(HKEY_CURRENT_USER, "SOFTWARE\Test", "Key", tRegKey.Text)

  If Rs = True Then
     MsgBox "Thank you for registration! Please restart the application!"
     End
  Else
     MsgBox "Error!"
  End If
End Sub

Private Sub Command2_Click(Index As Integer)
  Hide
End Sub
Private Sub Form_Load()
    tHardwareID.Text = GetHardwareKey
End Sub
Private Sub Form_Unload(Cancel As Integer)
  End
End Sub



