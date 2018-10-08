program test;

uses
  Windows,
  SysUtils,
  enigma_ide in '..\..\..\EnigmaSDK\Delphi\enigma_ide.pas';

begin
  if not EP_CheckupIsProtected then
  begin
    MessageBox(0, 'Please protect application before start!', 'Test', MB_OK or MB_ICONERROR);
    Exit;
  end;
  if EP_CheckupVirtualizationTools then
  begin
    MessageBox(0, 'Virtualization Tools like VMWare/VirtualBox/VirtualPC had been found!', 'Test', MB_OK or MB_ICONWARNING);
  end else
  begin
    MessageBox(0, 'No Virtualization Tools had been found...'#13#10'Program is probably started under real Windows system or'#13#10'Virtualization Tools check up is not enabled in Enigma Protector.', 'Test', MB_OK or MB_ICONINFORMATION);
  end;
end.
 