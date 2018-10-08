//////////////////////////////////////////////////////////
//	This is a sample plugin for using with Stud_PE
//	you may modify this project as you wish
//	the release .dll has only 2kb of code
//
//	ver:		1.1
//	date:		20 March 2005
//	coder:		CGSoftLabs
//	URL:		http://itimer.home.ro
//////////////////////////////////////////////////////////
#include <windows.h>
#include "exports.h"
#include "sample.h"

#define PLUGIN_NAME "Sample plugin"

/////////////////////////////////////////////////////////////////////////////
//This function is called from Stud_PE when user runs the plugin
//Params :
//		hMainDlg:	HWND of Stud_PE window
//		szFname:	File loaded in Stud_PE
//		lpReserved: Stud_PE passes 'Stud' (0x53747564) as the value
//		lpParam:	NULL passed, for future use
/////////////////////////////////////////////////////////////////////////////
DWORD DoMyJob(HWND hMainDlg, PCHAR szFname, DWORD lpReserved, LPVOID lpParam)
{	
	// Write your main code here
	MessageBox(NULL,"Sample plugin called",PLUGIN_NAME,MB_OK|MB_ICONINFORMATION);
	return 1;
}

/////////////////////////////////////////////////////////////////////////////
//This function is called from Stud_PE to retrive the plugin name
/////////////////////////////////////////////////////////////////////////////
LPSTR LoadDll()
{
	return PLUGIN_NAME;
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
	switch(fdwReason)
	{
		case DLL_PROCESS_ATTACH:
		break;

		case DLL_THREAD_ATTACH:
		break;

		case DLL_THREAD_DETACH:
		break;
		
		case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}


