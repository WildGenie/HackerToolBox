//---------------------------------------------------------------------------
#include <vcl.h>
#include <windows.h>
#pragma hdrstop
//---------------------------------------------------------------------------
//   Important note about DLL memory management when your DLL uses the
//   static version of the RunTime Library:
//
//   If your DLL exports any functions that pass String objects (or structs/
//   classes containing nested Strings) as parameter or function results,
//   you will need to add the library MEMMGR.LIB to both the DLL project and
//   any other projects that use the DLL.  You will also need to use MEMMGR.LIB
//   if any other projects which use the DLL will be performing new or delete
//   operations on any non-TObject-derived classes which are exported from the
//   DLL. Adding MEMMGR.LIB to your project will change the DLL and its calling
//   EXE's to use the BORLNDMM.DLL as their memory manager.  In these cases,
//   the file BORLNDMM.DLL should be deployed along with your DLL.
//
//   To avoid using BORLNDMM.DLL, pass string information using "char *" or
//   ShortString parameters.
//
//   If your DLL uses the dynamic version of the RTL, you do not need to
//   explicitly add MEMMGR.LIB as this will be done implicitly for you
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void* lpReserved)
{
        return 1;
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

extern "C" __declspec( dllexport ) wchar_t* Enigma_Plugin_About()
{
        // Function returns a wide string that will be shown in about column in Enigma Miscellaneous - Plugins
        return L"Plugin short description";
}

extern "C" __declspec( dllexport ) wchar_t* Enigma_Plugin_Description()
{
        // Function returns a wide string that will be shown after user clicks on the plugin in Enigma Miscellaneous - Plugins
        // It may contain, for example, usage instructions
        return L"Plugin wide description";
}

extern "C" __declspec( dllexport ) __stdcall void Enigma_Plugin_OnInit()
{
        // This function is calling when the protected file is being initialized
        // when main program is not initialized yet
}

extern "C" __declspec( dllexport ) __stdcall void Enigma_Plugin_OnFinal()
{
        // This function is calling when the protected file is initilized,
        // main program encrypted and ready for execution
}

extern "C" __declspec( dllexport ) __stdcall bool Enigma_Plugin_OnSaveKey(byte* ARegName, int ARegNameLen, byte* ARegKey, int ARegKeyLen)
{
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

extern "C" __declspec( dllexport ) __stdcall bool Enigma_Plugin_OnLoadKey(byte** ARegName, int* ARegNameLen, byte** ARegKey, int* ARegKeyLen)
{
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
extern "C" __declspec( dllexport ) __stdcall bool Enigma_Plugin_OnShowActivationDialog()
{
        // This plugin function is being called all times when Enigma Protector
        // needs to show standard Activation Dialog designed in ONLINE SOLUTIONS -
        // Activation Dialog panel

        // If this function returns FALSE, the standard Activation Dialog will be shown.
        // If function returns TRUE, this means the plugin succeeded, custom activation dialog
        // had been shown and standard Activation Dialog will now be shown.
        return false;
}

extern "C" __declspec( dllexport ) __stdcall bool Enigma_Plugin_OnShowRegistrationDialog()
{
        // This plugin function is being called all times when Enigma Protector
        // needs to show standard Registration Dialog designed in REGISTRATION FEATURES -
        // Registration Dialog panel

        // If this function returns FALSE, the standard Registration Dialog will be shown.
        // If function returns TRUE, this means the plugin succeeded, custom registration dialog
        // had been shown and standard Registration Dialog will now be shown.
        return false;
}

extern "C" __declspec( dllexport ) __stdcall bool Enigma_Plugin_OnShowMessage(int AMessageID)
{
        // This plugin function is being called all times when Enigma Protector
        // needs to show any information message. See manual for detailed information

        // If this function returns FALSE, the message which is set in Enigma Protector
        // will be shown, otherwise it will be supressed.
        return false;
}

//---------------------------------------------------------------------------
 