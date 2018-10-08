program test;

uses
  Windows,
  SysUtils;

begin
  {$I ..\..\..\EnigmaSDK\Delphi\unprotected_begin.inc}
  // This message will occur only in unprotected version of module
  MessageBox(0, 'If you are seeing this message then the module is not protected!', 'Application', 0);
  {$I ..\..\..\EnigmaSDK\Delphi\unprotected_end.inc}
  // This message will always occur
  MessageBox(0, 'If you did not see any messages then the module is protected!', 'Application', 0);
end.
 