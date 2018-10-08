VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmMain 
   Caption         =   "The Enigma Protector Keys Generator"
   ClientHeight    =   6675
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9045
   LinkTopic       =   "Form1"
   ScaleHeight     =   6675
   ScaleWidth      =   9045
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      Caption         =   "Key Restrictions"
      Height          =   2175
      Left            =   120
      TabIndex        =   31
      Top             =   2160
      Width           =   6015
      Begin VB.ComboBox comCountries 
         Height          =   315
         ItemData        =   "frmMain.frx":0000
         Left            =   1800
         List            =   "frmMain.frx":01CD
         Style           =   2  'Dropdown List
         TabIndex        =   53
         Top             =   1440
         Width           =   1455
      End
      Begin VB.CheckBox cbCountry 
         Caption         =   "Country"
         Height          =   255
         Left            =   240
         TabIndex        =   52
         Top             =   1440
         Width           =   975
      End
      Begin VB.TextBox tHardware 
         Height          =   285
         Left            =   1800
         TabIndex        =   51
         Top             =   1800
         Width           =   3975
      End
      Begin VB.CheckBox cbHardware 
         Caption         =   "Hardware ID"
         Height          =   255
         Left            =   240
         TabIndex        =   50
         Top             =   1800
         Width           =   1215
      End
      Begin VB.CheckBox cbGlobalTime 
         Caption         =   "Global Time"
         Height          =   255
         Left            =   3480
         TabIndex        =   49
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox tGlobalTime 
         Height          =   285
         Left            =   4800
         TabIndex        =   47
         Text            =   "60"
         Top             =   1440
         Width           =   735
      End
      Begin VB.CheckBox cbRuntime 
         Caption         =   "Run-time"
         Height          =   255
         Left            =   3480
         TabIndex        =   46
         Top             =   1080
         Width           =   975
      End
      Begin VB.TextBox tRuntime 
         Height          =   285
         Left            =   4800
         TabIndex        =   44
         Text            =   "10"
         Top             =   1080
         Width           =   735
      End
      Begin VB.CheckBox cbDays 
         Caption         =   "Days"
         Height          =   255
         Left            =   3480
         TabIndex        =   43
         Top             =   720
         Width           =   855
      End
      Begin VB.TextBox tDays 
         Height          =   285
         Left            =   4800
         TabIndex        =   41
         Text            =   "30"
         Top             =   720
         Width           =   735
      End
      Begin VB.TextBox tExecutions 
         Height          =   285
         Left            =   4800
         TabIndex        =   40
         Text            =   "100"
         Top             =   360
         Width           =   735
      End
      Begin ComCtl2.UpDown UpDown1 
         Height          =   285
         Left            =   5520
         TabIndex        =   39
         Top             =   360
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         _Version        =   327681
         Value           =   100
         BuddyControl    =   "tExecutions"
         BuddyDispid     =   196638
         OrigLeft        =   5520
         OrigTop         =   360
         OrigRight       =   5775
         OrigBottom      =   645
         Max             =   32767
         Min             =   1
         SyncBuddy       =   -1  'True
         BuddyProperty   =   0
         Enabled         =   -1  'True
      End
      Begin VB.CheckBox cbExecutions 
         Caption         =   "Executions"
         Height          =   255
         Left            =   3480
         TabIndex        =   38
         Top             =   360
         Width           =   1095
      End
      Begin VB.CheckBox cbRegisterBefore 
         Caption         =   "Register Before"
         Height          =   255
         Left            =   240
         TabIndex        =   36
         Top             =   1080
         Width           =   1455
      End
      Begin VB.CheckBox cbRegisterAfter 
         Caption         =   "Register After"
         Height          =   255
         Left            =   240
         TabIndex        =   34
         Top             =   720
         Width           =   1455
      End
      Begin MSComCtl2.DTPicker dtpExpiration 
         Height          =   300
         Left            =   1800
         TabIndex        =   33
         Top             =   360
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   529
         _Version        =   393216
         Format          =   97452033
         CurrentDate     =   40164
      End
      Begin VB.CheckBox cbExpiration 
         Caption         =   "Expiration Date"
         Height          =   255
         Left            =   240
         TabIndex        =   32
         Top             =   360
         Width           =   1455
      End
      Begin MSComCtl2.DTPicker dtpRegisterAfter 
         Height          =   300
         Left            =   1800
         TabIndex        =   35
         Top             =   720
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   529
         _Version        =   393216
         Format          =   97452033
         CurrentDate     =   40164
      End
      Begin MSComCtl2.DTPicker dtpRegisterBefore 
         Height          =   300
         Left            =   1800
         TabIndex        =   37
         Top             =   1080
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   529
         _Version        =   393216
         Format          =   97452033
         CurrentDate     =   40164
      End
      Begin ComCtl2.UpDown UpDown2 
         Height          =   285
         Left            =   5520
         TabIndex        =   42
         Top             =   720
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         _Version        =   327681
         Value           =   30
         BuddyControl    =   "tDays"
         BuddyDispid     =   196639
         OrigLeft        =   4440
         OrigTop         =   1080
         OrigRight       =   4695
         OrigBottom      =   1455
         Max             =   32767
         Min             =   1
         SyncBuddy       =   -1  'True
         BuddyProperty   =   0
         Enabled         =   -1  'True
      End
      Begin ComCtl2.UpDown UpDown3 
         Height          =   285
         Left            =   5520
         TabIndex        =   45
         Top             =   1080
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         _Version        =   327681
         Value           =   10
         BuddyControl    =   "tRuntime"
         BuddyDispid     =   196642
         OrigLeft        =   4440
         OrigTop         =   1080
         OrigRight       =   4695
         OrigBottom      =   1455
         Max             =   32767
         Min             =   1
         SyncBuddy       =   -1  'True
         BuddyProperty   =   0
         Enabled         =   -1  'True
      End
      Begin ComCtl2.UpDown UpDown4 
         Height          =   285
         Left            =   5520
         TabIndex        =   48
         Top             =   1440
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         _Version        =   327681
         Value           =   60
         BuddyControl    =   "tGlobalTime"
         BuddyDispid     =   196645
         OrigLeft        =   4440
         OrigTop         =   1080
         OrigRight       =   4695
         OrigBottom      =   1455
         Max             =   32767
         Min             =   1
         SyncBuddy       =   -1  'True
         BuddyProperty   =   0
         Enabled         =   -1  'True
      End
   End
   Begin VB.CommandButton btnVerifyFP 
      Caption         =   "Verify from project"
      Height          =   375
      Left            =   6840
      TabIndex        =   25
      Top             =   4440
      Width           =   2055
   End
   Begin VB.CommandButton btnVerify 
      Caption         =   "Verify"
      Height          =   375
      Left            =   4560
      TabIndex        =   24
      Top             =   4440
      Width           =   2175
   End
   Begin VB.Frame Frame2 
      Caption         =   "Key Type"
      Height          =   1335
      Left            =   120
      TabIndex        =   23
      Top             =   720
      Width           =   6015
      Begin VB.CheckBox cbHyphens 
         Caption         =   "Add hyphens"
         Height          =   255
         Left            =   120
         TabIndex        =   30
         Top             =   960
         Width           =   5055
      End
      Begin VB.ComboBox cbKeyMode 
         Height          =   315
         ItemData        =   "frmMain.frx":07CF
         Left            =   120
         List            =   "frmMain.frx":07E5
         Style           =   2  'Dropdown List
         TabIndex        =   29
         Top             =   480
         Width           =   2775
      End
      Begin VB.ComboBox cbKeyBase 
         Height          =   315
         ItemData        =   "frmMain.frx":082F
         Left            =   3360
         List            =   "frmMain.frx":0842
         Style           =   2  'Dropdown List
         TabIndex        =   28
         Top             =   480
         Width           =   2415
      End
      Begin VB.Label Label2 
         Caption         =   "Key Base"
         Height          =   255
         Left            =   3360
         TabIndex        =   27
         Top             =   240
         Width           =   2415
      End
      Begin VB.Label Label1 
         Caption         =   "Key Mode"
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.TextBox tKey 
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   22
      Top             =   4920
      Width           =   7215
   End
   Begin VB.CommandButton bClose 
      Cancel          =   -1  'True
      Caption         =   "Close"
      Height          =   1575
      Left            =   7560
      TabIndex        =   21
      Top             =   4920
      Width           =   1335
   End
   Begin VB.CommandButton bGenFP 
      Caption         =   "Generate key from project"
      Height          =   375
      Left            =   2400
      TabIndex        =   20
      Top             =   4440
      Width           =   2055
   End
   Begin VB.CommandButton bGet 
      Caption         =   "Generate key"
      Height          =   375
      Left            =   120
      TabIndex        =   19
      Top             =   4440
      Width           =   2175
   End
   Begin VB.Frame Frame1 
      Caption         =   "Secure sections"
      Height          =   3615
      Left            =   6240
      TabIndex        =   2
      Top             =   720
      Width           =   2655
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 16"
         Height          =   195
         Index           =   15
         Left            =   1320
         TabIndex        =   18
         Top             =   2880
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 15"
         Height          =   195
         Index           =   14
         Left            =   1320
         TabIndex        =   17
         Top             =   2520
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 14"
         Height          =   195
         Index           =   13
         Left            =   1320
         TabIndex        =   16
         Top             =   2160
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 13"
         Height          =   195
         Index           =   12
         Left            =   1320
         TabIndex        =   15
         Top             =   1800
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 12"
         Height          =   195
         Index           =   11
         Left            =   1320
         TabIndex        =   14
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 11"
         Height          =   195
         Index           =   10
         Left            =   1320
         TabIndex        =   13
         Top             =   1080
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 10"
         Height          =   195
         Index           =   9
         Left            =   1320
         TabIndex        =   12
         Top             =   720
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 9"
         Height          =   195
         Index           =   8
         Left            =   1320
         TabIndex        =   11
         Top             =   360
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 8"
         Height          =   195
         Index           =   7
         Left            =   120
         TabIndex        =   10
         Top             =   2880
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 7"
         Height          =   195
         Index           =   6
         Left            =   120
         TabIndex        =   9
         Top             =   2520
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 6"
         Height          =   195
         Index           =   5
         Left            =   120
         TabIndex        =   8
         Top             =   2160
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 5"
         Height          =   195
         Index           =   4
         Left            =   120
         TabIndex        =   7
         Top             =   1800
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 4"
         Height          =   195
         Index           =   3
         Left            =   120
         TabIndex        =   6
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 3"
         Height          =   195
         Index           =   2
         Left            =   120
         TabIndex        =   5
         Top             =   1080
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 2"
         Height          =   195
         Index           =   1
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   1215
      End
      Begin VB.CheckBox cbSection 
         Caption         =   "Section 1"
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.TextBox tbUserInfo 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   8775
   End
   Begin VB.Label lbUserInfo 
      Caption         =   "User information"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2895
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub bClose_Click()
  End
