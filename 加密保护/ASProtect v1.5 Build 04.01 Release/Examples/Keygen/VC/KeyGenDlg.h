// KeyGenDlg.h : header file
//

#if !defined(AFX_KEYGENDLG_H__7A19C548_AADA_4BF3_88E6_405287C5AF64__INCLUDED_)
#define AFX_KEYGENDLG_H__7A19C548_AADA_4BF3_88E6_405287C5AF64__INCLUDED_

#include "KeyGenerator.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CKeyGenDlg dialog

class CKeyGenDlg : public CDialog
{
// Construction
public:
	CKeyGenDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CKeyGenDlg)
	enum { IDD = IDD_KEYGEN_DIALOG };
	CEdit	m_edRegKey;
	CButton	m_chExpDate;
	CDateTimeCtrl	m_dtExpDate;
	CString	m_strHardID;
	CString	m_strUserInfo;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeyGenDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CKeyGenerator m_KeyGenerator;
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CKeyGenDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnChExpDate_Click();
	afx_msg void OnGenerate();
	afx_msg void OnSaveAs();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYGENDLG_H__7A19C548_AADA_4BF3_88E6_405287C5AF64__INCLUDED_)
