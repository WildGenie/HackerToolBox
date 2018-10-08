// ###################################
// #                                 #
// # UnPECompact 1.32 - by yoda      #
// #                                 #
// ###################################
// 
// You are allowed to use parts of this code if you mention my name.
// If you know how to do something better/easier then let me know please.
// This is my first Unpacker, so stop laughing :)
// HaVe PhUn !!!
//

#include "stdafx.h"
#include "resource.h"
#include "lib.h"
#include <commdlg.h>
#include <stdio.h>
#include <shellapi.h>

#pragma comment(linker,"/FILEALIGN:512 /MERGE:.rdata=.text /MERGE:.data=.text /SECTION:.text,EWR /IGNORE:4078")

// dll protos
typedef BYTE  (CALLBACK* _RebuildIT)(LPVOID pMem,DWORD dwMemSize,BYTE byRebuildMode);
typedef DWORD (CALLBACK* _RealignPE)(LPVOID AddressOfMapFile,DWORD dwFsize,BYTE byRealignMode);

// the functions
VOID    Err(char* Text);
VOID    Add(char* Text);
VOID    ConfirmClose();
VOID    StartUnpacking();
BOOL    CALLBACK DialogFunc(HWND hDlg, UINT uMsg, WPARAM wParam, LPARAM lParam);
VOID    ProcessRealign();
DWORD   SearchSign(DWORD StartVA);
void    HandleSearchResult(DWORD SearchResult);
DWORD   WINAPI Unpack(void*);
BOOL    NtPEFix(PVOID pMem, DWORD dwSize);

// constants
#define                 SEARCH_DONE                0
#define                 SEARCH_NOT_FOUND           1
#define                 SEARCH_WRITE_ERROR         2
#define                 SEARCH_NO_MEM              3
#define                 SEARCH_MEM_READ_ERROR      4

CONST CHAR*             szFineImpExts []         = { ".dll",
													 ".ocx",
													 ".exe",
													 ".bpl",
													 ".drv",
													 ".pak" };
CONST int	            FINE_IMP_EXT_NUM         = 6;
CONST int               MAX_DLL_NAME_LENGTH      = 40;

// variables
DWORD                   yodastamp     = 0x61646f79; // hey a trademark is a MUST :)
char*                   szPreFname    = "UNPEC.TMP";
char*					szPECsecname  = "pec1";
const int               iMaxBuffSize  = 8;
unsigned char           PEC_sign[iMaxBuffSize];
DWORD					SignSize;

DWORD					PEC_sign_1    = 0xC3; // RET
DWORD					PEC_sign_11   = 0xFF; // JMP EDI
DWORD                   SignSize_1    = 1;
unsigned char			PEC_sign_2[2] = {0xf3,0xa4}; // after this REPZ MOVSB ist the depackers
unsigned char			PEC_sign_21[2]= {0xeb,0x14};
unsigned char			PEC_sign_22[2]= {0xeb,0x26}; // around 1.69
unsigned char           PEC_sign_23[3]= {0xF3, 0xA4, 0xEB}; // ...0x12 - 1.55/1.65
int						SignSize_2    = 2;           // exitpoint attackable
int                     SignSize_23   = 3;
unsigned char           PEC_sign_3[4] = {0x61,0x9d,0x50,0x68}; // depackers exitpoint for
int                     SignSize_3    = 4;					   // the newer versions
unsigned char           PEC_sign_31[3]= {0x61,0x9d,0x68};      // and for the older versions
int						SignSize_31   = 3;
BYTE                    int3          = 0xCC;

_RebuildIT              RebuildIT;
char*					szDllName     = "rebIT.dll"; // sorry but I won't release the source
char*					szFunctName   = "RebuildIT"; // of rebIT.dll !!!
_RealignPE              RealignPE;
char*                   szRealignDll  = "realign.dll";
char*                   szRealignFunct= "RealignPE";
												

