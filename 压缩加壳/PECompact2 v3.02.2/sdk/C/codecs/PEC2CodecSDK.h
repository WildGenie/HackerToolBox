/*
 * PECompact v2 CODEC SDK
 *
 * C/C++ include file
 *
 * Copyright (c) 2004 by Jeremy Collake and Bitsum Technologies
 * All Rights Reserved
 *
 * http://www.bitsum.com/
 */

#ifndef PEC2CODECSDK_H_INCLUDED
#define PEC2CODECSDK_H_INCLUDED

#include <windows.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * define flags and codes
 */ 
#define PEC2_CODEC_ACTION_DONE 0
#define PEC2_CODEC_ACTION_ENCODE 1
#define PEC2_CODEC_ACTION_ERROR (-1)
#define PEC2_CODEC_ACTION_USER_DEFINED 10

#define PEC2_CODEC_ERROR_UNSPECIFIED (-1)
#define PEC2_CODEC_ERROR_INSUFFICIENT_BUFFER (-2)
#define PEC2_CODEC_ERROR_ABORTED (-3)

#define PEC2_CONTENT_MISMATCH (-4)

#define PEC2_CONTENT_CODE (1)
#define PEC2_CONTENT_DATA (1<<1)
#define PEC2_CONTENT_RESOURCES (1<<2)
#define PEC2_CONTENT_ENTIRE_PE_IMAGE (1<<3)
#define PEC2_CONTENT_LOADER (1<<4)
#define PEC2_CONTENT_TEXTONLY (1<<5)

/*
 * define this SDK version
 */
#define PEC2_CODEC_SDK_VERSION_MAJOR 1
#define PEC2_CODEC_SDK_VERSION_MINOR 00
#define PEC2_CODEC_SDK_VERSION ((PEC2_CODEC_SDK_VERSION_MAJOR*100)+PEC2_CODEC_SDK_VERSION_MINOR)

/*
 * codec host module pointer types
 */
typedef FARPROC (WINAPI *PFNCodecGetProcAddress)(DWORD dwCodecIndex, LPCSTR pszApi);
typedef DWORD (WINAPI *PFNGetNumberOfCodecs)();

typedef HMODULE (WINAPI *PFNDecoderLoadLibraryA)(LPCSTR pszModule);
typedef FARPROC (WINAPI *PFNDecoderGetProcAddress)(HMODULE hMod, LPCSTR pszApi);

typedef LPVOID (WINAPI *PFNVirtualAlloc)(LPVOID lpAddress,SIZE_T dwSize,DWORD flAllocationType, DWORD flProtect);
typedef BOOL (WINAPI *PFNVirtualFree)( LPVOID lpAddress,SIZE_T dwSize,DWORD dwFreeType);

typedef struct _PEC2_DECODE_EXTRA
{
   PFNDecoderLoadLibraryA pLoadLibraryA;      /* pointer to LoadLibraryA */
   PFNDecoderGetProcAddress pGetProcAddress;    /* pointer to GetProcAddress */
} PEC2_DECODE_EXTRA, *PPEC2_DECODE_EXTRA;

typedef struct _PEC2_DECODE_EXTRA_EX
{
   PEC2_DECODE_EXTRA pecExtra;
   //PFNDecoderLoadLibraryA pLoadLibraryA;      /* pointer to LoadLibraryA */
   //PFNDecoderGetProcAddress pGetProcAddress;    /* pointer to GetProcAddress */
   PFNVirtualAlloc pVirtualAlloc;
   PFNVirtualFree pVirtualFree;
} PEC2_DECODE_EXTRA_EX, *PPEC2_DECODE_EXTRA_EX;

/*
 * codec callback function pointer type(s)
 */
typedef BOOL (WINAPI *PFNCodecCallback)(DWORD dwAction, DWORD dwParam1, DWORD dwParam2, DWORD dwParam3);

/*
 * codec function pointer types
 */
typedef DWORD (WINAPI *PFNDecodeSmall)(LPVOID lpvSource, LPVOID lpvDest, LPVOID lpExtraData);
typedef DWORD (WINAPI *PFNDecodeFast)(LPVOID lpvSource, LPVOID lpvDest, LPVOID lpExtraData);
typedef DWORD (WINAPI *PFNGetDecodeSmallFuncSize)();
typedef DWORD (WINAPI *PFNGetDecodeFastFuncSize)();
typedef DWORD (WINAPI *PFNEncode)(LPVOID lpvSource, DWORD dwSourceSize, LPVOID lpvDest,
									DWORD *pdwDestSize, DWORD dwLevel, PFNCodecCallback pCallback);
//v2.65+
typedef DWORD (WINAPI *PFNEncodeEx)(LPVOID lpvSource, DWORD dwSourceSize, LPVOID lpvDest,
									DWORD *pdwDestSize, DWORD dwFlags, DWORD dwLevel, 
									PFNCodecCallback pCallback);

typedef DWORD (WINAPI *PFNGetCodecVersion)(DWORD *pdwSDKVersion);
typedef DWORD (WINAPI *PFNGetCodecName)(WCHAR *pwszBuffer, DWORD dwBufSize);
typedef DWORD (WINAPI *PFNGetCodecAuthor)(WCHAR *pwszBuffer, DWORD dwBufSize);
typedef DWORD (WINAPI *PFNGetMaximumEncodingLevel)();

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* PEC2CODECSDK_H_INCLUDED */
