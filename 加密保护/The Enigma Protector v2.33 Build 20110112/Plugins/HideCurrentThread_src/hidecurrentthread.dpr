library hidecurrentthread;

uses Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma hide process from debugger plugin - Hide Current Thread © Vladimir Sukhov 30 August 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin hides process from debugger.'#10#13 +
                               'It continiously calls NtSetInformationThread to disable debug messsages.'#10#13 +
                               'If the process with this plugin will be executed or attached by debugger -'#10#13 +
                               'debugger will not receive any debug messages and will not give possibility'#10#13 +
                               'to reverse/analize this process';
end;

var
  TimerID : cardinal;
  fn : function (ThreadHandle : cardinal; ThreadInformationClass : cardinal; ThreadInformation : pointer; ThreadInformationLength : cardinal): cardinal; stdcall;

procedure HideDebugger;
begin
  // This plugin uses NtSetInformationThread function to hide thread from debugger
  // This function is placed into timer loop with 2 seconds delay and works all the time when
  // main application is working
  fn(GetCurrentThread, $11, nil, 0);
end;

procedure HideDebugger_Timer(hwnd : cardinal; uMsg, idEvent, dwTime : cardinal); stdcall;
begin
  if idEvent <> TimerID then Exit;
  HideDebugger;
end;

procedure Enigma_Plugin_OnInit;
begin
  fn := GetProcAddress(GetModuleHandleA('ntdll.dll'), 'NtSetInformationThread');
  // function presents only on Windows NT
  if @fn = nil then Exit;
  HideDebugger;
  TimerID := SetTimer(0, 1, 2000, @HideDebugger_Timer);
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

