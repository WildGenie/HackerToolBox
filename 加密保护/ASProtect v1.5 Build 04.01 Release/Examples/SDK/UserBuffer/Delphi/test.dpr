program Test;

uses
  Windows,
  SysUtils;

Var
  i : Integer;

begin

  MessageBox(0,'Begin','',0);

  {$I Inc\UserPolyBuffer.inc}

  For i:= 1 to 5 do MessageBox( 0, PChar(IntToStr(i)), 'Index', 0 );

  MessageBox(0,'End','',0);

end.