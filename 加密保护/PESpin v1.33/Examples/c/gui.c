////////////////////////////////////////////////////////////////
//
// Example of how to use CLEAR_START and CLEAR_END macros
//
////////////////////////////////////////////////////////////////

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "gui.h"
#include "..\pespin.h"


HINSTANCE hInst;
int value = 0; 

// example proc
unsigned int Inith()
{

unsigned int i,j;

CLEAR_START

	for (i=1, j=1 ;i < 10 ;i++ )
	{
	j = j*i;
	}
	i=1;	//to avoid lcc bug
CLEAR_END
	return	j;

}



BOOL CALLBACK DlgP (HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		// initialization of main window, its executed only one time
		// so we can use CLEAR_START and CLEAR_END macros
		case WM_INITDIALOG :

			// code between CLEAR_START and CLEAR_END will be executed
			// and then erased from the memory
			CLEAR_START

			SetWindowTextA(hDlg, "PESpin Markers Test");
			SendMessage(hDlg,WM_SETICON,(LPARAM) 0,(WPARAM) LoadIcon(hInst,MAKEINTRESOURCE(ID_ICON)) );
			
			CLEAR_END

			return TRUE;

		case WM_COMMAND :
			switch (LOWORD (wParam))
			{
				case IDCANCEL :
					EndDialog (hDlg, 0);
					break;
			}
			break;
	}


	return FALSE;
}

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
{
	
	CRYPT_START
	
	hInst=hInstance;
	value=Inith();
	
	DialogBoxA(hInstance, MAKEINTRESOURCE(DLG_MAIN), 0, DlgP);
	CRYPT_END
			
	return 0;
	
}
