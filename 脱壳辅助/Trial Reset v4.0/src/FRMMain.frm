VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FRMMain 
   Caption         =   "Trial-Reset"
   ClientHeight    =   8310
   ClientLeft      =   225
   ClientTop       =   555
   ClientWidth     =   11880
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   161
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   HasDC           =   0   'False
   Icon            =   "FRMMain.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   NegotiateMenus  =   0   'False
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   8310
   ScaleWidth      =   11880
   Begin MSComctlLib.ImageList IconList 
      Left            =   270
      Top             =   1425
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   52
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":030A
            Key             =   ""
            Object.Tag             =   "Defalt"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":0464
            Key             =   ""
            Object.Tag             =   "All"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":09FE
            Key             =   ""
            Object.Tag             =   "Checked"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":0F98
            Key             =   ""
            Object.Tag             =   "FileList"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":1532
            Key             =   ""
            Object.Tag             =   "ACProtect"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":1ACC
            Key             =   ""
            Object.Tag             =   "ActiveMark"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":2066
            Key             =   ""
            Object.Tag             =   "Armadillo"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":2600
            Key             =   ""
            Object.Tag             =   "ASProtect"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":2B9A
            Key             =   ""
            Object.Tag             =   "DBPE"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":3134
            Key             =   ""
            Object.Tag             =   "EncryptPE"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":36CE
            Key             =   ""
            Object.Tag             =   "Enigma"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":3C68
            Key             =   ""
            Object.Tag             =   "ExeCryptor"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":4202
            Key             =   ""
            Object.Tag             =   "ExeShield"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":479C
            Key             =   ""
            Object.Tag             =   "Expressor"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":4D36
            Key             =   ""
            Object.Tag             =   "FlexNet"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":52D0
            Key             =   ""
            Object.Tag             =   "Ice License"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":586A
            Key             =   ""
            Object.Tag             =   "IntelliLock"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":5E04
            Key             =   ""
            Object.Tag             =   "License Protector"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":639E
            Key             =   ""
            Object.Tag             =   "Manco Licensing"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":6938
            Key             =   ""
            Object.Tag             =   "Nalpeiron"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":6ED2
            Key             =   ""
            Object.Tag             =   "Net Reactor"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":746C
            Key             =   ""
            Object.Tag             =   "NoCopy"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":7A06
            Key             =   ""
            Object.Tag             =   "NTkrnl Protector"
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":7FA0
            Key             =   ""
            Object.Tag             =   "Obsidium"
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":853A
            Key             =   ""
            Object.Tag             =   "OneWay"
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":8AD4
            Key             =   ""
            Object.Tag             =   "Orien"
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":906E
            Key             =   ""
            Object.Tag             =   "PCGuard"
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":9608
            Key             =   ""
            Object.Tag             =   "ProActivate"
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":9BA2
            Key             =   ""
            Object.Tag             =   "ProtectionPlus"
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":A13C
            Key             =   ""
            Object.Tag             =   "ProtectShareware"
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":A6D6
            Key             =   ""
            Object.Tag             =   "Protexis Licensing"
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":AC70
            Key             =   ""
            Object.Tag             =   "Safengine Licensor"
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":B20A
            Key             =   ""
            Object.Tag             =   "SafeSerial"
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":B7A4
            Key             =   ""
            Object.Tag             =   "SDProtector"
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":BD3E
            Key             =   ""
            Object.Tag             =   "SGLicenser"
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":C2D8
            Key             =   ""
            Object.Tag             =   "ShareGuard"
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":C872
            Key             =   ""
            Object.Tag             =   "Sheriff"
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":CE0C
            Key             =   ""
            Object.Tag             =   "SoftLocx"
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":D3A6
            Key             =   ""
            Object.Tag             =   "SoftSentry"
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":D940
            Key             =   ""
            Object.Tag             =   "SoftWrap"
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":DEDA
            Key             =   ""
            Object.Tag             =   "STProtector"
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":E474
            Key             =   ""
            Object.Tag             =   "SVKP"
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":EA0E
            Key             =   ""
            Object.Tag             =   "Thinstall"
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":EFA8
            Key             =   ""
            Object.Tag             =   "VBOLock"
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":F542
            Key             =   ""
            Object.Tag             =   "VBox"
         EndProperty
         BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":FADC
            Key             =   ""
            Object.Tag             =   "VisualProtect"
         EndProperty
         BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":10076
            Key             =   ""
            Object.Tag             =   "WinLicense"
         EndProperty
         BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":10610
            Key             =   ""
            Object.Tag             =   "Xheo Licensing"
         EndProperty
         BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":10BAA
            Key             =   ""
            Object.Tag             =   "XProtector"
         EndProperty
         BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":11144
            Key             =   ""
            Object.Tag             =   "ZipWorx"
         EndProperty
         BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":116DE
            Key             =   ""
            Object.Tag             =   "ZProtect"
         EndProperty
         BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMain.frx":11C78
            Key             =   ""
            Object.Tag             =   "ZXProtector"
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton CMDAbort 
      Appearance      =   0  'Flat
      Caption         =   "Abort"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   9690
      OLEDropMode     =   1  'Manual
      TabIndex        =   4
      Top             =   9780
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.CommandButton CMDPause 
      Appearance      =   0  'Flat
      Caption         =   "Pause"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   8970
      OLEDropMode     =   1  'Manual
      TabIndex        =   3
      Top             =   9780
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   585
      Top             =   480
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   105
      Top             =   480
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   105
      Top             =   930
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000004&
      DrawStyle       =   2  'Dot
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   630
      ScaleHeight     =   1.353
      ScaleLeft       =   1
      ScaleMode       =   0  'User
      ScaleWidth      =   1.353
      TabIndex        =   5
      Top             =   945
      Visible         =   0   'False
      Width           =   375
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   285
      Left            =   0
      TabIndex        =   2
      Top             =   8025
      Width           =   11880
      _ExtentX        =   20955
      _ExtentY        =   503
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   18230
            MinWidth        =   18230
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.Width           =   2
            MinWidth        =   2
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.Width           =   2010
            MinWidth        =   2010
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDropMode     =   1
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   7755
      Left            =   1290
      TabIndex        =   0
      Top             =   15
      Width           =   10410
      _ExtentX        =   18362
      _ExtentY        =   13679
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      MultiSelect     =   -1  'True
      LabelWrap       =   0   'False
      HideSelection   =   0   'False
      OLEDragMode     =   1
      OLEDropMode     =   1
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      SmallIcons      =   "IconList"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      OLEDragMode     =   1
      OLEDropMode     =   1
      NumItems        =   0
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Height          =   330
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   1170
      _ExtentX        =   2064
      _ExtentY        =   582
      ButtonWidth     =   609
      ButtonHeight    =   582
      Style           =   1
      _Version        =   393216
      MousePointer    =   1
      OLEDropMode     =   1
   End
   Begin VB.Menu File 
      Caption         =   "File"
      Begin VB.Menu MNSaveList 
         Caption         =   "Save List"
      End
      Begin VB.Menu MNLoadList 
         Caption         =   "Load List"
      End
      Begin VB.Menu MNRefresh 
         Caption         =   "Refresh Status"
      End
      Begin VB.Menu MNResetList 
         Caption         =   "Reset List"
      End
      Begin VB.Menu MNShowProtecList 
         Caption         =   "Show Protected List"
      End
      Begin VB.Menu MNShowSTClear 
         Caption         =   "Show Autocleaning List"
      End
      Begin VB.Menu MNExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu POP 
      Caption         =   "Edit"
      Begin VB.Menu MNJumpToRegEdit 
         Caption         =   "Jump to..."
      End
      Begin VB.Menu MNView 
         Caption         =   "View Preview"
      End
      Begin VB.Menu SEP1 
         Caption         =   "-"
      End
      Begin VB.Menu MNCopyKey 
         Caption         =   "Copy Key Address"
      End
      Begin VB.Menu MNDeleteKey 
         Caption         =   "Deleter key"
      End
      Begin VB.Menu MNBackupKey 
         Caption         =   "Backup Key"
      End
      Begin VB.Menu MNRemoveItem 
         Caption         =   "Remove from list"
      End
      Begin VB.Menu MNAddToProtectKeyList 
         Caption         =   "Add to Protect List"
      End
      Begin VB.Menu MNAddToClearSTList 
         Caption         =   "Add to Autocleaning List"
      End
      Begin VB.Menu SEP2 
         Caption         =   "-"
      End
      Begin VB.Menu MNAddKey 
         Caption         =   "Add Custom Key"
      End
   End
   Begin VB.Menu Options 
      Caption         =   "Options"
      Begin VB.Menu MNStayOnTop 
         Caption         =   "Stay On Top"
      End
      Begin VB.Menu MNMinimizeOnTray 
         Caption         =   "Minimize to System Tray"
      End
      Begin VB.Menu MNOnlyOneInstance 
         Caption         =   "Only One Instance"
      End
      Begin VB.Menu MNNativeAPI 
         Caption         =   "Enable Native API"
      End
      Begin VB.Menu MNAutoBackup 
         Caption         =   "Auto Backup"
      End
      Begin VB.Menu MNFixedSizeList 
         Caption         =   "Disable Auto-Size List"
      End
      Begin VB.Menu MNDataTimeColumn 
         Caption         =   "Disable Date/Time Column"
      End
      Begin VB.Menu MNHideTypeCol 
         Caption         =   "Hide Type Column"
      End
      Begin VB.Menu MNShowOrdCol 
         Caption         =   "Show Number Column"
      End
      Begin VB.Menu MNShowCheckBox 
         Caption         =   "Show CheckBox"
      End
      Begin VB.Menu MNNotClearLSTScan 
         Caption         =   "Disable Clear List Before Scan"
      End
      Begin VB.Menu MNSaveWindowPosition 
         Caption         =   "Save Window Position"
      End
      Begin VB.Menu MNHideFLTB 
         Caption         =   "Hide Keys List Button"
      End
      Begin VB.Menu MNHideProtectedKey 
         Caption         =   "Hide Protect Key"
      End
      Begin VB.Menu MNDisableSectScan 
         Caption         =   "Disable Disk Sector Scan"
      End
      Begin VB.Menu MNCustomizeToolbar 
         Caption         =   "Customize Toolbar"
      End
      Begin VB.Menu MNCreateLog 
         Caption         =   "Enable Log"
      End
      Begin VB.Menu MNAERO 
         Caption         =   "Enable AERO Graphic"
      End
      Begin VB.Menu MNWoWTrans 
         Caption         =   "WoW64"
         Begin VB.Menu MNWoW64 
            Caption         =   "Auto"
            Index           =   0
         End
         Begin VB.Menu MNWoW64 
            Caption         =   "32Bit"
            Index           =   1
         End
         Begin VB.Menu MNWoW64 
            Caption         =   "64bit"
            Index           =   2
         End
         Begin VB.Menu MNWoW64 
            Caption         =   "Both"
            Index           =   3
         End
      End
      Begin VB.Menu MNTrasparency 
         Caption         =   "Opacity"
         Begin VB.Menu MNOpacityP 
            Caption         =   "10%"
            Index           =   1
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "20%"
            Index           =   2
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "30%"
            Index           =   3
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "40%"
            Index           =   4
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "50%"
            Index           =   5
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "60%"
            Index           =   6
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "70%"
            Index           =   7
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "80%"
            Index           =   8
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "90%"
            Index           =   9
         End
         Begin VB.Menu MNOpacityP 
            Caption         =   "100%"
            Checked         =   -1  'True
            Index           =   10
         End
      End
      Begin VB.Menu MNToolbarCol 
         Caption         =   "Toolbar Columns"
         Begin VB.Menu MNTBCol 
            Caption         =   "1"
            Index           =   0
         End
         Begin VB.Menu MNTBCol 
            Caption         =   "2"
            Index           =   1
         End
         Begin VB.Menu MNTBCol 
            Caption         =   "3"
            Index           =   2
         End
         Begin VB.Menu MNTBCol 
            Caption         =   "4"
            Index           =   3
         End
         Begin VB.Menu MNTBCol 
            Caption         =   "5"
            Index           =   4
         End
      End
      Begin VB.Menu MNDriver 
         Caption         =   "Drive Select"
         Begin VB.Menu MNDrive 
            Caption         =   "Drive"
            Index           =   0
         End
      End
      Begin VB.Menu MNSTCleaner 
         Caption         =   "Autocleaning at Startup"
         Begin VB.Menu MNSTCleanerE 
            Caption         =   "Enable"
         End
         Begin VB.Menu MNSTCDelay 
            Caption         =   "Delay"
         End
      End
      Begin VB.Menu MNPriority 
         Caption         =   "Priority"
         Begin VB.Menu MNPriorityL 
            Caption         =   "TIME_CRITICAL"
            Index           =   0
         End
         Begin VB.Menu MNPriorityL 
            Caption         =   "HIGHEST"
            Index           =   1
         End
         Begin VB.Menu MNPriorityL 
            Caption         =   "ABOVE_NORMAL"
            Index           =   2
         End
         Begin VB.Menu MNPriorityL 
            Caption         =   "NORMAL"
            Index           =   3
         End
         Begin VB.Menu MNPriorityL 
            Caption         =   "BELOW_NORMAL"
            Index           =   4
         End
         Begin VB.Menu MNPriorityL 
            Caption         =   "LOWEST"
            Index           =   5
         End
         Begin VB.Menu MNPriorityL 
            Caption         =   "IDLE"
            Index           =   6
         End
      End
      Begin VB.Menu MNRegeditJumpM 
         Caption         =   "Regedit Jump Mode"
         Begin VB.Menu MNRegJumpNormal 
            Caption         =   "Normal"
         End
         Begin VB.Menu MNRegJumpAdvanced 
            Caption         =   "Advanced"
         End
      End
      Begin VB.Menu MNLVSortBy 
         Caption         =   "Sort List By"
         Begin VB.Menu MNLVSort 
            Caption         =   "System"
            Index           =   1
         End
         Begin VB.Menu MNLVSort 
            Caption         =   "Type"
            Index           =   2
         End
         Begin VB.Menu MNLVSort 
            Caption         =   "Address"
            Index           =   3
         End
         Begin VB.Menu MNLVSort 
            Caption         =   "Date/Time"
            Index           =   4
         End
         Begin VB.Menu MNLVSort 
            Caption         =   "Status"
            Index           =   5
         End
         Begin VB.Menu MNLVSort 
            Caption         =   "Not Sorted"
            Index           =   6
         End
      End
      Begin VB.Menu MNNukeStopM 
         Caption         =   "Nuke-Stop"
         Begin VB.Menu MNNukeStop 
            Caption         =   "Activate"
         End
         Begin VB.Menu MNNukeInterval 
            Caption         =   "Set Interval"
         End
      End
   End
   Begin VB.Menu ShellPop 
      Caption         =   "ShellPop"
      Visible         =   0   'False
      Begin VB.Menu MNShoWindow 
         Caption         =   "Show Window"
      End
      Begin VB.Menu MNEnd 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu Help 
      Caption         =   "Help"
      Begin VB.Menu MNHelpMenu 
         Caption         =   "Help"
      End
      Begin VB.Menu MNAbout 
         Caption         =   "About"
      End
   End
