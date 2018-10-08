//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//
//  PEC2 Codec DLL
//  By BoB -> Team PEiD
//  http://PEiD.info/BobSoft/
//
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//
//  Nrv2e LE32 Compression ..  Part of Ucl 1.03 by Markus Oberhumer (http://www.oberhumer.com)
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

Library pec2codec_nrv2e;

Uses
  Windows,
  PEC2CodecSDK;


{$Imagebase $02100000}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Codec interface constants ..

Const
  CodecName    = 'Nrv2e LE32 Compression Codec';
  CodecAuthor  = 'Codec by BoB -> Team PEiD' + #13 + 'Compressor by Markus Oberhumer';
  VersionMajor = 1;
  VersionMinor = 0;
  CodecVersion = (VersionMajor * 100) + VersionMinor;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Codec constants ..

Const
  UCL_VERSION_CONST = $010300;

  UCL_E_OK = 0;
  UCL_E_ERROR = -1;
  UCL_E_INVALID_ARGUMENT = -2;
  UCL_E_OUT_OF_MEMORY = -3;

  UCL_E_NOT_COMPRESSIBLE = -101;

  UCL_E_INPUT_OVERRUN = -201;
  UCL_E_OUTPUT_OVERRUN = -202;
  UCL_E_LOOKBEHIND_OVERRUN = -203;
  UCL_E_EOF_NOT_FOUND = -204;
  UCL_E_INPUT_NOT_CONSUMED = -205;
  UCL_E_OVERLAP_OVERRUN = -206;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------

Type
  Ucl_CallBack_User_Data = Record
    UnpackedSize : DWord;
    Pec2CallBack : Function (dwAction, dwParam1, dwParam2, dwParam3 : DWord) : Bool; StdCall;
  End;
  P_Ucl_CallBack_User_Data = ^Ucl_CallBack_User_Data;

  ucl_progress_callback_p = ^ucl_progress_callback_t;
  ucl_progress_callback_t = Record
    Callback: Procedure(TextSize: Cardinal; CodeSize: Cardinal; State: Integer; User: Pointer);
    User: P_Ucl_CallBack_User_Data;
  End;

  ucl_compress_config_p = ^ucl_compress_config_t;

  ucl_compress_config_t = Record
    bb_endian: Integer;
    bb_size: Integer;
    max_offset: Cardinal;
    max_match: Cardinal;
    s_level: Integer;
    h_level: Integer;
    p_level: Integer;
    c_flags: Integer;
    m_size: Cardinal;
  End;


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
// Ucl callback to call PEC2 callback ..

Procedure UclCompressionCallback(TextSize: Cardinal; CodeSize: Cardinal; State: Integer; User: Pointer);
Begin
  If (CodeSize = 0) Or (State = -1) Or (User = Nil) Or (@P_Ucl_CallBack_User_Data(User)^.Pec2CallBack = Nil) Then Exit;

  P_Ucl_CallBack_User_Data(User)^.Pec2CallBack(PEC2_CODEC_ACTION_ENCODE, TextSize, TextSize, P_Ucl_CallBack_User_Data(User)^.UnpackedSize);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Return maximum compressed size, even with uncompressable data ..

Function  ucl_output_block_size(Const input_block_size: Cardinal): Cardinal;
Begin
  Result := input_block_size + input_block_size; // div 8 + 256;
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------

Function  _malloc(const Size: Cardinal): Pointer; cdecl;
Begin
  System.GetMem(Result, Size);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------

Procedure _free(const p: Pointer); cdecl;
Begin
  System.FreeMem(p);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------

Function  _memcpy(Dest: Pointer; const Src: Pointer; n: Cardinal): Pointer; cdecl;
Begin
  Result := Dest;
  Move(Src^, Result^, n);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------

Function  _memset(const Source: Pointer; const Value: Integer; const Count: Cardinal): Pointer; cdecl;
Begin
  Result := Source;
  FillChar(Result^, Count, Value);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Externals ..

{$L Ucl\UCL_init.obj}
{$L Ucl\UCL_ptr.obj}
{$L Ucl\UCL_util.obj}
{$L Ucl\n2e_99.obj}
{$L Ucl\alloc.obj}

Function  __ucl_init2(v: Cardinal; s1, s2, s3, s4, s5, s6, s7, s8, s9: Integer): Integer; External;
Function  ucl_version: Cardinal; External;
Function  ucl_version_string: PAnsiChar; External;
Function  ucl_version_date: PAnsiChar; External;
Function  ucl_nrv2e_99_compress(Const in_: Pointer; in_len: Cardinal; out_: Pointer; Var out_len: Cardinal; cb: ucl_progress_callback_p; Level: Integer; Const conf: ucl_compress_config_p; Result: PCardinal): Integer; External;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------

Function  ucl_init: Integer;
Begin
  Result := __ucl_init2(
    UCL_VERSION_CONST,
    SizeOf(SmallInt),
    SizeOf(Integer),
    SizeOf(Integer),
    SizeOf(Cardinal),
    SizeOf(Cardinal),
    -1,
    SizeOf(PAnsiChar),
    SizeOf(Pointer),
    4);
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Encoder ..

