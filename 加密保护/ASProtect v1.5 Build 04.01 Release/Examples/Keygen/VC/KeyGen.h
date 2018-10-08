// KeyGen.h : main header file for the KEYGEN application
//

#if !defined(AFX_KEYGEN_H__D8894BD5_999C_48DC_8D1F_0FD5C61C6D55__INCLUDED_)
#define AFX_KEYGEN_H__D8894BD5_999C_48DC_8D1F_0FD5C61C6D55__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CKeyGenApp:
// See KeyGen.cpp for the implementation of this class
//

class CKeyGenApp : public CWinApp
{
public:
	CKeyGenApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeyGenApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CKeyGenApp)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYGEN_H__D8894BD5_999C_48DC_8D1F_0FD5C61C6D55__INCLUDED_)
