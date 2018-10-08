//***************************************************************
//  eXPressorSdk.h   version:  1.0.2   ·  date: 02/27/2007
//  -------------------------------------------------------------
//  Copyright (C) 2007 CGSoftLabs - All Rights Reserved
// ***************************************************************
//  Include this file in your project
// ***************************************************************
#ifndef _API_DEF
#define _API_DEF
///////////////////////////////////////////////////////////////////
//STRUCTS USED WITH REGKEYS
typedef struct _MDATE {
	BYTE	Day;
	BYTE	Month;
	WORD	Year;
}MDATE,KEYDATE,*PMDATE;

typedef struct _PROGRVER {
	BYTE	Maj1;
	BYTE	Maj2;
	BYTE	Min1;
	BYTE	Min2;
}PROGRVER, *PPROGRVER;

typedef struct _KEY_PARAMS {
	LPBYTE	btUserInfo;         // [IN] address of buffer which holds UserName
	WORD    wUserInfoSize;		// [IN] size in bytes of UserName
	LPBYTE  btMachineID;		// [IN] MachineID sting
	WORD    wMachineIDSize;		// [IN] size in bytes of UserName
	WORD	wRsaKeyType;		// [IN] from project file [KeyGeneration] RSAKey=
	KEYDATE	ExpirationDate;		// [IN] desired key expiration date
	PROGRVER ProgVersion;		// [IN] constant from project file [Protection] FileVersion=
	int		ExpVerFlag;			// [IN] key will unlock only max specified versions
	DWORD	dwEncryptionKey;	// [IN] from project file [KeyGeneration] EncryptCodeKey=
	LPTSTR  P1;                 // [IN] constant from project file [KeyGeneration] P1=
	LPTSTR  P2;                 // [IN] constant from project file [KeyGeneration] P2=
	LPTSTR  P3;                 // [IN] constant from project file [KeyGeneration] P3=
	LPBYTE  btRegKey;           // [OUT] buffer for receiving the registration key
	WORD    wRegKeySize;        // [IN][OUT] size in bytes of btRegKey
	WORD	wKeyID;				// reserved for later use
	DWORD	dwUnlockS;			// reserved for later use
} KEY_PARAMS, *PKEY_PARAMS;


//EXPORTED FUNCTIONS PREFIX MACRO
#define DLL_EXP					__declspec(dllexport)	//USE THIS FOR .C FILES
#define DLL_CPP_EXP				extern "C" DLL_EXP		//USE THIS FOR .CPP FILES

//USER KEY STATUS FLAGS
#define USER_KEY_NO_INTERNAL_REG_SCHEME 0x80000000 //PROJECT WASN'T COMPILED WITH RSA ENABLED
#define USER_KEY_IS_STOLEN				0x40000000 //THE USER KEY IS STOLEN
#define USER_KEY_IS_INVALID				0x20000000 //PROVIDED USER KEY IS INVALID (BAD LENGHT,USER NAME, HDD_ID, ON DECRYPTION ETC.)
#define USER_KEY_DATE_EXPIRED			0x10000000 //PROVIDED USER KEY EXPIRED BY DATE
#define USER_KEY_VERSION_EXPIRED		0x08000000 //USER KEY DOES NOT WORK ON THIS NEW VERSIONS
#define USER_KEY_OK						0x04000000 //USE THIS FLAG TO DECRYPT ENCRYPTED BLOCKS
#define USER_KEY_SUPPORT_EXPIRED		0x02000000 //WE HAVE COMPILED THE EXE WITH KEY SUPPORT FLAG ENABLED AND THE SUPPORT ENDED


//OTHER FUNCTIONS TEMPLATES
typedef BOOL  (*eXP_bFnPtr)();
typedef void  (*eXP_FnPtr)();
typedef BOOL  (*eXP_GetMachineID)(LPTSTR MachineID,BYTE btFlag);

/*
//SUPPORTED API (HOOKED BY eXPressor)
//REGISTRATION KEYS
void  __stdcall GetMachineID_FnPtr(eXP_GetMachineID MachineIDFN);
BOOL  __stdcall SetMachineID(LPSTR MachineID);
BOOL  __stdcall SetUserName(LPSTR UserName);
BOOL  __stdcall SetUserKey(LPBYTE UserKey,PDWORD dwSize);
void  __stdcall GetKeyExpireDate(PMDATE pExpDate, WORD wLeft);
void  __stdcall GetKeyStatus(DWORD dwKeyFlags);//SEE USER KEY STATUS FLAGS
//TRIAL&EXPIRATION
void  __stdcall SetExpireRegistryPath(LPSTR KeyPath, LPSTR ValueName); //you can copy max 254 chars each param
void  __stdcall GetResetTrialInfo_FnPtr(eXP_FnPtr ResetTrial);
void  __stdcall GetTrialDays(WORD wTotal,WORD wLeft);
void  __stdcall GetTrialExecs(WORD wTotal, WORD wLeft);
void  __stdcall GetExpireDate(PMDATE pExpDate);
//PROGRAM FLOW CONTROL
void  __stdcall GetRunApp_FNPtr(eXP_FnPtr RunAppFn);
void  __stdcall ExecAppHasExpired();	//CALLED IF THE KEY OR TRIAL EXPIRES
void  __stdcall ExecAppNormal();		//CALLED IF THE KEY IS OK OR TRIAL IS NOT EXPIRED
//CODE FRAGMENTS DECRYPTION
void  __stdcall GetDecrypt_FnPtr(eXP_bFnPtr DecryptFN);//RECEIVE A POINTER TO A FUNCTION WHICH DECRYPT PROTECTED CODE BLOCKS
BOOL  __stdcall SetExternalKey(LPBYTE pKey, PDWORD dwKeySize);
*/

