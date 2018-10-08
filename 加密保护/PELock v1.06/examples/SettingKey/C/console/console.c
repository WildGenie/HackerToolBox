////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Setting license key from external file (placed, somewhere else than
// protected application directory)
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned char name[64];
unsigned int flag = 0;

void main()
{

// set license key
SetRegistrationKey("c:\\key.lic");

DEMO_START

// get name of registered user
GetRegistrationName(name,64);

printf("Program registered to %s",name);
flag = 1;

DEMO_END

if (flag == 0) printf("Evaluation version");
}
