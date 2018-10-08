// stdafx.cpp : source file that includes just the standard includes
//	T5.pch will be the pre-compiled header
//	stdafx.obj will contain the pre-compiled type information

#include "stdafx.h"
#include "MainFrm.h"
#include "T5.h"

#include "T5Doc.h"
#include "T5View.h"

void DebugStringOutPut(CString strAppend)
{
    CMainFrame * pMainFrame = (CMainFrame *)AfxGetMainWnd();
    if(pMainFrame)
    {
        CT5View * pEditView = (CT5View * )pMainFrame->GetEditView();
        if(pEditView)
        {
            pEditView->ApendString(strAppend);
        }
    }
}