// keygen.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "resource.h"
#include "include\aspr_keygen.h"

#define MAX_LOADSTRING                                  100
#define RegistrationKeyGenerateName             "RegistrationKeyGenerate"

typedef DWORD (__stdcall *ASPRegistrationKeyGenerate)(IN OUT PARAMS *Params);

HINSTANCE						KeyGenDll;
ASPRegistrationKeyGenerate		RegKeyGenerate;

//---------------------------------------------------------------------

// Source Code Template, KeyGen v0.01
BOOL GenerateKey( LPSTR* KeyStr, LPSTR NameStr, DWORD& Res )
{
        PARAMS  P;

        memset(&P, 0, sizeof(PARAMS));

    // Registration name

    P.RegName = NameStr;

    // Mode number (1..15)

    P.ModeID  = 2;

    // Expiration date

    P.ExpirationDate.Day   = 0;
    P.ExpirationDate.Month = 0;
    P.ExpirationDate.Year  = 0;

    // Constant for encryption

    P.EncryptionConst = 699935518;

    // HardwareID

    P.HardwareID      = "";

    // Signature size in bits

    P.SignatureBits   = 96;

    // Constants from project file

    P.C1 = 
     "AC08B45461D28EB";
    P.C3 = 
     "A93A5FB8C78D04F1";
    P.C6 = 
     "26D6BB434014649375231C68A655B81D314AEAF3CE32C6DC8BD"\
     "CBCB9EEDC61EBA3C4A2119685E22205B782C88BFAF21FE98D4"\
     "474FBDB1AFA539B05F09EF60DDF5BA8224161942B9582D37DD"\
     "D624A97C373E5BB33BFC2335A674E4839D72253BA62B97F0B3"\
     "6BCA5B4001353FED5D28FED31FA53C343F381BE121E106F669"\
     "5B3CB";
    P.C7 = 
     "1726DAE1BD153379F1FB0F4F2E00C06D39A733B7715D108EF0C"\
     "518A11DF528394E37F744E1CEE1B4B411FEAFD7DDE0E281042"\
     "A728F85FEDB91C8C2ECECF31873C77D68053D550EB8549FDE2"\
     "C1885F40B68E1F0FF3383B747882AA517EB6F9061E23650222"\
     "85F1B1BEA91F83E2C4CD66BF0C636FC79B81A738D65D6F5BF8"\
     "0234D7";

        memset(KeyStr, 0, 100 );
        P.RegKey = (LPTSTR)KeyStr;      // Buffer for registration key
        P.RegKeySize = 100;             // Size of a buffer for reg. key

    // Generating...

                Res = RegKeyGenerate(&P);
        if(Res == kgERROR_SUCCESS)
        {
                memcpy(KeyStr, P.RegKey, P.RealKeySize);
                return TRUE;
        }
        else return FALSE;
}

//---------------------------------------------------------------------
void ProcessRegistration( HWND hwnd )
{

        DWORD   Res;
        char*   ResStr;
		char	KeyStr[256];

		char	NameStr[256];
		int		size;

		size = GetDlgItemText(hwnd, IDC_REGNAME_EDIT, NameStr, 256);
		if (size > 0) NameStr[size] = 0;

        memset(&KeyStr, 0, sizeof(KeyStr));

        if(GenerateKey( (LPSTR*)KeyStr, (LPSTR)NameStr, Res ) == FALSE)
        {
                switch (Res)
                {
                        case kgERROR_KG_ERROR            : ResStr = "Key generator error!"; break;
                        case kgERROR_MODE_UNKNOWN        : ResStr = "Unknown mode number!"; break;
                        case kgERROR_REGNAME_ERROR       : ResStr = "Incorrect registration name!"; break;
                        case kgERROR_SIGNATURE_ERROR     : ResStr = "Unknown mode signature!"; break;
                        case kgERROR_BUFFER_TOO_SMALL    : ResStr = "Result buffer too small!"; break;
                        case kgERROR_CONSTANTS_UNDEFINED : ResStr = "Incorrect constants!"; break;
                        case kgERROR_HARDWAREID_ERROR    : ResStr = "Invalid HardwareID key!"; break;
                }

                MessageBox(hwnd, ResStr, "Error", MB_ICONINFORMATION);
        }
        else
        {
                SetDlgItemText(hwnd, IDC_REGKEY_EDIT, KeyStr);
        }

}

//---------------------------------------------------------------------
BOOL APIENTRY DlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{

        switch (msg) {


                // Cmd

		case WM_INITDIALOG:

			SetDlgItemText(hwnd, IDC_REGNAME_EDIT, "Registered User");
			return TRUE;

        case WM_COMMAND:

			switch (LOWORD(wParam)) {

				case IDC_GENERATE:
					ProcessRegistration( hwnd );
					break;

                case IDC_EXIT:
                    EndDialog(hwnd, IDC_EXIT);
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
int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow){

        // LoadLibrary "keygen.dll"

        KeyGenDll = LoadLibrary("keygen.dll");
        if(KeyGenDll == NULL)
        {
                MessageBox(0, "keygen.dll not found!", "Error", MB_ICONSTOP);
                return 0;
        }

        // GetProcAddress "ASPRegistrationKeyGenerate"

        RegKeyGenerate = (ASPRegistrationKeyGenerate)GetProcAddress(KeyGenDll, RegistrationKeyGenerateName);
        if(RegKeyGenerate == NULL)
        {
                MessageBox(0, "`ASPRegistrationKeyGenerate` function not found!", "Error", MB_ICONSTOP);
                FreeLibrary(KeyGenDll);
                return 0;
        }

        // DialogBox "IDD_DIALOG"

        DialogBox(NULL,(LPSTR)MAKEINTRESOURCE(IDD_DIALOG),NULL,(DLGPROC/*WNDPROC*/)DlgProc);
        if(KeyGenDll != NULL) FreeLibrary(KeyGenDll);
        return 0;
}
