// LeftView.cpp : implementation of the CLeftView class
//

#include "stdafx.h"
#include "T5.h"

#include "T5Doc.h"
#include "LeftView.h"
#include "TestConfig.h"

//如果你想包含SDK 的代码，需要添加这个头文件
#include "ShareI.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#ifdef OutputDebugString
#undef OutputDebugString
#define  OutputDebugString  DebugStringOutPut
#endif
 

IMPLEMENT_DYNCREATE(CLeftView, CTreeView)

BEGIN_MESSAGE_MAP(CLeftView, CTreeView)
	//{{AFX_MSG_MAP(CLeftView)
	ON_NOTIFY_REFLECT(NM_DBLCLK, OnDblclk)
	//}}AFX_MSG_MAP
	// Standard printing commands
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLeftView construction/destruction

CLeftView::CLeftView()
{
	// TODO: add construction code here

}

CLeftView::~CLeftView()
{
}

BOOL CLeftView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs
    cs.style |= TVS_HASLINES |TVS_LINESATROOT |TVS_HASBUTTONS |TVS_SHOWSELALWAYS ;
	return CTreeView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CLeftView drawing

void CLeftView::OnDraw(CDC* pDC)
{
	CT5Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	// TODO: add draw code for native data here
}

void CLeftView::OnInitialUpdate()
{
	CTreeView::OnInitialUpdate();
    CTreeCtrl & ctrl = GetTreeCtrl();

    HTREEITEM hRoot = ctrl.InsertItem("测试项");
    int nItemNum = sizeof(test_item) / sizeof(test_item[0]);
    for(int i = 0 ;i < nItemNum ; i ++)
    {
        HTREEITEM  hTempItem ;
        hTempItem = ctrl.InsertItem(test_item[i].pstrFunName ,hRoot);
        test_item[i].item = hTempItem;
    }
    ctrl.SetBkColor(BK_COLOR);
}

/////////////////////////////////////////////////////////////////////////////
// CLeftView diagnostics

#ifdef _DEBUG
void CLeftView::AssertValid() const
{
	CTreeView::AssertValid();
}

void CLeftView::Dump(CDumpContext& dc) const
{
	CTreeView::Dump(dc);
}

CT5Doc* CLeftView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CT5Doc)));
	return (CT5Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CLeftView message handlers

void CLeftView::OnDblclk(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
    CPoint pt;
    GetCursorPos( &pt );  
    GetTreeCtrl().ScreenToClient( &pt );
    HTREEITEM hT = GetTreeCtrl().HitTest( pt, NULL );
    if( hT )
    {
        int nItemNum = sizeof(test_item) / sizeof(test_item[0]);
        for(int i = 0 ;i < nItemNum ; i ++)
        {
            if(test_item[i].item == hT)
            {
                test_item[i].Func();
            }
        }
    }
    
	*pResult = 0;
}
