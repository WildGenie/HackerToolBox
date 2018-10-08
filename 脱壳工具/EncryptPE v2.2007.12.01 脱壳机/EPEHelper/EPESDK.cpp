#include <windows.h>
#include <winsock.h>
#include <stdio.h>
#include "EPESDK.h"

HWND RegisterHandle  = NULL ;

#pragma comment(lib,"ws2_32.lib")

void quweroqpw()
{
	SendMessage(RegisterHandle,WM_USER,0,0x64);
}

void jopnonbp()
{
	SendMessage(RegisterHandle,WM_USER,0,0x65);
}


void uuaonvano(PVOID buffer,PCHAR key,DWORD buffersize,BYTE IsCrypt)
{
	CRYPT buf={0};
	buf.buf=buffer;
	buf.key=key;
	buf.size=buffersize;
	buf.IsCrypt=IsCrypt;
	send((SOCKET)-1,(char*)&buf,0x0D,1003);
}

void nvanwoneo(HINSTANCE hInstance)
{
	HMODULE hTemp = NULL;
	char b12buvy1212[3 * MAX_PATH];
	char *p = b12buvy1212 ;
	HANDLE  hMapFile = NULL;

	if(GetModuleFileName(hInstance,b12buvy1212,3 * MAX_PATH) == 0)
	{
		return ;
	}
	int nFin1n2oi1n1241ianin3i1ni2nin1 = strlen (b12buvy1212);
	if(nFin1n2oi1n1241ianin3i1ni2nin1 == 3 * MAX_PATH)
	{
		return ; 
	}
	while (*p != '\0') 
	{
		if(*p == '\\')
		{
			*p = '/';
		}
		if(p - b12buvy1212 >= nFin1n2oi1n1241ianin3i1ni2nin1)
		{
			break;
		}
		p++;
	}
	char o1on2nino31[16] ;
	int nTemp = GetCurrentProcessId();
	sprintf(o1on2nino31,"%.8x",GetCurrentProcessId());
	_strupr(o1on2nino31);
	if(strlen(o1on2nino31)+ strlen(b12buvy1212) >=  3 * MAX_PATH)
	{
		return ;
	}
	else
	{
		strcat(p,"/");
		strcat(b12buvy1212,o1on2nino31);
	}
	hMapFile = OpenFileMapping(FILE_MAP_WRITE,false,(LPCTSTR ) b12buvy1212);
	if(! hMapFile )
	{
		return ;
	}
	int *  lpBaseAddress = (int *)MapViewOfFile(hMapFile,FILE_MAP_WRITE,0,0,0);
	if(lpBaseAddress != NULL)
	{
		RegisterHandle = (HWND  )(*lpBaseAddress);
		UnmapViewOfFile(lpBaseAddress);
	}
	CloseHandle(hMapFile);
}

char * ip1oi21(char* pszSourceString)
{
	int i ,nMessageResult ;
	char *pszReturn = NULL;
	if (::IsWindow(RegisterHandle) == false)
	{
		return pszReturn;
	}
	for(i = 1 ; i <= 100 ; i ++)
	{
		nMessageResult = ::SendMessage(RegisterHandle,WM_USER, 99,(LPARAM)(pszSourceString));
		if ((nMessageResult != -1)  && (nMessageResult != 0))
		{
			pszReturn = (char *)nMessageResult;
			break;
		}
	}
	return pszReturn;
}

void  ajpo1nn2(void * pvInBuf, int nInBytes, void * &pvOutBuf,int &  nOutBytes, char *pzPassword , int nOutEstimate )
{
	TUserRecord p ;
	int i ,nMessageResult ;
	pvOutBuf  = NULL ;
	nOutBytes = 0 ;
	if(pvInBuf == NULL || nInBytes <=0 || (::IsWindow(RegisterHandle) == FALSE))
	{
		return;
	}
	p.Bz = 1;
	p.ValueSize = nInBytes;
	p.ValueBuf = pvInBuf;

	if (pzPassword != NULL)
	{
		p.PassSize = strlen(pzPassword);
		p.PassBuf  =  pzPassword; 
	}
	else
	{
		p.PassSize = 0;
		p.PassBuf  = NULL;
	}
	for(i = 1; i <= 100 ; i ++)
	{
		nMessageResult = ::SendMessage(RegisterHandle, WM_USER,  0x7FFFFFFF, (LPARAM)(&p));
		if(nMessageResult == 1)
		{
			try
			{
				char *pTemp = (char *)new char[p.ValueSize ];
				pvOutBuf = (void *)pTemp;
				nOutBytes = p.ValueSize ;
				memcpy(pTemp,p.ValueBuf,p.ValueSize);
				break;
			}
			catch (...) 
			{

				pvOutBuf = (void *)NULL;
				nOutBytes = 0 ;
			}
		}
	}
}

