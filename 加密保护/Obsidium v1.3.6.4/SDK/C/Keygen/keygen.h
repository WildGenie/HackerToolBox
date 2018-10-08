/*

	Obsidium license key generation library header file

*/

#ifndef OBSIDIUM_KEYGEN_H
#define OBSIDIUM_KEYGEN_H

// error codes returned by GenerateKeyfile and GenerateShortKey
#define KEYGEN_ERROR                    0       // internal error
#define KEYGEN_INVALID_PARAMETER        -1      // invalid parameter passed to function
#define KEYGEN_OPF_OPEN_ERROR           -2      // error opening project file
#define KEYGEN_OPF_INVALID              -3      // invalid project file
#define KEYGEN_OPF_ERROR                -4      // no keys found in project file or read error
#define KEYGEN_FAIL_ALLOC               -5      // memory allocation error

// error codes returned by VerifyKeyfile and VerifyShortKey
#define KEYFILE_VER_OK                  0       // keyfile verification successful
#define KEYFILE_VER_FAIL                2       // keyfile is invalid
#define KEYFILE_VER_INVALID_PARAM       -1      // invalid parameter passed to function
#define KEYFILE_VER_OPEN_ERROR          -2      // error opening project file
#define KEYFILE_VER_OPF_INVALID         -3      // invalid project file
#define KEYFILE_VER_FAIL_ALLOC          -4      // memory allocation error
#define KEYFILE_VER_FAIL_BUSY           -5      // the library is busy generating another key

// flags passed to GetLicenseHash
#define LICENSE_BIN                     0       // binary key
#define LICENSE_TEXT                    1       // text key
#define LICENSE_SHORT                   2       // short key

// structure passed to GenerateKeyfile
typedef struct
{
        DWORD dwSize;           // size of this structure
        char *lpInfo1;          // pointer to license info
        char *lpInfo2;          // ""
        char *lpInfo3;          // ""
        char *lpExtInfo;        // ""
        char *lpSystemID;       // pointer to system id string
        FILETIME* lpExpDate;    // pointer to expiration date
        void *lpBuffer;         // pointer to output buffer
        char *lpProjectFile;    // pointer to project filename
} KEYFILE_INFO;

// flags used in SHORTKEY_INFO
#define SHORTKEY_FLAG_ADVANCED          1       // create advanced short license key
#define SHORTKEY_FLAG_EXPIRE            2       // license key expires and lpExpDate is valid, SHORTKEY_FLAG_ADVANCED must be set
#define SHORTKEY_FLAG_SYSTEMID          4       // key is system-specific and lpSystemID is valid

// structure passed to GenerateShortKey
typedef struct
{
        DWORD   dwSize;         // size of this structure
        char    *lpInfo;        // pointer to license info string
        char    *lpProjectFile; // pointer to project file name
        char    *lpSystemID;    // pointer to system ID string, optional
        FILETIME *lpExpDate;    // pointer to expiration date, optional
        char    *lpBuffer;      // pointer to input/output buffer
        DWORD   dwFlags;        // flags
        DWORD   dwCustom;       // custom value
} SHORTKEY_INFO;


// functions
#ifdef __cplusplus

 extern "C" int __declspec(dllimport) _stdcall VerifyKeyfile(KEYFILE_INFO* lpInfo);
 extern "C" int __declspec(dllimport) _stdcall GenerateKeyfile(KEYFILE_INFO* lpInfo);
 extern "C" bool __declspec(dllimport) _stdcall ConvertToString(void *lpKeyfile, DWORD dwSize, char *lpBuffer);
 extern "C" DWORD __declspec(dllimport) _stdcall ConvertToBin(char *lpString, void *lpBuffer);
 extern "C" int __declspec(dllimport) _stdcall GenerateShortKey(SHORTKEY_INFO* lpInfo);
 extern "C" int __declspec(dllimport) _stdcall VerifyShortKey(SHORTKEY_INFO* lpInfo);
 extern "C" bool __declspec(dllimport) _stdcall GetLicenseHash(void* lpLicense, DWORD dwType, char *lpHash);

 #else

 int __declspec(dllimport) _stdcall VerifyKeyfile(KEYFILE_INFO* lpInfo);
 int __declspec(dllimport) _stdcall GenerateKeyfile(KEYFILE_INFO* lpInfo);
 int __declspec(dllimport) _stdcall ConvertToString(void *lpKeyfile, DWORD dwSize, char *lpBuffer);
 DWORD __declspec(dllimport) _stdcall ConvertToBin(char *lpString, void *lpBuffer);
 int __declspec(dllimport) _stdcall GenerateShortKey(SHORTKEY_INFO* lpInfo);
 int __declspec(dllimport) _stdcall VerifyShortKey(SHORTKEY_INFO* lpInfo);
 int __declspec(dllimport) _stdcall GetLicenseHash(void* lpLicense, DWORD dwType, char *lpHash);

#endif

#endif
