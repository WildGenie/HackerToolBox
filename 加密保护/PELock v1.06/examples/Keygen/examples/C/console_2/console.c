////////////////////////////////////////////////////////////////////////////////
//
// PELock, Bartosz Wojcik
//
// Example of how to use keygen library to generate license keys
//
// KEYGEN.dll statically linked
//
////////////////////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include "keygen.h"


HMODULE hKeygen;
FILE *hKey;
char szProjectPath[MAX_PATH],*lpOut;
int iOut,bStatus;

void main()
{
	// build project path name
	GetModuleFileName(NULL, szProjectPath, MAX_PATH);
	*(strrchr(szProjectPath, '\\') + 1) = '\0';
	strcat(szProjectPath,"test.plk");

	// allocate memory for output buffer
	lpOut = malloc(4096);

	// generate key data
	bStatus = Keygen("test user",		// user name
			0,			// additional key data
			NULL,			// hardware id
			NULL,			// key expiration date
			lpOut,			// output buffer
			&iOut,			// output buffer size (out)
			szProjectPath,		// project path
			0);			// update project flag

	switch (bStatus)
	{
	case KEYGEN_OK:

		// save license key data
		hKey = fopen("key.lic","wb+");

		fwrite(lpOut,iOut,1,hKey);

		fclose(hKey);

		printf("Key file successfully generated!");
		
		break;

	case KEYGEN_INIT_ERR:

		printf("Error while initialization, please check your project file!");
		break;

	case KEYGEN_DATA_ERR:

		printf("Error while generating license key data!");
		break;

	default:
		printf("Unexpected error while key generation!");
	}


	// release memory
	free(lpOut);
}
