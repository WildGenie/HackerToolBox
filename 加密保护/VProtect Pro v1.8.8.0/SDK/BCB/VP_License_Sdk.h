#pragma once

//授权状态 License_State
#define LICENSE_STATE_NOLICENSE_FILE	0x1
#define LICENSE_STATE_ERROR				0x2
#define LICENSE_STATE_BLACKLISTED		0x4
#define LICENSE_STATE_HARDID_BAD		0x8
#define LICENSE_STATE_DATE_EXPIRED		0x10
#define LICENSE_STATE_RUNTIME_OVER		0x20
#define LICENSE_STATE_RUNCOUNT_OVER		0x40
#define LICENSE_STATE_LANGID_BAD		0x80
#define LICENSE_STATE_ACCEPT			0x100
#define LICENSE_STATE_TRYMODE			0x200
#define LICENSE_STATE_REGMODE			0x400

//授权SDK索引 License Api Index
#define VP_SDK_INDEX_GETHARDWAREIDA		0x01
#define VP_SDK_INDEX_GETHARDWAREIDW		0x02

#define VP_SDK_INDEX_GETUSERNAMEA		0x03
#define VP_SDK_INDEX_GETUSERNAMEW		0x04

#define VP_SDK_INDEX_SAVEKEYA			0x05
#define VP_SDK_INDEX_SAVEKEYW			0x06

#define VP_SDK_INDEX_GETLEFTCOUNT		0x07
#define VP_SDK_INDEX_GETUSEDCOUNT		0x08

#define VP_SDK_INDEX_GETREGLEFTDAY			0x09
#define VP_SDK_INDEX_GETTRIALLEFTDAY		0x0A

#define VP_SDK_INDEX_GETLICENSESTATE	0x0B
#define VP_SDK_INDEX_ISREGISTER			0x0C

#define VP_SDK_INDEX_CHECKLICENSEINMEM	0x0D
#define VP_SDK_INDEX_GETCUSTOMDWORD		0x0E

#define VP_SDK_INDEX_GETCVAILDDAY		0x0F
//KeyGen Struct
#pragma pack(4) 
typedef struct _SDK_GENKEY_STRW
{
	WCHAR UserName[64];
	WCHAR HardID[33];
	DWORD_PTR VaildDay;
	DWORD_PTR CanRunCount;
	DWORD_PTR CanRunDay;
	DWORD_PTR CanRunMinute;
	DWORD_PTR CanRunLangId;
	DWORD_PTR CustomDword;	
	BOOL B_CreateKeyFile;
	WCHAR PRecvKey[2048];
}SDK_GENKEY_STRW,*PSDK_GENKEY_STRW;
#pragma pack()

#pragma pack(4) 
typedef struct _SDK_GENKEY_STRA
{
	char UserName[64];
	char HardID[33];
	DWORD_PTR VaildDay;
	DWORD_PTR CanRunCount;
	DWORD_PTR CanRunDay;
	DWORD_PTR CanRunMinute;
	DWORD_PTR CanRunLangId;
	DWORD_PTR CustomDword;	
	BOOL B_CreateKeyFile;
	char PRecvKey[2048];
}SDK_GENKEY_STRA,*PSDK_GENKEY_STRA;
#pragma pack()

#ifdef UNICODE
#	define SDK_GENKEY_STR		SDK_GENKEY_STRW
#	define VP_SDK_GenKey		VP_SDK_GenKeyW
#	define VP_Sdk_GetHardWareId VP_Sdk_GetHardWareIdW
#	define VP_Sdk_GetUserName	VP_Sdk_GetUserNameW
#	define VP_Sdk_SaveKey		VP_Sdk_SaveKeyW
#	define VP_SDK_INDEX_GETHARDWAREID	VP_SDK_INDEX_GETHARDWAREIDW
#	define VP_SDK_INDEX_GETUSERNAME		VP_SDK_INDEX_GETUSERNAMEW
#	define VP_SDK_INDEX_SAVEKEY			VP_SDK_INDEX_SAVEKEYW
#else
#	define SDK_GENKEY_STR		SDK_GENKEY_STRA
#	define VP_SDK_GenKey		VP_SDK_GenKeyA
#	define VP_Sdk_GetHardWareId VP_Sdk_GetHardWareIdA
#	define VP_Sdk_GetUserName	VP_Sdk_GetUserNameA
#	define VP_Sdk_SaveKey		VP_Sdk_SaveKeyA
#	define VP_SDK_INDEX_GETHARDWAREID	VP_SDK_INDEX_GETHARDWAREIDA
#	define VP_SDK_INDEX_GETUSERNAME		VP_SDK_INDEX_GETUSERNAMEA
#	define VP_SDK_INDEX_SAVEKEY			VP_SDK_INDEX_SAVEKEYA
#endif

/*
* LICENSE System Interfack
* 授权系统API
*/
#if defined(__cplusplus)
extern "C" {
#endif
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetHardWareIdA(DWORD Sdk_Index,char *PRecv);
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetHardWareIdW(DWORD Sdk_Index,WCHAR *PRecv);
 
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetUserNameA(DWORD Sdk_Index,char *PRecv);
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetUserNameW(DWORD Sdk_Index,WCHAR *PRecv);
 
	__declspec(dllimport) DWORD __stdcall VP_Sdk_SaveKeyA(DWORD Sdk_Index,char *PInputKey);
	__declspec(dllimport) DWORD __stdcall VP_Sdk_SaveKeyW(DWORD Sdk_Index,WCHAR *PInputKey);
 
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetLeftCount(DWORD Sdk_Index=VP_SDK_INDEX_GETLEFTCOUNT);
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetUsedCount(DWORD Sdk_Index=VP_SDK_INDEX_GETUSEDCOUNT);

	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetRegLeftDay(DWORD Sdk_Index=VP_SDK_INDEX_GETREGLEFTDAY);
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetTrialLeftDay(DWORD Sdk_Index=VP_SDK_INDEX_GETTRIALLEFTDAY);

	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetLicenseState(DWORD Sdk_Index=VP_SDK_INDEX_GETLICENSESTATE);
	__declspec(dllimport) BOOL __stdcall VP_Sdk_IsRegister(DWORD Sdk_Index=VP_SDK_INDEX_ISREGISTER);

	__declspec(dllimport) BOOL __stdcall VP_Sdk_CheckLicenseInMem(DWORD Sdk_Index,BYTE *PMemKey,DWORD KeySize);
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetCustomDword(DWORD Sdk_Index=VP_SDK_INDEX_GETCUSTOMDWORD);
	__declspec(dllimport) DWORD __stdcall VP_Sdk_GetCustomDword(DWORD Sdk_Index=VP_SDK_INDEX_GETCVAILDDAY);

/*
* GenKey Interface
* 生成注册码API
*/
	__declspec(dllimport) DWORD_PTR __stdcall VP_SDK_GenKeyA(PSDK_GENKEY_STRA PSdk_UserA);
	__declspec(dllimport) DWORD_PTR __stdcall VP_SDK_GenKeyW(PSDK_GENKEY_STRW PSdk_UserW);

#if defined(__cplusplus)
}
#endif