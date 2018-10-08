// T5View.h : interface of the CT5View class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_T5VIEW_H__A4C1F6FE_AF5B_42E0_AD2B_FC5C86AEB3DD__INCLUDED_)
#define AFX_T5VIEW_H__A4C1F6FE_AF5B_42E0_AD2B_FC5C86AEB3DD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CT5View : public CEditView
{
protected: // create from serialization only
	CT5View();
	DECLARE_DYNCREATE(CT5View)

// Attributes
public:
	CT5Doc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CT5View)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CT5View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CT5View)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
public:
    void ApendString(CString  strAppend);
};

#ifndef _DEBUG  // debug version in T5View.cpp
inline CT5Doc* CT5View::GetDocument()
   { return (CT5Doc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_T5VIEW_H__A4C1F6FE_AF5B_42E0_AD2B_FC5C86AEB3DD__INCLUDED_)