End Sub

Private Sub bGenFP_Click()
  Dim kg As TKeyGenParams
  Dim I As Integer
  Dim dwResult As Long
  
  tKey.Text = vbNullString
  If tbUserInfo.Text = vbNullString Then
    MsgBox "User info field is empty!"
    Exit Sub
  End If
  
  ' Hyphens
  kg.KeyWithHyphens = cbHyphens.Value

  ' Fill key buffer
  kg.Key = String$(2048, 0)
  kg.KeyLen = 2048
  ' Fill User Info buffer
  kg.RegInfo = tbUserInfo.Text
  kg.RegInfoLen = Len(tbUserInfo.Text)
  ' Key expiration info
  kg.UseKeyExpiration = cbExpiration.Value
  If kg.UseKeyExpiration Then
    kg.ExpirationDay = dtpExpiration.Day
    kg.ExpirationMonth = dtpExpiration.Month
    kg.ExpirationYear = dtpExpiration.Year
  End If
  ' Register After
  kg.UseRegisterAfter = cbRegisterAfter.Value
  If kg.UseRegisterAfter Then
    kg.RegisterAfterDay = dtpRegisterAfter.Day
    kg.RegisterAfterMonth = dtpRegisterAfter.Month
    kg.RegisterAfterYear = dtpRegisterAfter.Year
  End If
  ' Register Before
  kg.UseRegisterBefore = cbRegisterBefore.Value
  If kg.UseRegisterBefore Then
    kg.RegisterBeforeDay = dtpRegisterBefore.Day
    kg.RegisterBeforeMonth = dtpRegisterBefore.Month
    kg.RegisterBeforeYear = dtpRegisterBefore.Year
  End If
  ' Executions
  kg.UseExecutionsLimit = cbExecutions.Value
  If kg.UseExecutionsLimit Then
    kg.ExecutionsCount = tExecutions.Text
  End If
  ' Days
  kg.UseDaysLimit = cbDays.Value
  If kg.UseDaysLimit Then
    kg.DaysCount = tDays.Text
  End If
  ' Runtime
  kg.UseRunTimeLimit = cbRuntime.Value
  If kg.UseRunTimeLimit Then
    kg.RunTimeMinutes = tRuntime.Text
  End If
  ' Global Time
  kg.UseGlobalTimeLimit = cbGlobalTime.Value
  If kg.UseGlobalTimeLimit Then
    kg.GlobalTimeMinutes = tGlobalTime.Text
  End If
  ' Country
  kg.UseCountyLimit = cbCountry.Value
  If kg.UseCountyLimit Then
    kg.CountryCode = comCountries.ItemData(comCountries.ListIndex)
  End If
  ' Hardware ID
  kg.UseHardwareLocking = cbHardware.Value
  If kg.UseHardwareLocking Then
    kg.HardwareID = tHardware.Text
  End If
  ' Crypt Sections
  For I = 1 To NUMBER_OF_CRYPTED_SECTIONS
    kg.EncryptedSections(I - 1) = cbSection(I - 1).Value
  Next I
  
  ' Generate reg. key
  dwResult = KG_GenerateRegistrationKeyFromProject("default.enigma", kg)
  If dwResult = ERROR_OK Then
    tKey.Text = kg.Key
  Else
    Select Case dwResult
      Case EP_ERROR_UNKNOWN
        tKey.Text = "EP_ERROR_UNKNOWN"
      Case EP_ERROR_KEYBUFFEREMPTY
        tKey.Text = "EP_ERROR_KEYBUFFEREMPTY"
      Case EP_ERROR_KEYBUFFERISLESS
        tKey.Text = "EP_ERROR_KEYBUFFERISLESS"
      Case EP_ERROR_REGINFOEMPTY
        tKey.Text = "EP_ERROR_REGINFOEMPTY"
      Case EP_ERROR_REGINFOTOOLARGE
        tKey.Text = "EP_ERROR_REGINFOTOOLARGE"
      Case EP_ERROR_PRIVATEKEYISNOTSET
        tKey.Text = "EP_ERROR_PRIVATEKEYISNOTSET"
      Case EP_ERROR_PUBLICKEYISNOTSET
        tKey.Text = "EP_ERROR_PUBLICKEYISNOTSET"
      Case EP_ERROR_PRIVATEKEYISINVALID
        tKey.Text = "EP_ERROR_PRIVATEKEYISINVALID"
      Case EP_ERROR_PUBLICKEYISINVALID
        tKey.Text = "EP_ERROR_PUBLICKEYISINVALID"
      Case EP_ERROR_KEYMODEISINVALID
        tKey.Text = "EP_ERROR_KEYMODEISINVALID"
      Case EP_ERROR_KEYBASEISINVALID
        tKey.Text = "EP_ERROR_KEYBASEISINVALID"
      Case EP_ERROR_CURRENTDATEISINVALID
        tKey.Text = "EP_ERROR_CURRENTDATEISINVALID"
      Case EP_ERROR_EXPIRATIONDATEISINVALID
        tKey.Text = "EP_ERROR_EXPIRATIONDATEISINVALID"
      Case EP_ERROR_KEYISINVALID
        tKey.Text = "EP_ERROR_KEYISINVALID"
      Case EP_ERROR_HARDWAREID
        tKey.Text = "EP_ERROR_HARDWAREID"
      Case EP_ERROR_HARDWAREBUFFEREMPTY
        tKey.Text = "EP_ERROR_HARDWAREBUFFEREMPTY"
      Case EP_ERROR_HARDWAREIDINVALIDFORKEY
        tKey.Text = "EP_ERROR_HARDWAREIDINVALIDFORKEY"
      Case EP_ERROR_PROJECTFILENOTFOUND
        tKey.Text = "EP_ERROR_PROJECTFILENOTFOUND"
      Case EP_ERROR_INVALIDPROJECTFILE
        tKey.Text = "EP_ERROR_INVALIDPROJECTFILE"
      Case EP_ERROR_EXECUTIONSNUMBERINVALID
        tKey.Text = "EP_ERROR_EXECUTIONSNUMBERINVALID"
      Case EP_ERROR_DAYSNUMBERINVALID
        tKey.Text = "EP_ERROR_DAYSNUMBERINVALID"
      Case EP_ERROR_COUNTRYCODEINVALID
        tKey.Text = "EP_ERROR_COUNTRYCODEINVALID"
      Case EP_ERROR_RUNTIMEINVALID
        tKey.Text = "EP_ERROR_RUNTIMEINVALID"
      Case EP_ERROR_GLOBALTIMEINVALID
        tKey.Text = "EP_ERROR_GLOBALTIMEINVALID"
      Case EP_ERROR_INSTALLBEFOREINVALID
        tKey.Text = "EP_ERROR_INSTALLBEFOREINVALID"
      Case EP_ERROR_INSTALLAFTERINVALID
        tKey.Text = "EP_ERROR_INSTALLAFTERINVALID"
     Case Else
        tKey.Text = "Unknown error"
    End Select
  End If
End Sub

