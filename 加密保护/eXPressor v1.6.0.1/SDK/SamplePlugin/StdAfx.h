// stdafx.h : include file for standard system include files,
//  or project specific include files that are used frequently, but
//      are changed infrequently
//

#if !defined(AFX_STDAFX_H__C3AE0364_E6D2_4C5C_A898_D35930D4417E__INCLUDED_)
#define AFX_STDAFX_H__C3AE0364_E6D2_4C5C_A898_D35930D4417E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


#include <windows.h>
////////////////////////////////////////////////////////////////////////////////////////
//WE WILL HAVE A VERY SMALL DLL BY DOING THIS :)
//ALSO CHECK THE PROJECT OPTIONS; WE HAVE SET OUR EP, AND IGNORE DEFAULTLIB
////////////////////////////////////////////////////////////////////////////////////////
#pragma comment(linker,"/FIXED:no")			//PRODUCE RELOCS
#pragma comment(linker,"/INCREMENTAL:no")	//GET RID OF "CC" PADDING
#pragma comment(linker,"/FILEALIGN:0x10")	//ALIGN FUNCTIONS ON 10 BYTES
#pragma comment(linker,"/merge:.rdata=.text")	//MERGE ALL SECTIONS IN A SINGLE ONE
#pragma comment(linker,"/merge:.idata=.text")	//..
#pragma comment(linker,"/merge:.data=.text")	//..
#pragma comment(linker,"/merge:.reloc=.text")	//..WON'tWORK for VC6


//DISABLE SOME WARNINGS
#pragma comment (linker, "/ignore:4078")

#endif // !defined(AFX_STDAFX_H__C3AE0364_E6D2_4C5C_A898_D35930D4417E__INCLUDED_)
