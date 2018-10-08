#if !defined(AFX_TRIALDIALOG_H__26C0DA7C_BE41_4816_B2DB_290DA5429CE9__INCLUDED_)
#define AFX_TRIALDIALOG_H__26C0DA7C_BE41_4816_B2DB_290DA5429CE9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// TrialDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTrialDialog dialog

class CTrialDialog : public CDialog
{
// Construction
public:
	CTrialDialog(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CTrialDialog)
	enum { IDD = IDD_TRIAL_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTrialDialog)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CTrialDialog)
	afx_msg void OnBuynow();
	afx_msg void OnEvaluate();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TRIALDIALOG_H__26C0DA7C_BE41_4816_B2DB_290DA5429CE9__INCLUDED_)
