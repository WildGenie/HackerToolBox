#include "stdafx.h"
#include "EXECryptorKeyGen.h"
#include <string.h>

TKeyGen::TKeyGen(const char *DllPath)
{
  char buf[1024];
  if (DllPath == NULL) buf[0]=0;
  else strcpy(buf,DllPath);
  strcat(buf,"eckeygen.dll");
  hLib = LoadLibrary(buf);
  if (hLib != NULL) {
    FCreateSerialNumber = (TCreateSerialNumber)GetProcAddress(hLib,"CreateSerialNumber");
    FCreateSerialNumberEx = (TCreateSerialNumberEx)GetProcAddress(hLib,"CreateSerialNumberEx");
    FCreateSerialNumberW = (TCreateSerialNumberW)GetProcAddress(hLib,"CreateSerialNumberW");
    FCreateSerialNumberExW = (TCreateSerialNumberExW)GetProcAddress(hLib,"CreateSerialNumberExW");
  }
}

TKeyGen::~TKeyGen()
{
  FreeLibrary(hLib);
}

void TKeyGen::CreateSerialNumber(const char *PrjName, const char *RegistrationName,
  const char *HardwareID, char *SerialNumber)
{
  if (FCreateSerialNumber != NULL)
    FCreateSerialNumber(PrjName, RegistrationName, HardwareID, SerialNumber);
}

void TKeyGen::CreateSerialNumberTimeLimited(const char *PrjName,
  const char *RegistrationName,
  bool F1, bool F2, bool F3, bool F4, bool F5, bool F6,
  int LicType, int ExpiryMonth, int ExpiryYear,
  const char *HardwareID, char *SerialNumber)
{
  TSerialNumberInfo li;
  li.F1=F1; li.F2=F2; li.F3=F3; li.F4=F4; li.F5=F5; li.F6=F6;
  li.LicType=LicType;
  li.ExpiryMonth=ExpiryMonth;
  li.ExpiryYear=ExpiryYear;
  FCreateSerialNumberEx(PrjName,RegistrationName,HardwareID,&li,SerialNumber);
}

void TKeyGen::CreateSerialNumberEx(const char *PrjName,
  const char *RegistrationName,
  bool F1, bool F2, bool F3, bool F4, bool F5, bool F6,
  int LicType, int UserParam,
  const char *HardwareID, char *SerialNumber)
{
  TSerialNumberInfo li;
  li.F1=F1; li.F2=F2; li.F3=F3; li.F4=F4; li.F5=F5; li.F6=F6;
  li.LicType=LicType;
  li.UserParam=UserParam;
  FCreateSerialNumberEx(PrjName,RegistrationName,HardwareID,&li,SerialNumber);
}

void TKeyGen::CreateSerialNumberW(const wchar_t *PrjName, const wchar_t *RegistrationName,
  const wchar_t *HardwareID, wchar_t *SerialNumber)
{
  if (FCreateSerialNumberW != NULL)
    FCreateSerialNumberW(PrjName, RegistrationName, HardwareID, SerialNumber);
}

void TKeyGen::CreateSerialNumberTimeLimitedW(const wchar_t *PrjName,
  const wchar_t *RegistrationName,
  bool F1, bool F2, bool F3, bool F4, bool F5, bool F6,
  int LicType, int ExpiryMonth, int ExpiryYear,
  const wchar_t *HardwareID, wchar_t *SerialNumber)
{
  TSerialNumberInfo li;
  li.F1=F1; li.F2=F2; li.F3=F3; li.F4=F4; li.F5=F5; li.F6=F6;
  li.LicType=LicType;
  li.ExpiryMonth=ExpiryMonth;
  li.ExpiryYear=ExpiryYear;
  FCreateSerialNumberExW(PrjName,RegistrationName,HardwareID,&li,SerialNumber);
}

void TKeyGen::CreateSerialNumberExW(const wchar_t *PrjName,
  const wchar_t *RegistrationName,
  bool F1, bool F2, bool F3, bool F4, bool F5, bool F6,
  int LicType, int UserParam,
  const wchar_t *HardwareID, wchar_t *SerialNumber)
{
  TSerialNumberInfo li;
  li.F1=F1; li.F2=F2; li.F3=F3; li.F4=F4; li.F5=F5; li.F6=F6;
  li.LicType=LicType;
  li.UserParam=UserParam;
  FCreateSerialNumberExW(PrjName,RegistrationName,HardwareID,&li,SerialNumber);
}
