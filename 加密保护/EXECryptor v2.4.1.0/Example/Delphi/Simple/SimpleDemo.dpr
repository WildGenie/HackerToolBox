program SimpleDemo;
{$APPTYPE CONSOLE}
uses
  Windows,
  SysUtils;

procedure VerifySN(const s: string);
var c,d: integer;
begin
  // simple serials verification for test if/while construction
{$I crypt_start.inc}
  c:=1; d:=Length(s);
  while (c <= d) and (s[c] = s[d]) do begin
    inc(c); dec(d);
  end;
  if d <= c then
    writeln('Valid serial: '+s)
  else
    writeln('Invalid serial: '+s);
{$I crypt_end.inc}
end;

{$DEFINE UNSAFE_CRYPT}
procedure UnsafeEncryptionTest;
var a,b: integer;
begin
  {$I crypt_start.inc}
  a:=1; b:=1;
  if a = b then begin
    {$I crypt_end.inc}
    writeln('Test OK');
  end;
end;
{$UNDEF UNSAFE_CRYPT}

procedure AdvProtectedCode;
begin
  writeln('Test OK');
end;

exports AdvProtectedCode name 'EXECryptor_FN_AdvProtectedCode';

label L1;
var a,b,j: integer;

begin
  writeln('----- simple encryption test');
  {$I crypt_start.inc}
  writeln('Test OK');
  {$I crypt_end.inc}
  writeln('done.');

  writeln('----- advanced encryption test');
  AdvProtectedCode;
  writeln('done.');

  writeln('----- condition jmp test');
  {$I crypt_start.inc}
  VerifySN('abcd;dcba');
  VerifySN('213,213');
  VerifySN('203,302');
  {$I crypt_end.inc}
  writeln('done.');
  
  writeln('----- unsafe encryption');
  UnsafeEncryptionTest;
  writeln('done.');
  
  writeln('----- jump outside encrypted block test');
  // you can leave encrypted block with "goto"
  {$I crypt_start.inc}
  a:=1; b:=1;
  if a = b then goto L1;
  writeln('jump outside encrypted block: Fail');
  {$I crypt_end.inc}
  L1:
  writeln('jump outside encrypted block: OK');
  writeln('done.');

  writeln('----- exception test');
  // you can leave encrypted block with "raise"
  for j:=1 to 3 do
    try
      {$I crypt_start.inc}
      raise Exception.Create('exception test: '+inttostr(j));
      {$I crypt_end.inc}
    except
      on E: Exception do
        writeln(E.Message);
    end;
  writeln('done.');
  writeln('Press "Enter" to exit ...'); readln;
end.
