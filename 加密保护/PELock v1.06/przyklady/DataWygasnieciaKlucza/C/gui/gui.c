////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad jak odczytac date wygasniecia klucza
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "..\..\..\pelock.h"

// bufor na nazwe zarejestrowanego uzytkownika
unsigned char lpUser[256] = {0};
SYSTEMTIME lpSysTime;

BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// inicjalizacja okna dialogowego
		case WM_INITDIALOG :

			// zeby moc skorzysac z funkcji systemu licencyjnego PELock'a, nalezy
			// umiescic w kodzie programu markery DEMO_START/DEMO_END
			DEMO_START

			// pobierz nazwe zarejestrowanego uzytkownika
			GetRegistrationName(lpUser,256);

			// wyswietl nazwe zarejestrowanego uzytkownika
			SetDlgItemText(hDlg,IDC_REG,lpUser);


			// odczytaj date wygasniecia klucza
			if (GetKeyExpirationDate(&lpSysTime) == 1)
			{
			wsprintf(lpUser,"%lu-%lu-%lu (dd.mm.yy)",lpSysTime.wDay,lpSysTime.wMonth,lpSysTime.wYear);
			}
			else
			{
			strcpy(lpUser,"brak");
			}

			SetDlgItemText(hDlg,IDC_EXP,lpUser);

			DEMO_END

			// sprawdz czy cos zostalo przekopiowane do bufora z nazwa
			// uzytkownika, jesli nie, oznacza to, ze brak klucza, lub
			// klucz niepoprawny
			if (strlen(lpUser) == 0)
			{
			SetDlgItemText(hDlg,IDC_REG,"Wersja niezarejestrowana!");
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
