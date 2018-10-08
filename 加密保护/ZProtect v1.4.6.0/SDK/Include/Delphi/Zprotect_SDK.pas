unit ZprotectSDK;

interface

uses
  Windows;

 

const
  ZprotectDLL = 'ZprotectSDK.dll';

function ZP_GetExecutionTime(): Integer; stdcall; external ZprotectDLL name 'ZP_GetExecutionTime';
procedure ZP_GetTrialDate(pTime: PSYSTEMTIME); stdcall; external ZprotectDLL name 'ZP_GetTrialDate';
function ZP_GetTrialDateLeft(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialDateLeft';
function ZP_GetTrialDays(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialDays';
function ZP_GetTrialDaysLeft(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialDaysLeft';
function ZP_GetTrialTimes(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialTimes';
function ZP_GetTrialTimesLeft(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialTimesLeft';
function ZP_GetHardwareIDStr(): PChar; stdcall; external ZprotectDLL name 'ZP_GetHardwareIDStr';
function ZP_GetHomePageStr(): PChar; stdcall; external ZprotectDLL name 'ZP_GetHomePageStr';
function ZP_GetUserName() : pchar; stdcall; external ZprotectDLL name 'ZP_GetUserName'; 
function ZP_GetKeyBuffer() : pchar; stdcall; external ZprotectDLL name 'ZP_GetKeyBuffer'; 
function ZP_GetKeyCustomInt(pid: Integer): Integer; stdcall; external ZprotectDLL name 'ZP_GetKeyCustomInt';
function ZP_GetKeyCustomStr(pid: Integer): PChar; stdcall; external ZprotectDLL name 'ZP_GetKeyCustomStr';
function ZP_CRC32(pBuf: PChar; pszBuf: Integer): DWORD; stdcall; external ZprotectDLL name 'ZP_CRC32';
procedure ZP_MD5(pBuf: PChar; pszBuf: Integer; pDstBuf: PChar); stdcall; external ZprotectDLL name 'ZP_MD5';



implementation

end.

