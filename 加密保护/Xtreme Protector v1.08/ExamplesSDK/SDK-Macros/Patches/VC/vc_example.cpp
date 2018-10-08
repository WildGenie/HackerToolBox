/******************************************************************************
*
* Example that shows the use of PATCH_START and PATCH_END
*
* In protection phase, Xprotector will generate the patch.ini file with the
* addresses of all the PATCH_START - PATCH_END macros that you insert in your program.
* If you want to activate your patches, you have to press the "Insert From File" button
* in the patcher dialog.
*
******************************************************************************/


#include <windows.h>
#include "xprotector.h"


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	int aux = 0, i = 0;

	MessageBox(0,"The next patch will be executed 10 times in the following loop","Xtreme-Protector",0);

	for (i = 0; i < 10; i++)
	{
		PATCH_START

		aux *= 2;
		
		PATCH_END
	}
	
	MessageBox(0,"The next loop will be executed inside of a patch, supervised by a DrX guard","Xtreme-Protector",0);

	PATCH_START

	for (i = 0; i < 10; i++)
	{
		aux *= 2;
	}

	PATCH_END

	return 0;
}

