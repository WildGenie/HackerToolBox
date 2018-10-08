// pec2hooks_fastimport.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#include "pec2hooks_fastimport.h"

BOOL APIENTRY DllMain( HANDLE hModule, 
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

#define HOOK_NAME L"Fast/Manual Import v1.01 - Custom GetProcAddress implementation. Binary search, hints used, forwarders handled. Use for undocumented win9x kernel ordinal 37 imports."
#define HOOK_AUTHOR L"Bitsum Technologies"

DWORD WINAPI GetHookName(PWCHAR pwszName, DWORD dwBufSize)
{
	if(dwBufSize<=wcslen(HOOK_NAME))
	{
		if(pwszName)
		{
			*pwszName=NULL;
		}				
		return wcslen(HOOK_NAME)+1;
	}
	else if(!dwBufSize)
	{
		return wcslen(HOOK_NAME)+1;
	}
	wcscpy(pwszName,HOOK_NAME);
	return wcslen(pwszName);
}


DWORD WINAPI GetHookAuthor(PWCHAR pwszAuthor, DWORD dwBufSize)
{
	if(dwBufSize<=wcslen(HOOK_AUTHOR))
	{
		if(pwszAuthor)
		{
			*pwszAuthor=NULL;
		}				
		return wcslen(HOOK_AUTHOR)+1;
	}
	else if(!dwBufSize)
	{
		return wcslen(HOOK_AUTHOR)+1;
	}
	wcscpy(pwszAuthor,HOOK_AUTHOR);
	return wcslen(pwszAuthor);
}