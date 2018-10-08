VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FRMSTClear 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Autocleaning List"
   ClientHeight    =   4515
   ClientLeft      =   165
   ClientTop       =   405
   ClientWidth     =   8895
   HasDC           =   0   'False
   Icon            =   "FRMSTClear.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4515
   ScaleWidth      =   8895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   WhatsThisHelp   =   -1  'True
   Begin MSComctlLib.ListView LSTC 
      Height          =   3645
      Left            =   -15
      TabIndex        =   0
      Top             =   0
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
   Begin VB.Menu NMFiile 
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
      Begin VB.Menu MNEnable 
         Caption         =   "Enable"
      End
      Begin VB.Menu MNDelay 
         Caption         =   "Delay"
      End
   End
End
Attribute VB_Name = "FRMSTClear"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Activate()
    MNEnable.Checked = FRMMain.MNSTCleanerE.Checked
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyEscape Then Call MNClose_Click
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    If FRMMain.MNAERO.Checked = True Then AEROHack = 100

    LSTC.Height = FRMSTClear.Height - 630 - AEROHack
    LSTC.Width = FRMSTClear.Width - 70 - AEROHack

    If LSTC.ListItems.Count <= (LSTC.Height - 310) / 210 Then
        LSTC.ColumnHeaders(3).Width = FRMSTClear.Width - 1770 - AEROHack - 1000
    Else
        LSTC.ColumnHeaders(3).Width = FRMSTClear.Width - 2020 - AEROHack - 1000
    End If

    If LSTC.ColumnHeaders(3).Width < 2000 Then LSTC.ColumnHeaders(3).Width = 2000
End Sub

Private Sub Form_Unload(Cancel As Integer)

    If FRMSTClear.Visible = True Then Cancel = 1
    FRMSTClear.Hide
End Sub

Private Sub LSTC_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    On Error Resume Next

    If Button = 2 Then

        If IsNumeric(LSTC.SelectedItem.Index) = True Then
            MNDelete.Enabled = True
        Else
            MNDelete.Enabled = False
        End If

        PopupMenu POP
    End If

End Sub

Private Sub MNClose_Click()
    FRMSTClear.Hide
End Sub

Private Sub MNDelay_Click()

    CreateKey HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset"
    ACDelay = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Autocleaning Delay")

    If IsNumeric(ACDelay) = False Then ACDelay = 5000
    ACDelay = InputBox("Autocleaning Delay in milliseconds?", , ACDelay)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Autocleaning Delay", ACDelay

End Sub

Private Sub MNDelete_Click()

    On Error Resume Next

    LSTC.ListItems.Remove (LSTC.SelectedItem.Index)
    SaveSTClear
End Sub

Private Sub MNEnable_Click()

    If MNEnable.Checked = False Then
        MNEnable.Checked = True
        FRMMain.MNSTCleanerE.Checked = True
    Else
        MNEnable.Checked = False
        FRMMain.MNSTCleanerE.Checked = False
        DeleteValue HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Run", "Trial-Reset"
    End If

    SaveOptions
End Sub

Private Sub MNRemAll_Click()

    On Error Resume Next

    FRMSTClear.LSTC.ListItems.Clear
    SaveSTClear
    SetAttr VB.App.Path & "\AutocleaningList.ini", vbNormal
    Kill VB.App.Path & "\AutocleaningList.ini"
            
End Sub
