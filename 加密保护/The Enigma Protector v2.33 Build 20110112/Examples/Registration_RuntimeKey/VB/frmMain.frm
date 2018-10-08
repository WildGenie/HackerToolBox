VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4830
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7560
   LinkTopic       =   "Form1"
   ScaleHeight     =   4830
   ScaleWidth      =   7560
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   6840
      Top             =   600
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   375
      Left            =   6240
      TabIndex        =   4
      Top             =   3120
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Enter another registration key to test Run-time limit of registration key"
      Height          =   1695
      Left            =   240
      TabIndex        =   3
      Top             =   3000
      Width           =   5895
      Begin VB.CommandButton cRegister 
         Caption         =   "Register"
         Height          =   375
         Left            =   4440
         TabIndex        =   7
         Top             =   1200
         Width           =   1215
      End
      Begin VB.TextBox tKey 
         Height          =   375
         Left            =   1200
         TabIndex        =   6
         Top             =   720
         Width           =   4455
      End
      Begin VB.TextBox tName 
         Height          =   375
         Left            =   1200
         TabIndex        =   5
         Top             =   240
         Width           =   4455
      End
      Begin VB.Label Label4 
         Caption         =   "Key"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   720
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Name"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.ListBox lMessages 
      Height          =   1230
      ItemData        =   "frmMain.frx":0000
      Left            =   240
      List            =   "frmMain.frx":0002
      TabIndex        =   2
      Top             =   1680
      Width           =   7095
   End
   Begin VB.Label Label2 
      Caption         =   "This example checks license each second."
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   1320
      Width           =   7095
   End
   Begin VB.Label Label1 
      Caption         =   $"frmMain.frx":0004
      Height          =   975
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   7095
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  Timer1.Enabled = False
  End
End Sub

Private Sub cRegister_Click()
  If EP_RegCheckAndSaveKey(tName.Text, tKey.Text) Then
    MsgBox ("New license is valid and installed!")
  Else
    MsgBox ("License is invalid!")
  End If
End Sub

Private Sub ShowOurMessage(AMessage As String)
  lMessages.AddItem ("[" + FormatDateTime(Now, vbLongTime) + "] " + AMessage)
  lMessages.Selected(lMessages.ListCount - 1) = True
End Sub


Private Sub Timer1_Timer()
  Dim Total As Long
  Dim Left As Long
  If EP_RegLoadAndCheckKey Then
    If EP_RegKeyRuntime(Total, Left) Then
      ShowOurMessage ("Valid license, total runtime minute(s) " + Str$(Total) + ", left " + Str$(Left))
    Else
      ShowOurMessage ("License is valid, but not runtime limited!")
    End If
  Else
    ShowOurMessage ("License is invalid!")
  End If
End Sub
