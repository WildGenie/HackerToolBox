/******************************************************************************
*
* Example that shows how to use the License Generator DLL to create personal keys
*
******************************************************************************/


#include <windows.h>
#include <stdio.h>
#include "PasswordGenDll.h"
#pragma comment (lib,"PasswordGenDll.lib")



int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{

	char BufferPass[32];    
	char BuffAux[200];    


	memset(BufferPass, 0, 32);

    GeneratePassword("Arnold", BufferPass);
	
    wsprintf(BuffAux, "Password for Arnold is %s",BufferPass);
   
	MessageBox(NULL, BuffAux, "XProtector", MB_OK);   

	return 0;

}


