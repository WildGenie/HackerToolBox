program test;

{$MODE Delphi}

uses
  Forms, Interfaces,
  mainunit in 'mainunit.pas' {Form1},
  enigma_ide64 in '..\..\..\EnigmaSDK\FPCx64\enigma_ide64.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
