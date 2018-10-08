unit sdprotector;

interface
uses
  Windows;

function  SDP_IsRegistered(): LongBool; stdcall;
function  SDP_GetRegistrationName(szRegistrationName: PChar; iMaxLen:Integer): Integer; stdcall;
function  SDP_GetKeyExpirationDate(lpSystemTime: PSystemTime): Integer; stdcall;
function  SDP_GetExpirationDate(lpSystemTime: PSystemTime): Integer; stdcall;
function  SDP_GetNumOfDaysLeft(lpdwNum: PDWORD): Integer; stdcall;
function  SDP_GetNumOfExecutionsLeft(lpdwNum: PDWORD): Integer; stdcall;
procedure SDP_DetectDebugger(); stdcall;
function  SDP_RetrieveHardwareID(szHardwareID: PChar; iMaxLen:Integer): Integer; stdcall;
procedure SDP_RunApplicationFunction(); stdcall;


implementation

function  SDP_IsRegistered;             external 'sdprotector.dll';
function  SDP_GetRegistrationName;      external 'sdprotector.dll';
function  SDP_GetKeyExpirationDate;     external 'sdprotector.dll';
function  SDP_GetExpirationDate;        external 'sdprotector.dll';
function  SDP_GetNumOfDaysLeft;         external 'sdprotector.dll';
function  SDP_GetNumOfExecutionsLeft;   external 'sdprotector.dll';
procedure SDP_DetectDebugger;           external 'sdprotector.dll';
function  SDP_RetrieveHardwareID;       external 'sdprotector.dll';
procedure SDP_RunApplicationFunction(); external 'sdprotector.dll';


end.