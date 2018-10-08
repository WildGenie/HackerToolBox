library ntqueryinformationprocess;

uses Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma anti-debugger plugin - NtQueryInformationProcess © Vladimir Sukhov 30 August 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin uses NtQueryInformationProcess function to find a debugger.'#10#13 +
                               'If debugger is found, plugin shows a message and terminates application.';
end;

const
  Title : pchar = 'Error';
  Text : pchar = 'Debugger is found on this machine!';

var
  TimerID : cardinal;
  fn : function (hProcess : cardinal; Port : cardinal; var pbDebuggerPresent : boolean; nSize : cardinal; Reserved : cardinal) : boolean; stdcall;

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
var
  b : boolean;
begin
  b := false;
  // This plugin uses NtQueryInformationProcess function to find a debugger
  // This function is placed into timer loop with 2 seconds delay and works all the time when
  // main application is working
  fn(GetCurrentProcess, 7, b, 4, 0);
  if b then
  begin
    KillTimer(0, TimerID);
    ExitWithMessage;
  end;
end;

procedure CheckDebugger_Timer(hwnd : cardinal; uMsg, idEvent, dwTime : cardinal); stdcall;
begin
  if idEvent <> TimerID then Exit;
  CheckDebugger;
end;

procedure Enigma_Plugin_OnInit;
begin
  fn := GetProcAddress(GetModuleHandleA('ntdll.dll'), 'NtQueryInformationProcess');
  // function presents only on Windows NT
  if @fn = nil then Exit;
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

