/* PELock v1.05, Bartosz Wojcik */

#ifndef __PELOCK_KEYGEN__
#define __PELOCK_KEYGEN__

/* Keygen returned values */
#define KEYGEN_OK 1
#define KEYGEN_DATA_ERR 2
#define KEYGEN_INIT_ERR 3

/* keygen.dll prototypes */
typedef unsigned int __stdcall (* _Keygen)(char *, unsigned int, char *, SYSTEMTIME *, void *, unsigned int *, char *, unsigned int);

#ifdef __cplusplus
extern "C" {
#endif

//__declspec(dllexport) unsigned int __stdcall Keygen(const char *lpUserName,unsigned int iAdditionalKeyData,unsigned int iHardwareId, SYSTEMTIME *lpKeyExpirationDate, void *lpKeyData, unsigned int *iKeyData, const char *lpProjectFileName,unsigned int bUpdateProjectFlag);

unsigned int __stdcall Keygen(const char *lpUserName,unsigned int iAdditionalKeyData,const char *lpHardwareId, SYSTEMTIME *lpKeyExpirationDate, void *lpKeyData, unsigned int *iKeyData, const char *lpProjectFileName,unsigned int bUpdateProjectFlag);

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* __PELOCK_KEYGEN__ */