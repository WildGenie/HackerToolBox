program keygen;

{$MODE Delphi}

uses
  Forms, Interfaces,
  main in 'main.pas' {frmMain},
  enigma_keygen_ide64 in '..\..\..\EnigmaSDK\FPCx64\enigma_keygen_ide64.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
