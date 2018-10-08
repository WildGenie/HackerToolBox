#pragma once
#define Code_Confusion_START \
	__asm _emit 0xEB \
	__asm _emit 0x08 \
	__asm _emit 0x53 \
	__asm _emit 0x54 \
	__asm _emit 0x5F \
	__asm _emit 0x53 \
	__asm _emit 0x54 \
	__asm _emit 0x41 \
	__asm _emit 0x52 \
	__asm _emit 0x54

#define Code_Confusion_END \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x5F\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x45\
	__asm _emit 0x4E\
	__asm _emit 0x44


#define Code_Elimination_START \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x4F\
	__asm _emit 0x43\
	__asm _emit 0x5F\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x41\
	__asm _emit 0x52\
	__asm _emit 0x54

#define Code_Elimination_END \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x4F\
	__asm _emit 0x43\
	__asm _emit 0x5F\
	__asm _emit 0x4F\
	__asm _emit 0x43\
	__asm _emit 0x45\
	__asm _emit 0x4E\
	__asm _emit 0x44


#define Decode_onExec_START \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x44\
	__asm _emit 0x59\
	__asm _emit 0x5F\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x41\
	__asm _emit 0x52\
	__asm _emit 0x54

#define Decode_onExec_END \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x44\
	__asm _emit 0x59\
	__asm _emit 0x5F\
	__asm _emit 0x44\
	__asm _emit 0x59\
	__asm _emit 0x45\
	__asm _emit 0x4E\
	__asm _emit 0x44


#define Decode_onReg_START \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x52\
	__asm _emit 0x44\
	__asm _emit 0x5F\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x41\
	__asm _emit 0x52\
	__asm _emit 0x54

#define Decode_onReg_END \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x52\
	__asm _emit 0x44\
	__asm _emit 0x5F\
	__asm _emit 0x52\
	__asm _emit 0x44\
	__asm _emit 0x45\
	__asm _emit 0x4E\
	__asm _emit 0x44


#define Decode_Section_A_START \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x52\
	__asm _emit 0x31\
	__asm _emit 0x5F\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x41\
	__asm _emit 0x52\
	__asm _emit 0x54


#define Decode_Section_A_END \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x52\
	__asm _emit 0x31\
	__asm _emit 0x5F\
	__asm _emit 0x52\
	__asm _emit 0x44\
	__asm _emit 0x45\
	__asm _emit 0x4E\
	__asm _emit 0x44
	

#define Decode_Section_B_START \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x52\
	__asm _emit 0x32\
	__asm _emit 0x5F\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x41\
	__asm _emit 0x52\
	__asm _emit 0x54

#define Decode_Section_B_END \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x52\
	__asm _emit 0x32\
	__asm _emit 0x5F\
	__asm _emit 0x52\
	__asm _emit 0x44\
	__asm _emit 0x45\
	__asm _emit 0x4E\
	__asm _emit 0x44
	
	
#define Decode_Section_C_START \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x52\
	__asm _emit 0x33\
	__asm _emit 0x5F\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x41\
	__asm _emit 0x52\
	__asm _emit 0x54

#define Decode_Section_C_END \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x52\
	__asm _emit 0x33\
	__asm _emit 0x5F\
	__asm _emit 0x52\
	__asm _emit 0x44\
	__asm _emit 0x45\
	__asm _emit 0x4E\
	__asm _emit 0x44
	
	
#define ZProtect_VM_START \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x56\
	__asm _emit 0x4D\
	__asm _emit 0x5F\
	__asm _emit 0x53\
	__asm _emit 0x54\
	__asm _emit 0x41\
	__asm _emit 0x52\
	__asm _emit 0x54

#define ZProtect_VM_END \
	__asm _emit 0xEB\
	__asm _emit 0x08\
	__asm _emit 0x56\
	__asm _emit 0x4D\
	__asm _emit 0x5F\
	__asm _emit 0x56\
	__asm _emit 0x4D\
	__asm _emit 0x45\
	__asm _emit 0x4E\
	__asm _emit 0x44



#define OBJTYPE_UNKNOW		0
#define OBJTYPE_BOOLEAN		1
#define OBJTYPE_INTEGER		2
#define OBJTYPE_DOUBLE		3
#define OBJTYPE_STRING		4
#define OBJTYPE_WSTRING		5
#define OBJTYPE_USERDATA	6

#define EXEC_OK		0
#define EXEC_FAILD	1

// Registration and trial functions:

int		__stdcall ZP_GetExecutionTime();
int		__stdcall ZP_GetTrialTimes();
int		__stdcall ZP_GetTrialTimesLeft();
void	__stdcall ZP_GetTrialDate(PSYSTEMTIME pTime);
int		__stdcall ZP_GetTrialDateLeft();
int		__stdcall ZP_GetTrialDays();
int		__stdcall ZP_GetTrialDaysLeft();
char*	__stdcall ZP_GetHardwareIDStr();
char*	__stdcall ZP_GetHomePageStr();
char*	__stdcall ZP_GetUserName();
char*	__stdcall ZP_GetKeyBuffer();
int		__stdcall ZP_GetKeyCustomInt(int pid);
char*	__stdcall ZP_GetKeyCustomStr(int pid);
BOOL	__stdcall ZP_GetRegistrationState(int pSection);

// Utility functions:

DWORD	__stdcall ZP_CRC32(char* pBuf,int pszBuf);
void	__stdcall ZP_MD5(char* pBuf,int pszBuf,char* pDstBuf);
int		__stdcall ZP_DES128(char* pBuf,int pszBuf,char* pDstBuf,char* pKeyBuf,BOOL pEncrypt = TRUE);
char*   __stdcall ZP_LoadResources( int pID,int pType,DWORD* pszResource );
void	__stdcall ZP_FreeResources( char* plpResource );
char*	__stdcall ZP_OpenReadOnlyFileMapping( char* pFileName,__out LPDWORD pReadedSize );
BOOL	__stdcall ZP_CloseFileMapping( char* pMapping );
char*	__stdcall ZP_GetExclusiveGUID();

// Lua Script functions:

int		__stdcall ZP_ScpExec(int pid);
char*	__stdcall ZP_ScpGetGlobal( char* pName,int* pType);
char*	__stdcall ZP_ScpCall(char* pfName,int* pType,int pArgNum,int pType1,char* pValue1);
BOOL	__stdcall ZP_ScpRegFunc(char* pfname,void* plpFunc,int pArgNum,int prtType,int pArgTypes);