Private Sub bGet_Click()
  Dim kg As TKeyGenParams
  Dim I As Integer
  Dim dwResult As Long
  
  tKey.Text = vbNullString
  If tbUserInfo.Text = vbNullString Then
    MsgBox "User info field is empty!"
    Exit Sub
  End If
  
  ' Key mode
  kg.KeyMode = cbKeyMode.ListIndex
  ' Key base
  kg.KeyBase = cbKeyBase.ListIndex
  ' Hyphens
  kg.KeyWithHyphens = cbHyphens.Value
  
  Select Case kg.KeyMode
    Case RM_512
      kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC" & _
                     "P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC" & _
                     "WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH" & _
                     "CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8" & _
                     "HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP" & _
                     "SRGDQ742B4742XF4MACRR747YDP5FZZ9D" & vbNullChar
      kg.PrivateKey = "00C98B2SF9UBJA605AJX53GJFXJV8UH4A6PY2L6CV4MAMV7V3ERRVY99Y" & _
                      "72V2P77Z2J3KBPGWR3WXKG5GF9Z6CKXJHY5VUMBTQ66H2MRZPCU00DLFJ" & _
                      "675JTTTNEK00DLFJ675JTTTNEK" & vbNullChar
    Case RM_768
      kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC" & _
                     "P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC" & _
                     "WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH" & _
                     "CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8" & _
                     "HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP" & _
                     "SRGDQ742B4742XF4MACRR747YDP5FZZ9D" & vbNullChar
      kg.PrivateKey = "00C98B2SF9UBJA605AJX53GJFXJV8UH4A6PY2L6CV4MAMV7V3ERRVY99Y" & _
                      "72V2P77Z2J3KBPGWR3WXKG5GF9Z6CKXJHY5VUMBTQ66H2MRZPCU00DLFJ" & _
                      "675JTTTNEK00DLFJ675JTTTNEK" & vbNullChar
    Case RM_1024
      kg.PublicKey = "0201B810DA4A1ADD4351378790A981385330CDG9YQSEUK2HT546KWW46NHSCHMD2TNCSPVNSKGQC6CHDUSU9CC4LDPL" & _
                       "TD3NLRVD3TFV9BU2SYBUBU9TXKLQ3CTKZE5GN9VFG37R9YNK2FE58K7ZY" & _
                       "WTUJYFSJTBMDLLGA9GJ2LJXGHSS9CESGC2K69H65YQGAC7CRGF5T3CPLA" & _
                       "5BDJZKVCUWPZRNA2DN7L956LZVZBQUDPX6PF30CDBH26Z82VE4QQ8N85L" & _
                       "QHYJYYCJ6WQ89H9K9VVQX925SG5FJ79AGVZB6M8TTFKCJ56FAREP8GSTC" & _
                       "NKWCXEALDP9Y2ZLS9QKZV8JRNDHG9D8BRDSCTMDQK9NLAPZ9TGYFS9G7U" & _
                       "LXHYJF7F9A89HPXGTU2N4FQQJL98WZ5QND2KTEMMUUZFAX953HCGNSWUW" & _
                       "U2M7LBEWZSH9GW5SC0CDJDY2HC4HJYUSVTAVXZ7MYVJWF3CU9WC3SVPSL" & _
                       "29WF46DVS2SYKSSAMATPPYGJDE3PBFMGS34CXWQSXKCEAE63L2EXTS9NE" & _
                       "2G597XASY3S34XMYST5YZF4THUTYT5DY9UKKXU6PH8MLXRPZMPMMR83JU" & _
                       "X2WGNEW8ZGL4SKUCUB8CEAB6UZ4FB66WTP3B64VMX7XG75T4Y35479" & vbNullChar
      kg.PrivateKey = "020MLJ7XTRVLBDNUVMKGUFHCU8XBGMHHVRA0ADSHPBC7NVSZ82AM867XC" & _
                       "BELNKMR7CZ56C4SW8KKRD9WZLE5X992GZVSZXS5J6JG9SLDW3Y696TU4D" & _
                       "QZP778LVFKVRKANQD6FUGN2ACWUJM9ZK6ME7WXWDZ88LTWHME52RKUDKX" & _
                       "STT7RGWP7HFUJDGWEUG4ZHQ25DCQJ644CLEXRR3G020SAAREJB4WXZ4H2" & _
                       "JEH4AB4U8FGFTA4CAF020SAAREJB4WXZ4H2JEH4AB4U8FGFTA4CAF" & vbNullChar
    Case RM_2048
      kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533199H9KZC4CQ5ZKPEGYDW2EHN5AKZA5G5KP4HU8USWJR8XWW7MCH7244RV" & _
                       "PSXFHVU6YQRK4LPUHM497XJYPLLA3DHUZWXK3CB5SUYF75NPYLTNPRUAP" & _
                       "CTVDHAKYWTRQ97HES2E59WDN2LJKFYA2K8BGFSBHP4A6BF5FSDTS8NWLL" & _
                       "C5NEQ76NJ9BAMWXG55UPFFMRQZTU5KV2G6LSPQUJJWA9U4LJ5SCJ9M9ZQ" & _
                       "Z6K7LZA9UAMJ533UQ5J3JPNQAUWJGZFRFCTGAGSBWPWRRF9HRGF9MCX55" & _
                       "QRYGPYMRE6DBJ65SJDX34FVPYWWKWQ48MCKXYXPHQ23BJ42U8ZMDD8CG5" & _
                       "DPHZQ5XTXUKA277XK6PKSTLJ88ZZ9EBXH62REMRZZRGNPKHYM34RW722S" & _
                       "SZHMPFKY7X8UZ19ADGX3UQ7X444XH7MZXEZYW2YLFHR8YL3PTCXVSYX89" & _
                       "ZXN7KW2XNBE8XS3TQRGZVF6KA5USH56NEZYH5RNWBBPVE9LD6H42RQWR5" & _
                       "YVQMT5EQYQTK6YM9V8DA5BJCLGGZ2UGD6NPA2X3SNUS47F7HJBNBCWHRA" & _
                       "YPPCQ5HWCJNPDHUDQMRN2P6PWJFWJ6CLVNK8HXEFLE4ENPXAFN89CRS43" & _
                       "RUMVGDJQCSRB535XYCS6BZYLA9Q6HJV425F26XXHRGA7C8R8BVMELAPEH" & _
                       "5DSA9KXTCV4H2RNVDFHG3YJSERZVFPWHYA823LUBENBL5U3J4LJX2KQLW" & _
                       "L5XGGESPSE2FQWKSQ4NUCDLBEJPQAT2A2477DYS2XEXKLYEAKUN22622C" & _
                       "RLBCAHPFNEV2FJ2H8N3JQGXJRGP19AFHGRW6SS2ZSFYK8EZAPVYL4MCP4" & _
                       "6UMR64Y9T89FHWEPXBRHKWJCSNNNGPU984J5XW4BWTU6PDWPN24W8RU55" & _
                       "A9C3U9H7VHS5PFURASHBT4JAEE5ZKJBSYMCMDVBLU973R72RVPA6U96A2" & _
                       "LX8HMASVST9RVJ7W66V4DYWRDZZQ3673W7C7LVF68TWPLNMYEUQ8FDZRN" & _
                       "P38D9BX5YA3VENETDUUUMR9U7FFP4NZM7G4Y6J6EASK5SAXXTRMZ8F3AH" & _
                       "5FC54E543N739BY5KVZQM7JZWD2P2HPE7BDRMM9JFCGPBWWASTZ7UDNRV" & _
                       "6AFHVMBR9AGAERE9M6W6S2ZT8PBTABPDCKBPPPV6QW9DRXZUGAHDDRRSY" & _
                       "XM4YXQ2QJX6CL33N7RV8846LK8A3DFLDXWZ2NKF8V" & vbNullChar
      kg.PrivateKey = "02DB825DUDFYHA88AG49NMM742HCQEJDKQQGDR6G3GL7MCED16DU9KTVE" & _
                       "47XQ3M92FFKX8FU9ZXT7AK7VTGGJSYQERCZBR8J2DE2CFE3VUU4W7JEQJ" & _
                       "L49HDUXBW7SNPCV8MHXM7EQHYPQK3GSPQYV5VWESQE4AYWFZHXN2UX7Z3" & _
                       "T3CV52XURB3YFKLUCY6CJTRACRVVDD568F6F28U74ABWCZ2ZMC32E83V3" & _
                       "4JZZPDBF3KEYQWREETGKQT6NANCMAD4XDEXW5LCYBJ3GMDJBM3E7FNK98" & _
                       "7JEUYEV7QNKGKNTDVMRG3G5L8NC9CNHQS8AVDMDBEGCG3DHGJUGPG2244" & _
                       "2C9LCD8FJ2LSDMQXLHCGCLP7ZSYQT2UJ4QFGU2CH3BTT3UADZMQSBAV33" & _
                       "B3Z2Y8Y8RRD9J754G02DJ372LR8APP7HXKB2GNPHP6T65C3RR48Q8BHGP" & _
                       "KEZ6PX2D02DJ372LR8APP7HXKB2GNPHP6T65C3RR48Q8BHGPKEZ6PX2D" & vbNullChar
    Case RM_3072
      kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533267BJBN6W8SY33Y47RWJHWS385XWRV9TSVSB5EM7ECZYNSJ44ZKSD8KV4" & _
                       "6Y9T6TNC6QMDW4V6DBMADU3YUKLP88TCLEUD9FTEUHGXM6T57AQ2EMB59" & _
                       "UPQVNSUT7Z4EHAMDQ6N77VK2A6P847MMWJH9E7C5XX6FNF6MHGWERPWQV" & _
                       "9ZLVR9Z7X5D5Z2XQL6MBM7BDCT2DEDVRBFNDDBLG6LHZ9APM48LS5TKTJ" & _
                       "AGDYFDRVHEGTDH47PCLL8YJ4ZAWCB59F8BN5PZL3NQACP32G3YNBX5E3J" & _
                       "7S28XLRGAX55ZML5XE6Q68EUAL38VUBJ2MZ2UGCCHM7CE6S99N44X9RMV" & _
                       "7B55HULJ4KHPFYSBDUSPQTCWGS76BEQST2QCZDZ2T4FBA4YUJFF47AACE" & _
                       "A4EEFESEYWN48UZCSDZAMGSU5VB9UJKR2XQUSDFS3TNG9QKURQWS7N5Q3" & _
                       "VPYT4QAGGQ5GW2MMXHDJYW55FQPHSS255GVJ7WLLP85JHS8K6DVTJWB4W" & _
                       "4Y8ZEFF7KP6W74PAA8FVPZVDW4RKGMQ8V56Q6R4V34XFE5HR4FZS8GZ6R" & _
                       "36RKW6WN34S2AHR9LCGF8LULB7ZN6NC2AA5RPDZYGWSPPME6267CGLZCP" & _
                       "GG98W557RXCDWAETJHDCRPUXX7AD3E8SL9WMGBV9QFHMSV9UFV7H9NTX3" & _
                       "QYV95CN9P9DSYQWL35R2BWB4GKW6CTWVB2X6WH3P2WFBE6X55KBLAMDB3" & _
                       "SRDSDVY37GKH78MUHY7KDJDC8SJU5FUQRYZ49ULX3YSZL7E284GFVZSGD" & _
                       "FTTQNR6VMBM3LLR78SUSVMJW88XT2K4UHEATRU3V9MMR2VGNGCY9S6R7M" & _
                       "4ELNPEBBMQP2HVPLY5M5VPA92V7NU8ZZ58YYTW5QK9USZ5LV59UZGB2CF" & _
                       "DPZ6HFYU5WB7UU3UYWVNSNKM3W7GBYKJP8TMFW2YN6GNSSE4ZKFVZRLUT" & _
                       "8QPZBBEQT5H9H5Z53D7QV4AJTKTX4EMW62TDWXQVK24JZPSG2VXKCMYZL" & _
                       "BUASE25R3EEK9KBLJ8VX83ZXGTBL5CCDBY33HJ6FKX8AW3WPRX3XTCS9G" & _
                       "2B9SVK2XFFKNSPGFG6FZNS8P2HERFGFL79DKUZZFWHFH4H9UZ7F7F6W3Z" & _
                       "WN84JRRA7SU8T89EQMRBEPVYMMGLGSUMFWWMEDLJM5EGP5WEX9LDUAQXS" & _
                       "55LKDQVRKX4R8NNBHSYBHSNMFYA2C6KGQQFK3TN267DPSZT3PTKHTLNMU" & _
                       "V2YYZZRX3953LPWAKYF8LJUVMEQT3ZC4F9SWMYGUHG6XX66PJFQWSRUW2" & _
                       "C79YLGZ6ZAFS7HLXBTH55UD3EGFBZQ5CLNJDZTEJACDVBCM5FQBTX4DKK"
       kg.PublicKey = kg.PublicKey & _
                       "UDGNSMWWLC5UMQRHW89CTU5636WYDXVZZDAUZ529458LDN2DAR9QADWRZ" & _
                       "UTU8MCKN8ACH3R36YKE52DDF67SM5UDUH7PTATHXE65UCGFRCV49UTF29" & _
                       "BGDSUWGRMC839HUZYQVAG985YUF5KJCAVGKRD8E4YMPJ38KR6HD2KHDGY" & _
                       "PJDMJMN4Y3DTJW5MYX3VUPF32637LMAWFM4QCU7BMP74SCF4N5QXZZVBE" & _
                       "LAQMPYMJC2ZWJ9XFV33YXTTPH3SG9KMUABLL83P7L3UBVM763XJPR5UEH" & _
                       "DZ73XJUGR9QP6299K5PU46XGVWKWFAKWYMRXUSLCFJ3WQTEC6QJH6E5V8" & _
                       "X2RMA5TXGSBEWLGSMNQ2SH6G9MLKK4S486DN4M4QVDTYTM4JQETAJQGP7" & _
                       "6NUR4UNDXR4W4JQSNWDTUGX69SEDC3AL8ZF4TJBQQRXSX2A86UUWCDCFH" & _
                       "JE94A8EP3Q6A2QTYKEE62MV4VJB2AB" & vbNullChar
      kg.PrivateKey = "04DMQBFL5GKK4RXWEZYPEY8QB5GHBBGW3EY766DFF2Q6PLFLR4SSRWXBN" & _
                       "W5CFGFC84UJ8PKRDQQYWN9921AH8AGZAQRWJYZ7C3QUJJCJAAGGT5P5GG" & _
                       "LY6K5W4JZJDW7Y8EWS6SSYCS2MCR93MY9DG6VXLBRYVZWDX6XNFU286HM" & _
                       "AM9E82KJVZNYGC8RXRW43SFFWDLR8C96R58A42F3TGLXPVWLGMNPPAWS4" & _
                       "S2SSMNQLUPBAQMP7AUKAGV5CKL342W6UKQY3TUPXKGFXFES725PEX93UX" & _
                       "X4K8JRY3MPQ5S94VNPBXQ5N6LDBLWB67LBLDCGNQS3JEKW667UF8LA8Q6" & _
                       "B3AF4XGZKYB7BVVHF49DJUHSFJZRD63S4GMMAPQ8Q87HKN9G3J3575JEL" & _
                       "5C29NZLWQW6MSYWJ7S3NKLKPWGU75ZJXKEL6Z9V97HAMDYHM6ARCH58EP" & _
                       "WRPZUXN8RRWGCDFM6BH6XUTRTFE3VMAAZAUUKHKL6AFC2PCPXFRDWLVYP" & _
                       "ZKUGY8QDEZNECK9K5Y5MET9SRWQ36JF77XJ6NUKSMZ6DKUPEH4W43YQAE" & _
                       "CV7XVFWJ7ZTRVFQJZFU5BS8AL77YLCXDCR5VPFFZ9NP7EBBQ2AA04DP3S" & _
                       "86B3YD8AFXQ3KPPNTPHBTQSM8PUHJHG87RUM4EV63GKPBRGSN3VX63FCS" & _
                       "646DLWSH86B542U3F04DP3S86B3YD8AFXQ3KPPNTPHBTQSM8PUHJHG87R" & _
                       "UM4EV63GKPBRGSN3VX63FCS646DLWSH86B542U3F" & vbNullChar
    Case RM_4096
      kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533334BN75EUD4LFWYFVNFGBRCEMKKXG62QRBXL8GMHQ975B68FJVEMNXQQ7" & _
                       "RKR7RCZMWDVP86QPB3LR49G9BM7EUUZXNCRZBXRF4PEY3RX6UXT4X286K" & _
                       "WMR7AMEE6QNP9AEHGWJT9AVU3F62F37B5GVX2BQF73QWHRFQSQ6XMRP6M" & _
                       "ZDRQ8JT89UF3YRK5UL34MM3L8HLDTWAJF5YY7MRWJUFDQRK9JNCJ6C9KJ" & _
                       "WRE5ACQSNS24NEAHDYKS3AK75HBCTKP9NR2CSL7Q9PPXM4TF7L37USP77" & _
                       "Z7WER6JY67F7YGKTP6MFRMKK9H8XFPZ9XWKK97XCFXK7AW4TB96WGEH4B" & _
                       "YPF9QRF2DGC3LCHW8VTD2EMHVRDR6EEBUG8R4XYKJPLBPRCJP445DU2BW" & _
                       "JWELKAY45GKDU5HLTTDTWRH2JFKJ7AVAKLPEELN29YHX5JR773P9ERW7N" & _
                       "UFMWDKD4UL4YPU5QW2L4A7ZN3E8ZDQVEZUR6ZRDQXRLQRLUNHVB4XGBWD" & _
                       "HM79NGJARHDBQJCD8NWZCWPBY26QARP7A5S48DCV29F7MUTHU3YAHYVS7" & _
                       "ZPGXJZZA5HBBY4K5BQPUG6MVCBG8H3C7VL8KH9EH58NUVCE6F2CGMSM94" & _
                       "4CQDKNVGWWWRNK4DG26UT88Y9ULUPJ25G9KLTQPK3TBXZEK43X8KPMJT8" & _
                       "DF6MTQ5RB94XR2BT9H9NYYTXL29GF8KZY9QNHAW4LTT2RDQTD2ELWPSV4" & _
                       "4AND9K8G5VKLQ287UBEVHA82CMSMGQQBMNQZVAZ9G8T5TD6G9F7XQHMJT" & _
                       "HCL6PFEDUW5MN9JASF2EKPT2H33325A3SFGGM5C3RYKZSYSSQC5FLHNX9" & _
                       "VHN4HQVWD66YECY4R97JZHQALRTCHXUWH85LSJCCTQZT8JF52FHG6FV9J" & _
                       "UJWEU24K9Z7SKYTYA9NH7GW29FSNKUK3DMFXY48VEYZVDRTTMLFYSJH8B" & _
                       "RQXV72REYGSM6SLX89EVQ52CN9N8YDLWHAWCDDNM89YN2FCRTLE8688XN" & _
                       "F4MZMFE6GP9JK2JTFJVUKBLES2ZVWSBCJE9N3D7DG9LL9Z3U42QFJJPE2" & _
                       "HE5XCRY25UND96R9D7655ZBSCPF796FJZ4GPLY7AMZLGLR77GRP467ELK" & _
                       "PXSZ9ZF8MUYFDHV4EFACPZ79CDFTYW56NE9JDWDVUMNLY9EXDSF8ZNABE" & _
                       "MDQU6T9RVLTNRMZJJ8EJSUM9TV8YA6MNWF2Y66MD3VQ9L662F5X6VE9ZC" & _
                       "PPRTNMEV2DG9BUMFMSL7PUR9H5QG6VVBDBMEU3PLABL57HMSQ5C83E9X8" & _
                       "RTPY4QSEH2H7R2QDJHT5LQSFNQJL2NZ24GLNTFXG468WC5UUTDD68G8HM"
      kg.PublicKey = kg.PublicKey & _
                       "477Z8P4F9ZZHUGZ6VPFF32A2MPWY8LPXNECCKM9EEVLDDPUJ8LXN2AE6K" & _
                       "Y2Q42FVBCJM9GQTXNRHBED735KCFD4YGV4U5U3LJD6NJ886W6XQLWH3G7" & _
                       "3VZ6T5YDUQP6DA5ZHLKQSGATDJHUWC2ELTE7QJFXH8H9EAQYZPPMW76JG" & _
                       "Z48UBND9VXFXZMSGBNWQPNQG7E4TCBDMVKUSA9TTVSNLN3DXEZNXH787R" & _
                       "N7XHFBJNZ5W74DUMNBYVHEQDYMZBQCFMS8LGSDUAU6QE9DD5Q334BX62T" & _
                       "JP5WQQDS2ZEWW76XW7VMLX3L7V9UVD7RL297VDBVRFPQ5MYA3YFVBVNVA" & _
                       "R5TJXMQ4X2U2PW6UWSKBXT58HG3QPZM2RVEX2PDMCVJDFTJMXR9NPLW4C" & _
                       "6AE4Q9A8TTAQ68BSN9WWTFFTSX68ECVARFPDBBH5DMP4KYFARTFVCSWNF" & _
                       "FGAPBYYGFJA4MGHEDWTNE54MPGER7EPCZEV2ESJRMM6XDMFGABG97HECN" & _
                       "3SZFUBRKCNDZ2TE9F6EERULRCDAV5EMY6KVY9NY9MYNPP2FQ5WFWLMRYD" & _
                       "4TNYYHE6EDMQ6KK79HH5Q5KBW6DDQYYNUR365W2454CHEZWZAPU82SX4H" & _
                       "KHNZXBRVWAT7G9CJBKHNBPSVEL67X8UJHBFHZH8ZD4NSEVFZM4Y768TJ6" & _
                       "QP3BGEKLTY4UZUWHG63QMKVWAQW9E7WRFNJCH4XRD97JHNKMFUTRFVH68" & _
                       "G5CKSMGC725AZ9CBSL2JX43P4EY44CMF56AJ6BEXVCJP2ZDWCT9G55K4D" & _
                       "F24J7TTJMFXTQH95CBNX67CBPNWEKHCWQV6VD73Y9KCZHNBFUFS8TCYNN" & _
                       "WXRGFKNVRDFUKWHDWDDTSPEW8YCKLPMX2GUV3N4JFJMUE6TSJR6Z53C9F" & _
                       "SKZAY3EN7G66JPBF5E9S6Y7RQHPWZHSRDQ7XH87PHUJFLJFGD7WNE3Q9P" & _
                       "EXMW33LVJBFEUXKNUB6SU7ZYCEX96XT8G27FLUV7XPV4JK64DWDJCX9WV" & _
                       "4VL8CK23FQJ28UG9JUZTQJ3DRL32BTJVRD4LVQ6MK9LCE7ZZP925JK7ZD" & _
                       "92SCV4DDJJ5EXMVBF" & vbNullChar
      kg.PrivateKey = "067DN6F8YFBTWF5QH8MHJB39Z7VNN2P56HS8RPBURAWB8KPL8FQWX4HSP" & _
                       "RTY4HWFMFXAVX2YUY99G2U2KKK56CBE4BCPZWS3KJ98XRW4PY2CDQ3ALF" & _
                       "Y3HGJG42NRY9ZVGZZB59TE29KGC825BYBX3FRFMYBVN2VTHM8YM2KULXM" & _
                       "H24XSHNVK4HEQ9L5264844DMBFUUXSBA9PT9LEXT6449TMAMF7RL6KU6C" & _
                       "GP6FU9DNMJCNTUREF2U9WUMJBMXMMHWKWDG4VU5JQNFFNNWCP2YE2DGFD" & _
                       "N3H27NTNR58GBNTTZBRK66BKWNVMF8H59KALB6K93Y8UWDUWV5HJZGV8X" & _
                       "3AS5EG982DYV4W9CQ3GRRFRR8NABQC98FTAG465SXQ3JPN7X7VULQZX4X" & _
                       "UK68URBFPGCW2UPBYH6CRG6C7YBRAURM2KMGN5L8XH4AUQN8WM4P454WN" & _
                       "NWRE5SQEC78FK3LHHQU5VLXLYYN8F2NXGG7CCQ92EEC63ZE6S7CC7RTML" & _
                       "UMM3PAXPL5CJZFL26JNNYPVLAHM75NDL8AS8JR48PFXK49D4A6TY2ZU9Y" & _
                       "XX2Y2TLA3J8T56EPY236FEDGZEHTQR73NE2Y7LKL7423FFKGGPWYL8PB5" & _
                       "VWD54PG328ACE6V8VLSGVP9VJMMWS2VDVU459C8K5XK869Z5KM4JWHAVE" & _
                       "G56ZESC6HHJ423N6SAH2DW2UQZDQHSMKWUCHPUKZZPJXCQXF55Q3BJW6Z" & _
                       "QYK4HM4Q8XWU8NT844E8YM96EGHSYEUKAJ3QDXANN2DELSGARH7LR2XH9" & _
                       "UQBQNXGPZGB6JTEQP8HAQK5ZZYJE067DWX6C2JJ7L2HE4NGVXZV5XH9RD" & _
                       "P9SNG4WZTC9KEMGXDX7JTQX8RPJJRT4YTA83L8GXDNDDHB7C79CN8UWGL" & _
                       "U5EMNMBREQN5MYTYHGYK067DWX6C2JJ7L2HE4NGVXZV5XH9RDP9SNG4WZ" & _
                       "TC9KEMGXDX7JTQX8RPJJRT4YTA83L8GXDNDDHB7C79CN8UWGLU5EMNMBR" & _
                       "EQN5MYTYHGYK" & vbNullChar
  End Select

  ' Fill key buffer
  kg.Key = String$(2048, 0)
  kg.KeyLen = 2048
  ' Fill User Info buffer
  kg.RegInfo = tbUserInfo.Text
  kg.RegInfoLen = Len(tbUserInfo.Text)
  ' Key expiration info
  kg.UseKeyExpiration = cbExpiration.Value
  If kg.UseKeyExpiration Then
    kg.ExpirationDay = dtpExpiration.Day
    kg.ExpirationMonth = dtpExpiration.Month
    kg.ExpirationYear = dtpExpiration.Year
  End If
  ' Register After
  kg.UseRegisterAfter = cbRegisterAfter.Value
  If kg.UseRegisterAfter Then
    kg.RegisterAfterDay = dtpRegisterAfter.Day
    kg.RegisterAfterMonth = dtpRegisterAfter.Month
    kg.RegisterAfterYear = dtpRegisterAfter.Year
  End If
  ' Register Before
  kg.UseRegisterBefore = cbRegisterBefore.Value
  If kg.UseRegisterBefore Then
    kg.RegisterBeforeDay = dtpRegisterBefore.Day
    kg.RegisterBeforeMonth = dtpRegisterBefore.Month
    kg.RegisterBeforeYear = dtpRegisterBefore.Year
  End If
  ' Executions
  kg.UseExecutionsLimit = cbExecutions.Value
  If kg.UseExecutionsLimit Then
    kg.ExecutionsCount = tExecutions.Text
  End If
  ' Days
  kg.UseDaysLimit = cbDays.Value
  If kg.UseDaysLimit Then
    kg.DaysCount = tDays.Text
  End If
  ' Runtime
  kg.UseRunTimeLimit = cbRuntime.Value
  If kg.UseRunTimeLimit Then
    kg.RunTimeMinutes = tRuntime.Text
  End If
  ' Global Time
  kg.UseGlobalTimeLimit = cbGlobalTime.Value
  If kg.UseGlobalTimeLimit Then
    kg.GlobalTimeMinutes = tGlobalTime.Text
  End If
  ' Country
  kg.UseCountyLimit = cbCountry.Value
  If kg.UseCountyLimit Then
    kg.CountryCode = comCountries.ItemData(comCountries.ListIndex)
  End If
  ' Hardware ID
  kg.UseHardwareLocking = cbHardware.Value
  If kg.UseHardwareLocking Then
    kg.HardwareID = tHardware.Text
  End If
  ' Crypt Sections
  For I = 1 To NUMBER_OF_CRYPTED_SECTIONS
    kg.EncryptedSections(I - 1) = cbSection(I - 1).Value
  Next I
  
  kg.EncryptedConstant = D2113444489
  
  ' Generate reg. key
  dwResult = KG_GenerateRegistrationKey(kg)
  If dwResult = ERROR_OK Then
    tKey.Text = kg.Key
  Else
    Select Case dwResult
      Case EP_ERROR_UNKNOWN
        tKey.Text = "EP_ERROR_UNKNOWN"
      Case EP_ERROR_KEYBUFFEREMPTY
        tKey.Text = "EP_ERROR_KEYBUFFEREMPTY"
      Case EP_ERROR_KEYBUFFERISLESS
        tKey.Text = "EP_ERROR_KEYBUFFERISLESS"
      Case EP_ERROR_REGINFOEMPTY
        tKey.Text = "EP_ERROR_REGINFOEMPTY"
      Case EP_ERROR_REGINFOTOOLARGE
        tKey.Text = "EP_ERROR_REGINFOTOOLARGE"
      Case EP_ERROR_PRIVATEKEYISNOTSET
        tKey.Text = "EP_ERROR_PRIVATEKEYISNOTSET"
      Case EP_ERROR_PUBLICKEYISNOTSET
        tKey.Text = "EP_ERROR_PUBLICKEYISNOTSET"
      Case EP_ERROR_PRIVATEKEYISINVALID
        tKey.Text = "EP_ERROR_PRIVATEKEYISINVALID"
      Case EP_ERROR_PUBLICKEYISINVALID
        tKey.Text = "EP_ERROR_PUBLICKEYISINVALID"
      Case EP_ERROR_KEYMODEISINVALID
        tKey.Text = "EP_ERROR_KEYMODEISINVALID"
      Case EP_ERROR_KEYBASEISINVALID
        tKey.Text = "EP_ERROR_KEYBASEISINVALID"
      Case EP_ERROR_CURRENTDATEISINVALID
        tKey.Text = "EP_ERROR_CURRENTDATEISINVALID"
      Case EP_ERROR_EXPIRATIONDATEISINVALID
        tKey.Text = "EP_ERROR_EXPIRATIONDATEISINVALID"
      Case EP_ERROR_KEYISINVALID
        tKey.Text = "EP_ERROR_KEYISINVALID"
      Case EP_ERROR_HARDWAREID
        tKey.Text = "EP_ERROR_HARDWAREID"
      Case EP_ERROR_HARDWAREBUFFEREMPTY
        tKey.Text = "EP_ERROR_HARDWAREBUFFEREMPTY"
      Case EP_ERROR_HARDWAREIDINVALIDFORKEY
        tKey.Text = "EP_ERROR_HARDWAREIDINVALIDFORKEY"
      Case EP_ERROR_PROJECTFILENOTFOUND
        tKey.Text = "EP_ERROR_PROJECTFILENOTFOUND"
      Case EP_ERROR_INVALIDPROJECTFILE
        tKey.Text = "EP_ERROR_INVALIDPROJECTFILE"
      Case EP_ERROR_EXECUTIONSNUMBERINVALID
        tKey.Text = "EP_ERROR_EXECUTIONSNUMBERINVALID"
      Case EP_ERROR_DAYSNUMBERINVALID
        tKey.Text = "EP_ERROR_DAYSNUMBERINVALID"
      Case EP_ERROR_COUNTRYCODEINVALID
        tKey.Text = "EP_ERROR_COUNTRYCODEINVALID"
      Case EP_ERROR_RUNTIMEINVALID
        tKey.Text = "EP_ERROR_RUNTIMEINVALID"
      Case EP_ERROR_GLOBALTIMEINVALID
        tKey.Text = "EP_ERROR_GLOBALTIMEINVALID"
      Case EP_ERROR_INSTALLBEFOREINVALID
        tKey.Text = "EP_ERROR_INSTALLBEFOREINVALID"
      Case EP_ERROR_INSTALLAFTERINVALID
        tKey.Text = "EP_ERROR_INSTALLAFTERINVALID"
      Case Else
        tKey.Text = "Unknown error"
    End Select
  End If
