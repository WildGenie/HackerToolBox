VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FRMAbout 
   BackColor       =   &H80000004&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "About Trial-Reset"
   ClientHeight    =   7350
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5595
   Icon            =   "FRMAbout.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7350
   ScaleWidth      =   5595
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Visible         =   0   'False
   Begin MSComctlLib.ListView LVAbout 
      Height          =   6585
      Left            =   75
      TabIndex        =   2
      Top             =   675
      Width           =   5430
      _ExtentX        =   9578
      _ExtentY        =   11615
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Protectors"
         Object.Width           =   2716
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   2
         SubItemIndex    =   1
         Text            =   "Supported Version"
         Object.Width           =   3951
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   2
         SubItemIndex    =   2
         Text            =   "Last Version"
         Object.Width           =   2311
      EndProperty
   End
   Begin VB.Label Label35 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "(c) 2004-2010 The Boss"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   75
      TabIndex        =   1
      Top             =   390
      Width           =   5430
   End
   Begin VB.Label Version 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Trial-Reset"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   360
      Left            =   75
      TabIndex        =   0
      Top             =   15
      Width           =   5430
   End
End
Attribute VB_Name = "FRMAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()

    For t = 1 To LVAbout.ListItems.Count

        If LVAbout.ListItems(t).Tag <> "" Then If Left(LVAbout.ListItems(t).Tag, 4) <> "PLG_" Then ShellExecute FRMMain.hwnd, "open", LVAbout.ListItems(t).Tag, "", App.Path, 1
    Next

End Sub

Private Sub LVAbout_DblClick()

    If LVAbout.SelectedItem.Tag <> "" Then If Left(LVAbout.SelectedItem.Tag, 4) <> "PLG_" Then ShellExecute FRMMain.hwnd, "open", LVAbout.SelectedItem.Tag, "", App.Path, 1
End Sub
