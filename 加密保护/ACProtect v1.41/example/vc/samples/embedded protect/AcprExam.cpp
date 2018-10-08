// AcprExam.cpp : Defines the entry point for the console application.
//

#include "windows.h"
#include "stdlib.h"
#include "stdio.h"
#include "..\..\include\ACProtect.h"


int main(int argc, char* argv[])
{

  //example of embedded protect,
  //ACProtect will embedd a cryptor(include anti-debug,anti-trace,encrypt,decrypt fucntions etc.)here.
  //The Cryptor   encrypt  the codes between the embedded lock header and embedded lock tail ,then communicate with the loader;
  //After checking,then decrypt the codes,and run the decrypted code .
  //After the Running ,all the codes (include the embedded cryptor and the crypted code) will keep the original encrypted status.
  //So the cracker can not dump the code from memory to analysis.and the cracker can not strip loader away .
  //used to protect init code and password check function etc. 

  
	EMBEDDED_BEGIN;  //u must include this line before the code protected
   
	MessageBox(NULL,"The Cryptor   encrypt  the codes between the embedded lock header and embedded lock tail ,then communicate with the loader,After checking,then decrypt the codes,and run the decrypted code .After the Running ,all the codes (include the embedded cryptor and the crypted code) will  keep the original encrypted status..","Embedded Protection of codes example",MB_OK);    
 
	EMBEDDED_END;    //u must include this line after the code protected
 
 return 0;
}
