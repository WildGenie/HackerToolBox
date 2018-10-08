#include "stdafx.h"
#include "pec2codec_template.h"
#include "..\pec2codecsdk.h"
#include "Codec_0_EntryPoints.h"

/////////////////////////////////////////////////////////////////////////////////////
//
// GetCodecName
//
// Return the wide-characte rname of this CODEC.
//
//

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

#define CODEC_VERSION_MAJOR 1
#define CODEC_VERSION_MINOR 0
#define CODEC_VERSION (CODEC_VERSION_MAJOR*100)+CODEC_VERSION_MINOR

DWORD WINAPI GetCodecVersion(PDWORD pdwSDKVersion)
{
	if(pdwSDKVersion)
	{
		*pdwSDKVersion=PEC2_CODEC_SDK_VERSION;
	}
	return CODEC_VERSION;
}

/////////////////////////////////////////////////////////////////////////////////////
//
//  Encode function
//
//  This codec simply copies the data from the source to the destination
//  and appends a flag. It actually expands the data, which is a perfectly
//  legal result no matter what the expansion size is. Of course, a compression
//  function would return a buffer smaller than the original (provided compression
//  succeeds).
//

DWORD WINAPI Encode(LPVOID lpvSource, DWORD dwLength, LPVOID lpvDest, 
						   DWORD *pdwDestSize, DWORD dwLevel, PFNCodecCallback Callback)
{

	int nR=0;
	PCODEC_0_HEADER pBlockHeader=(PCODEC_0_HEADER)lpvDest;
	
	//
	// make sure destination buffer is big enough to handle our header
	// expansion of the source data. If not, return PEC2_CODEC_ERROR_INSUFFICIENT_BUFFER
	// so that the caller will allocate more and reinvoke.
	//
	if(*pdwDestSize<(dwLength+sizeof(CODEC_0_HEADER)))
	{
		*pdwDestSize=dwLength+sizeof(CODEC_0_HEADER);
		return PEC2_CODEC_ERROR_INSUFFICIENT_BUFFER;
	}
	
	//
	// write CODEC unique signature to destination buffer
	//  = for a quick runtime test of the buffer at Decode.
	//

	pBlockHeader->dwDecodedSize=dwLength;
	pBlockHeader->dwSignature=CODEC_0_SIGNATURE;
	
	//
	// copy source data to destination buffer
	//
	memcpy(++pBlockHeader,lpvSource,dwLength);
	
	nR=dwLength+sizeof(CODEC_0_HEADER);

	return nR;
}

