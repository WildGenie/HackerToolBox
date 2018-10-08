VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FRMProtect 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Protected  List"
   ClientHeight    =   4515
   ClientLeft      =   165
   ClientTop       =   405
   ClientWidth     =   8895
   HasDC           =   0   'False
   Icon            =   "FRMProtect.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4515
   ScaleWidth      =   8895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   WhatsThisHelp   =   -1  'True
   Begin MSComctlLib.ListView LSTProt 
      Height          =   3645
      Left            =   -15
      TabIndex        =   0
      Top             =   -30
      Width           =   7770
      _ExtentX        =   13705
      _ExtentY        =   6429
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDragMode     =   1
      OLEDropMode     =   1
      Checkboxes      =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      OLEDragMode     =   1
      OLEDropMode     =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "System"
         Object.Width           =   2822
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Type"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Address"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Menu POP 
      Caption         =   "POP"
      Visible         =   0   'False
      Begin VB.Menu MNDelete 
         Caption         =   "Remove"
      End
   End
   Begin VB.Menu MNFiile 
      Caption         =   "File"
      Begin VB.Menu MNRemAll 
         Caption         =   "Remove All"
      End
      Begin VB.Menu MNClose 
         Caption         =   "Close Window"
      End
   End
   Begin VB.Menu MNOptions 
      Caption         =   "Options"
      Begin VB.Menu MNHidePK 
         Caption         =   "Hide Protect Key"
      End
   End
End
Attribute VB_Name = "FRMProtect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Activate()
    MNHidePK.Checked = FRMMain.MNHideProtectedKey.Checked
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyEscape Then Call MNClose_Click
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    If FRMMain.MNAERO.Checked = True Then AEROHack = 100
    
    LSTProt.Height = FRMProtect.Height - 630 - AEROHack
    LSTProt.Width = FRMProtect.Width - 70 - AEROHack

    If LSTProt.ListItems.Count <= (LSTProt.Height - 310) / 210 Then
        LSTProt.ColumnHeaders(3).Width = FRMProtect.Width - 1770 - AEROHack - 1000
    Else
        LSTProt.ColumnHeaders(3).Width = FRMProtect.Width - 2020 - AEROHack - 1000
    End If

    If LSTProt.ColumnHeaders(3).Width < 2000 Then LSTProt.ColumnHeaders(3).Width = 2000
End Sub

Private Sub Form_Unload(Cancel As Integer)

    If FRMProtect.Visible = True Then Cancel = 1
    FRMProtect.Hide
End Sub

Private Sub LSTProt_MouseDown(Button As Integer, _
                              Shift As Integer, _
                              x As Single, _
                              y As Single)

    On Error Resume Next

    If Button = 2 Then
        If IsNumeric(LSTProt.SelectedItem.Index) = True Then
            MNDelete.Enabled = True
        Else
            MNDelete.Enabled = False
        End If

        PopupMenu POP
    End If

End Sub

Private Sub MNClose_Click()
    FRMProtect.Hide
End Sub

Private Sub MNDelete_Click()

    On Error Resume Next

    LSTProt.ListItems.Remove (LSTProt.SelectedItem.Index)
    SaveProt
End Sub

Private Sub MNHidePK_Click()

    If MNHidePK.Checked = False Then
        FRMMain.MNHideProtectedKey.Checked = True
        MNHidePK.Checked = True
    Else
        FRMMain.MNHideProtectedKey.Checked = False
        MNHidePK.Checked = False
    End If

    SaveOptions
End Sub

Private Sub RemAll_Click()

    On Error Resume Next

    FRMProtect.LSTProt.ListItems.Clear
    SaveProt
    SetAttr VB.App.Path & "\ProtectedList.ini", vbNormal
    Kill VB.App.Path & "\ProtectedList.ini"
            
End Sub

