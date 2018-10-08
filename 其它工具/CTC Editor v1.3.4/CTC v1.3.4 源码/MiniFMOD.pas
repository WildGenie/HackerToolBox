
Unit MiniFMOD;

Interface

Uses
  Windows;

Type
  TMemoryFile = Record
    Length: Cardinal;
    Position: Cardinal;
    Data: Pointer;
  End;
  PMemoryFile = ^TMemoryFile;
  PMUSICMODULE = Pointer;

Const
  // this is for the callbacks
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;

Var
  Module: PMUSICMODULE = Nil;
  _ResName, _ResType: PChar;
  __turboFloat: Integer;

// functions from MiniFMOD

Procedure _FSOUND_File_SetCallbacks(OpenCallback, CloseCallback, ReadCallback, SeekCallback, TellCallback: Pointer); cdecl;
Function _FMUSIC_LoadSong(Name: PChar; SampleLoadCallback: Pointer): PMUSICMODULE; cdecl;
Function _FMUSIC_FreeSong(Module: PMUSICMODULE): ByteBool; cdecl;
Function _FMUSIC_PlaySong(Module: PMUSICMODULE): ByteBool; cdecl;
Function _FMUSIC_StopSong(Module: PMUSICMODULE): ByteBool; cdecl;
Function _FMUSIC_GetOrder(Module: PMUSICMODULE): Integer; cdecl;
Function _FMUSIC_GetRow(Module: PMUSICMODULE): Integer; cdecl;
Function _FMUSIC_GetTime(Module: PMUSICMODULE): Cardinal; cdecl;

// functions I added

Procedure XMPlayFromRes(ResName, ResType: PChar);
Procedure XMFree();

Implementation

{$L MiniFMOD.obj}

{
  C functions which are not included in the .OBJ, so
  we need to reprogram them here.
}

Function _memcpy(Destination: Pointer; Source: Pointer; Count: Cardinal): Pointer; cdecl;
Begin
  CopyMemory(Destination, Source, Count);
  Result := Destination;
End;

Function _memset(Destination: Pointer; C: Integer; Count: Cardinal): Pointer; cdecl;
Begin
  FillMemory(Destination, Count, C);
  Result := Destination;
End;

Function _calloc(Number: Cardinal; Size: Cardinal): Pointer; cdecl;
Begin
  GetMem(Result, Number * Size);
  ZeroMemory(Result, Number * Size);
End;

Procedure _free(Block: Pointer); cdecl;
Begin
  FreeMem(Block);
End;

Procedure __ftol;
Asm
  push          eax
  fistp         dword ptr [esp]
  fwait
  pop           eax
End;

Procedure _fabs;
Asm
  fld           qword ptr [esp + 4]
  fabs
  fwait
End;

Procedure _sin;
Asm
  fld           qword ptr [esp + 4]
  fsin
  fwait
End;

Procedure _abs;
Asm
  mov           eax, dword ptr [esp + 4]
  test          eax, $80000000
  jz            @Exit
  neg           eax
  @Exit:
End;

Procedure _pow;
Asm
  fld           qword ptr [esp + 12]
  fld           qword ptr [esp + 4]
  fyl2x
  fld           ST(0)
  frndint
  fsub          ST(1), ST
  fxch          ST(1)
  f2xm1
  fld1
  fadd
  fscale
  fstp          ST(1)
  fwait
End;

{
  here comes the callback functions when playing from a resource
}

Function MemFile_OpenCallback(Name: PChar): PMemoryFile; cdecl;
Var
  ResParam: HRSRC;
  ResHandle: HGLOBAL;
Begin
  New(Result);
  ResParam := FindResource(hInstance, Name, _ResType);
  ResHandle := LoadResource(hInstance, ResParam);
  Result.Length := SizeofResource(hInstance, ResParam);
  Result.Data := LockResource(ResHandle);
  Result.Position := 0;
End;

Procedure MemFile_CloseCallback(MemFile: PMemoryFile); cdecl;
Begin
  Dispose(MemFile);
End;

Function MemFile_ReadCallback(Buffer: Pointer; Size: Cardinal; MemFile: PMemoryFile): Integer; cdecl;
Begin
  If MemFile.Position + Size >= MemFile.Length Then
    Size := MemFile.Length - MemFile.Position;
  CopyMemory(Buffer, Pointer(Cardinal(MemFile.Data) + MemFile.Position), Size);
  MemFile.Position := MemFile.Position + Size;
  Result := Size;
End;

Procedure MemFile_SeekCallback(MemFile: PMemoryFile; Position: Integer; Mode: Byte); cdecl;
Begin
  Case Mode Of
    SEEK_SET: MemFile.Position := Position;
    SEEK_CUR: MemFile.Position := Integer(MemFile.Position) + Position;
    SEEK_END: MemFile.Position := Integer(MemFile.Length) + Position;
  End;
  If MemFile.Position > MemFile.Length Then
    MemFile.Position := MemFile.Length;
End;

Function MemFile_TellCallback(MemFile: PMemoryFile): Integer; cdecl;
Begin
  Result := MemFile.Position;
End;

{
  some imports (waveout API)
}

Function waveOutOpen: DWORD; stdcall; external 'winmm.dll';

Function waveOutClose: DWORD; stdcall; external 'winmm.dll';

Function waveOutPrepareHeader: DWORD; stdcall; external 'winmm.dll';

Function waveOutUnprepareHeader: DWORD; stdcall; external 'winmm.dll';

Function waveOutWrite: DWORD; stdcall; external 'winmm.dll';

Function waveOutReset: DWORD; stdcall; external 'winmm.dll';

Function waveOutGetPosition: DWORD; stdcall; external 'winmm.dll';

{
  functions from MiniFMOD
}

Procedure _FSOUND_File_SetCallbacks; external;
Function _FMUSIC_LoadSong; external;
Function _FMUSIC_FreeSong; external;
Function _FMUSIC_PlaySong; external;
Function _FMUSIC_StopSong; external;
Function _FMUSIC_GetOrder; external;
Function _FMUSIC_GetRow; external;
Function _FMUSIC_GetTime; external;

{
  here we go with the functions we will use
  from outside this unit
}

Procedure XMPlayFromRes(ResName, ResType: PChar);
Begin
  If Module <> Nil Then Exit;
  _ResName := ResName;
  _ResType := ResType;
  _FSOUND_File_SetCallbacks(@MemFile_OpenCallback, @MemFile_CloseCallback,
    @MemFile_ReadCallback, @MemFile_SeekCallback, @MemFile_TellCallback);
  Module := _FMUSIC_LoadSong(ResName, Nil);
  _FMUSIC_PlaySong(Module);
End;

Procedure XMFree();
Begin
  _FMUSIC_FreeSong(Module);
  Module := Nil;
End;

End.

