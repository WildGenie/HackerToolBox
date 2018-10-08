// AcprExam.cpp : Defines the entry point for the console application.
//

#include "windows.h"
#include "stdlib.h"
#include "stdio.h"
#include "..\..\include\ACProtect.h"


int main(int argc, char* argv[])
{

  //example of RSA key lock
  //this will prevent the cracker to write out the KeyGen of the software
  //the code between the "RSA lock code begin" and "RSA lock code end" will be locked with the RSA1024 keyapir,
  //without the correct RSA key Public key,the code locked can not be unlock,so the function is limited to those who have the correct key.dat 
  //used to generate the function limit software.
  

    bool KeyCorrect = false;
  	RSALOCK_BEGIN;  //u must include this line before the code protected
      
	  KeyCorrect  = ! KeyCorrect;  
	  MessageBox(NULL,"If you have no the correct key.dat,you can not see me after being protected with ACProtect","RSA Lock codes example",MB_OK);    
 
	RSALOCK_END;    //u must include this line after the code protected
   
   if (KeyCorrect) MessageBox(NULL,"Valid user :-)","Valid user :-)",MB_OK);
   else MessageBox(NULL,"Invalid user :-<","Invalid user :-<",MB_OK);

 return 0;
}
