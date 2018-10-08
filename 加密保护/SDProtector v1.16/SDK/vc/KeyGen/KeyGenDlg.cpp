// KeyGenDlg.cpp : implementation file
//

#include "stdafx.h"
#include "KeyGen.h"
#include "KeyGenDlg.h"
#include "../include/KeyGen.h"
#include "base64.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CKeyGenDlg::CKeyGenDlg(CWnd* pParent /*=NULL*/)
: CDialog(CKeyGenDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CKeyGenDlg)
	m_szUserName = _T("");
	m_szOrderID = _T("");
	m_szHardwareID = _T("");
	m_szExpirationVersion = _T("");
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CKeyGenDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CKeyGenDlg)
	DDX_Control(pDX, IDC_CHECK_WRAP, m_ctrlCheckWrap);
	DDX_Control(pDX, IDC_CHECK_EXP_DATE, m_ctrlCheckExpDate);
	DDX_Control(pDX, IDC_EXP_DATETIMEPICKER, m_ctrlExpDatePick);
	DDX_Control(pDX, IDC_EDIT_KEY, m_ctrlRegKey);
	DDX_Control(pDX, IDC_EDIT_VERSION, m_ctrlExpirationVersion);
	DDX_Text(pDX, IDC_USER_NAME, m_szUserName);
	DDV_MaxChars(pDX, m_szUserName, 35);
	DDX_Text(pDX, IDC_ORDER_ID, m_szOrderID);
	DDV_MaxChars(pDX, m_szOrderID, 23);
	DDX_Text(pDX, IDC_EDIT_HARDWAREID, m_szHardwareID);
	DDX_Text(pDX, IDC_EDIT_VERSION, m_szExpirationVersion);
	DDV_MaxChars(pDX, m_szExpirationVersion, 8);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CKeyGenDlg, CDialog)
//{{AFX_MSG_MAP(CKeyGenDlg)
ON_WM_PAINT()
ON_WM_QUERYDRAGICON()
ON_BN_CLICKED(IDC_GEN_TEXT_KEY, OnGenTextKey)
ON_BN_CLICKED(IDC_GEN_KEY_FILE, OnGenKeyFile)
ON_BN_CLICKED(IDC_CHECK_WRAP, OnCheckWrap)
ON_BN_CLICKED(IDC_CHECK_EXP_DATE, OnCheckExpDate)
ON_BN_CLICKED(IDC_CHECK_KEY, OnCheckKey)
//}}AFX_MSG_MAP
END_MESSAGE_MAP()


BOOL CKeyGenDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	m_ctrlExpDatePick.EnableWindow(FALSE);
	return TRUE;  
}
void CKeyGenDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this);
		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}
