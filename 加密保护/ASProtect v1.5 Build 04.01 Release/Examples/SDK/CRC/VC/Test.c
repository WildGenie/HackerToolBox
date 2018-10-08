#include <windows.h>
#include <io.h>
#include "include\aspr.h"


//----------------------------------------------------------------------
int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{

        MessageBox(0,"Begin","",0);


        #include "include\cppCrcBegin.inc"

        MessageBox(0,"Under protection","",0);

        #include "include\cppCrcEnd.inc"


        MessageBox(0,"End","",0);

        return 0;
}