library emulatorsdetect;

Uses
  Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma anti-emulators plugin - GetProcAddress © Vladimir Sukhov 2 November 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin calls GetProcAddress function with random names of functions.'#10#13 +
                               'Emulators usually hooks all Windows API functions (due to a lot of APIs),'#10#13 +
                               'here we are trying to get address of non existed function. If our process'#10#13 +
                               'is being under emulator, we will get non zero address.'#10#13 +
                               'If we are under emulator - just show a message and terminate.';
end;

const
  Title : pchar = 'Error';
  Text : pchar = 'Emulator is found on this machine!';

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
  const
    lpChars : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  var
    lpName : string;
    i : integer;
begin
  // Calculate random function name
  for i := 0 to Random(15) + 10 do
    lpName := lpName + lpChars[Random(length(lpChars) + 1)];
  if GetProcAddress(GetModuleHandle('kernel32.dll'), pchar(lpName)) <> nil then
    ExitWithMessage;
end;

function Thread_CallBack(AParam : cardinal) : cardinal; stdcall;
begin
  while true do
  begin
    CheckDebugger;
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
  CheckDebugger;
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


