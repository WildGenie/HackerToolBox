//
// This example shows a way of using of external constant for fragment's decryption
//

#include <windows.h>
#include <io.h>
#include "include\asprotect.h"


typedef void (__stdcall *TFunction) ();
typedef void (__stdcall *TSetKeyProc) (IN char   *Key, IN DWORD  KeySize);


void __stdcall Fake();
void __stdcall FakeSetKeyProc( char   *Key, DWORD  KeySize);

TFunction	DecryptProc = (void*) Fake,
			EncryptProc = (void*) Fake;
TSetKeyProc SetKeyProc  = (void*) FakeSetKeyProc;

//----------------------------------------------------------------------
// Fake functions for debugging
//
void __stdcall Fake(){}
void __stdcall FakeSetKeyProc( char   *Key, DWORD  KeySize){}
//----------------------------------------------------------------------
// ASProtect will call these two functions for a setting
// of pointers on functions for encryption and decryption of
// fragments with REG_CRYPT_BEGIN and REG_CRYPT_END
//----------------------------------------------------------------------
void __declspec(dllexport) __stdcall GetDecryptProc(void* DProc){

	DecryptProc = DProc;
}
//----------------------------------------------------------------------
//
//
void __declspec(dllexport) __stdcall GetEncryptProc(void* DProc){

	EncryptProc = DProc;
}
//----------------------------------------------------------------------
// This function gets pointer on function for setting of external key
//----------------------------------------------------------------------
void __declspec(dllexport) __stdcall SetDecryptionKey(TSetKeyProc DProc){

  SetKeyProc = DProc;
}
//----------------------------------------------------------------------
int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
	int				f = -1;
	int				fsize;
	unsigned char 	*fbuffer = NULL;
	char			*message = "Unregistered version !";
	
	
	if ((f = open("test.bin", 0)) != -1) 
    	{  
		
		// Read a file with a constant for decryption
		
		fsize = filelength(f); 	
		fbuffer = malloc(fsize);
		read(f, fbuffer, fsize);

		// Set a constatnt to ASProtect
		   
		SetKeyProc(fbuffer, fsize);

		// This is an example of dynamic decryption/encryption
		// of fragments

		// After a call of function DecryptProc all fragments will be decrypted


		DecryptProc();		

		REG_CRYPT_BEGIN
		MessageBeep(1);
		REG_CRYPT_END

		if (f != -1) close(f);
			
		REG_CRYPT_BEGIN
		message = "Registered version !";
		REG_CRYPT_END

		// After a call of function EncryptProc all fragments will be encrypted again !!!

		EncryptProc();
	   
		if (fbuffer != NULL) free(fbuffer);

    	}
	
	
	MessageBox(0,message,"",0);
	
	return 0;
}




