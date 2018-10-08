#include "stdafx.h"
#include "Example.h"
#include "ExampleDlg.h"
#include "..\include\SDProtector.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CExampleDlg::CExampleDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CExampleDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CExampleDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CExampleDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CExampleDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CExampleDlg, CDialog)
	//{{AFX_MSG_MAP(CExampleDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(ID_EXAMPLE_DEMO, OnExampleDemo)
	ON_BN_CLICKED(ID_EXAMPLE_LOCK, OnExampleLock)
	ON_BN_CLICKED(ID_EXAMPLE_CLEAR, OnExampleClear)
	ON_BN_CLICKED(ID_EXAMPLE_EMBED, OnExampleEmbed)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

BOOL CExampleDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
    SetIcon(m_hIcon, TRUE);	
	SetIcon(m_hIcon, FALSE);

	return TRUE;  
}

void CExampleDlg::OnPaint() 
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

HCURSOR CExampleDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

// IMPORTANT : Don't forget to protect examples before 
// test in order to see how these marks work!

void CExampleDlg::OnExampleDemo() 
{
	
	
	DEMO_BLOCK_START       //demo code begin

    MessageBox( "Welcome, you are registered user!","",MB_OK);
	
	DEMO_BLOCK_END         //demo code end
		
	
    MessageBox("without correct key, you can only see this message.","",MB_OK);
	
}

void CExampleDlg::OnExampleLock() 
{
	// TODO: Add your control notification handler code here
	LOCK_BLOCK_START       //demo code begin
		
		MessageBox( "The code executed will be encrypted after protection","",MB_OK);
	
	LOCK_BLOCK_END         //demo code end
		

}

void CExampleDlg::OnExampleClear() 
{

	CLEAR_BLOCK_START       //demo code begin
		
		MessageBox("After protection, You can only see this message once because\r\n"
		           "the code between CLEAR_BLOCK_START and CLEAR_BLOCK_END will\r\n"
				   "be destroyed after the first execution.","",MB_OK);
	CLEAR_BLOCK_END  
}

void CExampleDlg::OnExampleEmbed() 
{
	// TODO: Add your control notification handler code here
/*	__asm{
		int 3
	}
	*/
	EMBED_BLOCK_START       //demo code begin
		
		MessageBox("Code protected by embedded protector, which "
		            "will defeat debuggers and other crack tools","",MB_OK);
	EMBED_BLOCK_END  
}
