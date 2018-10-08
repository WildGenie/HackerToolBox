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
char Custom[1024];
char TempBuffer[256];


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	int DaysLeft;
	SYSTEMTIME systime;

	
	if (IsRegistered())
	{

		DaysLeft = DateKeyDaysLeft();

		DateKeyExpirationDate(&systime);
	
		wsprintf((char*)TempBuffer, "This application Expires on: %i/%i/%i\nNumber of Days Left = %i", 
				 systime.wDay, systime.wMonth, systime.wYear, DaysLeft);

		MessageBox(0, (char*)TempBuffer,"XProtector",0);

	}
	else
	{
		
		MessageBox(0, "Application not registered","DEMO version",0);
	
	}

	return 0;
}

