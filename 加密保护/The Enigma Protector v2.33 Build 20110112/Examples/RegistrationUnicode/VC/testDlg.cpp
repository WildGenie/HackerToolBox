// testDlg.cpp : implementation file
//

#include "stdafx.h"
#include "test.h"
#include "testDlg.h"

#include "../../../EnigmaSDK/VC/enigma_ide.h"
#pragma comment (lib,"../../../EnigmaSDK/VC/enigma_ide.lib")

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTestDlg dialog
 

CTestDlg::CTestDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTestDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTestDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTestDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTestDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTestDlg, CDialog)
	//{{AFX_MSG_MAP(CTestDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_CLOSE, OnButtonClose)
	ON_BN_CLICKED(IDC_BUTTON_BUY, OnButtonBuy)
	ON_BN_CLICKED(IDC_BUTTON_UNREGISTER, OnButtonUnregister)
	ON_BN_CLICKED(IDC_BUTTON_REGISTER, OnButtonRegister)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTestDlg message handlers

BOOL CTestDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here

	// Show Hardware ID
	SetDlgItemTextW(IDC_EDIT_HARDWARE, EP_RegHardwareIDW());

	// Verify the registration information
	DoRegistered(EP_RegLoadAndCheckKey());
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CTestDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CTestDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CTestDlg::DoRegistered(BOOL bReg)
{
	CWnd* wnd;
	// Enable/disable unregister button
	wnd = GetDlgItem(IDC_BUTTON_UNREGISTER);  
	wnd->EnableWindow(bReg);

	// Enable/disable unregister static
	wnd = GetDlgItem(IDC_BUTTON_REGISTER);    
	wnd->EnableWindow(!bReg);
	// Enable/disable user info edit
	wnd = GetDlgItem(IDC_EDIT_USERINFO);    
	wnd->EnableWindow(!bReg);
	// Enable/disable key edit
	wnd = GetDlgItem(IDC_EDIT_KEY);    
	wnd->EnableWindow(!bReg);

	wchar_t* sName = NULL;
	wchar_t* sKey = NULL;
	if (bReg)
	{
		if (EP_RegLoadKeyW(&sName, &sKey))
		{
			SetDlgItemTextW(IDC_EDIT_USERINFO, sName);
			SetDlgItemTextW(IDC_EDIT_KEY, sKey);
		}
	}
}

void CTestDlg::OnButtonClose() 
{
	// TODO: Add your control notification handler code here
	ExitProcess(0);
}

void CTestDlg::OnButtonBuy() 
{
	// TODO: Add your control notification handler code here
	ShellExecute(0, (LPCWSTR)L"open", (LPCWSTR)L"http://www.enigmaprotector.com/", NULL, NULL, 0);
}

void CTestDlg::OnButtonUnregister() 
{
	// TODO: Add your control notification handler code here
	EP_RegDeleteKey();
	DoRegistered(FALSE);	
}

void CTestDlg::OnButtonRegister() 
{
	// TODO: Add your control notification handler code here
	wchar_t sName[255];
	wchar_t sKey[2047];

	GetDlgItemTextW(IDC_EDIT_USERINFO, (wchar_t*)&sName, sizeof(sName));
	GetDlgItemTextW(IDC_EDIT_KEY, (wchar_t*)&sKey, sizeof(sKey));

	if (EP_RegCheckAndSaveKeyW((wchar_t*)&sName, (wchar_t*)&sKey))
	{
		DoRegistered(TRUE);
	}
}
