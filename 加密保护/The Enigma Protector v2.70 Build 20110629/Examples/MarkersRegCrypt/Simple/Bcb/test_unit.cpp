//---------------------------------------------------------------------------

#pragma hdrstop
#include <windows>

//---------------------------------------------------------------------------

#pragma argsused
int main(int argc, char* argv[])
{
        MessageBox(0, "Start message", "Application", 0);

        #include "..\..\..\..\EnigmaSDK\Bcb\reg_crypt_begin1.inc"
        MessageBox(0, "Application is registered!\nMessage between Markers #1 is encrypted!", "Application" , 0);
        #include "..\..\..\..\EnigmaSDK\Bcb\reg_crypt_end1.inc"

        #include "..\..\..\..\EnigmaSDK\Bcb\reg_crypt_begin2.inc"
        MessageBox(0, "Application is registered!\nMessage between Markers #2 is encrypted!", "Application" , 0);
        #include "..\..\..\..\EnigmaSDK\Bcb\reg_crypt_end2.inc"

        #include "..\..\..\..\EnigmaSDK\Bcb\reg_crypt_begin3.inc"
        MessageBox(0, "Application is registered!\nMessage between Markers #3 is encrypted!", "Application" , 0);
        #include "..\..\..\..\EnigmaSDK\Bcb\reg_crypt_end3.inc"

        return 0;
}
//---------------------------------------------------------------------------
 