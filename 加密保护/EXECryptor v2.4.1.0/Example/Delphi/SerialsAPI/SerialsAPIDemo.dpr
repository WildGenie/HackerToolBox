program SerialsAPIDemo;
{$APPTYPE CONSOLE}
uses
  Windows,
  SysUtils,
  EXECryptor in 'EXECryptor.pas';

procedure TestSerials;
const
  vr2Str: array[TVerifyResult] of string = ('Invalid','Expired','Stolen','OK');
var
  SNInfo: TSerialNumberInfo;
begin

  writeln('Pupkin Ltd.    ANEG-8YSR-ZF2K   ',
    vr2Str[VerifySerialNumber('Pupkin Ltd.','ANEG-8YSR-ZF2K')]);
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

  writeln('License info test');
  writeln('Justas    CHCE-EAJG-EFEW-2WRX   ',
    vr2Str[VerifySerialNumberEx('Justas','CHCE-EAJG-EFEW-2WRX',SNInfo)]);
  with SNInfo do begin
    writeln('License type: ',LicType);
    if LicType = 1 then
      writeln('Expiry after: ',ExpiryMonth,'/',ExpiryYear)
    else
      writeln('UserParam: ',UserParam);
    writeln('Features: ',F1,',',F2,',',F3,',',F4,',',F5,',',F6);
  end;

  writeln;
  writeln('Justas    CP9P-GJKL-J5LM-XHSR   ',
    vr2Str[VerifySerialNumberEx('Justas','CP9P-GJKL-J5LM-XHSR',SNInfo)]);
  with SNInfo do begin
    writeln('License type: ',LicType);
    if LicType = 1 then
      writeln('Expiry after: ',ExpiryMonth,'/',ExpiryYear)
    else
      writeln('UserParam: ',UserParam);
    writeln('Features: ',F1,',',F2,',',F3,',',F4,',',F5,',',F6);
  end;

  writeln('Press "Enter" to continue ...'); readln;

  writeln('zzzzzz      ABCD-EFGH-3456   ',
    vr2Str[VerifySerialNumber('zzzzzz','ABCD-EFGH-3456')]);
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

  writeln('DecodeSerialNumber test');
  writeln('Justas    CHCE-EAJG-EFEW-2WRX   ',
    vr2Str[DecodeSerialNumber('Justas','CHCE-EAJG-EFEW-2WRX',SNInfo)]);
  with SNInfo do begin
    writeln('License type: ',LicType);
    if LicType = 1 then
      writeln('Expiry after: ',ExpiryMonth,'/',ExpiryYear)
    else
      writeln('UserParam: ',UserParam);
    writeln('Features: ',F1,',',F2,',',F3,',',F4,',',F5,',',F6);
  end;
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

  {$I crypt_start.inc}
  TestSerials;
  {$I crypt_end.inc}

  writeln('Press "Enter" to exit ...'); readln;
end.
