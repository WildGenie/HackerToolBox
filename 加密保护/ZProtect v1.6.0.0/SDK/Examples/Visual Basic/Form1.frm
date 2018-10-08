VERSION 6.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Zprotect VB Demo"
   ClientHeight    =   1200
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4530
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1200
   ScaleWidth      =   4530
   StartUpPosition =   2  
   Begin VB.CommandButton Command1 
      Caption         =   "Check"
      Default         =   -1  'True
      Height          =   375
      Left            =   3450
      TabIndex        =   2
      Top             =   165
      Width           =   900
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   1080
      TabIndex        =   1
      Top             =   195
      Width           =   2175
   End
   Begin VB.Label Label2 
      Caption         =   "!! This demo only shows how to use Zprotect VM Marker in Visual Basic !!"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   720
      Width           =   3975
   End
   Begin VB.Label Label1 
      Caption         =   "Password:"
      Height          =   255
      Left            =   135
      TabIndex        =   0
      Top             =   240
      Width           =   810
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

  Call VarPtr("VM_START") 'Zprotect VM Start Marker
  
  If Text1.Text = "Zprotect" Then
   MsgBox "Correct password", vbInformation + vbOKOnly, "Information"
  Else
   MsgBox "Incorrect password", vbCritical + vbOKOnly, "Error"
   Text1.SetFocus
  End If
  
  Call VarPtr("VM_VMEND") 'Zprotect VM End Marker
  
End Sub
