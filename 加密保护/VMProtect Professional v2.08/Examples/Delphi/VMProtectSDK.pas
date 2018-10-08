{*******************************************************}
{                                                       }
{                    VMProtect SDK                      }
{                                                       }
{        Copyright 2009-2011 VMProtect Software         }
{                                                       }
{*******************************************************}

unit VMProtectSDK;

interface

//-------------------------------------------------------
// code markers
//-------------------------------------------------------

  procedure VMProtectBegin(MarkerName: PAnsiChar); stdcall;
  procedure VMProtectBeginVirtualization(MarkerName: PAnsiChar); stdcall;
  procedure VMProtectBeginMutation(MarkerName: PAnsiChar); stdcall;
  procedure VMProtectBeginUltra(MarkerName: PAnsiChar); stdcall;
  procedure VMProtectBeginVirtualizationLockByKey(MarkerName: PAnsiChar); stdcall;
  procedure VMProtectBeginUltraLockByKey(MarkerName: PAnsiChar); stdcall;
  procedure VMProtectEnd; stdcall;

//-------------------------------------------------------
// utils                                                 
//-------------------------------------------------------

  function VMProtectIsDebuggerPresent(CheckKernelMode: Boolean): Boolean; stdcall;
  function VMProtectIsVirtualMachinePresent: Boolean; stdcall;
  function VMProtectIsValidImageCRC: Boolean; stdcall;
  function VMProtectDecryptStringA(Value: PAnsiChar): PAnsiChar; stdcall;
  function VMProtectDecryptStringW(Value: PWideChar): PWideChar; stdcall;
  function VMProtectFreeString(Value: Pointer): Boolean; stdcall;

//-------------------------------------------------------
// licensing
//-------------------------------------------------------

type
  TVMProtectDate = packed record
   wYear: Word;
   bMonth: Byte;
   bDay: Byte;
  end;

  PVMProtectSerialNumberData = ^TVMProtectSerialNumberData;
  TVMProtectSerialNumberData = packed record
   nState: Longword;
   wUserName: array [0..255] of WideChar;
   wEMail: array [0..255] of WideChar;
   dtExpire: TVMProtectDate;
   dtMaxBuild: TVMProtectDate;
   bRunningTime: Longword;
   nUserDataLength: Byte;
   bUserData: array [0..254] of Byte;
  end;

const
  SERIAL_STATE_FLAG_CORRUPTED 	       = $00000001;
  SERIAL_STATE_FLAG_INVALID	       = $00000002;
  SERIAL_STATE_FLAG_BLACKLISTED	       = $00000004;
  SERIAL_STATE_FLAG_DATE_EXPIRED       = $00000008;
  SERIAL_STATE_FLAG_RUNNING_TIME_OVER  = $00000010;
  SERIAL_STATE_FLAG_BAD_HWID	       = $00000020;
  SERIAL_STATE_FLAG_MAX_BUILD_EXPIRED  = $00000040;

  function VMProtectSetSerialNumber(SerialNumber: PAnsiChar): Longword; stdcall;
  function VMProtectGetSerialNumberState: Longword; stdcall;
  function VMProtectGetSerialNumberData(Data: PVMProtectSerialNumberData; DataSize: Integer): Boolean; stdcall;
  function VMProtectGetCurrentHWID(Buffer: PAnsiChar; BufferLen: Integer): Integer; stdcall;

implementation

const
{$IFDEF WIN64}
  VMProtectDLLName = 'VMProtectSDK64.dll';
{$ELSE}
  VMProtectDLLName = 'VMProtectSDK32.dll';
{$ENDIF}

procedure VMProtectBegin(MarkerName: PAnsiChar); stdcall; external VMProtectDLLName;
procedure VMProtectBeginVirtualization(MarkerName: PAnsiChar); stdcall; external VMProtectDLLName;
procedure VMProtectBeginMutation(MarkerName: PAnsiChar); stdcall; external VMProtectDLLName;
procedure VMProtectBeginUltra(MarkerName: PAnsiChar); stdcall; external VMProtectDLLName;
procedure VMProtectBeginVirtualizationLockByKey(MarkerName: PAnsiChar); stdcall; external VMProtectDLLName;
procedure VMProtectBeginUltraLockByKey(MarkerName: PAnsiChar); stdcall; external VMProtectDLLName;
procedure VMProtectEnd; stdcall; external VMProtectDLLName;
function VMProtectIsDebuggerPresent(CheckKernelMode: Boolean): Boolean; stdcall; external VMProtectDLLName;
function VMProtectIsVirtualMachinePresent: Boolean; stdcall; external VMProtectDLLName;
function VMProtectIsValidImageCRC: Boolean; stdcall; external VMProtectDLLName;
function VMProtectDecryptStringA(Value: PAnsiChar): PAnsiChar; stdcall; external VMProtectDLLName;
function VMProtectDecryptStringW(Value: PWideChar): PWideChar; stdcall; external VMProtectDLLName;
function VMProtectFreeString(Value: Pointer): Boolean; stdcall; external VMProtectDLLName;
function VMProtectSetSerialNumber(SerialNumber: PAnsiChar): Longword; stdcall; external VMProtectDLLName;
function VMProtectGetSerialNumberState: Longword; stdcall; external VMProtectDLLName;
function VMProtectGetSerialNumberData(Data: PVMProtectSerialNumberData; DataSize: Integer): Boolean; stdcall; external VMProtectDLLName;
function VMProtectGetCurrentHWID(Buffer: PAnsiChar; BufferLen: Integer): Integer; stdcall; external VMProtectDLLName;

end.
