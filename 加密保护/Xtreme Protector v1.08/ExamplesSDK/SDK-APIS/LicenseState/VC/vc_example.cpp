/******************************************************************************
*
* Example that shows how to call Xprotector SDK APIs
*
******************************************************************************/


#include <windows.h>
#include "xprotector.h"
#pragma comment (lib,"XprotSDK")



int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{

	
	MessageBox(0,"This example shows the use of Xprotector SDK-APIS in C language","Xtreme-Protector",0);

	switch(CheckLicenseValidation())
	{

		case LICENSE_VALID:
		
			MessageBox(0, "Valid license file. Application REGISTERED","XProtector",0);
			break;
			
		case LICENSE_NOPRESENT:
		
			MessageBox(0, "License File not present. Application NOT registered",
						  "XProtector",0);
			break;

		case LICENSE_INVALID:
		
			MessageBox(0, "Invalid License File. Application NOT registered\nPlease, get a valid license file from www.mywebsite.com",
						  "XProtector",0);
			break;

	
		case LICENSE_BAD_HWID:
		
			MessageBox(0, "This license key is not valid for the current machine\nPlease, get a valid license for your machine",
						  "XProtector",0);

			break;


		case LICENSE_MANIPULATED:
		
			MessageBox(0, "Trial period MANIPULATED turning the clock back or attack detected\nYou need to register this program to run it again",
						  "XProtector",0);

			break;
	
	}
	
	return 0;
}

