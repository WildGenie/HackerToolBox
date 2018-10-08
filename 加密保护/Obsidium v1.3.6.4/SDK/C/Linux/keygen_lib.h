#ifndef HKEYGEN_LIB
#define HKEYGEN_LIB

#include "keygen.h"

// functions 'exported' from this library
typedef int (*ConvertToBinC_t)(char*, void*);
typedef int (*ConvertToStringC_t)(void*, unsigned long, char*);
typedef int (*GenerateKeyfileC_t)(KEYFILE_INFO*);
typedef int (*VerifyKeyfileC_t)(KEYFILE_INFO*);
typedef int (*GenerateShortKeyC_t)(SHORTKEY_INFO*);
typedef int (*VerifyShortKeyC_t)(SHORTKEY_INFO*);
typedef int (*GetLicenseHashC_t)(void*, unsigned long, char*);

// functions 'imported' from object file
extern "C" void Init();
extern "C" void Free();
extern "C" int GenerateKeyfile_wrap(KEYFILE_INFO*);
extern "C" int VerifyKeyfile_wrap(KEYFILE_INFO*);
extern "C" int GenerateShortKey_wrap(SHORTKEY_INFO*);
extern "C" int VerifyShortKey_wrap(SHORTKEY_INFO*);
extern "C" int ConvertToString_wrap(void*, unsigned long, char*);
extern "C" int ConvertToBin_wrap(char*, void*);
extern "C" int GetLicenseHash_wrap(void* lpLicense, unsigned long dwType, char *lpHash);

#endif
