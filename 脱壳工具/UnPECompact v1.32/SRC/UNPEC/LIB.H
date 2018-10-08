
#include <windows.h>
#include <commdlg.h>

const  BYTE   Int3  = 0xCC;

// functions
LPVOID MapFileR(char * targetfile);   // maps a file into memory with read access
LPVOID MapFileRW(char * targetfile);  // maps a file into memory with read and write access
BOOL IsPE (LPVOID MapAddress);        // checks whether a file is a valid PE file
DWORD GetFsize(PSTR szTargetFile);    // returns the filesize
VOID ShowLastError();                 // does the GetLastError,... shit
VOID MakeOfn(OPENFILENAME &TMPofn);   // initializes a OPENFILENAME struct
int mb(char* Title,char* Text,int Style); // easier MessageBox
DWORD MakeReverseOrder(DWORD dwNum);  // does what it's named like


LPVOID MapFileR(char * targetfile)
{
	HANDLE   hFile,hFileMap;
	LPVOID   pMappedFile;
	
	hFile = CreateFile ( targetfile, GENERIC_READ,FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
	if (hFile == INVALID_HANDLE_VALUE)
	{
		return NULL;
	}
	hFileMap = CreateFileMapping (hFile, NULL, PAGE_READONLY, 0, 0,NULL);
	if (!hFileMap)
	{
		CloseHandle (hFile);
		return NULL;
	}
	pMappedFile = MapViewOfFile ( hFileMap, FILE_MAP_READ, 0, 0, 0);
	if (!pMappedFile)
	{
		CloseHandle (hFileMap);
		CloseHandle (hFile);
		return NULL;
	}
	CloseHandle(hFileMap);
	CloseHandle(hFile);
	return pMappedFile;
}

LPVOID MapFileRW(char * targetfile)
{
	HANDLE   hFile,hMap;
	LPVOID   pMap;

	hFile = CreateFile ( targetfile, GENERIC_READ | GENERIC_WRITE, \
		FILE_SHARE_READ | FILE_SHARE_WRITE,	NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
	if (hFile == INVALID_HANDLE_VALUE)
	{
		return NULL;
	}
	hMap = CreateFileMapping (hFile, NULL, PAGE_READWRITE, 0, 0,NULL);
	if (!hMap)
	{
		CloseHandle (hFile);
		return NULL;
	}
	pMap = MapViewOfFile ( hMap, FILE_MAP_READ | FILE_MAP_WRITE, 0, 0, 0);
	CloseHandle(hMap);
	CloseHandle(hFile);
	if (!pMap)
		return NULL;
	return pMap;
}

BOOL IsPE (LPVOID MapAddress)
{
	PIMAGE_DOS_HEADER pDosh;
	PIMAGE_NT_HEADERS pPeh;

	if (MapAddress == NULL)
		return FALSE;
	pDosh = (PIMAGE_DOS_HEADER)MapAddress;
	if (pDosh->e_magic != IMAGE_DOS_SIGNATURE)
		return FALSE;
	pPeh = (PIMAGE_NT_HEADERS)((DWORD)pDosh + pDosh->e_lfanew);
	if (pPeh->Signature != IMAGE_NT_SIGNATURE)
		return FALSE;
	return TRUE;
}

DWORD GetFsize(PSTR szTargetFile)
{
	HANDLE   hFile;

	hFile = CreateFile (szTargetFile, GENERIC_READ,FILE_SHARE_READ, NULL, OPEN_EXISTING, \
		               FILE_ATTRIBUTE_NORMAL, 0);
	if (hFile == INVALID_HANDLE_VALUE)
	{
		return 0xFFFFFFFF;
	}
	return GetFileSize(hFile,0);
}

VOID ShowLastError()
{
	PSTR lpMsgBuf;
    
    FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | 
		          FORMAT_MESSAGE_IGNORE_INSERTS,NULL,GetLastError(),MAKELANGID(LANG_NEUTRAL, \
				  SUBLANG_DEFAULT),(LPTSTR) &lpMsgBuf,0,NULL);
	MessageBox(0,(PSTR)lpMsgBuf,"LastError:",0);
	LocalFree(lpMsgBuf);
	return;
}

VOID MakeOfn(OPENFILENAME &TMPofn)
{
	ZeroMemory(&TMPofn,sizeof(TMPofn));
	TMPofn.Flags = OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST | OFN_HIDEREADONLY;
	TMPofn.lpstrTitle = "Choose a file...";
	TMPofn.nMaxFile = 256;
	TMPofn.nFilterIndex = 1;
	TMPofn.lpstrInitialDir = ".";
	TMPofn.lpstrFilter = "any file\0*.*\0\0";
	TMPofn.lStructSize = sizeof(TMPofn);
	return;
}

int mb(char* Title,char* Text = "Info",int Style = 0)
{
	return MessageBox(0,Title,Text,Style);
}

DWORD MakeReverseOrder(DWORD dwNum)
{
	PBYTE    pByOld,pByNew;
	DWORD    dwNiceNum;
	int      i;

	pByOld = (PBYTE)&dwNum;
	pByNew = (PBYTE)&dwNiceNum+3;
	for(i=0; i<4; i++)
		*pByNew-- = *pByOld++;

	return dwNiceNum;
}
