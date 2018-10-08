#ifndef OBSIDIUMH
#define OBSIDIUMH

#define CALLMARK_REG_START      0x00DEFACED
#define CALLMARK_REG_END        0x0DEADF00D

#ifdef __BORLANDC__

 #define PATTERN_REG_START __emit__ (0xEB,0x08,0x0F,0x04,0x0F,0x05,0x0F,0x07,0xCC,0xCC);
 #define PATTERN_REG_END   __emit__ (0xEB,0x08,0x0F,0x05,0x0F,0x04,0xCC,0x0F,0x07,0xCC);
 #define PATTERN_ENC_START __emit__ (0xEB,0x09,0xDE,0xAD,0xBE,0xEF,0x0F,0x07,0xCC,0xCC,0xCC);
 #define PATTERN_ENC_END   __emit__ (0xEB,0x09,0xDE,0xAD,0xBE,0xEF,0x0F,0x05,0xCC,0xCC,0xCC);
 #define PATTERN_VM_START  __emit__ (0xEB,0x04,0x0F,0x0B,0x0F,0x0B);
 #define PATTERN_VM_END    __emit__ (0xEB,0x04,0x0F,0x0B,0x0F,0x06);

#else

 #define PATTERN_REG_START \
  __asm _emit 0xEB \
  __asm _emit 0x08 \
  __asm _emit 0x0F \
  __asm _emit 0x04 \
  __asm _emit 0x0F \
  __asm _emit 0x05 \
  __asm _emit 0x0F \
  __asm _emit 0x07 \
  __asm _emit 0xCC \
  __asm _emit 0xCC

 #define PATTERN_REG_END \
  __asm _emit 0xEB \
  __asm _emit 0x08 \
  __asm _emit 0x0F \
  __asm _emit 0x05 \
  __asm _emit 0x0F \
  __asm _emit 0x04 \
  __asm _emit 0xCC \
  __asm _emit 0x0F \
  __asm _emit 0x07 \
  __asm _emit 0xCC

 #define PATTERN_ENC_START \
  __asm _emit 0xEB \
  __asm _emit 0x09 \
  __asm _emit 0xDE \
  __asm _emit 0xAD \
  __asm _emit 0xBE \
  __asm _emit 0xEF \
  __asm _emit 0x0F \
  __asm _emit 0x07 \
  __asm _emit 0xCC \
  __asm _emit 0xCC \
  __asm _emit 0xCC

 #define PATTERN_ENC_END \
  __asm _emit 0xEB \
  __asm _emit 0x09 \
  __asm _emit 0xDE \
  __asm _emit 0xAD \
  __asm _emit 0xBE \
  __asm _emit 0xEF \
  __asm _emit 0x0F \
  __asm _emit 0x05 \
  __asm _emit 0xCC \
  __asm _emit 0xCC \
  __asm _emit 0xCC

#define PATTERN_VM_START \
  __asm _emit 0xEB \
  __asm _emit 0x04 \
  __asm _emit 0x0F \
  __asm _emit 0x0B \
  __asm _emit 0x0F \
  __asm _emit 0x0B

#define PATTERN_VM_END \
  __asm _emit 0xEB \
  __asm _emit 0x04 \
  __asm _emit 0x0F \
  __asm _emit 0x0B \
  __asm _emit 0x0F \
  __asm _emit 0x06

#endif

