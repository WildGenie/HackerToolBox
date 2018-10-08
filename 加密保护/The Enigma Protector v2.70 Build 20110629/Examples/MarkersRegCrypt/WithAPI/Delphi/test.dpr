program test;

uses
  Forms,
  Main_unit in 'Main_unit.pas' {frmMain},
  Nag_unit in 'Nag_unit.pas' {frmNag},
  Registration_unit in 'Registration_unit.pas' {frmRegistration},
  enigma_ide in '..\..\..\..\EnigmaSDK\Delphi\enigma_ide.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmNag, frmNag);
  Application.CreateForm(TfrmRegistration, frmRegistration);
  Application.Run;
end.
