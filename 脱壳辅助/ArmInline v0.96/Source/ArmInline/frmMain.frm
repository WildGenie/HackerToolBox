VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ArmInline v0.96 Final - Admiral 2006"
   ClientHeight    =   6030
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   11460
   Icon            =   "frmMain.frx":0000
   KeyPreview      =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   402
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   764
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstProcesses 
      Height          =   2130
      IntegralHeight  =   0   'False
      ItemData        =   "frmMain.frx":0442
      Left            =   3540
      List            =   "frmMain.frx":0444
      TabIndex        =   34
      Top             =   210
      Width           =   3915
   End
   Begin VB.ListBox lstModules 
      Height          =   2130
      IntegralHeight  =   0   'False
      ItemData        =   "frmMain.frx":0446
      Left            =   7500
      List            =   "frmMain.frx":0448
      TabIndex        =   33
      Top             =   210
      Width           =   3915
   End
   Begin VB.Frame fraNanomites 
      Caption         =   "Nanomites"
      Height          =   1455
      Left            =   60
      TabIndex        =   23
      Top             =   4530
      Width           =   3435
      Begin VB.CheckBox chkManual 
         Caption         =   "Manually locate target"
         Height          =   195
         Left            =   210
         TabIndex        =   30
         Top             =   900
         Width           =   1875
      End
      Begin VB.CheckBox chkCmdLine 
         Caption         =   "Edit command-line"
         Height          =   195
         Left            =   210
         TabIndex        =   29
         Top             =   1140
         Width           =   1845
      End
      Begin VB.CommandButton cmdLoadNanomites 
         Caption         =   "Load"
         Height          =   345
         Left            =   2760
         TabIndex        =   28
         Top             =   990
         Width           =   555
      End
      Begin VB.CommandButton cmdSaveNanomites 
         Caption         =   "Save"
         Enabled         =   0   'False
         Height          =   345
         Left            =   2160
         TabIndex        =   27
         Top             =   990
         Width           =   555
      End
      Begin VB.CommandButton cmdRemoveNanomites 
         Caption         =   "Repair Dump"
         Enabled         =   0   'False
         Height          =   345
         Left            =   2160
         TabIndex        =   25
         Top             =   600
         Width           =   1155
      End
      Begin VB.CommandButton cmdLocateNanomites 
         Caption         =   "Locate"
         Height          =   345
         Left            =   2160
         TabIndex        =   11
         Top             =   210
         Width           =   1155
      End
      Begin VB.Label Label 
         Caption         =   "Step 2:  Remove"
         Height          =   195
         Index           =   8
         Left            =   210
         TabIndex        =   26
         Top             =   630
         Width           =   1875
      End
      Begin VB.Label Label 
         Caption         =   "Step 1:  Locate && Analyse"
         Height          =   195
         Index           =   10
         Left            =   210
         TabIndex        =   24
         Top             =   360
         Width           =   1905
      End
   End
   Begin VB.TextBox txtTargetLength 
      Height          =   285
      Left            =   2340
      MaxLength       =   8
      TabIndex        =   2
      Top             =   810
      Width           =   1035
   End
   Begin VB.TextBox txtTargetStart 
      Height          =   285
      Left            =   2340
      MaxLength       =   8
      TabIndex        =   1
      Top             =   510
      Width           =   1035
   End
   Begin VB.TextBox txtPID 
      Height          =   285
      Left            =   2340
      MaxLength       =   8
      TabIndex        =   0
      Top             =   210
      Width           =   1035
   End
   Begin VB.ListBox lstConsole 
      Height          =   3600
      IntegralHeight  =   0   'False
      ItemData        =   "frmMain.frx":044A
      Left            =   3540
      List            =   "frmMain.frx":044C
      TabIndex        =   12
      Top             =   2370
      Width           =   7875
   End
   Begin VB.Frame fraImportElimination 
      Caption         =   "Import Elimination"
      Height          =   1815
      Left            =   60
      TabIndex        =   16
      Top             =   2670
      Width           =   3435
      Begin VB.TextBox txtIATLength 
         Height          =   285
         Left            =   2280
         MaxLength       =   8
         TabIndex        =   8
         Top             =   540
         Width           =   1035
      End
      Begin VB.CommandButton cmdRebaseIAT 
         Caption         =   "Rebase IAT"
         Height          =   345
         Left            =   1800
         TabIndex        =   10
         Top             =   1350
         Width           =   1515
      End
      Begin VB.TextBox txtIATRebase 
         Height          =   285
         Left            =   2280
         MaxLength       =   8
         TabIndex        =   9
         Top             =   930
         Width           =   1035
      End
      Begin VB.TextBox txtIATStart 
         Height          =   285
         Left            =   2280
         MaxLength       =   8
         TabIndex        =   7
         Top             =   240
         Width           =   1035
      End
      Begin VB.Label Label 
         Alignment       =   1  'Right Justify
         Caption         =   "Length Of Existing IAT: 0x"
         Height          =   195
         Index           =   7
         Left            =   150
         TabIndex        =   22
         Top             =   570
         Width           =   2085
      End
      Begin VB.Label Label 
         Alignment       =   1  'Right Justify
         Caption         =   "New Base VA Of IAT: 0x"
         Height          =   195
         Index           =   6
         Left            =   270
         TabIndex        =   19
         Top             =   960
         Width           =   1965
      End
      Begin VB.Label Label 
         Alignment       =   1  'Right Justify
         Caption         =   "Base Of Existing IAT: 0x"
         Height          =   195
         Index           =   5
         Left            =   150
         TabIndex        =   18
         Top             =   270
         Width           =   2085
      End
   End
   Begin VB.Frame fraCodeSplicing 
      Caption         =   "Code Splicing"
      Height          =   1455
      Left            =   60
      TabIndex        =   13
      Top             =   1170
      Width           =   3435
      Begin VB.TextBox txtSpliceStart 
         Height          =   285
         Left            =   2280
         MaxLength       =   8
         TabIndex        =   3
         Top             =   270
         Width           =   1035
      End
      Begin VB.TextBox txtSpliceLength 
         Height          =   285
         Left            =   2280
         MaxLength       =   8
         TabIndex        =   4
         Top             =   570
         Width           =   1035
      End
      Begin VB.CommandButton cmdGo 
         Caption         =   "Remove Splices"
         Default         =   -1  'True
         Height          =   345
         Left            =   1800
         TabIndex        =   6
         Top             =   960
         Width           =   1515
      End
      Begin VB.CommandButton cmdUndo 
         Caption         =   "Undo"
         Height          =   345
         Left            =   900
         TabIndex        =   5
         Top             =   960
         Width           =   825
      End
      Begin VB.Label Label 
         Alignment       =   1  'Right Justify
         Caption         =   "Start Of Spliced Code: 0x"
         Height          =   195
         Index           =   2
         Left            =   300
         TabIndex        =   15
         Top             =   300
         Width           =   1935
      End
      Begin VB.Label Label 
         Alignment       =   1  'Right Justify
         Caption         =   "Length Of Spliced Code: 0x"
         Height          =   195
         Index           =   3
         Left            =   180
         TabIndex        =   14
         Top             =   600
         Width           =   2055
      End
   End
   Begin VB.Label LBLpROCESSES 
      BackStyle       =   0  'Transparent
      Caption         =   "(F5 to refresh)"
      Height          =   195
      Index           =   0
      Left            =   4470
      TabIndex        =   35
      Top             =   -30
      Width           =   1065
   End
   Begin VB.Label lblModules 
      Caption         =   "Modules:"
      Height          =   195
      Index           =   0
      Left            =   7500
      TabIndex        =   32
      Top             =   -30
      Width           =   2295
   End
   Begin VB.Label LBLpROCESSES 
      Caption         =   "Processes:"
      Height          =   195
      Index           =   9
      Left            =   3540
      TabIndex        =   31
      Top             =   -30
      Width           =   2295
   End
   Begin VB.Label Label 
      Alignment       =   1  'Right Justify
      Caption         =   "Length Of Target Code: 0x"
      Height          =   195
      Index           =   1
      Left            =   360
      TabIndex        =   21
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label Label 
      Alignment       =   1  'Right Justify
      Caption         =   "Start Of Target Code: 0x"
      Height          =   195
      Index           =   0
      Left            =   360
      TabIndex        =   20
      Top             =   540
      Width           =   1935
   End
   Begin VB.Label Label 
      Alignment       =   1  'Right Justify
      Caption         =   "(Slave) Process ID: 0x"
      Height          =   195
      Index           =   4
      Left            =   660
      TabIndex        =   17
      Top             =   240
      Width           =   1635
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu mnuACS 
         Caption         =   "Auto &Code Splicing"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuAIAT 
         Caption         =   "Auto &IAT"
         Checked         =   -1  'True
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuHAbout 
         Caption         =   "&About"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancelAnalysis_Click()
    CancelAuto = True