End Sub

Private Sub btnVerify_Click()
  Dim kv As TKeyVerifyParams
  Dim I As Integer
  Dim dwResult As Long
  Dim sresult As String
  
  If tbUserInfo.Text = vbNullString Then
    MsgBox "User info field is empty!"
    Exit Sub
  End If
  
  If tKey.Text = vbNullString Then
    MsgBox "Key field is empty!"
    Exit Sub
  End If
  
  ' Key mode
  kv.KeyMode = cbKeyMode.ListIndex
  ' Key base
  kv.KeyBase = cbKeyBase.ListIndex
  
  Select Case kv.KeyMode
    Case RM_512
      kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC" & _
                     "P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC" & _
                     "WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH" & _
                     "CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8" & _
                     "HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP" & _
                     "SRGDQ742B4742XF4MACRR747YDP5FZZ9D" & vbNullChar
    Case RM_768
      kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC" & _
                     "P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC" & _
                     "WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH" & _
                     "CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8" & _
                     "HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP" & _
                     "SRGDQ742B4742XF4MACRR747YDP5FZZ9D" & vbNullChar
    Case RM_1024
      kv.PublicKey = "0201B810DA4A1ADD4351378790A981385330CDG9YQSEUK2HT546KWW46NHSCHMD2TNCSPVNSKGQC6CHDUSU9CC4LDPL" & _
                       "TD3NLRVD3TFV9BU2SYBUBU9TXKLQ3CTKZE5GN9VFG37R9YNK2FE58K7ZY" & _
                       "WTUJYFSJTBMDLLGA9GJ2LJXGHSS9CESGC2K69H65YQGAC7CRGF5T3CPLA" & _
                       "5BDJZKVCUWPZRNA2DN7L956LZVZBQUDPX6PF30CDBH26Z82VE4QQ8N85L" & _
                       "QHYJYYCJ6WQ89H9K9VVQX925SG5FJ79AGVZB6M8TTFKCJ56FAREP8GSTC" & _
                       "NKWCXEALDP9Y2ZLS9QKZV8JRNDHG9D8BRDSCTMDQK9NLAPZ9TGYFS9G7U" & _
                       "LXHYJF7F9A89HPXGTU2N4FQQJL98WZ5QND2KTEMMUUZFAX953HCGNSWUW" & _
                       "U2M7LBEWZSH9GW5SC0CDJDY2HC4HJYUSVTAVXZ7MYVJWF3CU9WC3SVPSL" & _
                       "29WF46DVS2SYKSSAMATPPYGJDE3PBFMGS34CXWQSXKCEAE63L2EXTS9NE" & _
                       "2G597XASY3S34XMYST5YZF4THUTYT5DY9UKKXU6PH8MLXRPZMPMMR83JU" & _
                       "X2WGNEW8ZGL4SKUCUB8CEAB6UZ4FB66WTP3B64VMX7XG75T4Y35479" & vbNullChar
    Case RM_2048
      kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533199H9KZC4CQ5ZKPEGYDW2EHN5AKZA5G5KP4HU8USWJR8XWW7MCH7244RV" & _
                       "PSXFHVU6YQRK4LPUHM497XJYPLLA3DHUZWXK3CB5SUYF75NPYLTNPRUAP" & _
                       "CTVDHAKYWTRQ97HES2E59WDN2LJKFYA2K8BGFSBHP4A6BF5FSDTS8NWLL" & _
                       "C5NEQ76NJ9BAMWXG55UPFFMRQZTU5KV2G6LSPQUJJWA9U4LJ5SCJ9M9ZQ" & _
                       "Z6K7LZA9UAMJ533UQ5J3JPNQAUWJGZFRFCTGAGSBWPWRRF9HRGF9MCX55" & _
                       "QRYGPYMRE6DBJ65SJDX34FVPYWWKWQ48MCKXYXPHQ23BJ42U8ZMDD8CG5" & _
                       "DPHZQ5XTXUKA277XK6PKSTLJ88ZZ9EBXH62REMRZZRGNPKHYM34RW722S" & _
                       "SZHMPFKY7X8UZ19ADGX3UQ7X444XH7MZXEZYW2YLFHR8YL3PTCXVSYX89" & _
                       "ZXN7KW2XNBE8XS3TQRGZVF6KA5USH56NEZYH5RNWBBPVE9LD6H42RQWR5" & _
                       "YVQMT5EQYQTK6YM9V8DA5BJCLGGZ2UGD6NPA2X3SNUS47F7HJBNBCWHRA" & _
                       "YPPCQ5HWCJNPDHUDQMRN2P6PWJFWJ6CLVNK8HXEFLE4ENPXAFN89CRS43" & _
                       "RUMVGDJQCSRB535XYCS6BZYLA9Q6HJV425F26XXHRGA7C8R8BVMELAPEH" & _
                       "5DSA9KXTCV4H2RNVDFHG3YJSERZVFPWHYA823LUBENBL5U3J4LJX2KQLW" & _
                       "L5XGGESPSE2FQWKSQ4NUCDLBEJPQAT2A2477DYS2XEXKLYEAKUN22622C" & _
                       "RLBCAHPFNEV2FJ2H8N3JQGXJRGP19AFHGRW6SS2ZSFYK8EZAPVYL4MCP4" & _
                       "6UMR64Y9T89FHWEPXBRHKWJCSNNNGPU984J5XW4BWTU6PDWPN24W8RU55" & _
                       "A9C3U9H7VHS5PFURASHBT4JAEE5ZKJBSYMCMDVBLU973R72RVPA6U96A2" & _
                       "LX8HMASVST9RVJ7W66V4DYWRDZZQ3673W7C7LVF68TWPLNMYEUQ8FDZRN" & _
                       "P38D9BX5YA3VENETDUUUMR9U7FFP4NZM7G4Y6J6EASK5SAXXTRMZ8F3AH" & _
                       "5FC54E543N739BY5KVZQM7JZWD2P2HPE7BDRMM9JFCGPBWWASTZ7UDNRV" & _
                       "6AFHVMBR9AGAERE9M6W6S2ZT8PBTABPDCKBPPPV6QW9DRXZUGAHDDRRSY" & _
                       "XM4YXQ2QJX6CL33N7RV8846LK8A3DFLDXWZ2NKF8V" & vbNullChar
    Case RM_3072
      kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533267BJBN6W8SY33Y47RWJHWS385XWRV9TSVSB5EM7ECZYNSJ44ZKSD8KV4" & _
                       "6Y9T6TNC6QMDW4V6DBMADU3YUKLP88TCLEUD9FTEUHGXM6T57AQ2EMB59" & _
                       "UPQVNSUT7Z4EHAMDQ6N77VK2A6P847MMWJH9E7C5XX6FNF6MHGWERPWQV" & _
                       "9ZLVR9Z7X5D5Z2XQL6MBM7BDCT2DEDVRBFNDDBLG6LHZ9APM48LS5TKTJ" & _
                       "AGDYFDRVHEGTDH47PCLL8YJ4ZAWCB59F8BN5PZL3NQACP32G3YNBX5E3J" & _
                       "7S28XLRGAX55ZML5XE6Q68EUAL38VUBJ2MZ2UGCCHM7CE6S99N44X9RMV" & _
                       "7B55HULJ4KHPFYSBDUSPQTCWGS76BEQST2QCZDZ2T4FBA4YUJFF47AACE" & _
                       "A4EEFESEYWN48UZCSDZAMGSU5VB9UJKR2XQUSDFS3TNG9QKURQWS7N5Q3" & _
                       "VPYT4QAGGQ5GW2MMXHDJYW55FQPHSS255GVJ7WLLP85JHS8K6DVTJWB4W" & _
                       "4Y8ZEFF7KP6W74PAA8FVPZVDW4RKGMQ8V56Q6R4V34XFE5HR4FZS8GZ6R" & _
                       "36RKW6WN34S2AHR9LCGF8LULB7ZN6NC2AA5RPDZYGWSPPME6267CGLZCP" & _
                       "GG98W557RXCDWAETJHDCRPUXX7AD3E8SL9WMGBV9QFHMSV9UFV7H9NTX3" & _
                       "QYV95CN9P9DSYQWL35R2BWB4GKW6CTWVB2X6WH3P2WFBE6X55KBLAMDB3" & _
                       "SRDSDVY37GKH78MUHY7KDJDC8SJU5FUQRYZ49ULX3YSZL7E284GFVZSGD" & _
                       "FTTQNR6VMBM3LLR78SUSVMJW88XT2K4UHEATRU3V9MMR2VGNGCY9S6R7M" & _
                       "4ELNPEBBMQP2HVPLY5M5VPA92V7NU8ZZ58YYTW5QK9USZ5LV59UZGB2CF" & _
                       "DPZ6HFYU5WB7UU3UYWVNSNKM3W7GBYKJP8TMFW2YN6GNSSE4ZKFVZRLUT" & _
                       "8QPZBBEQT5H9H5Z53D7QV4AJTKTX4EMW62TDWXQVK24JZPSG2VXKCMYZL" & _
                       "BUASE25R3EEK9KBLJ8VX83ZXGTBL5CCDBY33HJ6FKX8AW3WPRX3XTCS9G" & _
                       "2B9SVK2XFFKNSPGFG6FZNS8P2HERFGFL79DKUZZFWHFH4H9UZ7F7F6W3Z" & _
                       "WN84JRRA7SU8T89EQMRBEPVYMMGLGSUMFWWMEDLJM5EGP5WEX9LDUAQXS" & _
                       "55LKDQVRKX4R8NNBHSYBHSNMFYA2C6KGQQFK3TN267DPSZT3PTKHTLNMU" & _
                       "V2YYZZRX3953LPWAKYF8LJUVMEQT3ZC4F9SWMYGUHG6XX66PJFQWSRUW2" & _
                       "C79YLGZ6ZAFS7HLXBTH55UD3EGFBZQ5CLNJDZTEJACDVBCM5FQBTX4DKK"
       kv.PublicKey = kv.PublicKey & _
                       "UDGNSMWWLC5UMQRHW89CTU5636WYDXVZZDAUZ529458LDN2DAR9QADWRZ" & _
                       "UTU8MCKN8ACH3R36YKE52DDF67SM5UDUH7PTATHXE65UCGFRCV49UTF29" & _
                       "BGDSUWGRMC839HUZYQVAG985YUF5KJCAVGKRD8E4YMPJ38KR6HD2KHDGY" & _
                       "PJDMJMN4Y3DTJW5MYX3VUPF32637LMAWFM4QCU7BMP74SCF4N5QXZZVBE" & _
                       "LAQMPYMJC2ZWJ9XFV33YXTTPH3SG9KMUABLL83P7L3UBVM763XJPR5UEH" & _
                       "DZ73XJUGR9QP6299K5PU46XGVWKWFAKWYMRXUSLCFJ3WQTEC6QJH6E5V8" & _
                       "X2RMA5TXGSBEWLGSMNQ2SH6G9MLKK4S486DN4M4QVDTYTM4JQETAJQGP7" & _
                       "6NUR4UNDXR4W4JQSNWDTUGX69SEDC3AL8ZF4TJBQQRXSX2A86UUWCDCFH" & _
                       "JE94A8EP3Q6A2QTYKEE62MV4VJB2AB" & vbNullChar
    Case RM_4096
      kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533334BN75EUD4LFWYFVNFGBRCEMKKXG62QRBXL8GMHQ975B68FJVEMNXQQ7" & _
                       "RKR7RCZMWDVP86QPB3LR49G9BM7EUUZXNCRZBXRF4PEY3RX6UXT4X286K" & _
                       "WMR7AMEE6QNP9AEHGWJT9AVU3F62F37B5GVX2BQF73QWHRFQSQ6XMRP6M" & _
                       "ZDRQ8JT89UF3YRK5UL34MM3L8HLDTWAJF5YY7MRWJUFDQRK9JNCJ6C9KJ" & _
                       "WRE5ACQSNS24NEAHDYKS3AK75HBCTKP9NR2CSL7Q9PPXM4TF7L37USP77" & _
                       "Z7WER6JY67F7YGKTP6MFRMKK9H8XFPZ9XWKK97XCFXK7AW4TB96WGEH4B" & _
                       "YPF9QRF2DGC3LCHW8VTD2EMHVRDR6EEBUG8R4XYKJPLBPRCJP445DU2BW" & _
                       "JWELKAY45GKDU5HLTTDTWRH2JFKJ7AVAKLPEELN29YHX5JR773P9ERW7N" & _
                       "UFMWDKD4UL4YPU5QW2L4A7ZN3E8ZDQVEZUR6ZRDQXRLQRLUNHVB4XGBWD" & _
                       "HM79NGJARHDBQJCD8NWZCWPBY26QARP7A5S48DCV29F7MUTHU3YAHYVS7" & _
                       "ZPGXJZZA5HBBY4K5BQPUG6MVCBG8H3C7VL8KH9EH58NUVCE6F2CGMSM94" & _
                       "4CQDKNVGWWWRNK4DG26UT88Y9ULUPJ25G9KLTQPK3TBXZEK43X8KPMJT8" & _
                       "DF6MTQ5RB94XR2BT9H9NYYTXL29GF8KZY9QNHAW4LTT2RDQTD2ELWPSV4" & _
                       "4AND9K8G5VKLQ287UBEVHA82CMSMGQQBMNQZVAZ9G8T5TD6G9F7XQHMJT" & _
                       "HCL6PFEDUW5MN9JASF2EKPT2H33325A3SFGGM5C3RYKZSYSSQC5FLHNX9" & _
                       "VHN4HQVWD66YECY4R97JZHQALRTCHXUWH85LSJCCTQZT8JF52FHG6FV9J" & _
                       "UJWEU24K9Z7SKYTYA9NH7GW29FSNKUK3DMFXY48VEYZVDRTTMLFYSJH8B" & _
                       "RQXV72REYGSM6SLX89EVQ52CN9N8YDLWHAWCDDNM89YN2FCRTLE8688XN" & _
                       "F4MZMFE6GP9JK2JTFJVUKBLES2ZVWSBCJE9N3D7DG9LL9Z3U42QFJJPE2" & _
                       "HE5XCRY25UND96R9D7655ZBSCPF796FJZ4GPLY7AMZLGLR77GRP467ELK" & _
                       "PXSZ9ZF8MUYFDHV4EFACPZ79CDFTYW56NE9JDWDVUMNLY9EXDSF8ZNABE" & _
                       "MDQU6T9RVLTNRMZJJ8EJSUM9TV8YA6MNWF2Y66MD3VQ9L662F5X6VE9ZC" & _
                       "PPRTNMEV2DG9BUMFMSL7PUR9H5QG6VVBDBMEU3PLABL57HMSQ5C83E9X8" & _
                       "RTPY4QSEH2H7R2QDJHT5LQSFNQJL2NZ24GLNTFXG468WC5UUTDD68G8HM"
      kv.PublicKey = kv.PublicKey & _
                       "477Z8P4F9ZZHUGZ6VPFF32A2MPWY8LPXNECCKM9EEVLDDPUJ8LXN2AE6K" & _
                       "Y2Q42FVBCJM9GQTXNRHBED735KCFD4YGV4U5U3LJD6NJ886W6XQLWH3G7" & _
                       "3VZ6T5YDUQP6DA5ZHLKQSGATDJHUWC2ELTE7QJFXH8H9EAQYZPPMW76JG" & _
                       "Z48UBND9VXFXZMSGBNWQPNQG7E4TCBDMVKUSA9TTVSNLN3DXEZNXH787R" & _
                       "N7XHFBJNZ5W74DUMNBYVHEQDYMZBQCFMS8LGSDUAU6QE9DD5Q334BX62T" & _
                       "JP5WQQDS2ZEWW76XW7VMLX3L7V9UVD7RL297VDBVRFPQ5MYA3YFVBVNVA" & _
                       "R5TJXMQ4X2U2PW6UWSKBXT58HG3QPZM2RVEX2PDMCVJDFTJMXR9NPLW4C" & _
                       "6AE4Q9A8TTAQ68BSN9WWTFFTSX68ECVARFPDBBH5DMP4KYFARTFVCSWNF" & _
                       "FGAPBYYGFJA4MGHEDWTNE54MPGER7EPCZEV2ESJRMM6XDMFGABG97HECN" & _
                       "3SZFUBRKCNDZ2TE9F6EERULRCDAV5EMY6KVY9NY9MYNPP2FQ5WFWLMRYD" & _
                       "4TNYYHE6EDMQ6KK79HH5Q5KBW6DDQYYNUR365W2454CHEZWZAPU82SX4H" & _
                       "KHNZXBRVWAT7G9CJBKHNBPSVEL67X8UJHBFHZH8ZD4NSEVFZM4Y768TJ6" & _
                       "QP3BGEKLTY4UZUWHG63QMKVWAQW9E7WRFNJCH4XRD97JHNKMFUTRFVH68" & _
                       "G5CKSMGC725AZ9CBSL2JX43P4EY44CMF56AJ6BEXVCJP2ZDWCT9G55K4D" & _
                       "F24J7TTJMFXTQH95CBNX67CBPNWEKHCWQV6VD73Y9KCZHNBFUFS8TCYNN" & _
                       "WXRGFKNVRDFUKWHDWDDTSPEW8YCKLPMX2GUV3N4JFJMUE6TSJR6Z53C9F" & _
                       "SKZAY3EN7G66JPBF5E9S6Y7RQHPWZHSRDQ7XH87PHUJFLJFGD7WNE3Q9P" & _
                       "EXMW33LVJBFEUXKNUB6SU7ZYCEX96XT8G27FLUV7XPV4JK64DWDJCX9WV" & _
                       "4VL8CK23FQJ28UG9JUZTQJ3DRL32BTJVRD4LVQ6MK9LCE7ZZP925JK7ZD" & _
                       "92SCV4DDJJ5EXMVBF" & vbNullChar
  End Select

  ' Fill key buffer
  kv.Key = tKey.Text
  kv.KeyLen = Len(tKey.Text)
  ' Fill User Info buffer
  kv.RegInfo = tbUserInfo.Text
  kv.RegInfoLen = Len(tbUserInfo.Text)
  ' Hardware ID
  kv.UseHardwareLocking = cbHardware.Value
  If kv.UseHardwareLocking Then
    kv.HardwareID = tbHardware.Text
  End If

  kv.EncryptedConstant = 2113444489
  
  ' Verify reg. key
  dwResult = KG_VerifyRegistrationInfo(kv)
  If dwResult = ERROR_OK Then
    sresult = "Key is valid!" & Chr$(13)
    sresult = sresult & "Key creation date: " & Str$(kv.CreationDay) & "/" & Str$(kv.CreationMonth) & "/" & Str$(kv.CreationYear) & Chr$(13)
    If kv.UseKeyExpiration Then
      sresult = sresult & "Key expiration date: " & Str$(kv.ExpirationDay) & "/" & Str$(kv.ExpirationMonth) & "/" & Str$(kv.ExpirationYear) & Chr$(13)
    End If
    If kv.UseRegisterAfter Then
      sresult = sresult & "Register After date: " & Str$(kv.RegisterAfterDay) & "/" & Str$(kv.RegisterAfterMonth) & "/" & Str$(kv.RegisterAfterYear) & Chr$(13)
    End If
    If kv.UseRegisterBefore Then
      sresult = sresult & "Register Before date: " & Str$(kv.RegisterBeforeDay) & "/" & Str$(kv.RegisterBeforeMonth) & "/" & Str$(kv.RegisterBeforeYear) & Chr$(13)
    End If
    If kv.UseExecutionsLimit Then
      sresult = sresult & "Executions: " & Str$(kv.ExecutionsCount) & Chr$(13)
    End If
    If kv.UseDaysLimit Then
      sresult = sresult & "Days: " & Str$(kv.DaysCount) & Chr$(13)
    End If
    If kv.UseRunTimeLimit Then
      sresult = sresult & "Runtime: " & Str$(kv.RunTimeMinutes) & Chr$(13)
    End If
    If kv.UseGlobalTimeLimit Then
      sresult = sresult & "Global Time: " & Str$(kv.GlobalTimeMinutes) & Chr$(13)
    End If
    If kv.UseCountyLimit Then
      For I = 0 To comCountries.ListCount - 1
        If comCountries.ItemData(I) = kv.CountryCode Then
          sresult = sresult & "Country Lock: " & comCountries.List(I) & Chr$(13)
        End If
      Next I
    End If
    For I = 1 To NUMBER_OF_CRYPTED_SECTIONS
      If kv.EncryptedSections(I - 1) = 1 Then
        sresult = sresult & "Unlock section #" & Str$(I) & Chr$(13)
      End If
    Next I
  Else
    Select Case dwResult
      Case EP_ERROR_UNKNOWN
        sresult = "EP_ERROR_UNKNOWN"
      Case EP_ERROR_KEYBUFFEREMPTY
        sresult = "EP_ERROR_KEYBUFFEREMPTY"
      Case EP_ERROR_KEYBUFFERISLESS
        sresult = "EP_ERROR_KEYBUFFERISLESS"
      Case EP_ERROR_REGINFOEMPTY
        sresult = "EP_ERROR_REGINFOEMPTY"
      Case EP_ERROR_REGINFOTOOLARGE
        sresult = "EP_ERROR_REGINFOTOOLARGE"
      Case EP_ERROR_PRIVATEKEYISNOTSET
        sresult = "EP_ERROR_PRIVATEKEYISNOTSET"
      Case EP_ERROR_PUBLICKEYISNOTSET
        sresult = "EP_ERROR_PUBLICKEYISNOTSET"
      Case EP_ERROR_PRIVATEKEYISINVALID
        sresult = "EP_ERROR_PRIVATEKEYISINVALID"
      Case EP_ERROR_PUBLICKEYISINVALID
        sresult = "EP_ERROR_PUBLICKEYISINVALID"
      Case EP_ERROR_KEYMODEISINVALID
        sresult = "EP_ERROR_KEYMODEISINVALID"
      Case EP_ERROR_KEYBASEISINVALID
        sresult = "EP_ERROR_KEYBASEISINVALID"
      Case EP_ERROR_CURRENTDATEISINVALID
        sresult = "EP_ERROR_CURRENTDATEISINVALID"
      Case EP_ERROR_EXPIRATIONDATEISINVALID
        sresult = "EP_ERROR_EXPIRATIONDATEISINVALID"
      Case EP_ERROR_KEYISINVALID
        sresult = "EP_ERROR_KEYISINVALID"
      Case EP_ERROR_HARDWAREID
        sresult = "EP_ERROR_HARDWAREID"
      Case EP_ERROR_HARDWAREBUFFEREMPTY
        sresult = "EP_ERROR_HARDWAREBUFFEREMPTY"
      Case EP_ERROR_HARDWAREIDINVALIDFORKEY
        sresult = "EP_ERROR_HARDWAREIDINVALIDFORKEY"
      Case EP_ERROR_PROJECTFILENOTFOUND
        sresult = "EP_ERROR_PROJECTFILENOTFOUND"
      Case EP_ERROR_INVALIDPROJECTFILE
        sresult = "EP_ERROR_INVALIDPROJECTFILE"
      Case EP_ERROR_EXECUTIONSNUMBERINVALID
        tKey.Text = "EP_ERROR_EXECUTIONSNUMBERINVALID"
      Case EP_ERROR_DAYSNUMBERINVALID
        tKey.Text = "EP_ERROR_DAYSNUMBERINVALID"
      Case EP_ERROR_COUNTRYCODEINVALID
        tKey.Text = "EP_ERROR_COUNTRYCODEINVALID"
      Case EP_ERROR_RUNTIMEINVALID
        tKey.Text = "EP_ERROR_RUNTIMEINVALID"
      Case EP_ERROR_GLOBALTIMEINVALID
        tKey.Text = "EP_ERROR_GLOBALTIMEINVALID"
      Case EP_ERROR_INSTALLBEFOREINVALID
        tKey.Text = "EP_ERROR_INSTALLBEFOREINVALID"
      Case EP_ERROR_INSTALLAFTERINVALID
        tKey.Text = "EP_ERROR_INSTALLAFTERINVALID"
      Case Else
        sresult = "Unknown error"
    End Select
  End If
  MsgBox sresult
