
#pragma hdrstop
#include <condefs.h>
#include <stdio.h>
#include <stdexcept>

using namespace std;

#include "EXECryptor.h"

void VerifySN(char *s)
{
  int c,d;
  CRYPT_START
  c=0; d=strlen(s)-1;
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

//---------------------------------------------------------------------------
#pragma argsused
int main(int argc, char* argv[])
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
     throw runtime_error("exception test: ");
     CRYPT_END
    } catch(const exception& e) {
      printf("%s%i\n",e.what(),j);
    }
  printf("done.\n");

  printf("Press 'Enter' to exit ...");
  getchar();
  return 0;
}
