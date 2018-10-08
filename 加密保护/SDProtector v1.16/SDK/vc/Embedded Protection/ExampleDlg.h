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
		// NOTE: the ClassWizard will add data members here
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
	afx_msg void OnExampleDemo();
	afx_msg void OnExampleLock();
	afx_msg void OnExampleClear();
	afx_msg void OnExampleEmbed();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#endif
