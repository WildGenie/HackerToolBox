VERSION 5.00
Begin VB.Form FRMView 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Key View"
   ClientHeight    =   6195
   ClientLeft      =   60
   ClientTop       =   585
   ClientWidth     =   9585
   Icon            =   "FRMView.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6195
   ScaleWidth      =   9585
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox TXTData 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6030
      Left            =   0
      MousePointer    =   1  'Arrow
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   9465
   End
   Begin VB.Menu MNFile 
      Caption         =   "File"
      Begin VB.Menu MNHex 
         Caption         =   "View Hex"
      End
      Begin VB.Menu MNSave 
         Caption         =   "Save As"
      End
      Begin VB.Menu MNClose 
         Caption         =   "Close Window"
      End
   End
End
Attribute VB_Name = "FRMView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public DefNam, DefExe, DefFil As String

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyEscape Then Call MNClose_Click
End Sub

Private Sub Form_Load()

    On Error GoTo 55

    TXTData = ""
    
    If MNHex.Checked = False Then

        For t = 0 To UBound(FileBinary)
            TemdData = TemdData & Chr(FileBinary(t))
        Next

        TXTData = TemdData
    Else

        For t = 0 To UBound(FileBinary)
            TemdData = TemdData & " " & String(2 - Len(Hex(FileBinary(t))), "0") & Hex(FileBinary(t))
        Next
        
        TXTData = Right(TemdData, Len(TemdData) - 1)
    End If

55 End Sub

Private Sub Form_Resize()

    On Error Resume Next

    If FRMMain.MNAERO.Checked = True Then AEROHack = 100

    TXTData.Height = FRMView.Height - 660 - AEROHack
    TXTData.Width = FRMView.Width - 110 - AEROHack
End Sub

Private Sub MNClose_Click()
    FRMView.Hide
End Sub

Private Sub MNHex_Click()

    If MNHex.Checked = True Then
        MNHex.Checked = False
    Else
        MNHex.Checked = True
    End If
    
    UpdateViewFRM

End Sub

Private Sub MNSave_Click()

    Dim tOpenFile As OpenFilename

    If FRMMain.ListView1.ListItems.Count = 0 Then Exit Sub
    
    tOpenFile.lpstrFile = DefNam
    tOpenFile.lpstrInitialDir = App.Path
    tOpenFile.lpstrTitle = "Savet"
    tOpenFile.lpstrDefExt = DefExe
    tOpenFile.lpstrFilter = DefFil
    
    WFileName = ShowFileDialog(2, tOpenFile)

    If WFileName = "" Then Exit Sub
    
    Open WFileName For Binary As #1
    Put #1, , FileBinary()
    Close #1
    
End Sub
