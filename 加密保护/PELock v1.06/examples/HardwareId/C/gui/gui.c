////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Usage of Hardware ID
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "..\..\..\pelock.h"

// registered user
unsigned char lpUser[256] = {0};

BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// initialization of main window
		case WM_INITDIALOG :

			// start marker, code between DEMO_START and DEMO_END
			// will be encrypted in protected file and unavailable
			// without valid license key

			// you *need* at least one DEMO_START/DEMO_END marker in the code
			// to be able to read hardware id
			DEMO_START

			// get registered user name
			GetRegistrationName(lpUser,256);

			// display registered user name
			SetDlgItemText(hDlg,IDC_REG,lpUser);

			// end marker
			DEMO_END

			// check if anything was copied to the buffer
			// if not set to default
			if (strlen(lpUser) == 0)
			{
			SetDlgItemText(hDlg,IDC_REG,"Unregistered version!.\nPlease provide this id to receive full version:");

			// read hardware id
			GetHardwareId(lpUser,sizeof(lpUser));

			// display hardware ID in edit window
			SetDlgItemText(hDlg,IDC_HARDWARE_ID,lpUser);
			}

			SetWindowTextA(hDlg, "PELock Test");
			return TRUE;

		case WM_COMMAND :
			switch (LOWORD (wParam))
			{
				case IDCANCEL :
					EndDialog (hDlg, 0);
					break;
			}
			break;
	}
	return FALSE;
}

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
{
	DialogBoxA(hInstance, MAKEINTRESOURCE(DLG_MAIN), 0, DlgP);
	return 0;
}
