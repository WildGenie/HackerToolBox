// This example shows a way how protect some parts of code with encryption
// and lock them for one computer



#include <windows.h>
#include <io.h>
#include "..\..\Inc&Lib\special.h"
#pragma comment (lib,"SPECIAL")


void TraslateToASCII(char* hardware_key, char* HWInformation)
{
	__asm{
        mov  esi, HWInformation
		mov  edi, hardware_key
        lodsd
        call HexWrite32

        lodsd
        call HexWrite32

        lodsd
        call HexWrite32

        lodsd
        call HexWrite32 		
		jmp  endik

HexWrite32:		
        push eax
        shr  eax, 16
        call HexWrite16
        pop  eax
        call HexWrite16
        ret

HexWrite16:
        push ax
        xchg al, ah
        call HexWrite8
        pop  ax
        call HexWrite8
        ret

HexWrite8:
        mov  ah, al
        and  al, 0fh
        shr  ah, 4
        or   ax, 3030h
        xchg al, ah
        cmp  ah, 39h
        ja   a4
a1:
        cmp  al, 39h
        ja   a3
a2:
        stosw
        ret
a3:
        sub  al, 30h
        add  al,'A' - 10
        jmp  a2
a4:
        sub  ah, 30h
        add  ah, 'A' - 10
        jmp  a1

endik:
	}
}


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	char *message = "Encryption blocks example!";
	char* registration_information=(char*)malloc(255*sizeof(char));
	char* HWInformation=(char*)malloc(20*sizeof(char));
	int flag;
	char* unregister_message=(char*)malloc(255*sizeof(char));
	char* hardware_key=(char*)malloc(35*sizeof(char));
	char *first_message="You can buy our product at www....\n\n";
	char *second_message="Please send us your Hardware ID:\n\n";
	char *third_message="Your Hardware ID was copied to clipboard, please paste it to e-mail\n\n";
	char *fourth_message="Now try to create registration key for this project and Hardware ID in SVKP.";
	LPVOID allocated_memory;
	LPVOID locked_mem;


	MessageBox(0,message,"",0);

	SVKP_ENCRYPTED_BLOCK_START		//Start of encrypted block
//This code will encrypted and it will decrypted only if user have correct 
//registration key

		message = "Registered version!";
		MessageBox(0,message,"",0);		//display message box for registered users

	SVKP_ENCRYPTED_BLOCK_END	    //End of encrypted block	
	

//if was registered flag=1  
	if(flag = SVKP_GetRegistrationInformation(registration_information)==0) {
//This is part for unregistered users		
		message = "Unregistered version!";		
//Get Hardware ID
		SVKP_GetHWInfo(HWInformation);
//Prepare message for display		
		TraslateToASCII(hardware_key,HWInformation);
		TraslateToASCII(hardware_key+8,HWInformation+4);
		TraslateToASCII(hardware_key+16,HWInformation+8);
		TraslateToASCII(hardware_key+24,HWInformation+12);
		hardware_key[32]=0x0d;
		hardware_key[33]=0x0d;
		hardware_key[34]=0x00;
		unregister_message=first_message;
		lstrcat(unregister_message,second_message);
		lstrcat(unregister_message,hardware_key);
		lstrcat(unregister_message,third_message);
		lstrcat(unregister_message,fourth_message);
		
//display message		
		MessageBox(0,unregister_message,message,0);

//copy Hardware ID to clipboard
		hardware_key[32]=0x00;
		allocated_memory=GlobalAlloc(0x2002, 0x32);
		locked_mem=GlobalLock(allocated_memory);
		lstrcpy((char*)locked_mem,hardware_key);
		GlobalUnlock(allocated_memory);
		OpenClipboard(NULL);
		EmptyClipboard();
		SetClipboardData(1,allocated_memory);
		CloseClipboard();
	}

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
