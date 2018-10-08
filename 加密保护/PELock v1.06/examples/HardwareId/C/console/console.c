////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Using hardware id property
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include "..\..\..\pelock.h"

unsigned char hardware_id[64],name[64];
unsigned int flag = 0,id;

void main()
{

// read hardware id
id = GetHardwareId(hardware_id,64);

// to be able to read hardware id, program should contain at least one DEMO_START
// DEMO_END marker
DEMO_START

// get name of registered user
GetRegistrationName(name,64);

printf("Program registered to %s",name);
flag = 1;

DEMO_END

// display hardware ID
if (flag == 0) printf("Evaluation version, please provide this ID %s",hardware_id);
}
