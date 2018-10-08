VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Nanomite Table Viewer"
   ClientHeight    =   6930
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   6345
   Icon            =   "frmMain.frx":0000
   ScaleHeight     =   462
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   423
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox Headings 
      BackColor       =   &H80000004&
      Columns         =   1
      Enabled         =   0   'False
      ForeColor       =   &H00000000&
      Height          =   240
      IntegralHeight  =   0   'False
      Left            =   30
      TabIndex        =   1
      Top             =   30
      Width           =   6285
   End
   Begin VB.ListBox List 
      Height          =   6570
      IntegralHeight  =   0   'False
      ItemData        =   "frmMain.frx":0442
      Left            =   30
      List            =   "frmMain.frx":0444
      TabIndex        =   0
      Top             =   300
      Width           =   6285
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFOpen 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnuS 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Type OPENFILENAME
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long

Private Type Nanomite
    Address         As Long
    Destination     As Long
    Size            As Long
    JumpType        As Long
End Type

Private NumNanos    As Long
Private Nano()      As Nanomite

Private JT(24)      As String

Private Sub Form_Load()
    Headings.AddItem " Address" & vbTab & vbTab & "Destination" & vbTab & "Size" & vbTab & vbTab & "Jump Type "
    
    JT(0) = "Unknown"
    JT(1) = "Not Nanomite"
    JT(2) = "JMP"
    JT(3) = "JNZ"
    JT(4) = "JZ"
    JT(5) = "JB"
    JT(6) = "JBE"
    JT(7) = "JA"
    JT(8) = "JNB"
    JT(9) = "JG"
    JT(10) = "JGE"
    JT(11) = "JL"
    JT(12) = "JLE"
    JT(13) = "JP"
    JT(14) = "JPE"
    JT(15) = "JNP"
    JT(16) = "JPO"
    JT(17) = "JS"
    JT(18) = "JNS"
    JT(19) = "JCXZ"
    JT(20) = "JNCXZ"
    JT(21) = "JC"
    JT(22) = "JNC"
    JT(23) = "JO"
    JT(24) = "JNO"
    
    If Command$ <> "" Then
        LoadTable Replace(Right(Command$, Len(Command$) - InStr(1, Command$, """")), """", "")
    End If
End Sub

Private Sub Form_Resize()
    On Error GoTo Ex
    Headings.Width = ScaleWidth - 4

    List.Width = ScaleWidth - 4
    List.Height = ScaleHeight - 22
Ex:
End Sub

Public Function OpenDialogBox(ByVal frm As Form, ByVal filter As String, ByVal title As String, ByVal OpenSave As Byte) As String
    Dim ofn As OPENFILENAME
    ofn.lStructSize = Len(ofn)
    ofn.hwndOwner = frm.hWnd
    ofn.hInstance = App.hInstance
    ofn.lpstrFilter = filter
    ofn.nFilterIndex = 1
    ofn.lpstrFile = Space$(254)
    ofn.nMaxFile = 255
    ofn.lpstrFileTitle = Space$(254)
    ofn.nMaxFileTitle = 255
    ofn.lpstrInitialDir = CurDir
    ofn.lpstrTitle = title
    ofn.flags = 6
    Dim OpenDialog As Long
    If OpenSave = 1 Then 'Open
        OpenDialog = GetOpenFileName(ofn)
        If (OpenDialog) Then
            If Dir$(Trim$(ofn.lpstrFile)) <> "" Then
                OpenDialogBox = Trim$(ofn.lpstrFile)
            End If
        Else
            OpenDialogBox = "<C>"
        End If
    Else 'Save
        OpenDialog = GetSaveFileName(ofn)
        If OpenDialog > 0 Then
            OpenDialogBox = Trim$(ofn.lpstrFile)
        Else
            OpenDialogBox = "<C>"
        End If
    End If
End Function

Private Sub mnuFExit_Click()
    End
End Sub

Private Sub mnuFOpen_Click()
    LoadTable "!"
End Sub

Private Sub LoadTable(FName As String)
    Dim LoadName    As String
    Dim LastPath    As String
    Dim I           As Long
    
    On Error GoTo Err

    If FName = "!" Then
        LastPath = GetSetting("ArmInline", "Settings", "LastDir", App.Path)
        LoadName = OpenDialogBox(frmMain, "Nanomites File (*.nan)" + Chr$(0) + "*.nan", "Load Nanomite Table", 1)
        If LoadName = "<C>" Then Exit Sub
        If LoadName = "" Then Exit Sub
        If InStr(1, LoadName, "\") > 0 Then
            LastPath = Left(LoadName, Len(LoadName) - InStr(1, StrReverse(LoadName), "\"))
            SaveSetting "ArmInline", "Settings", "LastPath", LastPath
        End If
        LoadName = Left(LoadName, Len(LoadName) - 1)
    Else
        LoadName = FName
    End If
    Open LoadName For Binary As #2
        Get #2, , NumNanos
        ReDim Nano(NumNanos)
        For I = 0 To NumNanos
            Get #2, , Nano(I)
        Next I
    Close #2
    
    List.Clear
    Dim FS As String
    For I = 0 To NumNanos
        FS = Hex(Nano(I).Address) & vbTab & vbTab
        FS = FS & Hex(Nano(I).Destination) & vbTab & vbTab
        FS = FS & Hex(Nano(I).Size) & vbTab & vbTab
        FS = FS & JT(Nano(I).JumpType)
        List.AddItem FS
    Next I
    Exit Sub
Err:
    List.Clear
End Sub
