// VP.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#include "GenKey.h"
#include "VProtect.h"
#include <iphlpapi.h>
#pragma comment(lib,"Iphlpapi.lib") 
#include "..\\detour\\detours.h"

#ifdef _MANAGED
#pragma managed(push, off)
#endif

FARPROC  OLD_My_GetAdaptersInfo;

VOID PatchIt();
void ShellHook();

typedef DWORD (WINAPI* IphlpapiGetAdaptersInfo)(PIP_ADAPTER_INFO pAdapterInfo, PULONG pOutBufLen  );


DWORD WINAPI My_GetAdaptersInfo(
					  PIP_ADAPTER_INFO pAdapterInfo, PULONG pOutBufLen 
					  )
{

	DWORD ret;
	IphlpapiGetAdaptersInfo  _OLD_My_GetAdaptersInfo=(IphlpapiGetAdaptersInfo)OLD_My_GetAdaptersInfo;
	ret=_OLD_My_GetAdaptersInfo(pAdapterInfo,pOutBufLen);
	PatchIt();
	return ret;
}

VOID UnHook ()
{
	DetourTransactionBegin();
	DetourUpdateThread(GetCurrentThread());

	DetourDetach(&(PVOID&)OLD_My_GetAdaptersInfo, My_GetAdaptersInfo ) ;

	DetourTransactionCommit();
}
VOID Hook ()
{
	DetourRestoreAfterWith();
	DetourTransactionBegin();
	DetourUpdateThread(GetCurrentThread());


	OLD_My_GetAdaptersInfo=GetProcAddress(LoadLibrary("Iphlpapi.dll"),"GetAdaptersInfo");
	DetourAttach(&(PVOID&)OLD_My_GetAdaptersInfo, My_GetAdaptersInfo) ;


	DetourTransactionCommit();
}

void Write(LPVOID lpAddress,LPCVOID lpBuffer,SIZE_T nSize )
{
	DWORD   dwProtect,dwWriteByte;
	VirtualProtect ( (LPVOID)lpAddress, nSize, PAGE_READWRITE, &dwProtect );
	WriteProcessMemory( GetCurrentProcess(), lpAddress, lpBuffer, nSize, &dwWriteByte ) ;
}

BOOL IsPatchIt,IsPatchRsaD,IsPatchRsaN;
DWORD lpShellEP,lpShellHook;
DWORD dwStr;
BYTE dwOldValue[6];

VOID PatchIt()
{
     
	if (IsPatchIt==FALSE)
	{
		DWORD lpData;
        lpData=(DWORD)GetModuleHandle("VP_Sdk.dll")+0x12B450;
		memcpy(&lpShellEP,(const void *)lpData,4);
		if (lpShellEP!=0)
		{
			UnHook();
			IsPatchIt=TRUE;
            lpShellHook=lpShellEP+0x3DFD;

			DWORD dwReadByte;
			ReadProcessMemory(GetCurrentProcess(),(LPCVOID)lpShellHook,&dwOldValue,6,&dwReadByte);
			BYTE dwNewValue[6]={0x90, 0x90, 0x90, 0x90, 0x90, 0x90};
			dwNewValue[0]=0xE8;
			*((PDWORD)(&(dwNewValue[1])))=(DWORD)ShellHook-DWORD(lpShellHook)-5;
			Write((LPVOID)lpShellHook,&dwNewValue,6);
		}
	}
	
}


void __declspec(naked) ShellHook()
{
	__asm
	{
		inc dword ptr ds:[esp]
		pushad
		mov dwStr,ebp
	}
	if (IsBadCodePtr((FARPROC)dwStr)==0)
	{
		if (IsPatchRsaD==FALSE)
		{
			if (lstrcmp(OriginalRsaD,(LPCSTR)dwStr)==0)
			{
				__asm mov IsPatchRsaD,TRUE
				lstrcpyA((LPSTR)dwStr,NewRsaD);
				
			}
		}
		if (IsPatchRsaN==FALSE)
		{
			if (lstrcmp(OriginalRsaN,(LPCSTR)dwStr)==0)
			{
				__asm mov IsPatchRsaN,TRUE
				lstrcpyA((LPSTR)dwStr,NewRsaN);
                Write((LPVOID)lpShellHook,&dwOldValue,6);
			}
		}
	}
	__asm
	{
		popad
		mov edx,dword ptr ds:[ecx+0x238]
	    ret
	}
}

void VP_Sdk()
{
	Hook();
}

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
	if (ul_reason_for_call == DLL_PROCESS_ATTACH)
	{
		DisableThreadLibraryCalls(hModule);
        VP_Sdk();
		return MyLoad();
	}
	else if (ul_reason_for_call == DLL_PROCESS_DETACH)
	{
		MyFree();
	}
	return TRUE;
}

#ifdef _MANAGED
#pragma managed(pop)
#endif

