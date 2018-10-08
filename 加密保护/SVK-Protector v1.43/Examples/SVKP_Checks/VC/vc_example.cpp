// This example shows a way how use Alive Checks in your application
//


#include <windows.h>
#include <io.h>
#include "..\..\Inc&Lib\special.h"
#pragma comment (lib,"SPECIAL")


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	char *message = "Now I will try run some checks!";

	
	
	MessageBox(0,message,"Alive Checks example.",0);
	
//Don't forget use these checks random or in not very offen used procedures!
	SVKP_ALIVE_CHECK_1
	SVKP_ALIVE_CHECK_2

	MessageBox(0,"SVKP protection was not removed!","SVKP is alive!",0);

	
	return 0;
}

