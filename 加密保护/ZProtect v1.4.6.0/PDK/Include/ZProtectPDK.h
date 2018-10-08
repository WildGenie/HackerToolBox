#pragma once

#pragma pack(1)
typedef struct _PARG_GETINFO
{
	char m_lpName[255];
	char m_lpVer[255];
	char m_lpAuthor[255];
	char m_lpDesc[255];
}PARG_GETINFO,*PPARG_GETINFO;

typedef struct _PARG_QSHELL32
{
	char*	m_lpBuf;
	size_t	m_szBuf;
	char	m_dllName[64];
}PARG_QSHELL32,*PPARG_QSHELL32;

typedef struct _PARG_REGDLG
{
	HWND	m_hDlg;
	char	m_CapBuf[255];
	char	m_TipBuf[255];
}PARG_REGDLG,*PPARG_REGDLG;

typedef struct _PARG_INIT
{
	BOOL	m_bInitGUI;
}PARG_INIT,PPARG_INIT;

typedef struct _PARG_EXIT
{
	BOOL	m_bUseGUI;
}PARG_EXIT,PPARG_EXIT;

#pragma pack()

typedef void	(__stdcall* PENTRY_ZPCP_CommEntry)(void* pArg1);


void	__stdcall	ZPPC_SetCfgIntValue(char* pNodeName,int pValue);
void	__stdcall	ZPPC_SetCfgStrValue(char* pNodeName,char* plpStr);
int		__stdcall	ZPPC_GetCfgIntValue(char* pNodeName);
char*	__stdcall	ZPPC_GetCfgStrValue(char* pNodeName);
void	__stdcall	ZPPC_RegPluginDlg(PPARG_REGDLG pArg);
void	__stdcall	ZPPC_UnRegPluginDlg(HWND phDlg);