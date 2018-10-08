// This example shows a way how use SVKP's API functions
//

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
  registration_information : String;

procedure Start;
begin
  try

    registration_information := '                                                                                                                                                                                                                                ';
    SVKP_KillDebugger;          //now we will check for debuggers

    SVKP_LockKeyboard;          //then we will lock keyboard

    if SVKP_GetRegistrationInformation(registration_information)= 0 then
    begin
    //This is part for unregistered users
    RegMessage := 'Unregistered version!';
    MessageBox(0,PChar (RegMessage),'',0)
    end
    else
    begin
    //This is part for registered users
    RegMessage := 'Registration data from key:';
    MessageBox(0,PChar (registration_information),PChar (RegMessage),0);
    end;

    SVKP_UnLockKeyboard();    ////now we will unlock keyboard

  except
  end;
end;
end.
