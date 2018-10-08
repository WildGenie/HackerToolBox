#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "EXECryptor.h"

static void TestAPI(void)
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

static const char* VerifyInfo[] = {"Invalid", "Expired", "Stolen", "OK"};

static void TestSerials(void)
{

  printf("Pupkin Ltd.    ANEG-8YSR-ZF2K  %s\n",
    VerifyInfo[EXECryptor_VerifySerialNumber("Pupkin Ltd.","ANEG-8YSR-ZF2K")]);
  printf("IsRegistered %s\n",VerifyInfo[EXECryptor_IsRegistered()]);
  printf("RegConst_0   %i\n",EXECryptor_RegConst_0());
  printf("RegConst_1   %i\n",EXECryptor_RegConst_1());
  printf("RegConst_2   %i\n",EXECryptor_RegConst_2());
  printf("RegConst_3   %i\n",EXECryptor_RegConst_3());
  printf("RegConst_4   %i\n",EXECryptor_RegConst_4());
  printf("RegConst_5   %i\n",EXECryptor_RegConst_5());
  printf("RegConst_6   %i\n",EXECryptor_RegConst_6());
  printf("RegConst_7   %i\n",EXECryptor_RegConst_7());
  CRYPT_REG
  printf("CRYPT_REG done\n");
  CRYPT_END
  CRYPT_UNREG
  printf("CRYPT_UNREG done\n");
  CRYPT_END
  printf("Press 'Enter' to continue ...");
  getchar();

  TSerialNumberInfo SNInfo;
  printf("\nLicense info test\n");
  printf("\nJustas    CHCE-EAJG-EFEW-2WRX   %s\n",
    VerifyInfo[EXECryptor_VerifySerialNumber("Justas","CHCE-EAJG-EFEW-2WRX",&SNInfo)]);
  printf("License type: %i\n",SNInfo.LicType);
  if (SNInfo.LicType == 1)
    printf("Expiry after: %i/%i\n",SNInfo.ExpiryMonth,SNInfo.ExpiryYear);
  else
    printf("UserParam: %i\n",SNInfo.UserParam);
  printf("Features: %i,%i,%i,%i,%i,%i\n",SNInfo.F1,SNInfo.F2,SNInfo.F3,
    SNInfo.F4,SNInfo.F5,SNInfo.F6);

  printf("\nJustas    CP9P-GJKL-J5LM-XHSR   %s\n",
    VerifyInfo[EXECryptor_VerifySerialNumber("Justas","CP9P-GJKL-J5LM-XHSR",&SNInfo)]);
  printf("License type: %i\n",SNInfo.LicType);
  if (SNInfo.LicType == 1)
    printf("Expiry after: %i/%i\n",SNInfo.ExpiryMonth,SNInfo.ExpiryYear);
  else
    printf("UserParam: %i\n",SNInfo.UserParam);
  printf("Features: %i,%i,%i,%i,%i,%i\n",SNInfo.F1,SNInfo.F2,SNInfo.F3,
    SNInfo.F4,SNInfo.F5,SNInfo.F6);

  printf("Press 'Enter' to continue ...");
  getchar();

  printf("\nzzzzzz      ABCD-FGHK-3456  %s\n",
    VerifyInfo[EXECryptor_VerifySerialNumber("zzzzzz","ABCD-FGHK-3456")]);
  printf("IsRegistered %s\n",VerifyInfo[EXECryptor_IsRegistered()]);
  printf("RegConst_0   %i\n",EXECryptor_RegConst_0());
  printf("RegConst_1   %i\n",EXECryptor_RegConst_1());
  printf("RegConst_2   %i\n",EXECryptor_RegConst_2());
  printf("RegConst_3   %i\n",EXECryptor_RegConst_3());
  printf("RegConst_4   %i\n",EXECryptor_RegConst_4());
  printf("RegConst_5   %i\n",EXECryptor_RegConst_5());
  printf("RegConst_6   %i\n",EXECryptor_RegConst_6());
  printf("RegConst_7   %i\n",EXECryptor_RegConst_7());
  CRYPT_REG
  printf("CRYPT_REG done\n");
  CRYPT_END
  CRYPT_UNREG
  printf("CRYPT_UNREG done\n");
  CRYPT_END

  printf("Press 'Enter' to continue ...");
  getchar();

  printf("\nDecodeSerialNumber test");
  printf("\nJustas      CHCE-EAJG-EFEW-2WRX  %s\n",
    VerifyInfo[EXECryptor_DecodeSerialNumber("Justas","CHCE-EAJG-EFEW-2WRX")]);
  printf("IsRegistered %s\n",VerifyInfo[EXECryptor_IsRegistered()]);
  printf("RegConst_0   %i\n",EXECryptor_RegConst_0());
  printf("RegConst_1   %i\n",EXECryptor_RegConst_1());
  printf("RegConst_2   %i\n",EXECryptor_RegConst_2());
  printf("RegConst_3   %i\n",EXECryptor_RegConst_3());
  printf("RegConst_4   %i\n",EXECryptor_RegConst_4());
  printf("RegConst_5   %i\n",EXECryptor_RegConst_5());
  printf("RegConst_6   %i\n",EXECryptor_RegConst_6());
  printf("RegConst_7   %i\n",EXECryptor_RegConst_7());
  CRYPT_REG
  printf("CRYPT_REG done\n");
  CRYPT_END
  CRYPT_UNREG
  printf("CRYPT_UNREG done\n");
  CRYPT_END
}

int main(int argc,char *argv[])
{
	CRYPT_START
	TestAPI();
	TestSerials();
	CRYPT_END

    printf("Press 'Enter' to exit ...");
    getchar();
    return 0;
}
