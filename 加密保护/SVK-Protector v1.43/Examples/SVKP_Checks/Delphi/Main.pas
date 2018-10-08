//This example shows a way how use Alive Checks in your application


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

procedure Start;
begin
  try

    RegMessage := 'Now I will try run some checks!';
    MessageBox(0,PChar (RegMessage),'Alive Checks example.',0);

//Don't forget use these checks random or in not very offen used procedures!

    {$I include\delphi_svkp_alive_check_1.inc}
    {$I include\delphi_svkp_alive_check_2.inc}

    RegMessage := 'SVKP protection was not removed!';
    MessageBox(0,PChar (RegMessage),'SVKP is alive!',0);


  except
  end;
end;
end.
