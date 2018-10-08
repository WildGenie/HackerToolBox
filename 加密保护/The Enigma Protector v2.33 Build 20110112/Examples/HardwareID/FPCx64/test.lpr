program test;

{$MODE Delphi}

uses
  Forms, Interfaces,
  test_unit in 'test_unit.pas' {frmMain},
  enigma_ide64 in '..\..\..\EnigmaSDK\FPCx64\enigma_ide64.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
