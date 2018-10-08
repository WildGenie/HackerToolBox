////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Example of how to use KEYGEN.dll to generate license keys
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "keygen.h"

// procedures declaration
_Keygen KeygenProc;

HINSTANCE hInst;
INITCOMMONCONTROLSEX icex;
OPENFILENAME lpFn;
HWND hDatePicker;
char lpProjectFile[512];

////////////////////////////////////////////////////////////////////////////////
//
// load & initialize keygen library
//
////////////////////////////////////////////////////////////////////////////////

void InitializeKeygen()
{
HMODULE hKeygen;

	// load keygen library
	hKeygen = LoadLibrary("KEYGEN.dll");

	if (hKeygen != 0)
	{
		// get "Keygen" procedure address
		KeygenProc = (_Keygen)GetProcAddress(hKeygen,"Keygen");
	}
	else
	{
		// display error message
		MessageBox(NULL,"Cannot load library KEYGEN.dll!","Error!",MB_ICONEXCLAMATION);

		// exit application
		ExitProcess(-1);
	}
}


////////////////////////////////////////////////////////////////////////////////
//
// generate license key
//
////////////////////////////////////////////////////////////////////////////////

void GenerateKey(HWND hMain)
{
unsigned char szUserName[256],szHardwareId[256],szLicenseKey[256],*lpOut;
unsigned int iUserName,iHardwareId,iAdditional[4];
unsigned int bUpdate,bStatus,iOut,bTrans,iUserData,lpWrite;
HANDLE hFile;
SYSTEMTIME lpSysTime,*lpTime;

	// allocate memory for key data
	lpOut = malloc(4096);

	memset(lpOut,0,4096);


	// read user name
	iUserName = GetDlgItemText(hMain,IDC_USER_NAME,szUserName,256);

	if (iUserName != 0)
	{
		// read addtional key data, hardware id
		iHardwareId = GetDlgItemText(hMain,IDC_HARDWARE_ID,szHardwareId,16+1);

		// read additional key data
		iAdditional[0] = GetDlgItemInt(hMain,IDC_ADDITIONAL_1,&bTrans,FALSE);
		iAdditional[1] = GetDlgItemInt(hMain,IDC_ADDITIONAL_2,&bTrans,FALSE);
		iAdditional[2] = GetDlgItemInt(hMain,IDC_ADDITIONAL_3,&bTrans,FALSE);
		iAdditional[3] = GetDlgItemInt(hMain,IDC_ADDITIONAL_4,&bTrans,FALSE);

		// pack additional key bytes into one DWORD value
		iUserData = (iAdditional[3] << 24) | (iAdditional[2] << 16) | (iAdditional[1] << 8) | (iAdditional[0]);

		// check update flag, when this option is selected, add user name to 
		// the current project file userlist
		bUpdate = IsDlgButtonChecked(hMain,IDB_UPDATE_PROJECT);


		// read key expiration date
		if ( SendMessage(hDatePicker,DTM_GETSYSTEMTIME,0,(LPARAM)&lpSysTime) == GDT_VALID)
		{
		lpTime = &lpSysTime;
		}
		else
		{
		lpTime = NULL;
		}


		// generate key data
		bStatus = KeygenProc(	szUserName,	// user name
					iUserData,	// additional key data
					szHardwareId,	// hardware id
					lpTime,		// key expiration date
					lpOut,		// output buffer
					&iOut,		// output size (out)
					lpProjectFile,	// project file path
					bUpdate);	// update project flag


		switch (bStatus)
		{
		case KEYGEN_OK:

			// save key file
			memset(&lpFn,0, sizeof(OPENFILENAME) );

			// copy default license key name
			strcpy(szLicenseKey,"key.lic");

			lpFn.lStructSize = sizeof(OPENFILENAME);
			lpFn.nMaxFile = 256;
			lpFn.lpstrFile = szLicenseKey; 
			lpFn.Flags = OFN_HIDEREADONLY;
			lpFn.lpstrFilter = "PELock License File (key.lic)\0key.lic\0";

			if (GetSaveFileName(&lpFn) != 0)
			{
				// create new file
				hFile = CreateFile(szLicenseKey,\
							GENERIC_READ | GENERIC_WRITE,\
							0,\
							NULL,\
							CREATE_ALWAYS,\
							FILE_ATTRIBUTE_NORMAL,\
							NULL);

				if (hFile != INVALID_HANDLE_VALUE)
				{
					// save license key data in key.lic file
					if (WriteFile(hFile,lpOut,iOut,&lpWrite,NULL) != 0)
					{
					MessageBox(hMain,"License file successfully generated!","Info",MB_ICONINFORMATION);
					}
					else
					{
					MessageBox(hMain,"Error while saving license key data!","Error!",MB_ICONEXCLAMATION);
					}

				// close file handle
				CloseHandle(hFile);

				}
				else
				{
				MessageBox(hMain,"Cannot create license key file!","Error!",MB_ICONEXCLAMATION);
				}
			}
			break;

		// invalid user name
		case KEYGEN_DATA_ERR:

			MessageBox(hMain,"Cannot generate license key data.","Error!",MB_ICONEXCLAMATION);
			break;

		// invalid project file
		case KEYGEN_INIT_ERR:

			MessageBox(hMain,"Error while initialization, please check your project file!","Error!",MB_ICONEXCLAMATION);
			break;

		// all other errors
		default:
			MessageBox(hMain,"Unexpected error while key generation!","Error!",MB_ICONEXCLAMATION);

		}
	}
	else
	{
	MessageBox(hMain,"Please enter valid user name and try again.","Invalid user name!",MB_ICONEXCLAMATION);
	}

	// release allocated memory
	free(lpOut);
}




BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// initialization of main window
		case WM_INITDIALOG :

			// set main window caption
			SetWindowTextA(hDlg, "PELock Keygen Test");

			// create time date picker control
			hDatePicker = CreateWindowEx(	0,
							DATETIMEPICK_CLASS,
							"DateTime",
							WS_BORDER|WS_CHILD|WS_VISIBLE|DTS_SHOWNONE,
							5,150,200,25,
							hDlg,
							NULL,
							hInst,
							NULL);

			// disable time picker control
			SendMessage(hDatePicker,DTM_SETSYSTEMTIME,GDT_NONE,0);

			return TRUE;

		case WM_COMMAND :
			switch (LOWORD (wParam))
			{
				case IDCANCEL :
					EndDialog (hDlg, 0);
					break;
				case IDB_GEN :
					GenerateKey(hDlg);
					break;

			}
			break;
	}


	return FALSE;
}

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
{

	hInst = hInstance;

	// initialize common controls
	icex.dwSize = sizeof(icex);
	icex.dwICC = ICC_DATE_CLASSES;

	InitCommonControlsEx(&icex);

	memset(&lpFn,0, sizeof(OPENFILENAME) );

	lpFn.lStructSize = sizeof(OPENFILENAME);
	lpFn.nMaxFile = 512;
	lpFn.lpstrFile = lpProjectFile; 
	lpFn.Flags = OFN_HIDEREADONLY;
	lpFn.lpstrFilter = "PELock Project Files (*.plk)\0*.plk\0";

	// select project file
	if (GetOpenFileName(&lpFn) != 0)
	{

	// load keygen library
	InitializeKeygen();

	DialogBoxA(hInstance, MAKEINTRESOURCE(DLG_MAIN), 0, DlgP);

	}
	return 0;
}
