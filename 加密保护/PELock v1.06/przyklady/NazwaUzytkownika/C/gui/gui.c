////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad pobierania nazwy zarejestrowanego uzytkownika
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "..\..\..\pelock.h"

// tutaj beda odczytane dane zarejestrowanego uzytkownika
unsigned char lpUser[256] = {0};


BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// inicjalizacja okna dialogowego
		case WM_INITDIALOG :

			// poczatkowy marker
			DEMO_START

			// pobierz dane usera
			GetRegistrationName(lpUser,256);

			// ustaw name zarejestrowanego usera
			SetDlgItemText(hDlg,IDC_REG,lpUser);

			// koncowy marker
			DEMO_END

			// sprawdz czy do bufora zostalo cos skopiowane,
			// w przeciwnym wypadku ustaw tekst informujacy,
			// ze aplikacja nie jest zarejestrowana
			if (strlen(lpUser) == 0)
			{
			SetDlgItemText(hDlg,IDC_REG,"Unregistered!");
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
