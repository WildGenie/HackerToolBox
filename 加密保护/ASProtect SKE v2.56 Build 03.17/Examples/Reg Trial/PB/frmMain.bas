#IF NOT %DEF(%WINAPI)
    #INCLUDE "WIN32API.INC"
#ENDIF
#INCLUDE "aspr_api.pb"
#INCLUDE "frmRegistration.bas"
#INCLUDE "PB.INC"

%IDD_frmMain            = 101
%IDC_btnBuy             = 1001
%IDC_btnRegistration    = 1002
%IDC_btnMainExit        = 1003
%IDC_lRegInfo           = 1004
%IDC_Label1             = 1005


GLOBAL hDlgMain AS DWORD

DECLARE CALLBACK FUNCTION ShowfrmMainProc()
DECLARE FUNCTION ShowfrmMain(BYVAL hParent AS DWORD) AS LONG
DECLARE SUB ProcessRegistration()

CALLBACK FUNCTION ShowfrmMainProc()

    SELECT CASE CBMSG
        CASE %WM_INITDIALOG
            MSGBOX "This example shows the work in Trial mode", %MB_ICONINFORMATION, "Information"
            ProcessRegistration
        CASE %WM_COMMAND
            SELECT CASE CBCTL
                CASE %IDC_Label1
                CASE %IDC_btnMainExit
                    IF CBCTLMSG = %BN_CLICKED OR CBCTLMSG = 1 THEN
                        DIALOG END hDlgMain, 0
                    END IF
                CASE %IDC_btnRegistration
                    IF CBCTLMSG = %BN_CLICKED OR CBCTLMSG = 1 THEN
                        ShowfrmRegistration hDlgMain
                        ProcessRegistration
                    END IF
                CASE %IDC_btnBuy
                    IF CBCTLMSG = %BN_CLICKED OR CBCTLMSG = 1 THEN
                        CALL ShellExecute(GetDesktopWindow, "open", "http://www.aspack.com/register.htm", "", "", 1)
                    END IF

            END SELECT
    END SELECT

END FUNCTION

FUNCTION ShowfrmMain(BYVAL hParent AS DWORD) AS LONG
    LOCAL lRslt AS LONG
    LOCAL hFont1 AS DWORD

    DIALOG NEW hParent, "Trial Example for PowerBasic",,, 200, 131, _
        %WS_POPUP OR %WS_BORDER OR %WS_DLGFRAME OR %WS_SYSMENU OR _
        %WS_CLIPSIBLINGS OR %WS_CLIPCHILDREN OR %WS_VISIBLE OR %DS_MODALFRAME _
        OR %DS_3DLOOK OR %DS_NOFAILCREATE OR %DS_SETFONT, %WS_EX_WINDOWEDGE OR _
        %WS_EX_CONTROLPARENT OR %WS_EX_LEFT OR %WS_EX_LTRREADING OR _
        %WS_EX_RIGHTSCROLLBAR, TO hDlgMain
    CONTROL ADD LABEL, hDlgMain, %IDC_Label1, "Advanced Application 1.0", 37, 10, _
        129, 12
    CONTROL ADD BUTTON, hDlgMain, %IDC_btnMainExit, "Exit", 11, 108, 54, 16
    CONTROL ADD LABEL, hDlgMain, %IDC_lRegInfo, "Label2", 16, 30, 171, 69, %SS_CENTER
    CONTROL ADD BUTTON, hDlgMain, %IDC_btnRegistration, "Registration", 133, 108, _
        54, 16
    CONTROL ADD BUTTON, hDlgMain, %IDC_btnBuy, "Buy", 75, 108, 48, 16

    hFont1 = PBFormsMakeFont("Arial", 12, 700, %FALSE, %FALSE, %FALSE, 204)

    CONTROL SEND hDlgMain, %IDC_Label1, %WM_SETFONT, hFont1, 0


    DIALOG SHOW MODAL hDlgMain, CALL ShowfrmMainProc TO lRslt

    DeleteObject hFont1

    FUNCTION = lRslt
END FUNCTION

SUB ProcessRegistration()
DIM UserKey AS STRING
DIM UserName AS STRING

DIM ModeName AS STRING
DIM ModeStatus AS TModeStatus

DIM TrialDaysTotal AS LONG
DIM TrialDaysLeft AS LONG

DIM StR AS STRING

    CONTROL SET TEXT hDlgMain, %IDC_lRegInfo, "TRIAL EXPIRED!"
    apiGetRegistrationInformation 0, UserKey, UserName

    ' Registered?

    IF LEN(UserKey) > 0 THEN

       ' If Yes, then get the registered user info so that it can be displayed.

       REG_CRYPT_BEGIN1

       apiGetModeInformation 0, ModeName, ModeStatus

       CONTROL DISABLE hDlgMain, %IDC_btnBuy

       DIM szModeName AS ASCIIZ PTR
       szModeName = STRPTR(ModeName)

       StR = "Registered version:"+ CHR$(13) + CHR$(10)+ _
       "Key: " + UserKey + CHR$(13) + CHR$(10)+ "Name: " + UserName + CHR$(13) + CHR$(10)+ _
       CHR$(13) + CHR$(10) + "Mode Name: " + @szModeName

       CONTROL SET TEXT hDlgMain, %IDC_lRegInfo,StR
       REG_CRYPT_END1

       IF ModeStatus.IsRegistered THEN
        StR = StR + CHR$(13) + CHR$(10)+ "Mode is REGISTERED!"
        CONTROL SET TEXT hDlgMain, %IDC_lRegInfo, StR
       END IF

'      MSGBOX "Registered Action !", %MB_ICONINFORMATION, "Registration Info"

    ELSE
       ' If No, then check to see how many days left in the trial period.

       IF apiGetTrialDays(0, TrialDaysTotal, TrialDaysLeft) THEN

        IF TrialDaysLeft = 0 THEN
           CONTROL ENABLE hDlgMain, %IDC_btnBuy
           CONTROL SET TEXT hDlgMain, %IDC_lRegInfo, "TRIAL EXPIRED!"
          ELSE
           CONTROL SET TEXT hDlgMain, %IDC_lRegInfo, "UNREGISTERED VERSION" + CHR$(13) + CHR$(10) + CHR$(13) + CHR$(10) + "You have" + STR$(TrialDaysLeft) + " day(s) left !"
          END IF

       END IF

    END IF

END SUB
