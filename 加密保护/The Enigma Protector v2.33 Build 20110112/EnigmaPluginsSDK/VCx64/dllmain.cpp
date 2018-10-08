// dllmain.cpp : Defines the entry point for the DLL application.


#include "stdafx.h"


//-----------------------------------------------------------------------------------------------------------------------------------------

//using namespace std;

// This define/pragma is used to export the function from the DLL, otherwise GetProcAddress() cannot find it. Previously used a def file, but
// it doesn't work when there are different dll file names in Release/Debug builds (using extern "C" does not work).
//		http://msdn.microsoft.com/en-us/library/bb687850.aspx

#define EXPORT comment(linker, "/EXPORT:"__FUNCTION__"="__FUNCDNAME__)

//-----------------------------------------------------------------------------------------------------------------------------------------

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
	switch (ul_reason_for_call)
	{
		case DLL_PROCESS_ATTACH:
		case DLL_THREAD_ATTACH:
		case DLL_THREAD_DETACH:
		case DLL_PROCESS_DETACH:

			break;
	}
	return TRUE;
}

//-----------------------------------------------------------------------------------------------------------------------------------------
// Function returns a wide string that will be shown in about column in Enigma Miscellaneous - Plugins

wchar_t* Enigma_Plugin_About()
{
	#pragma EXPORT

	return L"Print error message if not registered";
}

//-----------------------------------------------------------------------------------------------------------------------------------------
// Function returns a wide string that will be shown after user clicks on the plugin in Enigma Miscellaneous - Plugins
// It may contain, for example, usage instructions

wchar_t* Enigma_Plugin_Description()
{
	#pragma EXPORT

	return L"If app is not registered print error message to stderr and exit";
}

//-----------------------------------------------------------------------------------------------------------------------------------------
// This function is calling when the protected file is being initialized
// when main program is not initialized yet

// Just write a very simple plugin, that will handle Plugin_OnInit and call there EP_RegLoadAndCheckKey to verify registration. 
// If it returns false you will write to console anything you want.

void Enigma_Plugin_OnInit()
{
	#pragma EXPORT

	// Place your code here
}

//-----------------------------------------------------------------------------------------------------------------------------------------
// This function is calling when the protected file is initilized,
// main program encrypted and ready for execution

void Enigma_Plugin_OnFinal()
{
	#pragma EXPORT

	// Place your code here
}
