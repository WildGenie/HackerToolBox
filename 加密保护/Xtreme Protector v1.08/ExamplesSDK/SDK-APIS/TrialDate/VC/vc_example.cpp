/******************************************************************************
*
* Example that shows how to call Xprotector SDK APIs
*
******************************************************************************/


#include <windows.h>
#include "..\..\..\..\include\C\xprotector.h"
#pragma comment (lib,"XprotSDK")



int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	
	char TempBuffer[256];
	 
	SYSTEMTIME ExpirationDate;
	
	MessageBox(0,"This example shows the use of Xprotector SDK-APIS in C language","Xtreme-Protector",0);

	if (IsDemoDateExpired())
	{
	
		MessageBox(0, "This application has expired","DEMO version",0);

	}
	else
	{
		
		DemoExpirationDate(&ExpirationDate);

		wsprintf((char*)TempBuffer, "This application will expired in %i/%i/%i", ExpirationDate.wDay, ExpirationDate.wMonth, ExpirationDate.wYear);
		MessageBox(0, (char*)TempBuffer,"DEMO version",0);
	
	}

	return 0;
}

