// T5Doc.cpp : implementation of the CT5Doc class
//

#include "stdafx.h"
#include "T5.h"

#include "T5Doc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CT5Doc

IMPLEMENT_DYNCREATE(CT5Doc, CDocument)

BEGIN_MESSAGE_MAP(CT5Doc, CDocument)
	//{{AFX_MSG_MAP(CT5Doc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CT5Doc construction/destruction

CT5Doc::CT5Doc()
{
	// TODO: add one-time construction code here

}

CT5Doc::~CT5Doc()
{
}

BOOL CT5Doc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	((CEditView*)m_viewList.GetHead())->SetWindowText(NULL);

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CT5Doc serialization

void CT5Doc::Serialize(CArchive& ar)
{
	// CEditView contains an edit control which handles all serialization
	((CEditView*)m_viewList.GetHead())->SerializeRaw(ar);
}

/////////////////////////////////////////////////////////////////////////////
// CT5Doc diagnostics

#ifdef _DEBUG
void CT5Doc::AssertValid() const
{
	CDocument::AssertValid();
}

void CT5Doc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CT5Doc commands
