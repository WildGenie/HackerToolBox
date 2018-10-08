
#pragma hdrstop
#include <condefs.h>
#include <stdio.h>
#include <stdexcept>

using namespace std;

#include "EXECryptor.h"

USEUNIT("EXECryptor.cpp");
//---------------------------------------------------------------------------

void TestAPI()
{
  char s[256],s1[256];
  int d,m,y;
  CRYPT_START
  printf("AntiDebug ");
  EXECryptor_AntiDebug();
  printf("OK!\n");
  printf("ProtectImport ");
  EXECryptor_ProtectImport();
  printf("OK!\n");

  printf("IsAppProtected: %i\n", EXECryptor_IsAppProtected());
  printf("GetEXECryptorVersion: %s\n",EXECryptor_GetEXECryptorVersion());

  GetReleaseDate(&d,&m,&y);
  printf("GetReleaseDate: %i-%i-%i\n",d,m,y);

  SafeGetDate(&d,&m,&y);
  printf("SafeGetDate: %i-%i-%i\n",d,m,y);
  printf("HardwareID: %u\n",EXECryptor_GetHardwareID());

  EXECryptor_EncryptStr("this is a password string!",s);
  printf("EncryptStr: %s\n",s);
  EXECryptor_DecryptStr(s,s1);
  printf("DecryptStr: %s\n",s1);

  HMODULE h=GetModuleHandle("kernel32.dll");
  printf("GetProcAddress(LoadLibraryA) = %u\n",(DWORD)GetProcAddress(h,"LoadLibraryA"));
  printf("GetProcAddr(LoadLibraryA)    = %u\n",(DWORD)EXECryptor_GetProcAddr(h,"LoadLibraryA"));

  // HKCU
  if (EXECryptor_SecureWrite("test key","this is my secret value!"))
    printf("SecureWrite: passed\n");
  else
    printf("SecureWrite: FAIL\n");
  if (EXECryptor_SecureRead("test key",s1))
    printf("SecureRead: %s\n",s1);
  else
    printf("SecureRead: FAIL\n");

  // HKLM
  if (EXECryptor_SecureWrite("@test key","global secret value!"))
    printf("SecureWrite@: passed\n");
  else
    printf("SecureWrite@: FAIL\n");
  if (EXECryptor_SecureRead("@test key",s1))
    printf("SecureRead@: %s\n",s1);
  else
    printf("SecureRead@: FAIL\n");

  printf("GetTrialDaysLeft: %i\n",EXECryptor_GetTrialDaysLeft(30));
  printf("GetTrialRunsLeft: %i\n",EXECryptor_GetTrialRunsLeft(100));

  EXECryptor_MessageBoxA(0,"SafeMessageBox OK!","EXECryptor API Demo",0);
  CRYPT_END
}

//---------------------------------------------------------------------------
#pragma argsused
int main(int argc, char* argv[])
{
  CRYPT_START
  TestAPI();
  CRYPT_END

  printf("Press 'Enter' to exit ...");
  getchar();
  return 0;
}
