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
	if (EP_RegLoadAndCheckKey())
	{
		SetDlgItemText(IDC_STATIC_REGSTATUS, "REGISTERED - trial is ignored");
	} else
	{
		SetDlgItemText(IDC_STATIC_REGSTATUS, "UNREGISTERED");
	};

	this->InitTrial ();
	
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

void CTestDlg::OnButtonClose() 
{
	// TODO: Add your control notification handler code here
	ExitProcess(0);
}

CTestDlg::InitTrial()
{
	DWORD dDTotal = 0;
	DWORD dDLeft = 0;
	DWORD dETotal = 0;
	DWORD dELeft = 0;

	WORD wEYear = 0;
	WORD wEMonth = 0;
	WORD wEDay = 0;

	char buffer[255];

	if (EP_TrialDays(&dDTotal, &dDLeft))
	{
        wsprintf( buffer,"%d", dDTotal );		
		SetDlgItemText(IDC_STATIC_TOTALDAYS, (LPCTSTR)&buffer);

        wsprintf( buffer,"%d", dDLeft );		
		SetDlgItemText(IDC_STATIC_LEFTDAYS, (LPCTSTR)&buffer);
	};

	if (EP_TrialExecutions(&dETotal, &dELeft))
	{
        wsprintf( buffer,"%d", dETotal );		
		SetDlgItemText(IDC_STATIC_TOTALEXECS, (LPCTSTR)&buffer);

        wsprintf( buffer,"%d", dELeft );		
		SetDlgItemText(IDC_STATIC_LEFTEXECS, (LPCTSTR)&buffer);
	};

	if (EP_TrialExpirationDate(&wEYear, &wEMonth, &wEDay))
	{
        wsprintf( buffer,"%d/%d/%d", wEMonth, wEDay, wEYear );		
		SetDlgItemText(IDC_STATIC_EXPIRATIONDATE, (LPCTSTR)&buffer);
	};

	return 0;
}