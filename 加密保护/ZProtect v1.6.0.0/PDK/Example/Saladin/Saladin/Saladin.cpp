// Saladin.cpp : 定义 DLL 应用程序的入口点。
//

#include "stdafx.h"


BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
    return TRUE;
}

void	__stdcall ZPCP_GetPluginInfo(PPARG_GETINFO pArgInfo)
{
	strcpy(pArgInfo->m_lpName,"萨拉丁插件");
	strcpy(pArgInfo->m_lpVer,"v0.1");
	strcpy(pArgInfo->m_lpAuthor,"Lifeengines");
	strcpy(pArgInfo->m_lpDesc,"插件演示，不保证功能稳定！");
}

void	__stdcall ZPCP_Init(void*)
{
	int pV = ZPPC_GetCfgIntValue("abcTest");
	pV = 3;
}

void	__stdcall ZPCP_Exit(void*)
{
	ZPPC_SetCfgIntValue("abcTest",2);
}