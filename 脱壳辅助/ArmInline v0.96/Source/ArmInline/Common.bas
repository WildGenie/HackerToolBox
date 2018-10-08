Attribute VB_Name = "Common"
Option Explicit

Public Function ZeroPad(H As String, Optional Length As Long = 2) As String
    If Len(H) < Length Then
        ZeroPad = String(Length - Len(H), "0") & H
    Else
        ZeroPad = H
    End If
End Function

Public Sub Report(Msg As String)
    frmMain.lstConsole.AddItem Msg
    frmMain.lstConsole.Selected(frmMain.lstConsole.ListCount - 1) = True
    frmMain.lstConsole.Selected(frmMain.lstConsole.ListCount - 1) = False
End Sub
