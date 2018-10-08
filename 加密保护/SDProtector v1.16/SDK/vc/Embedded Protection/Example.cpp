#include "stdafx.h"
#include "Example.h"
#include "ExampleDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

BEGIN_MESSAGE_MAP(CExampleApp, CWinApp)
	//{{AFX_MSG_MAP(CExampleApp)
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

CExampleApp::CExampleApp(){}

CExampleApp theApp;

BOOL CExampleApp::InitInstance()
{
	CExampleDlg dlg;
	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK){}
	else if (nResponse == IDCANCEL){}
	return FALSE;
}
