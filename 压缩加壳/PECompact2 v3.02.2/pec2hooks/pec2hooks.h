
#define PEC2_HOOKS_FLAG_MANDATE_LAST_IN_ORDER 1
#define PEC2_HOOKS_FLAG_MANDATE_FIRST_IN_ORDER 2
#define PEC2_HOOKS_VERSION 2

#define HookDataInfo HOOK_DATA_INFO

typedef HMODULE (WINAPI *PFNLoadLibraryA)(TCHAR *ptszModule);
typedef FARPROC (WINAPI *PFNGetProcAddressWithHint)(HMODULE,TCHAR *,DWORD);
typedef FARPROC (WINAPI *PFNTranslateAPIAddressToHookAddress)(FARPROC);

typedef struct _HOOK_CHAIN_INFO
{	
	PFNLoadLibraryA pLoadLibrary;
	PFNGetProcAddressWithHint pGetProcAddressWithHint;
	PFNTranslateAPIAddressToHookAddress pTranslateAPIAddressToHookAddress;
} HOOK_CHAIN_INFO, *PHOOK_CHAIN_INFO;

typedef struct _HOOK_DATA_INFO
{
	WORD dwVersion;
	WORD dwStructSize;
	DWORD dwOffsetInitialize;
	DWORD dwOffsetInitializeEx;
	DWORD dwOffsetLoadLibraryA;
	DWORD dwOffsetGetProcAddressWithHint;
	DWORD dwOffsetTranslateAPIAddressToHookAddress;
} HOOK_DATA_INFO, *PHOOK_DATA_INFO;

typedef struct _HOOK_DATA
{
	HOOK_DATA_INFO m_HookDataInfo;    // hook data info
	unsigned char m_szCodeAndData[0]; // any size array... do not use sizeof with this structure
} HOOK_DATA;

DWORD Initialize(FARPROC pFunctions[]);