End Sub

Private Sub btnVerifyFP_Click()
  Dim kv As TKeyVerifyParams
  Dim I As Integer
  Dim dwResult As Long
  Dim sresult As String
  
  If tbUserInfo.Text = vbNullString Then
    MsgBox "User info field is empty!"
    Exit Sub
  End If
  
  If tKey.Text = vbNullString Then
    MsgBox "Key field is empty!"
    Exit Sub
  End If
  
  ' Fill key buffer
  kv.Key = tKey.Text
  kv.KeyLen = Len(tKey.Text)
  ' Fill User Info buffer
  kv.RegInfo = tbUserInfo.Text
  kv.RegInfoLen = Len(tbUserInfo.Text)
  ' Hardware ID
  kv.UseHardwareLocking = cbHardware.Value
  If kv.UseHardwareLocking Then
    kv.HardwareID = tbHardware.Text
  End If
  
  ' Verify reg. key
  dwResult = KG_VerifyRegistrationInfoFromProject("default.enigma", kv)
  If dwResult = ERROR_OK Then
    sresult = "Key is valid!" & Chr$(13)
    sresult = sresult & "Key creation date: " & Str$(kv.CreationDay) & "/" & Str$(kv.CreationMonth) & "/" & Str$(kv.CreationYear) & Chr$(13)
    If kv.UseKeyExpiration Then
      sresult = sresult & "Key expiration date: " & Str$(kv.ExpirationDay) & "/" & Str$(kv.ExpirationMonth) & "/" & Str$(kv.ExpirationYear) & Chr$(13)
    End If
    If kv.UseRegisterAfter Then
      sresult = sresult & "Register After date: " & Str$(kv.RegisterAfterDay) & "/" & Str$(kv.RegisterAfterMonth) & "/" & Str$(kv.RegisterAfterYear) & Chr$(13)
    End If
    If kv.UseRegisterBefore Then
      sresult = sresult & "Register Before date: " & Str$(kv.RegisterBeforeDay) & "/" & Str$(kv.RegisterBeforeMonth) & "/" & Str$(kv.RegisterBeforeYear) & Chr$(13)
    End If
    If kv.UseExecutionsLimit Then
      sresult = sresult & "Executions: " & Str$(kv.ExecutionsCount) & Chr$(13)
    End If
    If kv.UseDaysLimit Then
      sresult = sresult & "Days: " & Str$(kv.DaysCount) & Chr$(13)
    End If
    If kv.UseRunTimeLimit Then
      sresult = sresult & "Runtime: " & Str$(kv.RunTimeMinutes) & Chr$(13)
    End If
    If kv.UseGlobalTimeLimit Then
      sresult = sresult & "Global Time: " & Str$(kv.GlobalTimeMinutes) & Chr$(13)
    End If
    If kv.UseCountyLimit Then
      For I = 0 To comCountries.ListCount - 1
        If comCountries.ItemData(I) = kv.CountryCode Then
          sresult = sresult & "Country Lock: " & comCountries.List(I) & Chr$(13)
        End If
      Next I
    End If
    For I = 1 To NUMBER_OF_CRYPTED_SECTIONS
      If kv.EncryptedSections(I - 1) = 1 Then
        sresult = sresult & "Unlock section #" & Str$(I) & Chr$(13)
      End If
    Next I
  Else
    Select Case dwResult
      Case EP_ERROR_UNKNOWN
        sresult = "EP_ERROR_UNKNOWN"
      Case EP_ERROR_KEYBUFFEREMPTY
        sresult = "EP_ERROR_KEYBUFFEREMPTY"
      Case EP_ERROR_KEYBUFFERISLESS
        sresult = "EP_ERROR_KEYBUFFERISLESS"
      Case EP_ERROR_REGINFOEMPTY
        sresult = "EP_ERROR_REGINFOEMPTY"
      Case EP_ERROR_REGINFOTOOLARGE
        sresult = "EP_ERROR_REGINFOTOOLARGE"
      Case EP_ERROR_PRIVATEKEYISNOTSET
        sresult = "EP_ERROR_PRIVATEKEYISNOTSET"
      Case EP_ERROR_PUBLICKEYISNOTSET
        sresult = "EP_ERROR_PUBLICKEYISNOTSET"
      Case EP_ERROR_PRIVATEKEYISINVALID
        sresult = "EP_ERROR_PRIVATEKEYISINVALID"
      Case EP_ERROR_PUBLICKEYISINVALID
        sresult = "EP_ERROR_PUBLICKEYISINVALID"
      Case EP_ERROR_KEYMODEISINVALID
        sresult = "EP_ERROR_KEYMODEISINVALID"
      Case EP_ERROR_KEYBASEISINVALID
        sresult = "EP_ERROR_KEYBASEISINVALID"
      Case EP_ERROR_CURRENTDATEISINVALID
        sresult = "EP_ERROR_CURRENTDATEISINVALID"
      Case EP_ERROR_EXPIRATIONDATEISINVALID
        sresult = "EP_ERROR_EXPIRATIONDATEISINVALID"
      Case EP_ERROR_KEYISINVALID
        sresult = "EP_ERROR_KEYISINVALID"
      Case EP_ERROR_HARDWAREID
        sresult = "EP_ERROR_HARDWAREID"
      Case EP_ERROR_HARDWAREBUFFEREMPTY
        sresult = "EP_ERROR_HARDWAREBUFFEREMPTY"
      Case EP_ERROR_HARDWAREIDINVALIDFORKEY
        sresult = "EP_ERROR_HARDWAREIDINVALIDFORKEY"
      Case EP_ERROR_PROJECTFILENOTFOUND
        sresult = "EP_ERROR_PROJECTFILENOTFOUND"
      Case EP_ERROR_INVALIDPROJECTFILE
        sresult = "EP_ERROR_INVALIDPROJECTFILE"
      Case EP_ERROR_EXECUTIONSNUMBERINVALID
        tKey.Text = "EP_ERROR_EXECUTIONSNUMBERINVALID"
      Case EP_ERROR_DAYSNUMBERINVALID
        tKey.Text = "EP_ERROR_DAYSNUMBERINVALID"
      Case EP_ERROR_COUNTRYCODEINVALID
        tKey.Text = "EP_ERROR_COUNTRYCODEINVALID"
      Case EP_ERROR_RUNTIMEINVALID
        tKey.Text = "EP_ERROR_RUNTIMEINVALID"
      Case EP_ERROR_GLOBALTIMEINVALID
        tKey.Text = "EP_ERROR_GLOBALTIMEINVALID"
      Case EP_ERROR_INSTALLBEFOREINVALID
        tKey.Text = "EP_ERROR_INSTALLBEFOREINVALID"
      Case EP_ERROR_INSTALLAFTERINVALID
        tKey.Text = "EP_ERROR_INSTALLAFTERINVALID"
      Case Else
        sresult = "Unknown error"
    End Select
  End If
  MsgBox sresult