//DEFINED FOR eXPressor's INTERNAL USE
//REGISTRATION KEYS
typedef VOID  (__stdcall *eXP_GetMachineID_FnPtr)(eXP_GetMachineID MachineIDFN);
typedef BOOL  (__stdcall *eXP_SetMachineID)(LPSTR MachineID);
typedef BOOL  (__stdcall *eXP_SetUserName)(LPSTR UserName);
typedef BOOL  (__stdcall *eXP_SetUserKey)(LPBYTE UserKey,PDWORD dwSize);
typedef VOID  (__stdcall *eXP_GetKeyExpireDate)(PMDATE pExpDate, WORD wLeft);
typedef VOID  (__stdcall *eXP_GetKeyStatus)(DWORD dwKeyFlags);//SEE USER KEY STATUS FLAGS
//TRIAL&EXPIRATION
typedef VOID  (__stdcall *eXP_SetExpireRegistryPath)(LPSTR KeyPath, LPSTR ValueName); //you can copy max 254 chars each param
typedef VOID  (__stdcall *eXP_GetResetTrialInfo_FnPtr)(eXP_FnPtr ResetTrial);
typedef VOID  (__stdcall *eXP_GetTrialDays)(WORD wTotal,WORD wLeft);
typedef VOID  (__stdcall *eXP_GetTrialExecs)(WORD wTotal, WORD wLeft);
typedef VOID  (__stdcall *eXP_GetExpireDate)(PMDATE pExpDate);
//PROGRAM FLOW CONTROL
typedef VOID  (__stdcall *eXP_GetRunApp_FNPtr)(eXP_FnPtr RunAppFn);
typedef VOID  (__stdcall *eXP_ExecAppHasExpired)();	//CALLED IF THE KEY OR TRIAL EXPIRES
typedef VOID  (__stdcall *eXP_ExecAppNormal)();		//CALLED IF THE KEY IS OK OR TRIAL IS NOT EXPIRED
//CODE FRAGMENTS DECRYPTION
typedef VOID  (__stdcall *eXP_GetDecrypt_FnPtr)(eXP_bFnPtr DecryptFN);//RECEIVE A POINTER TO A FUNCTION WHICH DECRYPT PROTECTED CODE BLOCKS
typedef BOOL  (__stdcall *eXP_SetExternalKey)(LPBYTE pKey, PDWORD dwKeySize);

//THIS TEMPLATE FUNCTION IS EXPORTED BY eXPressor.dll WITH NAME "GenerateRegistrationKey"
typedef DWORD (__cdecl *eXP_GenerateRegistrationKey)(IN OUT KEY_PARAMS *Params);
//ERRORS RETURNED BY GenerateRegistrationKey
#define EXPR_SUCCESS					0x0
#define EXPR_ERROR_INVALID_PARAM		0x2
#define EXPR_ERROR_INVALID_PARAM_SIZE	0x4
#define EXPR_ERROR_INVALID_KEY_TYPE		0x8
#define EXPR_ERROR_INVALID_RSA_PAIR		0x10
#define EXPR_ERROR_ENCRYPTING_KEY		0x20
#define EXPR_ERROR_KEY_TOO_SMALL		0x40
#define EXPR_ERROR_MEM_ALLOC			0x80
#define EXPR_ERROR_KEY_DATE_EXPIRED		0x100	//IF YOU PROVIDE A DATE IN THE PAST
#define EXPR_ERROR_UNDEFINED			0x200

//ASM MACRO
#ifndef emit
#define emit(c) _asm _emit c
#endif

//MARKER FORE CODE BLOCKS ENCRYPTION
#define CODE_CRYPT_BEGIN1 emit(0xEB) emit(0x04) emit(0xEB) emit(0x05) emit(0x89) emit(0x01)
#define CODE_CRYPT_END1	  emit(0xEB) emit(0x04) emit(0xEB) emit(0x05) emit(0x99) emit(0x01)

#define MAX_EXTERNAL_KEY_LEN	512



#endif _API_DEF
//////////////////////////////////////////////////////////////////////////////////////