WORD                    wBuff;
OPENFILENAME			ofn;
HINSTANCE               hInst;
FILE*					out;
char                    *pCH,*szFileExt,*szStr;
HANDLE					hFile;
char					szFname[256],buff[256],cOrg,PreFnamePath[256];
HWND					hDlg_ = 0;
LPVOID					pMap,pTmpMem,pPreDump;
BOOL					IsPEC,STOP,Found,DUMPED,Unpacking,OldVersion,Realign,bTestStr;
DWORD					i,dwThreadID;
int						BPcount;
DWORD					SizeOfImage,ImageBase,EntryPoint,dwStat,dwCurrRVA,dwBytesWritten,OEP,
						dwTmpNum,dwBytesRead,dwMemSize,dwSignCount,dwCurrRVA2,dwNewFsize,dwFsize;
DWORD                   *pDW,*pDW2,what,dwNewITRVA,dwStrLen;
DEBUG_EVENT				dbevent;
PIMAGE_DOS_HEADER       pDosh;
PIMAGE_SECTION_HEADER   pSectionh;
PIMAGE_NT_HEADERS       pPeh;
PIMAGE_DATA_DIRECTORY   pDat;
PIMAGE_IMPORT_DESCRIPTOR pIID,pCoolIID;
STARTUPINFO				SI;
PROCESS_INFORMATION		PI;
CONTEXT                 Regs;
HINSTANCE               hLib,hReaLib,hRebLib;


int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow )
{
	WNDCLASS wc;

	Unpacking = FALSE;
	hInst = hInstance;

	// load the libraries
	// .. rebIT.dll
	hRebLib = LoadLibrary(szDllName);
	if (hRebLib)
		RebuildIT = (_RebuildIT)GetProcAddress(hRebLib,szFunctName);
	if (!RebuildIT || !hRebLib)
	{
		wsprintf(buff,"Couldn't find library: %s :(",szDllName);
		Err(buff);
		return -1;
	}

	// ... realign.dll
	hReaLib = LoadLibrary(szRealignDll);
	RealignPE = (_RealignPE)GetProcAddress(hReaLib,szRealignFunct);
	if (!hReaLib || !RealignPE)
	{
		wsprintf(buff,"Couldn't find library: %s :(",szRealignDll);
		Err(buff);
		return -1;
	}

	// initialize the ofn struct
	strcpy(szFname,lpCmdLine);
	ZeroMemory(&ofn,sizeof(ofn));
	ofn.lStructSize = sizeof(ofn);
	ofn.lpstrFile = szFname;
	ofn.nMaxFile = MAX_PATH;
	ofn.lpstrFilter = "Exe files\0*.exe\0";
	ofn.lpstrTitle = "Choose the protected file...";
	ofn.lpstrInitialDir = ".";
	ofn.nFilterIndex = 1;
	ofn.Flags = OFN_HIDEREADONLY;

	// show the dialogbox
	ZeroMemory(&wc,sizeof(wc));
	wc.lpfnWndProc = DefDlgProc;
	wc.cbWndExtra = DLGWINDOWEXTRA;
	wc.hInstance = hInstance;
	wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_ICON1));
	wc.hCursor = LoadCursor(NULL, IDC_ARROW);
	wc.hbrBackground = (HBRUSH)COLOR_WINDOW;
	wc.lpszClassName = "UnPECompact";
	RegisterClass(&wc);
 	DialogBox(hInstance,MAKEINTRESOURCE(IDD_DLG), NULL,DialogFunc);
	return 0;
}

VOID Err(char* Text)
{
	MessageBox(hDlg_,Text,"Shit!!",MB_ICONERROR | MB_TOPMOST);
	return;
}

VOID Add(char* Text)
{
	// show the text
	SendDlgItemMessage(hDlg_,IDC_LIST1,LB_ADDSTRING,0,(LPARAM)Text);
	// scroll down
	SendDlgItemMessage(hDlg_,IDC_LIST1,WM_VSCROLL,SB_LINEDOWN,NULL);
	return;
}

VOID ConfirmClose()
{
	if (!Unpacking)
		EndDialog(hDlg_,0);
	else
		if (IDYES == MessageBox(hDlg_,"You are in an unpacking session ! Exit anyway ?",
			"Confirmation",MB_ICONWARNING | MB_YESNO | MB_TOPMOST))
			EndDialog(hDlg_,0);
	return;
}

VOID StartUnpacking()
{
	SendDlgItemMessage(hDlg_,IDC_LIST1,LB_RESETCONTENT,0,0);
	SetDlgItemText(hDlg_,IDC_EDIT1,szFname);
	Unpacking = TRUE;
	CreateThread(NULL,0,Unpack,NULL,0,&dwThreadID);
	return;
}