End Sub



Private Sub cbCountry_Click()
  comCountries.Enabled = cbCountry.Value
End Sub

Private Sub cbDays_Click()
  tDays.Enabled = cbDays.Value
  UpDown2.Enabled = cbDays.Value
End Sub

Private Sub cbExecutions_Click()
  tExecutions.Enabled = cbExecutions.Value
  UpDown1.Enabled = cbExecutions.Value
End Sub

Private Sub cbExpiration_Click()
  dtpExpiration.Enabled = cbExpiration.Value
End Sub


Private Sub cbGlobalTime_Click()
  tGlobalTime.Enabled = cbGlobalTime.Value
  UpDown4.Enabled = cbGlobalTime.Value
End Sub

Private Sub cbHardware_Click()
  tHardware.Enabled = cbHardware.Value
End Sub

Private Sub cbRegisterAfter_Click()
  dtpRegisterAfter.Enabled = cbRegisterAfter.Value
End Sub

Private Sub cbRegisterBefore_Click()
  dtpRegisterBefore.Enabled = cbRegisterBefore.Value
End Sub

Private Sub cbRuntime_Click()
  tRuntime.Enabled = cbRuntime.Value
  UpDown3.Enabled = cbRuntime.Value
End Sub

Private Sub Form_Load()
  cbKeyMode.ListIndex = 0
  cbKeyBase.ListIndex = 3
  comCountries.ListIndex = 0
  
  Call cbExpiration_Click
  Call cbHardware_Click
  Call cbRegisterAfter_Click
  Call cbRegisterBefore_Click
  Call cbExecutions_Click
  Call cbDays_Click
  Call cbRuntime_Click
  Call cbGlobalTime_Click
  Call cbCountry_Click
End Sub

