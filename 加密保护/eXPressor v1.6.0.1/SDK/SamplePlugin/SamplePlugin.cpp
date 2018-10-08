// SamplePlugin.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"

#define PLUGIN_API extern "C" __declspec(dllexport)
PLUGIN_API void PluginMain();

HANDLE g_HModule = 0;

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
		{
			//STORE THE IMAGEBASE FOR LATER USAGE
			g_HModule = hModule;
			//TEST TO SEE DLL INITIALIZATION
			Beep(500,300);
		}
	//WE DON'T SUPPORT THIS:
	//case DLL_THREAD_ATTACH:
	//case DLL_THREAD_DETACH:
	//case DLL_PROCESS_DETACH:
		break;
    }
    return TRUE;
}
/////////////////////////////////////////////////////////////////////////////////
//THE EXPORTED FUNCTION MUST HAVE THIS NAME, SO IT CAN BE FOUND BY THE LOADER
PLUGIN_API void PluginMain()
{
	//YOU CAN USE HERE PLAIN API, AVOID MFC, CRT WHICH INSERTS A LOT OF GARBAGE AT DllMAin
	//BEFORE REACHING YOUR CODE
	//ALSO AVOID FUNCTIONS WHICH REFEERS YOU PLUGIN LIKE GetModuleHandle,GetProcAddress Or
	//OpenFile to READ YOUR PLUGIN; IT IS NOT ON THE HARDDRIVE AND WINDOWS WON'T FIND IT
	MessageBox(0,"The  PluginMain() function invoked","SamplePlugin", MB_ICONINFORMATION);
}