char * nanio1noin1o2nfa(char *pszSourceString, char *pszPassword, BOOL bHFlag )
{
	TUserRecord p;
	int i ,nMessageResult ;
	char *szpReturn = NULL;
	if(pszSourceString == NULL || (::IsWindow(RegisterHandle) == FALSE))
	{
		return szpReturn;
	}
	if(bHFlag)
	{
		p.Bz = 11;
	}
	else
	{
		p. Bz = 21;
	}

	p.ValueSize  = strlen(pszSourceString);
	p.ValueBuf  = pszSourceString;
	if(pszPassword != NULL)
	{
		p.PassSize  = strlen(pszPassword);
		p.PassBuf  = pszPassword;
	}
	else
	{
		p.PassSize = 0;
		p.PassBuf= NULL;
	}
	for (i = 1 ;i <= 100 ; i ++)
	{
		nMessageResult = :: SendMessage(RegisterHandle, WM_USER,  0x7FFFFFFF, (LPARAM)(&p));
		if(nMessageResult == 1)
		{
			try
			{
				szpReturn = new char [p.ValueSize + 1];
				memcpy(szpReturn,p.ValueBuf, p.ValueSize) ;
				*(szpReturn +p.ValueSize ) = '\0';
				break;
			}
			catch (...) {
			}
		}
	}
	return szpReturn ;
}

void ponvano(void *pvInBuf , int nInBytes, void* *pvOutPointer, int& nOutBytes,  char * pszPassword )
{
	TUserRecord p;
	int i ,nMessageResult ;
	*pvOutPointer = NULL;
	nOutBytes = 0;
	if(pvInBuf == NULL || nInBytes <= 0 || (::IsWindow(RegisterHandle) == FALSE))
	{
		return ;
	}
	p.Bz  = 101;
	p.ValueSize = nInBytes;
	p.ValueBuf  = pvInBuf;
	if(pszPassword != NULL)
	{
		p.PassSize  = strlen(pszPassword);
		p.PassBuf  =pszPassword ;
	}
	else
	{
		p.PassSize = 0;
		p.PassBuf  = NULL ;
	}
	for ( i = 1 ;i <= 100; i ++)
	{
		nMessageResult = ::SendMessage(RegisterHandle, WM_USER,  0x7FFFFFFF, (LPARAM)(&p));
		if(nMessageResult == 1)
		{
			try
			{
				char *pTemp  = (char *)new char [p.ValueSize+1];
				*pvOutPointer = pTemp;
				nOutBytes = p.ValueSize ;
				memcpy(pTemp, p.ValueBuf, p.ValueSize);
				break;
			}
			catch (...) {
				*pvOutPointer = NULL;
				nOutBytes = 0;
			}
		}
	}
}

char * naon1nib3331(char* pszSourceString , char * pszPassword,BOOL bHFlag )
{
	TUserRecord p;
	int i ,nMessageResult ;
	char *pszReturn = NULL;
	if(pszSourceString == NULL ||(::IsWindow(RegisterHandle) == FALSE) )
	{
		return pszReturn ;
	}
	if (bHFlag )
	{
		p.Bz  = 111;
	}
	else
	{
		p.Bz  = 121;
	}
	p.ValueSize  = strlen(pszSourceString);
	p.ValueBuf = pszSourceString;
	if(pszPassword != NULL)
	{
		p.PassSize  = strlen(pszPassword);
		p.PassBuf  =pszPassword ;
	}
	else
	{
		p.PassSize = 0;
		p.PassBuf  = NULL ;
	}
	for(i = 1 ; i <= 100; i ++)
	{
		nMessageResult = ::SendMessage(RegisterHandle, WM_USER,  0x7FFFFFFF, (LPARAM)(&p));
		if(nMessageResult == 1)
		{
			try
			{
				pszReturn = new char [p.ValueSize + 1];
				memcpy(pszReturn, p.ValueBuf, p.ValueSize);
				*(pszReturn + p.ValueSize) = '\0';
				break;
			}
			catch (...) {
				pszReturn = NULL;
			}
			break;
		}
	}
	return pszReturn;
}
