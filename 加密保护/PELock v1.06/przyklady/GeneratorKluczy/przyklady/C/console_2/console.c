////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad wykorzystania generatora klucz z aplikacji konsolowej
//
// Biblioteka KEYGEN.lib linkowana jest razem z programem.
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "keygen.h"


HMODULE hKeygen;
FILE *hKey;
char szProjectPath[MAX_PATH],*lpOut;
int iOut,bStatus;

// definicje funkcji generujacej klucze Keygen (keygen.h)
_Keygen KeygenProc;

void main()
{

	// buduj sciezke do pliku projektu, ktory powinien znajdowac sie
	// w katalogu z tym programem
	GetModuleFileName(NULL, szProjectPath, MAX_PATH);
	*(strrchr(szProjectPath, '\\') + 1) = '\0';
	strcat(szProjectPath,"test.plk");

	// zaalokuj pamiec potrzebna na dane klucza
	lpOut = malloc(4096);

	// utworz klucz dla uzytkownika "Jan Kowalski"
	bStatus = Keygen("Jan Kowalski",	// nazwa uzytkownika
			0,			// dodatkowe dane klucza
			NULL,			// identyfikator sprzetowy
			NULL,			// data wygasniecia klucza
			lpOut,			// bufor wyjsciowy na dane klucza
			&iOut,			// rozmiar danych wyjsciowych zostanie tutaj zapisany
			szProjectPath,		// pelna sciezka do pliku projektu
			0);			// flaga okreslajaca, czy plik projektu ma
						// zostac uaktualniony

	// sprawdz zwrocona wartosc
	switch (bStatus)
	{
	case KEYGEN_OK:

		// zapisz dane licencyjne do pliku key.lic
		hKey = fopen("key.lic","wb+");

		fwrite(lpOut,iOut,1,hKey);

		fclose(hKey);

		printf("Klucz licencyjny zostal poprawnie wygenerowany!");
		
		break;

	case KEYGEN_INIT_ERR:

		printf("Blad podczas inicjalizacji, sprawdz plik projektu, czy jest poprawnie ustawiony!");
		break;

	case KEYGEN_DATA_ERR:

		printf("Blad podczas generacji danych rejestracyjnych, sprawdz nazwe uzytkownika!!");
		break;

	default:
		printf("Wystapil nieokreslony blad podczas generowania danych licencyjnych!");
	}


	// zwolnij pamiec
	free(lpOut);
}
