
#if !defined(AFX_EXAMPLE_H__90A41CE5_EE7C_4105_8AEF_E63603ED11C9__INCLUDED_)
#define AFX_EXAMPLE_H__90A41CE5_EE7C_4105_8AEF_E63603ED11C9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"	


class CExampleApp : public CWinApp
{
public:
	CExampleApp();


	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CExampleApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

	//{{AFX_MSG(CExampleApp)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


#endif 