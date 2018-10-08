program CustomSerialsDemo;
{$APPTYPE CONSOLE}
uses
  Windows,
  SysUtils,
  EXECryptor in 'EXECryptor.pas';

procedure TestCustomSerials;
const 
  vr2Str: array[TVerifyResult] of string = ('Invalid','Expired','Stolen','OK');
begin
  writeln('Set valid code key');
  SetCodeKey(PChar('0123456789'),10);
  writeln('IsRegistered ',vr2Str[IsRegistered]);
  writeln('RegConst_0   ',RegConst_0);
  writeln('RegConst_1   ',RegConst_1);
  writeln('RegConst_2   ',RegConst_2);
  writeln('RegConst_3   ',RegConst_3);
  writeln('RegConst_4   ',RegConst_4);
  writeln('RegConst_5   ',RegConst_5);
  writeln('RegConst_6   ',RegConst_6);
  writeln('RegConst_7   ',RegConst_7);
  {$I crypt_reg.inc}
  writeln('crypt_reg done');
  {$I crypt_end.inc}
  {$I crypt_unreg.inc}
  writeln('crypt_unreg done');
  {$I crypt_end.inc}
  writeln('Press "Enter" to continue ...'); readln;

  writeln('Set invalid code key');
  SetCodeKey(PChar('764876746736476q'),16);
  writeln('IsRegistered ',vr2Str[IsRegistered]);
  writeln('RegConst_0   ',RegConst_0);
  writeln('RegConst_1   ',RegConst_1);
  writeln('RegConst_2   ',RegConst_2);
  writeln('RegConst_3   ',RegConst_3);
  writeln('RegConst_4   ',RegConst_4);
  writeln('RegConst_5   ',RegConst_5);
  writeln('RegConst_6   ',RegConst_6);
  writeln('RegConst_7   ',RegConst_7);
  {$I crypt_reg.inc}
  writeln('crypt_reg done');
  {$I crypt_end.inc}
  {$I crypt_unreg.inc}
  writeln('crypt_unreg done');
  {$I crypt_end.inc}
end;

begin
  {$I crypt_reg.inc}
  writeln('crypt_reg done');
  {$I crypt_end.inc}
  {$I crypt_unreg.inc}
  writeln('crypt_unreg done');
  {$I crypt_end.inc}

  TestCustomSerials;
  
  writeln('Press "Enter" to exit ...'); readln;
end.
