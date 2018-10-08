program test;

uses
  Forms,
  Windows,
  aspr_api,
  normal        in 'dfm\normal.pas' {frmApp},
  regkey        in 'dfm\regkey.pas' {frmRegKey};

{$R *.RES}

//------------------------------------------------------------------------------
// Initialization
//------------------------------------------------------------------------------

const
  MessageTitle = 'Information';
  MessageStr   = 'This example shows the work in trial mode.';

begin

  MessageBox(0, MessageStr, MessageTitle, MB_ICONINFORMATION );

  Application.Initialize;
  Application.CreateForm(TfrmApp, frmApp);
  Application.Run;
end.