//{$DEFINE DEBUG}

unit main;

interface

uses
  SysUtils,
  Windows;

procedure Start;

implementation

uses
  asp_api;

//------------------------------------------------------------------------------
procedure ExecuteApplication;
var
  Total,
  Left    : DWORD;
begin
  try

    if ASP_GetRegistrationInformation <> '' then
    begin
      {$I include\sdk_reg_crypt_begin.inc}
      MessageBox(0,PChar(ASP_GetRegistrationInformation),'Registered version',0);
      {$I include\sdk_reg_crypt_end.inc}
    end
    else
    begin

      ASP_GetTrialDays(Total, Left);
      MessageBox(0,PChar('You have '+IntToStr(Left)+' days of '+IntToStr(Total)+'.'#13#10+
                         'Hardware ID '+PChar(ASP_GetHardwareID)),'Unregistered version!',0);
    end;
  except
    MessageBox(0,'ASProtect not found!','Encrypt and Decrypt',0);
  end;
end;
exports ExecuteApplication;
//------------------------------------------------------------------------------
procedure ExecuteTrial;
begin
  MessageBox(0,'Trial Expired!','Unregistered version!',0);
end;
exports ExecuteTrial;
//------------------------------------------------------------------------------
procedure Start;
begin
  try
    {$IFNDEF DEBUG}
    ASP_IsOK1;
    {$ENDIF}
  except
    MessageBox(0,'ASProtect not found!','Check #1!',0);
  end;

  try
    {$IFNDEF DEBUG}
    ASP_IsOK2;
    {$ENDIF}
  except
    MessageBox(0,'ASProtect not found!','Check #2!',0);
  end;

  try
    {$IFNDEF DEBUG}
    ASP_IsOK3;
    {$ENDIF}
  except
    MessageBox(0,'ASProtect not found!','Check #3!',0);
  end;

  try
    {$IFNDEF DEBUG}
    ASP_IsOK4;
    {$ENDIF}
  except
    MessageBox(0,'ASProtect not found!','Check #4!',0);
  end;

  try
    {$IFNDEF DEBUG}
    ASP_RunTrialApplication;
    {$ENDIF}
  except
    MessageBox(0,'ASProtect not found!','ASP_RunTrialApplication',0);
  end;

end;
end.