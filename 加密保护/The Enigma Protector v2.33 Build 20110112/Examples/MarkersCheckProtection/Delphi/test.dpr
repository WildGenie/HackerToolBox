program test;

uses
  Windows,
  SysUtils;

begin
  {$I ..\..\..\EnigmaSDK\Delphi\check_protection_begin.inc}
  // This message will not be shown if protection is corrupted
  MessageBox(0, 'The protection is OK!', 'Application!', 0);
  {$I ..\..\..\EnigmaSDK\Delphi\check_protection_end.inc}
  // This message will be always shown
  MessageBox(0, 'If you did not see any message before then protection is corrupted!', 'Application', 0);
end.
 