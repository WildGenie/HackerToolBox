#ifndef _KBYS_H_
#define _KBYS_H_
#pragma once
#include <windows.h>
#include <commctrl.h>
#include "resource.h"

#pragma comment (linker, "/subsystem:windows")
#pragma comment (lib, "comctl32")

extern HWND		hWnd;
extern HICON		hIcon;
extern HINSTANCE	hInst;
extern BOOL		bChinese;
extern char		szMessage[32];

///////////////////////////////////////////////////////////////
extern char		szFileName[MAX_PATH];             //加壳的文件名
extern LPBYTE		MapOfFile;                        //整个文件
extern LPBYTE		MapOfOverlay;                     //附加数据
extern DWORD		SizeOfOverlay;                    //附加数据大小
///////////////////////////////////////////////////////////////
extern BOOL		bDLL;                             //是否是dll

#endif //_KBYS_H_

