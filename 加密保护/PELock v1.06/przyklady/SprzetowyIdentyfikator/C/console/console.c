////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad uzycia sprzetowego identyfikatora
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned char name[64],hardware_id[64];
unsigned int flag = 0,id;

void main()
{

// odczytaj sprzetowy identyfikator
id = GetHardwareId(hardware_id,64);

DEMO_START

// odczytaj nazwe zarejestrowanego uzytkownika
GetRegistrationName(name,64);

printf("Program zarejestrowany na %s",name);
flag = 1;

DEMO_END

// display hardware ID
if (flag == 0) printf("Wersja demo, przy zakupie programu prosze podac nastepujacy numer %s",hardware_id);
}
