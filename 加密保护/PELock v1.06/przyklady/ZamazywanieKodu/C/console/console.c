////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad wykorzystania markerow CLEAR_START i CLEAR_END
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned int i,j;

void initialize_app()
{

// kod pomiedz markerami CLEAR_START i CLEAR_END bedzie zaszyfrowany po
// zabezpieczeniu pliku, po jego uruchomieniu zostanie zdeszyfrowany i
// wykonany, a nastepnie wymazany z pamieci
CLEAR_START

i = 1;
j = 2;

CLEAR_END

}


void main()
{

// inicjalizuj aplikacje
initialize_app();


// kod pomiedzy markerami CRYPT_START i CRYPT_END bedzie zaszyfrowany
CRYPT_START

printf("Hello world!");

CRYPT_END
}
