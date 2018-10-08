{$J+}
library test;

uses
  SysUtils,
  Windows;

var
  UserName : PChar = '';

procedure MB;
begin
  MessageBox(0,'procedure MB','MB',0);
end;
exports MB;


procedure GetRegistrationInformation(NewUserName : PChar);stdcall
begin
  UserName := NewUserName;
end;
exports GetRegistrationInformation;

begin
  if StrLen( UserName ) <> 0 then MessageBox(0,UserName,'Registration info',0)
                             else MessageBox(0,'Unregistered version','Registration info',0);
end.