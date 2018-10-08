library getstartupinfo;

uses Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma anti-debugger plugin - GetStartupInfo © Vladimir Sukhov 30 August 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin uses GetStartupInfo function to find a debugger.'#10#13 +
                               'Current method can  be applied for detecting OllyDbg only.'#10#13 +
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
var
  lpStartupInfo : _STARTUPINFOA;
begin
  // This plugin uses GetStrtupInfo function to find a debugger
  // This function is placed into timer loop with 2 seconds delay and works all the time when
  // main application is working
  FillChar(lpStartupInfo, sizeof(_STARTUPINFOA), #0);
  lpStartupInfo.cb := sizeof(_STARTUPINFOA);
  GetStartupInfoA(lpStartupInfo);
  if (lpStartupInfo.dwX <> 0) or
     (lpStartupInfo.dwY <> 0) or
     (lpStartupInfo.dwXSize <> 0) or
     (lpStartupInfo.dwYSize <> 0) or
     (lpStartupInfo.dwXCountChars <> 0) or
     (lpStartupInfo.dwYCountChars <> 0) or
     (lpStartupInfo.dwFillAttribute <> 0) then
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

