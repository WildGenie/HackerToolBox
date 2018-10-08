// AcprExam.cpp : Defines the entry point for the console application.
//
#include "windows.h"
#include "stdlib.h"
#include "stdio.h"
#include "..\..\include\ACProtect.h"

extern "C" _declspec(dllexport) DWORD GetMachineID(void);


int main(int argc, char* argv[])
{
	DWORD CID = GetMachineID();
	char buffer[255];
	bool keyok=false;
	sprintf(buffer,"%x",CID);
	
	RSALOCK_BEGIN;  //u must include this line before the code protected
    
    keyok =! keyok;
	MessageBox(NULL,"If u have no correct license file,you can not see me,and u can see me only on this machine!","RSA ComputerID Lock code sample",MB_OK);    
 
	RSALOCK_END;    //u must include this line after the code protected

	if (keyok=false) {
		  MessageBox(NULL,"Send the ComputerID to the author and unlock all the function with the key license fedback!","Hint:",MB_OK);    
          MessageBox(NULL,buffer,"Ur ComputerID is:",MB_OK);    
    }

 return 0;
}

//---------------------------------------------------------------------
//  This procedure will be called by acprotect for
//  setting of hardware key
//This is only  sample GetmachineID function,User must defined his own GetmachineID function 
//if u want lock ur system with computer fingerprint;
//---------------------------------------------------------------------
DWORD __declspec(dllexport)GetMachineID()
{
	  DWORD VolumeSerialNumber;
      GetVolumeInformation("c:\\",NULL,12,&VolumeSerialNumber,NULL,NULL,NULL,10);
      return VolumeSerialNumber;
}

