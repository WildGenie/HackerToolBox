#IF NOT %DEF(%WINAPI)
    #INCLUDE "WIN32API.INC"
#ENDIF
#INCLUDE "aspr_api.pb"

%IDD_frmRegistration    = 101
%IDC_tRegName           = 1001
%IDC_btnRegCancel       = 1002
%IDC_btnRegOk           = 1003
%IDC_tRegKey            = 1004
%IDC_btnSend            = 1005
%IDC_tHardwareID        = 1006
%IDC_Label5             = 1007
%IDC_Label4             = 1008
%IDC_Label3             = 1009

GLOBAL hDlgRegistration AS DWORD

DECLARE CALLBACK FUNCTION ShowfrmRegistrationProc()
DECLARE FUNCTION ShowfrmRegistration(BYVAL hParent AS DWORD) AS LONG

CALLBACK FUNCTION ShowfrmRegistrationProc()
LOCAL RegKey AS STRING
LOCAL RegName AS STRING

    SELECT CASE CBMSG
        CASE %WM_INITDIALOG
            CONTROL SET TEXT hDlgRegistration, %IDC_tHardwareID, apiGetHardwareID
        CASE %WM_COMMAND
            SELECT CASE CBCTL
                CASE %IDC_btnSend
                    IF CBCTLMSG = %BN_CLICKED OR CBCTLMSG = 1 THEN
                        CALL ShellExecute(0, "open", "mailto:support@aspack.com?subject=Hardware_ID_"+apiGetHardwareID, "", "", 1)
                    END IF
                CASE %IDC_btnRegOk
                    IF CBCTLMSG = %BN_CLICKED OR CBCTLMSG = 1 THEN
                        CONTROL GET TEXT hDlgRegistration, %IDC_tRegKey TO RegKey
                        CONTROL GET TEXT hDlgRegistration, %IDC_tRegName TO RegName
                        IF apiCheckKeyAndDecrypt(RegKey, RegName, %TRUE) THEN
                            MSGBOX "Thank you for registration!", %MB_ICONINFORMATION, "Registration"
                            DIALOG END hDlgRegistration, 0
                        ELSE
                            MSGBOX "Key is not valid, please contact manufacture!", %MB_ICONEXCLAMATION, "Registration"
                        END IF
                    END IF
                CASE %IDC_btnRegCancel
                    IF CBCTLMSG = %BN_CLICKED OR CBCTLMSG = 1 THEN
                        DIALOG END hDlgRegistration, 0
                    END IF

            END SELECT
    END SELECT

END FUNCTION

FUNCTION ShowfrmRegistration(BYVAL hParent AS DWORD) AS LONG
    LOCAL lRslt AS LONG
    LOCAL hFont1 AS DWORD
    LOCAL hFont2 AS DWORD


    DIALOG NEW hParent, "Registration",,, 232, 142, %WS_POPUP OR _
        %WS_VISIBLE OR %WS_CLIPSIBLINGS OR %WS_BORDER OR %WS_DLGFRAME OR _
        %DS_3DLOOK OR %DS_NOFAILCREATE OR %DS_SETFONT OR %WS_CLIPCHILDREN OR _
        %WS_SYSMENU OR %DS_MODALFRAME, %WS_EX_WINDOWEDGE OR %WS_EX_LEFT OR _
        %WS_EX_LTRREADING OR %WS_EX_RIGHTSCROLLBAR OR %WS_EX_CONTROLPARENT OR _
        %WS_EX_DLGMODALFRAME, TO hDlgRegistration
    CONTROL ADD LABEL, hDlgRegistration, %IDC_Label3, "Please send your Hardware ID to the " + _
        "author", 5, 5, 177, 10
    CONTROL ADD TEXTBOX, hDlgRegistration, %IDC_tHardwareID, "", 5, 20, 161, 13, %ES_READONLY OR %WS_TABSTOP OR %WS_BORDER
    CONTROL SET COLOR hDlgRegistration, %IDC_tHardwareID, -1, %CYAN
    CONTROL ADD BUTTON, hDlgRegistration, %IDC_btnSend, "Send", 171, 18, 54, 15
    CONTROL ADD LABEL, hDlgRegistration, %IDC_Label4, "Enter your registration key below, " + _
        "please:", 5, 49, 172, 11
    CONTROL ADD TEXTBOX, hDlgRegistration, %IDC_tRegKey, "", 5, 64, 219, 14
    CONTROL ADD BUTTON, hDlgRegistration, %IDC_btnRegOk, "OK", 5, 123, 54, 15
    CONTROL ADD BUTTON, hDlgRegistration, %IDC_btnRegCancel, "Cancel", 69, 123, 54, 15
    CONTROL ADD LABEL, hDlgRegistration, %IDC_Label5, "Enter your registration name below, " + _
        "please:", 5, 89, 177, 10
    CONTROL ADD TEXTBOX, hDlgRegistration, %IDC_tRegName, "Registered User", 5, 103, 219, 15

    hFont1 = PBFormsMakeFont("MS Sans Serif", 8, 700, %TRUE, %FALSE, %FALSE, 204)
    hFont2 = PBFormsMakeFont("MS Sans Serif", 8, 700, %FALSE, %FALSE, %FALSE, 204)

    CONTROL SEND hDlgRegistration, %IDC_Label3, %WM_SETFONT, hFont1, 0
    CONTROL SEND hDlgRegistration, %IDC_Label4, %WM_SETFONT, hFont1, 0
    CONTROL SEND hDlgRegistration, %IDC_Label5, %WM_SETFONT, hFont2, 0

    DIALOG SHOW MODAL hDlgRegistration, CALL ShowfrmRegistrationProc TO lRslt

    DeleteObject hFont1
    DeleteObject hFont2

    FUNCTION = lRslt
END FUNCTION
'--------------------------------------------------------------------------------
