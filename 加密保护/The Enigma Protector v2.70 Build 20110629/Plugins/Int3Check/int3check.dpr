library int3check;

uses Windows;

function Enigma_Plugin_About : PWideChar;
begin
  Enigma_Plugin_About := 'Enigma anti-breakpoints plugin - Int3Check © Vladimir Sukhov 30 August 2008';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  Enigma_Plugin_Description := 'This plugin checks if there is "int 3" (0xCC) opcode in the begin of system functions.'#10#13 +
                               'If  0xCC opcode will be found it means that debugger breakpoint is set to the function.'#10#13 +
                               'I.e. process is being debuggered.'#10#13 +
                               'Plugin shows a message and terminates application if breakpoint is found.';
end;

const
  Title : pchar = 'Error';
  Text : pchar = 'Debugger is found on this machine!';
  // Here is the set of modules that we will check, if you want - enlarge this set!
  aLibraries : array [0..7] of pchar =
  ('kernel32.dll', 'user32.dll', 'advapi32.dll', 'oleaut32.dll', 'gdi32.dll', 'ole32.dll', 'comctl32.dll', 'shell32.dll');

type
  PIMAGE_DOS_HEADER = ^IMAGE_DOS_HEADER;
  IMAGE_DOS_HEADER = packed record      { DOS .EXE header }
    e_magic         : WORD;             { Magic number }
    e_cblp          : WORD;             { Bytes on last page of file }
    e_cp            : WORD;             { Pages in file }
    e_crlc          : WORD;             { Relocations }
    e_cparhdr       : WORD;             { Size of header in paragraphs }
    e_minalloc      : WORD;             { Minimum extra paragraphs needed }
    e_maxalloc      : WORD;             { Maximum extra paragraphs needed }
    e_ss            : WORD;             { Initial (relative) SS value }
    e_sp            : WORD;             { Initial SP value }
    e_csum          : WORD;             { Checksum }
    e_ip            : WORD;             { Initial IP value }
    e_cs            : WORD;             { Initial (relative) CS value }
    e_lfarlc        : WORD;             { File address of relocation table }
    e_ovno          : WORD;             { Overlay number }
    e_res           : packed array [0..1] of cardinal; { Reserved words }
    e_oemid         : WORD;             { OEM identifier (for e_oeminfo) }
    e_oeminfo       : WORD;             { OEM information; e_oemid specific }
    e_res2          : packed array [0..4] of cardinal; { Reserved words }
    e_lfanew        : Longint;          { File address of new exe header }
  end;

  PIMAGE_NT_HEADERS = ^IMAGE_NT_HEADERS;
  IMAGE_NT_HEADERS = packed record
    Signature       : cardinal;
    FileHeader      : IMAGE_FILE_HEADER;
    OptionalHeader  : IMAGE_OPTIONAL_HEADER;
    Sections        : array [0..0] of IMAGE_SECTION_HEADER;
  end;

  PIMAGE_EXPORT_DIRECTORY = ^IMAGE_EXPORT_DIRECTORY;
  IMAGE_EXPORT_DIRECTORY = record
    Characteristics : cardinal;
    TimeDateStamp : cardinal;
    MajorVersion : WORD;
    MinorVersion : WORD;
    Name : cardinal;
    Base : cardinal;
    NumberOfFunctions : cardinal;
    NumberOfNames : cardinal;
    AddressOfFunctions : cardinal;     // RVA from base of image
    AddressOfNames : cardinal;         // RVA from base of image
    AddressOfNameOrdinals : cardinal;  // RVA from base of image
  end;


var
  TimerID : cardinal;
  fnDebugBreak : pointer;

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
  i, j : integer;
  hModule : cardinal;
  DH : PIMAGE_DOS_HEADER;
  NTH : PIMAGE_NT_HEADERS;
  ED : PIMAGE_EXPORT_DIRECTORY;
  EAddress : cardinal;
  EFunction : cardinal;
begin
  // This plugin checks if the functions of defined system dll are started with int 3 instruction
  // Usually, systems functions do not start with int 3 (DebugBreak is exception), if int 3 is found
  // it means that bedugger breakpoint is on the function
  // This function is placed into timer loop with 2 seconds delay and works all the time when
  // main application is working
  for i := 0 to length(aLibraries) - 1 do
  begin
    hModule := GetModuleHandleA(aLibraries[i]);
    if hModule <> 0 then
    begin
      DH := PIMAGE_DOS_HEADER(hModule);
      NTH := PIMAGE_NT_HEADERS(hModule + DH.e_lfanew);
      // Check if the export table is not null
      if NTH.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress <> 0 then
      begin
        ED := PIMAGE_EXPORT_DIRECTORY(hModule + NTH.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
        EAddress := ED.AddressOfFunctions + hModule;
        for j := 0 to ED.NumberOfFunctions - 1 do
        begin
          if PCardinal(EAddress)^ <> 0 then
          begin
            EFunction := PCardinal(EAddress)^ + hModule;
            if EFunction <> cardinal(fnDebugBreak) then
            begin
              if PByte(EFunction)^ = $CC then
              begin
                KillTimer(0, TimerID);
                ExitWithMessage;
              end;
            end;
          end;
          inc(EAddress, 4);
        end;
      end;
    end;
  end;
end;

procedure CheckDebugger_Timer(hwnd : cardinal; uMsg, idEvent, dwTime : cardinal); stdcall;
begin
  if idEvent <> TimerID then Exit;
  CheckDebugger;
end;

procedure Enigma_Plugin_OnInit;
begin
  // firstly we get offset of DebugBreak function
  fnDebugBreak := GetProcAddress(GetModuleHandleA('kernel32.dll'), 'DebugBreak');
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

