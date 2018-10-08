// AcprExam.cpp : Defines the entry point for the console application.
//

#include "windows.h"
#include "stdlib.h"
#include "stdio.h"
#include "..\..\include\ACProtect.h"


int main(int argc, char* argv[])
{
  //example of dynamic code lock
  //the code between the dynamic lock begin and end flag will be crypted,when running,the code will be decrypted first,then run,after the running ,
  //it will be encrypted again to prevent dumpping and static analysis.
 
	DYNAMIC_BEGIN;  //u must include this line before the code protected
   
	MessageBox(NULL,"First decrypt this code,then run ,it will be encrypted again after run!","Dynamic En/Decryption of codes example",MB_OK);    
 
	DYNAMIC_END;    //u must include this line after the code protected
 
 return 0;
}
