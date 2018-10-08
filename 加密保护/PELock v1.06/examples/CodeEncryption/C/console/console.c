////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Example of how to use CRYPT_START and CRYPT_END macros
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

void main()
{

// code between CRYPT_START and CRYPT_END will be encrypted
// in protected file
CRYPT_START

printf("Hello world!");

CRYPT_END
}
