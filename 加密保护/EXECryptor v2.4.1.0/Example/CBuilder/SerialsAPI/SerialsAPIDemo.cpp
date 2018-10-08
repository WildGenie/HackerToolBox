
#pragma hdrstop
#include <condefs.h>
#include <stdio.h>
#include <stdexcept>

using namespace std;

#include "EXECryptor.h"

USEUNIT("EXECryptor.cpp");
//---------------------------------------------------------------------------

const char* VerifyInfo[] = {"Invalid", "Expired", "Stolen", "OK"};

void TestSerials()
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

//---------------------------------------------------------------------------
#pragma argsused
int main(int argc, char* argv[])
{
  CRYPT_REG
  printf("CRYPT_REG done\n");
  CRYPT_END
  CRYPT_UNREG
  printf("CRYPT_UNREG done\n");
  CRYPT_END

  CRYPT_START
  TestSerials();
  CRYPT_END

  printf("Press 'Enter' to exit ...");
  getchar();
  return 0;
}
