VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "SDK APIs / Temporal Keys Example"
   ClientHeight    =   1590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6180
   LinkTopic       =   "Form1"
   ScaleHeight     =   1590
   ScaleWidth      =   6180
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Exit"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   5775
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Call XProtector APIs in VB Language"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   5775
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()

    MsgBox "This example shows the use of Xprotector SDK-APIS in VB language", vbInformation + vbOKOnly, "XProtector"
    
    Call VarPtr("CLEAR_START")
    
        MsgBox "This is a CLEAR block decrypted!", vbInformation + vbOKOnly, "XProtector"
    
    Call VarPtr("CLEAR_END")
            
        MsgBox "This goes Decrypted", vbInformation + vbOKOnly, "XProtector"
            
    Call VarPtr("ENCODE_START")
    
        MsgBox "This is a DECODE block decrypted", vbInformation + vbOKOnly, "XProtector"
    
    Call VarPtr("ENCODE_END")
           
        MsgBox "This goes Decrypted", vbInformation + vbOKOnly, "XProtector"
           
    Call VarPtr("REGISTERED_START")
    
        MsgBox "This is a REGISTERED block decrypted", vbInformation + vbOKOnly, "XProtector"
    
    Call VarPtr("REGISTERED_END")
           
           
    
End Sub

Private Sub Command2_Click()

    End

End Sub

Private Sub Form_Load()

    Dim XprotMacro As String
    
End Sub
