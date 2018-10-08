// C++.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <windows.h>

/*
* Firsr Include Vprotect headerfiles
*/
#include "..\..\..\sdk\C++\Virtualize_Sdk.h"
#include "..\..\..\sdk\C++\VP_License_Sdk.h"

/*
* link Vprotect Licenselib
*/
#pragma comment (lib, "VP_License_Sdk.lib")

/*
* our softverion define
*/
#define V_Standard_Edition 1
#define V_Ultimate_Edition 2

BOOL GetSoftVersion()
{
	VP_SDK_VIRTUALIZE

	if (VP_Sdk_IsRegister(VP_SDK_INDEX_ISREGISTER))
	{
		DWORD VersionLevel= VP_Sdk_GetCustomDword(VP_SDK_INDEX_GETCUSTOMDWORD);
		wprintf(L"VersionLevel Value:%u .\n",VersionLevel);

		switch (VersionLevel)
		{
		case V_Standard_Edition:
			{
				wprintf(L"This is Standard_Edition.\n");
			}break;
			
		case V_Ultimate_Edition:
			{
				wprintf(L"This is Ultimate_Edition.\n");
			}break;

		default:
			wprintf(L"Unknow Version maybe do something?\n");
		}

		return TRUE;
	}else
	{
		wprintf(L"This is Demo Version.\n");
	}
	return FALSE;
}

int _tmain(int argc, _TCHAR* argv[])
{
	GetSoftVersion();
	getchar();
	return 0;
}

