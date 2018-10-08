unit ZprotectSDK;

interface

uses
  Windows;

const
  ZprotectDLL = 'ZprotectSDK.dll';
  
const OBJTYPE_UNKNOW		=0;
const OBJTYPE_BOOLEAN		=1;
const OBJTYPE_INTEGER		=2;
const OBJTYPE_DOUBLE		=3;
const OBJTYPE_STRING		=4;
const OBJTYPE_WSTRING		=5;
const OBJTYPE_USERDATA		=6;

const EXEC_OK		=0;
const EXEC_FAILD	=1;

const KEY_OK			=0;
const KEY_INVALID		=1;
const KEY_TRAIL			=2;
const KEY_OUTOFTICK		=3;
const KEY_OUTOFDAYS		=4;
const KEY_OUTOFDATE		=5;
const KEY_INVALIDDATE	=6;
const KEY_BLOCKED		=7;

// Registration and trial functions:

function ZP_GetExecutionTime(): Integer; stdcall; external ZprotectDLL name 'ZP_GetExecutionTime';
procedure ZP_GetTrialDate(pTime: PSYSTEMTIME); stdcall; external ZprotectDLL name 'ZP_GetTrialDate';
function ZP_GetTrialDateLeft(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialDateLeft';
function ZP_GetTrialDays(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialDays';
function ZP_GetTrialDaysLeft(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialDaysLeft';
function ZP_GetTrialTimes(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialTimes';
function ZP_GetTrialTimesLeft(): Integer; stdcall; external ZprotectDLL name 'ZP_GetTrialTimesLeft';
function ZP_GetHardwareIDStr(): PAnsiChar; stdcall; external ZprotectDLL name 'ZP_GetHardwareIDStr';
function ZP_GetHomePageStr(): PAnsiChar; stdcall; external ZprotectDLL name 'ZP_GetHomePageStr';
function ZP_GetUserName() : PAnsiChar; stdcall; external ZprotectDLL name 'ZP_GetUserName'; 
function ZP_GetKeyBuffer() : PAnsiChar; stdcall; external ZprotectDLL name 'ZP_GetKeyBuffer'; 
function ZP_GetKeyCustomInt(pid: Integer): Integer; stdcall; external ZprotectDLL name 'ZP_GetKeyCustomInt';
function ZP_GetKeyCustomStr(pid: Integer): PAnsiChar; stdcall; external ZprotectDLL name 'ZP_GetKeyCustomStr';
function ZP_GetRegistrationState(pSection:Integer): Boolean; stdcall; external ZprotectDLL name 'ZP_GetRegistrationState';

function ZP_RegByKeyStr(pKeyStr:PAnsiChar;plpRegName:PAnsiChar): Integer; stdcall; external ZprotectDLL name 'ZP_RegByKeyStr';
function ZP_RegByKeyFile(pKeyFilePath:PAnsiChar): Integer; stdcall; external ZprotectDLL name 'ZP_RegByKeyFile';
function ZP_RegShowRegWndProc(plpProc:Pointer): Boolean; stdcall; external ZprotectDLL name 'ZP_RegShowRegWndProc';
function ZP_ShowRegWindow(): Integer; stdcall; external ZprotectDLL name 'ZP_ShowRegWindow';

// Utility functions:
function ZP_CRC32(pBuf: PAnsiChar; pszBuf: Integer): DWORD; stdcall; external ZprotectDLL name 'ZP_CRC32';
procedure ZP_MD5(pBuf: PAnsiChar; pszBuf: Integer; pDstBuf: PAnsiChar); stdcall; external ZprotectDLL name 'ZP_MD5';
function ZP_DES128(pBuf:PAnsiChar;pszBuf:Integer;pDstBuf:PAnsiChar;pKeyBuf:PAnsiChar;pEncrypt:Boolean): Integer; stdcall; external ZprotectDLL name 'ZP_DES128';
function ZP_OpenReadOnlyFileMapping(pFileName: PAnsiChar; pReadedSize: PDWORD): PAnsiChar; stdcall; external ZprotectDLL name 'ZP_OpenReadOnlyFileMapping';
function ZP_CloseFileMapping(pMapping:PAnsiChar): Boolean; stdcall; external ZprotectDLL name 'ZP_CloseFileMapping';
function ZP_GetExclusiveGUID(): PAnsiChar; stdcall; external ZprotectDLL name 'ZP_GetExclusiveGUID';
function ZP_GetGlobalString(): PAnsiChar; stdcall; external ZprotectDLL name 'ZP_GetGlobalString';

// Lua Script functions:
function  ZP_ScpExec(pid:Integer):integer;stdcall;external ZprotectDLL name 'ZP_ScpExec';
function  ZP_ScpGetGlobal(pName:PAnsiChar;pType:PInteger):PAnsiChar;stdcall;external ZprotectDLL name 'ZP_ScpGetGlobal';
function  ZP_ScpCall(pfName:PAnsiChar;pType:PInteger;pArgNum:Integer;pType1:Integer;pValue1:PAnsiChar):PAnsiChar;stdcall;external ZprotectDLL name 'ZP_ScpCall';
function  ZP_ScpRegFunc(pfname:PAnsiChar;plpFunc:Pointer;pArgNum:Integer;prtType:Integer;pArgTypes:Integer):Boolean;stdcall;external ZprotectDLL name 'ZP_ScpRegFunc';

implementation

end.