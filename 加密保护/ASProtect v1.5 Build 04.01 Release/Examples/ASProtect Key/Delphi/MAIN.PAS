//==============================================================================
//   This is an example of :
//
//   1. setting of marks from reg_crypt_begin.inc and reg_crypt_end.inc files
//   2. receiving of a registration information
//   3. storing a registration key in external place (file)
//      and sending it to ASProtect
//==============================================================================

unit main;

interface

procedure Start;

implementation

uses
  Registry,
  Classes,
  Windows,
  SysUtils;

const
  UserName   : PChar = '';

var
  RegMessage : String;
  Key        : Pointer;
//------------------------------------------------------------------------------
procedure RegisteredAction;
begin
  {$I include\reg_crypt_begin.inc}
  RegMessage := 'Registered version'#13#10 + StrPas(UserName);
  {$I include\reg_crypt_end.inc}
end;
//------------------------------------------------------------------------------
procedure Start;
begin
  try
    RegMessage := 'Unregistered version';
    RegisteredAction;
    MessageBox(0,PChar(RegMessage),'',0);
  except
  end;
end;
//------------------------------------------------------------------------------
//
// THIS IS A REALIZATION OF ASPROTECT'S API INTERFACE
//
//------------------------------------------------------------------------------
// You can set a registration key to ASProtect!
// This example shows a reading of registration key
// from file key.bin
// ASProtect calls this function before a checking of registration
// key

function  SetRegistrationKey: PChar;stdcall;
var
  FileName : String;
begin
  Result := '';
  try
    FileName := ExtractFilePath(ParamStr(0))+'key.bin';
    with TFileStream.Create(FileName, fmOpenRead) do
    try
      GetMem(Key, Size+1);
      FillChar(Key^, Size+1, 0);
      Read(Key^,Size);
    finally
      Free;
    end;
    Result := Key;
  except
  end;
end;
exports
   SetRegistrationKey;
//------------------------------------------------------------------------------
// ASProtect will call this procedure after a verification of regstration key
//
procedure GetRegistrationInformation(NewUserName : PChar);stdcall
begin
  UserName := NewUserName;
end;
exports
  GetRegistrationInformation;
end.
