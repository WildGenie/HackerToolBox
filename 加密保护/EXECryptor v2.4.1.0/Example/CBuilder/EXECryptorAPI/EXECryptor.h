#ifndef EXECRYPTOR_H
#define EXECRYPTOR_H

#include <windows.h>

// EXECryptor API v. 2.3

#define USE_API
//#define USE_CRYPT_REG
//#define USE_STD_SERIALS

#define CRYPT_START { asm {                           \
    DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0F8h \
  }; {

#define CRYPT_START_UNSAFE \
  asm {                           \
    DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0F8h \
  };

#define CRYPT_END   } asm {                           \
    DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0FFh \
  } };

#define CRYPT_END_UNSAFE   asm {                             \
    DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0FFh \
  } 

#ifdef __cplusplus
extern "C" {
#endif

#ifdef USE_API
bool _stdcall _export EXECryptor_IsAppProtected();
const char * _stdcall _export EXECryptor_GetEXECryptorVersion();
void GetReleaseDate(int *Day, int *Month, int *Year);
void SafeGetDate(int *Day, int *Month, int *Year);
DWORD _stdcall _export EXECryptor_GetHardwareID();

void _stdcall _export EXECryptor_EncryptStr(const char *Src, char *Dst);
void _stdcall _export EXECryptor_DecryptStr(const char *Src, char *Dst);
void _stdcall _export EXECryptor_EncryptStrW(const wchar_t *Src, wchar_t *Dst);
void _stdcall _export EXECryptor_DecryptStrW(const wchar_t *Src, wchar_t *Dst);

bool _stdcall _export EXECryptor_SecureWrite(const char *Name, const char *Value);
bool _stdcall _export EXECryptor_SecureRead(const char *Name, char *Value);
bool _stdcall _export EXECryptor_SecureWriteW(const wchar_t *Name, const wchar_t *Value);
bool _stdcall _export EXECryptor_SecureReadW(const wchar_t *Name, wchar_t *Value);

int _stdcall _export EXECryptor_GetTrialDaysLeft(int TrialPeriod);
int _stdcall _export EXECryptor_GetTrialRunsLeft(int TrialRuns);

int _stdcall _export EXECryptor_MessageBoxA(HWND hWnd, LPCSTR lpText,
  LPCSTR lpCaption, UINT uType);
FARPROC _stdcall _export EXECryptor_GetProcAddr(HMODULE hModule, LPCSTR lpProcName);

void _stdcall _export EXECryptor_AntiDebug();
void _stdcall _export EXECryptor_ProtectImport();
#endif

#ifdef USE_CRYPT_REG

#define CRYPT_REG   { asm {                           \
    DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0F9h \
  }; {

#define CRYPT_REG_UNSAFE   asm {                      \
    DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0F9h \
  };

#define CRYPT_UNREG   { asm {                           \
    DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0FAh \
  }; {

#define CRYPT_UNREG_UNSAFE   asm {                      \
    DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0FAh \
  };

enum TVerifyResult { vrInvalid, vrExpired, vrStolen, vrOK };

TVerifyResult _stdcall _export EXECryptor_IsRegistered();

#ifdef USE_STD_SERIALS
                                      
#pragma option push -a1
typedef struct {
  int LicType;    //0..15
  // if LicType = 1 then we get ExpiryMonth/ExpiryYear
  // otherwise we get UserParam
  int UserParam;  //0..1023
  int ExpiryMonth,//1..12
      ExpiryYear; //2004..2024
  bool F1,F2,F3,F4,F5,F6;
} TSerialNumberInfo;
#pragma option pop

TVerifyResult _stdcall _export EXECryptor_VerifySerialNumber(const char *RegistrationName,
  const char *SerialNumber, TSerialNumberInfo *SNInfo = NULL, const char *HardwareID = NULL);

TVerifyResult _stdcall _export EXECryptor_VerifySerialNumberW(const wchar_t *RegistrationName,
  const wchar_t *SerialNumber, TSerialNumberInfo *SNInfo = NULL, const wchar_t *HardwareID = NULL);

TVerifyResult _stdcall _export EXECryptor_DecodeSerialNumber(const char *RegistrationName,
  const char *SerialNumber, TSerialNumberInfo *SNInfo = NULL, const char *HardwareID = NULL);

TVerifyResult _stdcall _export EXECryptor_DecodeSerialNumberW(const wchar_t *RegistrationName,
  const wchar_t *SerialNumber, TSerialNumberInfo *SNInfo = NULL, const wchar_t *HardwareID = NULL);
  
#else

void _stdcall _export EXECryptor_SetCodeKey(const void *Key, int Size);

#endif

DWORD _stdcall _export EXECryptor_RegConst_0();
DWORD _stdcall _export EXECryptor_RegConst_1();
DWORD _stdcall _export EXECryptor_RegConst_2();
DWORD _stdcall _export EXECryptor_RegConst_3();
DWORD _stdcall _export EXECryptor_RegConst_4();
DWORD _stdcall _export EXECryptor_RegConst_5();
DWORD _stdcall _export EXECryptor_RegConst_6();
DWORD _stdcall _export EXECryptor_RegConst_7();
#endif

#ifdef __cplusplus
};
#endif

#endif
