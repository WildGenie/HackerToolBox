////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Example of how to use CLEAR_START and CLEAR_END macros
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "..\..\..\pelock.h"


// example procedure
void SaveConfig()
{
unsigned int i,j;


CRYPT_START
	j = 1;

	for (i = 0;i < 10 ;i++ )
	{
	j += i;
	}

	j = 5;

	j = 3;

	if (j == 3)
	{
	i = 1;
	}
	else
	{
	i = 0;
	}

CRYPT_END

}

BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// initialization of main window, its executed only one time
		// so we can use CLEAR_START and CLEAR_END macros
		case WM_INITDIALOG :

			// code between CLEAR_START and CLEAR_END will be executed
			// and then erased from the memory
			CLEAR_START

			SetWindowTextA(hDlg, "PELock Test");

			CLEAR_END

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
	// without the key appliation will not run
	CLEAR_START

	DialogBoxA(hInstance, MAKEINTRESOURCE(DLG_MAIN), 0, DlgP);

	CLEAR_END

	SaveConfig();

	return 0;
}
