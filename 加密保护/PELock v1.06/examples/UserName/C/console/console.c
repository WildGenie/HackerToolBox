////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Example of how to read registered user name from the license key
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

// read registered user name
GetRegistrationName(name,64);

printf("Program registered to %s",name);
flag = 1;

DEMO_END

if (flag == 0) printf("Evaluation version");
}
