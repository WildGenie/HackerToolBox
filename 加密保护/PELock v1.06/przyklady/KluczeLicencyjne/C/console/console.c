////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad uzycia makr DEMO_START i DEMO_END
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned int flag = 0;

void main()
{

// kod pomiedzy markerami DEMO_START i DEMO_END bedzie zaszyfrowany
// w zabezpieczonym pliku i bez klucza licencyjnego, nie zostanie
// wyswietlony komunikat
DEMO_START

printf("Hello world!");

flag = 1;

DEMO_END
}
