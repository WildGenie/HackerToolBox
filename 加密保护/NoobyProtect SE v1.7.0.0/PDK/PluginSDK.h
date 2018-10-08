#pragma once

typedef struct _SHELL_CONTEXT
{
	void* pLinkerClass;
	void* pMemoryClass;
	void* pPluginHookList;
	IMAGE_NT_HEADERS* pNTHeaders;
	IMAGE_SECTION_HEADER* pSectionHeader;
} SHELL_CONTEXT, *PSHELL_CONTEXT;

typedef struct _HOOK_ENTRY
{
	DWORD Offset;
	DWORD Length;
} HOOK_ENTRY, *PHOOK_ENTRY;

#define NORMAL				0x00000001
#define BEFORE_LICENSING	0x00000002
#define NO_PROTECT			0x00000004

typedef DWORD (__stdcall *pfnAddPluginHook)(SHELL_CONTEXT* Context, HOOK_ENTRY NewHookEntry);
typedef DWORD (__stdcall *pfnGetPluginFuncRVA)(SHELL_CONTEXT* Context, char* FuncName);

typedef void (__stdcall *pfnInitialize)(BYTE* pImageBuf, pfnAddPluginHook fnAddPluginHook, pfnGetPluginFuncRVA fnGetPluginFuncRVA, SHELL_CONTEXT* Context);
typedef DWORD (__stdcall *pfnGetPluginContextSize)();
typedef void (__stdcall *pfnGetPluginContext)(void* pContext);
typedef void (__stdcall *pfnGetPluginBinName)(char* pNameBuf, DWORD Size);
typedef DWORD (__stdcall *pfnGetPluginType)();

void WINAPI Initialize(BYTE* pImageBuf, pfnAddPluginHook fnAddPluginHook, pfnGetPluginFuncRVA fnGetPluginFuncRVA, SHELL_CONTEXT* Context);
DWORD WINAPI GetPluginContextSize();
void WINAPI GetPluginContext(void* pContext);
void WINAPI GetPluginBinName(char* pNameBuf, DWORD Size);
DWORD WINAPI GetPluginType();