/******************************************************************************
*
* Example that shows the use of REGISTERED_START and REGISTERED_END
*
* Note: In an unprotected environment, the compiled program will behave as
* a registered application
*
******************************************************************************/


#include <windows.h>
#include "xprotector.h"


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	int aux = 0, i = 0, Registered = 0;

	MessageBox(0,"The following loop will only be decrypted and executed if the application is registered","Xtreme-Protector",0);

	REGISTERED_START

	for (i = 0; i < 10; i++)
	{
		aux *= 2;
	}
	
	Registered = 1;		// Set special flag to be used in another blocks of code

	REGISTERED_END

	if (!Registered)
	{
		MessageBox(0,"Loop cannot be executed in DEMO version","Xtreme-Protector",0);
	}
	else
	{
		MessageBox(0,"Loop executed in registered application","Xtreme-Protector",0);
	}

	return 0;
}