Function  Encode(lpvSource : Pointer; dwSourceSize : DWord; lpvDest : Pointer; pdwDestSize : PDWord; dwLevel : DWord; pCallback : PFNCodecCallback) : DWord; StdCall;
Var
  Len : DWord;
  CB : Ucl_Progress_CallBack_T;
  Conf : ucl_compress_config_t;
Begin
  // Ensure enough buffer space ..
  Result := ucl_output_block_size(dwSourceSize);
  If (pdwDestSize^ < Result) Then Begin
    pdwDestSize^ := Result;
    Result := PEC2_CODEC_ERROR_INSUFFICIENT_BUFFER;
    Exit;
  End;

  New(CB.User);
  Try
    // Init callback ..
    CB.Callback := UclCompressionCallback;
    CB.User^.UnpackedSize := dwSourceSize;
    CB.User^.Pec2CallBack := pCallback;

    // Init Compressor ..
    FillChar(Conf, SizeOf(ucl_compress_config_t), $FF);
    Conf.bb_endian  := 0;
    Conf.max_offset := $FFFFFFFF;
    Conf.bb_size    := 32;
    Ucl_Init;

    // Ensure mode is 1 -> 10 ..
    If (dwLevel > 9) Then dwLevel := 10
    Else Inc(dwLevel);

    // optimize compression params ..
    If (dwLevel <= 3) And (Conf.max_offset = DWord(-1)) Then Conf.max_offset := 8*1024-1
    Else
    If (dwLevel = 4) And (Conf.max_offset = DWord(-1)) Then Conf.max_offset := 32*1024-1;

    Result := ucl_nrv2e_99_compress(lpvSource, dwSourceSize, lpvDest, Len, @CB, dwLevel, @Conf, Nil);

    pCallBack(PEC2_CODEC_ACTION_DONE, dwSourceSize, Len, 0);
    If (Result = UCL_E_OK) Then Begin
      pdwDestSize^ := Len;
      Result := Len;
    End Else
      Result := PEC2_CODEC_ERROR_UNSPECIFIED;

  Finally
    // Ensure no memory leak even if exception ..
    Dispose(CB.User);
  End;
End;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
// Small Decoder ..

Function  DecodeSmall(lpvSource, lpvDest, lpExtraData : Pointer) : DWord; StdCall;
Asm
  // -> EBP = Stack frame ..  This is added by Delphi automatically around code that uses params ..
  // <- EAX = Decoded size ..

@Unpack_Nrv2e: // (Dest, Source)
        PushAD
        Mov     ESI, [lpvSource]
        Mov     EDI, [lpvDest]
        Or      EBP, byte -1
        Xor     ECX, ECX
        CLD
        STC
        Call    @GetByte_n2e
        jmp     @dcl2_n2e

@decompr_literals_n2e:
        movsb
@decompr_loop_n2e:
        call	  @GetBit_n2e
@dcl2_n2e:
        jc      @decompr_literals_n2e
        xor     eax, eax
        inc     eax
@loop1_n2e:
        call    @GetBit_n2e
        adc     eax, eax
        call    @GetBit_n2e
        jc      @loopend1_n2e
        dec     eax
        call    @GetBit_n2e
        adc     eax, eax
        jmp     @loop1_n2e

@decompr_mlen1_n2e:
        call	  @GetBit_n2e
        adc     ecx, ecx
        jmp     @decompr_got_mlen_n2e

@loopend1_n2e:
        xor     ecx, ecx
        sub     eax, 3
        jb      @decompr_prev_dist_n2e
        shl     eax, 8
        Lodsb
        xor     eax, byte -1
        jz      @decompr_end_n2e
        sar     eax, 1                  // shift low-bit into carry
        mov     ebp, eax
        jmp     @decompr_ebpeax_n2e

@decompr_prev_dist_n2e:
        call	  @GetBit_n2e
@decompr_ebpeax_n2e:
        jc      @decompr_mlen1_n2e
        inc     ecx
        call	  @GetBit_n2e
        jc      @decompr_mlen1_n2e
@loop2_n2e:
        call	  @GetBit_n2e
        adc     ecx, ecx
        call	  @GetBit_n2e
        jnc     @loop2_n2e
        inc     ecx
        inc     ecx
@decompr_got_mlen_n2e:
        cmp     ebp, -$500
        adc     ecx, 2
        push    esi
        lea     esi, [edi + ebp]
        rep     movsb
        pop     esi
        jmp     @decompr_loop_n2e

@GetBit_n2e:
        add     ebx, ebx
        jnz     @GotBit32
@GetByte_n2e:
        mov     ebx, [esi]
        Sub     esi, -4
        adc     ebx, ebx
@GotBit32:
        ret

@decompr_end_n2e:
        Mov     [ESP + $1C], EDI                                      // Set EAX in pushed registers block to end position ..
        PopAD
        Sub     EAX, [lpvDest]                                        // EAX = Unpacked size ..
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
