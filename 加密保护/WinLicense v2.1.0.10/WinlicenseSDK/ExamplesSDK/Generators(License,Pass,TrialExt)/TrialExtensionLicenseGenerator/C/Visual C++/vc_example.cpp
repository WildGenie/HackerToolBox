/****************************************************************************** 
/* Module: Example
/* Description: Shows how to generate Trial Extension keys in Visual C++ language
/*
/* Authors: Rafael Ahucha  
/* (c) 2004 Winlicense Professional
/*****************************************************************************/ 


/****************************************************************************** 
/*                   Libraries used by this module
/*****************************************************************************/ 

#include <windows.h>
#include <stdio.h>
#include "..\..\..\..\..\Include\C\WinlicenseSDK.h"
#pragma comment (lib,"..\\..\\..\\..\\..\\Lib\\COFF\\WinlicenseSDK.lib")


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

    char    TrialHash[] =  "432ab78bd7ar324ghjd87feg63vksyb375am35fj50abloqnxc543jd73hrgf5289dhf73hjdfjhgd783hjgsdmvbaismvhsm76354BfhBFHSgd7634";
    char    TrialKeyBuffer[100]; 
    int     SizeKey; 
    FILE*   hFileKey;

    // create a trial extension key, extending 2 days and 5 executions

    SizeKey = WLGenTrialExtensionFileKey(TrialHash, 1, 2, 5, 0, 0, 0, TrialKeyBuffer);

    // store key in file

    hFileKey = fopen("extendkey.dat","wb+");

    fwrite(&TrialKeyBuffer, SizeKey, 1, hFileKey);

    fclose(hFileKey);

    MessageBox(0, "A trial extension key has been generated", "Trial Extension SDK", MB_OK);

    return 0;

}


