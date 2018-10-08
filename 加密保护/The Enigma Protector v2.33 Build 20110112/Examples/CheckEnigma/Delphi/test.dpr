program test;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils,
  enigma_ide in '..\..\..\EnigmaSDK\Delphi\enigma_ide.pas';

begin
  // Check, if the file is protected
  if EP_CheckupIsProtected then
  begin
    MessageBox(0, 'We are under protection!', 'Application', MB_OK or MB_ICONINFORMATION);
  end else
  begin
    MessageBox(0, 'Please protect this file before usage!', 'Application', MB_OK or MB_ICONERROR);
  end;

  // Check, if crc of Enigma protection is ok or no
  if EP_CheckupIsEnigmaOk then
  begin
    MessageBox(0, 'Protection CRC is good!'#10#13'Everything is well, we can complete the job!', 'Application', MB_OK or MB_ICONINFORMATION);
  end else
  begin
    MessageBox(0, 'Protection is changed/cracked...', 'Application', MB_OK or MB_ICONERROR);
  end;
end.
