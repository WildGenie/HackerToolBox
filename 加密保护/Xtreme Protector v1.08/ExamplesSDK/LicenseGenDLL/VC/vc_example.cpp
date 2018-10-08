/******************************************************************************
*
* Example that shows how to use the License Generator DLL to create personal keys
*
******************************************************************************/


#include <windows.h>
#include <stdio.h>
#include "LicenseGenDll.h"
#pragma comment (lib,"LicenseGenDll.lib")

void CreateLicenseFile(char *NameDir);


#define SIZE_XPROT_KEY 4096

char KeyAux[SIZE_XPROT_KEY];        


int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{

	int SizeKey;

    // create a permanent key. Permanent keys doesn't have Expiration days or executions.
    // All the messages are related to temporal keys, so they should be NULL too

    SizeKey = CreateLicenseKey("Arnold Lee", "Arnold Corp", "Arnold's custom data", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, &KeyAux);

    CreateLicenseFile("Arnold Lee (Permanent Key)");

    // create a temporal key. With 1 day and 5 executions

    SizeKey = CreateLicenseKey("Bruce Biss", "ATOP corp", "Bruce's custom data", NULL, NULL, 1, 5, NULL, "Expired Key", "No more days left!", \
					  "No more executions left!", &KeyAux);

    CreateLicenseFile("Bruce Biss (Temporal Key)");

	return 0;

}


/*****************************************************************************
* CreateLicenseFile
*
*  Create a license key file for a particular user
*
* Inputs
*  NameDir: Directory where to store the generated key
* 
* Outputs
*  None
*
* Returns
*  None
******************************************************************************/

void CreateLicenseFile(char *NameDir)
{

	FILE * hFileKey;
	char CurrentDir[1024], NewDir[1024], NameKey[1024];


	// create directory where to store the key
    
    GetCurrentDirectory(1024, (char *)&CurrentDir);
    wsprintf((char *)&NewDir, "%s\\%s", &CurrentDir, NameDir);
    CreateDirectory((const char *)&NewDir, NULL);

    // get full path + name of key to generate

    wsprintf((char *)&NameKey, "%s\\%s", &NewDir, "LicenseKey.key");

    // create specific key
    
	hFileKey = fopen((const char *)&NameKey,"wb+");

	fwrite(&KeyAux, SIZE_XPROT_KEY, 1, hFileKey);

	fclose(hFileKey);

}
