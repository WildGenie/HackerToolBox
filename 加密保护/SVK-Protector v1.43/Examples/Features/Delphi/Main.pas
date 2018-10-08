//This example shows a way how protect some parts of code with features


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
procedure ActionForRegisteredUsers;
begin
//this code will encrypted and it will decrypted only if user have correct
//registration key with this feature unlocked
    {$I include\delphi_svkp_block_feature1_begin.inc}
    RegMessage := 'Feature 1 is unlocked in license!';
    MessageBox(0,PChar (RegMessage),'Message for registered users!',0);
    {$I include\delphi_svkp_block_feature1_end.inc}

//action for users with Feature 2 activated
    {$I include\delphi_svkp_block_feature2_begin.inc}
    RegMessage := 'Feature 2 is unlocked in license!';
    MessageBox(0,PChar (RegMessage),'Message for registered users!',0);
    {$I include\delphi_svkp_block_feature2_end.inc}

//is possible select more than one part of code for one feature
    {$I include\delphi_svkp_block_feature1_begin.inc}
    RegMessage := 'Feature 1 second part of code!';
    MessageBox(0,PChar (RegMessage),'Message for registered users!',0);
    {$I include\delphi_svkp_block_feature1_end.inc}


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