HCURSOR CKeyGenDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CKeyGenDlg::OnGenTextKey() 
{
	UpdateData();
	if (!m_szUserName.GetLength()) 
	{
		AfxMessageBox("User name is empty!",MB_OK,NULL);
		return;
	}
	if (!m_szOrderID.GetLength()) 
	{
		AfxMessageBox("Order ID is empty!",MB_OK,NULL);
		return;
	}
	m_szUserName.TrimLeft();
	m_szUserName.TrimRight();	
	m_szOrderID.TrimLeft();
	m_szOrderID.TrimRight();
	
	KEY_DATA sKeyData;
	memset((void *)&sKeyData,0,sizeof(KEY_DATA));  // Important! Be sure to do this;
	sKeyData.lpUserName=(char *)(LPCTSTR)m_szUserName;
	sKeyData.lpOrderID=(char *)(LPCTSTR)m_szOrderID;
    if (m_szHardwareID.GetLength()) 
	{
		m_szHardwareID.TrimLeft();
		m_szHardwareID.TrimRight();
		sKeyData.lpHardwareID=(char *)(LPCTSTR)m_szHardwareID;
    }
	if (m_szExpirationVersion.GetLength()) 
	{
		m_szExpirationVersion.TrimLeft();
		m_szExpirationVersion.TrimRight();
		sKeyData.lpExpVersion=(char *)(LPCTSTR)m_szExpirationVersion;
    }
	
	SYSTEMTIME ExpirationTime;
	if (m_ctrlCheckExpDate.GetCheck() == BST_CHECKED) 
	{
		sKeyData.lpExpDate=&ExpirationTime;
		m_ctrlExpDatePick.GetTime(sKeyData.lpExpDate);
	}
	
	
	char RegCode[256];
	memset(RegCode,0,256);
	int iRet=GenerateTextKey(&sKeyData,(char *)&RegCode,256);
	
    if (!iRet) 
	{
		
		m_ctrlRegKey.SetWindowText(RegCode);	
		ExecuteWrapStrings();
    }
	else
	{
		CString szErr;
		szErr.Format("Couldn't generate registration key! \r\n\r\n"
			"Error code : %d",iRet);
		AfxMessageBox(szErr,MB_OK,NULL);
   	}

	
}
void CKeyGenDlg::OnGenKeyFile() 
{
	UpdateData();
	if (!m_szUserName.GetLength()) 
	{
		AfxMessageBox("User name is empty!",MB_OK,NULL);
		return;
	}
	if (!m_szOrderID.GetLength()) 
	{
		AfxMessageBox("Order ID is empty!",MB_OK,NULL);
		return;
	}
	m_szUserName.TrimLeft();
	m_szUserName.TrimRight();	
	m_szOrderID.TrimLeft();
	m_szOrderID.TrimRight();
	
	KEY_DATA sKeyData;
	memset((void *)&sKeyData,0,sizeof(KEY_DATA)); // Important! It should be 
	                                              // initialized to zero;
	sKeyData.lpUserName=(char *)(LPCTSTR)m_szUserName;
	sKeyData.lpOrderID=(char *)(LPCTSTR)m_szOrderID; 
    if (m_szHardwareID.GetLength()) 
	{
		m_szHardwareID.TrimLeft();
		m_szHardwareID.TrimRight();
		sKeyData.lpHardwareID=(char *)(LPCTSTR)m_szHardwareID;
    }
	if (m_szExpirationVersion.GetLength()) 
	{
		m_szExpirationVersion.TrimLeft();
		m_szExpirationVersion.TrimRight();
		sKeyData.lpExpVersion=(char *)(LPCTSTR)m_szExpirationVersion;
    }
	SYSTEMTIME ExpirationTime;
	if (m_ctrlCheckExpDate.GetCheck() == BST_CHECKED) 
	{
		sKeyData.lpExpDate=&ExpirationTime;
		m_ctrlExpDatePick.GetTime(sKeyData.lpExpDate);
	}
	
	
	char szFilter[]="Reg File (*.reg)\0*.reg\0\0";
	
	CFileDialog dlg(false);
	CString szFileSave;
	dlg.m_ofn.lpstrFilter=(LPSTR)szFilter;
	dlg.m_ofn.Flags=OFN_ENABLEHOOK|OFN_HIDEREADONLY|OFN_NONETWORKBUTTON|OFN_EXPLORER|OFN_PATHMUSTEXIST;
	dlg.m_ofn.lpstrDefExt="reg";
	if(dlg.DoModal()==IDOK)
	{
		
		szFileSave = dlg.GetPathName();
		AfxMessageBox(szFileSave,MB_OK,NULL);
		int iRet=GenerateKeyFile(&sKeyData,(char *)(LPCTSTR)szFileSave);
		
		if (iRet) 
		{
			
			CString szErr;
			szErr.Format("Couldn't generate registration key! \r\n\r\n"
				"Error code : %d",iRet);
			AfxMessageBox(szErr,MB_OK,NULL);
			
		}
	}
}
void CKeyGenDlg::ExecuteWrapStrings() 
{
	CString szRegCode;
	m_ctrlRegKey.GetWindowText(szRegCode);
	if (!szRegCode.GetLength()) 
	{
		return ;
	}
	if (m_ctrlCheckWrap.GetCheck() == BST_CHECKED) 
	{
		szRegCode.Replace("\r\n","");
		for (int i=0;i<szRegCode.GetLength();i++)
		{
			if (i==40) 
			{
				szRegCode.Insert(i,"\r\n");
			}
			else
			{
				if (((i-40)%42)==0) 
				{
					szRegCode.Insert(i,"\r\n");
				}
			}		
		}
		m_ctrlRegKey.SetWindowText(szRegCode);
	}
	else
	{
		szRegCode.Replace("\r\n","");
		m_ctrlRegKey.SetWindowText(szRegCode);
	}
}

void CKeyGenDlg::OnCheckWrap() 
{
	UpdateData();
    ExecuteWrapStrings(); 
}
void CKeyGenDlg::OnCheckKey() 
{
	CString szRegCode;
	m_ctrlRegKey.GetWindowText(szRegCode);
	if (!szRegCode.GetLength()) 
	{
		AfxMessageBox("Registration code is empty!",MB_OK,NULL);
	}
	else
	{
		KEY_DATA sKeyData;
        UpdateData();
		memset((void *)&sKeyData,0,sizeof(KEY_DATA)); // Important! It should be 
		                                              // initialized to zero;
		if (m_szUserName.GetLength()) 
		{
			m_szUserName.TrimLeft();
			m_szUserName.TrimRight();	
			sKeyData.lpUserName=(char *)(LPCTSTR)m_szUserName;
			
		}
		if (m_szOrderID.GetLength()) 
		{
			m_szOrderID.TrimLeft();
			m_szOrderID.TrimRight();
			sKeyData.lpOrderID=(char *)(LPCTSTR)m_szOrderID; 
			
		}
		if (m_szHardwareID.GetLength()) 
		{
			m_szHardwareID.TrimLeft();
			m_szHardwareID.TrimRight();
			sKeyData.lpHardwareID=(char *)(LPCTSTR)m_szHardwareID;
		}
		
		if (VerifyTextKey(&sKeyData,(char *)(LPCTSTR)szRegCode)) 
		{
			AfxMessageBox("Valid Key!",MB_OK,NULL);
		}
		else
		{
			AfxMessageBox("Invalid Key!",MB_OK,NULL);
		}
	}
}
void CKeyGenDlg::OnCheckExpDate() 
{
	m_ctrlExpDatePick.EnableWindow(m_ctrlCheckExpDate.GetCheck() == BST_CHECKED);	
}



