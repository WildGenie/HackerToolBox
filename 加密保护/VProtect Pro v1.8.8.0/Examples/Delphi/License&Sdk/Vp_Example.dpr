program Vp_Example;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  VP_License_Sdk in '..\..\..\SDK\Pascal\VP_License_Sdk.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
