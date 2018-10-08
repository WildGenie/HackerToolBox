
#pragma hdrstop
#include <condefs.h>
#include <stdio.h>
#include <windows.h>

#include "EXECryptorKeyGen.h"

//---------------------------------------------------------------------------
USEUNIT("EXECryptorKeyGen.cpp");
//---------------------------------------------------------------------------
#pragma argsused

int main(int argc, char* argv[])
{
  printf("EXECryptor KeyGen Demo\n");
  TKeyGen KeyGen("..\\..\\..\\");
  char SerialNumber[32];

  // path may be relative from eckeygen.dll placement
  KeyGen.CreateSerialNumber("Example\\CBuilder\\SerialsAPI\\SerialsAPIDemo.ep2",
    "Jon Smith",NULL,SerialNumber);
  printf("Jon Smith\t%s\n",SerialNumber);

  KeyGen.CreateSerialNumberTimeLimited("Example\\CBuilder\\SerialsAPI\\SerialsAPIDemo.ep2",
    "Pupkin Ltd.", // regname
    false,true,true,true,true,true, // enabled features
    1, // license type
    4, 2005, // expire after april 2005
    NULL,SerialNumber);
  printf("Pupkin Ltd.\t%s\n",SerialNumber);

  KeyGen.CreateSerialNumberEx("Example\\CBuilder\\SerialsAPI\\SerialsAPIDemo.ep2",
    "Pupkin Ltd.", // regname
    false,false,true,true,true,true, // enabled features
    5, // license type
    312, // user param
    NULL,SerialNumber);
  printf("Pupkin Ltd.\t%s\n",SerialNumber);

  printf("Press 'Enter' to exit ...");
  getchar();
  return 0;
}
 