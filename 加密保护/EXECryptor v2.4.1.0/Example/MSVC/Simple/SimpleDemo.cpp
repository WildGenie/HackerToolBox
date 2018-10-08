// Must be compile with linker key "/FIXED:NO"
//

#include "stdafx.h"
#include <stdexcept>
#include "EXECryptor.h"

#pragma optimize( "", off )

void VerifySN(char *s)
{
  int c,d;
  CRYPT_START
  c=0; d=(int)strlen(s)-1;
  while ((c <= d) && (s[c] == s[d])) {
    c++; d--;
  }
  if (d <= c)
    printf("Valid serial: %s\n",s);
  else
    printf("Invalid serial: %s\n",s);
  CRYPT_END
}

void UnsafeEncryptionTest()
{
  int a,b;
  CRYPT_START_UNSAFE
  a=1; b=1;
  if (a == b) {
    CRYPT_END_UNSAFE
    printf("Test OK!\n");
  }
}

// also see export.def file
extern "C" void __declspec(dllexport) AdvProtectedCode()
{
  printf("Test OK!\n");
}

int _tmain(int argc, _TCHAR* argv[])
{
  printf("----- simple encryption test\n");
  CRYPT_START
  printf("Test message\n");
  CRYPT_END
  printf("done.\n");

  printf("----- advanced encryption test\n");
  AdvProtectedCode();
  printf("done.\n");

  printf("----- cond jmp test\n");
  CRYPT_START
  VerifySN("abcd;dcba");
  VerifySN("213,213");
  VerifySN("203,302");
  CRYPT_END
  printf("done.\n");

  printf("----- unsafe encryption\n");
  UnsafeEncryptionTest();
  printf("done.\n");

  printf("----- jump outside encrypted block test\n");
  CRYPT_START
  int a,b;
  a=1; b=1;
  if (a == b) goto L1;
  printf("jump outside encrypted block: Fail\n");
  CRYPT_END
  L1:
  printf("jump outside encrypted block: OK\n");
  printf("done.\n");

  printf("----- exception test\n");
  for (int j=0; j < 3; j++)
    try {
     CRYPT_START
     throw "exception test: ";
     CRYPT_END
    } catch(char *str) {
      printf("%s%i\n",str,j);
    }
  printf("done.\n");

  printf("Press 'Enter' to exit ...");
  getchar();
  return 0;
}

