/******************************************************************************
*
* Example that shows how to call Xprotector SDK APIs
*
******************************************************************************/


#include <windows.h>
#include "xprotector.h"
#pragma comment (lib,"XprotSDK")


char HwIDbuff[32];
char TempBuffer[256];


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	int aux = 0, i = 0;

	
	MessageBox(0,"This example shows the use of Xprotector SDK-APIS in C language","Xtreme-Protector",0);

	_asm int 3

    GetHardwareID(HwIDbuff);

	wsprintf((char*)TempBuffer, "Hardware ID = %s", HwIDbuff);
	MessageBox(0, (char*)TempBuffer,"Xtreme-Protector",0);

	if (ValidateHardwareID(HwIDbuff))
	{

		MessageBox(0,"Generated HW ID is valid","Xtreme-Protector",0);
	}
	else
	{
		MessageBox(0,"Generated HW ID is INVALID","Xtreme-Protector",0);
	}

	return 0;
}

