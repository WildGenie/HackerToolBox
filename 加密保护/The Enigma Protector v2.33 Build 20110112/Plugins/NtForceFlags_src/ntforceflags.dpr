library ntforceflags;

Uses
  Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma anti-debugger plugin - NtForceFlags © Vladimir Sukhov 2 August 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin uses checkup of NtForceFlags to find a debugger.'#10#13 +
                               'If debugger is found, plugin shows a message and terminates application.';
end;

const
  Title : pchar = 'Error';
  Text : pchar = 'Debugger is found on this machine!';

procedure ExitWithMessage; assembler;
asm
  // Clear some addresses in stack
  mov ecx, 5
  @clear_loop:
  dec ecx
  mov dword ptr [ecx * 4 + esp], 0
  cmp ecx, 0
  jnz @clear_loop
  // Parametr for ExitProcess
  push 0
  // Parameters for MessageBoxA
  push MB_ICONERROR
  push Title
  push Text
  push 0
  // Return address of MessageBox that points to ExitProcess
  lea eax, ExitProcess
  push eax
  jmp MessageBoxA
end;

procedure Enigma_Plugin_OnInit;
var
  lpVersionInfo : _OSVERSIONINFOA;
begin
  // it does not work on Vista +... always detects a debugger
  lpVersionInfo.dwOSVersionInfoSize := sizeof(lpVersionInfo);
  if not GetVersionExA(lpVersionInfo) then Exit;
  if lpVersionInfo.dwPlatformId <> VER_PLATFORM_WIN32_NT then Exit;
  if lpVersionInfo.dwMajorVersion >= 6 then Exit;

  // This plugin checks if the current project is under debugger
  // Current method works only if the processes was run under debugger and
  // does not work if debugger has beed attached to already executed process
  asm
    mov eax, fs:[30h]
    mov eax, [eax+18h]
    cmp [eax+10h], 0
    je @not_being_debugged
    call ExitWithMessage
    @not_being_debugged:
  end;
end;

procedure Enigma_Plugin_OnFinal;
begin
end;

exports
  Enigma_Plugin_About,
  Enigma_Plugin_Description,
  Enigma_Plugin_OnInit,
  Enigma_Plugin_OnFinal;

begin
end.

