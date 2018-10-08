#Compile Exe
#Dim All
#Include "WIN32API.INC"
#Include "Zprotect_SDK.inc"

'------------------------------------------------------------------------------
'   ** Constants **
'------------------------------------------------------------------------------
%IDD_DIALOG1 = 100
%ID_OK       = 101
%IDC_LABEL1  = 102
%IDC_LABEL2  = 103
%IDC_EDIT1   = 104
'------------------------------------------------------------------------------


'------------------------------------------------------------------------------
'   ** Declarations **
'------------------------------------------------------------------------------
Declare CallBack Function ShowDIALOG1Proc()
Declare Function ShowDIALOG1(ByVal hParent As Dword) As Long
'------------------------------------------------------------------------------


'------------------------------------------------------------------------------
'   ** Main Application Entry Point **
'------------------------------------------------------------------------------
Function PBMain()
    ShowDIALOG1 %HWND_DESKTOP
End Function
'------------------------------------------------------------------------------

'------------------------------------------------------------------------------
'   ** CallBacks **
'------------------------------------------------------------------------------
CallBack Function ShowDIALOG1Proc()

    Select Case As Long CbMsg
        Case %WM_INITDIALOG
            ' Initialization handler
        Case %WM_COMMAND
            ' Process control notifications
            Select Case As Long CbCtl
                Case %ID_OK
                    If CbCtlMsg = %BN_CLICKED Or CbCtlMsg = 1 Then
                        Local szPassword As String

                        Control Get Text CbHndl, %IDC_EDIT1 To szPassword   'Get Password

                        ZProtect_VM_START   'VM Start marker

                        If szPassword = "Zprotect" Then
                            MsgBox "Great! You have input a right password!", %MB_TASKMODAL, "Zprotect VM Demo"
                        Else
                            MsgBox "Sorry! You input a wrong password, please try again!", %MB_TASKMODAL, "Zprotect VM Demo"
                        End If

                        ZProtect_VM_END     'VM End marker
                    End If
            End Select
    End Select
End Function
'------------------------------------------------------------------------------

'------------------------------------------------------------------------------
'   ** Dialogs **
'------------------------------------------------------------------------------
Function ShowDIALOG1(ByVal hParent As Dword) As Long
    Local lRslt As Long

    Local hDlg  As Dword

    Dialog New hParent, "Zprotect DEMO for PowerBASIC", , , 307, 70, _
        %WS_VISIBLE Or %WS_CLIPSIBLINGS Or %WS_CAPTION Or %WS_SYSMENU Or _
        %WS_THICKFRAME Or %DS_3DLOOK Or %DS_NOFAILCREATE Or %DS_SETFONT, _
        %WS_EX_WINDOWEDGE, To hDlg

    Control Add Label,   hDlg, %IDC_LABEL1, "Input password:", 13, 12, 67, _
        12, %WS_CHILD Or %WS_VISIBLE Or %WS_GROUP, %WS_EX_LEFT Or _
        %WS_EX_LTRREADING

    Control Add TextBox, hDlg, %IDC_EDIT1, "", 13, 25, 220, 12, %WS_CHILD Or _
        %WS_VISIBLE Or %WS_GROUP Or %WS_TABSTOP Or %ES_PASSWORD Or _
        %ES_AUTOHSCROLL, %WS_EX_CLIENTEDGE

    Control Add Button,  hDlg, %ID_OK, "Check", 240, 25, 47, 12, %WS_CHILD Or _
        %WS_VISIBLE Or %WS_GROUP Or %WS_TABSTOP Or %BS_CENTER Or %BS_VCENTER _
        Or %BS_TEXT, %WS_EX_LEFT Or %WS_EX_LTRREADING
    Dialog  Send         hDlg, %DM_SETDEFID, %IDOK, 0

    Control Add Label,   hDlg, %IDC_LABEL2, "!! This demo only shows how to " + _
        "use Zprotect VM Marker in PowerBASIC !!", 13, 49, 280, 12, %WS_CHILD _
        Or %WS_VISIBLE Or %WS_GROUP, %WS_EX_LEFT Or %WS_EX_LTRREADING

    Dialog Show Modal hDlg, Call ShowDIALOG1Proc To lRslt

    Function = lRslt
End Function
'------------------------------------------------------------------------------
