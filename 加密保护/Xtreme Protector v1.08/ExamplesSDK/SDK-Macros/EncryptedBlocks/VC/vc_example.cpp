/******************************************************************************
*
* Example that shows the use of ENCODE_START and ENCODE_END
*
* Note: The ENCODE_END macro, re-encrypt the ENCODEd region again. You shouldn´t
* use a "goto" instruction inside of a ENCODEd region and jump outside of this region,
* because the region will stay decrypted. 
******************************************************************************/


#include <windows.h>
#include "xprotector.h"


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	int aux = 0, i = 0;

	MessageBox(0,"The following loop will be decrypted, executed and encrypted again","Xtreme-Protector",0);

	_asm int 3

	ENCODE_START

	for (i = 0; i < 10; i++)
	{

		aux *= 2;
		
	}

	ENCODE_END

	return 0;
}

