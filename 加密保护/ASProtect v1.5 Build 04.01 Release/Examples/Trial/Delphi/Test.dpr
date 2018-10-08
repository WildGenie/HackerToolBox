//
// This define for debug mode
//

{$DEFINE RELEASE}

program test;

uses
  Windows,
  Forms,
  normal in 'dfm\normal.pas' {frmApp},
  trial in 'dfm\trial.pas' {frmTrial},
  regkey in 'dfm\regkey.pas' {frmRegKey};

{$R *.RES}

//------------------------------------------------
//  This procedure will be called by ASProtect if:
//  1. Trial doesn't expire
//  2. Application was registered
//------------------------------------------------
procedure ExecuteApplication;
begin
  Application.CreateForm(TfrmApp, frmApp);
end;
exports ExecuteApplication;
//------------------------------------------------------------------------------
//  This procedure will be called by ASProtect if:
//  1. Evaluation period of application has expired
//------------------------------------------------------------------------------
Procedure ExecuteTrial;
begin
  Application.CreateForm(TfrmTrial, frmTrial);
end;
exports ExecuteTrial;
//------------------------------------------------------------------------------
type
  TProcedure = procedure;

const
{$IFDEF RELEASE}
  ASProtectRunApplication : TProcedure = ExecuteTrial;
{$ELSE}
  ASProtectRunApplication : TProcedure = ExecuteApplication;
{$ENDIF}

//------------------------------------------------------------------------------
//  This procedure will be called by ASProtect
//  and ASProtect will pass the pointer to the dispatcher
//------------------------------------------------------------------------------
procedure GetRunApplicationFunction(Ptr : TProcedure);stdcall;
begin
  ASProtectRunApplication := Ptr;
end;
exports GetRunApplicationFunction;
//------------------------------------------------------------------------------
// Initialization
//------------------------------------------------------------------------------

const
  MessageTitle = 'Information'; 
  MessageStr   = 'This example shows the work in trial mode'#13#10+
                 'Don''t  forget to protect the example in order to see the work of ASProtect API'; 

begin

  MessageBox(0, MessageStr, MessageTitle, MB_ICONINFORMATION );


  Application.Initialize;

  // This is a call of ASProtect dispatcher

  ASProtectRunApplication;

  Application.Run;
end.
