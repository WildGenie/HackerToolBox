/*
NoobyProtect License SDK
*/
#pragma once

#ifndef _SELICENSE_TYPES

#define _SELICENSE_TYPES

typedef struct _SELicenseUserInfo
{
	char		UserID[256];
	char		Remarks[1024];
	SYSTEMTIME	LicenseDate;

} SELicenseUserInfo, *PSELicenseUserInfo;

typedef struct _SELicenseTrialInfo
{
	DWORD		NumDays;
	DWORD		NumExec;
	SYSTEMTIME	ExpDate;
	DWORD		CountryId;
	DWORD		ExecTime;
	DWORD		TotalExecTime;

} SELicenseTrialInfo, *PSELicenseTrialInfo;

typedef struct _SELicenseHashInfo
{
	char	Hash[16];

} SELicenseHashInfo, *PSELicenseHashInfo;

typedef enum _SELicenseErrorType
{
	ERR_SUCCESS,
	ERR_INTERNAL_ERROR,
	ERR_LICENSE_NOT_FOUND,
	ERR_LICENSE_CORRUPTED,
	ERR_LICENSE_FILE_MISMATCH,
	ERR_LICENSE_HARDWARE_ID_MISMATCH,

	ERR_LICENSE_DAYS_EXPIRED,
	ERR_LICENSE_EXEC_EXPIRED,
	ERR_LICENSE_DATE_EXPIRED,
	ERR_LICENSE_COUNTRY_ID_MISMATCH,
	ERR_LICENSE_NO_MORE_EXEC_TIME,
	ERR_LICENSE_NO_MORE_TOTALEXEC_TIME,
	ERR_LICENSE_BANNED

} SELicenseErrorType, *PSELicenseErrorType;

#endif

extern "C" {
	__declspec(dllimport) DWORD WINAPI SEGetNumExecUsed();
	__declspec(dllimport) DWORD WINAPI SEGetNumExecLeft();
	__declspec(dllimport) SELicenseErrorType WINAPI SESetNumExecUsed(DWORD Num);
	__declspec(dllimport) DWORD WINAPI SEGetExecTimeUsed();
	__declspec(dllimport) DWORD WINAPI SEGetExecTimeLeft();
	__declspec(dllimport) SELicenseErrorType WINAPI SESetExecTime(DWORD Num);
	__declspec(dllimport) DWORD WINAPI SEGetTotalExecTimeUsed();
	__declspec(dllimport) DWORD WINAPI SEGetTotalExecTimeLeft();
	__declspec(dllimport) SELicenseErrorType WINAPI SESetTotalExecTime(DWORD Num);
	__declspec(dllimport) SELicenseErrorType WINAPI SECheckHardwareID();
	__declspec(dllimport) SELicenseErrorType WINAPI SECheckExpDate();
	__declspec(dllimport) SELicenseErrorType WINAPI SECheckExecTime();
	__declspec(dllimport) SELicenseErrorType WINAPI SECheckCountryID();
	__declspec(dllimport) SELicenseErrorType WINAPI SEGetLicenseUserInfo(SELicenseUserInfo* pInfo);
	__declspec(dllimport) SELicenseErrorType WINAPI SEGetLicenseTrialInfo(SELicenseTrialInfo* pInfo);
	__declspec(dllimport) SELicenseErrorType WINAPI SEGetHardwareID(char* pBuf, DWORD BufferSize);
	__declspec(dllimport) SELicenseErrorType WINAPI SECheckLicenseFileA(char* LicenseFileName);
	__declspec(dllimport) SELicenseErrorType WINAPI SECheckLicenseFileW(wchar_t* LicenseFileName);
	__declspec(dllimport) SELicenseErrorType WINAPI SECheckLicenseFileEx(char* pLicenseFile);
	__declspec(dllimport) SELicenseErrorType WINAPI SEGetLicenseHash(SELicenseHashInfo* pInfo);
	__declspec(dllimport) void WINAPI SENotifyLicenseBanned(BOOL Exit);
	__declspec(dllimport) SELicenseErrorType WINAPI SEResetTrial();
	__declspec(dllimport) SELicenseErrorType WINAPI SECheckProtection();
	__declspec(dllimport) char* WINAPI SEDecodeStringA(char* pStr);
	__declspec(dllimport) wchar_t* WINAPI SEDecodeStringW(wchar_t* pStr);
	__declspec(dllimport) SELicenseErrorType WINAPI SEFreeString(void* pStr);
}