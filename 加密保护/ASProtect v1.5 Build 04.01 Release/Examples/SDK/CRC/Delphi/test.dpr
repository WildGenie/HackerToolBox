program Test;

uses
  SysUtils,
  Windows;


//-------------------------------------------------------------------------------

Procedure Main( SecureValue : DWORD );
begin
  {$I Inc\DelphiCrcBegin.inc}

  MessageBox(0,PChar(IntToHex(SecureValue,4)),'Under protection',0);

  {$I Inc\DelphiCrcEnd.inc}
end;

//-------------------------------------------------------------------------------

begin

  MessageBox(0,'Begin','',0);

  {$I Inc\DelphiCrcBegin.inc}
  Main( $12345678 );
  {$I Inc\DelphiCrcEnd.inc}


  MessageBox(0,'End','',0);

end.