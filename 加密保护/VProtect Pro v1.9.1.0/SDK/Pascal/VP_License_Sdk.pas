unit VP_License_Sdk;

interface
uses
  Windows;
  
const
  VP_SDK_DLL = 'Vp_License_Sdk.dll';
  VP_KEYGEN_DLL='Vp_KeyGen.dll';
  
  //授权状态
  LICENSE_STATE_NOLICENSE_FILE	=$1;
  LICENSE_STATE_ERROR				=$2;
  LICENSE_STATE_BLACKLISTED		=$4;
  LICENSE_STATE_HARDID_BAD		=$8;
  LICENSE_STATE_DATE_EXPIRED		=$10;
  LICENSE_STATE_RUNTIME_OVER		=$20;
  LICENSE_STATE_RUNCOUNT_OVER		=$40;
  LICENSE_STATE_LANGID_BAD		=$80;
  LICENSE_STATE_ACCEPT			=$100;
  LICENSE_STATE_TRYMODE			=$200;
  LICENSE_STATE_REGMODE			=$400;

  //授权SDK索引
  VP_SDK_INDEX_GETHARDWAREIDA		=$01;
  VP_SDK_INDEX_GETHARDWAREIDW		=$02;

  VP_SDK_INDEX_GETUSERNAMEA		=$03;
  VP_SDK_INDEX_GETUSERNAMEW		=$04;

  VP_SDK_INDEX_SAVEKEYA			=$05;
  VP_SDK_INDEX_SAVEKEYW			=$06;

  VP_SDK_INDEX_GETLEFTCOUNT		=$07;
  VP_SDK_INDEX_GETUSEDCOUNT		=$08;

  VP_SDK_INDEX_GETREGLEFTDAY			=$09;
  VP_SDK_INDEX_GETTRIALLEFTDAY		=$0A;

  VP_SDK_INDEX_GETLICENSESTATE	=$0B;
  VP_SDK_INDEX_ISREGISTER			=$0C;
  
  VP_SDK_INDEX_CHECKLICENSEINMEM =$0D;
  VP_SDK_INDEX_GETCUSTOMDWORD	=$0E;
  VP_SDK_INDEX_GETCVAILDDAY =$0F;
type
  SDK_GENKEY_STRW = record 
    UserName:array [0..63] of WideChar;
    HardID:array [0..32] of WideChar;
    VaildDay:DWORD;
    CanRunCount:DWORD;
    CanRunDay:DWORD;
    CanRunMinute:DWORD;
    CanRunLangId:DWORD;
    CustomDword:DWORD;
    B_CreateKeyFile:BOOL;
    PRecvKey:array [0..2047] of WideChar;
  end;
  PSDK_GENKEY_STRW = ^SDK_GENKEY_STRW;

  SDK_GENKEY_STRA = record
    UserName:array [0..63] of AnsiChar;
    HardID:array [0..32] of AnsiChar;
    VaildDay:DWORD;
    CanRunCount:DWORD;
    CanRunDay:DWORD;
    CanRunMinute:DWORD;
    CanRunLangId:DWORD;
    CustomDword:DWORD;
    B_CreateKeyFile:BOOL;
    PRecvKey:array [0..2047] of AnsiChar;  
  end;
  PSDK_GENKEY_STRA = ^SDK_GENKEY_STRA;
  
{
* Lisence System Interfack
* 授权系统API
}
function VP_Sdk_GetHardWareIdA(Index:DWORD;PRecv:PAnsiChar):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetHardWareIdA'; 
  
function VP_Sdk_GetHardWareIdW(Index:DWORD;PRecv:PWideChar):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetHardWareIdW';  

function VP_Sdk_GetUserNameA(Index:DWORD;PRecv:PAnsiChar):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetUserNameA'; 
  
function VP_Sdk_GetUserNameW(Index:DWORD;PRecv:PWideChar):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetUserNameW';  

function VP_Sdk_SaveKeyA(Index:DWORD;PRecv:PAnsiChar):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_SaveKeyA'; 
  
function VP_Sdk_SaveKeyW(Index:DWORD;PRecv:PWideChar):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_SaveKeyW';  

function VP_Sdk_GetLeftCount(Index:DWORD=VP_SDK_INDEX_GETLEFTCOUNT):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetLeftCount'; 
  
function VP_Sdk_GetUsedCount(Index:DWORD=VP_SDK_INDEX_GETUSEDCOUNT):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetUsedCount';  

function VP_Sdk_GetRegLeftDay(Index:DWORD=VP_SDK_INDEX_GETREGLEFTDAY):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetRegLeftDay'; 
  
function VP_Sdk_GetTrialLeftDay(Index:DWORD=VP_SDK_INDEX_GETTRIALLEFTDAY):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetTrialLeftDay';   

function VP_Sdk_GetLicenseState(Index:DWORD=VP_SDK_INDEX_GETLICENSESTATE):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetLisenceState'; 
  
function VP_Sdk_IsRegister(Index:DWORD=VP_SDK_INDEX_ISREGISTER):BOOL;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_IsRegister';   
  
function VP_Sdk_GetCustomDword(Index:DWORD=VP_SDK_INDEX_GETCUSTOMDWORD):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetCustomDword';  
  
function VP_Sdk_GetVaildDay(Index:DWORD=VP_SDK_INDEX_GETCVAILDDAY):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_GetVaildDay';   
  
function VP_Sdk_CheckLicenseInMem(Index:DWORD;PRecv:PByte;KeySize:DWORD):DWORD_PTR;stdcall;
  external VP_SDK_DLL name 'VP_Sdk_CheckLicenseInMem';  

{
* GenKey Interface
* 生成注册码API
}
function VP_Sdk_GenKeyA(PSdk_UserA:PSDK_GENKEY_STRA):DWORD;stdcall;
  external VP_KEYGEN_DLL name 'VP_SDK_GenKeyA';    
function VP_Sdk_GenKeyW(PSdk_UserW:PSDK_GENKEY_STRW):DWORD;stdcall;
  external VP_KEYGEN_DLL name 'VP_SDK_GenKeyW';
implementation

end.
