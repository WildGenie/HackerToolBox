/******************************************************************************
/* Header: Zprotect_SDK.h
/* Description: SDK header definition for C/C++ language
/* Usage: Include this file to use Zprotect SDK in C++ compilers
/*****************************************************************************/

#ifndef __ZPROTECTSDK__
#define __ZPROTECTSDK__

/* Definition for Borland C++ Builder */

 #ifdef __BORLAND__

// Registration and trial functions:
 
 extern "C" __declspec( dllimport ) int __stdcall ZP_GetExecutionTime(); 
 extern "C" __declspec( dllimport ) void __stdcall ZP_GetTrialDate(PSYSTEMTIME pTime); 
 extern "C" __declspec( dllimport ) int __stdcall ZP_GetTrialDateLeft(); 
 extern "C" __declspec( dllimport ) int __stdcall ZP_GetTrialDays(); 
 extern "C" __declspec( dllimport ) int __stdcall ZP_GetTrialDaysLeft(); 
 extern "C" __declspec( dllimport ) int __stdcall ZP_GetTrialTimes(); 
 extern "C" __declspec( dllimport ) int __stdcall ZP_GetTrialTimesLeft(); 
 extern "C" __declspec( dllimport ) char* __stdcall ZP_GetHardwareIDStr(); 
 extern "C" __declspec( dllimport ) char* __stdcall ZP_GetHomePageStr(); 
 extern "C" __declspec( dllimport ) char* __stdcall ZP_GetUserName(); 
 extern "C" __declspec( dllimport ) char* __stdcall ZP_GetKeyBuffer(); 
 extern "C" __declspec( dllimport ) int __stdcall ZP_GetKeyCustomInt(int pid); 
 extern "C" __declspec( dllimport ) char* __stdcall ZP_GetKeyCustomStr(int pid); 
 extern "C" __declspec( dllimport ) char*	BOOL	__stdcall ZP_GetRegistrationState(int pSection);
 
// Utility functions:
 
 extern "C" __declspec( dllimport ) DWORD __stdcall ZP_CRC32(char* pBuf,int pszBuf); 
 extern "C" __declspec( dllimport ) void __stdcall ZP_MD5( char* pBuf,int pszBuf,char* pDstBuf );
 extern "C" __declspec( dllimport ) int		__stdcall ZP_DES128(char* pBuf,int pszBuf,char* pDstBuf,char* pKeyBuf,BOOL pEncrypt = TRUE);
 extern "C" __declspec( dllimport ) char*   __stdcall ZP_LoadResources( int pID,int pType,DWORD* pszResource );
 extern "C" __declspec( dllimport ) void	__stdcall ZP_FreeResources( char* plpResource );
 extern "C" __declspec( dllimport ) char*	__stdcall ZP_OpenReadOnlyFileMapping( char* pFileName,__out LPDWORD pReadedSize );
 extern "C" __declspec( dllimport ) BOOL	__stdcall ZP_CloseFileMapping( char* pMapping );
 extern "C" __declspec( dllimport ) char*	__stdcall ZP_GetExclusiveGUID();

// Lua Script functions:

 extern "C" __declspec( dllimport ) int		__stdcall ZP_ScpExec(int pid);
 extern "C" __declspec( dllimport ) char*	__stdcall ZP_ScpGetGlobal( char* pName,int* pType);
 extern "C" __declspec( dllimport ) char*	__stdcall ZP_ScpCall(char* pfName,int* pType,int pArgNum,int pType1,char* pValue1);
 extern "C" __declspec( dllimport ) bool	__stdcall ZP_ScpRegFunc(char* pfname,void* plpFunc,int pArgNum,int prtType,int pArgTypes);

 
 #else

// Registration and trial functions:
 
 extern "C" int __stdcall ZP_GetExecutionTime(); 
 extern "C" void __stdcall ZP_GetTrialDate(PSYSTEMTIME pTime); 
 extern "C" int __stdcall ZP_GetTrialDateLeft(); 
 extern "C" int __stdcall ZP_GetTrialDays(); 
 extern "C" int __stdcall ZP_GetTrialDaysLeft(); 
 extern "C" int __stdcall ZP_GetTrialTimes(); 
 extern "C" int __stdcall ZP_GetTrialTimesLeft(); 
 extern "C" char* __stdcall ZP_GetHardwareIDStr(); 
 extern "C" char* __stdcall ZP_GetHomePageStr(); 
 extern "C" char* __stdcall ZP_GetUserName(); 
 extern "C" char* __stdcall ZP_GetKeyBuffer(); 
 extern "C" int __stdcall ZP_GetKeyCustomInt(int pid); 
 extern "C" char* __stdcall ZP_GetKeyCustomStr(int pid); 
 extern "C" char*	BOOL	__stdcall ZP_GetRegistrationState(int pSection);
 
