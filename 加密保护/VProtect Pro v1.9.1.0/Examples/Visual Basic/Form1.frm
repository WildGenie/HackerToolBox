VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "VProtect Sdk Example [Visual Basic]"
   ClientHeight    =   2145
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5010
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2145
   ScaleWidth      =   5010
   StartUpPosition =   2  '屏幕中心
   Begin VB.CommandButton Command3 
      Caption         =   "注册解码标记使用演示"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   1680
      Width           =   4695
   End
   Begin VB.CommandButton Command2 
      Caption         =   "检查密码（乱序加密）"
      Height          =   375
      Left            =   840
      TabIndex        =   3
      Top             =   1200
      Width           =   3015
   End
   Begin VB.CommandButton Command1 
      Caption         =   "检查密码（虚拟机加密）"
      Default         =   -1  'True
      Height          =   375
      Left            =   840
      TabIndex        =   2
      Top             =   720
      Width           =   3060
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   1920
      TabIndex        =   1
      Top             =   195
      Width           =   2775
   End
   Begin VB.Label Label1 
      Caption         =   "输入密码:"
      Height          =   255
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   1050
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  MsgBox "虚拟机加密演示。", vbInformation + vbOKOnly, "注意"
  '虚拟机加密演示
  '注意标记需要成对出现
  Call VarPtr("VP_Virtualize_Begin")
  '正确密码是 47
  If Val(Text1.Text) Mod 17 = 13 Then
   MsgBox "密码正确", vbInformation + vbOKOnly, "提示"
  Else
   MsgBox "密码错误", vbCritical + vbOKOnly, "错误"
   Text1.SetFocus
  End If
  
  Call VarPtr("VP_Virtualize_End")
End Sub

Private Sub Command2_Click()
  MsgBox "使用乱序引擎加密演示。", vbInformation + vbOKOnly, "注意"
  '使用乱序引擎加密演示
  '注意标记需要成对出现
  Call VarPtr("VP_Mutation_Begin")
  
  If Val(Text1.Text) Mod 17 = 13 Then
   MsgBox "密码正确", vbInformation + vbOKOnly, "提示"
  Else
   MsgBox "密码错误", vbCritical + vbOKOnly, "错误"
   Text1.SetFocus
  End If
  
  Call VarPtr("VP_Mutation_End")
End Sub

Private Sub Command3_Click()
  MsgBox "下面代码只在有一个正确授权文件情况下才会执行。", vbInformation + vbOKOnly, "注意"
  
  '使用注册解码加密演示
  '**注意：使用注册解码必须在加密时选择使用授权系统，
  '否则以下代码无效
  '注意标记需要成对出现
  Call VarPtr("VP_Regdecode_Begin")
  
  If Val(Text1.Text) Mod 17 = 13 Then
   MsgBox "密码正确", vbInformation + vbOKOnly, "提示"
  Else
   MsgBox "密码错误", vbCritical + vbOKOnly, "错误"
   Text1.SetFocus
  End If
  
  Call VarPtr("VP_Regdecode_End")
End Sub
