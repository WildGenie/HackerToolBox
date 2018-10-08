library sandboxiedetect;

Uses
  Windows,
  Sysutils,
  tlhelp32;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma Sandboxie Detect plugin © Vladimir Sukhov 5 November 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin checks if the application is running under Sandboxie'#10#13 +
                               'If Sandboxie is found then will be shown warning message and application terminates';
end;

const
  Title : pchar = 'Error';
  Text : pchar = 'Sandboxie is running on this machine! Please close it down and try again!';

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
  lpSandboxName = 'sbiedll';
var
  SnapShotID : DWORD;
  lpme: TModuleEntry32;
begin
  SnapShotID := CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, GetCurrentProcessID);
  if SnapShotID <> 0 then
  begin
    lpme.dwSize := SizeOf(lpme);
    if Module32First(SnapShotID, lpme) then
    begin
      repeat
        if StrLIComp(PChar(ExtractFileName(lpme.szModule)), lpSandboxName, length(lpSandboxName)) = 0 then
          ExitWithMessage;
      until not Module32Next(SnapShotID, lpme);
    end;
    CloseHandle(SnapShotID);
  end;
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


