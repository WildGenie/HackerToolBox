// Potato.cpp : 定义 DLL 的初始化例程。
//

#include "stdafx.h"
#include "DlgAbout.h"
#include "DlgSetting.h"
#include "Potato.h"

BEGIN_MESSAGE_MAP(CPotatoApp, CWinApp)
END_MESSAGE_MAP()



CPotatoApp::CPotatoApp()
{

}

CPotatoApp theApp;
CDlgSetting	gDlgSetting;

// CPotatoApp 初始化

BOOL CPotatoApp::InitInstance()
{
	CWinApp::InitInstance();

	return TRUE;
}



void	__stdcall ZPCP_GetPluginInfo(PPARG_GETINFO pArgInfo)
{
	strcpy(pArgInfo->m_lpName,"Potato插件");
	strcpy(pArgInfo->m_lpVer,"v0.1");
	strcpy(pArgInfo->m_lpAuthor,"Lifeengines");
	strcpy(pArgInfo->m_lpDesc,"马铃薯，山名又称洋芋！");
}

void	__stdcall ZPCP_Init(void*)
{

}

void	__stdcall ZPCP_Exit(void*)
{

}

void	__stdcall ZPCP_SettingDlg(void*)
{
	gDlgSetting.DoModal();
}

void	__stdcall ZPCP_AboutDlg(void*)
{
	CDlgAbout pDlgAbout;
	pDlgAbout.DoModal();
}


void	__stdcall ZPCP_QueryShellInfo32(PPARG_QSHELL32 pArg1)
{
	HMODULE phMain = AfxGetInstanceHandle();
	HRSRC prsRes = FindResource(phMain,MAKEINTRESOURCE(IDR_SHELL1),TEXT("SHELL"));
	HGLOBAL pglRes = LoadResource (phMain,prsRes);
	LPVOID plpRes =LockResource(pglRes);
	size_t pszRes = SizeofResource(phMain,prsRes);
	strcpy(pArg1->m_dllName,"PotatoX.dll");
	pArg1->m_lpBuf = (char*)plpRes;
	pArg1->m_szBuf = pszRes;
	UnlockResource(plpRes);
	FreeResource(pglRes);

}