End
Attribute VB_Name = "FRMMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub CMDAbort_Click()
    ListView1.SetFocus
    Abort = 1
End Sub

Private Sub CMDAbort_MouseUp(Button As Integer, _
                             Shift As Integer, _
                             x As Single, _
                             y As Single)
    ListView1.SetFocus
End Sub

Private Sub CMDAbort_OLEDragDrop(Data As DataObject, _
                                 Effect As Long, _
                                 Button As Integer, _
                                 Shift As Integer, _
                                 x As Single, _
                                 y As Single)

    On Error Resume Next

    If ExistFile(Data.Files(1)) = True Then LoadF (Data.Files(1))

End Sub

Private Sub CMDPause_Click()
    ListView1.SetFocus

    If Abort = 0 Then Abort = 2: CMDPause.Caption = "Resume": Exit Sub
    If Abort = 2 Then Abort = 0: CMDPause.Caption = "Pause": Exit Sub
End Sub

Private Sub CMDPause_MouseUp(Button As Integer, _
                             Shift As Integer, _
                             x As Single, _
                             y As Single)

    On Error Resume Next

    ListView1.SetFocus
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If Shift = 0 And KeyCode = vbKeyF5 And Toolbar1.Enabled = True Then Call MNRefresh_Click
    If Shift = 0 And KeyCode = vbKeyEscape And Toolbar1.Enabled = False Then Abort = 1
    If Shift = 0 And KeyCode = vbKeyPause And Toolbar1.Enabled = False And CMDPause.Enabled = True Then Call CMDPause_Click

    If Shift = 2 And KeyCode = vbKeyS Then Call MNSaveList_Click
    If Shift = 2 And KeyCode = vbKeyL Then Call MNLoadList_Click
    If Shift = 2 And KeyCode = vbKeyX Then Call MNResetList_Click
    If Shift = 2 And KeyCode = vbKeyC And MNCopyKey.Enabled = True Then Call MNCopyKey_Click
    If Shift = 2 And KeyCode = vbKeyB And MNBackupKey.Enabled = True Then Call MNBackupKey_Click
    If Shift = 2 And KeyCode = vbKeyR And MNRemoveItem.Enabled = True Then Call MNRemoveItem_Click
    If Shift = 2 And KeyCode = vbKeyP And MNAddToProtectKeyList.Enabled = True Then Call MNAddToProtectKeyList_Click
    If Shift = 2 And KeyCode = vbKeyU And MNAddToClearSTList.Enabled = True Then Call MNAddToClearSTList_Click

    If Shift = 0 And KeyCode = vbKeyF8 And Toolbar1.Enabled = True Then Call MNShowSTClear_Click
    If Shift = 0 And KeyCode = vbKeyF6 And Toolbar1.Enabled = True Then Call MNShowProtecList_Click
    If Shift = 0 And KeyCode = vbKeyF3 And Toolbar1.Enabled = True And MNJumpToRegEdit.Enabled = True Then Call MNJumpToRegEdit_Click
    If Shift = 0 And KeyCode = vbKeyF4 And Toolbar1.Enabled = True And MNView.Enabled = True Then Call MNView_Click
    If Shift = 0 And KeyCode = vbKeyF7 And Toolbar1.Enabled = True Then Call MNAddKey_Click

    If Shift = 0 And KeyCode = vbKeyDelete And Toolbar1.Enabled = True And MNDeleteKey.Enabled = True Then Call MNDeleteKey_Click

