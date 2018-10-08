// AcprExam.cpp : Defines the entry point for the console application.
//

#include "windows.h"
#include "stdlib.h"
#include "stdio.h"
#include "..\..\include\ACProtect.h"


int main(int argc, char* argv[])
{
  
  //Outer part
  //  dynamic endecrypt   
	DYNAMIC_BEGIN;  //u must include this line before the code protected
     	  MessageBox(NULL,"First decrypt this code,then run ,it will be encrypted again after run!","Dynamic En/Decryption of codes example",MB_OK);    
   
	      //Middle Part
		  //EMBEDDED PROTECTION    
    	  EMBEDDED_BEGIN;  //u must include this line before the code protected
   	          MessageBox(NULL,"The Cryptor   encrypt  the codes between the embedded lock header and embedded lock tail ,then communicate with the loader,After checking,then decrypt the codes,and run the decrypted code .After the Running ,all the codes (include the embedded cryptor and the crypted code) will  keep the original encrypted status..","Embedded Protection of codes example",MB_OK);    
		      
		      //inner part
		      bool KeyCorrect = false;   
              RSALOCK_BEGIN;  //u must include this line before the code protected
   	              KeyCorrect  = ! KeyCorrect;  
	              MessageBox(NULL,"If you have no the correct key.dat,you can not see me after being protected with ACProtect","RSA Lock codes example",MB_OK);    
              RSALOCK_END;    //u must include this line after the code protected
              if (KeyCorrect) MessageBox(NULL,"Valid user :-)","Valid user :-)",MB_OK);
              else MessageBox(NULL,"Invalid user :-<","Invalid user :-<",MB_OK);

	  EMBEDDED_END;    //u must include this line after the code protected
 
	DYNAMIC_END;    //u must include this line after the code protected


//note: u can place the nested protection with any order,any layer :-)

 return 0;
}