BOOL CALLBACK DialogFunc(HWND hDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	HDROP hDrop;

	switch (uMsg)
	{
		case WM_INITDIALOG:
			hDlg_ = hDlg;
			DragAcceptFiles(hDlg,TRUE);
			SendMessage(
				hDlg,
				WM_SETICON,
				TRUE,
				(LPARAM)LoadIcon(hInst,MAKEINTRESOURCE(IDI_ICON1)));
			ofn.hwndOwner = hDlg;
			CheckDlgButton(hDlg,ID_CHECK1,BST_CHECKED); // enable the optimize button
			// process commandline parameters
			if (szFname[0] != 0)
				StartUnpacking();
			return TRUE;

		case WM_COMMAND:
			switch (LOWORD(wParam))
			{
				case IDOK:
					if (GetOpenFileName(&ofn))
						StartUnpacking();
					break;

				case IDCANCEL:
					ConfirmClose();
					break;
			}
			break;

		case WM_DROPFILES:
			hDrop = (HDROP)wParam;
			if (!Unpacking)
			{
				DragQueryFile(hDrop,0,szFname,sizeof(szFname));
				StartUnpacking();
			}
			DragFinish(hDrop);
			break;
	}
	return FALSE;
}

VOID ProcessRealign()
{
		if (IsDlgButtonChecked(hDlg_,ID_CHECK1))
		{
			dwNewFsize = RealignPE(pTmpMem,SizeOfImage,0);
			if (dwNewFsize < 10)
			{
				wsprintf(buff,"!!! Error while realigning :(");
				Add(buff);
				return;
			}
			Realign = TRUE;
		}
		return;
}

// searches bytes in memory
DWORD SearchSign(DWORD StartVA,
				 unsigned char TargetBytes[iMaxBuffSize],
				 DWORD Size,
				 int Correction) 
{
	// get the search values
	for(i=0;i<Size;i++)
		PEC_sign[i]=TargetBytes[i];
	SignSize = Size;

	dwMemSize = (ImageBase + SizeOfImage)-StartVA;
	// get some mem
	pTmpMem = GlobalAlloc(0,dwMemSize);
	if (!pTmpMem)
		return SEARCH_NO_MEM;
	// read the process memory into the allocated memory
	if (!ReadProcessMemory(PI.hProcess,(LPVOID)StartVA,pTmpMem, \
		dwMemSize,&dwBytesRead))
	{
		GlobalFree(pTmpMem);
		return SEARCH_MEM_READ_ERROR;
	}
	// search the PECompact Signature
	Add("-> Byte search in progress...");
	dwCurrRVA = StartVA-ImageBase;
	what      = 0;
	pCH = (char*)(DWORD)pTmpMem;
	do
	{
		if (*pCH == (char)PEC_sign[what])
			++what;
		else what = 0;
		++dwCurrRVA;
		++pCH;
	} while ((what != SignSize) && (dwCurrRVA < SizeOfImage));
	if (what != SignSize) // did we find something ?
	{
		GlobalFree(pTmpMem);
		Add("-> Search String not found...");
		return SEARCH_NOT_FOUND;
	}
	dwCurrRVA += ImageBase-SignSize;
	dwCurrRVA += Correction;
	wsprintf(buff,"-> Setting BP at 0x%X...",dwCurrRVA);
	Add(buff);
	// save the orignal byte
	ReadProcessMemory(PI.hProcess,(LPVOID)dwCurrRVA,&cOrg,1,&dwBytesRead);
	// write an int3 !!!
	if (!WriteProcessMemory(PI.hProcess,(LPVOID)dwCurrRVA,&int3,1,&dwBytesWritten))
	{
		GlobalFree(pTmpMem);
		return SEARCH_WRITE_ERROR;
	}
	GlobalFree(pTmpMem);
	return SEARCH_DONE;
}

