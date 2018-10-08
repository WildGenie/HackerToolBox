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
INITCOMMONCONTROLSEX icex;
OPENFILENAME lpFn;
HWND hDatePicker;
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
// generuj klucze licencyjne
//
////////////////////////////////////////////////////////////////////////////////

void GenerateKey(HWND hMain)
{
unsigned char szUserName[256],szHardwareId[256],szLicenseKey[256],*lpOut;
unsigned int iUserName,iHardwareId,iAdditional[4];
unsigned int bUpdate,bStatus,iOut,bTrans,iUserData,lpWrite;
HANDLE hFile;
SYSTEMTIME lpSysTime,*lpTime;

	// zaalokuj pamiec na dane klucza
	lpOut = malloc(4096);

	// wyczysc pamiec
	memset(lpOut,0,4096);


	// odczytaj nazwe uzytkownika, dla ktorego ma zostac wygenerowany klucz
	iUserName = GetDlgItemText(hMain,IDC_USER_NAME,szUserName,256);

	if (iUserName != 0)
	{
		// odczytaj sprzetowy identyfikator klucza
		iHardwareId = GetDlgItemText(hMain,IDC_HARDWARE_ID,szHardwareId,16+1);

		// odczytaj dodatkowe dane klucza
		iAdditional[0] = GetDlgItemInt(hMain,IDC_ADDITIONAL_1,&bTrans,FALSE);
		iAdditional[1] = GetDlgItemInt(hMain,IDC_ADDITIONAL_2,&bTrans,FALSE);
		iAdditional[2] = GetDlgItemInt(hMain,IDC_ADDITIONAL_3,&bTrans,FALSE);
		iAdditional[3] = GetDlgItemInt(hMain,IDC_ADDITIONAL_4,&bTrans,FALSE);

		// dodatkowe dane klucza "spakuj" do DWORDa
		iUserData = (iAdditional[3] << 24) | (iAdditional[2] << 16) | (iAdditional[1] << 8) | (iAdditional[0]);

		// odczytaj flage aktualizacji projektu, jesli opcja zalaczona to uzytkownik
		// zostanie dodany do listy zapisanej w pliku projektu
		bUpdate = IsDlgButtonChecked(hMain,IDB_UPDATE_PROJECT);


		// odczytaj date wygasniecia klucza
		if ( SendMessage(hDatePicker,DTM_GETSYSTEMTIME,0,(LPARAM)&lpSysTime) == GDT_VALID)
		{
		lpTime = &lpSysTime;
		}
		else
		{
		lpTime = NULL;
		}


		// generuj dane klucza
		bStatus = KeygenProc(	szUserName,	// nazwa uzytkownika
					iUserData,	// dodatkowe dane klucza
					szHardwareId,	// sprzetowy identyfikator klucza
					lpTime,		// data wygasniecia klucza
					lpOut,		// bufor wyjsciowy na dane klucza
					&iOut,		// rozmiar klucza (wskaznik na wartosc DWORD)
					lpProjectFile,	// pelna sciezka do pliku projektu
					bUpdate);	// flaga aktualizacji projektu


		// sprawdz zwrocona wartosc
		switch (bStatus)
		{
		case KEYGEN_OK:

			memset(&lpFn,0, sizeof(OPENFILENAME) );

			// kopiuj domyslna nazwe dla klucza licencyjnego
			strcpy(szLicenseKey,"key.lic");

			lpFn.lStructSize = sizeof(OPENFILENAME);
			lpFn.nMaxFile = 256;
			lpFn.lpstrFile = szLicenseKey; 
			lpFn.Flags = OFN_HIDEREADONLY;
			lpFn.lpstrFilter = "Klucz PELock (key.lic)\0key.lic\0";

			// pozwol wybrac uzytkownikowi, gdzie ma byc zapisany plik
			// z danymi licencyjnymi
			if (GetSaveFileName(&lpFn) != 0)
			{
				// utworz nowy plik (nadpisuj istniejace pliki)
				hFile = CreateFile(szLicenseKey,\
							GENERIC_READ | GENERIC_WRITE,\
							0,\
							NULL,\
							CREATE_ALWAYS,\
							FILE_ATTRIBUTE_NORMAL,\
							NULL);

				if (hFile != INVALID_HANDLE_VALUE)
				{
					// zapisz dane licencyjne do nowo utworzonego pliku
					if (WriteFile(hFile,lpOut,iOut,&lpWrite,NULL) != 0)
					{
					MessageBox(hMain,"Klucz licencyjny zostal poprawnie wygenrowany!","Info",MB_ICONINFORMATION);
					}
					else
					{
					MessageBox(hMain,"Blad podczas zapisywania danych licencyjnych do pliku!","Blad!",MB_ICONEXCLAMATION);
					}

				// zamknij plik
				CloseHandle(hFile);

				}
				else
				{
				MessageBox(hMain,"Nie mozna utworzyc pliku!","Blad!",MB_ICONEXCLAMATION);
				}
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
		// inicjalizacja glownego okna dialogowego
		case WM_INITDIALOG :

			// ustaw nazwe glownego okna
			SetWindowTextA(hDlg, "PELock Keygen Test");

			// utworz kontrolke pozwalajaca odczytac date wygasniecia klucza
			hDatePicker = CreateWindowEx(	0,
							DATETIMEPICK_CLASS,
							"DateTime",
							WS_BORDER|WS_CHILD|WS_VISIBLE|DTS_SHOWNONE,
							5,150,200,25,
							hDlg,
							NULL,
							hInst,
							NULL);

			// wylacz kontrolke
			SendMessage(hDatePicker,DTM_SETSYSTEMTIME,GDT_NONE,0);

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

	// zainicjalizuj biblioteke Comctl32.dll, potrzebna do utworzenia
	// kontrolki pozwalajacej odczytac date
	icex.dwSize = sizeof(icex);
	icex.dwICC = ICC_DATE_CLASSES;

	InitCommonControlsEx(&icex);

	memset(&lpFn,0, sizeof(OPENFILENAME) );

	lpFn.lStructSize = sizeof(OPENFILENAME);
	lpFn.nMaxFile = 512;
	lpFn.lpstrFile = lpProjectFile; 
	lpFn.Flags = OFN_HIDEREADONLY;
	lpFn.lpstrFilter = "Pliki projektu PELock-a (*.plk)\0*.plk\0";

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
