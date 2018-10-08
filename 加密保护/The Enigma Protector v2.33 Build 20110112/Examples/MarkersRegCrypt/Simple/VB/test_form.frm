VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1875
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6405
   LinkTopic       =   "Form1"
   ScaleHeight     =   1875
   ScaleWidth      =   6405
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Execute ""Reg Crypt"" marker"
      Height          =   375
      Left            =   1440
      TabIndex        =   0
      Top             =   1200
      Width           =   3615
   End
   Begin VB.Label Label1 
      Caption         =   "The example shows how to work Reg Crypt marker. Click ""Execute marker"" button to executed the code insode the marker"
      Height          =   735
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   6135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Call VarPtr("REG_CRYPT_BEGIN1")
  MsgBox "Section #1 is unlocked by key!"
  Call VarPtr("REG_CRYPT_END1")
  Call VarPtr("REG_CRYPT_BEGIN2")
  MsgBox "Section #2 is unlocked by key!"
  Call VarPtr("REG_CRYPT_END2")
  Call VarPtr("REG_CRYPT_BEGIN3")
  MsgBox "Section #3 is unlocked by key!"
  Call VarPtr("REG_CRYPT_END3")
  Call VarPtr("REG_CRYPT_BEGIN4")
  MsgBox "Section #4 is unlocked by key!"
  Call VarPtr("REG_CRYPT_END4")
  Call VarPtr("REG_CRYPT_BEGIN5")
  MsgBox "Section #5 is unlocked by key!"
  Call VarPtr("REG_CRYPT_END5")
  MsgBox "If you did not see any message then this application is not registered or key does not unlock any section!"
End Sub
