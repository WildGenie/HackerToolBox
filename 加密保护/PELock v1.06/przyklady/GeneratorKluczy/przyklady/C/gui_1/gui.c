////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad wykorzystania biblioteki KEYGEN.dll do generacji kluczy licencyjnych
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "keygen.h"

// deklaracja procedury generujacej (znajduje sie ona w pliku "keygen.h")
_Keygen KeygenProc;


HINSTANCE hInst;
OPENFILENAME lpFn;
char lpProjectFile[512];

////////////////////////////////////////////////////////////////////////////////
//
// zaladuj biblioteke KEYGEN.dll
//
////////////////////////////////////////////////////////////////////////////////

void InitializeKeygen()
{
HMODULE hKeygen;

	// zaladuj biblioteke KEYGEN.dll
	hKeygen = LoadLibrary("KEYGEN.dll");

	if (hKeygen != 0)
	{
		// pobierz adres procedury generujace klucze "Keygen"
		KeygenProc = (_Keygen)GetProcAddress(hKeygen,"Keygen");
	}
	else
	{
		// w razie bledu wyswietl odpowiedni komunikat
		MessageBox(NULL,"Nie mozna zaladowac biblioteki KEYGEN.dll!","Blad!",MB_ICONEXCLAMATION);

		// zakoncz aplikacje
		ExitProcess(-1);
	}
}


////////////////////////////////////////////////////////////////////////////////
//
// generuj klucz licencyjny
//
////////////////////////////////////////////////////////////////////////////////

void GenerateKey(HWND hMain)
{
unsigned char szUserName[256],szLicensePath[MAX_PATH];
unsigned int iUserName,bStatus,iOut;
unsigned char *lpOut;
HFILE hFile;

	// zaalokuj pamiec na dane klucza
	lpOut = malloc(4096);

	// wyczysc bufor
	memset(lpOut,0,4096);

	// odczytaj nazwe uzytkownika, dla ktorego ma zostac wygenerowany
	// klucz licencyjny
	iUserName = GetDlgItemText(hMain,IDC_USER_NAME,szUserName,256);

	if (iUserName != 0)
	{
		// generuj dane klucza licencyjnego
		bStatus = KeygenProc(	szUserName,	// nazwa uzytkownika
					0,		// dodatkowe dane klucza
					NULL,		// sprzetowy identyfikator klucza
					NULL,		// data wygasniecia klucza (SYSTEMTIME)
					lpOut,		// bufor wyjsciowy na dane klucza
					&iOut,		// rozmiar danych wyjsciowych (wskaznik na DWORDa)
					lpProjectFile,	// pelna sciezka do pliku projektu
					0);		// flaga aktualizacji projektu

		// sprawdz jaka wartosc zwrocila funkcja
		switch (bStatus)
		{
		case KEYGEN_OK:
		
			// buduj pelna sciezke do klucza licencyjnego
			GetModuleFileName(NULL, szLicensePath, MAX_PATH);
			*(strrchr(szLicensePath, '\\') + 1) = '\0';

			// klucz key.lic umiesc w katalogu, ktorego nazwa
			// bedzie okreslala nazwe uzytkownika
			strcat(szLicensePath,szUserName);

			// utworz nowy katalog
			CreateDirectory(szLicensePath,NULL);

			// ustaw biezacy katalog
			SetCurrentDirectory(szLicensePath);

			// skopiuj domyslna nazwe klucza
			strcpy(szLicensePath,"key.lic");

			// utworz plik licencyjny (nadpisuj istniejace pliki)
			hFile = _lcreat(szLicensePath,0);

			if (hFile != HFILE_ERROR)
			{
				// zapisz dane licencyjne do utworzonego pliku
				_lwrite(hFile,lpOut,iOut);

				// zamknij plik
				_lclose(hFile);

				MessageBox(hMain,"Klucz licencyjny zostal poprawnie wygenerowany!","Info",MB_ICONINFORMATION);
			}
			else
			{
			MessageBox(hMain,"Nie mozna utworzyc pliku licencyjnego!","Blad!",MB_ICONEXCLAMATION);
			}

			break;

		case KEYGEN_DATA_ERR:

			MessageBox(hMain,"Blad podczas generowania danych licencyjnych, sprawdz nazwe uzytkownika!","Blad!",MB_ICONEXCLAMATION);
			break;

		case KEYGEN_INIT_ERR:

			MessageBox(hMain,"Blad podczas inicjalizacji danych, sprawdz sciezke do pliku projektu!","Blad!",MB_ICONEXCLAMATION);
			break;

		// wszystkie inne bledy obsluguj tutaj
		default:
			MessageBox(hMain,"Wystapil nieokreslony blad podczas generacji danych licencyjnych!","Blad!",MB_ICONEXCLAMATION);

		}

	}
	else
	{
	MessageBox(hMain,"Wpisz poprawna nazwe uzytkownika i sprobuj ponownie.","Nieprawidlowa nazwa uzytkownika!",MB_ICONEXCLAMATION);
	}

	// zwolnij pamiec
	free(lpOut);
}




BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// inicjalizacja glownego okna
		case WM_INITDIALOG :

			// ustaw nazwe okna
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
	lpFn.lpstrFilter = "Projekty PELock-a (*.plk)\0*.plk\0";

	// wyswietl okno dialogowe pozwalajace wybrac uzytkownikowi
	// plik projektu, dla ktorego maja byc generowane klucze licencyjne
	if (GetOpenFileName(&lpFn) != 0)
	{

	// zaladuj biblioteke KEYGEN.dll
	InitializeKeygen();

	// wyswietl glowne okno programu
	DialogBoxA(hInstance, MAKEINTRESOURCE(DLG_MAIN), 0, DlgP);

	}
	return 0;
}
