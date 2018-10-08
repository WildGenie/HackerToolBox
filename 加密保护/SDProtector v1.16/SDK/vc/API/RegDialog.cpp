// RegDialog.cpp : implementation file
//

#include "stdafx.h"
#include "example.h"
#include "RegDialog.h"
#include "../include/SDProtector.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRegDialog dialog

CRegDialog::CRegDialog(CWnd* pParent /*=NULL*/)
	: CDialog(CRegDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRegDialog)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

void CRegDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRegDialog)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CRegDialog, CDialog)
	//{{AFX_MSG_MAP(CRegDialog)
	ON_BN_CLICKED(IDC_SEND, OnSend)
	ON_BN_CLICKED(IDC_BUYNOW, OnBuynow)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRegDialog message handlers

void CRegDialog::OnSend() 
{
	char	buffer[1024];
	char szHardwareID[42];
    int  iMaxLen=42;
	
    memset(szHardwareID,0,iMaxLen);
    if(SDP_RetrieveHardwareID(szHardwareID,42))
    {
		buffer[0] = 0;
		lstrcat(buffer,"mailto:support@yourwebsite.com?subject=Hardware%20ID%20for%20Advanced%20Application%201.0&body=Hardware%20ID is%20:%20");
		lstrcat(buffer,szHardwareID);
		lstrcat(buffer,"%0d%0aName%20for%20registration%20:");
		ShellExecute((HWND)GetDesktopWindow(), "open", buffer, NULL, NULL, SW_SHOWNORMAL);
		
    } 
    else
    {
		::MessageBox(NULL,"Can not get hardware id","Error",MB_ICONINFORMATION); 
    } 
	
}

void CRegDialog::OnBuynow() 
{
	ShellExecute((HWND)GetDesktopWindow(), "open", "http://www.sdprotector.com/purchase.htm", NULL, NULL, SW_SHOWNORMAL);	
}

void CRegDialog::OnOK() 
{
	// TODO: Add extra validation here
	ExitProcess(0);
//	CDialog::OnOK();
	
}

BOOL CRegDialog::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	char szHardwareID[42];
    int  iMaxLen=42;
	
    memset(szHardwareID,0,iMaxLen);
    if(SDP_RetrieveHardwareID(szHardwareID,42))
    {
		//MessageBox("ok",NULL,MB_OK);
		SetDlgItemText( IDC_HARDWAR_ID,szHardwareID);
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
