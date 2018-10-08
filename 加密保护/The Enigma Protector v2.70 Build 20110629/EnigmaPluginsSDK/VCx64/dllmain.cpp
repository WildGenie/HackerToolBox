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

bool Enigma_Plugin_OnSaveKey(BYTE* ARegName, int ARegNameLen, BYTE* ARegKey, int ARegKeyLen)
{
	#pragma EXPORT

	// This function is calling when protected file is trying to save registration information.
	// Here you may save registration name and key to own place that is not supported
	// by main feature of Enigma Protector.

	// Note, ARegNameLen and ARegKeyLen contains amount of byte of Name and Key buffer. For handling of WideString
	// and UNICODE registrtation scheme you should divide this value on 2 to get actual length of the string.


	// This function should return FALSE if it is not saved registration information (or it is not
	// needed to save it) and TRUE if function succeeded. Note, standard saving routine will not be called if
	// this function returned TRUE.
	return false;
}

bool Enigma_Plugin_OnLoadKey(BYTE** ARegName, int* ARegNameLen, BYTE** ARegKey, int* ARegKeyLen)
{
	#pragma EXPORT

    // This function is calling when protected file is trying to load registration information.
    // Here you may load registration name and key from own place that is not supported
    // by main feature of Enigma Protector.

    // Note, you have to allocate buffer for ARegName and ARegKey manually (somewhere in global space),
    // and return the pointers to these buffers.
    // ARegNameLen and ARegKeyLen should contain amount of byte of Name and Key strings. For handling of WideString
    // and UNICODE registrtation scheme you should multiply length of the string on 2.


    // This function should return FALSE if it is not loaded registration information (or it is not
    // needed to load it) and TRUE if function succeeded. Note, standard loading routine will not be called if
    // this function returned TRUE.
    return false;
}

// !!! Enigma Protector - Online Solutions ONLY !!!
bool Enigma_Plugin_OnShowActivationDialog()
{
	#pragma EXPORT

    // This plugin function is being called all times when Enigma Protector
    // needs to show standard Activation Dialog designed in ONLINE SOLUTIONS -
    // Activation Dialog panel

    // If this function returns FALSE, the standard Activation Dialog will be shown.
    // If function returns TRUE, this means the plugin succeeded, custom activation dialog
    // had been shown and standard Activation Dialog will now be shown.
    return false;
}

bool Enigma_Plugin_OnShowRegistrationDialog()
{
	#pragma EXPORT

    // This plugin function is being called all times when Enigma Protector
    // needs to show standard Registration Dialog designed in REGISTRATION FEATURES -
    // Registration Dialog panel

    // If this function returns FALSE, the standard Registration Dialog will be shown.
    // If function returns TRUE, this means the plugin succeeded, custom registration dialog
    // had been shown and standard Registration Dialog will now be shown.
    return false;
}

// Constants for AMessageID for Enigma_Plugin_OnShowMessage
const int  MESSAGEID_REGISTRATION_VALIDKEY = 1;
const int  MESSAGEID_REGISTRATION_INVALIDKEY = 2;
const int  MESSAGEID_REGISTRATION_KEYEXPIRATION = 3;
const int  MESSAGEID_CHECK_ANTIDEBUGGER = 4;
const int  MESSAGEID_CHECK_CONTROLSUM = 5;
const int  MESSAGEID_CHECK_STARTUPPASSWORD = 6;
const int  MESSAGEID_CHECK_FILENAME = 7;
const int  MESSAGEID_CHECK_DISKDRIVE = 8;
const int  MESSAGEID_CHECK_EXECUTEDCOPIES = 9;
const int  MESSAGEID_CHECK_USERLANGUAGE = 10;
const int  MESSAGEID_CHECK_EXTERNALFILES = 11;
const int  MESSAGEID_CHECK_EXECUTEDPROCESSES = 12;
const int  MESSAGEID_CHECK_LOADEDDRIVERS = 13;
const int  MESSAGEID_CHECK_INSTALLEDSERVICES = 14;
const int  MESSAGEID_CHECK_WINDOWSVERSION = 15;
const int  MESSAGEID_CHECK_VIRTUALIZATIONTOOLS = 16;
const int  MESSAGEID_CHECK_ADMINPRIVILEGES = 17;
const int  MESSAGEID_TRIAL_EXECUTIONS = 18;
const int  MESSAGEID_TRIAL_DAYS = 19;
const int  MESSAGEID_TRIAL_DATE = 20;
const int  MESSAGEID_TRIAL_DATETILLDATE = 21;
const int  MESSAGEID_TRIAL_EXECUTIONTIME = 22;
const int  MESSAGEID_TRIAL_REMINDER = 23;
const int  MESSAGEID_TRIAL_TIMECONTROL = 24;

bool Enigma_Plugin_OnShowMessage(int AMessageID)
{
	#pragma EXPORT

    // This plugin function is being called all times when Enigma Protector
    // needs to show any information message. See manual for detailed information

    // If this function returns FALSE, the message which is set in Enigma Protector
    // will be shown, otherwise it will be supressed.
    return false;
}
