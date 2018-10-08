////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Example of how to use DEMO_START and DEMO_END macros
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


DEMO_START
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

DEMO_END

}

BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// initialization of main window
		case WM_INITDIALOG :
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
	// without the key appliation will not run
	DEMO_START

	DialogBoxA(hInstance, MAKEINTRESOURCE(DLG_MAIN), 0, DlgP);

	SaveConfig();


	DEMO_END

	return 0;
}
