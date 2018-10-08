// This example shows a way how protect some parts of code with encryption
//


#include <windows.h>
#include <io.h>
#include "..\..\Inc&Lib\special.h"
#pragma comment (lib,"SPECIAL")


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	char *message = "Encryption blocks example!";
	char* registration_information=(char*)malloc(255*sizeof(char));
	int flag;

	
//this code will decrypted before using and after use removed
//tip: This type of blocks is very good use in initialize part of program
//(load DLL(s), initialize data, fill some special variables and etc.)	
	SVKP_ENCRYPTED_BLOCK_TYPE2_START
	MessageBox(0,message,"",0);
	SVKP_ENCRYPTED_BLOCK_TYPE2_END


	SVKP_ENCRYPTED_BLOCK_START		//Start of encrypted block
//This code will encrypted and it will decrypted only if user have correct 
//registration key
		message = "Registered version!";
		MessageBox(0,message,"",0);		//display message box for registered users

	SVKP_ENCRYPTED_BLOCK_END	    //End of encrypted block	
	
//This code will decrypted before using and encrypted again after use
	SVKP_ENCRYPTED_BLOCK_TYPE1_START
//if was registered flag=1  
	if(flag = SVKP_GetRegistrationInformation(registration_information)==0) {
		//This is part for unregistered users		
		message = "Unregistered version!";		
		MessageBox(0,message,"",0);
	}
	SVKP_ENCRYPTED_BLOCK_TYPE1_END

	return 0;
}

/*Note1: Never use encrypted blocks like this:

	 SVKP_ENCRYPTED_BLOCK_START		//Start of encrypted block
	 
		SaveProject(NameOfProjectFile);

	 SVKP_ENCRYPTED_BLOCK_END	    //End of encrypted block	

Because You will encrypt only jump to function and function's code will not
encrypted. Then is possible for cracker find function and corrected jump. */

/* Note2: Please don't use flags, there are SVKP API functions. Please check examples 
(SVKP_GetRegistrationInformation)
Don't use something like this:			

	registered_flag = 1;
	SVKP_ENCRYPTED_BLOCK_START		//Start of encrypted block
	 
		SaveProject(NameOfProjectFile);
		registered_flag = 0;
	SVKP_ENCRYPTED_BLOCK_END	    //End of encrypted block	

	if(registered_flag == 1) {
	ActionForUnregisteredUsers()
	}

*/

/*Note3: Please don't use something like this -> goto skip_unregistered_part;  

	SVKP_ENCRYPTED_BLOCK_START		//Start of encrypted block
	 
		SaveProject(NameOfProjectFile);
		goto skip_unregistered_part;  
	SVKP_ENCRYPTED_BLOCK_END	    //End of encrypted block	

	ActionForUnregisteredUsers()

skip_unregistered_part:
*/
