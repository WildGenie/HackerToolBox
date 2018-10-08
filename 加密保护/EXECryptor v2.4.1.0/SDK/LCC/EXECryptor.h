#ifndef EXECRYPTOR_H
#define EXECRYPTOR_H

#include <win.h>
#include <stdbool.h>
#include <wchar.h>

// EXECryptor API v. 2.3

#define USE_API
#define USE_CRYPT_REG
#define USE_STD_SERIALS

#define EXECRYPTORAPI __declspec(dllexport) _stdcall

#ifdef USE_API

extern bool EXECRYPTORAPI EXECryptor_IsAppProtected(void);
extern const char EXECRYPTORAPI * EXECryptor_GetEXECryptorVersion(void);
extern void GetReleaseDate(int *Day, int *Month, int *Year);

extern void SafeGetDate(int *Day, int *Month, int *Year);
extern DWORD EXECRYPTORAPI  EXECryptor_GetHardwareID();

extern void EXECRYPTORAPI  EXECryptor_EncryptStr(const char *Src, char *Dst);
extern void EXECRYPTORAPI  EXECryptor_DecryptStr(const char *Src, char *Dst);
extern void EXECRYPTORAPI  EXECryptor_EncryptStrW(const wchar_t *Src, wchar_t *Dst);
extern void EXECRYPTORAPI  EXECryptor_DecryptStrW(const wchar_t *Src, wchar_t *Dst);

extern bool EXECRYPTORAPI  EXECryptor_SecureWrite(const char *Name, const char *Value);
extern bool EXECRYPTORAPI  EXECryptor_SecureRead(const char *Name, char *Value);
extern bool EXECRYPTORAPI  EXECryptor_SecureWriteW(const wchar_t *Name, const wchar_t *Value);
extern bool EXECRYPTORAPI  EXECryptor_SecureReadW(const wchar_t *Name, wchar_t *Value);

extern int EXECRYPTORAPI  EXECryptor_GetTrialDaysLeft(int TrialPeriod);
extern int EXECRYPTORAPI  EXECryptor_GetTrialRunsLeft(int TrialRuns);

extern int EXECRYPTORAPI  EXECryptor_MessageBoxA(HWND hWnd, LPCSTR lpText,
  LPCSTR lpCaption, UINT uType);
extern FARPROC EXECRYPTORAPI  EXECryptor_GetProcAddr(HMODULE hModule, LPCSTR lpProcName);

extern void EXECRYPTORAPI  EXECryptor_AntiDebug();
extern void EXECRYPTORAPI  EXECryptor_ProtectImport();
#endif

#ifdef USE_CRYPT_REG

#define vrInvalid 0
#define vrExpired 1
#define vrStolen 2
#define vrOK 3

#ifdef USE_STD_SERIALS

#pragma pack(push,1)
typedef struct {
  int LicType;    //0..15
  // if LicType = 1 then we get ExpiryMonth/ExpiryYear
  // otherwise we get UserParam
  int UserParam;  //0..1023
  int ExpiryMonth,//1..12
      ExpiryYear; //2004..2024
  unsigned char F1,F2,F3,F4,F5,F6;
} TSerialNumberInfo;
#pragma pack(pop)

extern int EXECRYPTORAPI  EXECryptor_VerifySerialNumber(const char *RegName,
  const char *SerialNumber, TSerialNumberInfo *SNInfo = NULL, const char *HardwareID = NULL);

extern int EXECRYPTORAPI  EXECryptor_VerifySerialNumberW(const wchar_t *RegistrationName,
  const wchar_t *SerialNumber, TSerialNumberInfo *SNInfo = NULL, const wchar_t *HardwareID = NULL);

extern int EXECRYPTORAPI  EXECryptor_DecodeSerialNumber(const char *RegistrationName,
  const char *SerialNumber, TSerialNumberInfo *SNInfo = NULL, const char *HardwareID = NULL);

extern int EXECRYPTORAPI  EXECryptor_DecodeSerialNumberW(const wchar_t *RegistrationName,
  const wchar_t *SerialNumber, TSerialNumberInfo *SNInfo = NULL, const wchar_t *HardwareID = NULL);

#else

extern void EXECRYPTORAPI  EXECryptor_SetCodeKey(const void *Key, int Size);

#endif

extern int EXECRYPTORAPI  EXECryptor_IsRegistered();

extern int EXECRYPTORAPI  EXECryptor_RegConst_0();
extern int EXECRYPTORAPI  EXECryptor_RegConst_1();
extern int EXECRYPTORAPI  EXECryptor_RegConst_2();
extern int EXECRYPTORAPI  EXECryptor_RegConst_3();
extern int EXECRYPTORAPI  EXECryptor_RegConst_4();
extern int EXECRYPTORAPI  EXECryptor_RegConst_5();
extern int EXECRYPTORAPI  EXECryptor_RegConst_6();
extern int EXECRYPTORAPI  EXECryptor_RegConst_7();

#endif

#define CRYPT_START { \
  _asm("  .byte 235,6,235,252,235,252,255,248"); {

#define CRYPT_START_UNSAFE   \
  _asm("  .byte 235,6,235,252,235,252,255,248");

#define CRYPT_END  } \
  _asm("  .byte 235,6,235,252,235,252,255,255"); }

#define CRYPT_END_UNSAFE    \
  _asm("  .byte 235,6,235,252,235,252,255,255");

#ifdef USE_CRYPT_REG

#define CRYPT_REG  { \
  _asm("  .byte 235,6,235,252,235,252,255,249"); {

#define CRYPT_REG_UNSAFE   \
  _asm("  .byte 235,6,235,252,235,252,255,249");

#define CRYPT_UNREG  { \
  _asm("  .byte 235,6,235,252,235,252,255,250"); {

#define CRYPT_UNREG_UNSAFE   \
  _asm("  .byte 235,6,235,252,235,252,255,250");

#endif
#endif

