/******************************************************************************
*
* Example that shows how to call Xprotector SDK APIs
*
******************************************************************************/


#include <windows.h>
#include "xprotector.h"
#pragma comment (lib,"XprotSDK")


char RegName[100];
char RegOrg[100];
char TempBuffer[256];


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	int aux = 0, i = 0;

	MessageBox(0,"This example shows the use of Xprotector SDK-APIS in C language","Xtreme-Protector",0);

	if (IsRegistered())
	{

		GetLicenseInfo((char*)&RegName, (char*)&RegOrg);
	
		wsprintf((char*)TempBuffer, "Application Registered to: %s - %s (Days left = %i, " \
									 "Executions left = %i)", &RegName, &RegOrg,          \
									 RegisteredGetDaysToExpire(), RegisteredGetExecutionsToExpire());
		MessageBox(0, (char*)TempBuffer,"REGISTERED version",0);

	}
	else
	{
		
		MessageBox(0, "This application needs a key to be executed","Xtreme-Protector",0);
	
	}

	return 0;
}

