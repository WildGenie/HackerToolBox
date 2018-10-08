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
        // Check, if the file is protected
        if (EP_CheckupIsProtected()) {
                MessageBoxA(0, "We are under protection!", "Application", MB_OK | MB_ICONINFORMATION);
        } else {
                MessageBoxA(0, "Please protect this file before usage!", "Application", MB_OK | MB_ICONERROR);
        }
        // Check, if crc of Enigma protection is ok or no
        if (EP_CheckupIsEnigmaOk()) {
                MessageBoxA(0, "Protection CRC is good!\r\nEverything is well, we can complete the job!", "Application", MB_OK | MB_ICONINFORMATION);
        } else {
                MessageBoxA(0, "Protection is changed/cracked...", "Application", MB_OK | MB_ICONERROR);
        }
        return 0;
}
//---------------------------------------------------------------------------
