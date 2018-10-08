// T5View.cpp : implementation of the CT5View class
//

#include "stdafx.h"
#include "T5.h"

#include "T5Doc.h"
#include "T5View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CT5View

IMPLEMENT_DYNCREATE(CT5View, CEditView)

BEGIN_MESSAGE_MAP(CT5View, CEditView)
	//{{AFX_MSG_MAP(CT5View)
	ON_WM_CTLCOLOR()
	//}}AFX_MSG_MAP
	// Standard printing commands
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CT5View construction/destruction

CT5View::CT5View()
{
	// TODO: add construction code here

}

CT5View::~CT5View()
{
}

BOOL CT5View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	BOOL bPreCreated = CEditView::PreCreateWindow(cs);
	cs.style &= ~(ES_AUTOHSCROLL|WS_HSCROLL);	// Enable word-wrapping

	return bPreCreated;
}

/////////////////////////////////////////////////////////////////////////////
// CT5View drawing

void CT5View::OnDraw(CDC* pDC)
{
	CT5Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
}
void CT5View::ApendString(CString  strAppend)
{
    CEdit& editObject = GetEditCtrl();
    CString strTemp;
    editObject.GetWindowText(strTemp);
    if(strTemp.IsEmpty())
    {
        strTemp = strAppend;
    }
    else
    {
        strTemp += "\r\n";
        strTemp += strAppend;
    }
    editObject.SetWindowText(strTemp);
}

/////////////////////////////////////////////////////////////////////////////
// CT5View printing



/////////////////////////////////////////////////////////////////////////////
// CT5View diagnostics

#ifdef _DEBUG
void CT5View::AssertValid() const
{
	CEditView::AssertValid();
}

void CT5View::Dump(CDumpContext& dc) const
{
	CEditView::Dump(dc);
}

CT5Doc* CT5View::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CT5Doc)));
	return (CT5Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CT5View message handlers






















