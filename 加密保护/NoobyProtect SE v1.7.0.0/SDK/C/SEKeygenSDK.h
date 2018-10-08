/*
NoobyProtect Keygen SDK
*/
#pragma once

typedef struct _SELicenseOptions
{
	char		UserID[256];
	char		Remarks[1024];
	BOOL		LockHardwareID;
	char		HardwareID[256];

	BOOL		NumDaysEn;
	DWORD		NumDays;

	BOOL		NumExecEn;
	DWORD		NumExec;

	BOOL		ExpDateEn;
	SYSTEMTIME	ExpDate;

	BOOL		CountryIdEn;
	DWORD		CountryId;

	BOOL		ExecTimeEn;
	DWORD		ExecTime;

	BOOL		TotalExecTimeEn;
	DWORD		TotalExecTime;

	SYSTEMTIME	LicenseDate;

}SELicenseOptions, *PSELicenseOptions;

extern "C" {
	__declspec(dllimport) BOOL WINAPI SEGenerateKeyFile(SELicenseOptions* pOptions);
	__declspec(dllimport) BOOL WINAPI SEGenerateKeyFileEx(SELicenseOptions* pOptions, char* pLicenseDat);
}