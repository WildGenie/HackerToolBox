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
//No1 GetUserName and TrialNumber
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

  //No 2 dynamic endecrypt 
	DYNAMIC_BEGIN;  //u must include this line before the code protected
   
	MessageBox(NULL,"First decrypt this code,then run ,it will be encrypted again after run!","Dynamic En/Decryption of codes example",MB_OK);    
 
	DYNAMIC_END;    //u must include this line after the code protected
  
//No 3  //EMBEDDED PROTECTION
	EMBEDDED_BEGIN;  //u must include this line before the code protected
   
	MessageBox(NULL,"The Cryptor   encrypt  the codes between the embedded lock header and embedded lock tail ,then communicate with the loader,After checking,then decrypt the codes,and run the decrypted code .After the Running ,all the codes (include the embedded cryptor and the crypted code) will  keep the original encrypted status..","Embedded Protection of codes example",MB_OK);    
 
	EMBEDDED_END;    //u must include this line after the code protected

//No 4     RSA LOCK CODE
    bool KeyCorrect = false;
  	RSALOCK_BEGIN;  //u must include this line before the code protected
      
	  KeyCorrect  = ! KeyCorrect;  
	  MessageBox(NULL,"If you have no the correct key.dat,you can not see me after being protected with ACProtect","RSA Lock codes example",MB_OK);    
 
	RSALOCK_END;    //u must include this line after the code protected
   
   if (KeyCorrect) MessageBox(NULL,"Valid user :-)","Valid user :-)",MB_OK);
   else MessageBox(NULL,"Invalid user :-<","Invalid user :-<",MB_OK);


 return 0;
}
