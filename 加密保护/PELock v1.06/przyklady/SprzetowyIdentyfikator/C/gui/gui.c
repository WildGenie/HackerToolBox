////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad uzycia sprzetowego identyfikatora
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "..\..\..\pelock.h"

// nazwa zarejestrowanego uzytkownika
unsigned char lpUser[256] = {0};

BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// inicjalizacja glownego okna
		case WM_INITDIALOG :

			// wyczysc bufor lpUser
			memset(lpUser,0,sizeof(lpUser));

			// kod pomiedzy markerami DEMO_START i DEMO_END
			// bedzie zaszyfrowany w zabezpieczonym pliku i niedostepny
			// bez poprawnego klucza licencyjnego
			DEMO_START

			// odczytaj nazwe zarejestrowanego uzytkownika
			// z klucza licencyjnego
			GetRegistrationName(lpUser,256);

			// wyswietl nazwe zarejestrowanego uzytkownika
			SetDlgItemText(hDlg,IDC_REG,lpUser);

			// koncowy marker
			DEMO_END

			// sprawdz czy cos zostalo skopiowane do bufora, jesli nic oznacza
			// to brak klucza licencyjnego, w takim wypadku wyswietl informacje
			// o niezarejestrowanej wersji
			if (strlen(lpUser) == 0)
			{
			SetDlgItemText(hDlg,IDC_REG,"Niezarejestrowana wersja!\n\nPrzy zakupie programu prosze udostepnic nastepujacy numer:");
			
			// odczytaj sprzetowy identyfikator do bufora
			GetHardwareId(lpUser,sizeof(lpUser));

			// wyswietl sprzetowy identyfikator w oknie informacyjnym
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
