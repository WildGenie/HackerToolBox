
#define CODEC_NAME L"CODEC Template"
#define CODEC_AUTHOR L"Bitsum Technologies"

#define CODEC_0_SIGNATURE 'COD0'

typedef struct _CODEC_0_HEADER 
{
	DWORD dwSignature;
	DWORD dwDecodedSize;
} CODEC_0_HEADER, *PCODEC_0_HEADER;

extern "C" DWORD WINAPI Decode_Small(LPVOID lpvSource, LPVOID lpvDest, LPVOID lpEtraData);
extern "C" DWORD WINAPI GetDecodeSmallFuncSize();
//DWORD WINAPI DecodeFast(LPVOID lpvSource, LPVOID lpvDest, LPVOID lpEtraData);
DWORD WINAPI Encode(LPVOID lpvSOurce, DWORD dwSourceSize, LPVOID lpvDest, DWORD *pdwDestSize, DWORD dwLevel, PFNCodecCallback pCallback);
DWORD WINAPI GetCodecAuthor(WCHAR *pwszBuffer, DWORD dwBufSize);
DWORD WINAPI GetCodecName(WCHAR *pwszBuffer, DWORD dwBufSize);
DWORD WINAPI GetCodecVersion(DWORD *pdwSDKVersion);
// DWORD WINAPI GetDecodeFastFuncSize();