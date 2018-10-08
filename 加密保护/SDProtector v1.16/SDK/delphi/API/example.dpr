program example;

uses
  Forms,
  main in 'main.pas' {Demo},
  sdprotector in '..\include\sdprotector.pas',
  reg in 'reg.pas' {RegForm},
  trial in 'trial.pas' {TrialForm};

{$R *.RES}

procedure SDP_ExecuteTrialNotExpired;
  begin

   TrialForm:=TTrialForm.Create(application);
   TrialForm.ShowModal;

  end;
exports SDP_ExecuteTrialNotExpired;

Procedure SDP_ExecuteTrialExpired;
begin
 RegForm:=TRegForm.Create(application);
 RegForm.ShowModal;
end;
exports SDP_ExecuteTrialExpired;

procedure SDP_ExecuteRegistered;
var
    UserName : array[0..255] of Char;
    iResult:Integer;
begin
        iResult:=SDP_GetRegistrationName(@UserName[0],256);
        if iResult>0 then        //If succeeded
          begin
                // you can check whether the user is legal
		// for simple, we just do nothing here.
          end;
end;
exports SDP_ExecuteRegistered;

begin
  Application.Initialize;
  Application.CreateForm(TDemo, Demo);
  SDP_RunApplicationFunction;
  Application.Run;
end.

