////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad jak odczytac date wygasniecia klucza
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

SYSTEMTIME lpSysTime;

void main()
{
// zeby moc skorzysac z funkcji systemu licencyjnego PELock'a, nalezy
// umiescic w kodzie programu markery DEMO_START/DEMO_END
DEMO_START

if (GetKeyExpirationDate(&lpSysTime) == 1)
{
printf("Data wygasniecia klucza %lu-%lu-%lu",lpSysTime.wDay,lpSysTime.wMonth,lpSysTime.wYear);
}
else
{
printf("Klucz bez ograniczen czasowych");
}


DEMO_END

}
