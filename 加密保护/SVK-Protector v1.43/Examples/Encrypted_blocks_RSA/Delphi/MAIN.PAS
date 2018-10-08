//This example shows a way how protect some parts of code with encryption


unit main;

interface

procedure Start;

implementation

uses
  Registry,
  Classes,
  Windows,
  SysUtils,
  special;

var
  RegMessage : String;
//This procedure will encrypted and it will decrypted only if user have correct
//registration key
procedure ActionForRegisteredUsers;
begin
    {$I include\delphi_svkp_block_begin.inc}
    RegMessage := 'Registered version!';
    MessageBox(0,PChar (RegMessage),'',0);
    {$I include\delphi_svkp_block_end.inc}
end;

procedure Start;
begin
  try

    RegMessage := 'Encryption blocks example';
    MessageBox(0,PChar (RegMessage),'',0);
    ActionForRegisteredUsers; //this procedure is only for registered users

  except
  end;
end;
end.
