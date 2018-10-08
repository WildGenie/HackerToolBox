////////////////////////////////////////////////////////////////////////////////////////////
//
// This source file handles the CODEC HOST (which can host any number of CODECs withink it)
// interface. It has two functions used to determine the number of CODECs, and to get entry
// points to specific CODEC based on their index number.
//
// There are two functions exposed by the CODEC host:
//
//    GetNumberOfCodecs		- retrieves number of CODECs in this host
//	  CodecGetProcAddress   - retrieve the entry point for a specific CODEC API.
//
//
//	PEC2CODEC_HOST_API FARPROC WINAPI CodecGetProcAddress(DWORD dwCodecIndex, LPCTSTR ptszApiName);
//	PEC2CODEC_HOST_API DWORD WINAPI GetNumberOfCodecs();
//
//
//  ****************************************************************************
//	See PEC2CODEC_INV source code for full C++ example CODEC using EncodeEx.
//	In contrast, this CODEC is template part x86 asm and only supplies Encode.
//  ****************************************************************************
//
#include "stdafx.h"
#include "..\pec2codecsdk.h"
#include "pec2codec_template.h"
#include "Codec_0_EntryPoints.h"

PEC2CODEC_TEMPLATE_API DWORD WINAPI GetNumberOfCodecs()
{
	return PEC2_CODECS_IN_HOST;
}


///////////////////////////////////////////////
//
// Names of entry points for each CODEC.
//
// names must be lowercase for comparison.
//
TCHAR *ptszApiNames[]=
{
	_T("decodefast"),
	_T("decodesmall"),
	_T("getdecodesmallfuncsize"),
	_T("getdecodefastfuncsize"),
	_T("encode"),
	_T("getcodecauthor"),
	_T("getcodecname"),
	_T("getcodecversion"),
	NULL
};

//
// entry points for CODEC index #0
//
FARPROC Codec_0_pApiAddress[]=
{
	(FARPROC)NULL,						// DecodeFast not supplied.
	(FARPROC)&Decode_Small,
	(FARPROC)&GetDecodeSmallFuncSize,
	(FARPROC)NULL,						// GetDecodeFastFuncSize not supplied since DecodeFast isn't
	(FARPROC)&Encode,
	(FARPROC)&GetCodecAuthor,
	(FARPROC)&GetCodecName,
	(FARPROC)&GetCodecVersion
};

//
// more arrary entry point are needed for additional CODEC(s)
//

PEC2CODEC_TEMPLATE_API FARPROC WINAPI CodecGetProcAddress(DWORD dwCodecIndex, LPCTSTR ptszApiName)
{
	TCHAR *ptszCompare=new TCHAR[_tcslen(ptszApiName)+1];
	_tcscpy(ptszCompare,ptszApiName);
	_tcslwr(ptszCompare);
	for(int nN=0;ptszApiNames[nN];nN++)
	{
		if(_tcscmp(ptszCompare,ptszApiNames[nN])==0)
		{
			switch(dwCodecIndex)
			{
			case 0:	// CDODEC index #0
				return Codec_0_pApiAddress[nN];
			//case 1:  // CODEC index #1
				//return Codec_1_pApiAddress[nN];
			default:
				return NULL;		// unknown index number, return NULL
			}
		}
	}
	return NULL;		
}

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
	case DLL_THREAD_ATTACH:
	case DLL_THREAD_DETACH:
	case DLL_PROCESS_DETACH:
		break;
	}
    return TRUE;
}