End Sub

Private Sub cmdGo_Click()
    frmMain.lstProcesses.Enabled = False
    frmMain.lstModules.Enabled = False
    DoCodeSplicing
    frmMain.lstProcesses.Enabled = True
    frmMain.lstModules.Enabled = True
End Sub

Private Sub cmdLoadNanomites_Click()
    LoadNanoTable
End Sub

Private Sub cmdLocateNanomites_Click()
    If chkCmdLine.Value = vbChecked Then
        CmdLine = InputBox("Specify any additional command-line parameters.", "Edit command-line", CmdLine)
    Else
        CmdLine = ""
    End If

    frmMain.lstProcesses.Enabled = False
    frmMain.lstModules.Enabled = False
    LocateNanomites
    frmMain.lstProcesses.Enabled = True
    frmMain.lstModules.Enabled = True
End Sub

Private Sub cmdRebaseIAT_Click()
    frmMain.lstProcesses.Enabled = False
    frmMain.lstModules.Enabled = False
    DoRebaseIAT
    frmMain.lstProcesses.Enabled = True
    frmMain.lstModules.Enabled = True
End Sub

Private Sub cmdRemoveNanomites_Click()
    RemoveNanomites
End Sub

Private Sub cmdSaveNanomites_Click()
    SaveNanoTable
