////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad wykorzystania makr CLEAR_START i CLEAR_END do zamazywania kodu
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
		// inicjalizacja glownego okna, ten kod wykonywany jest tylko raz
		// podczas dzialania programu, dlatego zalecane jest aby w takich
		// fragmentach kodu umieszczac makra CLEAR_START i CLEAR_END, ktore
		// spowoduja, ze po wykonaniu kodu znajdujacego sie pomiedzy nimi
		// zostanie on wymazany z pamieci
		case WM_INITDIALOG :

			// kod pomiedzy CLEAR_START i CLEAR_END zostanie wymazany z
			// pamieci po jego wykonaniu
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
	// kod pomiedzy markerami CLEAR_START i CLEAR_END po wykonaniu bedzie
	// wymazany z pamieci
	CLEAR_START

	DialogBoxA(hInstance, MAKEINTRESOURCE(DLG_MAIN), 0, DlgP);

	CLEAR_END

	SaveConfig();

	return 0;
}