#ifdef __cplusplus

 extern "C" void __declspec(dllimport) _stdcall CallMark(DWORD dwMagic);
 extern "C" unsigned short __declspec(dllimport) _stdcall getCustomValue();
 extern "C" bool __declspec(dllimport) _stdcall getLicenseExpiration(FILETIME* lpExpDate);
 extern "C" bool __declspec(dllimport) _stdcall getLicenseHash(char* lpHash);
 extern "C" int __declspec(dllimport) _stdcall getLicenseStatus();
 extern "C" bool __declspec(dllimport) _stdcall getRegInfo(DWORD dwInfoNr, char *lpBuffer);
 extern "C" bool __declspec(dllimport) _stdcall getSystemID(char *lpBuffer);
 extern "C" int __declspec(dllimport) _stdcall getTrialDays();
 extern "C" int __declspec(dllimport) _stdcall getTrialRuns();
 extern "C" bool __declspec(dllimport) _stdcall isRegistered();
 extern "C" void __declspec(dllimport) _stdcall setExternalKey(const char *lpKey, DWORD dwSize);
 extern "C" bool __declspec(dllimport) _stdcall setLicense(const char *lpStr);
 extern "C" bool __declspec(dllimport) _stdcall setLicenseShort(const char *lpInfo, const char *lpKey);
 extern "C" bool __declspec(dllimport) _stdcall storeLicense(const char *lpStr);
 extern "C" bool __declspec(dllimport) _stdcall storeLicenseShort(const char *lpInfo, const char *lpKey);
 extern "C" void __declspec(dllimport) _stdcall deleteTrialData();

#else

 void __declspec(dllimport) _stdcall CallMark(DWORD dwMagic);
 unsigned short int __declspec(dllimport) _stdcall getCustomValue();
 int __declspec(dllimport) _stdcall getLicenseHash(char* lpHash);
 int __declspec(dllimport) _stdcall getLicenseStatus();
 int __declspec(dllimport) _stdcall getRegInfo(DWORD dwInfoNr, char* lpBuffer);
 int __declspec(dllimport) _stdcall getSystemID(char* lpBuffer);
 int __declspec(dllimport) _stdcall getTrialDays();
 int __declspec(dllimport) _stdcall getTrialRuns();
 int __declspec(dllimport) _stdcall isRegistered();
 void __declspec(dllimport) _stdcall setExternalKey(const char* lpKey, DWORD dwSize);
 int __declspec(dllimport) _stdcall getLicenseExpiration(FILETIME* lpExpDate);
 int __declspec(dllimport) _stdcall setLicense(const char* lpStr);
 int __declspec(dllimport) _stdcall setLicenseShort(const char *lpInfo, const char *lpKey);
 int __declspec(dllimport) _stdcall storeLicense(const char* lpStr);
 int __declspec(dllimport) _stdcall storeLicenseShort(const char *lpInfo, const char *lpKey);
 void __declspec(dllimport) _stdcall deleteTrialData();

#endif

// getLicenseStatus return values
#define LIC_STATUS_NOTFOUND     0       // no license key found
#define LIC_STATUS_VALID        1       // valid license key present
#define LIC_STATUS_EXPIRED      2       // license key has expired
#define LIC_STATUS_BAD_SYSTEMID 3       // system ID does not match
#define LIC_STATUS_INVALID      4       // invalid or corrupt key
#define LIC_STATUS_BLACKLISTED  5       // license key is blacklisted

// command line return values
#define OBSIDIUM_CMDLINE_SUCCESS        0
#define OBSIDIUM_CMDLINE_FAIL_PROJECT   1
#define OBSIDIUM_CMDLINE_FAIL_INFILE    2
#define OBSIDIUM_CMDLINE_FAIL_OUTFILE   3
#define OBSIDIUM_CMDLINE_FAIL_PROTECT   4

// constants used with custom nag screens
#define IDC_BTN_CONTINUE        100
#define IDC_BTN_EXIT            101
#define IDC_BTN_ACTION1         102
#define IDC_BTN_ACTION2         103
#define IDC_BTN_ACTION3         104
#define IDC_BTN_ACTION4         105
#define IDC_BTN_ACTION5         106
#define IDS_ACTIONSTRING1       102
#define IDS_ACTIONSTRING2       103
#define IDS_ACTIONSTRING3       104
#define IDS_ACTIONSTRING4       105
#define IDS_ACTIONSTRING5       106

#endif
