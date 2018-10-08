
#include <stdio.h>
#include <windows.h>

#include "../../../PluginSDK.h"
#include "PluginDef.h"

PLUGIN_CONTEXT context;

DWORD WINAPI GetPluginType()
{
	return NORMAL | NO_PROTECT;
}

void WINAPI GetPluginBinName(char* pNameBuf, DWORD Size)
{
	sprintf_s(pNameBuf, Size, "PluginBin.dll");
}

void WINAPI Initialize(BYTE* pImageBuf, pfnAddPluginHook fnAddPluginHook, pfnGetPluginFuncRVA fnGetPluginFuncRVA, SHELL_CONTEXT* Context)
{
	sprintf_s(context.Text, "Test");
}


DWORD WINAPI GetPluginContextSize()
{
	return PLUGIN_CONTEXT_SIZE;
}
void WINAPI GetPluginContext(void* pContext)
{
	memcpy(pContext, &context, PLUGIN_CONTEXT_SIZE);
}
