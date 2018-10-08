////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad ustawiania klucza licencyjnego, ktory nie znajduje
// sie w glownym katalogu programu
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned char name[64];
unsigned int flag = 0;

void main()
{

// ustaw klucz licencyjny
SetRegistrationKey("c:\\key.lic");

// marker poczatkowy
DEMO_START

GetRegistrationName(name,64);

printf("Program registered to %s",name);
flag = 1;

// marker koncowy
DEMO_END

if (flag == 0) printf("Evaluation version");
}
