#if !defined(AFX_EXAMPLEDLG_H__B781EF6E_DA78_4F4D_8971_D4DF045C6FA4__INCLUDED_)
#define AFX_EXAMPLEDLG_H__B781EF6E_DA78_4F4D_8971_D4DF045C6FA4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CExampleDlg : public CDialog
{

public:
	CExampleDlg(CWnd* pParent = NULL);	

// Dialog Data
	//{{AFX_DATA(CExampleDlg)
	enum { IDD = IDD_EXAMPLE_DIALOG };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CExampleDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

protected:
	HICON m_hIcon;

	//{{AFX_MSG(CExampleDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnIsRegistered();
	afx_msg void OnGetRegistrationName();
	afx_msg void OnGetKeyExpirationDate();
	afx_msg void OnGetExpirationDate();
	afx_msg void OnGetNumOfDays();
	afx_msg void OnGetNumOfExecutions();
	afx_msg void OnDetectDebugger();
	afx_msg void OnSetRegistrationKey();
	afx_msg void OnGetHardwareId();
	afx_msg void OnRegister();
	afx_msg void OnClearRegistrationInfo();
	afx_msg void OnRetrieveHardwareid();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#endif
