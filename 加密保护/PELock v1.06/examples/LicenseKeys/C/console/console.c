////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Example of how to use DEMO_START and DEMO_END macros
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned int flag = 0;

void main()
{

// code between DEMO_START and DEMO_END will be encrypted
// in protected file and will not be available without license key
DEMO_START

printf("Hello world from full version of my software!");

flag = 1;

DEMO_END
}
