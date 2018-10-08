program test;

uses
  Forms,
  testunit in 'testunit.pas' {frmMain},
  enigma_ide in '..\..\..\EnigmaSDK\Delphi\enigma_ide.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
