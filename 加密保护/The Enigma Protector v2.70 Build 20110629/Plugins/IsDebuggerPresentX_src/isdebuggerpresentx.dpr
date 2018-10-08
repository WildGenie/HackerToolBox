library isdebuggerpresentx;

uses Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma anti-debugger plugin - IsDebuggerPresent © Vladimir Sukhov 30 August 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin uses the same principle as IsDebuggerPresent'#10#13 +
                               'function to find a debugger.'#10#13 +
                               'If debugger is found, plugin shows a message and terminates application.';
end;

const
  Title : pchar = 'Error';
  Text : pchar = 'Debugger is found on this machine!';

var
  TimerID : cardinal;

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

procedure CheckDebugger;
begin
  // This plugin uses IsDebuggerPresent function to find a debugger
  // This function is placed into timer loop with 2 seconds delay and works all the time when
  // main application is working
  asm
    mov eax, fs:[30h]
    cmp byte ptr [eax+2], 0
    je @not_being_debugged
    push TimerID
    push 0
    call KillTimer
    call ExitWithMessage
    @not_being_debugged:
  end;
end;

procedure CheckDebugger_Timer(hwnd : cardinal; uMsg, idEvent, dwTime : cardinal); stdcall;
begin
  if idEvent <> TimerID then Exit;
  CheckDebugger;
end;

var
  lpVersionInfo : _OSVERSIONINFOA;

procedure Enigma_Plugin_OnInit;
begin
  // it works only on Windows NT
  lpVersionInfo.dwOSVersionInfoSize := sizeof(lpVersionInfo);
  if not GetVersionExA(lpVersionInfo) then Exit;
  if lpVersionInfo.dwPlatformId <> VER_PLATFORM_WIN32_NT then Exit;
  // Check debugger
  CheckDebugger;
  TimerID := SetTimer(0, 1, 2000, @CheckDebugger_Timer);
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

