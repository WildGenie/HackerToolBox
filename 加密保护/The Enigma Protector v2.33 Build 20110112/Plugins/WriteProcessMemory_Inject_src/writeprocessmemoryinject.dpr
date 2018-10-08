library emulatorsdetect;

Uses
  Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma anti-WriteProcessMemory hook plugin - © Vladimir Sukhov 21 January 2009';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin checks if the WriteProcessMemory Windows API is hooked by anyone.'#10#13 +
                               'Plugin is written for Enigma Protector 1.62 and I cannot guaranty that'#10#13 +
                               'it will work in future versions!'#10#13 +
                               'It simply checks if the fisrt byte of WriteProcessMemory is a jmp instruction.'#10#13 +
                               'If WriteProcessMemory function is hooked then application is terminating without any messages.'#10#13 +
                               'Look at http://enigmaprotector.com/forum/viewtopic.php?f=7&t=30';
end;

const
  Title : pchar = 'Error';
  Text : pchar = 'WriteProcessMemory is hooked! Application will be closed.';

var
  ThreadID : cardinal;
  TimerID  : cardinal;

procedure ExitWithMessage; assembler;
asm
  // Clear some addresses in stack
  mov ecx, 5
  @clear_loop:
  dec ecx
  mov dword ptr [ecx * 4 + esp], 0
  cmp ecx, 0
  jnz @clear_loop
  // Parameter for ExitProcess
  push 0
  push 0
  jmp ExitProcess
end;

procedure CheckHook;
var
  lpFunction : pointer;
begin
  lpFunction := GetProcAddress(GetModuleHandle('kernel32.dll'), 'WriteProcessMemory');
  if lpFunction <> nil then
  begin
    if not IsBadReadPtr(lpFunction, 1) then
    begin
      if PByte(lpFunction)^ = $E9 then
      begin
        ExitWithMessage;
      end;
    end;
  end;
end;

function Thread_CallBack(AParam : cardinal) : cardinal; stdcall;
begin
  while true do
  begin
    CheckHook;
    // Wait 2 seconds and check debugger again!
    Sleep(2000);
  end;
end;

procedure Timer_CallBack(hwnd : cardinal; uMsg, idEvent, dwTime : cardinal); stdcall;
var
  dwtemp : dword;
begin
  if idEvent <> TimerID then Exit;
  if GetExitCodeThread(ThreadID, dwtemp) and ((dwtemp = STILL_ACTIVE) or (dwtemp = STATUS_WAIT_0)) then
  begin
    // Trick against suspending thread
    ResumeThread(ThreadID);
    // Trick against set lowest prioroty to thread
    SetThreadPriority(ThreadID, THREAD_PRIORITY_NORMAL);
  end else
  begin
    // if GetThreadTimes fails it means that thread was killed
    // so, exit with a debugger message
    KillTimer(0, TimerID);
    ExitWithMessage;
  end;
end;

procedure Enigma_Plugin_OnInit;
var
  cthread : cardinal;
begin
  CheckHook;
  // Create thread that will looking for debugger
  ThreadID := CreateThread(nil, 0, @Thread_CallBack, nil, 0, cthread);
  if ThreadID <> 0 then
  begin
    // Create a timer that will looking for thread
    TimerID := SetTimer(0, 1, 2000, @Timer_CallBack);
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


