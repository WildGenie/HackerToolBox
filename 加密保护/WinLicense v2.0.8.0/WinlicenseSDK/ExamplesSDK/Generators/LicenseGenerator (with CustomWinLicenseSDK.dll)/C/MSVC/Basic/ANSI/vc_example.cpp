/****************************************************************************** 
/* Module: Example
/* Description: Shows how to generate Trial Extension keys in Visual C++ language
/*
/* Authors: Rafael Ahucha  
/* (c) 2004 Winlicense Professional
/*****************************************************************************/ 


/****************************************************************************** 
/*                   Libraries used by this module
/*****************************************************************************/ 

#include "stdafx.h"
#include <stdio.h>
#include "Resource.h"
#include <commctrl.h>
#include <windows.h>
#include "CustomWinlicenseSDK.h"
#pragma comment (lib,"CustomWinlicenseSDK.lib")


/****************************************************************************** 
/*                          Function prototypes
/*****************************************************************************/ 

LRESULT CALLBACK  MainHandler(HWND, UINT, WPARAM, LPARAM);
void GetDlgData(HWND hDlg, char* pName, char* pOrg, char* pCustom, char* pHardId, int* pDays, int* pExec, SYSTEMTIME* pExpDateSysTime);

/*****************************************************************************
* WinMain
*
*  Main program function
*
* Inputs
*  Standard WinMain parameters
* 
* Outputs
*  None
*
* Returns
*  Exit Code
******************************************************************************/

int APIENTRY _tWinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPTSTR    lpCmdLine,
                     int       nCmdShow)
{
    DialogBox(GetModuleHandle(NULL), (LPCTSTR)IDD_ABOUTBOX, NULL, (DLGPROC)MainHandler);

    return 0;
}


/*****************************************************************************
* MainHandler
*
*  Message handler for dialog box
*
* Inputs
*  Standard Dlgbox message handle parameters
* 
* Outputs
*  None
*
* Returns
*  Exit Code
******************************************************************************/


