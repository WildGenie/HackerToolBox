VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "XProtector License Generator Example"
   ClientHeight    =   1950
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4725
   LinkTopic       =   "Form1"
   ScaleHeight     =   1950
   ScaleWidth      =   4725
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Exit"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1320
      Width           =   4095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Create Temporary License Key Example"
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   4095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Create Permanent License Key Example"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   4095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Called DLL Name is LicenseGenDLL.DLL
'See the Module1 for Declaration
'Important!If you dont give the Exact position of LicenseGenDLL.DLL (in Module1) then the Default location
'is C:\WINNT
'This means! that the DLL must be inside C:\WINNT (your Windows System Directory)

'Create Permanent LicenseKey
Private Sub Command1_Click()
    
On Error GoTo Errorhandler
    
    Dim SizeKey As Integer
    
    ' Create a permanent key. Permanent keys doesn't have Expiration days or executions.
    ' All the messages are related to temporal keys, so they should be NULL too
    
    SizeKey = CreateLicenseKey("George Aravidis", "DARPAresearch", "(c) 2003", vbNull, vbNull, vbNull, vbNull, vbNull, vbNull, KeyAux)
    CreateLicenseFile ("DARPAresearch")
    MsgBox "Permanent LicenseKey is Created SuccessFully", vbInformation + vbOKOnly, "Creation Report"
    
Errorhandler:
    MsgBox Err.Number & " " & Err.Description
    Exit Sub
    
End Sub
Public Sub CreateLicenseFile(LicenseFileName As String)

    Open App.Path & "\" & LicenseFileName & ".key" For Output As #1
        Print #1, KeyAux
    Close #1

End Sub

'Create Temporal LicenseKey
Private Sub Command2_Click()

On Error GoTo Errorhandler

    Dim SizeKey As Integer
    
    'create a temporal key. With 1 day and 5 executions
    
    SizeKey = CreateLicenseKey("George Aravidis", "DARPAresearch", "(c) 2003", vbNull, 1, 5, "Expired Key", "No More Days Left!", "No more executions left!", KeyAux)
    CreateLicenseFile ("DARPAresearch")
    MsgBox "Temporal LicenseKey is Created SuccessFully", vbInformation + vbOKOnly, "Creation Report"

Errorhandler:
    MsgBox Err.Number & " " & Err.Description
    Exit Sub

End Sub

Private Sub Command3_Click()

    End

End Sub
