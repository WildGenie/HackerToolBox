#include "stdafx.h"
#include "resource.h"

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
// This code will not be run without correct serial number (even if it will be executed)
__declspec(noinline) void ProtectedCode(HWND hParent)
{
	::MessageBox(hParent, L"Protected code successfully executed", L"ProtectedCode()", MB_OK | MB_ICONINFORMATION);
}
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

#define APPEND_FLAG(flag) if ((nStatus & flag) == flag) { _stprintf_s(buf, L"\t%S\r\n", #flag); ::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf); }

void ParseStatus(HWND hDlg, int nStatus)
{
	HWND hStatus = GetDlgItem(hDlg, IDC_EDIT_STATUS);
	SetWindowText(hStatus, L""); // clear

	TCHAR buf[100];
	_stprintf_s(buf, L"VMProtectSetSerialNumber() returned: 0x%08X\r\n", nStatus);
	::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);

	APPEND_FLAG(SERIAL_STATE_FLAG_CORRUPTED);
	APPEND_FLAG(SERIAL_STATE_FLAG_INVALID);
	APPEND_FLAG(SERIAL_STATE_FLAG_BLACKLISTED);
	APPEND_FLAG(SERIAL_STATE_FLAG_DATE_EXPIRED);
	APPEND_FLAG(SERIAL_STATE_FLAG_RUNNING_TIME_OVER);
	APPEND_FLAG(SERIAL_STATE_FLAG_BAD_HWID);
	APPEND_FLAG(SERIAL_STATE_FLAG_MAX_BUILD_EXPIRED);

	int nStatus2 = VMProtectGetSerialNumberState();
	_stprintf_s(buf, L"\r\nVMProtectGetSerialNumberState() returned: 0x%08X\r\n", nStatus2);
	::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);

	// try to read serial number data
	VMProtectSerialNumberData sd = {0};
	BOOL res = VMProtectGetSerialNumberData(&sd, sizeof(sd));
	_stprintf_s(buf, L"\r\nVMProtectGetSerialNumberData() returned: %s\r\n", res ? L"TRUE" : L"FALSE");
	if (res)
	{
		_stprintf_s(buf, L"State = 0x%08X\r\n", sd.nState);
		::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);
		_stprintf_s(buf, L"User Name = %s\r\n", sd.wUserName);
		::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);
		_stprintf_s(buf, L"E-Mail = %s\r\n", sd.wEMail);
		::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);
		_stprintf_s(buf, L"Date of expiration = %04d-%02d-%02d\r\n", sd.dtExpire.wYear, sd.dtExpire.bMonth, sd.dtExpire.bDay);
		::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);
		_stprintf_s(buf, L"Max date of build = %04d-%02d-%02d\r\n", sd.dtMaxBuild.wYear, sd.dtMaxBuild.bMonth, sd.dtMaxBuild.bDay);
		::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);
		_stprintf_s(buf, L"Running time limit = %d minutes\r\n", sd.bRunningTime);
		::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);
		_stprintf_s(buf, L"Length of user data = %d bytes\r\n", sd.nUserDataLength);
		::SendMessage(hStatus, EM_REPLACESEL, 0, (LPARAM)buf);
	}
}

void ProcessSerialNumber(HWND hDlg)
{
	HWND hEdit = GetDlgItem(hDlg, IDC_EDIT_SERIAL);
	int nLen = GetWindowTextLength(hEdit);
	char *pBuf = new char[nLen + 1];
	GetWindowTextA(hEdit, pBuf, nLen + 1);

	int nStatus = VMProtectSetSerialNumber(pBuf);
	delete [] pBuf;

	ParseStatus(hDlg, nStatus);
}

void ShowHWID(HWND hDlg)
{
	int nSize = VMProtectGetCurrentHWID(NULL, 0);
	char *p = new char[nSize];
	VMProtectGetCurrentHWID(p, nSize);
	SetWindowTextA(GetDlgItem(hDlg, IDC_EDIT_HWID), p);
	delete [] p;
}

INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
	case WM_INITDIALOG:
		ShowHWID(hDlg);
		return (INT_PTR)TRUE;

	case WM_COMMAND:
		switch (LOWORD(wParam))
		{
		case IDOK:
		case IDCANCEL:
			EndDialog(hDlg, LOWORD(wParam));
			return (INT_PTR)TRUE;
		case IDC_EXEC_CODE:
			ProtectedCode(hDlg);
			break;
		case IDC_EDIT_SERIAL:
			if (HIWORD(wParam) == EN_CHANGE)
				ProcessSerialNumber(hDlg);
			break;
		}
		break;
	}
	return (INT_PTR)FALSE;
}


int APIENTRY _tWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
	DialogBox(hInstance, MAKEINTRESOURCE(IDD_ABOUTBOX), NULL, About);
	return 0;
}

