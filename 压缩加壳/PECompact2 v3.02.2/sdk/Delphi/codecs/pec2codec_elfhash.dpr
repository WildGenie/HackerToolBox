//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//
//  PEC2 Codec DLL
//  By BoB -> Team PEiD
//  http://PEiD.info/BobSoft/
//
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//
//  Computes ElfHash, which is similar to Crc32 ..  Bonuses of using this routine are that it's faster than Crc32 and no reverse function exists .. :)
//
//--------------------------------------------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Free Pascal compatability ..  Sets Delphi mode, and Intel Asm mode ..

{$IfDef FPC}
  {$Mode Delphi}
  {$AsmMode Intel}
  {$SmartLink ON}
{$EndIf}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------

Library pec2codec_elfhash;

Uses
  Windows,
  PEC2CodecSDK;


{$Imagebase $02000000}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Codec constants ..

Const
  CodecName    = 'ElfHash Codec';
  CodecAuthor  = 'BoB -> Team PEiD';
  VersionMajor = 1;
  VersionMinor = 0;
  CodecVersion = (VersionMajor * 100) + VersionMinor;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// String -> WideString conversion replacement for Buggy Delphi7 conversion functions (wrong codepage) ..  Returns length ..

Function  StrToWideBuffer(Const Src : String; pwszBuffer : pWideChar; dwSize : DWord) : DWord;
Var
  W : WideString;
Begin
  // Get Length of buffer needed ..
  Result := MultiByteToWideChar(GetACP, 0, @Src[1], Length(Src), @W[1], 0);
  SetLength(W, Result);
  // Convert string and return length ..
  Result := MultiByteToWideChar(GetACP, 0, @Src[1], Length(Src), @W[1], Result);
  Result := (Result * 2);
  If (dwSize < Result) Or (pwszBuffer = Nil) Then Exit;
  CopyMemory(pwszBuffer, @W[1], Result);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Returns length of null-terminated PAnsiChar stirng ..

