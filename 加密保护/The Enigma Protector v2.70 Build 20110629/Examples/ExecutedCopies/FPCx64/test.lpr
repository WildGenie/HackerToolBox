program test;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils,
  enigma_ide64 in '..\..\..\EnigmaSDK\FPCx64\enigma_ide64.pas';

var
  Total, Current : Cardinal;

begin
  // Get total number of executed copies and current one
  if EP_CheckupCopies(Total, Current) then
  begin
    MessageBox(0, PAnsiChar(format('There is set up %d of total executed copies,'#10#13'This is the %d-th runing copy!', [Total, Current])), 'Application', MB_OK or MB_ICONINFORMATION);
  end else
  begin
    // If the function returns false, it means that checkup
    // of executed copies is not set on the project
    MessageBox(0, 'Unable to get executed copies count. To solve the problem, be sure:'#10#13'1. Application is protected,'#10#13'2. Checkup of executed copies is enabled.', 'Application', MB_OK or MB_ICONERROR);
  end;
end.