End Sub

Private Sub Form_Load()

    On Error Resume Next

    Dim STime    As SYSTEMTIME

    Dim ETime    As SYSTEMTIME

    Dim PassTime As Long

    GetSystemTime STime
    
    Vers = "4.0 Final"
    FRMMain.Caption = "Trial-Reset " & Vers

    FormHeight = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Height")
    FormWidth = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Width")
    FormLeft = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Left")
    FormTop = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Top")
    FormState = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Window State")

    Is64bitFast = Is64bit
    SetWoW64Translation 32
    
    MNCreateLog.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Enable Log")
    MNMinimizeOnTray.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Minimize to System Tray")
    MNNativeAPI.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Enable Native API")

    If ExistValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Enable Native API") = False Then MNNativeAPI.Checked = True
    MNAutoBackup.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Auto Backup")
    MNDisableSectScan.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Disable Sector Scan")
    MNFixedSizeList.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Auto Size List")
    MNDataTimeColumn.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "No DataTime Column")
    MNHideProtectedKey.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Hide Protect Key")
    MNNotClearLSTScan.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Disable delete before scan")
    MNShowCheckBox.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Show CheckBox")
    MNHideFLTB.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Hide File-List Button")
    MNHideTypeCol.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Hide Type Column")
    MNShowOrdCol.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Order Column")

    If MNShowCheckBox.Checked = True Then
        ListView1.Checkboxes = True
        ListView1.MultiSelect = False
    Else
        ListView1.Checkboxes = False
        ListView1.MultiSelect = True
    End If

    MNAERO.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Vista Graphic")

    If ExistValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Vista Graphic") = False Then MNAERO.Checked = IsAeroEnabled

    If ExistValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBar Columns") = False Then
        If VB.Screen.Height > 10000 Then
            MNTBCol(1).Checked = True
        Else
            MNTBCol(2).Checked = True
        End If

    Else
        TBCol = Val(ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBar Columns"))
        MNTBCol(TBCol - 1).Checked = True
    End If
    
    STLCL = Replace(TrimNull(ReadValue(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Run", "Trial-Reset")), Chr(32), "")
    FinMyName = VB.App.Path & "\" & FindMyName(GetCurrentProcessId)

    If STLCL <> "" And Len(STLCL) > Len(FinMyName) Then
        If Left(Replace(UCase(STLCL), " ", ""), Len(Replace(UCase(FinMyName), " ", ""))) = Replace(UCase(FinMyName), " ", "") Then MNSTCleanerE.Checked = True
    End If

    RegJMode = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Regedit Jump Mode")
    MNRegJumpAdvanced.Checked = True

    If RegJMode = 1 Then MNRegJumpNormal.Checked = True: MNRegJumpAdvanced.Checked = False
    If RegJMode = 2 Then MNRegJumpNormal.Checked = False: MNRegJumpAdvanced.Checked = True
    
    MNOnlyOneInstance.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Only One Instance")

    If MNOnlyOneInstance.Checked = True Then
        
        FindProcess FindMyName(GetCurrentProcessId), NumProcFound
        
        If NumProcFound > 1 Then
            PrevIstance = FindWindow("ThunderRT6Form" & vbNullChar, FRMMain.Caption & vbNullChar)
            SetForegroundWindow PrevIstance
            KillApp GetCurrentProcessId
        End If
    End If
    
    PriorityVal = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Priority")
    SetThreadPriority GetCurrentThread, Val(PriorityVal)

    Select Case Val(PriorityVal)

        Case -15
            MNPriorityL(0).Checked = True

        Case -2
            MNPriorityL(1).Checked = True

        Case -1
            MNPriorityL(2).Checked = True

        Case 0
            MNPriorityL(3).Checked = True

        Case 1
            MNPriorityL(4).Checked = True

        Case 2
            MNPriorityL(5).Checked = True

        Case 15
            MNPriorityL(6).Checked = True
    End Select
    
    RegTran = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "WoW64")

    MNWoW64(Val(RegTran)).Checked = True

    FormOpacity = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Opacity")

    If IsNumeric(FormOpacity) = True Then
        If FormOpacity >= 0 And FormOpacity <= 255 Then
            SetWindowLong hwnd, -20, GetWindowLong(hwnd, -20) Or &H80000
            SetLayeredWindowAttributes hwnd, 0, FormOpacity, 2

            For t = 1 To 10
                MNOpacityP(t).Checked = False
            Next

            MNOpacityP(FormOpacity / 25.5).Checked = True
 
            If Val(FormOpacity) = 0 Then FormOpacity = 255
        End If

    Else

        FormOpacity = 255
    End If

    MNSaveWindowPosition.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Save Window Position")

    If MNSaveWindowPosition.Checked = True Then
        FRMMain.Width = FormWidth
        FRMMain.Height = FormHeight
        FRMMain.Left = FormLeft
        FRMMain.Top = FormTop

        If FormState <> 1 Then FRMMain.WindowState = FormState
    End If
    
    If ExistValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Save Window Position") = False Then MNSaveWindowPosition.Checked = True

    MNStayOnTop.Checked = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Stay on Top")

    If MNStayOnTop.Checked = True Then r = SetWindowPos(FRMMain.hwnd, -1, FRMMain.Left / 15, FRMMain.Top / 15, FRMMain.Width / 15, FRMMain.Height / 15, 0)

    SortBy = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Sort Columns")

    If Val(SortBy) = 0 Then SortBy = 6

    Call MNLVSort_Click(Val(SortBy))

    EDriver = Replace(Replace(Trim(ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Enabled Driver")) & ";", ",,", ";"), ";;", ";")

    If Replace(EDriver, ";", "") = "" Then EDriver = "c:;"
    DCount = 0
    
    For t = 97 To 122
        
        CDrive = Chr(t) & ":"
        
        If ExistDir(CDrive & "\") = True And GetDriveType(CDrive) = 3 Then
    
            If DCount > 0 Then Load FRMMain.MNDrive(DCount)
            FRMMain.MNDrive(DCount).Caption = CDrive
        
            If EDriver Like "*" & FRMMain.MNDrive(DCount).Caption & "*" Then FRMMain.MNDrive(DCount).Checked = True Else FRMMain.MNDrive(DCount).Checked = False
            DCount = DCount + 1
        End If

    Next
    
    GetDirectories

    If ExistFile(SystemDir & "ntdll.dll") = False Or FileLen(SystemDir & "ntdll.dll") < 50000 Then MNNativeAPI.Checked = False: MNNativeAPI.Visible = False
    If Is64bitFast = False Then MNWoW64(1).Checked = True: MNWoWTrans.Visible = False

    ListView1.ColumnHeaders.Add , , "System", 1600
    ListView1.ColumnHeaders.Add , , "Type", 950
    ListView1.ColumnHeaders.Add , , "Address", 7000
    ListView1.ColumnHeaders.Add , , "Date/Time", 1725
    ListView1.ColumnHeaders.Add , , "Status", 950
    ListView1.ColumnHeaders.Add , , "#", 0
    ListView1.ColumnHeaders(6).Position = 1
    ListView1.Sorted = True
    ListView1.SortKey = 5
    
    AddToLog "Trial-Reset " & Vers & " Loaded"

    ResizeWin

    EnumKeys HKEY_USERS, ""
 
    For i = 1 To UBound(AllKeys)

        If LCase(Right((AllKeys(i)), 8)) = "_classes" And Len(Replace(AllKeys(i), "-", "")) < Len(AllKeys(i)) - 4 Then
            UBase1 = AllKeys(i) & "\"
            UBase2 = Left(AllKeys(i), Len(AllKeys(i)) - 8) & "\"
        End If

    Next
    
    ReDim PackerList(0)
    AddPacker None, ""
    AddPacker ACProtect, "ACProtect", , P32bit, "http://www.ultraprotect.com", "1.x/2.x", "2.1.1"
    AddPacker ActiveMark, "ActiveMark", , PAll, "http://www.trymedia.com", "5.x/6.x", "6.2"
    AddPacker Armadillo, "Armadillo", , PAll, "http://www.siliconrealms.com", "1.x/2.x/3.x/4.x/5.x/6.x/7.x", "7.20"
    AddPacker ASProtect, "ASProtect", , PAll, "http://www.aspack.com", "0.x/1.x/2.x", "1.56/2.56"
    AddPacker DBPE, "DBPE", , P32bit, "http://dbpe.allit.net", "1.x/2.x", "2.33"
    AddPacker EncryptPE, "EncryptPE", , P32bit, "http://www.encryptpe.com", "1.x/2.x", "2.2008.6.10"
    AddPacker Enigma, "Enigma", , PAll, "http://www.enigmaprotector.com", "1.x", "1.79"
    AddPacker EXECryptor, "EXECryptor", , PAll, "http://www.strongbit.com", "2.x", "2.41"
    AddPacker ExeShield, "ExeShield", , PAll, "http://www.exeshield.com", "2.x/3.x/4.x", "4.6.2.1"
    AddPacker Expressor, "eXPressor", , PAll, "http://www.cgsoftlabs.ro", "1.x", "1.8.0.1"
    AddPacker FlexNet, "FlexNet", , PAll, "http://www.flexerasoftware.com", "10.x/11.x", "11.7.0.0"
    AddPacker ICELicense, "ICE License", , PAll, "http://www.ionworx.com", "2.x", "2.6.2.1"
    AddPacker IntelliLock, "IntelliLock", , PAll, "http://www.eziriz.com", "1.x", "1.4.1.0"
    AddPacker LicenseProtector, "License Protector", , PAll, "http://www.licence-protector.com", "2.x/3.x", "3.0.0.660"
    AddPacker MancoLicensing, "Manco Licensing", , PAll, "http://www.mancosoftware.com", "5.x", "5.0"
    AddPacker Nalpeiron, "Nalpeiron", , PAll, "http://www.nalpeiron.com", "4.x/5.x", "5.3.1.0"
    AddPacker NETReactor, "NET Reactor", , PAll, "http://www.eziriz.com", "3.x/4.x", "4.1.0.0"
    AddPacker NoCopy, "NoCopy", , P32bit, "http://www.carbonaro.nelweb.it", "3.x", "3.3"
    AddPacker NTkrnlProtector, "NTkrnl Protector", , P32bit, "http://www.ntkrnl.com", "0.x", "0.15"
    AddPacker Obsidium, "Obsidium", , PAll, "http://www.obsidium.de", "1.x", "1.4.0.18"
    AddPacker OneWay, "OneWay", , PAll, "http://www.atma-software.com", "5.x/6.x", "6.35"
    AddPacker ORiEN, "ORiEN", , P32bit, "http://zalexf.narod.ru", "2.x", "2.12"
    AddPacker PCGuard, "PCGuard", , PAll, "http://www.sofpro.com", "4.x/5.x", "5.04"
    AddPacker ProActivate, "ProActivate", , P32bit, "http://www.turbopower.com", "1.x", "1.11"
    AddPacker ProtectionPlus, "ProtectionPlus", , PAll, "http://www.softwarekey.com", "4.x", "4.5.0.2"
    AddPacker ProtectShareware, "ProtectShareware", , P32bit, "http://www.protectshareware.com", "1.x", "1.1"
    AddPacker Protexis, "Protexis Licensing", , PAll, "http://www.protexis.com", "1.x/2.x/3.x", "3.0.2.5"
    AddPacker SafengineLicensor, "Safengine Licensor", , PAll, "http://www.safengine.com", "1.x", "1.7.40"
    AddPacker SafeSerial, "SafeSerial", , P32bit, "http://www.sikandersoft.com", "2.x", "2.3.9"
    AddPacker SDProtector, "SDProtector", , P32bit, "http://www.sdprotector.com", "1.x", "1.16"
    AddPacker SGLicenser, "SGLicenser", , PAll, "http://www.sg-inware.com", "3.x", "3.1"
    AddPacker ShareGuard, "ShareGuard", , PAll, "http://www.zappersoftware.com", "2.x/3.x/4.x", "4.0"
    AddPacker Sheriff, "Sheriff", , PAll, "http://www.sheriff-software.com", "2.x/3.x", "3.0.0.4"
    AddPacker SoftLocx, "SoftLocx", , P32bit, "http://www.bitarts.com", "5.x/6.x/7.x", "7.0"
    AddPacker SoftSentry, "SoftSentry", , P32bit, "http://www.twenty.com", "3.x", "3.00"
    AddPacker SoftWrap, "SoftWrap", , PAll, "http://www.softwrap.com", "5.x/6.x/7.x", "7.0.0"
    AddPacker STProtector, "STProtector", , P32bit, "http://steam.wz.cz", "1.x", "1.5"
    AddPacker SVKP, "SVKP", , P32bit, "http://www.anticracking.s", "1.x", "1.44"
    AddPacker Thinstall, "Thinstall", , P32bit, "http://www.thinstall.com", "2.x", "2.719"
    AddPacker VBOLock, "VBOLock", , P32bit, "http://www.moonlight-software.com", "4.x", "4.4.2.12"
    AddPacker VBox, "VBox", , P32bit, "http://www.previewsystems.com", "3.x/4.x", "4.6.2"
    AddPacker VisualProtect, "VisualProtect", , P32bit, "http://www.visagesoft.com", "2.x/3.x", "3.5.4"
    AddPacker WinLicense, "WinLicense", , PAll, "http://www.oreans.com", "1.x/2.x", "2.1.0.10"
    AddPacker XheoLicensing, "Xheo Licensing", , PAll, "http://www.xheo.com", "2.x", "2.1.5000.28"
    AddPacker XProtector, "XProtector", , P32bit, "http://www.oreans.com/xprotector", "1.x", "1.08"
    AddPacker ZipWorx, "ZipWorx", , P32bit, "http://www.zipworx.com", "3.x", "3.0.0.1"
    AddPacker ZProtect, "ZProtect", , P32bit, "http://www.peguard.com", "1.x", "1.4.8.0"
    AddPacker ZXProtector, "ZXProtector", , P32bit, "http://www.zxprotect.com", "1.x", "1.1.0.0"
    
    BaseICO = IconList.ListImages.Count + 1
    PlugPath = VB.App.Path & "\Plugins\"
    KeysListPath = VB.App.Path & "\Lists\"
    BackupPath = VB.App.Path & "\Backup\"
    
    IniPlugin
    IniToolBar
        
    LoadProtectLST
    LoadSTLST

    If Val(ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBarItems")) <> FRMMain.Toolbar1.Buttons.Count Then DeleteValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBar"
    
    If Command <> "" Then Command_Line Replace(Command, """", "")
    
    PackerIDX = 0
    
    Timer3.Enabled = True
    
    RtlAdjustPrivilege 20, 1, 0, 0

    Set fs2 = CreateObject("Scripting.FileSystemObject")
    Set a = fs2.CreateTextFile("Trial-Reset-Test", True)
    a.Close
    
    GetSystemTime ETime
    
    PassTime = (ETime.wHour - STime.wHour) * 3600 + (ETime.wMinute - STime.wMinute) * 60 + (ETime.wSecond - STime.wSecond) - PauseTime
    
    OPTime = PassTime * 1000 + (ETime.wMilliseconds - STime.wMilliseconds) & " ms"
    
    If Val(OPTime) >= 1000 Then OPTime = Format(Round(Val(OPTime) / 1000, 2), "0.00") & " s"

    FRMMain.StatusBar1.Panels(3).Text = OPTime

    If ExistFile("Trial-Reset-Test") = False Then MsgBox "You don't have the write access in the disc when is located Trial-Reset, backup function is not active. If you run Trial-Reset on a CD please copy to local disk.", vbCritical
    Kill "Trial-Reset-Test"

    If IsUserAnAdmin = 0 Then MsgBox "You don't have the Administrator Privilege, a lot of functions don't works. For correctly working run as Administrator.", vbCritical

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

    If TrayEvent(x) = "RIGHTDOWN" Then PopupMenu FRMMain.ShellPop
    If TrayEvent(x) = "LEFTDOUBLE" Then

        On Error Resume Next

        RemoveTrayIcon
        FRMMain.WindowState = 0
        FRMMain.Show
        AppActivate (FRMMain.Caption)
    End If

End Sub

Private Sub Form_OLEDragDrop(Data As DataObject, _
                             Effect As Long, _
                             Button As Integer, _
                             Shift As Integer, _
                             x As Single, _
                             y As Single)

    On Error Resume Next

    If ExistFile(Data.Files(1)) = True Then LoadF (Data.Files(1))

End Sub

Private Sub Form_QueryUnLoad(Cancel As Integer, UnloadMode As Integer)

    If Toolbar1.Enabled = False Then
        Ask = MsgBox("Do you want stop the scan?", vbExclamation + vbYesNo)

        If Ask = vbNo Then Cancel = 1
    End If

End Sub

Private Sub Form_Resize()

    On Error Resume Next

    ResizeWin

    If FRMMain.WindowState = 1 And MNMinimizeOnTray.Checked = True Then
        FRMMain.Hide
        AddTrayIcon FRMMain.Icon, FRMMain.hwnd, FRMMain.Caption
    End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
    Cancel = 0

    On Error Resume Next

    RemoveTrayIcon

    If Timer1.Enabled = True Then Call MNNukeStop_Click

    SaveOptions

    End

End Sub

Private Sub ListView1_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
 
    Call MNLVSort_Click(ColumnHeader.Index)

End Sub

Private Sub ListView1_DblClick()
    Call MNJumpToRegEdit_Click
End Sub

Private Sub ListView1_MouseDown(Button As Integer, _
                                Shift As Integer, _
                                x As Single, _
                                y As Single)
    Call POP_Click
    
    If Button = 2 And FRMMain.Toolbar1.Enabled = True Then PopupMenu POP
End Sub

Private Sub ListView1_OLEDragDrop(Data As MSComctlLib.DataObject, _
                                  Effect As Long, _
                                  Button As Integer, _
                                  Shift As Integer, _
                                  x As Single, _
                                  y As Single)

    On Error Resume Next

    If ExistFile(Data.Files(1)) = True Then LoadF (Data.Files(1))
End Sub

Private Sub MNAERO_Click()

    If MNAERO.Checked = False Then
        MNAERO.Checked = True
    Else
        MNAERO.Checked = False
    End If

    SaveOptions

    ResizeWin
End Sub

Private Sub MNAbout_Click()
    FRMAbout.Version = "Trial-Reset " & Vers
    FRMAbout.LVAbout.ListItems.Clear

    For t = 1 To UBound(PackerList)
        
        If (PackerList(t).FileName = "" Or PackerList(t).SupVer <> "") And PackerList(t).Name <> "" Then
            Set Lister = FRMAbout.LVAbout.ListItems.Add()
            Lister.Text = PackerList(t).Name
            Lister.Tag = PackerList(t).HomePage
            Lister.SubItems(1) = PackerList(t).SupVer
            Lister.SubItems(2) = PackerList(t).LastVer
            Lister.ToolTipText = PackerList(t).HomePage
        End If
         
        If PackerList(t).FileName <> "" And PackerList(t).SupVer = "" And PackerList(t).Name <> "" Then
            Set Lister = FRMAbout.LVAbout.ListItems.Add()
            Lister.Text = PackerList(t).Name
            Lister.SubItems(1) = PackerList(t).FileName
            Lister.SubItems(2) = Format(Round(FileLen(PlugPath & PackerList(t).FileName) / 1024, 2), "0.00") & " KB"
        End If
        
    Next

    If MNStayOnTop.Checked = True Then
        r = SetWindowPos(FRMAbout.hwnd, -1, FRMAbout.Left / 15, FRMAbout.Top / 15, FRMAbout.Width / 15, FRMAbout.Height / 15, 0)
    Else
        r = SetWindowPos(FRMAbout.hwnd, -2, FRMAbout.Left / 15, FRMAbout.Top / 15, FRMAbout.Width / 15, FRMAbout.Height / 15, 0)
    End If

    SetWindowLong FRMAbout.hwnd, -20, GetWindowLong(FRMAbout.hwnd, -20) Or &H80000
    SetLayeredWindowAttributes FRMAbout.hwnd, 0, FormOpacity, 2
    FRMAbout.Show (1)

End Sub

Private Sub MNAddKey_Click()

    On Error Resume Next

    Dim Lister As ListItem

    If MNStayOnTop.Checked = True Then
        r = SetWindowPos(FRMAdd.hwnd, -1, FRMAdd.Left / 15, FRMAdd.Top / 15, FRMAdd.Width / 15, FRMAdd.Height / 15, 0)
    Else
        r = SetWindowPos(FRMAdd.hwnd, -2, FRMAdd.Left / 15, FRMAdd.Top / 15, FRMAdd.Width / 15, FRMAdd.Height / 15, 0)
    End If

    SetWindowLong FRMAdd.hwnd, -20, GetWindowLong(FRMAdd.hwnd, -20) Or &H80000
    SetLayeredWindowAttributes FRMAdd.hwnd, 0, FormOpacity, 2

    If FRMAdd.CMPType.Text = "" Then FRMAdd.CMPType.ListIndex = 0
    
    FRMAdd.Show (1)

    TXTKey = FRMAdd.TXTKey
    PackerName = FRMAdd.TXTSystem
    KeyType = FRMAdd.CMPType

    If TXTKey <> "" Then
        
        If TXTKey = "" Then Exit Sub
        
        TXTKey = DecodePath(TXTKey, KeyType)
        
        PackerName = FRMAdd.TXTSystem

        If PackerName = "" Then PackerName = "Custom"
        
        AddToList 0, TXTKey, PackerName, KeyType
        
    End If

End Sub

Private Sub MNAddToClearSTList_Click()

    On Error Resume Next

    On Error Resume Next

    For i = 1 To FRMMain.ListView1.ListItems.Count

        If FRMMain.ListView1.ListItems(i).Selected = True Then
            AddToSTClear FRMMain.ListView1.ListItems(i).Text, FRMMain.ListView1.ListItems(i).SubItems(2), FRMMain.ListView1.ListItems(i).SubItems(1), 1
        End If

    Next
    
    SaveSTClear
End Sub

Private Sub MNAddToProtectKeyList_Click()

    On Error Resume Next

    For i = 1 To FRMMain.ListView1.ListItems.Count

        If FRMMain.ListView1.ListItems(i).Selected = True Then
            AddToProtList FRMMain.ListView1.ListItems(i).Text, FRMMain.ListView1.ListItems(i).SubItems(2), FRMMain.ListView1.ListItems(i).SubItems(1), 1
        End If

    Next
    
    SaveProt
End Sub

Private Sub MNAutoBackup_Click()

    If MNAutoBackup.Checked = False Then
        MNAutoBackup.Checked = True
    Else
        MNAutoBackup.Checked = False
    End If

    SaveOptions
End Sub

Private Sub MNBackupKey_Click()
    PackerIDX = PSSel
    Operation 3
    PackerIDX = 0
End Sub

Private Sub MNCopyKey_Click()

    On Error Resume Next

    i = FRMMain.ListView1.SelectedItem.Index
    Clipboard.Clear
    Clipboard.SetText FRMMain.ListView1.ListItems(i).SubItems(2)
End Sub

Private Sub MNCreateLog_Click()

    If MNCreateLog.Checked = True Then
        MNCreateLog.Checked = False
    Else
        MNCreateLog.Checked = True
    End If

    SaveOptions
End Sub

Private Sub MNCustomizeToolbar_Click()
    Toolbar1.Customize
End Sub

Private Sub MNDataTimeColumn_Click()

    If MNDataTimeColumn.Checked = False Then
        MNDataTimeColumn.Checked = True
    Else
        MNDataTimeColumn.Checked = False
    End If
    
    FLSValue = MNFixedSizeList.Checked
    MNFixedSizeList.Checked = False
    ResizeWin
    SaveOptions
    MNFixedSizeList.Checked = FLSValue
End Sub

Private Sub MNDeleteKey_Click()
    PackerIDX = PSSel
    Operation 2
    PackerIDX = 0
End Sub

Private Sub MNDisableSectScan_Click()

    If MNDisableSectScan.Checked = False Then
        MNDisableSectScan.Checked = True
    Else
        MNDisableSectScan.Checked = False
    End If

    SaveOptions
End Sub

Private Sub MNDrive_Click(Index As Integer)

    On Error Resume Next

    If MNDrive(Index).Checked = False Then
        MNDrive(Index).Checked = True
    Else
        MNDrive(Index).Checked = False
    End If
    
    For t = 0 To MNDrive.Count

        If MNDrive(t).Checked = True Then EDriver = EDriver & ";" & MNDrive(t).Caption
    Next

    If Len(EDriver) > 1 Then EDriver = Right(EDriver, Len(EDriver) - 1)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Enabled Driver", EDriver

End Sub

Private Sub MNEnd_Click()

    End

End Sub

Private Sub MNExit_Click()
    Call Form_Unload(0)
End Sub

Private Sub MNFixedSizeList_Click()

    If MNFixedSizeList.Checked = False Then
        MNFixedSizeList.Checked = True
    Else
        MNFixedSizeList.Checked = False
    End If

    ResizeWin
    SaveOptions
End Sub

Private Sub MNHelpMenu_Click()
    Sleep (500)
    SendKeys "{F1}", True
End Sub

Private Sub MNHideFLTB_Click()

    If MNHideFLTB.Checked = False Then
        MNHideFLTB.Checked = True
    Else
        MNHideFLTB.Checked = False
    End If
    
    SaveOptions
    IniToolBar
End Sub

Private Sub MNHideProtectedKey_Click()

    If MNHideProtectedKey.Checked = False Then
        MNHideProtectedKey.Checked = True
    Else
        MNHideProtectedKey.Checked = False
    End If

    ResizeWin
    SaveOptions
End Sub

Private Sub MNHideTypeCol_Click()

    If MNHideTypeCol.Checked = False Then
        MNHideTypeCol.Checked = True
    Else
        MNHideTypeCol.Checked = False
    End If
    
    FLSValue = MNFixedSizeList.Checked
    MNFixedSizeList.Checked = False
    ResizeWin
    SaveOptions
    MNFixedSizeList.Checked = FLSValue
End Sub

Private Sub MNJumpToRegEdit_Click()

    On Error Resume Next
    
    Dim hKey As RegistryPaths

    SelType = FRMMain.ListView1.ListItems(FRMMain.ListView1.SelectedItem.Index).SubItems(1)
    SelKey = FRMMain.ListView1.ListItems(FRMMain.ListView1.SelectedItem.Index).SubItems(2)

    If SelKey = "" Then Exit Sub

    If Left(LCase(SelType), 3) = "reg" Then
    
        SetWoW64Translation SelType
        
        If LCase(SelType) = "reg32val" Or LCase(SelType) = "reg64val" Then

            Do While Right(SelKey, 1) <> "\"
                SelKeyValue = Right(SelKey, 1) & SelKeyValue
                SelKey = Left(SelKey, Len(SelKey) - 1)
            Loop
        
        End If

        If Right(SelKey, 1) = "\" Then SelKey = Left(SelKey, Len(SelKey) - 1)
        If Right(SelKey, 1) = "\" Then SelKey = Left(SelKey, Len(SelKey) - 1)
        If Right(SelKey, 1) = "\" Then SelKey = Left(SelKey, Len(SelKey) - 1)
        
        ParseKey SelKey, hKey, SubKeyAdd
        
        If SelKeyValue <> "" Then
            If ExistValue(hKey, SubKeyAdd, SelKeyValue) = False Then MsgBox "Not Found!", vbCritical ': Exit Sub
        Else

            If ExistKey(hKey, SubKeyAdd) = False Then MsgBox "Not Found!", vbCritical ': Exit Sub
        End If

        If MNRegJumpAdvanced.Checked = True Then
            KillApp FindProcess("regedit.exe")
            CreateKey HKEY_CURRENT_USER, "SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit"
            SetValue HKEY_CURRENT_USER, "SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit", "LastKey", "Computer\" & SelKey
            ExecuteCommand WindowsDir & "regedit.exe", "", 1
        Else
            RegEditJump SelKey, SelKeyValue
        End If

        SetWoW64Translation 32
    End If

    If Left(LCase(SelType), 4) = "file" Or Left(LCase(SelType), 3) = "dir" Or Left(LCase(SelType), 6) = "stream" Then
        SetWoW64Translation SelType

        If Left(LCase(SelType), 4) = "file" Or (Left(LCase(SelType), 6) = "stream" And Right(SelKey, 1) <> "\") Then

            If ExistFile(SelKey) = False Then MsgBox "Not Found!", vbCritical ': Exit Sub
            
            Do While Right(SelKey, 1) <> "\"
                SelKeyValue = Right(SelKey, 1) & SelKeyValue
                SelKey = Left(SelKey, Len(SelKey) - 1)
            Loop
            
        Else

            If ExistDir(SelKey) = False Then MsgBox "Not Found!", vbCritical ': Exit Sub
        End If
    
        ExecuteCommand WindowsDir & "explorer.exe", """" & SelKey & "", 1
        Sleep 500
        SendKeys SelKeyValue, True
        
        SetWoW64Translation 32
    End If

End Sub

Private Sub MNLVSort_Click(Index As Integer)
    
    For i = 1 To 6
        MNLVSort(i).Checked = False
    Next
    
    MNLVSort(Index).Checked = True
    ListView1.SortKey = Index - 1

    SaveOptions
    
End Sub

Private Sub MNLoadList_Click()

    Dim tOpenFile As OpenFilename

    tOpenFile.lpstrFile = ""
    tOpenFile.lpstrInitialDir = App.Path
    tOpenFile.lpstrTitle = "Load List"
    tOpenFile.lpstrDefExt = "TXT"
    tOpenFile.lpstrFilter = "*.txt|*.txt|All|*.*"
    
    RFileName = ShowFileDialog(2, tOpenFile)

    LoadF (RFileName)
      
End Sub

Private Sub MNMinimizeOnTray_Click()

    If MNMinimizeOnTray.Checked = False Then
        MNMinimizeOnTray.Checked = True
    Else
        MNMinimizeOnTray.Checked = False
    End If

    SaveOptions
End Sub

Private Sub MNNativeAPI_Click()

    If MNNativeAPI.Checked = False Then
        MNNativeAPI.Checked = True
    Else
        MNNativeAPI.Checked = False
    End If

    SaveOptions
End Sub

Private Sub MNNotClearLSTScan_Click()

    If MNNotClearLSTScan.Checked = False Then
        MNNotClearLSTScan.Checked = True
    Else
        MNNotClearLSTScan.Checked = False
    End If

    SaveOptions

End Sub

Private Sub MNNukeInterval_Click()
    CreateKey HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset"
    NukeInterval = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Nuke Stop Interval")

    If IsNumeric(NukeInterval) = False Then NukeInterval = 1000
    NukeInterval = InputBox("Nuke-Stop interval in milliseconds?", , NukeInterval)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Nuke Stop Interval", NukeInterval
End Sub

Private Sub MNNukeStop_Click()
    NukeInterval = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Nuke Stop Interval")

    If IsNumeric(NukeInterval) = False Then NukeInterval = 1000
    Timer1.Interval = NukeInterval

    If Timer1.Enabled = False Then
        NukeTime = 0
        GetSystemTime pt
        pt.wMilliseconds = 0
        Timer1.Enabled = True
        MNNukeStop.Checked = True
    Else
        Timer1.Enabled = False
        MNNukeStop.Checked = False
        SetCorrectTime NukeTime
    End If

End Sub

Private Sub MNOnlyOneInstance_Click()

    If MNOnlyOneInstance.Checked = False Then
        MNOnlyOneInstance.Checked = True
    Else
        MNOnlyOneInstance.Checked = False
    End If

    SaveOptions
End Sub

Private Sub MNOpacityP_Click(Index As Integer)

    FormOpacity = Index * 25.5
    SetWindowLong hwnd, -20, GetWindowLong(hwnd, -20) Or &H80000
    SetLayeredWindowAttributes hwnd, 0, FormOpacity, 2

    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Opacity", FormOpacity

    For t = 1 To 10
        MNOpacityP(t).Checked = False
    Next

    MNOpacityP(Index).Checked = True

End Sub

Private Sub MNPriorityL_Click(Index As Integer)

    For i = 0 To 5
        MNPriorityL(i).Checked = False
    Next

    MNPriorityL(Index).Checked = True

    Select Case Index

        Case 0
            TPriority = 15

        Case 1
            TPriority = 2

        Case 2
            TPriority = 1

        Case 3
            TPriority = 0

        Case 4
            TPriority = -1

        Case 5
            TPriority = -2

        Case 5
            TPriority = -15
    End Select

    PR = GetCurrentThread
    re = SetThreadPriority(PR, TPriority)
End Sub

Private Sub MNRefresh_Click()

    On Error Resume Next

    For Z = 1 To ListView1.ListItems.Count
        GetKeyInformation ListView1.ListItems(Z).SubItems(2), ListView1.ListItems(Z).SubItems(1), KeyDate, ExistK, 1
        ListView1.ListItems(Z).SubItems(3) = KeyDate
        ListView1.ListItems(Z).SubItems(4) = ExistK
    Next

End Sub

Private Sub MNRegJumpAdvanced_Click()
    MNRegJumpNormal.Checked = False
    MNRegJumpAdvanced.Checked = True
    SaveOptions
End Sub

Private Sub MNRegJumpNormal_Click()
    MNRegJumpNormal.Checked = True
    MNRegJumpAdvanced.Checked = False
    SaveOptions
End Sub

Private Sub MNRemoveItem_Click()

    On Error Resume Next
    
    For i = 1 To FRMMain.ListView1.ListItems.Count
    
        If i <= FRMMain.ListView1.ListItems.Count Then
    
            If FRMMain.ListView1.ListItems(i).Selected = True Then
                ListView1.ListItems.Remove (i)
                i = i - 1
            End If
        End If

    Next
    
End Sub

Private Sub MNResetList_Click()
    ListView1.ListItems.Clear
    AddToLog "Trial-Reset " & Vers & " Loaded"
End Sub

Private Sub MNSTCDelay_Click()

    CreateKey HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset"
    STCDelay = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Autocleaning Delay")

    If IsNumeric(STCDelay) = False Then STCDelay = 5000
    STCDelay = InputBox("Autocleaning Delay in milliseconds?", , STCDelay)
    SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "Autocleaning Delay", STCDelay

End Sub

Private Sub MNSTCleanerE_Click()

    If MNSTCleanerE.Checked = False Then
        MNSTCleanerE.Checked = True
    Else
        MNSTCleanerE.Checked = False
        DeleteValue HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Run", "Trial-Reset"
    End If

    SaveOptions
End Sub

Private Sub MNSaveList_Click()

    On Error Resume Next
    
    Dim tOpenFile As OpenFilename

    If FRMMain.ListView1.ListItems.Count = 0 Then Exit Sub
    
    tOpenFile.lpstrFile = ""
    tOpenFile.lpstrInitialDir = App.Path
    tOpenFile.lpstrTitle = "Save List"
    tOpenFile.lpstrDefExt = "TXT"
    tOpenFile.lpstrFilter = "*.txt|*.txt|All|*.*"
    
    WFileName = ShowFileDialog(1, tOpenFile)

    OldSortKey = FRMMain.ListView1.SortKey
    FRMMain.ListView1.SortKey = 5
    
    SaveF WFileName

    FRMMain.ListView1.SortKey = OldSortKey
    
End Sub

Private Sub MNSaveWindowPosition_Click()

    If MNSaveWindowPosition.Checked = False Then
        MNSaveWindowPosition.Checked = True
    Else
        MNSaveWindowPosition.Checked = False
    End If

    SaveOptions
End Sub

Private Sub MNShoWindow_Click()

    On Error Resume Next

    RemoveTrayIcon
    FRMMain.WindowState = 0
    FRMMain.Show
    AppActivate (FRMMain.Caption)
End Sub

Private Sub MNShowCheckBox_Click()

    If MNShowCheckBox.Checked = False Then
        MNShowCheckBox.Checked = True
        ListView1.Checkboxes = True
        ListView1.MultiSelect = False
    Else
        MNShowCheckBox.Checked = False
        ListView1.Checkboxes = False
        ListView1.MultiSelect = True
    End If
    
    SaveOptions
    IniToolBar
End Sub

Private Sub MNShowOrdCol_Click()

    If MNShowOrdCol.Checked = False Then
        MNShowOrdCol.Checked = True
    Else
        MNShowOrdCol.Checked = False
    End If
    
    FLSValue = MNFixedSizeList.Checked
    MNFixedSizeList.Checked = False
    ResizeWin
    SaveOptions
    MNFixedSizeList.Checked = FLSValue
End Sub

Private Sub MNShowProtecList_Click()

    On Error Resume Next

    If MNStayOnTop.Checked = True Then
        r = SetWindowPos(FRMProtect.hwnd, -1, FRMProtect.Left / 15, FRMProtect.Top / 15, FRMProtect.Width / 15, FRMProtect.Height / 15, 0)
    Else
        r = SetWindowPos(FRMProtect.hwnd, -2, FRMProtect.Left / 15, FRMProtect.Top / 15, FRMProtect.Width / 15, FRMProtect.Height / 15, 0)
    End If

    SetWindowLong FRMProtect.hwnd, -20, GetWindowLong(FRMProtect.hwnd, -20) Or &H80000
    SetLayeredWindowAttributes FRMProtect.hwnd, 0, FormOpacity, 2
    LoadProtectLST
    FRMProtect.Show (1)
    LoadProtectLST

End Sub

Private Sub MNShowSTClear_Click()

    On Error Resume Next

    If MNStayOnTop.Checked = True Then
        r = SetWindowPos(FRMSTClear.hwnd, -1, FRMSTClear.Left / 15, FRMSTClear.Top / 15, FRMSTClear.Width / 15, FRMSTClear.Height / 15, 0)
    Else
        r = SetWindowPos(FRMSTClear.hwnd, -2, FRMSTClear.Left / 15, FRMSTClear.Top / 15, FRMSTClear.Width / 15, FRMSTClear.Height / 15, 0)
    End If

    SetWindowLong FRMSTClear.hwnd, -20, GetWindowLong(FRMSTClear.hwnd, -20) Or &H80000
    SetLayeredWindowAttributes FRMSTClear.hwnd, 0, FormOpacity, 2
    LoadSTLST
    FRMSTClear.Show (1)
    LoadSTLST

End Sub

Private Sub MNStayOntop_Click()

    On Error Resume Next

    If MNStayOnTop.Checked = False Then
        MNStayOnTop.Checked = True
        r = SetWindowPos(FRMMain.hwnd, -1, FRMMain.Left / 15, FRMMain.Top / 15, FRMMain.Width / 15, FRMMain.Height / 15, 0)
    Else
        MNStayOnTop.Checked = False
        r = SetWindowPos(FRMMain.hwnd, -2, FRMMain.Left / 15, FRMMain.Top / 15, FRMMain.Width / 15, FRMMain.Height / 15, 0)
    End If

    SaveOptions
End Sub

Private Sub MNTBCol_Click(Index As Integer)

    For t = 0 To MNTBCol.UBound
        MNTBCol(t).Checked = False
    Next
    
    MNTBCol(Index).Checked = True

    ResizeWin
    SaveOptions
End Sub

Private Sub MNView_Click()

    On Error Resume Next
    
    Dim hKey As RegistryPaths

    If MNStayOnTop.Checked = True Then
        r = SetWindowPos(FRMView.hwnd, -1, FRMView.Left / 15, FRMView.Top / 15, FRMView.Width / 15, FRMView.Height / 15, 0)
    Else
        r = SetWindowPos(FRMView.hwnd, -2, FRMView.Left / 15, FRMView.Top / 15, FRMView.Width / 15, FRMView.Height / 15, 0)
    End If

    SetWindowLong FRMView.hwnd, -20, GetWindowLong(FRMView.hwnd, -20) Or &H80000
    SetLayeredWindowAttributes FRMView.hwnd, 0, FormOpacity, 2

    i = FRMMain.ListView1.SelectedItem.Index

    If i = "" Then Exit Sub
    
    If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "sector" Then
        DiskSec = Replace(Right(FRMMain.ListView1.ListItems(i).SubItems(2), Len(FRMMain.ListView1.ListItems(i).SubItems(2)) - 5), """", "")

        If Left(DiskSec, 1) = " " Then DiskSec = Right(DiskSec, Len(DiskSec) - 1)
        DiskID = Val(DiskSec)
        Mypos = InStr(1, DiskSec, ":", 1)

        If Mypos <> 0 Then
            SecID = Right(DiskSec, Len(DiskSec) - Mypos)

            If Left(SecID, 1) = " " Then SecID = Right(SecID, Len(SecID) - 1)
            
            If SecID >= 0 And IsNumeric(DiskID) = True Then

                Dim SectDump() As SecList

                SectorDump SecID, 0, SectDump, DiskID

                If UBound(SectDump) = 1 Then
                    FRMView.Caption = FRMMain.ListView1.ListItems(i).Text & " " & FRMMain.ListView1.ListItems(i).SubItems(2)

                    FRMView.DefExe = "BIN"
                    FRMView.DefFil = "*.bin|*.bin|All|*.*"
                    FRMView.DefNam = "Disk" & DiskID & "_Sector" & SecID
            
                    ReDim FileBinary(0)
                    ReDim FileBinary(Len(SectDump(1).SecData) / 2 - 1)
            
                    For Z = 1 To Len(SectDump(1).SecData) / 2
                        FileBinary(Z - 1) = Val("&h" & Mid(SectDump(1).SecData, Z * 2 - 1, 2))
                    Next
                    
                    FRMView.MNHex.Checked = True
                    UpdateViewFRM
                    FRMView.Show (1)
                End If
            End If
        End If
    End If
    
    'Registry

    If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 3) = "reg" Then

        CurKey = FRMMain.ListView1.ListItems(i).SubItems(2)
        SetWoW64Translation FRMMain.ListView1.ListItems(i).SubItems(1)
        
        ParseKey CurKey, hKey, SubKeyAdd
 
        If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "reg32key" Or LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "reg64key" Then
            SubValue = ""

            ShellKey = CurKey
            SubKeyNum = CountKeys(hKey, SubKeyAdd)

            SubValueNum = CountValues(hKey, SubKeyAdd)
            
        Else

            Mypos = Len(SubKeyAdd)

            Do
                Mypos = Mypos - 1
            Loop While Mid(SubKeyAdd, Mypos, 1) <> "\"
                    
            SubValue = Right(SubKeyAdd, Len(SubKeyAdd) - Mypos)

            SubKeyAdd = Left(SubKeyAdd, Mypos)

            Mypos = Len(CurKey)

            Do
                Mypos = Mypos - 1
            Loop While Mid(CurKey, Mypos, 1) <> "\"
                    
            ShellKey = Left(CurKey, Mypos)

            Do While Left(SubValue, 1) = "\"
                SubValue = Right(SubValue, Len(SubValue) - 1)

            Loop

            Do While Right(SubValue, 1) = "\"
                SubValue = Left(SubValue, Len(SubValue) - 1)

            Loop
            
            SubKeyNum = 0

            SubValueNum = 0

        End If
        
        If ExistKey(hKey, SubKeyAdd) = False Then MsgBox "Not Found!", vbCritical: Exit Sub
    
        TheCmd = WindowsDir & "regedit /e """ & TempDir & "Reg.Temp"" """ & ShellKey & """"
        ExecuteCommand WindowsDir & "regedit.exe", "/e """ & TempDir & "Reg.Temp"" """ & ShellKey & """"

        Set fs2 = CreateObject("Scripting.FileSystemObject")
        Set a = fs2.GetFile(TempDir & "Reg.Temp")
        RegSize = a.Size
        Set a = fs2.openTextFile(TempDir & "Reg.Temp")
        RegTXT = a.Read(RegSize)
        a.Close
        RegTXT = Replace(RegTXT, Chr(0), "")
            
        RegTXT = ParseRegData(RegTXT, SubValue)

        FRMView.Caption = FRMMain.ListView1.ListItems(i).Text & " Key, Creation: " & FRMMain.ListView1.ListItems(i).SubItems(3) & ", " & Val(SubKeyNum) & " SubKeys and " & Val(SubValueNum) & " Values"

        FRMView.DefExe = "REG"
        FRMView.DefFil = "*.reg|*.reg|All|*.*"
        FRMView.DefNam = ""

        ReDim FileBinary(0)
        ReDim FileBinary(Len(RegTXT))

        For t = 0 To Len(RegTXT)
            FileBinary(t) = Asc(Mid(RegTXT, t + 1, 1))
        Next
        
        UpdateViewFRM

        SetWoW64Translation 32
        
        FRMView.Show (1)
    End If

    'File

    If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 4) = "file" Or Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 3) = "dir" Then
        SetWoW64Translation FRMMain.ListView1.ListItems(i).SubItems(1)
        
2       If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 4) = "file" Then
            
            If ExistFile(FRMMain.ListView1.ListItems(i).SubItems(2)) = False Then MsgBox "Not Found!", vbCritical: Exit Sub

            Open FRMMain.ListView1.ListItems(i).SubItems(2) For Binary As #1
            ReDim FileBinary(0 To LOF(1) - 1)
            filesize = LOF(1)
            Get #1, , FileBinary()
            Close #1

            UpdateViewFRM
            
            FRMView.MNHex.Checked = False
            
            Unit = " Byte"

            Select Case filesize
            
                Case Is > 1024000000
                    Unit = " GB"
                    filesize = filesize / 1024 ^ 3

                Case Is > 1024000
                    Unit = " MB"
                    filesize = filesize / 1024 ^ 2

                Case Is > 1024
                    Unit = " KB"
                    filesize = filesize / 1024
                    
            End Select

            filesize = Int(filesize * 100) / 100
            FRMView.Caption = FRMMain.ListView1.ListItems(i).Text & " Key, Creation: " & FRMMain.ListView1.ListItems(i).SubItems(3) & ", Size: " & Val(filesize) & Unit

            t = Len(FRMMain.ListView1.ListItems(i).SubItems(2))

            Do While Mid(FRMMain.ListView1.ListItems(i).SubItems(2), t, 1) <> "\"
                t = t - 1
            Loop
            
            FRMView.DefNam = Right(FRMMain.ListView1.ListItems(i).SubItems(2), Len(FRMMain.ListView1.ListItems(i).SubItems(2)) - t)
            FRMView.DefExe = ""
            FRMView.DefFil = "All|*.*"
        Else
                
            EnumDir (FRMMain.ListView1.ListItems(i).SubItems(2))

            For Z = 1 To UBound(AllDirsList)
                                     
                DFile = Dir(AllDirsList(Z) & "\", vbHidden + vbReadOnly + vbSystem)
                FileLST = FileLST & vbCrLf & Replace(AllDirsList(Z) & "\", "\\", "\")

                Do While DFile <> ""
                    FileLST = FileLST & vbCrLf & Replace(DFile, "\\", "\")
                    DFile = Dir
                    FilesCount = FilesCount + 1
                Loop

                FileLST = FileLST & vbCrLf
            
            Next
            
            FRMView.Caption = FRMMain.ListView1.ListItems(i).Text & " Directory, Creation: " & FRMMain.ListView1.ListItems(i).SubItems(3) & ", Subdirectory: " & UBound(AllDirsList) & " and Files: " & Val(FilesCount)
            
            FRMView.DefNam = ""
            FRMView.DefExe = "TXT"
            FRMView.DefFil = "Text File|*.txtAll|*.*"
                      
            ReDim FileBinary(0)
            ReDim FileBinary(Len(FileLST))

            For t = 0 To Len(FileLST)
                FileBinary(t) = Asc(Mid(FileLST, t + 1, 1))
            Next
            
            UpdateViewFRM

            FRMView.Show (1)
        
            Exit Sub
                
        End If

        SetWoW64Translation 32
        FRMView.Show (1)
    End If

End Sub

Private Sub MNWoW64_Click(Index As Integer)
    MNWoW64(0).Checked = False
    MNWoW64(1).Checked = False
    MNWoW64(2).Checked = False
    MNWoW64(3).Checked = False
    MNWoW64(Index).Checked = True
    SaveOptions
End Sub

Private Sub POP_Click()

    On Error GoTo 5

    MNJumpToRegEdit.Caption = "Jump to..."

    If DisablePop = 1 Then Exit Sub
    
    If Toolbar1.Enabled = True Then
        MNAddKey.Enabled = True
    Else
        MNAddKey.Enabled = False
    End If
        
    i = FRMMain.ListView1.SelectedItem.Index

    If FRMMain.ListView1.ListItems(i).SubItems(2) = "" Then GoTo 5
    MNBackupKey.Enabled = True
    MNAddToProtectKeyList.Enabled = True
    MNAddToClearSTList.Enabled = True
    MNCopyKey.Enabled = True
    MNView.Enabled = True
    MNJumpToRegEdit.Enabled = True
    MNDeleteKey.Enabled = True
    MNRemoveItem.Enabled = True

    If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 3) = "reg" Then MNJumpToRegEdit.Caption = "Jump to RegEdit"
    If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "process" Or Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 5) = "shell" Then MNJumpToRegEdit.Enabled = False: MNJumpToRegEdit.Caption = "Jump to ..."
    If LCase(FRMMain.ListView1.ListItems(i).SubItems(1)) = "sector" Then MNJumpToRegEdit.Enabled = False: MNJumpToRegEdit.Caption = "Jump to ..."
    If Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 4) = "file" Or Left(LCase(Left(FRMMain.ListView1.ListItems(i).SubItems(1), 4)), 3) = "dir" Or Left(LCase(FRMMain.ListView1.ListItems(i).SubItems(1)), 6) = "stream" Then MNJumpToRegEdit.Caption = "Jump to Explorer"

    Exit Sub

5   MNBackupKey.Enabled = False
    MNAddToProtectKeyList.Enabled = False
    MNAddToClearSTList.Enabled = False
    MNDeleteKey.Enabled = False
    MNCopyKey.Enabled = False
    MNView.Enabled = False
    MNJumpToRegEdit.Enabled = False
    MNRemoveItem.Enabled = False

End Sub

Private Sub StatusBar1_Click()

    If Replace(StatusBar1.Panels(1).Text, " Hidden)", "") <> StatusBar1.Panels(1).Text Then MsgBox "For show hidden key disable 'Hide Protect Key' options!", vbExclamation
End Sub

Private Sub StatusBar1_OLEDragDrop(Data As MSComctlLib.DataObject, _
                                   Effect As Long, _
                                   Button As Integer, _
                                   Shift As Integer, _
                                   x As Single, _
                                   y As Single)

    On Error Resume Next

    If ExistFile(Data.Files(1)) = True Then LoadF (Data.Files(1))

End Sub

Private Sub Timer1_Timer()
    SetSystemTime pt
    NukeTime = NukeTime + 1
End Sub

Private Sub Timer2_Timer()
    ResizeWin

    If FRMMain.CMDPause.Top = FRMMain.StatusBar1.Top + 60 And FRMMain.CMDPause.Left = Int(FRMMain.StatusBar1.Panels(1).Width + 60) Then Timer2.Enabled = False
    If FRMMain.CMDPause.Top = FRMMain.StatusBar1.Top + 60 And FRMMain.CMDPause.Left = Int(FRMMain.StatusBar1.Panels(1).Width + 61) Then Timer2.Enabled = False
    If FRMMain.CMDPause.Top = FRMMain.StatusBar1.Top + 60 And FRMMain.CMDPause.Left = Int(FRMMain.StatusBar1.Panels(1).Width + 59) Then Timer2.Enabled = False

End Sub

Private Sub Timer3_Timer()
    Timer3.Enabled = False
    TBValue = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBar")

    If Replace(TBValue, Chr(255) & Chr(255) & Chr(255) & Chr(255), "") <> TBValue Then
        SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBar", Replace(TBValue, Chr(255) & Chr(255) & Chr(255) & Chr(255), ""), REG_BINARY
    End If
    
    FRMMain.Toolbar1.RestoreToolbar "", "SOFTWARE\Trial-Reset\", "ToolBar"

End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)

    PackerIDX = Button.Tag

    Operation Val(Button.Key)
    
End Sub

Private Sub Toolbar1_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)

    If ButtonMenu.Key = "AddProtLST_Checked" Then

        For i = 1 To ListView1.ListItems.Count

            If ListView1.ListItems(i).Checked = True Then
                AddToProtList ListView1.ListItems(i).Text, ListView1.ListItems(i).SubItems(1), ListView1.ListItems(i).SubItems(2), 1
            End If

        Next

        SaveProt

        Exit Sub

    End If

    If ButtonMenu.Key = "AddSTCLST_Checked" Then

        For i = 1 To ListView1.ListItems.Count

            If ListView1.ListItems(i).Checked = True Then
                AddToSTClear ListView1.ListItems(i).Text, ListView1.ListItems(i).SubItems(1), ListView1.ListItems(i).SubItems(2), 1
            End If

        Next

        SaveSTClear

        Exit Sub

    End If
    
    If Len(ButtonMenu.Key) > 9 Then
        If Right(ButtonMenu.Key, 9) = "_FileList" Then
            PackerIDX = PSFile
            Operation 1, ButtonMenu.Tag
        End If
    End If

    On Error Resume Next

    PackerIDX = ButtonMenu.Parent.Tag

    Operation Val(ButtonMenu.Key)
    
End Sub

Private Sub Toolbar1_Change()

    If FRMMain.Visible = True Then
        FRMMain.Toolbar1.SaveToolbar "", "SOFTWARE\Trial-Reset\", "ToolBar"
        
        TBValue = ReadValue(HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBar")

        If Replace(TBValue, Chr(255) & Chr(255) & Chr(255) & Chr(255), "") <> TBValue Then
            SetValue HKEY_CURRENT_USER, "SOFTWARE\Trial-Reset", "ToolBar", Replace(TBValue, Chr(255) & Chr(255) & Chr(255) & Chr(255), ""), REG_BINARY
            FRMMain.Toolbar1.RestoreToolbar "", "SOFTWARE\Trial-Reset\", "ToolBar"
        End If
    
    End If

End Sub

Private Sub Toolbar1_DblClick()
    Call MNCustomizeToolbar_Click
End Sub

Private Sub Toolbar1_OLEDragDrop(Data As MSComctlLib.DataObject, _
                                 Effect As Long, _
                                 Button As Integer, _
                                 Shift As Integer, _
                                 x As Single, _
                                 y As Single)

    On Error Resume Next

    If ExistFile(Data.Files(1)) = True Then LoadF (Data.Files(1))

End Sub

