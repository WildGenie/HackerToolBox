
#include <windows.h>
#include "resource.h"

#define RELEASE


typedef void (*TProcedure) ();

char*	UserName			= NULL;
char*	LocalHardwareID		= NULL;

int		TrialDaysTotal		= -1,
		TrialDaysLeft		= -1;

#ifdef RELEASE

void __declspec(dllexport) ExecuteTrial();
TProcedure	ASProtectRunApplication = ExecuteTrial;

#else

void __declspec(dllexport) ExecuteApplication();
TProcedure	ASProtectRunApplication = ExecuteApplication;

#endif


//----------------------------------------------------------------------
// Try to get a registration information.
// ASProtect will set this information after a checking of a registraion 
// key
//----------------------------------------------------------------------
void __declspec(dllexport) __stdcall GetRegistrationInformation(char* NewUserName){

	UserName = NewUserName;
}
//----------------------------------------------------------------------
// ASProtect will set a trial information after a checking of a registraion 
// key
//----------------------------------------------------------------------
void __declspec(dllexport) __stdcall GetTrialDays(int Total, int Left){
	
	TrialDaysTotal = Total;
	TrialDaysLeft  = Left;
}
//---------------------------------------------------------------------
BOOL RegisterString(LPSTR pszKey,LPSTR pszValue,LPSTR pszData)
{

    HKEY hKey;
    DWORD dwDisposition;

    //
    // Create the key, if it exists it will be opened
    //


   if (ERROR_SUCCESS != 
        RegCreateKeyEx(
          HKEY_CURRENT_USER,       // handle of an open key 
          pszKey,                  // address of subkey name 
          0,                       // reserved 
          NULL,                    // address of class string 
          REG_OPTION_NON_VOLATILE, // special options flag 
          KEY_ALL_ACCESS,           // desired security access 
          NULL,                       // address of key security structure 
          &hKey,                   // address of buffer for opened handle  
          &dwDisposition))            // address of disposition value buffer 
    {
        return FALSE;
    }

    //
    // Write the value and it's data to the key
    //

    if (ERROR_SUCCESS != 
        RegSetValueEx(
            hKey,                 // handle of key to set value for  
            pszValue,             // address of value to set 
            0,                     // reserved 
            REG_SZ,                 // flag for value type 
            pszData,             // address of value data 
            strlen(pszData) ))      // size of value data 
    {
        
        RegCloseKey(hKey);
        return FALSE;
    }

    //
    // Close the key
    //
    
    RegCloseKey(hKey);
    
    return TRUE;
}
//---------------------------------------------------------------------
//  This procedure will be called by ASProtect for
//  setting of hardware key
//---------------------------------------------------------------------
void __declspec(dllexport) __stdcall GetHardwareID(char*	HardwareID){
	
    LocalHardwareID = HardwareID;
	
}
//---------------------------------------------------------------------
BOOL APIENTRY RegDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{

	char	buffer[1024];
	int		Size;

	switch (msg) {


		case WM_INITDIALOG:

			SetDlgItemText(hwnd, IDC_HARDWAREKEY_EDIT, LocalHardwareID);

			return TRUE;


        case WM_COMMAND:
            switch (LOWORD(wParam)) {

				case IDOK:
	
					Size = GetDlgItemText(hwnd, IDC_REGNUM_EDIT, buffer, 1024);
					

					if (Size > 0) 
					{
						buffer[Size] = 0;
						if (RegisterString("SOFTWARE\\test","Key",(LPSTR)buffer))
							MessageBox(hwnd,"Thank you for registration! Please restart the application.","OK",MB_OK);
					}
                    EndDialog(hwnd, IDOK);
                    break;

				
				case IDC_PASTE:

					SendMessage(GetDlgItem(hwnd,IDC_REGNUM_EDIT), WM_PASTE, 0,0);
					break;

				case IDC_SEND:
					buffer[0] = 0;
					lstrcat(buffer,"mailto:support@aspack.com?subject=Hardware%20ID%20for%20Advanced%20Application%201.0&body=Hardware%20ID is%20:%20");
					lstrcat(buffer,LocalHardwareID);
					lstrcat(buffer,"%0d%0aName%20for%20registration%20:");
                    ShellExecute((HWND)GetDesktopWindow(), "open", buffer, NULL, NULL, SW_SHOWNORMAL);
                    break;


                case IDCANCEL:
                    EndDialog(hwnd, IDCANCEL);
                    break;

            }

            break;
    }

    return FALSE;
}
//---------------------------------------------------------------------
BOOL APIENTRY AppDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{

	char	buf[100];

	
	switch (msg) {

		case WM_INITDIALOG:

			if (lstrlen(UserName) > 0)
			{
				
				ShowWindow(GetDlgItem(hwnd,IDC_REG_BUTTON), SW_HIDE);
				wsprintf(buf, "Registered to: %s", UserName);
				SetDlgItemText(hwnd, IDC_REG_TEXT, buf);
			}
			else
			{
				wsprintf(buf, "You have %d day(s) left", TrialDaysLeft);
				SetDlgItemText(hwnd, IDC_REG_TEXT, buf);
			} 
    
            return TRUE;


        case WM_COMMAND:
            switch (LOWORD(wParam)) {

				case IDC_REG_BUTTON:

					DialogBox(NULL,(LPSTR)MAKEINTRESOURCE(IDD_REG_DIALOG),hwnd,(WNDPROC)RegDlgProc);
					break;

                case IDOK:

                    EndDialog(hwnd, IDOK);
                    break;

                case IDCANCEL:
                    EndDialog(hwnd, IDCANCEL);
                    break;
            }

            break;
    }

    return FALSE;
}
//------------------------------------------------
//  This procedure will be called by ASProtect if:
//  1. Trial doesn't expire
//  2. Application was registered
//------------------------------------------------
void __declspec(dllexport) ExecuteApplication(){
	
    DialogBox(NULL,(LPSTR)MAKEINTRESOURCE(IDD_APP_DIALOG),NULL,(WNDPROC)AppDlgProc);
}
//---------------------------------------------------------------------
BOOL APIENTRY TrialDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{

	switch (msg) {

        case WM_COMMAND:
 
			switch (LOWORD(wParam)) {


				case IDC_REG_BUTTON:

					ShowWindow(hwnd, SW_HIDE);
					DialogBox(NULL,(LPSTR)MAKEINTRESOURCE(IDD_REG_DIALOG),hwnd,(WNDPROC)RegDlgProc);
					EndDialog(hwnd, IDOK);
					break;

				case IDC_BUYNOW:
					
					ShellExecute((HWND)GetDesktopWindow(), "open", "http://www.aspack.com/register.htm", NULL, NULL, SW_SHOWNORMAL);
					break;


                case IDOK:

                    EndDialog(hwnd, IDOK);
                    break;

                case IDCANCEL:
                    EndDialog(hwnd, IDCANCEL);
                    break;
            }

            break;
    }

    return FALSE;
}
//---------------------------------------------------------------------
//  This procedure will be called by ASProtect if:
//  1. Evaluation period of application has expired
//---------------------------------------------------------------------
void __declspec(dllexport) ExecuteTrial(){
	
    DialogBox(NULL,(LPSTR)MAKEINTRESOURCE(IDD_TRIAL_DIALOG),NULL,(WNDPROC)TrialDlgProc);
	
}
//---------------------------------------------------------------------
//  This procedure will be called by ASProtect
//  and ASProtect will pass the pointer to dispatcher
//---------------------------------------------------------------------
void __declspec(dllexport) __stdcall GetRunApplicationFunction(TProcedure Ptr){

  ASProtectRunApplication = Ptr;
}
//---------------------------------------------------------------------
int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow){



    MessageBox( 0,"This example shows the work in trial mode. Don't forget to protect the example in order to see the work of ASProtect API !","Information",MB_ICONINFORMATION );

	// This is a call of ASProtect's dispatcher

	ASProtectRunApplication();

	return 0;
}
