//==============================================================================
//   This is an example of :
//
//   1. setting of marks from reg_crypt_begin.inc and reg_crypt_end.inc files
//   2. receiving of a registration information
//   3. storing a registration key in external place
//      and sending it to ASProtect
//==============================================================================

#include <windows.h>
#include "include\asprotect.h"

char*		UserName		= "";
char		Key[]			= "0DiHRlJy1pjFfs8rzXXy0tDovY4KBMysnWvh5G4+51xnqIJRq8XRi6jt/N7IrN2ykJ3xVssuK668qtBDpBj3di77ohnMqLb7IRakmPvrkU2wWBd55a74vdNzQBFvMX29MgDwG/GyHCCyQL1a3Awh21hU6B63kFkJSUVxnEAUFSW4=";


//----------------------------------------------------------------------
// You can set a registration key to ASProtect!
// ASProtect calls this function before a checking of registration key
//----------------------------------------------------------------------
LPSTR __declspec(dllexport) __stdcall SetRegistrationKey(){
	return (LPSTR)Key;
}
//------------------------------------------------------------------------------
// ASProtect will call this procedure after a verification of regstration key
//------------------------------------------------------------------------------
void __declspec(dllexport) __stdcall GetRegistrationInformation(char* NewUserName){

	UserName = NewUserName;
}
//----------------------------------------------------------------------

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow){

	
		if (lstrlen(UserName) > 0)
		{
			REG_CRYPT_BEGIN
			MessageBox(0,UserName,"Owner",0);
			REG_CRYPT_END
		}
		else MessageBox(0,"Ops", "Unregistered version",MB_ICONSTOP);
		
	return 0;
}
