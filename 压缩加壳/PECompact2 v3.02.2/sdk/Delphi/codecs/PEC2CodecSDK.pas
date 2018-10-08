(*
 * PECompact v2 CODEC SDK
 *
 * Pascal translation of "PEC2CodecSDK.h" C/C++ include file
 *
 * Copyright (c) 2009 by Jeremy Collake and Bitsum Technologies
 * All Rights Reserved
 *
 * http://www.bitsum.com/
 *)

Unit PEC2CodecSDK;

Interface

Uses
  Windows;

  
 (*
  * define flags and codes
  *)

Const
  PEC2_CODEC_ACTION_DONE                = 0;
  PEC2_CODEC_ACTION_ENCODE              = 1;
  PEC2_CODEC_ACTION_ERROR               = DWord(-1);
  PEC2_CODEC_ACTION_USER_DEFINED        = 10;

  PEC2_CODEC_ERROR_UNSPECIFIED          = DWord(-1);
  PEC2_CODEC_ERROR_INSUFFICIENT_BUFFER  = DWord(-2);
  PEC2_CODEC_ERROR_ABORTED              = DWord(-3);

  PEC2_CONTENT_MISMATCH                 = DWord(-4);

  PEC2_CONTENT_CODE                     = (1);
  PEC2_CONTENT_DATA                     = (1 Shl 1);
  PEC2_CONTENT_RESOURCES                = (1 Shl 2);
  PEC2_CONTENT_ENTIRE_PE_IMAGE          = (1 Shl 3);
  PEC2_CONTENT_LOADER                   = (1 Shl 4);
  PEC2_CONTENT_TEXTONLY                 = (1 Shl 5);

 (*
  * define this SDK version
  *)

  PEC2_CODEC_SDK_VERSION_MAJOR = 1;
  PEC2_CODEC_SDK_VERSION_MINOR = 00;
  PEC2_CODEC_SDK_VERSION       = ((PEC2_CODEC_SDK_VERSION_MAJOR*100) + PEC2_CODEC_SDK_VERSION_MINOR);


 (*
  * codec host module pointer types
  *)

Type
  PFNCodecGetProcAddress = Function  (dwCodecIndex : DWORD; pszApi : LPCSTR) : FARPROC; StdCall;
  PFNGetNumberOfCodecs   = Function  : DWORD; StdCall;

  PFNDecoderLoadLibraryA   = Function  (pszModule : LPCSTR) : HMODULE; StdCall;
  PFNDecoderGetProcAddress = Function  (hMod : HMODULE; pszApi : LPCSTR) : FARPROC; StdCall;

  PFNVirtualAlloc = Function  (lpAddress : Pointer; dwSize, flAllocationType, flProtect : DWord) : Pointer; StdCall;
  PFNVirtualFree  = Function  (lpAddress : Pointer; dwSize, dwFreeType : DWord) : BOOL; StdCall;

  PEC2_DECODE_EXTRA = Record
    pLoadLibraryA   : PFNDecoderLoadLibraryA;      (* pointer to LoadLibraryA *)
    pGetProcAddress : PFNDecoderGetProcAddress;    (* pointer to GetProcAddress *)
  End;
  PPEC2_DECODE_EXTRA = ^PEC2_DECODE_EXTRA;

  PEC2_DECODE_EXTRA_EX = Record
    pecExtra : PEC2_DECODE_EXTRA;
    pVirtualAlloc : PFNVirtualAlloc;
    pVirtualFree  : PFNVirtualFree;
  End;
  PPEC2_DECODE_EXTRA_EX = ^PEC2_DECODE_EXTRA_EX;


 (*
  * codec callback function pointer type(s)
  *)

  PFNCodecCallback = Function  (dwAction, dwParam1, dwParam2, dwParam3 : DWord) : Bool; StdCall;


 (*
  * codec function pointer types
  *)

  PFNDecodeSmall = Function  (lpvSource, lpvDest, lpExtraData : Pointer) : DWord; StdCall;
  PFNDecodeFast  = Function  (lpvSource, lpvDest, lpExtraData : Pointer) : DWord; StdCall;

  PFNGetDecodeSmallFuncSize = Function  : DWord; StdCall;
  PFNGetDecodeFastFuncSize  = Function  : DWord; StdCall;

  PFNEncode   = Function  (lpvSource : Pointer; dwSourceSize : DWord; lpvDest : Pointer;
                           pdwDestSize : PDWord; dwLevel : DWord; pCallback : PFNCodecCallback) : DWord; StdCall;
  // v2.65+
  PFNEncodeEx = Function  (lpvSource : Pointer; dwSourceSize : DWord; lpvDest : Pointer;
									         pdwDestSize : PDWord; dwFlags, dwLevel : DWord; pCallback : PFNCodecCallback) : DWord; StdCall;

  PFNGetCodecVersion = Function  (pdwSDKVersion : PDWord) : DWord; StdCall;
  PFNGetCodecName    = Function  (pwszBuffer : PWideChar; dwBufSize : DWord) : DWord; StdCall;
  PFNGetCodecAuthor  = Function  (pwszBuffer : PWideChar; dwBufSize : DWord) : DWord; StdCall;

  PFNGetMaximumEncodingLevel = Function  : DWord; StdCall;


Implementation
End.
