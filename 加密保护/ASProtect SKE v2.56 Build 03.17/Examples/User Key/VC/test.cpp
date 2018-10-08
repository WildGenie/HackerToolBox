// test.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "resource.h"
#include <io.h>

#include "include/aspr_api.h"
#include "include/asprotect.h"

#pragma comment(lib,"include/aspr_ide.lib")

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
        int             f = -1;
        int             fsize;
        unsigned char   *fbuffer = NULL;
        char            *message = "Unregistered version !";


        if ((f = open("test.bin", 0)) != -1)
        {

                // Read a file with a constant for decryption

                fsize = filelength(f);
                fbuffer = (unsigned char*)malloc(fsize);
                read(f, fbuffer, fsize);

                // Set a constatnt to ASProtect

				if (SetUserKey( (char*)fbuffer, (DWORD)fsize ) == TRUE)
				{

					// This is an example of fragments decryption/encryption

					if (f != -1) close(f);

					REG_CRYPT_BEGIN2
					message = "Registered version !";
					REG_CRYPT_END2

					if (fbuffer != NULL) free(fbuffer);
				}

        }


        MessageBox(0,message,"",0);

        return 0;
}


