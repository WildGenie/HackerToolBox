////////////////////////////////////////////////////////////////////////////////////////////
//
// Configuraiton
//
#define PEC2_CODECS_IN_HOST 1		// # of CODECS this host contains (identified via index #)

////////////////////////////////////////////////////////////////////////////////////////////
//
// There are two functions exposed by the CODEC host:
//
//    GetNumberOfCodecs		- retrieves number of CODECs in this host
//	  CodecGetProcAddress   - retrieve the entry point for a specific CODEC API.
//
//

#ifdef PEC2CODEC_HOST_EXPORTS
#define PEC2CODEC_HOST_API __declspec(dllexport)
#else
#define PEC2CODEC_HOST_API __declspec(dllimport)
#endif

#define PEC2CODEC_TEMPLATE_API PEC2CODEC_HOST_API

extern "C"
{
	PEC2CODEC_HOST_API FARPROC WINAPI CodecGetProcAddress(DWORD dwCodecIndex, LPCTSTR ptszApiName);
	PEC2CODEC_HOST_API DWORD WINAPI GetNumberOfCodecs();
};

