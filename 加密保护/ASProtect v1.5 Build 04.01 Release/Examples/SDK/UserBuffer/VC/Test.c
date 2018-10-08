#include <windows.h>
#include <io.h>
#include "include\aspr.h"


//----------------------------------------------------------------------

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    PSTR szCmdLine, int iCmdShow)
{
 char buffer[20];
 int  i;

        MessageBox(0,"Begin","",0);

        USER_POLYBUFFER

        for ( i = 1; i < 6; i++ )
        {
          _itoa( i, buffer, 10 );
          MessageBox( 0, buffer, "Index", 0 );
        }


        MessageBox(0,"End","",0);

        return 0;
}