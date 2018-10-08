unit SEKeygenSDK;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows;

type

SELicenseOptions = record
	UserID: array[0..255] of Char;
	Remarks: array[0..1023] of Char;
	LockHardwareID: Boolean;
	HardwareID: array[0..255] of Char;
	NumDaysEn: Boolean;
	NumDays: Integer;
	NumExecEn: Boolean;
	NumExec: Integer;
	ExpDateEn: Boolean;
	ExpDate: SYSTEMTIME;
	CountryIdEn: Boolean;
	CountryId: Integer;
	ExecTimeEn: Boolean;
	ExecTime: Integer;
	TotalExecTimeEn: Boolean;
	TotalExecTime: Integer;
end;

const

	SEKeygenDLL = 'SEKeygenDll.DLL';


function SEGenerateKeyFile(pOptions: Pointer): Boolean; stdcall; external SEKeygenDLL name 'SEGenerateKeyFile';
function SEGenerateKeyFileEx(pOptions: Pointer; pLicenseDat: PChar): Boolean; stdcall; external SEKeygenDLL name 'SEGenerateKeyFileEx';


implementation

end.
