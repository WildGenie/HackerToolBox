{*
   This example shows a way of using of external constant for fragment's decryption
*}

unit main;

interface

uses
  Windows;

procedure Start;

implementation

type
  TSetKeyProc = procedure(Key : Pointer;KeySize : DWORD);stdcall;

const
  SetKeyProc    : TSetKeyProc = nil;

procedure Start;
var
  Key          : Pointer;
  Mess         : String;
  F            : THandle;
  FSize        : DWORD;
  FRealRead    : DWORD;
begin

  Mess := 'Unregistered version';

  F := CreateFile('test.bin', GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);

  if F <> INVALID_HANDLE_VALUE then
  begin

     // Read a file with a constant for decryption

     FSize := GetFileSize(F, nil);

     GetMem(Key, FSize);
     ReadFile(F,Key^, FSize, FRealRead, nil);
     CloseHandle(F);

     // Set a constatnt to ASProtect

     SetKeyProc(Key, FSize);

     {$I include\reg_crypt_begin.inc}

     Mess := 'Registered version';

     {$I include\reg_crypt_end.inc}

     FreeMem(Key, FSize);
  end;

  MessageBox(0,PChar(Mess),'',0);
end;

//----------------------------------------------------------------------
// This function gets pointer on function for setting of external key
//------------------------------------------------------------------------------
procedure SetDecryptionKey(DProc : TSetKeyProc);stdcall;
begin
  SetKeyProc := DProc;
end;
exports SetDecryptionKey;


end.
