library heapcheck;

uses Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma anti-debugger plugin - HeapCheck © Vladimir Sukhov 29 August 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin uses HeapCheck technology to find debugger.'#10#13 +
                               'Once debugger found it shows warning'#10#13 +
                               'message and terminates application';
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
  hHeap : cardinal;
  pHeap : pointer;
begin
  hHeap := HeapCreate(0, $10, $10);
  pHeap := HeapAlloc(hHeap, 0, $10);
  // This plugin checks if the current project is under debugger
  // Current method works only if the processes was run under debugger and
  // does not work if debugger has beed attached to already executed process
  asm
    //int 3
    mov eax, pHeap
    lea edi, [eax + $10]
    mov al, 0abh
    mov ecx, 8
    repe scasb
    jnz @not_being_debugged
    call ExitWithMessage
    @not_being_debugged:
  end;
  HeapFree(hHeap, 0, pHeap);
  HeapDestroy(hHeap);
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

