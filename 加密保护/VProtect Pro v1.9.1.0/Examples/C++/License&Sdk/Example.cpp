#include <windows.h>
#include "resource.h"

//包含Vprotect Sdk头文件
//Include VProtect Sdk HeadFile
#include "..\..\..\sdk\C++\Virtualize_Sdk.h"
#include "..\..\..\sdk\C++\VP_License_Sdk.h"

BOOL Test_GetHardId(HWND HMain)
{
	VP_SDK_VIRTUALIZE

	char *PHardId = new char[256];
	ZeroMemory(PHardId,256);

	DWORD Len = VP_Sdk_GetHardWareIdA(VP_SDK_INDEX_GETHARDWAREIDA,PHardId);
	if (Len)
	{
		SetDlgItemTextA(HMain,IDC_HARDID,PHardId);
	}

	delete []PHardId;

	return Len;
}

BOOL Test_GetUserName(HWND HMain)
{
	VP_SDK_VIRTUALIZE

	char *PUserName = new char[256];
	ZeroMemory(PUserName,256);

	DWORD Len = VP_Sdk_GetUserNameA(VP_SDK_INDEX_GETUSERNAMEA,PUserName);
	if (Len)
	{
		SetDlgItemTextA(HMain,IDC_HARDID,PUserName);
	}

	delete []PUserName;

	return Len;
}

BOOL Test_RegDeCode(HWND HMain)
{
	//使用了注册解码SDK不能和其他加密SDK嵌套
	//RegDeCode Sdk Cannot Uses With Other Sdk

	if (VP_Sdk_IsRegister(VP_SDK_INDEX_ISREGISTER))
	{
		VP_SDK_REGDECODE_START
		MessageBoxW(HMain,L"Reg DeCode Modal A \n Just Run In Register Version",L"VPROTECT",64);
		VP_SDK_REGDECODE_END
	}
	else
	{
		MessageBoxW(HMain,L"Current Is Not Register Version",L"VPROTECT",64);
	}

	VP_SDK_REGDECODE_START
		MessageBoxW(HMain,L"Reg DeCode Modal B \n Just Run In Register Version",L"VPROTECT",64);
	VP_SDK_REGDECODE_END
}

BOOL OnCommand(HWND hDlg,int pEventID)
{
	VP_SDK_MUTATION

	switch (pEventID)
	{

	case ID_ISREG:
		{
			if (VP_Sdk_IsRegister(VP_SDK_INDEX_ISREGISTER))
			{
				MessageBoxW(hDlg,L"This Is Register Version",L"About",64);
			}
			else
			{
				MessageBoxW(hDlg,L"This Is Demo Version",L"About",64);
			}
		}
		break;

	case ID_GETHARDID:
		{
			return Test_GetHardId(hDlg);
		}
		break;

	case ID_GETUSERNAME:
		{
			return Test_GetUserName(hDlg);
		}
		break;
		
	case ID_REGDECODE:
		{
			return Test_RegDeCode(hDlg);
		}
		break;

	case IDCANCEL:
		{
			EndDialog(hDlg,IDCANCEL);
		}
		break;
	}
	return TRUE;
}

INT_PTR CALLBACK DlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
	case WM_INITDIALOG:
		return (INT_PTR)TRUE;
	case WM_COMMAND:
		return OnCommand(hDlg,LOWORD(wParam));
	}
	return (INT_PTR)FALSE;
}


int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPTSTR    lpCmdLine,
                     int       nCmdShow)
{
	DialogBox(hInstance, MAKEINTRESOURCE(IDD_VPROTECT), NULL, DlgProc);
	return 0;
}