Function  StrLen(PC : LPCSTR) : DWord;
Begin
  Result := 0;
  While (PC[Result] <> #0) Do Inc(Result);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Returns Lowercase string from PAnsiChar string ..

Function  Lowercase(PC : LPCSTR) : String;
Var
  I, Len : DWord;
Begin
  Len := StrLen(PC);
  SetLength(Result, Len);
  I := 0;
  While (I <= Len) Do Begin
    If (PC[I] In ['A' .. 'Z']) Then Result[I + 1] := Char(Ord(PC[I]) + 32)
    Else Result[I + 1] := PC[I];
    Inc(I);
  End;
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Encoder ..

Function  Encode(lpvSource : Pointer; dwSourceSize : DWord; lpvDest : Pointer; pdwDestSize : PDWord; dwLevel : DWord; pCallback : PFNCodecCallback) : DWord; StdCall;
Var
  D : PDWord;
  I : DWord;
  X, ChSum : DWord;
  A, B : PByte;
Begin
  // Ensure enough buffer space for extra DWords ..
  Result := dwSourceSize + 8;
  If (pdwDestSize^ < Result) Then Begin
    pdwDestSize^ := Result;
    Result := PEC2_CODEC_ERROR_INSUFFICIENT_BUFFER;
    Exit;
  End;

  // Init ElfHash ..
  A := lpvSource;
  ChSum := 0;

  // Put original size before encoded data ..
  D := lpvDest;
  D^ := dwSourceSize;
  Inc(D);
  B := Pointer(D);

  // Encode the data ..
  I := 0;
  While (I < dwSourceSize) Do Begin
    pCallBack(PEC2_CODEC_ACTION_ENCODE, I, I + 4, dwSourceSize);

    ChSum := (ChSum Shl 4) + A^;
    X := ChSum And $F0000000;
    If (X <> 0) Then ChSum := ChSum Xor (X Shr 24);
    ChSum := ChSum And (Not X);

    B^ := A^;
    Inc(A);
    Inc(B);
    Inc(I);
  End;
  pCallBack(PEC2_CODEC_ACTION_DONE, dwSourceSize, Result, 0);

  // Set last DWord to hash value ..
  D := Pointer(B);
  D^ := ChSum;
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Small Decoder ..  All referenced code and data must be contained within this function ..  It IS possible to do this in pascal, but is much easier in Asm ..

Function  DecodeSmall(lpvSource, lpvDest, lpExtraData : Pointer) : DWord; StdCall;
Asm
  // -> EBP = Stack frame ..  This is added by Delphi automatically around code that uses params ..
  // <- EAX = Decoded size ..


  //
  // Get offset delta in EBX ..  When added to addresses, this allows the Decoder to be run from any address ..
  //

  PushAD
  Call    @Delta
@Delta:
  Pop     EBX
  Sub     EBX, Offset @Delta


  //
  // Get hash of data ..
  //

  Mov     ESI, [lpvSource]                                 // EBP+ is added by compiler for all params ..  If you change EBP, then access params with ESP+32+4+4+?? ..
  Mov     EDI, [lpvDest]
  LodsD                                                    // Read DWord size ..
  Push    EAX                                              // Store size for result ..
  Push    EBX                                              // Store delta ..

  Mov     ECX, EAX                                         // ECX = Size ..
  Sub     EBX, EBX                                         // EBX = hash ..
@Loop:
  Sub     EAX, EAX
  LodsB                                                    // Read byte ..
  Shl     EBX, 4
  Add     EBX, EAX
  StosB                                                    // Write byte ..
  Mov     EAX, EBX
  And     EAX, $F0000000
  Test    EAX, EAX
  Je      @Skip
  Mov     EDX, EAX
  Shr     EDX, 24
  Xor     EBX, EDX
@Skip:
  Not     EAX
  And     EBX, EAX
  Loop    @Loop

  XChg    EBX, EDX                                         // EDX = Final hash value ..
  Pop     EBX
  LodsD                                                    // Read original hash DWord from end of data ..
  Cmp     EDX, EAX                                         // Current hash value == original hash value ?
  Je      @Leave


  //
  // Hash results mismatch!  Tell user about it and exit ..
  //

  Mov     ESI, [lpExtraData]
  Lea     EDX, [EBX + @Kernel32]
  Lea     EAX, [EBX + @ExitProcess]
  Call    @GetApi
  XChg    EAX, EDI                                         // EDI = ExitProcess Api address ..

  Lea     EDX, [EBX + @User32]
  Lea     EAX, [EBX + @MessageBox]
  Call    @GetApi


  //
  // Intentional obfustication to deter crackers 'fixing' result .. :)
  //

  Push    -1                                               // -1 = ExitProcess return value ..
  Push    EAX                                              // Fake return address to align stack ..

  Push    MB_IconError Or MB_TopMost                       // Type ..
  Push    0                                                // Title (defaults to 'Error') ..
  Lea     ECX, [EBX + @Text]
  Push    ECX                                              // Text ..
  Push    0                                                // hWnd ..

  Push    EDI                                              // ExitProcess Api Address ..
  Jmp     EAX                                              // Call MessageBoxA, return to ExitProcess ..


  //------------------------------------------------------------------------------------------------------------------------------------------------------------
  // Return Api address from Dll + api names ..

@GetApi:
// -> EDX = DllString
//    EAX = ApiString
//    ESI = Extra Data Pointer
// <- EAX = Api Address

  PushAD
  XChg    EDI, EAX
  Push    EDX                                              // DllString ..
  Call    [ESI + PEC2_DECODE_EXTRA.pLoadLibraryA]

  Push    EDI                                              // ApiString ..
  Push    EAX
  Call    [ESI + PEC2_DECODE_EXTRA.pGetProcAddress]
  Mov     [ESP + $1C], EAX
  PopAD
  Ret


  //------------------------------------------------------------------------------------------------------------------------------------------------------------
  // Data section ..

@User32:
  DB      'User32.DLL', 0
@Kernel32:
  DB      'Kernel32.DLL', 0
@ExitProcess:
  DB      'ExitProcess', 0
@MessageBox:
  DB      'MessageBoxA', 0
@Text:
  DB      'Error : Verification of buffer failed!', 10, 'This program cannot continue', 0


  //
  // Return decoded size ..
  //

@Leave:
  Pop     [ESP + $1C]                                      // Set EAX in pushed registers block to saved size ..
  PopAD
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Return size of small decoder ..  Note: This function MUST follow SmallDecoder, or this will not work !

Function  GetDecodeSmallFuncSize : DWord; StdCall;
Begin
  Result := DWord(@GetDecodeSmallFuncSize) - DWord(@DecodeSmall);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Return SDK version, and codec version ..

Function  GetCodecVersion(pdwSDKVersion : PDWord) : DWord; StdCall;
Begin
  pdwSDKVersion^ := PEC2_CODEC_SDK_VERSION;
  Result := CodecVersion;
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Return Codec name as unicode string in buffer ..

Function  GetCodecName(pwszBuffer : PWideChar; dwBufSize : DWord) : DWord; StdCall;
Begin
  Result := StrToWideBuffer(CodecName + #0, pwszBuffer, dwBufSize);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Return Codec author as unicode string in buffer ..

Function  GetCodecAuthor(pwszBuffer : PWideChar; dwBufSize : DWord) : DWord; StdCall;
Begin
  Result := StrToWideBuffer(CodecAuthor + #0, pwszBuffer, dwBufSize);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Return pointer to any supported codec functions ..

Function  CodecGetProcAddress(dwCodecIndex : DWORD; pszApi : LPCSTR) : FARPROC; StdCall;
Var
  Api : String;
Begin
  Result := Nil;
  Api := Lowercase(pszApi);

  // Required ..
  If (Api = 'decodesmall') Then Result := @DecodeSmall
  Else
  If (Api = 'getdecodesmallfuncsize') Then Result := @GetDecodeSmallFuncSize
  Else
  If (Api = 'encode') Then Result := @Encode
  Else
  If (Api = 'getcodecversion') Then Result := @GetCodecVersion
  Else
  If (Api = 'getcodecauthor') Then Result := @GetCodecAuthor
  Else
  If (Api = 'getcodecname') Then Result := @GetCodecName
  Else
  // Optional ..
  If (Api = 'decodefast') Then Result := Nil //@DecodeFast
  Else
  If (Api = 'getdecodefastfuncsize') Then Result := Nil //@GetDecodeFastFuncSize
  Else
  If (Api = 'encodeex') Then Result := Nil //@EncodeEx
  Else
  If (Api = 'getmaximumencodinglevel') Then Result := Nil //@GetMaximumEncodingLevel;
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Return number of codecs in this DLL ..

Function  GetNumberOfCodecs : DWORD; StdCall;
Begin
  Result := 1;
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------

Exports
  CodecGetProcAddress,
  GetNumberOfCodecs;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------

End.
