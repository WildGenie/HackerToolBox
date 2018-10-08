// testDlg.cpp : implementation file
//

#include "stdafx.h"
#include "test.h"
#include "testDlg.h"

// The Enigma Protector references
#include "../../../../EnigmaSDK/VC/enigma_ide.h"
#pragma comment (lib,"../../../../EnigmaSDK/VC/enigma_ide.lib")


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

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
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_EXIT, OnButtonExit)
	ON_BN_CLICKED(IDC_BUTTON_REGISTER, OnButtonRegister)
	ON_BN_CLICKED(IDC_CHECK_SECTION1, OnCheckSection1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTestDlg message handlers

BOOL CTestDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	if (EP_RegLoadAndCheckKey())
	{
		// Set status to registered
		SetDlgItemText(IDC_EDIT_STATUS, "REGISTERED");
	} else
	{
		// Set status to unregistered	
		SetDlgItemText(IDC_EDIT_STATUS, "UNREGISTERED");
	}

	// Set status of checkboxes in case is registered
	// Checkbox1
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_begin1.inc"
	CheckDlgButton(IDC_CHECK_SECTION1, 1);
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_end1.inc"
	// Checkbox2
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_begin2.inc"
	CheckDlgButton(IDC_CHECK_SECTION2, 1);
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_end2.inc"
	// Checkbox3
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_begin3.inc"
	CheckDlgButton(IDC_CHECK_SECTION3, 1);
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_end3.inc"
	// Checkbox4
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_begin4.inc"
	CheckDlgButton(IDC_CHECK_SECTION4, 1);
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_end4.inc"

	// Set status of checkboxes in case is unregistered
	#include "..\..\..\..\EnigmaSDK\VC\unreg_crypt_begin1.inc"
	CheckDlgButton(IDC_CHECK_SECTION1, 0);
	#include "..\..\..\..\EnigmaSDK\VC\unreg_crypt_end1.inc"
	// Checkbox2
	#include "..\..\..\..\EnigmaSDK\VC\unreg_crypt_begin2.inc"
	CheckDlgButton(IDC_CHECK_SECTION2, 0);
	#include "..\..\..\..\EnigmaSDK\VC\unreg_crypt_end2.inc"
	// Checkbox3
	#include "..\..\..\..\EnigmaSDK\VC\unreg_crypt_begin3.inc"
	CheckDlgButton(IDC_CHECK_SECTION3, 0);
	#include "..\..\..\..\EnigmaSDK\VC\unreg_crypt_end3.inc"
	// Checkbox4
	#include "..\..\..\..\EnigmaSDK\VC\unreg_crypt_begin4.inc"
	CheckDlgButton(IDC_CHECK_SECTION4, 0);
	#include "..\..\..\..\EnigmaSDK\VC\unreg_crypt_end4.inc"	
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CTestDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
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

void CTestDlg::OnButtonExit() 
{
	// TODO: Add your control notification handler code here
	ExitProcess(0);
}

void CTestDlg::OnButtonRegister() 
{
	char userbuf[255];
	char keybuf[255];

	// get user info
	memset(&userbuf, sizeof(userbuf), 0);
    GetDlgItemText(IDC_EDIT_USER, (char*)&userbuf, sizeof(userbuf));

	// get key info
	memset(&keybuf, sizeof(keybuf), 0);
    GetDlgItemText(IDC_EDIT_KEY, (char*)&keybuf, sizeof(keybuf));

	
	if (EP_RegCheckAndSaveKey((char*)&userbuf, (char*)&keybuf))
	{
		MessageBox("You have succeeded registration!\r\nRestart application to take effect", "Test", MB_ICONINFORMATION);
	} else
	{
		MessageBox("The registration key is incorrect, try again!", "Test", MB_ICONERROR);
	} 
}

void CTestDlg::OnCheckSection1() 
{
	// TODO: Add your control notification handler code here
	
}
