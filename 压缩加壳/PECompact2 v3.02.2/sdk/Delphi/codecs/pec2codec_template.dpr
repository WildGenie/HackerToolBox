//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//
//  PEC2 Codec DLL Template
//  By BoB -> Team PEiD
//  http://PEiD.info/BobSoft/
//
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//
//  Very simple example codec, encodes data using XOR ..
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

Library pec2codec_template;

Uses
  Windows,
  PEC2CodecSDK;


{$Imagebase $20000000}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Codec constants ..

Const
  CodecName    = 'Codec Template';
  CodecAuthor  = 'Unknown';
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
  Src, Dst : PDWord;
  I : DWord;
Begin
  // Ensure enough buffer space for 2 extra DWords ..  If buffer too small, then the function will be called again once the buffer has been resized ..
  Result := dwSourceSize + 8;
  If (pdwDestSize^ < Result) Then Begin
    pdwDestSize^ := Result;
    Result := PEC2_CODEC_ERROR_INSUFFICIENT_BUFFER;
    Exit;
  End;

  // Init ..
  Src := lpvSource;
  Dst := lpvDest;

  // Put original size before encoded data ..
  Dst^ := dwSourceSize;
  Inc(Dst);

  // Put DWord value to encode following data with ..
  Dst^ := $B0B1560d;
  Inc(Dst);

  // Encode the data ..
  I := 0;
  While (I < dwSourceSize) Do Begin
    pCallBack(PEC2_CODEC_ACTION_ENCODE, I, I + 4, dwSourceSize);

    Dst^ := Src^ Xor $B0B1560d;
    Inc(Src);
    Inc(Dst);
    Inc(I, 4);
  End;
  pCallBack(PEC2_CODEC_ACTION_DONE, dwSourceSize, Result, 0);
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
  // Decode the data ..
  //

  Mov     ESI, [lpvSource]                                 // EBP+ is added by compiler for all params ..  If you change EBP, then access params with ESP+32+4+4+?? ..
  Mov     EDI, [lpvDest]
  LodsD                                                    // Read DWord size ..
  Mov     ECX, EAX                                         // ECX = Size ..
  Push    EAX                                              // Store size for result ..
  LodsD                                                    // Read DWord encryption key ..
  Mov     EDX, EAX                                         // EDX = Key ..

  Shr     ECX, 2                                           // ECX = ECX / 4 ..
@Loop:
  LodsD                                                    // Read DWord ..
  Xor     EAX, EDX                                         // Decode ..
  StosD                                                    // Write DWord ..
  Loop    @Loop


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
