////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Key expiration date
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

SYSTEMTIME lpSysTime;

void main()
{
// to be able to read key expiration date, program should contain at least one DEMO_START
// DEMO_END marker
DEMO_START

if (GetKeyExpirationDate(&lpSysTime) == 1)
{
printf("Key expiration date %lu-%lu-%lu",lpSysTime.wDay,lpSysTime.wMonth,lpSysTime.wYear);
}
else
{
printf("Full version");
}


DEMO_END

}
