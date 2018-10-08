program test;

uses
  Forms,
  test_unit in 'test_unit.pas' {frmRegistration},
  enigma_ide in '..\..\..\EnigmaSDK\Delphi\enigma_ide.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmRegistration, frmRegistration);
  Application.Run;
end.
