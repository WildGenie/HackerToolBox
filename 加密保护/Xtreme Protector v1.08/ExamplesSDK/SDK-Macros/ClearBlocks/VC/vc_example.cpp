/******************************************************************************
*
* Example that shows the use of CLEAR_START and CLEAR_END
*
* Note: The code inside a CLEAR region can only be executed once
******************************************************************************/


#include <windows.h>
#include "xprotector.h"


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	int aux = 0, i = 0;

	MessageBox(0,"The following loop will be executed and then deleted from memory","Xtreme-Protector",0);

	CLEAR_START

	for (i = 0; i < 10; i++)
	{

		aux *= 2;
		
	}

	CLEAR_END

	return 0;
}

