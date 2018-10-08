// KeyGenDlg.h : header file
//

#if !defined(AFX_KEYGENDLG_H__6F2ED4F7_CFD5_4588_A6CB_7B98415361AB__INCLUDED_)
#define AFX_KEYGENDLG_H__6F2ED4F7_CFD5_4588_A6CB_7B98415361AB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CKeyGenDlg : public CDialog
{
// Construction
public:
	CKeyGenDlg(CWnd* pParent = NULL);	// standard constructor
    void ExecuteWrapStrings() ;
// Dialog Data
	//{{AFX_DATA(CKeyGenDlg)
	enum { IDD = IDD_KEYGEN_DIALOG };
	CButton	m_ctrlCheckWrap;
	CButton	m_ctrlCheckExpDate;
	CDateTimeCtrl	m_ctrlExpDatePick;
	CEdit	m_ctrlRegKey;
	CEdit m_ctrlExpirationVersion;
	CString	m_szUserName;
	CString	m_szOrderID;
	CString	m_szHardwareID;
	CString	m_szExpirationVersion;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeyGenDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CKeyGenDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnGenTextKey();
	afx_msg void OnGenKeyFile();
	afx_msg void OnCheckWrap();
	afx_msg void OnCheckExpDate();
	
	afx_msg void OnCheckKey();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYGENDLG_H__6F2ED4F7_CFD5_4588_A6CB_7B98415361AB__INCLUDED_)
