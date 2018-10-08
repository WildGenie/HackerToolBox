// AcprExam.cpp : Defines the entry point for the console application.
//

#include "windows.h"
#include "stdlib.h"
#include "stdio.h"
#include "..\..\include\ACProtect.h"


int main(int argc, char* argv[])
{
  
 
 char usrname[255];
 byte a;
   EMBEDDED_BEGIN; 
 //Get User name from ACProtect loader
   memset(usrname,0,sizeof(usrname));
   GetRegistrationName(usrname);  

  if (usrname[0] != 0) 
	  MessageBox(NULL,usrname,"User Name is :",MB_OK);    
  else {
	  MessageBox(NULL,"UnRegistered Version","User Name is :",MB_OK);    
      //Get Trial UsageTime from ACProtect loader if required
      GetTrialUsageTimes((char*)(&a))
	  char buffer[255];
      sprintf(buffer,"%d",a);
      MessageBox(NULL,buffer,"Trial Number :",MB_OK);    

      //now a is the trial number getted from acprotect loader,vary meaning from ur various trial setting!
  }
   EMBEDDED_END; 

 //Notes:Make sure u set check rsa in ur acprotect project;

 return 0;
}
