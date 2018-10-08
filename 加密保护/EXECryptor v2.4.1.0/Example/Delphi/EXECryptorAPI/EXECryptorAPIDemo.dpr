program EXECryptorAPIDemo;
{$APPTYPE CONSOLE}
uses
  Windows,
  SysUtils,
  EXECryptor in 'EXECryptor.pas';

procedure TestAPI;
var s: string;
    h: THandle;
begin
  {$I crypt_start.inc}
  write('AntiDebug ');
  AntiDebug;
  writeln('OK!');
  write('ProtectImport ');
  ProtectImport;
  writeln('OK!');
  writeln('IsAppProtected: ', IsAppProtected);
  writeln('GetEXECryptorVersion: ',GetEXECryptorVersion);
  writeln('GetReleaseDate: ',DateToStr(GetReleaseDate));
  writeln('SafeGetDate: ',DateToStr(SafeGetDate));
  writeln('HardwareID: ',IntToHex(GetHardwareID,8));
  s:=EncryptStr('this is a password string!');
  writeln('EncryptStr: ',s);
  writeln('DecryptStr: ',DecryptStr(s));
  h:=GetModuleHandle('kernel32.dll');
  writeln('GetProcAddress(LoadLibraryA) = $',
    IntToHex(DWORD(GetProcAddress(h,'LoadLibraryA')),8));
  writeln('SafeGetProcAddr(LoadLibraryA)    = $',
    IntToHex(DWORD(SafeGetProcAddr(h,'LoadLibraryA')),8));
  // HKCU read/write
  if SecureWrite('test key','this is my secret value!') then
    writeln('SecureWrite: passed')
  else
    writeln('SecureWrite: FAIL!');
  s:='';
  if SecureRead('test key',s) then
    writeln('SecureRead: ',s)
  else
    writeln('SecureRead: FAIL!');
  // HKLM read/write
  if SecureWrite('@test key','global secret value!') then
    writeln('SecureWrite@: passed')
  else
    writeln('SecureWrite@: FAIL!');
  s:='';
  if SecureRead('@test key',s) then
    writeln('SecureRead@: ',s)
  else
    writeln('SecureRead@: FAIL!');
  // retrieve trial info
  writeln('GetTrialDaysLeft: ',GetTrialDaysLeft(30));
  writeln('GetTrialRunsLeft: ',GetTrialRunsLeft(100));
  //
  SafeMessageBox(0,'SafeMessageBox OK!','EXECryptor API Demo',0);
  {$I crypt_end.inc}
end;

begin
  {$I crypt_start.inc}
  TestAPI;
  {$I crypt_end.inc}

  writeln('Press "Enter" to exit ...'); readln;
end.