void HandleSearchResult(DWORD SearchResult)
{
	switch (SearchResult)
	{
	case SEARCH_DONE:
		break;

	case SEARCH_NO_MEM:
		STOP = TRUE;
		Add("!!! Error while allocating Memory :( Aborting...");
		break;

	case SEARCH_MEM_READ_ERROR:
		STOP = TRUE;
		Add("!!! Error while reading process memory :( Aborting...");
		break;

	case SEARCH_NOT_FOUND:
		STOP = TRUE;
		Add("!!! Couldn't find PECompact Signature :( Aborting...");
		break;

    case SEARCH_WRITE_ERROR:
		STOP = TRUE;
		Add("!!! Error while writing into the process memory :(");
		break;
	}
	return;
}

DWORD WINAPI Unpack(void*)
{
	HANDLE  hFile;
	DWORD   dwSRes;


	// get the file size
	dwFsize = GetFsize(szFname);

	// map the file to check whether it's a PE file
	pMap =MapFileR(szFname);
	if (!pMap)
	{
		Err("Error while mapping file !");
		Unpacking = FALSE;
		return 0;
	}
	if (!IsPE(pMap))
	{
		Err("Invalid PE file !");
		Unpacking = FALSE;
		UnmapViewOfFile(pMap);
		return 0;
	}
	pDosh     = (PIMAGE_DOS_HEADER)pMap;
	pPeh      = (PIMAGE_NT_HEADERS)((DWORD)pMap+pDosh->e_lfanew);

	// check whether the file is PECompact protected
	pSectionh = (PIMAGE_SECTION_HEADER)((DWORD)pDosh+pDosh->e_lfanew+0xf8);
	if (*(char*)pSectionh->Name != *szPECsecname)
		if (MessageBox(0,"This file doesn't seem to be packed with PECompact !\nContinue anyway ?",
			"missing signature",MB_ICONERROR | MB_TOPMOST | MB_YESNO) == IDNO)
		{
			Unpacking = FALSE;
			return 0;
		}

	// get some infos
	ImageBase   = pPeh->OptionalHeader.ImageBase;
	SizeOfImage = pPeh->OptionalHeader.SizeOfImage;
	EntryPoint  = pPeh->OptionalHeader.AddressOfEntryPoint;
	UnmapViewOfFile(pMap);

	/* predump the file */
	// maybe we need its FirstThunk array later to rebuild the ImportTable
	GetTempPath(sizeof(PreFnamePath),PreFnamePath); // get the temp directory
	pCH = PreFnamePath;
	pCH = strcat(pCH,szPreFname);
	strcpy(PreFnamePath,pCH);
	ZeroMemory(&SI,sizeof(STARTUPINFO));
	ZeroMemory(&PI,sizeof(PROCESS_INFORMATION));
	SI.cb = sizeof(STARTUPINFO);
	if (!CreateProcess(szFname,NULL,NULL,NULL,FALSE,NORMAL_PRIORITY_CLASS, \
		NULL,NULL,&SI,&PI))
	{
		Err("Error while creating process !");
		Unpacking = FALSE;
		return 0;
	}
	WaitForInputIdle(PI.hProcess,INFINITE);
	SuspendThread(PI.hThread); // hopefully it doesn't exit before we dump !!!
	pTmpMem = GlobalAlloc(0,SizeOfImage);
	Add("-> Predumping...");
	if (!ReadProcessMemory(PI.hProcess,(LPVOID)ImageBase,pTmpMem,SizeOfImage,&dwBytesRead))
	{
		Unpacking = FALSE;
		GlobalFree(pTmpMem);
		TerminateProcess(PI.hProcess,0);
		Err("Error while reading process memory !");
		return 0;
	}
	out = fopen(PreFnamePath,"wb"); // write the process memory into a temp file
	fwrite(pTmpMem,1,SizeOfImage,out);
	fclose(out);
	// clean up
	GlobalFree(pTmpMem);
	TerminateProcess(PI.hProcess,0);
	Sleep(100);
	// predump done

	SetForegroundWindow(hDlg_); // set the focus on our window

	/* start the debuggee process */
	ZeroMemory(&SI,sizeof(STARTUPINFO));
	ZeroMemory(&PI,sizeof(PROCESS_INFORMATION));
	SI.cb = sizeof(STARTUPINFO);
	if (!CreateProcess(szFname,NULL,NULL,NULL,FALSE,DEBUG_PROCESS | DEBUG_ONLY_THIS_PROCESS, \
		NULL,NULL,&SI,&PI))
	{
		Err("Error while creating process !");
		Unpacking = FALSE;
		return 0;
	}
	// initialize some variables
	STOP = FALSE;
	BPcount = 0;
	dwSignCount = 0;
	Found = FALSE;
	OldVersion = FALSE;
	DUMPED = FALSE;
	Realign = FALSE;

	while (WaitForDebugEvent(&dbevent,INFINITE)) // DEBUG LOOP
	{
		dwStat = DBG_CONTINUE;
		switch(dbevent.dwDebugEventCode)
		{
		case EXCEPTION_DEBUG_EVENT:
			switch(dbevent.u.Exception.ExceptionRecord.ExceptionCode)
			{
			case EXCEPTION_BREAKPOINT: // an int3 (0xCC) was found
				dwStat = DBG_CONTINUE;
				++BPcount;
				Regs.ContextFlags = CONTEXT_CONTROL;
				GetThreadContext(PI.hThread,&Regs);
				switch(BPcount)
				{
				case 1: // the process doesn't really start up to now
					// set a nice BP at the EntryPoint 
					dwTmpNum = EntryPoint+ImageBase;
					ReadProcessMemory(PI.hProcess,(LPVOID)dwTmpNum,&cOrg,1,&dwBytesRead);
					if (!WriteProcessMemory(PI.hProcess,(LPVOID)dwTmpNum,&int3,1,&dwBytesWritten))
					{
						Add("!!! Error while writing into the process memory :(");
						STOP = TRUE;
					}
					break;

				case 2: // we are at the entrypoint
					// restore the old byte and execute it
					Regs.Eip -= 1;
					wsprintf(buff,"-> Entrypoint reached -  0x%X...",Regs.Eip);
					Add(buff);
					if (!WriteProcessMemory(PI.hProcess,(LPVOID)Regs.Eip,&cOrg,1,&dwBytesWritten))
					{
						Add("!!! Error while writing into the process memory :(");
						STOP = TRUE;
						break;
					}
					Regs.EFlags = Regs.EFlags | 0x100; // set the trap flag
					SetThreadContext(PI.hThread,&Regs);
					Add("-> Tracing started...");
					break;

				case 3: // BP after the rep movsb which makes the depackers exitpoint attackable
					// restore the old byte and execute it
					Regs.Eip -= 1;
					wsprintf(buff,"-> BP reached -  0x%X...",Regs.Eip);
					Add(buff);
					if (!WriteProcessMemory(PI.hProcess,(LPVOID)Regs.Eip,&cOrg,1,&dwBytesWritten))
					{
						Add("!!! Error while writing into the process memory :(");
						STOP = TRUE;
						break;
					}
					SetThreadContext(PI.hThread,&Regs); // save the new EIP
					// Search the depackers exit point !!!
					dwSRes = SearchSign(Regs.Eip,PEC_sign_3,SignSize_3,0);
					if (dwSRes != SEARCH_DONE)
					{
						OldVersion = TRUE;
						dwSRes = SearchSign(Regs.Eip,PEC_sign_31,SignSize_31,0);
						if (dwSRes != SEARCH_DONE)
							HandleSearchResult(dwSRes);
					}
					break;

				case 4:
					// now we should be at the depackers exit point >:) !!!!!
					// get the orignal entry point:
					// read the last 4 bytes of the push (68XXXXXXXX)
					dwTmpNum = (DWORD)Regs.Eip;
					if (OldVersion)
						dwTmpNum += 2;
						else
						dwTmpNum += 3;
					if (!ReadProcessMemory(PI.hProcess,(LPVOID)dwTmpNum,&OEP,4,&dwBytesWritten))
					{
						Add("!!! Error while reading process memory :(");
						STOP = TRUE;
						break;
					}
					wsprintf(buff,"-> Original Entrypoint: 0x%X...",OEP);
					Add(buff);
					// dump the whole process
					pTmpMem = GlobalAlloc(0,SizeOfImage);
					if (!pTmpMem)
					{
						STOP = TRUE;
						Add("!!! Error while allocating memory :(");
						break;
					}
					Add("-> Dumping process...");
					if (!ReadProcessMemory(PI.hProcess,(LPVOID)ImageBase,pTmpMem,SizeOfImage, \
						&dwBytesRead))
					{
						STOP = TRUE;
						Add("!!! Error while reading process memory :(");
						GlobalFree(pTmpMem);
						break;
					}			
					DUMPED = TRUE;
					STOP = TRUE;
					break;
				}
				break;

			case EXCEPTION_SINGLE_STEP: // we are tracing
				dwStat = DBG_CONTINUE;
				Regs.ContextFlags = CONTEXT_CONTROL;
				GetThreadContext(PI.hThread,&Regs);
				if (Found == TRUE)
				{
					dwSRes = SearchSign(Regs.Eip - 0x100, PEC_sign_23, SignSize_23, 0);
					if (dwSRes != SEARCH_DONE)
						dwSRes = SearchSign(Regs.Eip - 0x100, PEC_sign_22, SignSize_2, 0);
					if (dwSRes != SEARCH_DONE)
						dwSRes = SearchSign(Regs.Eip-0x100,PEC_sign_21,SignSize_2,0);					
					if (dwSRes != SEARCH_DONE)
					{
						dwSRes = SearchSign(Regs.Eip-0x100,PEC_sign_2,SignSize_2,2);
						if (dwSRes != SEARCH_DONE)
							HandleSearchResult(dwSRes);
					}
					break;
				}
				// set always the trap flag
				Regs.EFlags = Regs.EFlags | 0x100;
				SetThreadContext(PI.hThread,&Regs);
				// look for the signature
				if (!ReadProcessMemory(PI.hProcess,(LPVOID)Regs.Eip,&wBuff,SignSize_1,&dwBytesRead))
					break;
				if (wBuff == PEC_sign_1 || wBuff == PEC_sign_11)
					Found = TRUE;					
				break;	
			}
			break;

		case EXIT_PROCESS_DEBUG_EVENT: // the debuggee exits
			Add("!!! Debuggee exits :(");
			STOP = TRUE;
			break;
		}
		if (!STOP)
		{
			ContinueDebugEvent(dbevent.dwProcessId,dbevent.dwThreadId,dwStat);
		}
		else break;
	} // end of the Debug loop


	if (DUMPED)
	{
		// rebuild the file
		Add("-> Rebuilding (this could take a minute)...");
		pDosh = (PIMAGE_DOS_HEADER)(pTmpMem);
		pPeh  = (PIMAGE_NT_HEADERS)((DWORD)pDosh+pDosh->e_lfanew);
		pSectionh = (PIMAGE_SECTION_HEADER)((DWORD)pDosh+pDosh->e_lfanew+0xf8);
		pDat = (PIMAGE_DATA_DIRECTORY)((DWORD)pDosh+pDosh->e_lfanew+0x80);

		// fix the section header
		for(i=0;i<pPeh->FileHeader.NumberOfSections;i++)
		{
			pSectionh->PointerToRawData = pSectionh->VirtualAddress;
			pSectionh->SizeOfRawData = pSectionh->Misc.VirtualSize;
			++pSectionh;
		}
		// set the OEP
		pPeh->OptionalHeader.AddressOfEntryPoint = OEP-ImageBase;

		// - search the old Import Table -
		// I search in the file for a dll name and then
		// I search the Address of the dll name - it's a
		// a part of the old Image Import Descriptor
		pCH = (char*)pTmpMem;
		pIID = NULL;
		for(dwCurrRVA=0; dwCurrRVA<SizeOfImage; dwCurrRVA++)
		{
			if (*pCH > 30)
			{
				dwStrLen = lstrlen(pCH);
				if (dwStrLen < 40)
				{
					// check the file extension
					bTestStr = FALSE;
					szFileExt = (CHAR*)&pCH[dwStrLen - 4];
					for (i=0; i < FINE_IMP_EXT_NUM; i++)
						if (lstrcmpi(szFileExt,szFineImpExts[i]) == 0)
							bTestStr = TRUE;
					if(bTestStr)
						if (LoadLibrary(pCH) != NULL)
							{		
								pDW = (DWORD*)pTmpMem;
								for(dwCurrRVA2=0; dwCurrRVA2<SizeOfImage; dwCurrRVA2++)
								{
									dwTmpNum = *pDW;
									if (dwTmpNum == dwCurrRVA)
									{
										// we found a name pointer of an ImageImportDescriptor
										// check whether it's the first IID
										pIID = (PIMAGE_IMPORT_DESCRIPTOR)((DWORD)pTmpMem+dwCurrRVA2-12);
										while(TRUE)
										{
											--pIID;
											szStr = (char*)(DWORD)pTmpMem+pIID->Name;
											if (IsBadStringPtr(szStr,MAX_DLL_NAME_LENGTH))
												break;
											if (LoadLibrary(szStr) == NULL)
												break;
										}
										++pIID;					
										if ((pIID->OriginalFirstThunk < SizeOfImage) &&  // some more checking
											(pIID->FirstThunk < SizeOfImage))
											if (((DWORD)pIID-(DWORD)pTmpMem) != pDat->VirtualAddress)
												goto Done;
									}
									pDW = (DWORD*)((DWORD)pTmpMem+dwCurrRVA2+1);
								}
							}
				}
			}
			++pCH;
		}

	Done:
		// get the new IT address
		dwNewITRVA = (DWORD)pIID-(DWORD)pTmpMem;
		if (pIID == NULL)
			goto rebIATdone;

		if (pIID->OriginalFirstThunk == 0 ||         // then we really have to rebuild the IAT :)
			IsDlgButtonChecked(hDlg_,IDC_FORCEIATREB))
		{
			/* IAT rebuilding */
			// fix the fake firstthunk arrays with the one of the predumped file
			pPreDump = MapFileR(PreFnamePath); // map the predumped file
			if (pPreDump == NULL)
			{
				GlobalFree(pTmpMem);
				Add("!!! Error while rebuilding Import Table :(");
				goto rebIATdone;
			}
			pCoolIID = (PIMAGE_IMPORT_DESCRIPTOR)((DWORD)pPreDump + dwNewITRVA);
			// ACCESS !!! :)
			while (pIID->FirstThunk != 0) // for each dll import
			{
				pDW  = (DWORD*)((DWORD)pTmpMem  + pIID->FirstThunk);
				pDW2 = (DWORD*)((DWORD)pPreDump + pCoolIID->FirstThunk);
				while (*pDW != 0) // for each member of the current firstthunk array
				{
					*pDW = *pDW2;
					++pDW;
					++pDW2;
				}
				pIID->OriginalFirstThunk = 0;		// needed if IAT reb is forced
				++pIID;
				++pCoolIID;
			}
			// we use my rebIT.dll to rebuild the IAT
			RebuildIT(pTmpMem,SizeOfImage,0);
			// clean up
			UnmapViewOfFile(pPreDump);
			goto rebIATdone;
		}
		
		/* lame IAT rebuilding */
		// check whether the IAT is corrupted
		// (PECompact subtracts sometimes 2 from each entry of the OriginalFirstThunk array)
		pDat->VirtualAddress = dwNewITRVA;
		pDW = (DWORD*)*(DWORD*)((DWORD)pTmpMem+pIID->OriginalFirstThunk);
		if (((DWORD)pDW >= 0x80000000) && ((DWORD)pDW <= 0x8000ffff)) // ordinal import -> IAT not corrupted
			goto rebIATdone;
		pCH = (char*)((DWORD)pTmpMem+(DWORD)pDW+2);
	    //pCH points now to the name of the imported by name struct
	
		if (hLib = LoadLibrary ((char*)(DWORD)pTmpMem+pIID->Name))			
			if (!GetProcAddress(hLib,pCH)) // rebuild the Import Address Table
			while (pIID->FirstThunk != 0) // for each dll import
			{
				pDW = (DWORD*)((DWORD)pTmpMem+pIID->OriginalFirstThunk);
				while (*pDW != 0) // for each member of the current originalfirstthunk array
				{
					*pDW = ((DWORD)*pDW-2);
					++pDW;
				}
				pIID->ForwarderChain = 0;
				pIID->TimeDateStamp  = 0;
				++pIID;
			}

	rebIATdone:
		// set a nice trademark :P
		pPeh->FileHeader.TimeDateStamp = yodastamp;

		// set the pointer to symbol table to 0 (PECompact trademark)
		pPeh->FileHeader.PointerToSymbolTable = 0;

		// realign the file if wanted
		ProcessRealign();

		if (Realign)
			NtPEFix(pTmpMem,dwNewFsize);
		else
			NtPEFix(pTmpMem,SizeOfImage);

		// save the file
		strcpy(szFname,"unpacked.exe");
		ofn.lpstrTitle = "Save to...";
		ofn.lpstrFilter = "exe files\0*.exe\0\0";
		if (GetSaveFileName(&ofn))
		{
			out = fopen(szFname,"wb");
			fwrite(pTmpMem,1,SizeOfImage,out);
			fclose(out);
		}
		if (Realign)
		{
			// force the new filesize
			Sleep(50);
			hFile = CreateFile (szFname, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, \
				NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
			if (hFile != INVALID_HANDLE_VALUE)
			{
				SetFilePointer(hFile,dwNewFsize,NULL,FILE_BEGIN);
				SetEndOfFile(hFile);
				CloseHandle(hFile);
			}
			else
			{
				wsprintf(buff,"!!! Error while setting the new filesize :(");
				Add(buff);
			}
		} // end of Realign

		GlobalFree(pTmpMem);
		Add("-> DONE");
	}

	// clean up
	TerminateProcess(PI.hProcess,0);
	CloseHandle(PI.hProcess);
	CloseHandle(PI.hThread);
	DeleteFile(PreFnamePath); // delete the predumped file
	Unpacking = FALSE;
	szFname[0] = 0;
	return 0;
}

BOOL NtPEFix(PVOID pMem, DWORD dwSize)
{
	PIMAGE_DOS_HEADER       pDosh;
	PIMAGE_NT_HEADERS       pNTh;
	PIMAGE_SECTION_HEADER   pSech,pSh;//,pLastSh;
	int	                    i;
	DWORD                   dwSmallestRO,dwNewVS,dwCorrSoI;//,dwRawEnd;

	// get PE base information
	pDosh = (PIMAGE_DOS_HEADER)pMem;
	if (pDosh->e_magic != IMAGE_DOS_SIGNATURE)
		return FALSE;
	pNTh = (PIMAGE_NT_HEADERS)((DWORD)pDosh + pDosh->e_lfanew);
	if (pNTh->Signature != IMAGE_NT_SIGNATURE)
		return FALSE;
	pSech = (PIMAGE_SECTION_HEADER)((DWORD)pNTh + 0xF8);

	// FIX:
	// ... the SizeOfHeaders
	pSh = pSech;
	dwSmallestRO = 0xFFFFFFFF;
	for(i=0; i < pNTh->FileHeader.NumberOfSections; i++)
	{
		if (pSh->PointerToRawData < dwSmallestRO)
			dwSmallestRO = pSh->PointerToRawData;
		++pSh;
	}
	pNTh->OptionalHeader.SizeOfHeaders = dwSmallestRO;

	// ...Virtual Sizes of the Section Header
	pSh = pSech;
	for(i=0; i < pNTh->FileHeader.NumberOfSections - 1; i++)
	{
		++pSh;
		dwNewVS = pSh->VirtualAddress;
		--pSh;
		dwNewVS -= pSh->VirtualAddress;
		pSh->Misc.VirtualSize = dwNewVS;
		++pSh;
	}

	// ...SizeOfImage
	pSh = pSech;
	dwCorrSoI = 0;
	for(i=0; i < pNTh->FileHeader.NumberOfSections; i++)
	{
		if ((pSh->VirtualAddress + pSh->Misc.VirtualSize) > dwCorrSoI)
			dwCorrSoI = pSh->VirtualAddress + pSh->Misc.VirtualSize;
		++pSh;
	}
	pNTh->OptionalHeader.SizeOfImage = dwCorrSoI;

	// ...RawSize of the last section
	/*
	pLastSh = NULL;
	dwRawEnd = 0;
	pSh = pSech;
	for (i=0; i < pNTh->FileHeader.NumberOfSections; i++)
	{
		if (pSh->PointerToRawData + pSh->SizeOfRawData > dwRawEnd)
		{
			pLastSh = pSh;
			dwRawEnd = pSh->SizeOfRawData + pSh->PointerToRawData;
		}
		++pSh;
	}
	pLastSh->SizeOfRawData = dwSize - pLastSh->PointerToRawData;
	*/

	return TRUE;
}