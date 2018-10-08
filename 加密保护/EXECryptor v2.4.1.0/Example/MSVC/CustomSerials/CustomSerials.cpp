// Must be compile with linker key "/FIXED:NO"
//

#include "stdafx.h"
#include <stdio.h>
#include "EXECryptor.h"

const char* VerifyInfo[] = {"Invalid", "Expired", "Stolen", "OK"};

void TestCustomSerials()
{
  printf("EXECryptor_SetCodeKey(0123456789)\n");
  EXECryptor_SetCodeKey("0123456789",10);
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

  printf("EXECryptor_SetCodeKey(NULL)\n");
  EXECryptor_SetCodeKey(NULL,0);
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

int _tmain(int argc, _TCHAR* argv[])
{
  CRYPT_REG
  printf("CRYPT_REG done\n");
  CRYPT_END
  CRYPT_UNREG
  printf("CRYPT_UNREG done\n");
  CRYPT_END

  CRYPT_START
  TestCustomSerials();
  CRYPT_END

  printf("Press 'Enter' to exit ...");
  getchar();

  return 0;
}

