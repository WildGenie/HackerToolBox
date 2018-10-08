#include <windows.h>
#include <io.h>
#include "include\aspr.h"


BOOL EnvelopeCheck()
{
        #include "include\CppEnvelopeCheckFunc.inc"

	// You could write "return" statement on compiler warnings
	// ASProtect will change this condition after protection

	// return FALSE;
}

//----------------------------------------------------------------------

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{

        MessageBox(0,"Begin","",0);


        if ( EnvelopeCheck() ) {

             MessageBox(0,"Envelope found!","",0);
         }
           else

               MessageBox(0,"Envelope not found!","",0);


        #include "include\CppEnvelopeCheck.inc"

        MessageBox(0,"End","",0);

        return 0;
}