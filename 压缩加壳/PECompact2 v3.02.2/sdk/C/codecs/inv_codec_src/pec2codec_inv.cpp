#include "stdafx.h"
#include "pec2codec_inv.h"
#include "..\pec2codecsdk.h"

#define CODEC_NAME L"Switch Code Endianness"
#define CODEC_AUTHOR L"Bitsum Technologies"

#define CODEC_VERSION_MAJOR 1
#define CODEC_VERSION_MINOR 0
#define CODEC_VERSION (CODEC_VERSION_MAJOR*100)+CODEC_VERSION_MINOR

PEC2CODEC_API DWORD WINAPI GetNumberOfCodecs()
{
	return 1;
}

#define ENDIAN_SWITCH(nLongNumber) ((((nLongNumber&0x000000FF)<<24)+((nLongNumber&0x0000FF00)<<8)+((nLongNumber&0x00FF0000)>>8)+((nLongNumber&0xFF000000)>>24)));

DWORD WINAPI EncodeEx(LPVOID lpvSource, DWORD dwLength, LPVOID lpvDest, 
						   DWORD *pdwDestSize, DWORD dwFlags, DWORD dwLevel, FARPROC Callback)
{
	int nR=0;
	
	if(*pdwDestSize<(dwLength+sizeof(DWORD)))
	{
		*pdwDestSize=dwLength+sizeof(DWORD);
		return PEC2_CODEC_ERROR_INSUFFICIENT_BUFFER;
	}

	DWORD *pdwD=(DWORD *)lpvDest;
	*pdwD=dwLength;
	pdwD++;			

	if(dwFlags&PEC2_CONTENT_CODE)
	{
		DWORD *pdwS=(DWORD *)lpvSource;
		int nI;
		for(nI=0;nI<(dwLength-3);nI+=4)
		{
			DWORD dw=*pdwS;			
			*pdwD=ENDIAN_SWITCH(dw);
			pdwS++;pdwD++;			
		}
		if(nI<dwLength)
		{
			unsigned char *pS=(unsigned char *)pdwS;			
			unsigned char *pD=(unsigned char *)pdwD;
			for(;nI<dwLength;nI++) 
			{
				*pD=*pS;
				pS++;pD++;
			}
		}
	}
	else
	{			
		memcpy(pdwD,lpvSource,dwLength);	
	}
	return dwLength+sizeof(DWORD);
}

DWORD WINAPI GetCodecName(PWCHAR pwszName, DWORD dwBufSize)
{
	if(dwBufSize<=wcslen(CODEC_NAME))
	{
		if(pwszName)
		{
			*pwszName=NULL;
		}				
		return wcslen(CODEC_NAME)+1;
	}
	else if(!dwBufSize)
	{
		return wcslen(CODEC_NAME)+1;
	}
	wcscpy(pwszName,CODEC_NAME);
	return wcslen(pwszName);
}


DWORD WINAPI GetCodecAuthor(PWCHAR pwszAuthor, DWORD dwBufSize)
{
	if(dwBufSize<=wcslen(CODEC_AUTHOR))
	{
		if(pwszAuthor)
		{
			*pwszAuthor=NULL;
		}				
		return wcslen(CODEC_AUTHOR)+1;
	}
	else if(!dwBufSize)
	{
		return wcslen(CODEC_AUTHOR)+1;
	}
	wcscpy(pwszAuthor,CODEC_AUTHOR);
	return wcslen(pwszAuthor);
}
DWORD WINAPI GetCodecVersion(PDWORD pdwSDKVersion)
{
	if(pdwSDKVersion)
	{
		*pdwSDKVersion=PEC2_CODEC_SDK_VERSION;
	}
	return CODEC_VERSION;
}

DWORD WINAPI Decode_Small(LPVOID lpvSource, LPVOID lpvDest, PEC2_DECODE_EXTRA *pExtra)
{	
	int nI;
	DWORD *pdwS=(DWORD *)lpvSource;
	DWORD *pdwD=(DWORD *)lpvDest;
	unsigned char *pS;
	unsigned char *pD;
	DWORD dwSize=*pdwS;
	pdwS++;
	for(nI=0;nI<(dwSize-3);nI+=4)
	{
		*pdwD=ENDIAN_SWITCH(*pdwS);
		pdwS++;pdwD++;
	}
	pS=(unsigned char *)pdwS;
	pD=(unsigned char *)pdwD;
	for(;nI<dwSize;nI++)
	{		
		*pD=*pS;
		pD++;pS++;
	}
	return dwSize;
}

DWORD WINAPI GetDecodeSmallFuncSize()
{	
	unsigned char *pStart=(unsigned char *)&Decode_Small;
	unsigned char *pEnd=(unsigned char *)&GetDecodeSmallFuncSize;	
	return (pEnd-pStart);
}
//
// names must be lowercase for compare
//
TCHAR *ptszApiNames[]=
{
	_T("decodefast"),
	_T("decodesmall"),
	_T("getdecodesmallfuncsize"),
	_T("getdecodefastfuncsize"),
	_T("encodeex"),
	_T("getcodecauthor"),
	_T("getcodecname"),
	_T("getcodecversion"),
	NULL
};

FARPROC pApiAddress[]=
{
	(FARPROC)NULL,			// DecodeFast not supplied
	(FARPROC)&Decode_Small,
	(FARPROC)&GetDecodeSmallFuncSize,
	(FARPROC)NULL,			// GetDecodeFastFuncSize not supplied since DecodeFast isn't
	(FARPROC)&EncodeEx,
	(FARPROC)&GetCodecAuthor,
	(FARPROC)&GetCodecName,
	(FARPROC)&GetCodecVersion
};


PEC2CODEC_API FARPROC WINAPI CodecGetProcAddress(DWORD dwCodecIndex, LPCTSTR ptszApiName)
{
	//
	// since only one codec in this codec host, ignore index..
	//
	TCHAR *ptszCompare=new TCHAR[_tcslen(ptszApiName)+1];
	_tcscpy(ptszCompare,ptszApiName);
	_tcslwr(ptszCompare);
	for(int nN=0;ptszApiNames[nN];nN++)
	{
		if(_tcscmp(ptszCompare,ptszApiNames[nN])==0)
		{
			return pApiAddress[nN];
		}
	}
	return NULL;		
}