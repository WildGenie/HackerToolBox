#pragma once
#include "KByS.h"
#include "erika.h"
///////////////////////////////////////////////////////////////
HWND		hWnd;
HICON		hIcon;
HINSTANCE	hInst;
BOOL		bChinese;
char		szMessage[32];

///////////////////////////////////////////////////////////////
char		szFileName[MAX_PATH];             //加壳的文件名
LPBYTE		MapOfFile;                        //整个文件
LPBYTE		MapOfOverlay;                     //附加数据
DWORD		SizeOfOverlay;                    //附加数据大小
///////////////////////////////////////////////////////////////
IMAGE_NT_HEADERS32*		PE;                   //PE头
IMAGE_SECTION_HEADER*	SH;                   //区段信息指针
BOOL		bDLL;                             //是否是dll

void SetMainText(BOOL bChs)
{
	if (bChs)
	{
		SetDlgItemText(hWnd, IDC_INFO, "\r\n\r\n 测试版本! 将目标拖进来即可, 欢迎反馈结果.");
		SendMessage(hWnd, WM_SETTEXT, (WPARAM)0, (LPARAM)"Upx静态脱壳机 ver0.3");
	}
	else
	{
		SetDlgItemText(hWnd, IDC_INFO, "\r\n\r\nTesting Version! drag file here, bug report is welcome.");
		SendMessage(hWnd, WM_SETTEXT, (WPARAM)0, (LPARAM)"Upx Unpacker");
	}
	bChinese = bChs;
}

int CALLBACK DlgProc(HWND hDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	switch (uMsg)
	{
	case WM_CLOSE:
		PostQuitMessage(0);
		break ;
		
	case WM_INITDIALOG:
		hWnd = hDlg;
		hIcon = LoadIcon(hInst, MAKEINTRESOURCE(102));
		SendMessage(hWnd, WM_SETICON, (WPARAM)TRUE, (LPARAM)hIcon);	
		SendMessage(GetDlgItem(hWnd, IDC_CHINESE), BM_SETCHECK, BST_CHECKED, 0);
		
		SetMainText(TRUE);
		break ;

	case WM_DROPFILES:
		if (DragQueryFile((HDROP)wParam, 0, szFileName, MAX_PATH))
		{
			KByS();
			SetDlgItemText(hWnd, IDC_KBYS, szMessage);
		}
		break;
		/*
	case WM_LBUTTONDOWN:
		if (bChinese)
		{
			SetDlgItemText(hWnd, IDC_INFO, "           堀北压缩\r\n\r\n1. 压缩资源\r\n2. 清除重定位表\r\n3. 保留附加数据\r\n4. 支持壳上壳\r\n5. 将文件拽进来即可");
			bChinese = FALSE;
		}
		else
		{
			SetDlgItemText(hWnd, IDC_INFO, "        KByS Packer\r\n\r\n1. compress RSRC\r\n2. clear relocations\r\n3. reserve extra data\r\n4. support pack repeat\r\n5. drag file here");
			bChinese = TRUE;
		}
		break ;
		*/
	case WM_COMMAND:
		switch (wParam)
		{
		case IDC_CHINESE:
			SetMainText(TRUE);
			break ;
		case IDC_ENGLISH:
			SetMainText(FALSE);
			break ;
		default:
			break ;
		}


	default:
		break;
	}

	return 0;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
{
	InitCommonControls();
	hInst = hInstance;
	DialogBox(hInst, MAKEINTRESOURCE(IDD_KBYS), NULL, (DLGPROC)DlgProc);

	return 0;
}

