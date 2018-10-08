
#include <stdio.h>
#include <windows.h>
#include "../../../PluginSDK.h"
#include "../../../../SDK/C/SESDK.h"
#include "../Plugin/PluginDef.h"

DWORD g_dwImageBase;

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, PLUGIN_CONTEXT* PluginContext)
{
	g_dwImageBase = (DWORD)hinstDLL;
	__try
	{
		_asm hlt
	}
	__except(1)
	{
		if(SECheckProtection())
		{
			MessageBox(NULL, PluginContext->Text, PluginContext->Text, 0);
		}
	}
	return TRUE;
}

int WINAPI MyMessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType)
{
	SE_PROTECT_START
	MessageBox(NULL, "Hello World!", "Plugin", 0);
	SE_PROTECT_END
}