LRESULT CALLBACK MainHandler(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{

    char            Name[255], Org[255], Custom[255], HardId[255], KeyBuffer[4000], AuxBuffer[100];
    char            RegName[100], RegValueName[100], FullRegName[120] = {0};
    int             mDays, mExec, SizeKey;
    SYSTEMTIME      ExpDateSysTime;
    FILE*           hFileKey;
    HWND            hwnd;


    switch (message)
    {

    case WM_INITDIALOG:
        
        // set default GUI data

        SetDlgItemText(hDlg, IDC_EDITFILENAME, "License.dat");
        SetDlgItemText(hDlg, IDC_EDITHKLM, "HKLM\\");
        SetDlgItemText(hDlg, IDC_EDITKEYNAME, "Software\\Mysoft");
        SetDlgItemText(hDlg, IDC_EDITKEYVALUENAME, "reg_value");
        SetDlgItemText(hDlg, IDC_EDITREGNAME, "License.reg");
        
        return TRUE;

    case WM_COMMAND:

        if (LOWORD(wParam) == IDCANCEL) 
        {
            EndDialog(hDlg, LOWORD(wParam));
            return TRUE;
        }

        //
        // Generate File Key
        //

        if (LOWORD(wParam) == IDC_BUTTON_GENFILE)
        {
            // read information from GUI

            GetDlgData(hDlg, Name, Org, Custom, HardId, &mDays, &mExec, &ExpDateSysTime);
           
            // Generate specific key

            SizeKey = WLCustomGenLicenseFileKey(Name[0] == 0? NULL : Name, Org[0] == 0? NULL : Org,
                      Custom[0] == 0? NULL : Custom, HardId[0] == 0? NULL : HardId, mDays, mExec, 
                      IsDlgButtonChecked(hDlg, IDC_CHECK_DATEENABLE)? &ExpDateSysTime: NULL, 0, 0, 0, KeyBuffer);

            // create key in file chosen by user

            GetDlgItemText(hDlg, IDC_EDITFILENAME, AuxBuffer, 100);
            
            hFileKey = fopen(AuxBuffer,"wb+");

            fwrite(KeyBuffer, SizeKey, 1, hFileKey);

            fclose(hFileKey);

            MessageBox(0, "A License key file has been generated", "License Key Generator SDK", MB_OK);

        }

        //
        // Generate Text Key
        //

        if (LOWORD(wParam) == IDC_BUTTON_GENTEXT)
        {

            // read information from GUI

            GetDlgData(hDlg, Name, Org, Custom, HardId, &mDays, &mExec, &ExpDateSysTime);
           
            // Generate specific key

            SizeKey = WLCustomGenLicenseTextKey(Name[0] == 0? NULL : Name, Org[0] == 0? NULL : Org,
                      Custom[0] == 0? NULL : Custom, HardId[0] == 0? NULL : HardId, mDays, mExec, 
                      IsDlgButtonChecked(hDlg, IDC_CHECK_DATEENABLE)? &ExpDateSysTime: NULL, 0, 0, 0, KeyBuffer);

            // show text key on GUI

            SetDlgItemText(hDlg, IDC_EDITTEXTKEY, KeyBuffer);

        }

        //
        // Generate SmartActivate Key
        //

        if (LOWORD(wParam) == IDC_BUTTONGENSMART)
        {

            // read information from GUI

            GetDlgData(hDlg, Name, Org, Custom, HardId, &mDays, &mExec, &ExpDateSysTime);
           
            // Generate specific key

            SizeKey = WLCustomGenLicenseSmartKey(Name[0] == 0? NULL : Name, Org[0] == 0? NULL : Org,
                      Custom[0] == 0? NULL : Custom, HardId[0] == 0? NULL : HardId, mDays, mExec, 
                      IsDlgButtonChecked(hDlg, IDC_CHECK_DATEENABLE)? &ExpDateSysTime: NULL, KeyBuffer);

            // show text key on GUI

            SetDlgItemText(hDlg, IDC_EDIT_SMARTKEY, KeyBuffer);

        }

        //
        // Generate Registry file Key
        //

        if (LOWORD(wParam) == IDC_BUTTON_GENREGFILE)
        {
             
            // read information from GUI

            GetDlgData(hDlg, Name, Org, Custom, HardId, &mDays, &mExec, &ExpDateSysTime);

            // get registry key name and value name

            GetDlgItemText(hDlg, IDC_EDITKEYNAME, RegName, 100);
            GetDlgItemText(hDlg, IDC_EDITKEYVALUENAME, RegValueName, 100);

            strcat(FullRegName, "HKEY_LOCAL_MACHINE\\");
            strcat(FullRegName, RegName);

            // Generate specific key

            SizeKey = WLCustomGenLicenseRegistryKey(Name[0] == 0? NULL : Name, Org[0] == 0? NULL : Org,
                      Custom[0] == 0? NULL : Custom, HardId[0] == 0? NULL : HardId, mDays, mExec, 
                      IsDlgButtonChecked(hDlg, IDC_CHECK_DATEENABLE)? &ExpDateSysTime: NULL, 0, 0, 0, FullRegName, RegValueName, KeyBuffer);

            // create registry key in file chosen by user

            GetDlgItemText(hDlg, IDC_EDITREGNAME, AuxBuffer, 100);
            
            hFileKey = fopen(AuxBuffer,"wb+");

            fwrite(KeyBuffer, SizeKey, 1, hFileKey);

            fclose(hFileKey);

            MessageBox(0, "A License registry key file has been generated", "License Key Generator SDK", MB_OK);

        }

        if (LOWORD(wParam) == IDC_CHECK_DATEENABLE)
        {
       
            hwnd = GetDlgItem(hDlg, IDC_DATETIMEPICKER1);
            EnableWindow(hwnd, IsDlgButtonChecked(hDlg, IDC_CHECK_DATEENABLE));

        }

        

        break;

    }
    
    return FALSE;
}


/*****************************************************************************
* GetDlgData
*
*  Reads all the information inserted by the user to generate the specific key
*
* Inputs
*  hDlg: dialog handle
* 
* Outputs
*  pName: address where to store the user name
*  pOrg: address where to store the company name
*  pCustom: address where to store the custom data
*  pHardId: address where to store the hardware id
*  pDays: address where to store the number of days
*  pExec: address where to store the number of executions
*  pExpDateSysTime: address where to store the expiration date
*
* Returns
*  None
******************************************************************************/

void GetDlgData(HWND hDlg, char* pName, char* pOrg, char* pCustom, char* pHardId, int* pDays, int* pExec, SYSTEMTIME* pExpDateSysTime)
{
    char LocalBuffer[255];

    // copy user name

    GetDlgItemText(hDlg, IDC_EDITNAME, LocalBuffer, 255);
    
    if (strcmp(LocalBuffer, ""))
    {
        strcpy(pName, LocalBuffer);
    }
    else
    {
        *pName = 0;
    }

    // copy Custom data

    GetDlgItemText(hDlg, IDC_EDITORGANIZATION, LocalBuffer, 255);
    
    if (strcmp(LocalBuffer, ""))
    {
        strcpy(pOrg, LocalBuffer);
    }
    else
    {
        *pOrg = 0;
    }

    // copy company name

    GetDlgItemText(hDlg, IDC_EDITCUSTOM, LocalBuffer, 255);
    
    if (strcmp(LocalBuffer, ""))
    {
        strcpy(pCustom, LocalBuffer);
    }
    else
    {
        *pCustom = 0;
    }

    // copy hardware Id

    GetDlgItemText(hDlg, IDC_EDITHARDID, LocalBuffer, 255);
    
    if (strcmp(LocalBuffer, ""))
    {
        strcpy(pHardId, LocalBuffer);
    }
    else
    {
        *pHardId = 0;
    }

    // copy number of days

    GetDlgItemText(hDlg, IDC_EDITNUMDAYS, LocalBuffer, 255);

    if (strcmp(LocalBuffer, ""))
    {
        *pDays = atoi(LocalBuffer);
    }
    else
    {
        *pDays = 0;
    }

    // copy number of executions

    GetDlgItemText(hDlg, IDC_EDITMAXEXEC, LocalBuffer, 255);

    if (strcmp(LocalBuffer, ""))
    {
        *pExec = atoi(LocalBuffer);
    }
    else
    {
        *pExec = 0;
    }

    // copy expiration date

    SendDlgItemMessage(hDlg, IDC_DATETIMEPICKER1, DTM_GETSYSTEMTIME, GDT_VALID, (LPARAM)pExpDateSysTime);

}



