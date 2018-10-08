////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Przyklad uzycia makr CRYPT_START i CRYPT_END
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned int flag = 0;

void main()
{

// kod pomiedzy markerami CRYPT_START i CRYPT_END bedzie zaszyfrowany
// w zabezpieczonym pliku
CRYPT_START

printf("Hello world!");

CRYPT_END
}
