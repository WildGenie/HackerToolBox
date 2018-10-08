#include <windows.h>
#include "Resource.h"
#include "VMProtectSDK.h"

LRESULT CALLBACK  MainHandler(HWND, UINT, WPARAM, LPARAM);
 
int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
    DialogBox(GetModuleHandle(NULL), (LPCTSTR)IDD_DIALOG, NULL, (DLGPROC)MainHandler);

	return 0;
}

LRESULT CALLBACK MainHandler(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{

    VMProtectBegin("Test marker");
    switch (message)
    {

    case WM_INITDIALOG:
        
        return TRUE;

    case WM_COMMAND:

        if (LOWORD(wParam) == IDCANCEL) 
        {
			EndDialog(hDlg, LOWORD(wParam));
            return TRUE;
        }

        if (LOWORD(wParam) == IDC_BUTTON_CHECKPASSWORD)
        {
 			char buf[100]; 

			GetDlgItemText(hDlg, IDC_EDIT, buf, 100);

            if (atoi (buf) % 17 == 13) 
  				MessageBox(hDlg, VMProtectDecryptStringA("Correct password"), "Information", MB_ICONINFORMATION + MB_OK);
			else
			{    
				MessageBox(hDlg, VMProtectDecryptStringA("Incorrect password"), "Error", MB_ICONERROR + MB_OK);
				SetFocus(GetDlgItem(hDlg, IDC_EDIT));
			}
		}
	}

	VMProtectEnd();
	return FALSE;
}
