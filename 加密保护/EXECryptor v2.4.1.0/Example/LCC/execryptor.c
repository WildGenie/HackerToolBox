// EXECryptor API v. 2.3
#include <string.h>
#include "EXECryptor.h"

#pragma optimize(0)

// reserve space & suppres compiler optimization
#define EMIT5 \
  _asm("  .byte 144,144,144,144,144");

#ifdef USE_API

bool EXECRYPTORAPI EXECryptor_IsAppProtected(void)
{
  EMIT5
  return false;
}

const char EXECRYPTORAPI * EXECryptor_GetEXECryptorVersion(void)
{
  EMIT5
  return "UNPROTECTED";
}

DWORD EXECRYPTORAPI  EXECryptor_GetReleaseDate(void)
{
  FILETIME t1,t2;
  WORD dt,tt;
  GetSystemTimeAsFileTime(&t1);
  FileTimeToLocalFileTime(&t1,&t2);
  FileTimeToDosDateTime(&t2,&dt,&tt);
  return dt;
}

void GetReleaseDate(int *Day, int *Month, int *Year)
{
  DWORD dt = EXECryptor_GetReleaseDate();
  *Day = dt & 0x1F;
  *Month = (dt >> 5) & 0xF;
  *Year = (dt >> 9)+1980;
}

DWORD EXECRYPTORAPI  EXECryptor_GetDate()
{
  FILETIME t1,t2;
  WORD dt,tt;
  GetSystemTimeAsFileTime(&t1);
  FileTimeToLocalFileTime(&t1,&t2);
  FileTimeToDosDateTime(&t2,&dt,&tt);
  return dt;
}

void SafeGetDate(int *Day, int *Month, int *Year)
{
  DWORD dt = EXECryptor_GetDate();
  *Day = dt & 0x1F;
  *Month = (dt >> 5) & 0xF;
  *Year = (dt >> 9)+1980;
}

DWORD EXECRYPTORAPI EXECryptor_GetHardwareID()
{
  EMIT5
  return 0;
}

void EXECRYPTORAPI  EXECryptor_EncryptStr(const char *Src, char *Dst)
{
  EMIT5
  strcpy(Dst,Src);
}

void EXECRYPTORAPI  EXECryptor_DecryptStr(const char *Src, char *Dst)
{
  EMIT5
  strcpy(Dst,Src);
}

void EXECRYPTORAPI  EXECryptor_EncryptStrW(const wchar_t *Src, wchar_t *Dst)
{
  EMIT5
  wcscpy(Dst,Src);
}

void EXECRYPTORAPI  EXECryptor_DecryptStrW(const wchar_t *Src, wchar_t *Dst)
{
  EMIT5
  wcscpy(Dst,Src);
}

int EXECRYPTORAPI  EXECryptor_GetTrialDaysLeft(int TrialPeriod)
{
  EMIT5
	return TrialPeriod;
}

int EXECRYPTORAPI  EXECryptor_GetTrialRunsLeft(int TrialRuns)
{
  EMIT5
	return TrialRuns;
}

const char *TestKeyPath = "Software\\EXECryptorTestKeys";
static const wchar_t *TestKeyPathW = L"Software\\EXECryptorTestKeys";

bool EXECRYPTORAPI  EXECryptor_SecureWrite(const char *Name, const char *Value)
{
  DWORD Disposition;
  HKEY KeyHandle;
  if (RegCreateKeyExA(HKEY_CURRENT_USER, TestKeyPath, 0, NULL,
      REG_OPTION_NON_VOLATILE, KEY_SET_VALUE, NULL, &KeyHandle, &Disposition) == ERROR_SUCCESS) {
    RegSetValueExA(KeyHandle, Name, 0, REG_BINARY, (CONST BYTE*)Value, (DWORD)strlen(Value)+1);
    RegCloseKey(KeyHandle);
    return true;
  } else
    return false;
}

bool EXECRYPTORAPI  EXECryptor_SecureRead(const char *Name, char *Value)
{
  HKEY KeyHandle;
  DWORD sz,tp;
  bool Result = false;
  *Value=0;
  if (RegOpenKeyExA(HKEY_CURRENT_USER, TestKeyPath, 0, KEY_QUERY_VALUE, &KeyHandle) == ERROR_SUCCESS) {
    tp=REG_BINARY;
    if (RegQueryValueExA(KeyHandle, Name, NULL, &tp, NULL, &sz) == ERROR_SUCCESS) {
      RegQueryValueExA(KeyHandle, Name, NULL, &tp, (BYTE*)Value, &sz);
      Result=true;
    }
    RegCloseKey(KeyHandle);
  };
  return Result;
}

