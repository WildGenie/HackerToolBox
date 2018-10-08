
 ASPROTECT DELPHI SDK 2.0 for Delphi
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                             

 1. Important note:
 ------------------
 Don't use SDK functions together with ASProtect API functions 
 There is only one exceptions - ASP_RunTrialApplication: you should declare 
 ExecuteApplication and ExecuteTrial procedures for the right work!

 2. List of functions:
 ---------------------
 Here is the list of Delphi SDK functions:

 2.1. function  ASP_GetRegistrationInformation : String;

      Get registration information. If version is unregistered it returns
      empty string - Length( ASP_GetRegistrationInformation ) = 0

 2.2. function  ASP_GetHardwareID : String;

      Returns computer HardwareID string.

 2.3  procedure ASP_SetKeyProc(Key :Pointer; KeyLen : DWORD);

      Set decryption key for external registration scheme.

 2.4. procedure ASP_DecryptProc;
      Decrypts encrypted fragments.

 2.5. procedure ASP_EncryptProc;
      Encrypt decrypted fragments again. 


 2.6. procedure ASP_GetTrialDays(var Total, Left : DWORD);
      Returns trial days counters.
    

 2.7. procedure ASP_GetTrialExecs(var Total, Left : DWORD);
      Returns trial counters.

 2.8. procedure ASP_RunTrialApplication;
      Please define your ExecuteApplication and ExecuteTrial procedures
      before.

 2.9. Set of functions for ASProtect envelope validation.

      procedure ASP_IsOK1;
      procedure ASP_IsOK2;
      procedure ASP_IsOK3;
      procedure ASP_IsOK4;

      If you got an exception - it means that ASProtect was removed 
      (a crack attempt). 

 3. Comments.
 ------------

 3.1. All functions should be enclosed in try .. except construct.

   Example:

   try
     ASP_IsOK1;
   except
     MessageBox(0,'ASProtect not found!','Check #1!',0);
   end;

   If you got an exception - it means that ASProtect was removed 
   (a crack attempt). 

 3.2. If you use encryption marks (reg_crypt_begin.inc and reg_crypt_end.inc) to
      protect blocks of code, be sure to call ASP_DecryptProc before block
      beginning and call ASP_EncryptProc after block end! Or you can use 
      sdk_reg_crypt_begin.inc and sdk_reg_crypt_end.inc.

   Example:

   ASP_DecryptProc;

   {$I include\reg_crypt_begin.inc}
   MessageBox(0,PChar(ASP_GetRegistrationInformation),'Registered version',0);
   {$I include\reg_crypt_end.inc}

   ASP_EncryptProc; 

   OR

   {$I include\sdk_reg_crypt_begin.inc}
   MessageBox(0,PChar(ASP_GetRegistrationInformation),'Registered version',0);
   {$I include\sdk_reg_crypt_end.inc}

  3.3. Don't show messages like this 'ASProtect not found!'. Just put an error code (like 
      'Error #1" or some other message to log-file or crush application later.

   Example:

   try
     ASP_IsOK3;
     IsOK := ShowMainForm;
   except
     IsOK := False;
   end;

   if not IsOK then
     WriteErrorLog('ShowMainForm failed.');
