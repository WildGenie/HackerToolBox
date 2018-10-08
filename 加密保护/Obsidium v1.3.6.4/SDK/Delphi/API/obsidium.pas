unit obsidium;

interface

function getRegInfo(dwInfoNr: LongWord; lpBuffer: PChar): Boolean; stdcall;
function getSystemID(lpBuffer: PChar): Boolean; stdcall;
function isRegistered: Boolean; stdcall;
procedure setExternalKey(lpKey: Pointer; dwSize: LongWord); stdcall;
procedure CallMark(dwMagic: LongWord); stdcall;
function getTrialRuns(): Integer; stdcall;
function getTrialDays(): Integer; stdcall;
function getLicenseExpiration(lpExpDate: Pointer): Boolean; stdcall;
function storeLicense(lpStr: PChar): Boolean; stdcall;
function storeLicenseShort(lpInfo: PChar; lpKey: PChar): Boolean; stdcall;
function getCustomValue(): Word; stdcall;
function getLicenseHash(lpHash: Pointer): Boolean; stdcall;
function getLicenseStatus(): Integer; stdcall;
function setLicense(lpStr: PChar): Boolean; stdcall;
function setLicenseShort(lpInfo: PChar; lpKey: PChar): Boolean; stdcall;
procedure deleteTrialData(); stdcall;
 
implementation

const
// call marks
  CALLMARK_REG_START      = $0DEFACED;
  CALLMARK_REG_END        = $DEADF00D;
// getLicenseStatus return values
  LIC_STATUS_NOTFOUND     = 0;          // no license key found
  LIC_STATUS_VALID        = 1;          // valid license key present
  LIC_STATUS_EXPIRED      = 2;          // license key has expired
  LIC_STATUS_BAD_SYSTEMID = 3;          // system ID does not match
  LIC_STATUS_INVALID      = 4;          // invalid or corrupt key
  LIC_STATUS_BLACKLISTED  = 5;          // license key is blacklisted


function getRegInfo; external 'dummy.dll';
function getSystemID; external 'dummy.dll';
function isRegistered; external 'dummy.dll';
procedure setExternalKey; external 'dummy.dll';
procedure CallMark; external 'dummy.dll';
function getTrialRuns; external 'dummy.dll';
function getTrialDays; external 'dummy.dll';
function getLicenseExpiration; external 'dummy.dll';
function storeLicense; external 'dummy.dll';
function storeLicenseShort; external 'dummy.dll';
function getCustomValue; external 'dummy.dll';
function getLicenseHash; external 'dummy.dll';
function getLicenseStatus; external 'dummy.dll';
function setLicense; external 'dummy.dll';
function setLicenseShort; external 'dummy.dll';
procedure deleteTrialData; external 'dummy.dll';

end.
