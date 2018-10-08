// TrialDialog.cpp : implementation file
//

#include "stdafx.h"
#include "example.h"
#include "TrialDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTrialDialog dialog


CTrialDialog::CTrialDialog(CWnd* pParent /*=NULL*/)
	: CDialog(CTrialDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTrialDialog)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CTrialDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTrialDialog)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CTrialDialog, CDialog)
	//{{AFX_MSG_MAP(CTrialDialog)
	ON_BN_CLICKED(IDC_BUYNOW, OnBuynow)
	ON_BN_CLICKED(ID_EVALUATE, OnEvaluate)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTrialDialog message handlers

void CTrialDialog::OnBuynow() 
{
	// TODO: Add your control notification handler code here
	ShellExecute((HWND)GetDesktopWindow(), "open", "http://www.sdprotector.com/purchase.htm", NULL, NULL, SW_SHOWNORMAL);
	
}

void CTrialDialog::OnEvaluate() 
{
	// TODO: Add your control notification handler code here
	CTrialDialog::OnOK();
}
