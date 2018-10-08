//---------------------------------------------------------------------------

#include <windows>
#include <vcl.h>
#pragma hdrstop

// Enigma API respondence ---------------------------------------------------
#include "../../../EnigmaSDK/Bcb/enigma_ide.h"
#pragma link "../../../EnigmaSDK/Bcb/enigma_ide.lib"
// --------------------------------------------------------------------------

//---------------------------------------------------------------------------

#pragma argsused
int main(int argc, char* argv[])
{
        int total = 0;
        int current = 0;
        // Get total number of executed copies and current one
        if (EP_CheckupCopies(&total, &current)) {
                AnsiString s_temp = Format("There is set up %d of total executed copies,\r\nThis is the %d-th runing copy!", ARRAYOFCONST((total, current)));
                MessageBoxA(0, s_temp.c_str(), "Application", MB_OK | MB_ICONINFORMATION);
        } else {
                // If the function returns false, it means that checkup
                // of executed copies is not set on the project
                MessageBoxA(0, "Unable to get executed copies count. To solve the problem, be sure:\r\n1. Application is protected,\r\n2. Checkup of executed copies is enabled.", "Application", MB_OK | MB_ICONERROR);
        }

        return 0;
}
//---------------------------------------------------------------------------
