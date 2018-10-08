/****************************************************************************** 
/* Module: Example
/* Description: Shows how to call WLStringDecrypt in Visual C++ language
/*
/* Authors: Rafael Ahucha  
/* (c) 2006 Winlicense Professional
/*****************************************************************************/ 


/****************************************************************************** 
/*                   Libraries used by this module
/*****************************************************************************/ 

#include <windows.h>
#include <stdio.h>
#include "WinlicenseSDK.h"
#pragma comment (lib,"WinlicenseSDK.lib")


/*****************************************************************************
* WinMain
*
*  Main program function
*
* Inputs
*  Standard WinMain parameters
* 
* Outputs
*  None
*
* Returns
*  Exit Code
******************************************************************************/

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                       PSTR szCmdLine, int iCmdShow)
{

    MessageBox(0, WLStringDecrypt("This is an encrypted string"), "WLStringDecrypt Test", MB_OK);

	return 0;

}


