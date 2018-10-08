VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FRMToolbar 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Customize Toolbar"
   ClientHeight    =   3420
   ClientLeft      =   120
   ClientTop       =   660
   ClientWidth     =   6015
   Icon            =   "FRMToolbar.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3420
   ScaleWidth      =   6015
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin MSComctlLib.ListView ListView1 
      Height          =   1425
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2310
      _ExtentX        =   4075
      _ExtentY        =   2514
      View            =   2
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      Checkboxes      =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Menu MNOptions 
      Caption         =   "Options"
      Begin VB.Menu MNEnableAll 
         Caption         =   "Enable All"
      End
      Begin VB.Menu MNDisableALL 
         Caption         =   "Disable All"
      End
      Begin VB.Menu MNSeparator 
         Caption         =   "-"
      End
      Begin VB.Menu MNShowPlugins 
         Caption         =   "Show Plugins on Toolbars"
      End
      Begin VB.Menu MNDoubleTB 
         Caption         =   "Double ToolsBar"
      End
   End
End
Attribute VB_Name = "FRMToolbar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Activate()
    MNShowPlugins.Checked = FRMMain.MNShowPluginInBar.Checked
    MNDoubleTB.Checked = FRMMain.MNDoubleToolsTab.Checked
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    If FRMMain.MNAERO.Checked = True Then AEROHack = 100

    ListView1.Height = FRMToolbar.Height - 630 - AEROHack
    ListView1.Width = FRMToolbar.Width - 70 - AEROHack

    If ListView1.ListItems.Count <= (ListView1.Height - 310) / 210 Then
        ListView1.ColumnHeaders(2).Width = FRMToolbar.Width - 1770 - AEROHack
    Else
        ListView1.ColumnHeaders(2).Width = FRMToolbar.Width - 2020 - AEROHack
    End If

End Sub

Private Sub ListView1_Click()
    SaveTBCustomize
End Sub

Private Sub MNDisableALL_Click()

    For t = 1 To ListView1.ListItems.Count

        FRMToolbar.ListView1.ListItems(t).Checked = False
    Next

    SaveTBCustomize
End Sub

Private Sub MNDoubleTB_Click()

    If MNDoubleTB.Checked = False Then
        FRMMain.MNDoubleToolsTab.Checked = True
        MNDoubleTB.Checked = True
    Else
        FRMMain.MNDoubleToolsTab.Checked = False
        MNDoubleTB.Checked = False
    End If

    Call ResizeWin
    Call SaveOptions

End Sub

Private Sub MNEnableAll_Click()

    For t = 1 To ListView1.ListItems.Count

        FRMToolbar.ListView1.ListItems(t).Checked = True
    Next

    SaveTBCustomize
End Sub

Private Sub MNShowPlugins_Click()

    If MNShowPlugins.Checked = False Then
        FRMMain.MNShowPluginInBar.Checked = True
        MNShowPlugins.Checked = True
    Else
        FRMMain.MNShowPluginInBar.Checked = False
        MNShowPlugins.Checked = False
    End If

    Call SaveOptions

    SaveTBCustomize
End Sub
