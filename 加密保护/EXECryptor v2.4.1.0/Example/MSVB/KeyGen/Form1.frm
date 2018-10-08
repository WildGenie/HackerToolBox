VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "EXECryptor KeyGen Demo"
   ClientHeight    =   2025
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5640
   LinkTopic       =   "Form1"
   ScaleHeight     =   2025
   ScaleWidth      =   5640
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Create"
      Height          =   555
      Left            =   1920
      TabIndex        =   4
      Top             =   1260
      Width           =   1815
   End
   Begin VB.TextBox SerNumEdit 
      Height          =   315
      Left            =   1680
      TabIndex        =   3
      Top             =   600
      Width           =   3795
   End
   Begin VB.TextBox RegNameEdit 
      Height          =   315
      Left            =   1680
      TabIndex        =   1
      Top             =   180
      Width           =   3795
   End
   Begin VB.Label Label2 
      Caption         =   "Serial number:"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   660
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Registration name:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Dim obj As Object
  Set obj = CreateObject("eckeygen.EXECryptorKeyGen")
  Dim SerialNum As Variant
  Call obj.CreateSerialNumber("Example\MSVB\VBDemo\vbtest.ep2", RegNameEdit.Text, "", SerialNum)
  SerNumEdit.Text = SerialNum
  Set obj = Nothing
End Sub
