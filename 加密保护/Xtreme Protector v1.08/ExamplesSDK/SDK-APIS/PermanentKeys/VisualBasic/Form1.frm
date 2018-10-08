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
    
    If IsRegistered Then
    
        Call GetLicenseInfo(Regname, RegOrg, RegMemo) 'RegName = Registered Name , RegOrg = Registered Organization
        TempBuffer = "Application is Registered " & Regname
        TempBuffer2 = "Days Left = " & RegisteredGetDaysToExpire & vbCrLf & "Executions Left = " & RegisteredGetExecutionsToExpire
        MsgBox TempBuffer, vbInformation + vbOKOnly, "REGISTERED Version"
        MsgBox TempBuffer2
    Else
        TempBuffer = "Days to Expire = " & DemoGetDaysToExpire & " Executions left = " & DemoGetExecutionsToExpire
        MsgBox TempBuffer, vbCritical + vbOKOnly, "XProtector"
    End If
    
End Sub

Private Sub Command2_Click()

    End

End Sub
