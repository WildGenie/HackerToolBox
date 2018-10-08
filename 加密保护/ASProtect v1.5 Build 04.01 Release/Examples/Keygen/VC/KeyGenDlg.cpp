// KeyGenDlg.cpp : implementation file
//

#include "stdafx.h"
#include "KeyGen.h"
#include "KeyGenDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CKeyGenDlg dialog

CKeyGenDlg::CKeyGenDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CKeyGenDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CKeyGenDlg)
	m_strHardID = _T("");
	m_strUserInfo = _T("James Bond\r\n- personal license -\r\n01.01.2001\r\n");
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CKeyGenDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CKeyGenDlg)
	DDX_Control(pDX, IDC_REGKEY, m_edRegKey);
	DDX_Control(pDX, IDC_CH_EXPDATE, m_chExpDate);
	DDX_Control(pDX, IDC_EXPDATE, m_dtExpDate);
	DDX_Text(pDX, IDC_HARDID, m_strHardID);
	DDX_Text(pDX, IDC_USERINFO, m_strUserInfo);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CKeyGenDlg, CDialog)
	//{{AFX_MSG_MAP(CKeyGenDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_CH_EXPDATE, OnChExpDate_Click)
	ON_BN_CLICKED(IDC_GEN, OnGenerate)
	ON_BN_CLICKED(IDC_SAVE, OnSaveAs)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKeyGenDlg message handlers

BOOL CKeyGenDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	m_dtExpDate.EnableWindow(FALSE);
	CTime Time;
	m_dtExpDate.GetTime(Time);
	Time += CTimeSpan(30, 0, 0, 0);
	m_dtExpDate.SetTime(&Time);

	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	m_KeyGenerator.Init();
	m_KeyGenerator.InitProject(
		"SahqUZft3hfIzx7XhMLr/A==",
		"iex+hjO8FQcdxCAqVjvW20dKIBeqZDWYgW8sXAKBhxaewHwc3m3e5Wkykzt9yRX1tkK/0V2jy42o2oKULp0unkf31JTfL+TsCQWTIATt9IjrbdK/mJv0HsYAhbdJr+QQh20CVwrwocxP9foUrkUedZijKtRE8/NuOEijp5EXPH0=",
		"7/bjxkM0GGdnj7zMFMbN/PvBhQ5RyTNOxtoApRc3fs4qRA4EUVqbipB3LxzEChBz7CR4UWc9rvCOqsveEM53t4zdMPAGZE/9Uelt96byKlT22azRFXQvbvLF2wbAXJrEkvKoaTS9uib7e5RRRdiEyZeMnrm4vjbbGIE+7562XoE=");
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CKeyGenDlg::OnPaint() 
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
	} else {
		CDialog::OnPaint();
	}
}

HCURSOR CKeyGenDlg::OnQueryDragIcon()
{
	return (HCURSOR)m_hIcon;
}

void CKeyGenDlg::OnChExpDate_Click() 
{
	m_dtExpDate.EnableWindow(m_chExpDate.GetCheck() == BST_CHECKED);
}

void CKeyGenDlg::OnGenerate() 
{
	UpdateData();
	m_strUserInfo.TrimLeft();
	m_strUserInfo.TrimRight();

	m_strHardID.TrimLeft();
	m_strHardID.TrimRight();

	int nKeySize;

	if (((LPTSTR)(LPCTSTR)m_strHardID != NULL) &&
		(strlen((LPTSTR)(LPCTSTR)m_strHardID) > 0) &&
		(m_KeyGenerator.CheckHardwareID( m_strHardID ) == FALSE)
		)
	{
		MessageBox(_T("Invalid HardwareID key"), _T("Error"), MB_ICONERROR);
	} else
	{

		if(m_chExpDate.GetCheck() == BST_CHECKED)
		{
			CTime Time;
			m_dtExpDate.GetTime(Time);
			nKeySize = m_KeyGenerator.RegistrationKeyGenerate(m_strUserInfo, m_strHardID, &Time);
		} else
			nKeySize = m_KeyGenerator.RegistrationKeyGenerate(m_strUserInfo, m_strHardID, NULL);

		if(nKeySize > 0)
			m_edRegKey.SetWindowText(m_KeyGenerator.GetRegKey());
		else {
				CString str;
				if(nKeySize == 0)
					str = _T("keygen.dll is not initialized");
				else
					str.Format(_T("Small buffer (need %d) bytes)"), -nKeySize);
				MessageBox(str, _T("Error"), MB_ICONERROR);
		}
	}
}

void CKeyGenDlg::OnSaveAs() 
{
	if(m_KeyGenerator.GetRegKey().IsEmpty())
		MessageBox(_T("The registration key is empty! Generate it before."), _T("Error"), MB_ICONERROR);
	else {
		CFileDialog dlgFile(FALSE, _T("key"), _T("regkey"), OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
			_T("Key files (*.key)|*.key||"), this);
		CString str;
		::GetModuleFileName(AfxGetInstanceHandle(), str.GetBuffer(MAX_PATH), MAX_PATH);
		str.ReleaseBuffer();
		str = str.Left(str.ReverseFind(_T('\\')));
		dlgFile.m_ofn.lpstrInitialDir = str;
		if(dlgFile.DoModal() == IDOK)
			m_KeyGenerator.RegistrationKeySave(dlgFile.GetPathName(), _T("HKEY_LOCAL_MACHINE\\Software\\Test"), _T("Key"));
	}
}
