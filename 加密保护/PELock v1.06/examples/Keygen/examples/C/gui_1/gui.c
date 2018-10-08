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
OPENFILENAME lpFn;
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
unsigned char szUserName[256],szLicensePath[MAX_PATH];
unsigned int iUserName,bStatus,iOut;
unsigned char *lpOut;
HFILE hFile;

	// allocate memory for key data
	lpOut = malloc(4096);

	// clear buffer
	memset(lpOut,0,4096);

	// read user name
	iUserName = GetDlgItemText(hMain,IDC_USER_NAME,szUserName,256);

	if (iUserName != 0)
	{
		// generate key data
		bStatus = KeygenProc(	szUserName,	// user name
					0,		// additional key data
					NULL,		// hardware id
					NULL,		// key expiration date (SYSTEMTIME)
					lpOut,		// output buffer
					&iOut,		// output size (out)
					lpProjectFile,	// project file path
					0);		// update project flag

		
		switch (bStatus)
		{
		case KEYGEN_OK:
		
			// build license key path
			GetModuleFileName(NULL, szLicensePath, MAX_PATH);
			*(strrchr(szLicensePath, '\\') + 1) = '\0';

			// append new directory name
			strcat(szLicensePath,szUserName);

			// create new directory for key file
			CreateDirectory(szLicensePath,NULL);

			// set current directory path
			SetCurrentDirectory(szLicensePath);

			// copy default license key name
			strcpy(szLicensePath,"key.lic");

			// create license key file (overwrite existing file)
			hFile = _lcreat(szLicensePath,0);

			if (hFile != HFILE_ERROR)
			{
				// write license key data to the file
				_lwrite(hFile,lpOut,iOut);

				// close file handle
				_lclose(hFile);

				MessageBox(hMain,"License file successfully generated!","Info",MB_ICONINFORMATION);
			}
			else
			{
			MessageBox(hMain,"Cannot create license key file!","Error!",MB_ICONEXCLAMATION);
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