bool EXECRYPTORAPI EXECryptor_SecureWriteW(const wchar_t *Name, const wchar_t *Value)
{
  DWORD Disposition;
  HKEY KeyHandle;
  if (RegCreateKeyExW(HKEY_CURRENT_USER, TestKeyPathW, 0, NULL,
      REG_OPTION_NON_VOLATILE, KEY_SET_VALUE, NULL, &KeyHandle, &Disposition) == ERROR_SUCCESS) {
    RegSetValueExW(KeyHandle, Name, 0, REG_BINARY, (CONST BYTE*)Value, sizeof(wchar_t)*(wcslen(Value)+1));
    RegCloseKey(KeyHandle);
    return true;
  } else
    return false;
}

bool EXECRYPTORAPI EXECryptor_SecureReadW(const wchar_t *Name, wchar_t *Value)
{
  HKEY KeyHandle;
  DWORD sz,tp;
  bool Result = false;
  *Value=0;
  if (RegOpenKeyExW(HKEY_CURRENT_USER, TestKeyPathW, 0, KEY_QUERY_VALUE, &KeyHandle) == ERROR_SUCCESS) {
    tp=REG_BINARY;
    if (RegQueryValueExW(KeyHandle, Name, NULL, &tp, NULL, &sz) == ERROR_SUCCESS) {
      RegQueryValueExW(KeyHandle, Name, NULL, &tp, (BYTE*)Value, &sz);
      Result=true;
    }
    RegCloseKey(KeyHandle);
  };
  return Result;
}

int EXECRYPTORAPI  EXECryptor_MessageBoxA(HWND hWnd, LPCSTR lpText,
  LPCSTR lpCaption, UINT uType)
{
  EMIT5
  return MessageBoxA(hWnd, lpText, lpCaption, uType);
}

FARPROC EXECRYPTORAPI  EXECryptor_GetProcAddr(HMODULE hModule, LPCSTR lpProcName)
{
  EMIT5
  return GetProcAddress(hModule, lpProcName);
}

void EXECRYPTORAPI  EXECryptor_AntiDebug()
{
  EMIT5
}

void EXECRYPTORAPI  EXECryptor_ProtectImport()
{
  EMIT5
}

#endif

#ifdef USE_CRYPT_REG
#ifdef USE_STD_SERIALS

int EXECRYPTORAPI  EXECryptor_VerifySerialNumber(const char *RegName,
  const char *SerialNumber, TSerialNumberInfo *SNInfo, const char *HardwareID)
{
  EMIT5
  return vrOK;
}

int EXECRYPTORAPI  EXECryptor_VerifySerialNumberW(const wchar_t *RegistrationName,
  const wchar_t *SerialNumber, TSerialNumberInfo *SNInfo, const wchar_t *HardwareID)
{
  EMIT5
  return vrOK;
}

int EXECRYPTORAPI  EXECryptor_DecodeSerialNumber(const char *RegistrationName,
  const char *SerialNumber, TSerialNumberInfo *SNInfo, const char *HardwareID)
{
  EMIT5
  return vrOK;
}

int EXECRYPTORAPI  EXECryptor_DecodeSerialNumberW(const wchar_t *RegistrationName,
  const wchar_t *SerialNumber, TSerialNumberInfo *SNInfo, const wchar_t *HardwareID)
{
  EMIT5
  return vrOK;
}

#else

void EXECRYPTORAPI  EXECryptor_SetCodeKey(const void *Key, int Size)
{
  EMIT5
}

#endif

int EXECRYPTORAPI  EXECryptor_IsRegistered()
{
  EMIT5
  return vrOK;
}

int EXECRYPTORAPI  EXECryptor_RegConst_0()
{
  EMIT5
  return 0;
}

int EXECRYPTORAPI  EXECryptor_RegConst_1()
{
  EMIT5
  return 1;
}

int EXECRYPTORAPI  EXECryptor_RegConst_2()
{
  EMIT5
  return 2;
}

int EXECRYPTORAPI  EXECryptor_RegConst_3()
{
  EMIT5
  return 3;
}

int EXECRYPTORAPI  EXECryptor_RegConst_4()
{
  EMIT5
  return 4;
}

int EXECRYPTORAPI  EXECryptor_RegConst_5()
{
  EMIT5
  return 5;
}

int EXECRYPTORAPI  EXECryptor_RegConst_6()
{
  EMIT5
  return 6;
}

int EXECRYPTORAPI  EXECryptor_RegConst_7()
{
  EMIT5
  return 7;
}

#endif

