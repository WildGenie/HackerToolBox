#pragma once

#define XSHELL32_GV_HBASE			0
#define XSHELL32_GV_LPDATAS			1
#define XSHELL32_GV_SHELLBASE		2
#define XSHELL32_GV_DYNORMAL		3
#define XSHELL32_GV_DYNORENC		4

#pragma pack(1)

typedef struct _SDECODESEC
{
	char*	m_lpBuf;
	size_t	m_szBuf;
}SDECODESEC,*PSDECODESEC;

typedef struct _CODEMARKINFO
{
	char*	m_lpCode;
	int		m_szCode;
	int		m_SDKFlag;
	char*	m_nStart;
}CODEMARKINFO,*PCODEMARKINFO;

#pragma pack()

PIMAGE_NT_HEADERS		__stdcall	ZPCX_EnterImageNtHeader(char* plpPEMapping);
PIMAGE_SECTION_HEADER	__stdcall	ZPCX_EnterImageFirstSection(char* plpPEMapping);
unsigned int			__stdcall	ZPCX_DepackBuf(const void *source, void *destination);
ULONG_PTR				__stdcall	ZPCX_GetXMVar(char* plpName);
ULONG_PTR				__stdcall	ZPCX_GetXGlobalVar(int pVarType);
char*					__stdcall	ZPCX_malloc(size_t pszBuf);
void					__stdcall	ZPCX_free(char* plpBuf);



