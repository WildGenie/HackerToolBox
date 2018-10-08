program test;

uses
  Windows,
  SysUtils;

begin
  MessageBox(0, #10#13'This message always appears on application start!' +
                #10#13'You can register it by means Simple_Key.reg file.' +
                #10#13, 'Application', 0);

  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_begin1.inc}
  MessageBox(0, #10#13'This message appears only if application is registered' +
                #10#13'and section #1 unlocked by registration key' +
                #10#13, 'Application', 0);
  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_end1.inc}

  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_begin2.inc}
  MessageBox(0, #10#13'This message appears only if application is registered' +
                #10#13'and section #2 unlocked by registration key' +
                #10#13, 'Application', 0);
  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_end2.inc}

  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_begin3.inc}
  MessageBox(0, #10#13'This message appears only if application is registered' +
                #10#13'and section #3 unlocked by registration key' +
                #10#13, 'Application', 0);
  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_end3.inc}

  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_begin4.inc}
  MessageBox(0, #10#13'This message appears only if application is registered' +
                #10#13'and section #4 unlocked by registration key' +
                #10#13, 'Application', 0);
  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_end4.inc}

  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_begin5.inc}
  MessageBox(0, #10#13'This message appears only if application is registered' +
                #10#13'and section #5 unlocked by registration key' +
                #10#13, 'Application', 0);
  {$I ..\..\..\..\EnigmaSDK\Delphi\reg_crypt_end5.inc}
end.
 