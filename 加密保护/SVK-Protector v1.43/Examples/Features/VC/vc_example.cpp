// This example shows a way how protect some parts of code with features 
//


#include <windows.h>
#include <io.h>
#include "..\..\Inc&Lib\special.h"
#pragma comment (lib,"SPECIAL")


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	char *message = "Features example!";
	char* registration_information=(char*)malloc(255*sizeof(char));
	int flag;

	
	
	MessageBox(0,message,"Now I will try run some features!",0);
	
	SVKP_ENCRYPTED_FEATURE1_START 		//Start of feature 1
//this code will encrypted and it will decrypted only if user have correct
//registration key with this feature unlocked

		MessageBox(0,"Feature 1 is unlocked in license!","Message for registered users!",0);		//display message box for registered users

	SVKP_ENCRYPTED_FEATURE1_END         //end of feature 1


	
	
//if was registered flag=1  
	if(flag = SVKP_GetRegistrationInformation(registration_information)==0) {
//This is part for unregistered users		
		message = "Unregistered version!";		
		MessageBox(0,message,"",0);
	}

//action for users with Feature 2 activated
	SVKP_ENCRYPTED_FEATURE2_START 

		MessageBox(0,"Feature 2 is unlocked in license!","Message for registered users!",0);		//display message box for registered users
	
	SVKP_ENCRYPTED_FEATURE2_END
	
//is possible select more than one part of code for one feature
	SVKP_ENCRYPTED_FEATURE1_START

		MessageBox(0,"Feature 1 second part of code!","Message for registered users!",0);		//display message box for registered users

	SVKP_ENCRYPTED_FEATURE1_END
	
	return 0;
}

