// T5Doc.h : interface of the CT5Doc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_T5DOC_H__E65174A0_F560_42C7_81B1_B6F7845D523A__INCLUDED_)
#define AFX_T5DOC_H__E65174A0_F560_42C7_81B1_B6F7845D523A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CT5Doc : public CDocument
{
protected: // create from serialization only
	CT5Doc();
	DECLARE_DYNCREATE(CT5Doc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CT5Doc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CT5Doc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CT5Doc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_T5DOC_H__E65174A0_F560_42C7_81B1_B6F7845D523A__INCLUDED_)
