
#ifdef PEC2CODEC_EXPORTS
#define PEC2CODEC_API __declspec(dllexport)
#else
#define PEC2CODEC_API __declspec(dllimport)
#endif

extern "C"
{
	PEC2CODEC_API FARPROC WINAPI CodecGetProcAddress(DWORD dwCodecIndex, LPCTSTR ptszApiName);
	PEC2CODEC_API DWORD WINAPI GetNumberOfCodecs();
};
