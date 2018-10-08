// keygenDlg.h : header file
//

#include "afxwin.h"
#if !defined(AFX_KEYGENDLG_H__FB8420B9_9C02_46AC_B345_017F62912CC1__INCLUDED_)
#define AFX_KEYGENDLG_H__FB8420B9_9C02_46AC_B345_017F62912CC1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CKeygenDlg dialog

class CKeygenDlg : public CDialog
{
// Construction
public:
	CKeygenDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CKeygenDlg)
	enum { IDD = IDD_KEYGEN_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeygenDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CKeygenDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonClose();
	afx_msg void OnCheckHardware();
	afx_msg void OnCheckExpiration();
	afx_msg void OnButtonGen();
	afx_msg void OnButtonGenfp();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButtonclose();
public:
	afx_msg void OnBnClickedCheckexpiration();
public:
	afx_msg void OnBnClickedCheckhd();
public:
	afx_msg void OnBnClickedCheckregafter();
public:
	afx_msg void OnBnClickedCheckregbefore();
public:
	afx_msg void OnBnClickedCheckcountry();
public:
	afx_msg void OnBnClickedCheckexecs();
public:
	afx_msg void OnBnClickedCheckdays();
public:
	afx_msg void OnBnClickedCheckrtime();
public:
	afx_msg void OnBnClickedCheckgtime();
public:
	afx_msg void OnBnClickedButtongen();
public:
	CComboBox com_key_mode;
public:
	CComboBox com_key_base;
public:
	CComboBox com_counties;
public:
	afx_msg void OnBnClickedButtongenfp();
public:
	afx_msg void OnBnClickedButtonver();
public:
	afx_msg void OnBnClickedButtonverfp();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYGENDLG_H__FB8420B9_9C02_46AC_B345_017F62912CC1__INCLUDED_)
