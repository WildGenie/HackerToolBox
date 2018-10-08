// trial.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "resource.h"
#include <shellapi.h>

#include "include/aspr_api.h"
#include "include/asprotect.h"

#pragma comment(lib,"include/aspr_ide.lib")

#define MAX_LOADSTRING 100

char*	UserKey			= NULL;
char*	UserName		= NULL;

char*	LocalHardwareID = NULL;
char*	ModeName		= NULL;

DWORD	TrialDaysTotal	= 0,
		TrialDaysLeft	= 0;

//---------------------------------------------------------------------
BOOL APIENTRY RegDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	char	keybuf[1024];
	char	namebuf[1024];
	char	buffer[1024];
	int		size;

	switch (msg) {


		case WM_INITDIALOG:

			LocalHardwareID = GetHardwareID();
			SetDlgItemText(hwnd, IDC_HARDWAREKEY_EDIT, LocalHardwareID);
			return TRUE;


        case WM_COMMAND:
            switch (LOWORD(wParam)) {

				case IDOK:

					// key

					size = GetDlgItemText(hwnd, IDC_REGKEY_EDIT, keybuf, 1024);
					keybuf[size] = 0;

					// name

					size = GetDlgItemText(hwnd, IDC_REGNAME_EDIT, namebuf, 1024);
					namebuf[size] = 0;

					if ( CheckKeyAndDecrypt( (char*)keybuf, (char*)namebuf, TRUE ) == TRUE )
					{
						MessageBox(hwnd, "Thank you for your registration!", "Registration", MB_ICONINFORMATION);
		                EndDialog(hwnd, IDOK);
	                    break;
					}
					else
					{
						MessageBox(hwnd, "Key is not valid, please contact manufacture!","Registration", MB_ICONWARNING);
	                    break;
					}

				case IDC_SEND:
					buffer[0] = 0;
					lstrcat(buffer,"mailto:support@aspack.com?subject=Hardware%20ID%20for%20Advanced%20Application%201.0&body=Hardware%20ID is%20:%20");
					lstrcat(buffer,LocalHardwareID);
					lstrcat(buffer,"%0d%0aRegistration%20information%20:");
                    ShellExecute((HWND)GetDesktopWindow(), "open", buffer, NULL, NULL, SW_SHOWNORMAL);
                    break;


                case IDCANCEL:
                    EndDialog(hwnd, IDCANCEL);
                    break;

            }

            break;
    }

    return FALSE;
}
//---------------------------------------------------------------------
void ProcessRegistration( HWND hwnd )
{
  char			caption[100];
  char			buffer[256];

  MODE_STATUS   mode_status;

  GetRegistrationInformation( 0, &UserKey,  &UserName );

  if ((UserKey != NULL) && (strlen(UserKey) > 0))
  {

	// Trial doesn't expire
	// Application was registered

	REG_CRYPT_BEGIN1

	// caption

	strcpy( caption, "Registered version!" );
	SetWindowText( hwnd, caption );

    GetModeInformation( 0, &ModeName, &mode_status );

	// exit -> close

	SetWindowText( GetDlgItem(hwnd,IDCANCEL), "Close" );

	// hide trial buttons

	ShowWindow(GetDlgItem(hwnd,IDC_BUYNOW), SW_HIDE);
	ShowWindow(GetDlgItem(hwnd,IDC_REG_BUTTON), SW_HIDE);

	// registered info

	wsprintf( buffer,"Key: %s\nName: \t\t%s\nMode Name: \t%s",
					  UserKey, UserName, ModeName );

	SetDlgItemText(hwnd, IDC_TEXT, buffer);

	REG_CRYPT_END1

  }
  else
  {

	if (GetTrialDays( 0, &TrialDaysTotal, &TrialDaysLeft ))
	{

		// caption

		strcpy( caption, "TRIAL version!" );
		SetWindowText( hwnd, caption );

		// show trial buttons

		ShowWindow(GetDlgItem(hwnd,IDC_BUYNOW), SW_SHOW);
		ShowWindow(GetDlgItem(hwnd,IDC_REG_BUTTON), SW_SHOW);

		// trial info

		if (TrialDaysLeft == 0)
		{
			strcpy( buffer, "\t\tTRIAL EXPIRED!" );
			SetDlgItemText(hwnd, IDC_TEXT, buffer);
		}
		else
		{
			wsprintf( buffer,"\tUnregistered trial version:\n\n\tYou have : %d day(s) left",
							  TrialDaysLeft );
			SetDlgItemText(hwnd, IDC_TEXT, buffer);
		}
	}
  }

}
//---------------------------------------------------------------------
BOOL APIENTRY DlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{

	switch (msg) {


		// Init

		case WM_INITDIALOG:

			ProcessRegistration( hwnd );
			return TRUE;


		// Cmd

        case WM_COMMAND:
 
			switch (LOWORD(wParam)) {

				case IDC_REG_BUTTON:

					ShowWindow(hwnd, SW_HIDE);
					DialogBox(	NULL,(LPSTR)MAKEINTRESOURCE(IDD_REG_DIALOG),hwnd,(DLGPROC/*WNDPROC*/)RegDlgProc);
					ProcessRegistration( hwnd );
					ShowWindow(hwnd, SW_SHOW);
					break;

				case IDC_BUYNOW:
					
					ShellExecute((HWND)GetDesktopWindow(), "open", "http://www.aspack.com/register.htm", NULL, NULL, SW_SHOWNORMAL);
					break;


                case IDOK:
                    EndDialog(hwnd, IDOK);
                    break;

                case IDCANCEL:
                    EndDialog(hwnd, IDCANCEL);
                    break;
            }

            break;
    }

    return FALSE;
}
//---------------------------------------------------------------------
int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow){

    MessageBox( 0, "This example shows the work in trial mode.", "Information", MB_ICONINFORMATION );

	DialogBox(NULL,(LPSTR)MAKEINTRESOURCE(IDD_DIALOG),NULL,(DLGPROC/*WNDPROC*/)DlgProc);
	return 0;
}
