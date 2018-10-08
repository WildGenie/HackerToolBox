{$J+}
library test;

uses
  SysUtils,
  Windows,
  aspr_api;


Const
  ModeName       : PChar   = '';

Var
  ModeStatus     : TModeStatus;


procedure MB;
begin
  MessageBox(0,'procedure MB','MB',0);
end;
exports MB;


begin
  GetModeInformation( 0, ModeName, ModeStatus );
  If ModeName = nil then ModeName:= 'No Mode';    //' Protect file first!

  MessageBox(0, ModeName, 'Current Mode Name:',0)
end.