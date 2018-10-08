program keygen;

uses
  Forms,
  main in 'main.pas' {frmMain},
  enigma_keygen_ide in '..\..\..\EnigmaSDK\Delphi\enigma_keygen_ide.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
