program test;

uses
  Windows,
  SysUtils;

begin
  MessageBox(0, 'Application is started!'#13#10'The code between decrypt_on_execute markers is enciphered now!', 'Test', 0);
  // Start of code which is hidden in memory
  {$I ..\..\..\EnigmaSDK\Delphi\decrypt_on_execute_begin.inc}
  MessageBox(0, 'The message from deciphered code!', 'Test', 0);
  {$I ..\..\..\EnigmaSDK\Delphi\decrypt_on_execute_end.inc}
end.
 