#include <windows.h>
#include "resource.h"
#include "../../../Include/c/ZProtectSDK.h"

BOOL OnCommand(HWND hDlg,int pEventID)
{
	switch (pEventID)
	{
	case	IDCANCEL:
		{
			EndDialog(hDlg,IDCANCEL);
		}break;
	case	IDC_BUTTON1:
		{
			Code_Confusion_START
			MessageBox(hDlg,TEXT("Just some information in here!"),TEXT("Information"),MB_OK|MB_ICONINFORMATION);
			Code_Confusion_END
		}break;
	case	IDC_BUTTON3:
		{
			ZProtect_VM_START
				MessageBox(hDlg,TEXT("Just some information in here!"),TEXT("Information"),MB_OK|MB_ICONINFORMATION);
			ZProtect_VM_END
		}break;
	case	IDC_BUTTON7:
		{
			Decode_onExec_START
				MessageBox(hDlg,TEXT("Just some information in here!"),TEXT("Information"),MB_OK|MB_ICONINFORMATION);
			Decode_onExec_END
		}break;
	case	IDC_BUTTON4:
		{
			Code_Elimination_START
				MessageBox(hDlg,TEXT("Just some information in here!"),TEXT("Information"),MB_OK|MB_ICONINFORMATION);
			Code_Elimination_END
		}break;
	case	IDC_BUTTON5:
		{
			Decode_onReg_START
				MessageBox(hDlg,TEXT("Just some information in here!"),TEXT("Information"),MB_OK|MB_ICONINFORMATION);
			Decode_onReg_END
		}break;
	case	IDC_BUTTON6:
		{
			Decode_Section_A_START
				MessageBox(hDlg,TEXT("Just some information in here!"),TEXT("Information"),MB_OK|MB_ICONINFORMATION);
			Decode_Section_A_END
		}break;
	case	IDC_BUTTON2:
		{
			Decode_Section_B_START
				MessageBox(hDlg,TEXT("Just some information in here!"),TEXT("Information"),MB_OK|MB_ICONINFORMATION);
			Decode_Section_B_END
		}break;
	case	IDC_BUTTON8:
		{
			Decode_Section_C_START
				MessageBox(hDlg,TEXT("Just some information in here!"),TEXT("Information"),MB_OK|MB_ICONINFORMATION);
			Decode_Section_C_END
		}break;
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
	DialogBox(hInstance, MAKEINTRESOURCE(IDD_DIALOG1), NULL, DlgProc);
	return 0;
}
