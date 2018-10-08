////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad uzycia makr CRYPT_START i CRYPT_END
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "..\..\..\pelock.h"


// przykladowa procedura
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
		// inicjalizacja okna dialogowego
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
	// w niezarejestrowanej wersji nie wyswietlaj okna dialogowego
	DEMO_START

	DialogBoxA(hInstance, MAKEINTRESOURCE(DLG_MAIN), 0, DlgP);

	SaveConfig();


	DEMO_END

	return 0;
}
