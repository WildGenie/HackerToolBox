program Vp_Version;

uses
  Forms,
  Main in 'Main.pas' {Frm_VP_SDK},
  VP_License_Sdk in '..\..\..\SDK\Pascal\VP_License_Sdk.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_VP_SDK, Frm_VP_SDK);
  Application.Run;
end.
