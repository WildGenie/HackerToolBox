#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

typedef struct _KEYDATE {
	BYTE	Day;
	BYTE	Month;
	WORD	Year;
} KEYDATE, *PKEYDATE;

typedef struct _PARAMS {
	LPBYTE	RegInfo;            // address of buffer for registration information
	DWORD   RegInfoLen;			// size in bytes of registration information
	LPTSTR  HardwareID;         // hardware ID (base64)
	LPTSTR  A;                  // 
	LPTSTR  E;                  // constants from project file ('Key' section)
	LPTSTR  N;                  //   
	LPBYTE  RegKey;             // buffer for registration key
	DWORD   RegKeySize;         // size in bytes of registration key
	KEYDATE	ExpirationDate;
} PARAMS, *PPARAMS;

#define CheckHardwareIDName			_T("CheckHardwareID")
#define RegistrationKeyGenerateName		_T("RegistrationKeyGenerate")
#define RegistrationKeySaveName			_T("RegistrationKeySave")
#define RegistrationKeyGenerateProject		_T("RegistrationKeyGenerateProject")

typedef BOOL  (__stdcall *ASPCheckHardwareID)(IN LPTSTR HardwareID);
typedef DWORD (__stdcall *ASPRegistrationKeyGenerate)(IN OUT PARAMS *Params);
typedef DWORD (__stdcall *ASPRegistrationKeySave)(IN LPTSTR FileName, IN LPTSTR RegistrySubKey, IN LPTSTR RegistryKey, IN LPTSTR RegistrationKey);
typedef DWORD (__stdcall *ASPRegistrationKeyGenerateProject)(IN LPTSTR ProjectFileName, IN LPTSTR RegInfo, IN LPTSTR HardwareID, IN LPTSTR RegKeyFileName);
