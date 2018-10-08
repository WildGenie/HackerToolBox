#ifndef _EPESDK_H
#define _EPESDK_H

typedef struct _TUserRecord
{
	int Bz ;
	int ValueSize;
	void * ValueBuf;
	int PassSize;
	void * PassBuf;
}TUserRecord, *PTUserRecord ;


#pragma warning(push,1)
typedef struct _CRYPT
{
	PVOID		buf;
	DWORD		size;
	PCHAR		key;
	BYTE		IsCrypt;		
}CRYPT,*PCRYPT;
#pragma warning(pop)

void quweroqpw();
void jopnonbp();
void uuaonvano(PVOID buffer,PCHAR key,DWORD buffersize,BYTE IsCrypt);
void nvanwoneo(HINSTANCE hInstance);
char * ip1oi21(char* pszSourceString);
void  ajpo1nn2(void * pvInBuf, int nInBytes, void * &pvOutBuf,int &  nOutBytes, char *pzPassword , int nOutEstimate = 0 );
char * nanio1noin1o2nfa(char *pszSourceString, char *pszPassword, BOOL bHFlag );
void ponvano(void *pvInBuf , int nInBytes, void* *pvOutPointer, int& nOutBytes,  char * pszPassword );
char * naon1nib3331(char* pszSourceString , char * pszPassword,BOOL bHFlag );




#endif