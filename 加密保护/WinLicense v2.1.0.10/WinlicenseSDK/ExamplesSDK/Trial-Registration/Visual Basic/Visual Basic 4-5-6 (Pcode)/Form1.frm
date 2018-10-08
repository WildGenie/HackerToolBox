VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Trial-Registration SDK"
   ClientHeight    =   8925
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6570
   LinkTopic       =   "Form1"
   ScaleHeight     =   8925
   ScaleWidth      =   6570
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame4 
      Caption         =   "Hardwaer ID"
      Height          =   1215
      Left            =   360
      TabIndex        =   28
      Top             =   7320
      Width           =   5895
      Begin VB.TextBox HardIdEdit 
         Height          =   315
         Left            =   2160
         TabIndex        =   30
         Top             =   480
         Width           =   3375
      End
      Begin VB.CommandButton HardIdButton 
         Caption         =   "Get Hardware ID"
         Height          =   375
         Left            =   360
         TabIndex        =   29
         Top             =   480
         Width           =   1455
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "License Information"
      Height          =   2535
      Left            =   360
      TabIndex        =   15
      Top             =   4560
      Width           =   5895
      Begin VB.TextBox RegExpDateEdit 
         Height          =   285
         Left            =   4200
         TabIndex        =   27
         Top             =   1800
         Width           =   1455
      End
      Begin VB.TextBox CustomEdit 
         Height          =   855
         Left            =   4200
         MultiLine       =   -1  'True
         TabIndex        =   21
         Top             =   480
         Width           =   1455
      End
      Begin VB.TextBox CompanyEdit 
         Height          =   285
         Left            =   1080
         TabIndex        =   19
         Top             =   960
         Width           =   1695
      End
      Begin VB.TextBox NameEdit 
         Height          =   285
         Left            =   1080
         TabIndex        =   18
         Top             =   480
         Width           =   1695
      End
      Begin VB.Label Label19 
         Caption         =   "Expiration Date:"
         Height          =   375
         Left            =   2880
         TabIndex        =   26
         Top             =   1920
         Width           =   1215
      End
      Begin VB.Label RegExecLeftLabel 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   375
         Left            =   1440
         TabIndex        =   25
         Top             =   1920
         Width           =   855
      End
      Begin VB.Label Label17 
         Caption         =   "Executions Left:"
         Height          =   375
         Left            =   240
         TabIndex        =   24
         Top             =   2040
         Width           =   1215
      End
      Begin VB.Label RegDaysLeftLabel 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   375
         Left            =   1200
         TabIndex        =   23
         Top             =   1440
         Width           =   855
      End
      Begin VB.Label Label15 
         Caption         =   "Days Left:"
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   1560
         Width           =   855
      End
      Begin VB.Label Label14 
         Caption         =   "Custom:"
         Height          =   255
         Left            =   3480
         TabIndex        =   20
         Top             =   480
         Width           =   615
      End
      Begin VB.Label Label13 
         Caption         =   "Company:"
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label12 
         Caption         =   "Name:"
         Height          =   255
         Left            =   480
         TabIndex        =   16
         Top             =   600
         Width           =   615
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Trial Information"
      Height          =   1935
      Left            =   360
      TabIndex        =   4
      Top             =   2400
      Width           =   5895
      Begin VB.TextBox ExpDateEdit 
         Height          =   285
         Left            =   1440
         TabIndex        =   14
         Top             =   1200
         Width           =   1815
      End
      Begin VB.Label RuntimeLabel 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   375
         Left            =   3720
         TabIndex        =   13
         Top             =   720
         Width           =   855
      End
      Begin VB.Label MinutesLabel 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   375
         Left            =   3840
         TabIndex        =   12
         Top             =   240
         Width           =   855
      End
      Begin VB.Label TrialExecLeftLabel 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   375
         Left            =   1560
         TabIndex        =   11
         Top             =   720
         Width           =   855
      End
      Begin VB.Label TrialDaysLeftLabel 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   375
         Left            =   1320
         TabIndex        =   10
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label7 
         Caption         =   "Expiration Date:"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   1320
         Width           =   1215
      End
      Begin VB.Label Label6 
         Caption         =   "Runtime Left:"
         Height          =   255
         Left            =   2640
         TabIndex        =   8
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label lael2 
         Caption         =   "Minutes Left:"
         Height          =   255
         Left            =   2640
         TabIndex        =   7
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "Executions Left:"
         Height          =   375
         Left            =   360
         TabIndex        =   6
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label Label3 
         Caption         =   "Days Left:"
         Height          =   255
         Left            =   360
         TabIndex        =   5
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Application Status"
      Height          =   1695
      Left            =   360
      TabIndex        =   0
      Top             =   360
      Width           =   5895
      Begin VB.CommandButton CheckStatusButton 
         Caption         =   "Check Application Status"
         Height          =   375
         Left            =   1560
         TabIndex        =   1
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label StatusLabel 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   615
         Left            =   840
         TabIndex        =   3
         Top             =   960
         Width           =   4815
      End
      Begin VB.Label Label1 
         Caption         =   "Status:"
         Height          =   375
         Left            =   240
         TabIndex        =   2
         Top             =   1080
         Width           =   615
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub CheckStatusButton_Click()

    Dim AppStatus As Integer
    Dim BufferVarValue As String * 100
    Dim Status As Integer
    
    
    ' We make the following call to allow testing in an unprotected state.
    ' LoadLicenseDLL will set up the environment variables with your test values from WinlicenseSDK.ini
    ' NOTE: In your release version, before protecting, you have to REMOVE this call!!!
    
    'LoadWinlicenseDll
    
    GetEnvironmentVariable "WLRegGetStatus", BufferVarValue, 100
  
    ' show application status
    
    Status = BufferVarValue
    
    Select Case Status
    
        Case 0
            StatusLabel.Caption = "Trial"
            
        Case 1
            StatusLabel.Caption = "Registered"
            
        Case 2
            StatusLabel.Caption = "Invalid License"
            
        Case 3
            StatusLabel.Caption = "License Locked to different machine"
            
        Case 4
            StatusLabel.Caption = "No more HW-ID changes allowed"
            
        Case 5
            StatusLabel.Caption = "License Key expired"
            
    End Select
    
    ' show information on the GUI
  
    If Status <> 1 Then
    
        ' application is in trial mode
        
        GetEnvironmentVariable "WLTrialDaysLeft", BufferVarValue, 100
        TrialDaysLeftLabel.Caption = BufferVarValue
        
        
        GetEnvironmentVariable "WLTrialExecutionsLeft", BufferVarValue, 100
        TrialExecLeftLabel.Caption = BufferVarValue
        
        GetEnvironmentVariable "WLTrialGlobalTimeLeft", BufferVarValue, 100
        MinutesLabel.Caption = BufferVarValue
        
        GetEnvironmentVariable "WLTrialRuntimeLeft", BufferVarValue, 100
        RuntimeLabel.Caption = BufferVarValue
       
        GetEnvironmentVariable "WLTrialExpirationDate", BufferVarValue, 100
        ExpDateEdit.Text = BufferVarValue
        
        ' set as empty the registration data
        
        NameEdit.Text = ""
        CompanyEdit.Text = ""
        CustomEdit.Text = ""
        RegDaysLeftLabel.Caption = ""
        RegExecLeftLabel.Caption = ""
        
    Else
    
        ' application is registered
        
        GetEnvironmentVariable "WLRegUserName", BufferVarValue, 100
        NameEdit.Text = BufferVarValue
        
        GetEnvironmentVariable "WLRegCompanyName", BufferVarValue, 100
        CompanyEdit.Text = BufferVarValue
        
        GetEnvironmentVariable "WLRegExtraInfo", BufferVarValue, 100
        CustomEdit.Text = BufferVarValue
        
        GetEnvironmentVariable "WLRegDaysLeft", BufferVarValue, 100
        RegDaysLeftLabel.Caption = BufferVarValue
        
        GetEnvironmentVariable "WLRegExecutionsLeft", BufferVarValue, 100
        RegExecLeftLabel.Caption = BufferVarValue
        
        GetEnvironmentVariable "WLRegExpirationDate", BufferVarValue, 100
        RegExpDateEdit.Text = BufferVarValue
        
        ' set as empty the trial data

        TrialDaysLeftLabel.Caption = ""
        TrialExecLeftLabel.Caption = ""
        MinutesLabel.Caption = ""
        RuntimeLabel.Caption = ""
        
    End If
    
    

End Sub

Private Sub HardIdButton_Click()

    Dim BufferVarValue As String * 100

    GetEnvironmentVariable "WLHardwareGetID", BufferVarValue, 100
    HardIdEdit.Text = BufferVarValue

End Sub