// Utility functions:
 
 extern "C" DWORD __stdcall ZP_CRC32(char* pBuf,int pszBuf); 
 extern "C" void __stdcall ZP_MD5( char* pBuf,int pszBuf,char* pDstBuf );
  extern "C" int		__stdcall ZP_DES128(char* pBuf,int pszBuf,char* pDstBuf,char* pKeyBuf,BOOL pEncrypt = TRUE);
 extern "C" char*   __stdcall ZP_LoadResources( int pID,int pType,DWORD* pszResource );
 extern "C" void	__stdcall ZP_FreeResources( char* plpResource );
 extern "C" char*	__stdcall ZP_OpenReadOnlyFileMapping( char* pFileName,__out LPDWORD pReadedSize );
 extern "C" BOOL	__stdcall ZP_CloseFileMapping( char* pMapping );
 extern "C" char*	__stdcall ZP_GetExclusiveGUID();

// Lua Script functions:

 extern "C" int		__stdcall ZP_ScpExec(int pid);
 extern "C" char*	__stdcall ZP_ScpGetGlobal( char* pName,int* pType);
 extern "C" char*	__stdcall ZP_ScpCall(char* pfName,int* pType,int pArgNum,int pType1,char* pValue1);
 extern "C" bool	__stdcall ZP_ScpRegFunc(char* pfname,void* plpFunc,int pArgNum,int prtType,int pArgTypes);
 
 
 #endif
  
// Zprotect macros definition 

 #ifdef __BORLAND__
  
 #define Code_Confusion_START __emit__ (0xEB,0x08,0x53,0x54,0x5F,0x53,0x54,0x41,0x52,0x54);
 #define Code_Confusion_END __emit__ (0xEB,0x08,0x53,0x54,0x5F,0x53,0x54,0x45,0x4E,0x44);
 
 #define Code_Elimination_START __emit__ (0xEB,0x08,0x4F,0x43,0x5F,0x53,0x54,0x41,0x52,0x54);
 #define Code_Elimination_END __emit__ (0xEB,0x08,0x4F,0x43,0x5F,0x4F,0x43,0x45,0x4E,0x44);

 #define Decode_onExec_START __emit__ (0xEB,0x08,0x44,0x59,0x5F,0x53,0x54,0x41,0x52,0x54);
 #define Decode_onExec_END __emit__ (0xEB,0x08,0x44,0x59,0x5F,0x44,0x59,0x45,0x4E,0x44);

 #define Decode_onReg_START __emit__ (0xEB,0x08,0x52,0x44,0x5F,0x53,0x54,0x41,0x52,0x54);
 #define Decode_onReg_END __emit__ (0xEB,0x08,0x52,0x44,0x5F,0x52,0x44,0x45,0x4E,0x44);
 
 #define Decode_Section_A_START __emit__ (0xEB,0x08,0x52,0x31,0x5F,0x53,0x54,0x41,0x52,0x54);
 #define Decode_Section_A_END __emit__ (0xEB,0x08,0x52,0x31,0x5F,0x52,0x44,0x45,0x4E,0x44);
 
 #define Decode_Section_B_START __emit__ (0xEB,0x08,0x52,0x32,0x5F,0x53,0x54,0x41,0x52,0x54);
 #define Decode_Section_B_END __emit__ (0xEB,0x08,0x52,0x32,0x5F,0x52,0x44,0x45,0x4E,0x44);

 #define Decode_Section_C_START __emit__ (0xEB,0x08,0x52,0x33,0x5F,0x53,0x54,0x41,0x52,0x54);
 #define Decode_Section_C_END __emit__ (0xEB,0x08,0x52,0x33,0x5F,0x52,0x44,0x45,0x4E,0x44);

 #define ZProtect_VM_START __emit__ (0xEB,0x08,0x56,0x4D,0x5F,0x53,0x54,0x41,0x52,0x54);
 #define ZProtect_VM_END __emit__ (0xEB,0x08,0x56,0x4D,0x5F,0x56,0x4D,0x45,0x4E,0x44);

 
 #define __ZP_MACROS__
 #endif

#endif

/* Definition for Intel c++ compiler */

