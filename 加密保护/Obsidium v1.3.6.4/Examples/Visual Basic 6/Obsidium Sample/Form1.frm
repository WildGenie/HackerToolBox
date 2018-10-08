VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1
   Caption         =   "Visual Basic Sample App"
   ClientHeight    =   750
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3375
   LinkTopic       =   "Form1"
   MaxButton       =   0
   MinButton       =   0
   ScaleHeight     =   750
   ScaleWidth      =   3375
   StartUpPosition =   3
   Begin VB.CommandButton btnSysID 
      Caption         =   "Show system ID"
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   120
      Width           =   1575
   End
   Begin VB.CommandButton btnShowInfo 
      Caption         =   "Show license info"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function getRegInfo Lib "dummy.dll" (ByVal dwInfoNr As Long, ByRef lpInfo As Byte) As Boolean
Private Declare Function isRegistered Lib "dummy.dll" () As Boolean
Private Declare Sub CallMark Lib "dummy.dll" (ByVal dwMagic As Long)
Private Declare Function getSystemID Lib "dummy.dll" (ByRef lpBuffer As Byte) As Boolean
Private Declare Sub setExternalKey Lib "dummy.dll" (ByRef lpKey As Byte, ByVal dwSize As Long)
Private Declare Sub setKeyfile Lib "dummy.dll" (ByRef lpStr As Byte)
Private Declare Function getTrialDays Lib "dummy.dll" () As Integer
Private Declare Function getTrialRuns Lib "dummy.dll" () As Integer

Private Const CALLMARK_REG_START As Long = &HDEFACED
Private Const CALLMARK_REG_END As Long = &HDEADF00D

Private Sub btnShowInfo_Click()

  If isRegistered() Then

    Call CallMark(CALLMARK_REG_START)
    
    Dim regInfo(0 To 32) As Byte
    Dim strRegInfo As String
    
    Call getRegInfo(0, regInfo(0))
    strRegInfo = StrConv(regInfo, vbUnicode)
    MsgBox strRegInfo

    Call CallMark(CALLMARK_REG_END)
  Else
    MsgBox "Unregistered"
  End If
  
  
End Sub

Private Sub btnSysID_Click()
  
  Dim sysid(0 To 32) As Byte
  
  If getSystemID(sysid(0)) Then
    
    Dim strSystemID As String
    
    strSystemID = StrConv(sysid, vbUnicode)
    MsgBox strSystemID
  Else
    MsgBox "Cannot retrieve system ID"
  End If

End Sub
