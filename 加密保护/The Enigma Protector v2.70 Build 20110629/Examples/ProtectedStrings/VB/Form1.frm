VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3225
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5640
   LinkTopic       =   "Form1"
   ScaleHeight     =   3225
   ScaleWidth      =   5640
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   375
      Left            =   1920
      TabIndex        =   6
      Top             =   2760
      Width           =   1695
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   240
      TabIndex        =   5
      Top             =   2280
      Width           =   5175
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   1440
      Width           =   5175
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   600
      Width           =   5175
   End
   Begin VB.Label Label3 
      Caption         =   "3rd protected string"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1920
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "2nd protected string"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   1080
      Width           =   1695
   End
   Begin VB.Label Label1 
      Caption         =   "1st protected string"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
End
End Sub

Private Sub Form_Load()
Dim Lenght As Byte
Dim Str As String

Length = EP_ProtectedStringByKey("fyi6z02Y", vbNullString, 0)
Str = String$(Length, 0)
If EP_ProtectedStringByKey("fyi6z02Y", Str, Length) > 0 Then
  Text1.Text = Str
End If

Length = EP_ProtectedStringByID(1, vbNullString, 0)
Str = String$(Length, 0)
If EP_ProtectedStringByID(1, Str, Length) > 0 Then
  Text2.Text = Str
End If

Length = EP_ProtectedStringByKey("26Lu66Er", vbNullString, 0)
Str = String$(Length, 0)
If EP_ProtectedStringByKey("26Lu66Er", Str, Length) > 0 Then
  Text3.Text = Str
End If

End Sub
