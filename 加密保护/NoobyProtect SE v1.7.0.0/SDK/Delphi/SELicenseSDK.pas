unit SELicenseSDK;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows;

type

sSELicenseUserInfo = record
	UserID: array[0..255] of Char;
	Remarks: array[0..1023] of Char;
	LicenseDate: SYSTEMTIME;
end;

sSELicenseTrialInfo = record
	NumDays: Integer;
	NumExec: Integer;
	ExpDate: SYSTEMTIME;
	CountryId: Integer;
	ExecTime: Integer;
	TotalExecTime: Integer;
end;

sSELicenseHashInfo = record
	Hash: array[0..15] of Char;
end;

const

	SELICENSE_ERR_SUCCESS								= 0;
	SELICENSE_ERR_INTERNAL_ERROR						= 1;
	SELICENSE_ERR_LICENSE_NOT_FOUND						= 2;
	SELICENSE_ERR_LICENSE_CORRUPTED						= 3;
	SELICENSE_ERR_LICENSE_FILE_MISMATCH					= 4;
	SELICENSE_ERR_LICENSE_HARDWARE_ID_MISMATCH			= 5;
	
	SELICENSE_ERR_LICENSE_DAYS_EXPIRED					= 6;
	SELICENSE_ERR_LICENSE_EXEC_EXPIRED					= 7;
	SELICENSE_ERR_LICENSE_DATE_EXPIRED					= 8;
	SELICENSE_ERR_LICENSE_COUNTRY_ID_MISMATCH			= 9;
	SELICENSE_ERR_LICENSE_NO_MORE_EXEC_TIME				= 10;
	SELICENSE_ERR_LICENSE_NO_MORE_TOTALEXEC_TIME		= 11;
	SELICENSE_ERR_LICENSE_BANNED						= 12;

	SELicenseDLL = 'SELicenseDummy.DLL';


function SEGetNumExecUsed(): Integer; stdcall; external SELicenseDLL name 'SEGetNumExecUsed';
function SEGetNumExecLeft(): Integer; stdcall; external SELicenseDLL name 'SEGetNumExecLeft';
function SESetNumExecUsed(Num: Integer): Integer; stdcall; external SELicenseDLL name 'SESetNumExecUsed';

function SEGetExecTimeUsed(): Integer; stdcall; external SELicenseDLL name 'SEGetExecTimeUsed';
function SEGetExecTimeLeft(): Integer; stdcall; external SELicenseDLL name 'SEGetExecTimeLeft';
function SESetExecTime(Num: Integer): Integer; stdcall; external SELicenseDLL name 'SESetExecTime';

function SEGetTotalExecTimeUsed(): Integer; stdcall; external SELicenseDLL name 'SEGetTotalExecTimeUsed';
function SEGetTotalExecTimeLeft(): Integer; stdcall; external SELicenseDLL name 'SEGetTotalExecTimeLeft';
function SESetTotalExecTime(Num: Integer): Integer; stdcall; external SELicenseDLL name 'SESetTotalExecTime';


function SECheckHardwareID(): Integer; stdcall; external SELicenseDLL name 'SECheckHardwareID';
function SECheckExpDate(): Integer; stdcall; external SELicenseDLL name 'SECheckExpDate';
function SECheckExecTime(): Integer; stdcall; external SELicenseDLL name 'SECheckExecTime';
function SECheckCountryID(): Integer; stdcall; external SELicenseDLL name 'SECheckCountryID';

function SEGetLicenseUserInfo(pUserInfo: Pointer): Integer; stdcall; external SELicenseDLL name 'SEGetLicenseUserInfo';
function SEGetLicenseTrialInfo(pTrialInfo: Pointer): Integer; stdcall; external SELicenseDLL name 'SEGetLicenseTrialInfo';
function SEGetHardwareID(pBuf: PAnsiChar; BufferSize: Integer): Integer; stdcall; external SELicenseDLL name 'SEGetHardwareID';
function SECheckLicenseFileA(pLicenseFileName: PAnsiChar): Integer; stdcall; external SELicenseDLL name 'SECheckLicenseFileA';
function SECheckLicenseFileW(pLicenseFileName: PWideChar): Integer; stdcall; external SELicenseDLL name 'SECheckLicenseFileW';
function SECheckLicenseFileEx(pLicenseFile: PChar): Integer; stdcall; external SELicenseDLL name 'SECheckLicenseFileEx';
function SEGetLicenseHash(pLicenseHash: PChar): Integer; stdcall; external SELicenseDLL name 'SEGetLicenseHash';

procedure SENotifyLicenseBanned(); stdcall; external SELicenseDLL name 'SENotifyLicenseBanned';

function SEResetTrial(): Integer; stdcall; external SELicenseDLL name 'SEResetTrial';
function SECheckProtection(): Integer; stdcall; external SELicenseDLL name 'SECheckProtection';
function SEDecodeStringA(pStr: PAnsiChar): PAnsiChar; stdcall; external SELicenseDLL name 'SEDecodeStringA';
function SEDecodeStringW(pStr: PWideChar): PWideChar; stdcall; external SELicenseDLL name 'SEDecodeStringW';
function SEFreeString(pStr: Pointer): Integer; stdcall; external SELicenseDLL name 'SEFreeString';


implementation

end.
