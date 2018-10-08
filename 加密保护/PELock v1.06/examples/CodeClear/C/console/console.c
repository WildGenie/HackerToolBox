////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Example of how to use CLEAR_START and CLEAR_END macros
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned int i,j;

void initialize_app()
{

// code between CLEAR_START and CLEAR_END will be encrypted, and
// once executed it will be erased from the memory
CLEAR_START

i = 1;
j = 2;

CLEAR_END

}


void main()
{

// initialize application
initialize_app();


// code between CRYPT_START and CRYPT_END will be encrypted
// in protected file
CRYPT_START

printf("Hello world!");

CRYPT_END
}
