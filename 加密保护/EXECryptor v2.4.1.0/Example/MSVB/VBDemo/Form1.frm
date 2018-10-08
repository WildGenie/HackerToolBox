VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "EXECryptor VB Demo"
   ClientHeight    =   5520
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5415
   LinkTopic       =   "Form1"
   ScaleHeight     =   5520
   ScaleWidth      =   5415
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox LogText 
      Height          =   4575
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   120
      Width           =   5175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Go!"
      Height          =   495
      Left            =   1560
      TabIndex        =   0
      Top             =   4920
      Width           =   2295
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  ' all code between EXECryptor_CRYPT_START and EXECryptor_CRYPT_END
  ' will be encrypted and protected from reversing
  Call EXECryptor_CRYPT_START
  ' extract hardware id
  LogText.Text = LogText.Text & "IsAppProtected: " & EXECryptor_IsAppProtected() & Chr(13) & Chr(10)
  LogText.Text = LogText.Text + "HardwareID: " + GetHardwareID() + Chr(13) + Chr(10)
  ' get current date
  Dim Year As Long
  Dim Month As Long
  Dim Day As Long
  Call SafeGetDate(Year, Month, Day)
  LogText.Text = LogText.Text & "Current date: " & Day & "/" & Month & "/" & Year & Chr(13) & Chr(10)
  Call GetReleaseDate(Year, Month, Day)
  LogText.Text = LogText.Text & "Release date: " & Day & "/" & Month & "/" & Year & Chr(13) & Chr(10)
  ' Encrypt/DecryptString
  Dim PlainText As String
  Dim EncryptedText As String
  PlainText = "this is the secret text!"
  EncryptedText = EncryptString(PlainText)
  LogText.Text = LogText.Text & "Plain text: " & PlainText & Chr(13) & Chr(10)
  LogText.Text = LogText.Text & "Encrypted text: " & EncryptedText & Chr(13) & Chr(10)
  PlainText = DecryptString(EncryptedText)
  LogText.Text = LogText.Text & "Decrypted text: " & PlainText & Chr(13) & Chr(10)
  ' secure registry read/write
  Call SecureWrite("Param1", "test value")
  LogText.Text = LogText.Text & "SecureRead: " & SecureRead("Param1") & Chr(13) & Chr(10)
  ' safe msg box
  Call SafeMessageBox("Test", "SafeMessageBox call OK!", 0)
  ' extract trial info
  LogText.Text = LogText.Text & "Trial days left: " & GetTrialDaysLeft(30) & Chr(13) & Chr(10)
  LogText.Text = LogText.Text & "Trial runs left: " & GetTrialRunsLeft(100) & Chr(13) & Chr(10)
  ' serial number test
  Dim res As VerifyResult
  res = VerifySerialNumber("John Smith", "GT7B-N6AG-BYLJ")
  LogText.Text = LogText.Text & "VerifySerialNumber: "
  If res = vrInvalid Then
    LogText.Text = LogText.Text & "Invalid serial" & Chr(13) & Chr(10)
  Else
    If res = vrExpire Then
      LogText.Text = LogText.Text & "Serial is expire" & Chr(13) & Chr(10)
    Else
      LogText.Text = LogText.Text & "Valid serial!" & Chr(13) & Chr(10)
    End If
  End If
  Call EXECryptor_CRYPT_END
  '
  Call EXECryptor_CRYPT_REG
  LogText.Text = LogText.Text & "Registered Action" & Chr(13) & Chr(10)
  Call EXECryptor_CRYPT_END
  Call EXECryptor_CRYPT_UNREG
  LogText.Text = LogText.Text & "Unregistered Action" & Chr(13) & Chr(10)
  Call EXECryptor_CRYPT_END
End Sub

