VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Trial application"
   ClientHeight    =   2880
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   2880
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnClose 
      Caption         =   "Close"
      Height          =   375
      Left            =   1440
      TabIndex        =   0
      Top             =   2400
      Width           =   1695
   End
   Begin VB.Label lbDaysLeft 
      Height          =   255
      Left            =   3360
      TabIndex        =   11
      Top             =   1560
      Width           =   975
   End
   Begin VB.Label lbDaysTotal 
      Height          =   255
      Left            =   2160
      TabIndex        =   10
      Top             =   1560
      Width           =   735
   End
   Begin VB.Label lbExecLeft 
      Height          =   255
      Left            =   3360
      TabIndex        =   9
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label lbExecTotal 
      Height          =   255
      Left            =   2160
      TabIndex        =   8
      Top             =   1200
      Width           =   735
   End
   Begin VB.Label lbExpirationDate 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   2040
      TabIndex        =   7
      Top             =   1920
      Width           =   2415
   End
   Begin VB.Label Label6 
      Caption         =   "Left"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3360
      TabIndex        =   6
      Top             =   840
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "Total"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2160
      TabIndex        =   5
      Top             =   840
      Width           =   735
   End
   Begin VB.Label Label4 
      Caption         =   "Expiration date"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1920
      Width           =   1695
   End
   Begin VB.Label Label3 
      Caption         =   "Trial days"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1560
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "Trial executions"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "This is example of using of Enigma API for VB application"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub btnClose_Click()
    End
End Sub

Private Sub Form_Load()
    Dim ExecTotal As Long
    Dim ExecLeft As Long
    Dim DaysTotal As Long
    Dim DaysLeft As Long
    Dim ExpirYear As Long
    Dim ExpirMonth As Long
    Dim ExpirDay As Long
    
    If ExpirationExecutions(ExecTotal, ExecLeft) Then
        lbExecTotal.Caption = ExecTotal
        lbExecLeft.Caption = ExecLeft
    End If
    
    If ExpirationDays(DaysTotal, DaysLeft) Then
        lbDaysTotal.Caption = DaysTotal
        lbDaysLeft.Caption = DaysLeft
    End If
    
    If ExpirationDate(ExpirYear, ExpirMonth, ExpirDay) Then
        lbExpirationDate = ExpirDay & "-" & ExpirMonth & "-" & ExpirYear & " [dd-mm-yyyy]"
    End If
     
End Sub

