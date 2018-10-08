// This example shows a way how use SVKP's API functions
//


#include <windows.h>
#include <io.h>
#include "..\..\Inc&Lib\special.h"
#pragma comment (lib,"SPECIAL")


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	char *message = "SVKP's API functions example!";
	char* registration_information=(char*)malloc(255*sizeof(char));
	int flag;
	
	MessageBox(0,message,"",0);
	
	SVKP_KillDebugger();		//now we will check for debuggers

	SVKP_LockKeyboard();		//then we will lock keyboard

	//if was registered flag=1  
	if(flag = SVKP_GetRegistrationInformation(registration_information)==0) {
//This is part for unregistered users		
		message = "Unregistered version!";		
		MessageBox(0,message,"",0);
	}
	else {
		message = "Registration data from key:";
		MessageBox(0,registration_information,message,0);     
	}
	
	SVKP_UnLockKeyboard();		//now we will unlock keyboard
	return 0;
}

