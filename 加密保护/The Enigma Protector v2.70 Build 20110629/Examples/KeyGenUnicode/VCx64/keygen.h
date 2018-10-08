// keygen.h : main header file for the KEYGEN application
//

#if !defined(AFX_KEYGEN_H__7FFAF736_2FBD_4C25_AED6_0F3CD2468E92__INCLUDED_)
#define AFX_KEYGEN_H__7FFAF736_2FBD_4C25_AED6_0F3CD2468E92__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CKeygenApp:
// See keygen.cpp for the implementation of this class
//

class CKeygenApp : public CWinApp
{
public:
	CKeygenApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeygenApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CKeygenApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYGEN_H__7FFAF736_2FBD_4C25_AED6_0F3CD2468E92__INCLUDED_)
