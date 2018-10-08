// Sample3.cpp : Defines the entry point for the application.
//

#include "stdafx.h"


BOOL __stdcall FakeExternalKey(LPBYTE pKey, PDWORD dwKeySize){return FALSE;};
eXP_bFnPtr g_DecryptFN = (eXP_bFnPtr)FakeExternalKey;

//Here after you have the decryption key from your registration skeme call decrypt
int APIENTRY WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPSTR lpCmdLine,int nCmdShow)
{
	MessageBox(HWND_DESKTOP, "WinMain gets executed!", "Sample3",MB_OK|MB_ICONINFORMATION);

	//CALL THIS TO DECRYPT ALL ENCRYPTED BLOCKS
	if((DWORD)g_DecryptFN!=(DWORD)FakeExternalKey){
		if(!g_DecryptFN()){
			MessageBox(HWND_DESKTOP, "Failed to decrypt code fragments!", "Sample3",MB_OK|MB_ICONINFORMATION);
			return 0;
		}
	}
	else{
		MessageBox(HWND_DESKTOP, "Please protect the app with eXPressor!", "Sample3",MB_OK|MB_ICONINFORMATION);
		return 0;
	}

	CODE_CRYPT_BEGIN1
	for(int i=0;i<10;i++)
		Beep(i*100,50);
	MessageBox(HWND_DESKTOP, "First encrypted code block gets executed", "Sample3",MB_OK|MB_ICONINFORMATION);
	CODE_CRYPT_END1

	char msg[255];
	i+=340;
	wsprintf(msg,"A simple basic addition operation between encrypted blocks \ni = %i",i);
	MessageBox(HWND_DESKTOP, msg, "Sample3",MB_OK|MB_ICONINFORMATION);

	CODE_CRYPT_BEGIN1
	for(i=10;i>0;i--)
		Beep(i*100,50);
	MessageBox(HWND_DESKTOP, "Second encrypted code block gets executed", "Sample3",MB_OK|MB_ICONINFORMATION);
	CODE_CRYPT_END1

	return 0;
}

//---------------------------------------------------------------------
//  This function will be called by eXPressor (before exe is executed)
//	if you have code blocks encrypted with external key;
//	You can call g_DecryptFN() after WinMain gets executed to decrypt
//	those pieces of code; before this you must supply the decryption key
//	which must be implemented in your registration skeme.
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall GetDecrypt_FnPtr(eXP_bFnPtr DecryptFN)
{
	MessageBox(HWND_DESKTOP, "Stub calls to set Decryption function pointer!",
		"Sample3",
		MB_OK|MB_ICONINFORMATION);
	g_DecryptFN = DecryptFN;
}

//---------------------------------------------------------------------
//  This function will be called by eXPressor (before exe is executed)
//	if you have code blocks encrypted with external key.
//	Here you must supply the decryption key	which must be implemented 
//	in your registration skeme; in this sample we will use a trivial one
//	just for demonstration.
//	RET FALSE IF YOU DON'T HAVE THE KEY FOR AVOIDING FURTHER PROCESSING
//---------------------------------------------------------------------
DLL_CPP_EXP BOOL __stdcall  SetExternalKey(LPBYTE pKey, PDWORD dwKeySize)
{
	int				f = -1;
	int				fsize = 0;
	unsigned char 	*fbuffer = NULL;

	//file with a password inside sample3 dir
	//compute filepath
	char exepath[MAX_PATH],exedir[MAX_PATH];
	char *exename = exepath + GetModuleFileName(0, exepath, MAX_PATH) - 1;
	while (*exename != '\\') 
		exename--;
	exename++;
	int dirlen = exename-exepath;
	memcpy(&exedir[0],&exepath[0],dirlen);
	exedir[dirlen+1] = 0;
	strcpy(&exedir[dirlen],"pass.txt");

	if ((f = open(exedir,0)) != -1) {  		
		fsize = filelength(f); 	
		fbuffer = (unsigned char*)malloc(fsize);
		read(f, fbuffer, fsize);	   
	}
	//NUL TERMINATE THE STRING TO LOOK GOOD IN MESSAGEBOX!!
	fbuffer[fsize] = '\0';

	//THE MAX PASSWORD LEN MUST BE 512 BYTES LONG
	memcpy(pKey,fbuffer,min(fsize,MAX_EXTERNAL_KEY_LEN));
	*dwKeySize = fsize;

	char msg[512];
	wsprintf(msg,"We send external password for code blocks decryption!\nPass : \"%s\"\nSize : %i",fbuffer,fsize);
	MessageBox(HWND_DESKTOP,msg , "Sample3 - eXPressor calls get Decryption key",
		MB_OK|MB_ICONINFORMATION);

	if(f!=-1)
		close(f);
	if(fbuffer != NULL) 
		free(fbuffer);
	return TRUE;
}


