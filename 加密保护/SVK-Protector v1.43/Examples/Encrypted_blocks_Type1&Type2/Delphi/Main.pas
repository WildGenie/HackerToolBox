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

//this code will decrypted before using and after use removed
//tip: This type of blocks is very good use in initialize part of program
//(load DLL(s), initialize data, fill some special variables and etc.)
    {$I include\delphi_svkp_block_type2_begin.inc}
    RegMessage := 'Encryption blocks example';
    {$I include\delphi_svkp_block_type2_end.inc}

//This code will decrypted before using and encrypted again after use
    {$I include\delphi_svkp_block_type1_begin.inc}
    MessageBox(0,PChar (RegMessage),'',0);
    ActionForRegisteredUsers; //this procedure is only for registered users
    {$I include\delphi_svkp_block_type1_end.inc}
  except
  end;
end;
end.