End Sub

Private Sub cmdUndo_Click()
    Dim NewProtect  As Long
    Dim OldProtect  As Long
    Dim RetVal      As Long

    If ValidUndo = False Then
        Report "Nothing to undo."
        Exit Sub
    End If
    ValidUndo = False
    Report "Undoing..."
    NewProtect = PAGE_EXECUTE_READWRITE
    RetVal = VirtualProtectEx(hProcess, ByVal TStart, SLength, PAGE_EXECUTE_READWRITE, OldProtect)
    If RetVal = 0 Then
        Report "Unable to VirtualProtectEx target memory."
        Exit Sub
    End If
    RetVal = WriteProcessMemory(hProcess, ByVal TStart, BackupTarget(0), TLength, NumBytes)
    If RetVal = 0 Then
        Report "Unable to write target memory."
        Exit Sub
    End If
    RetVal = VirtualProtectEx(hProcess, ByVal TStart, SLength, OldProtect, NewProtect)
    If RetVal = 0 Then
        Report "Recoverable error: Unable to reprotect process memory."
        Exit Sub
    End If
    Report "Patch succesful."
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF5 Then RefreshProcesses
End Sub

Private Sub Form_Load()
    mnuACS.Checked = GetSetting("ArmInline", "Settings", "AutoCS", True)
    mnuAIAT.Checked = GetSetting("ArmInline", "Settings", "AutoIAT", True)
    Show
    RefreshProcesses
    lstConsole.AddItem "Ready."
End Sub

Private Sub Form_Unload(Cancel As Integer)
    SaveSetting "ArmInline", "Settings", "AutoCS", CStr(mnuACS.Checked)
    SaveSetting "ArmInline", "Settings", "AutoIAT", CStr(mnuAIAT.Checked)
    End
End Sub

Private Sub lstModules_Click()
    frmMain.lstConsole.Clear
    Report "Analysing module..."
    If lstProcesses.SelCount = 0 Then lstProcesses.Selected(0) = True
    UpToDate = False
    SelectModule lstProcesses.ItemData(lstProcesses.ListIndex), lstModules.ListIndex
End Sub

Private Sub lstProcesses_Click()
    UpToDate = False
    ListModules lstProcesses.ItemData(lstProcesses.ListIndex)
End Sub

Private Sub mnuACS_Click()
    mnuACS.Checked = Not mnuACS.Checked
End Sub

Private Sub mnuAIAT_Click()
    mnuAIAT.Checked = Not mnuAIAT.Checked
End Sub

Private Sub mnuFExit_Click()
    End
End Sub

Private Sub mnuHAbout_Click()
    frmAbout.Show
End Sub

Private Sub txtPID_Change()
    lstConsole.Clear
    frmMain.cmdRemoveNanomites.Enabled = False
    frmMain.cmdSaveNanomites.Enabled = False
End Sub

Private Sub txtPID_GotFocus()
    txtPID.SelStart = 0
    txtPID.SelLength = Len(txtPID.Text)
End Sub

Private Sub txtPID_LostFocus()
    txtPID.Text = UCase(txtPID.Text)
End Sub

Private Sub txtSpliceLength_GotFocus()
    txtSpliceLength.SelStart = 0
    txtSpliceLength.SelLength = Len(txtSpliceLength.Text)
End Sub

Private Sub txtSpliceLength_LostFocus()
    txtSpliceLength.Text = UCase(txtSpliceLength.Text)
End Sub

Private Sub txtSpliceStart_GotFocus()
    txtSpliceStart.SelStart = 0
    txtSpliceStart.SelLength = Len(txtSpliceStart.Text)
End Sub

Private Sub txtSpliceStart_LostFocus()
    txtSpliceStart.Text = UCase(txtSpliceStart.Text)
End Sub

Private Sub txtTargetLength_GotFocus()
    txtTargetLength.SelStart = 0
    txtTargetLength.SelLength = Len(txtTargetLength.Text)
End Sub

Private Sub txtTargetStart_GotFocus()
    txtTargetStart.SelStart = 0
    txtTargetStart.SelLength = Len(txtTargetStart.Text)
End Sub

Private Sub txtTargetStart_LostFocus()
    txtTargetStart.Text = UCase(txtTargetStart.Text)
End Sub

Private Sub txtTargetLength_LostFocus()
    txtTargetLength.Text = UCase(txtTargetLength.Text)
End Sub
