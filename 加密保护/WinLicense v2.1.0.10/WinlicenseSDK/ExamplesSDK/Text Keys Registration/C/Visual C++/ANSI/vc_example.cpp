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
#include "Resource.h"
#include <windows.h>
#include "..\..\..\..\..\Include\C\WinlicenseSDK.h"
#pragma comment (lib,"..\\..\\..\\..\\..\\Lib\\COFF\\WinlicenseSDK.lib")


/****************************************************************************** 
/*                          Function prototypes
/*****************************************************************************/ 

LRESULT CALLBACK  MainHandler(HWND, UINT, WPARAM, LPARAM);


/****************************************************************************** 
/*                          Global variables
/*****************************************************************************/ 



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
    char TextKey[1000];
    char Name[200];
    char Company[200];
    char ExtraData[200];

    switch (message)
    {

    case WM_INITDIALOG:
        
        // if application is registered, show the registration info

        if (WLRegGetStatus(NULL) == 1)
        {
            WLRegGetLicenseInfo(Name, Company, ExtraData);
            SetDlgItemText(hDlg, IDC_NAMEEDIT, Name);
            SetDlgItemText(hDlg, IDC_COMPANYNAME, Company);
            SetDlgItemText(hDlg, IDC_EXTRAEDIT, ExtraData);
            
            // change labels caption

            SetDlgItemText(hDlg, IDC_LABEL1, "This application is REGISTERED");
            SetDlgItemText(hDlg, IDC_LABEL2, "");
        }
        
        return TRUE;

    case WM_COMMAND:

        if (LOWORD(wParam) == IDCANCEL) 
        {
            EndDialog(hDlg, LOWORD(wParam));
            return TRUE;
        }

        if (LOWORD(wParam) == IDC_BUTTONACTIVATE)
        {
            GetDlgItemText(hDlg, IDC_TEXTKEYEDIT, TextKey, 1000);

        if (!WLRegNormalKeyCheck(TextKey))
        {
            MessageBox(NULL, "Registration Key is invalid. Please, try it again", "Error", MB_OK | MB_ICONERROR);
        }
        else
        {
            // if key is valid, insert the registration info into a file
            // So, winlicense will be able to finish the registration process

            WLRegNormalKeyInstallToFile(TextKey);

            MessageBox(NULL, "Registration Key is correct. Please, restart\n this application to finish the registration process", "Success", MB_OK);
        }

        }

        break;

    }
    
    return FALSE;
}
