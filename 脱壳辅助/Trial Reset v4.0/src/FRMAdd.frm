VERSION 5.00
Begin VB.Form FRMAdd 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Add Custom Key"
   ClientHeight    =   990
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   7620
   Icon            =   "FRMAdd.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   990
   ScaleWidth      =   7620
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.ComboBox CMPType 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      ItemData        =   "FRMAdd.frx":000C
      Left            =   4665
      List            =   "FRMAdd.frx":003A
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   120
      Width           =   1725
   End
   Begin VB.CommandButton CMDCancel 
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   6480
      TabIndex        =   5
      Top             =   105
      Width           =   1050
   End
   Begin VB.TextBox TXTSystem 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   885
      TabIndex        =   3
      Top             =   120
      Width           =   3735
   End
   Begin VB.CommandButton CMDSave 
      Caption         =   "Save"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   6480
      TabIndex        =   2
      Top             =   525
      Width           =   1050
   End
   Begin VB.TextBox TXTKey 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   885
      TabIndex        =   0
      Top             =   525
      Width           =   5490
   End
   Begin VB.Label Label3 
      Caption         =   "System:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   75
      TabIndex        =   4
      Top             =   195
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Address:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   60
      TabIndex        =   1
      Top             =   555
      Width           =   795
   End
End
Attribute VB_Name = "FRMAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub CMDCancel_Click()
    TXTKey = ""
    FRMAdd.Hide
End Sub

Private Sub CMDSave_Click()
    
    TXTKey1 = DecodePath(TXTKey, CMPType.Text)

    If (CMPType.ListIndex = 0 Or CMPType.ListIndex = 1 Or CMPType.ListIndex = 2 Or CMPType.ListIndex = 3) Then
        If UCase(Left(TXTKey1, 5)) <> "HKEY_" Then MsgBox "Invalid registry name", vbCritical: Exit Sub
    End If
    
    If (CMPType.ListIndex = 10 Or CMPType.ListIndex = 4 Or CMPType.ListIndex = 5 Or CMPType.ListIndex = 6 Or CMPType.ListIndex = 7) Then
        If Mid(TXTKey1, 2, 2) <> ":\" Then MsgBox "Invalid name", vbCritical: Exit Sub
    End If
    
    If CMPType.ListIndex = 9 Then
        If Left(UCase(TXTKey1), 5) <> "DISK:" Then MsgBox "Disk Sector uses the form 'Disk:<DiskNum> Sector:<SecNum>'", vbCritical: Exit Sub
    End If
    
    FRMAdd.Hide

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyReturn Then Call CMDSave_Click
    If KeyCode = vbKeyEscape Then Call CMDCancel_Click
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Cancel = 0
    Call CMDCancel_Click
End Sub
