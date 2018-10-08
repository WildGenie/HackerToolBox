program EncryptPEDemo;

uses
  Forms,
  ShareUnit,
  DemoUnit in 'DemoUnit.pas' {DemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Demo for EncryptPE';
  Application.CreateForm(TDemoForm, DemoForm);
  Application.Run;
end.
