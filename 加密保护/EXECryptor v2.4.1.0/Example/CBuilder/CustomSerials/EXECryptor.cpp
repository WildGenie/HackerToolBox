// EXECryptor API v. 2.3
//---------------------------------------------------------------------------
#pragma hdrstop

#pragma option push
#pragma option -Od

#include "EXECryptor.h"
#include <string.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)

//#define ANTIDEBUG_ON_INIT

#ifdef USE_API

extern "C" bool _stdcall _export EXECryptor_IsAppProtected()
{
  return false;
}

extern "C" const char * _stdcall _export EXECryptor_GetEXECryptorVersion()
{
  return "UNPROTECTED";
}

extern "C" DWORD _stdcall _export EXECryptor_GetReleaseDate()
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
  CRYPT_START
  *Day = dt & 0x1F;
  *Month = (dt >> 5) & 0xF;
  *Year = (dt >> 9)+1980;
  CRYPT_END
}

extern "C" DWORD _stdcall _export EXECryptor_GetDate()
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
  CRYPT_START
  *Day = dt & 0x1F;
  *Month = (dt >> 5) & 0xF;
  *Year = (dt >> 9)+1980;
  CRYPT_END
}

DWORD _stdcall _export EXECryptor_GetHardwareID()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 0;
}

void _stdcall _export EXECryptor_EncryptStr(const char *Src, char *Dst)
{
  strcpy(Dst,Src);
}

void _stdcall _export EXECryptor_DecryptStr(const char *Src, char *Dst)
{
  strcpy(Dst,Src);
}

void _stdcall _export EXECryptor_EncryptStrW(const wchar_t *Src, wchar_t *Dst)
{
  wcscpy(Dst,Src);
}

void _stdcall _export EXECryptor_DecryptStrW(const wchar_t *Src, wchar_t *Dst)
{
  wcscpy(Dst,Src);
}

const
  char *TestKeyPath = "Software\\EXECryptorTestKeys";
  wchar_t *TestKeyPathW = L"Software\\EXECryptorTestKeys";

bool _stdcall _export EXECryptor_SecureWrite(const char *Name, const char *Value)
{
  DWORD Disposition;
  HKEY KeyHandle;
  if (RegCreateKeyExA(HKEY_CURRENT_USER, TestKeyPath, 0, NULL,
      REG_OPTION_NON_VOLATILE, KEY_SET_VALUE, NULL, &KeyHandle, &Disposition) == ERROR_SUCCESS) {
    RegSetValueExA(KeyHandle, Name, 0, REG_BINARY, (CONST BYTE*)Value, strlen(Value)+1);
    RegCloseKey(KeyHandle);
    return true;
  } else
    return false;
}

bool _stdcall _export EXECryptor_SecureRead(const char *Name, char *Value)
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

bool _stdcall _export EXECryptor_SecureWriteW(const wchar_t *Name, const wchar_t *Value)
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

bool _stdcall _export EXECryptor_SecureReadW(const wchar_t *Name, wchar_t *Value)
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

int _stdcall _export EXECryptor_GetTrialDaysLeft(int TrialPeriod)
{
  return TrialPeriod;
}

int _stdcall _export EXECryptor_GetTrialRunsLeft(int TrialRuns)
{
  return TrialRuns;
}

int _stdcall _export EXECryptor_MessageBoxA(HWND hWnd, LPCSTR lpText,
  LPCSTR lpCaption, UINT uType)
{
  return MessageBoxA(hWnd, lpText, lpCaption, uType);
}

FARPROC _stdcall _export EXECryptor_GetProcAddr(HMODULE hModule, LPCSTR lpProcName)
{
  return GetProcAddress(hModule, lpProcName);
}

void _stdcall _export EXECryptor_AntiDebug()
{
  asm {
    db 090h,090h,090h,090h,090h
  };
}

void _stdcall _export EXECryptor_ProtectImport()
{
  asm {
    db 090h,090h,090h,090h,090h
  };
}

#ifdef ANTIDEBUG_ON_INIT
class TInitialize {
  public:
  TInitialize() {
  EXECryptor_ProtectImport();
  EXECryptor_AntiDebug();
  }
};

static TInitialize _TInitialize;
#endif

#endif

#ifdef USE_CRYPT_REG
#ifdef USE_STD_SERIALS

TVerifyResult _stdcall _export EXECryptor_VerifySerialNumber(const char *RegistrationName,
  const char *SerialNumber, 
  TSerialNumberInfo *SNInfo, const char *HardwareID)
{
  asm {
    db 090h,090h,090h,090h
  };
  return vrOK;
}

TVerifyResult _stdcall _export EXECryptor_VerifySerialNumberW(const wchar_t *RegistrationName,
  const wchar_t *SerialNumber, TSerialNumberInfo *SNInfo, const wchar_t *HardwareID)
{
  asm {
    db 090h,090h,090h,090h
  };
  return vrOK;
}

TVerifyResult _stdcall _export EXECryptor_DecodeSerialNumber(const char *RegistrationName,
  const char *SerialNumber, TSerialNumberInfo *SNInfo, const char *HardwareID)
{
  asm {
    db 090h,090h,090h,090h
  };
  return vrOK;
}

TVerifyResult _stdcall _export EXECryptor_DecodeSerialNumberW(const wchar_t *RegistrationName,
  const wchar_t *SerialNumber, TSerialNumberInfo *SNInfo, const wchar_t *HardwareID)
{
  asm {
    db 090h,090h,090h,090h
  };
  return vrOK;
}

#else

void _stdcall _export EXECryptor_SetCodeKey(const void *Key, int Size)
{
  asm {
    db 090h,090h,090h,090h
  };
}

#endif

TVerifyResult _stdcall _export EXECryptor_IsRegistered()
{
  asm {
    db 090h,090h,090h,090h
  };
  return vrOK;
}

DWORD _stdcall _export EXECryptor_RegConst_0()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 0;
}

DWORD _stdcall _export EXECryptor_RegConst_1()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 1;
}

DWORD _stdcall _export EXECryptor_RegConst_2()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 2;
}

DWORD _stdcall _export EXECryptor_RegConst_3()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 3;
}

DWORD _stdcall _export EXECryptor_RegConst_4()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 4;
}

DWORD _stdcall _export EXECryptor_RegConst_5()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 5;
}

DWORD _stdcall _export EXECryptor_RegConst_6()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 6;
}

DWORD _stdcall _export EXECryptor_RegConst_7()
{
  asm {
    db 090h,090h,090h,090h
  };
  return 7;
}
#endif

#pragma option pop

