////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad pobierania nazwy zarejestrowanego uzytkownika
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned char name[64];
unsigned int flag = 0;

void main()
{
DEMO_START

GetRegistrationName(name,64);

printf("Program registered to %s",name);
flag = 1;

DEMO_END

if (flag == 0) printf("Evaluation version");
}