#ifndef __ZP_MACROS__
 
 #ifdef __INTEL__
 
 #define Code_Confusion_START \
	__asm __emit 0xEB \
	__asm __emit 0x08 \
	__asm __emit 0x53 \
	__asm __emit 0x54 \
	__asm __emit 0x5F \
	__asm __emit 0x53 \
	__asm __emit 0x54 \
	__asm __emit 0x41 \
	__asm __emit 0x52 \
	__asm __emit 0x54

 #define Code_Confusion_END \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44
	

 #define Code_Elimination_START \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x4F\
	__asm __emit 0x43\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x41\
	__asm __emit 0x52\
	__asm __emit 0x54

 #define Code_Elimination_END \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x4F\
	__asm __emit 0x43\
	__asm __emit 0x5F\
	__asm __emit 0x4F\
	__asm __emit 0x43\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44
	

 #define Decode_onExec_START \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x44\
	__asm __emit 0x59\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x41\
	__asm __emit 0x52\
	__asm __emit 0x54

 #define Decode_onExec_END \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x44\
	__asm __emit 0x59\
	__asm __emit 0x5F\
	__asm __emit 0x44\
	__asm __emit 0x59\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44	
	
	
 #define Decode_onReg_START \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x52\
	__asm __emit 0x44\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x41\
	__asm __emit 0x52\
	__asm __emit 0x54

 #define Decode_onReg_END \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x52\
	__asm __emit 0x44\
	__asm __emit 0x5F\
	__asm __emit 0x52\
	__asm __emit 0x44\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44
	
	
 #define Decode_Section_A_START \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x52\
	__asm __emit 0x31\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x41\
	__asm __emit 0x52\
	__asm __emit 0x54

 #define Decode_Section_A_END \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x52\
	__asm __emit 0x31\
	__asm __emit 0x5F\
	__asm __emit 0x52\
	__asm __emit 0x44\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44
	
	
 #define Decode_Section_B_START \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x52\
	__asm __emit 0x32\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x41\
	__asm __emit 0x52\
	__asm __emit 0x54

 #define Decode_Section_B_END \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x52\
	__asm __emit 0x32\
	__asm __emit 0x5F\
	__asm __emit 0x52\
	__asm __emit 0x44\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44
	
	
 #define Decode_Section_C_START \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x52\
	__asm __emit 0x33\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x41\
	__asm __emit 0x52\
	__asm __emit 0x54

 #define Decode_Section_C_END \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x52\
	__asm __emit 0x33\
	__asm __emit 0x5F\
	__asm __emit 0x52\
	__asm __emit 0x44\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44

	
 #define ZProtect_VM_START \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x56\
	__asm __emit 0x4D\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x41\
	__asm __emit 0x52\
	__asm __emit 0x54

 #define ZProtect_VM_END \
	__asm __emit 0xEB\
	__asm __emit 0x08\
	__asm __emit 0x56\
	__asm __emit 0x4D\
	__asm __emit 0x5F\
	__asm __emit 0x56\
	__asm __emit 0x4D\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44

	
 #define __ZP_MACROS__ 
 #endif
 
#endif

/* Definition for LCC based compilers */

#ifndef __ZP_MACROS__
 
 #ifdef __LCC__
 
 #define Code_Confusion_START __asm__ (" .byte\t0xEB, 0x08, 0x53, 0x54, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54");
 #define Code_Confusion_END __asm__ (" .byte\t0xEB, 0x08, 0x53, 0x54, 0x5F, 0x53, 0x54, 0x45, 0x4E, 0x44");

 #define Code_Elimination_START __asm__ (" .byte\t0xEB, 0x08, 0x4F, 0x43, 0x5F, 0x53, 0x54 ,0x41, 0x52, 0x54");
 #define Code_Elimination_END __asm__ (" .byte\t0xEB, 0x08, 0x4F, 0x43, 0x5F, 0x4F, 0x43 ,0x45, 0x4E, 0x44");

 #define Decode_onExec_START __asm__ (" .byte\t0xEB, 0x08, 0x44, 0x59, 0x5F, 0x53, 0x54 ,0x41, 0x52, 0x54");
 #define Decode_onExec_END __asm__ (" .byte\t0xEB, 0x08, 0x44, 0x59, 0x5F, 0x44, 0x59 ,0x45, 0x4E, 0x44");
 
 #define Decode_onReg_START __asm__ (" .byte\t0xEB, 0x08, 0x52, 0x44, 0x5F, 0x53, 0x54 ,0x41, 0x52, 0x54");
 #define Decode_onReg_END __asm__ (" .byte\t0xEB, 0x08, 0x52, 0x44, 0x5F, 0x52, 0x44 ,0x45, 0x4E, 0x44");
 
 #define Decode_Section_A_START __asm__ (" .byte\t0xEB, 0x08, 0x52, 0x31, 0x5F, 0x53, 0x54 ,0x41, 0x52, 0x54");
 #define Decode_Section_A_END __asm__ (" .byte\t0xEB, 0x08, 0x52, 0x31, 0x5F, 0x52, 0x44 ,0x45, 0x4E, 0x44");

 #define Decode_Section_B_START __asm__ (" .byte\t0xEB, 0x08, 0x52, 0x32, 0x5F, 0x53, 0x54 ,0x41, 0x52, 0x54");
 #define Decode_Section_B_END __asm__ (" .byte\t0xEB, 0x08, 0x52, 0x32, 0x5F, 0x52, 0x44 ,0x45, 0x4E, 0x44");

 #define Decode_Section_C_START __asm__ (" .byte\t0xEB, 0x08, 0x52, 0x33, 0x5F, 0x53, 0x54 ,0x41, 0x52, 0x54");
 #define Decode_Section_C_END __asm__ (" .byte\t0xEB, 0x08, 0x52, 0x33, 0x5F, 0x52, 0x44 ,0x45, 0x4E, 0x44");
 
 #define ZProtect_VM_START __asm__ (" .byte\t0xEB, 0x08, 0x56, 0x4D, 0x5F, 0x53, 0x54 ,0x41, 0x52, 0x54");
 #define ZProtect_VM_END __asm__ (" .byte\t0xEB, 0x08, 0x56, 0x4D, 0x5F, 0x56, 0x4D ,0x45, 0x4E, 0x44");
 
 
 #define __ZP_MACROS__
 #endif
 
#endif

/* Definition for Visual C++ and others */

#ifndef __ZP_MACROS__

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
	
	
#endif