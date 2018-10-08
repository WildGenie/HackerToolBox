#include <windows.h>
#include <stdio.h>
#include "resource.h"
#include "EPESDK.h"

#pragma comment (lib, "comctl32.lib")

char *b1obobaobvb31123aabasd31[]={
	{""},//case 0
	{"LeaveCriticalSection"},
	{"EnterCriticalSection"},
	{"InitializeCriticalSection"},
	{"VirtualFree"},
	{"VirtualAlloc"},
	{"LocalFree"},
	{"LocalAlloc"},
	{"GetCurrentThreadId"},
	{"InterlockedDecrement"},
	{"InterlockedIncrement"},
	{"VirtualQuery"},
	{"WideCharToMultiByte"},
	{"SetCurrentDirectoryA"},
	{"MultiByteToWideChar"},
	{"lstrlenA"},
	{"lstrcpynA"},
	{"LoadLibraryExA"},
	{"GetThreadLocale"},
	{"GetStartupInfoA"},
	{"GetProcAddress"},
	{"GetModuleHandleA"},
	{"GetModuleFileNameA"},
	{"GetLocaleInfoA"},
	{"GetLastError"},
	{"GetCurrentDirectoryA"},
	{"GetCommandLineA"},
	{"FreeLibrary"},
	{"FindFirstFileA"},
	{"FindClose"},
	{"ExitProcess"},
	{"ExitThread"},
	{"CreateThread"},
	{"WriteFile"},
	{"UnhandledExceptionFilter"},
	{"SetFilePointer"},
	{"SetEndOfFile"},
	{"ReadFile"},
	{"RaiseException"},
	{"GetStdHandle"},
	{"GetFileSize"},
	{"GetSystemTime"},
	{"GetFileType"},
	{"CreateFileA"},
	{"CloseHandle"},
	{"GetKeyboardType"},
	{"LoadStringA"},
	{"MessageBoxA"},
	{"CharNextA"},
	{"RegQueryValueExA"},
	{"RegOpenKeyExA"},
	{"RegCloseKey"},
	{"TlsSetValue"},
	{"TlsGetValue"},
	{"TlsFree"},
	{"TlsAlloc"},
	{"RegSetValueExA"},
	{"RegFlushKey"},
	{"RegCreateKeyExA"},
	{"OpenProcessToken"},
	{"LookupPrivilegeValueA"},
	{"GetUserNameA"},
	{"AdjustTokenPrivileges"},
	{"lstrcpyA"},
	{"lstrcmpA"},
	{"WriteProcessMemory"},
	{"WriteFileEx"},
	{"WaitForSingleObject"},
	{"WaitForDebugEvent"},
	{"VirtualProtect"},
	{"UnmapViewOfFile"},
	{"TerminateThread"},
	{"TerminateProcess"},
	{"SuspendThread"},
	{"Sleep"},
	{"SizeofResource"},
	{"SetThreadLocale"},
	{"SetThreadContext"},
	{"SetLastError"},
	{"SetEvent"},
	{"SetErrorMode"},
	{"ResumeThread"},
	{"ResetEvent"},
	{"RemoveDirectoryA"},
	{"ReadProcessMemory"},
	{"ReadFileEx"},
	{"QueryPerformanceCounter"},
	{"OutputDebugStringA"},
	{"OpenProcess"},
	{"OpenMutexA"},
	{"OpenFileMappingW"},
	{"OpenFileMappingA"},
	{"MulDiv"},
	{"MapViewOfFileEx"},
	{"MapViewOfFile"},
	{"LockResource"},
	{"LoadResource"},
	{"LoadLibraryW"},
	{"LoadLibraryA"},
	{"HeapFree"},
	{"HeapAlloc"},
	{"GlobalUnlock"},
	{"GlobalReAlloc"},
	{"GlobalHandle"},
	{"GlobalLock"},
	{"GlobalFree"},
	{"GlobalFindAtomA"},
	{"GlobalDeleteAtom"},
	{"GlobalAlloc"},
	{"GlobalAddAtomA"},
	{"GetWindowsDirectoryA"},
	{"GetVolumeInformationW"},
	{"GetVolumeInformationA"},
	{"GetVersionExA"},
	{"GetVersion"},
	{"GetTickCount"},
	{"GetThreadContext"},
	{"GetTempPathA"},
	{"GetSystemInfo"},
	{"GetSystemDirectoryW"},
	{"GetSystemDirectoryA"},
	{"GetStringTypeExA"},
	{"GetProfileStringA"},
	{"GetModuleHandleW"},
	{"GetModuleFileNameW"},
	{"GetLocalTime"},
	{"GetFileAttributesA"},
	{"GetExitCodeThread"},
	{"GetEnvironmentVariableA"},
	{"GetDiskFreeSpaceA"},
	{"GetDateFormatA"},
	{"GetCurrentThread"},
	{"GetCurrentProcessId"},
	{"GetCurrentProcess"},
	{"GetComputerNameA"},
	{"GetCPInfo"},
	{"GetACP"},
	{"FreeResource"},
	{"FormatMessageA"},
	{"FindResourceA"},
	{"FileTimeToLocalFileTime"},
	{"FileTimeToDosDateTime"},
	{"EnumCalendarInfoA"},
	{"DeviceIoControl"},
	{"DeleteFileW"},
	{"DeleteFileA"},
	{"CreateProcessA"},
	{"CreateMutexA"},
	{"CreateFileMappingW"},
	{"CreateFileMappingA"},
	{"CreateFileW"},
	{"CreateEventA"},
	{"CreateDirectoryA"},
	{"ContinueDebugEvent"},
	{"CompareStringA"},
	{"WindowFromPoint"},
	{"WindowFromDC"},
	{"WinHelpA"},
	{"WaitMessage"},
	{"WaitForInputIdle"},
	{"UpdateWindow"},
	{"UnregisterClassA"},
	{"UnhookWindowsHookEx"},
	{"TranslateMessage"},
	{"TranslateMDISysAccel"},
	{"TrackPopupMenu"},
	{"SystemParametersInfoA"},
	{"ShowWindow"},
	{"ShowScrollBar"},
	{"ShowOwnedPopups"},
	{"ShowCursor"},
	{"SetTimer"},
	{"SetScrollRange"},
	{"SetScrollPos"},
	{"SetScrollInfo"},
	{"SetRect"},
	{"SetPropA"},
	{"SetMenuItemInfoA"},
	{"SetMenu"},
	{"SetForegroundWindow"},
	{"SetFocus"},
	{"SetCursor"},
	{"SetClassLongA"},
	{"SetCapture"},
	{"SetActiveWindow"},
	{"SendMessageW"},
	{"SendMessageA"},
	{"ScrollWindow"},
	{"ScreenToClient"},
	{"RemovePropA"},
	{"RemoveMenu"},
	{"ReleaseDC"},
	{"ReleaseCapture"},
	{"RegisterWindowMessageA"},
	{"RegisterClipboardFormatA"},
	{"RegisterClassA"},
	{"RedrawWindow"},
	{"PtInRect"},
	{"PostQuitMessage"},
	{"PostMessageW"},
	{"PostMessageA"},
	{"PeekMessageA"},
	{"OffsetRect"},
	{"OemToCharA"},
	{"MsgWaitForMultipleObjects"},
	{"MapWindowPoints"},
	{"MapVirtualKeyA"},
	{"LockWindowUpdate"},
	{"LoadKeyboardLayoutA"},
	{"LoadIconA"},
	{"LoadCursorA"},
	{"LoadBitmapA"},
	{"KillTimer"},
	{"IsZoomed"},
	{"IsWindowVisible"},
	{"IsWindowEnabled"},
	{"IsWindow"},
	{"IsRectEmpty"},
	{"IsIconic"},
	{"IsDialogMessageA"},
	{"IsChild"},
	{"InvalidateRect"},
	{"IntersectRect"},
	{"InsertMenuItemA"},
	{"InsertMenuA"},
	{"InflateRect"},
	{"GetWindowThreadProcessId"},
	{"GetWindowTextA"},
	{"GetWindowRgn"},
	{"GetWindowRect"},
	{"GetWindowPlacement"},
	{"GetWindowLongA"},
	{"GetWindowDC"},
	{"GetUpdateRect"},
	{"GetTopWindow"},
	{"GetSystemMetrics"},
	{"GetSystemMenu"},
	{"GetSysColor"},
	{"GetSubMenu"},
	{"GetScrollRange"},
	{"GetScrollPos"},
	{"GetScrollInfo"},
	{"GetPropA"},
	{"GetParent"},
	{"GetWindow"},
	{"GetMessagePos"},
	{"GetMenuStringA"},
	{"GetMenuState"},
	{"GetMenuItemRect"},
	{"GetMenuItemInfoA"},//case 250
	{"GetMenuItemID"},
	{"GetMenuItemCount"},
	{"GetMenu"},
	{"GetLastActivePopup"},
	{"GetKeyboardState"},
	{"GetKeyboardLayoutList"},
	{"GetKeyboardLayout"},
	{"GetKeyState"},
	{"GetKeyNameTextA"},
	{"GetIconInfo"},
	{"GetForegroundWindow"},
	{"GetFocus"},
	{"GetDesktopWindow"},
	{"GetDCEx"},
	{"GetDC"},
	{"GetCursorPos"},
	{"GetCursor"},
	{"GetClipboardData"},
	{"GetClientRect"},
	{"GetClassNameA"},
	{"GetClassInfoA"},
	{"GetActiveWindow"},
	{"FrameRect"},
	{"FindWindowA"},
	{"FillRect"},
	{"EqualRect"},
	{"EnumWindows"},
	{"EnumThreadWindows"},
	{"EndPaint"},
	{"EndDeferWindowPos"},
	{"EnableWindow"},
	{"EnableScrollBar"},
	{"EnableMenuItem"},
	{"DrawTextExA"},
	{"DrawTextA"},
	{"DrawMenuBar"},
	{"DrawIconEx"},
	{"DrawIcon"},
	{"DrawFrameControl"},
	{"DrawFocusRect"},
	{"DrawEdge"},// CASE 290
	{"DispatchMessageA"},
	{"DestroyWindow"},
	{"DestroyMenu"},
	{"DestroyIcon"},
	{"DestroyCursor"},
	{"DeleteMenu"},
	{"DeferWindowPos"},
	{"DefWindowProcA"},
	{"DefMDIChildProcA"},
	{"DefFrameProcA"},
	{"CreateWindowExA"},
	{"CreatePopupMenu"},
	{"CreateMenu"},
	{"CreateIcon"},
	{"CloseWindow"},
	{"ClientToScreen"},
	{"ChildWindowFromPoint"},
	{"CheckMenuItem"},
	{"CallWindowProcA"},
	{"CallNextHookEx"},
	{"BeginPaint"},
	{"BeginDeferWindowPos"},
	{"CharLowerBuffA"},
	{"CharLowerA"},
	{"AdjustWindowRectEx"},
	{"ActivateKeyboardLayout"},
	{"ShellExecuteA"},
	{"QueryServiceStatus"},
	{"OpenServiceW"},
	{"OpenServiceA"},
	{"OpenSCManagerW"},//case 321
	{"OpenSCManagerA"},
	{"CloseServiceHandle"},
	{"Netbios"}
};

HINSTANCE hInst;
HMODULE no1in2in1n2n1inn1o2n4124;

DWORD	navon1wp;
PVOID	naonoa21;

PVOID	nonpanpab;
DWORD	napondna;

PVOID	noapnodnpona;
int	npaonnpfoain;


char *naondop;
BOOL nanonnpnoa;
BOOL ianodandoi;
char niovnapead1[3]={0};
char jaii1n12in[]="dLl";
char jo1ijoo1ino2n3[]="ExE";
char o1po2pppn3[]="(=wfs=)";
char *n1on1n2non12;
char ui12oninga3[17]={0};
char j3i3ji3o3i1[0x20]={0};
char o1o2onionon312[9]={0};
DWORD o1ppini312312cv;
char *naion3no1no3n1;
char *lzjdoini1non1ono21;

void *yh2o1noin214214;

void *bzhu31bnibiab;
int	  h1hi2on12414;

char *zji1non12;
int   nianin3i1ni2nin1;

void  *noanviono1n21;
int   bivnio3no1inbivnio3no1inonvanoIno1n2ion1baSize;

char  *oi1noin1on2on1ov2;
char   u1i2n888din2[8]={0};
int	   yt1h2onoi31;

void  *t12uvvau13b21;
int    zyu3bub1uib3;

char t12bub12bi3[MAX_PATH*3]={0};
char b12buvy1212[MAX_PATH]={0};

char f12viv2ib5[MAX_PATH*3]={0};
char o1on2nino31[MAX_PATH*3]={0};
char n1ion4n1i124[MAX_PATH]={0};

void i1ini2o1ni2no994(char *b3gu3bibva3)
{
	BYTE p;
	int n1n2oi1n1241;
	n1n2oi1n1241 = strlen(b3gu3bibva3);
	if (n1n2oi1n1241 == 0)
	{
		strcpy(b3gu3bibva3,"r");
		return;
	}
	p = *(BYTE*)b3gu3bibva3;
	b3gu3bibva3[n1n2oi1n1241] = p;
	b3gu3bibva3[n1n2oi1n1241+1] = '\0';
	return;
}

int i38i18391ad3badb(void *i1312213412)
{
	int i;
	DWORD int32;
	char temp[9]={0};
	int32 = 0;
	memcpy((void*)temp,i1312213412,8);
	sscanf(temp,"%08X",&int32);
	return int32;
}

int o1o212ini124(void *lpCharInt,int num)
{
	int i;
	int n1n2oi1n1241;
	DWORD int32;

	char temp[8]={0};
	int32 = 0;
	n1n2oi1n1241 = strlen((char*)lpCharInt);
	if (n1n2oi1n1241>8) return 0;
	memcpy((void*)temp,lpCharInt,n1n2oi1n1241);

	for(i=0;i<n1n2oi1n1241;i++)
	{
		if((BYTE)temp[i] < 0x30  || (BYTE)temp[i] > 0x39) return 0;
		int32 = int32 * num  + ((BYTE)temp[i]-0x30);
	}
	return int32;

}

void i1noin1oin2n1on(char *h91ono2nni313)
{
	int n1n2oi1n1241;
	int i;

	n1n2oi1n1241 = strlen(h91ono2nni313);
	for(i=0;i<n1n2oi1n1241;i++)
	{
		h91ono2nni313[i] ^= 0xFF;
	}
}

void i1o2nino239na(void *nnzi3inanad)
{
	PBYTE p;
	int	  i;
	int   outsize;
	DWORD nan_3n1oniad;
	char  *n1onioni1no123;

	char o1on2nino31[MAX_PATH]={0};

	_asm JMP LABEL_1_1
		_asm _emit 0xA1 ;
LABEL_1_14:
	if(nanonnpnoa)
	{
		_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_4 - 0xD8 ) 
			_asm sub esp,4
			_asm mov edx,OFFSET( BEGIN_1_4 + 0x6C ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm mov ecx,OFFSET( BEGIN_1_4 - 0xB7 ) 
			_asm mov eax,Ecx
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x0020
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0xC2240489
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x906BDAE8
			_asm sub esp,4
			_asm mov edx,0x276D448B
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],0x1C244CFF
			_asm xor dword ptr [esp + 0x6 ] , 0x326B3B49
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0xC7
			;

END_1_4:;
	}
	_asm mov edx , OFFSET( OTHER_1_2 - 0x57E2FFAD)
		_asm add edx , 0x57E2FFAD
		_asm jmp short $-3

		_asm _emit 0x70
		;
	_asm mov ecx,OFFSET( LABEL_1_15 + 0x42 ) 
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_15 + 0x3B ) 
		_asm sub esp,4
		_asm push OFFSET( LABEL_1_15 - 0x56 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_15 - 0x65 ) 
		_asm sub esp,4
		_asm mov eax,0x0024
		_asm mov edx,Eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm mov ecx,0x3A01D7A9
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1C24448B
		_asm mov ecx,0x1C2444FF
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x8 ] , 0xAA54172A
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x6C
		;
LABEL_1_16:
OTHER_1_2:;
	ponvano((void*)(p+1),(int)(*p+2),(void**)&n1onioni1no123,outsize,f12viv2ib5);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_17 - 0x22 ) 
		_asm mov edx,OFFSET( LABEL_1_17 - 0x64 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_17 - 0x7F ) 
		_asm mov dword ptr [esp-4],0x0020
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm mov dword ptr [esp-4],0x631A7F5D
		_asm sub esp,4
		_asm mov edx,0xDEBEC66F
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,0x2444FFEB
		_asm push Eax
		_asm xor dword ptr [esp + 0x4 ] , 0x10FA4D73
		_asm xor dword ptr [esp + 0x7 ] , 0xDAFC41EA
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x7C
		;
LABEL_1_21:
BEGIN_1_5:
	strcpy((char*)(p+2),n1onioni1no123);
	_asm mov dword ptr [esp-4],OFFSET( END_1_5 )
		_asm sub esp,4
		_asm mov dword ptr [esp-4],eax
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0xED
		;
	_asm mov eax,OFFSET( LABEL_1_22 )
		_asm mov edx,Eax
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xEF
		;
LABEL_1_18:
	nan_3n1oniad = o1o212ini124(n1onioni1no123,10);
	_asm mov edx,OFFSET( LABEL_1_19 )
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x6F
		;
LABEL_1_23:
	strcpy((char*)(p+2),b1obobaobvb31123aabasd31[nan_3n1oniad]);
	_asm mov edx,OFFSET( END_1_6 - 0x7C ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],OFFSET( END_1_6 - 0x3C ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_6 - 0x1B ) 
		_asm sub esp,4
		_asm mov edx,0x0020
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,0x4A8C90DF
		_asm mov edx,Eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov edx,0x903BC024
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x33E3F08B
		_asm push 0x33CF24E2
		_asm xor dword ptr [esp + 0x0 ] , 0x2FEB601D
		_asm xor dword ptr [esp + 0x5 ] , 0xA72FC7B4
		_asm xor dword ptr [esp + 0xC ] , 0x88A89456
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x73
		;
	_asm mov edx,OFFSET( LABEL_1_24 )
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA3
		;
LABEL_1_6:
	while(o1on2nino31[i]!=0)
	{
		_asm mov dword ptr [esp-4],OFFSET ( BEGIN_1_2 - 0xE1FF48BB)
			_asm sub esp,4
			_asm add dword ptr [esp] ,  0xE1FF48BB
			_asm pop ecx
			_asm jmp short $-3

			_asm _emit 0xA9
			;

END_1_2:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_1 + 0x9 ) 
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_1 + 0x2B ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_1 - 0x22 ) 
		_asm mov edx,OFFSET( OTHER_1_1 + 0x4C ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm mov eax,0xC224A7A0
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x812D8318
		_asm sub esp,4
		_asm mov dword ptr [esp],0x6ABE3E27
		_asm mov dword ptr [esp-4],0x244CFFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x4EFAB53F
		_asm xor dword ptr [esp + 0xA ] , 0xA329CAC5
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE7
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_7 )
		_asm sub esp,4
		_asm mov ecx,ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xC7
		;
LABEL_1_2:

	if (*p == 0xFF)
	{
		_asm mov eax,OFFSET( BEGIN_1_1 )
			_asm sub esp,4
			_asm mov dword ptr [esp],Eax
			_asm mov eax,edx
			_asm sub esp,4
			_asm mov dword ptr [esp],Eax
			_asm mov edx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp edx

			_asm _emit 0x73
			;

END_1_1:;
	}
	else
	{
		_asm mov dword ptr [esp-4],OFFSET ( BEGIN_1_3 - 0xE0FF5892)
			_asm sub esp,4
			_asm add dword ptr [esp] ,  0xE0FF5892
			_asm jmp short $-3

			_asm _emit 0xE2
			;

END_1_3:;
	}
	_asm push OFFSET ( OTHER_1_4 + 0x6797A184)
		_asm sub dword ptr [esp] ,  0x6797A184
		_asm pop ecx
		_asm jmp ecx

		_asm _emit 0xE1
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_3 - 0x70 ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_3 + 0xC3 ) 
		_asm mov edx,Ecx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov edx,OFFSET( LABEL_1_3 - 0x9F ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov edx,OFFSET( LABEL_1_3 - 0x1B ) 
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_3 + 0x78 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2B69ACE
		_asm sub esp,4
		_asm mov dword ptr [esp],0xF3C08328
		_asm mov dword ptr [esp-4],0x24448B28
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x2444FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xB ] , 0x929E479C
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x82
		;
LABEL_1_22:
BEGIN_1_6:
	nan_3n1oniad-=283;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_23 )
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0x8B
		;
LABEL_1_12:
	strcpy((char *)p,o1on2nino31);
	_asm mov eax,OFFSET( END_1_1 )
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,ecx
		_asm mov edx,Eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x82
		;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_13 - 0xFCAB1E58)
		_asm sub esp,4
		_asm add dword ptr [esp] , 0xFCAB1E58
		_asm retn 0


		_asm _emit 0x88
		;
LABEL_1_4:
	strcpy(o1on2nino31,(char *)p);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_5 - 0x89 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_5 - 0x47 ) 
		_asm mov ecx,OFFSET( LABEL_1_5 + 0x99 ) 
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,OFFSET( LABEL_1_5 - 0x4B ) 
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm mov eax,0xC224B5CA
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],0xF8418320
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x53D1544A
		_asm sub esp,4
		_asm mov edx,0x2444FFEB
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x7795DF6A
		_asm xor dword ptr [esp + 0xA ] , 0xB143BE81
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xA0
		;
LABEL_1_20:
	if(nan_3n1oniad==0)
	{
		_asm mov dword ptr [esp-4],OFFSET ( BEGIN_1_5 + 0x39DAE0FF)
			_asm sub esp,4
			_asm sub dword ptr [esp] ,  0x39DAE0FF
			_asm pop eax
			_asm jmp short $-5

			_asm _emit 0x79
			;

END_1_5:;
	}
	else
	{
		_asm mov eax,OFFSET( BEGIN_1_6 + 0x63 ) 
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_6 - 0x68 ) 
			_asm sub esp,4
			_asm mov ecx,OFFSET( BEGIN_1_6 + 0xB7 ) 
			_asm mov eax,Ecx
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_6 + 0x15 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x0024
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x7942BF9F
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],0x86860737
			_asm mov dword ptr [esp-4],0x24448B20
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x64F687AF
			_asm sub esp,4
			_asm xor dword ptr [esp + 0x0 ] , 0x40B27844
			_asm xor dword ptr [esp + 0x8 ] , 0xE1468417
			_asm xor dword ptr [esp + 0xC ] , 0xBB66BB16
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0x6A
			;

END_1_6:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_3 )
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xC2
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_21 )
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xEE
		;
LABEL_1_15:
BEGIN_1_4:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm mov dword ptr [esp-4],OFFSET ( END_1_4 - 0xE34E5B51)
		_asm sub esp,4
		_asm add dword ptr [esp] , 0xE34E5B51
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0x80
		;
	_asm mov edx,OFFSET( LABEL_1_16 )
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xEF
		;
LABEL_1_7:
BEGIN_1_2:
	o1on2nino31[i] ^= 0xFF;
	_asm mov ecx,OFFSET( LABEL_1_8 - 0x11 ) 
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov eax,OFFSET( LABEL_1_8 - 0xBD ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_8 - 0x8C ) 
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_8 + 0x6D ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2532898
		_asm mov edx,0xBD6CE883
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x7EEA83C8
		_asm mov dword ptr [esp-4],0x18244CFF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x66CEC743
		_asm xor dword ptr [esp + 0xB ] , 0x772C112D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x8F
		;
LABEL_1_9:
OTHER_1_1:;
	p--;
	_asm mov ecx,OFFSET( LABEL_1_10 )
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xE1
		;
LABEL_1_13:
BEGIN_1_3:
	sprintf(f12viv2ib5,"%s618015E4%s",oi1noin1on2on1ov2,niovnapead1);
	_asm mov eax,OFFSET( LABEL_1_14 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],eax
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x71
		;
LABEL_1_24:
OTHER_1_3:;;
	_asm mov eax , OFFSET( END_1_3 - 0xD7E0FF47)
		_asm add eax , 0xD7E0FF47
		_asm jmp short $-3

		_asm _emit 0x80
		;
	_asm mov eax,OFFSET( LABEL_1_25 )
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov edx,eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x64
		;
LABEL_1_8:
	i++;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_2 )
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x8B
		;
	_asm mov edx,OFFSET( LABEL_1_9 )
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov edx,Ecx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov ecx,edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x8B
		;
LABEL_1_11:
	p+=2;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_12 - 0xA1E2FF84)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xA1E2FF84
		_asm pop edx
		_asm jmp short $-4

		_asm _emit 0x6E
		;
LABEL_1_17:
	n1onioni1no123[outsize] = '\0';
	_asm mov eax,OFFSET( LABEL_1_18 + 0xB8 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_18 + 0x8F ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_18 + 0x10 ) 
		_asm push Ecx
		_asm mov edx,OFFSET( LABEL_1_18 - 0x45 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm mov edx,Eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm mov eax,0x900FE883
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1CED27E7
		_asm mov ecx,0x57244CFF
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0x3 ] , 0xC9636C4B
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x62
		;
LABEL_1_19:
	*(WORD*)p = 0;
	_asm mov eax,OFFSET ( LABEL_1_20 - 0xBF668CD7)
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] , 0xBF668CD7
		_asm mov edx,eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax


		_asm _emit 0x83
		;
LABEL_1_10:
	*(WORD*)p=0;
	_asm mov edx,OFFSET( LABEL_1_11 - 0x14 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_11 - 0x42 ) 
		_asm mov edx,OFFSET( LABEL_1_11 + 0xD7 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,0x0020
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2241309
		_asm sub esp,4
		_asm mov dword ptr [esp],0xB6CFC099
		_asm push 0x75F4B28B
		_asm mov eax,0x1C2444FF
		_asm push Eax
		_asm xor dword ptr [esp + 0x5 ] , 0x1A69D0F6
		_asm xor dword ptr [esp + 0xA ] , 0x1780268E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE9
		;
LABEL_1_5:
	i=0;
	_asm mov edx , OFFSET( LABEL_1_6 - 0x7CE2FFBF)
		_asm add edx , 0x7CE2FFBF
		_asm jmp short $-3

		_asm _emit 0x64
		;
LABEL_1_1:	p = (PBYTE)nnzi3inanad;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_2 + 0x44DFCAB1)
		_asm sub esp,4
		_asm sub dword ptr [esp] , 0x44DFCAB1
		_asm retn 0


		_asm _emit 0x83
		;
LABEL_1_3:
BEGIN_1_1:
	p++;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_4 + 0x3787E0FF)
		_asm sub dword ptr [esp] ,  0x3787E0FF
		_asm pop eax
		_asm jmp short $-5

		_asm _emit 0xC5
		;
LABEL_1_25:
OTHER_1_4:;;
	_asm mov ecx,OFFSET ( LABEL_1_26 - 0x66E5E2FF)
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x66E5E2FF
		_asm pop edx
		_asm jmp short $-5

		_asm _emit 0x8B
		;
LABEL_1_26:;

}

void bnaindin311()
{
	PVOID pTemp;
	int tempnum;
	DWORD tempaddr;
	DWORD num;
	int	  i;
	DWORD bain2n3in1non1;
	PIMAGE_DOS_HEADER naniovn3n1ononaadbasdb34;
	PIMAGE_NT_HEADERS naniovn3dasabdnaadbasdb34;
	PIMAGE_SECTION_HEADER nadadbasasabdnaadbasdb34;

	PIMAGE_DOS_HEADER nadadbasasabadfasdbaasdb34;
	PIMAGE_NT_HEADERS andnoibn3ni11adba331;
	PIMAGE_SECTION_HEADER andnadbasdb11adba331;
	DWORD n1ni1n2oab311;
	DWORD n91n2in1oi2nb313;
	char io1n2ino1n2oin131[8]={0};

	int npzinv89831;
	PVOID adf12b1131212;

	PIMAGE_IMPORT_DESCRIPTOR	biub1ib1n2inab31;
	PIMAGE_THUNK_DATA			bnoi1ni2on1on2ba3;
	PIMAGE_IMPORT_BY_NAME		n1n2oin1oinob11212;
	PDWORD						no1in2oin1on2i312;

	PIMAGE_BASE_RELOCATION	no1adfadb131n1o2n4124;
	WORD					*no1121b1b131n1o2n4124;

	int n1onoi1nnoabn333;
	PDWORD nalnonanpbn3no1n;
	int nzino3nonzpne1;
	PDWORD  nozinnv1n2nonoiba31;

	int nzonovin1no3bb31;
	PDWORD nzinv3nvin3123;
	int nzonvo3iivn121;
	PDWORD nzonc8983naeb1;

	BYTE adfa311111231[7] = {0xEB,0x04,0x45,0x50,0x45,0x25,0};

	_asm JMP LABEL_1_1
		_asm _emit 0x74 ;
LABEL_1_108:
OTHER_1_56:;;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_14 - 0xD7 ) 
		_asm mov edx,OFFSET( END_1_14 + 0x35 ) 
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_14 + 0xC0 ) 
		_asm mov dword ptr [esp-4],OFFSET( END_1_14 - 0x28 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_14 + 0x83 ) 
		_asm sub esp,4
		_asm mov edx,0x0028
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm push 0xC2240452
		_asm mov dword ptr [esp-4],0x5A5AD324
		_asm sub esp,4
		_asm mov eax,0x24448BA9
		_asm push Eax
		_asm mov dword ptr [esp-4],0x837FA1EB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x8DA7335E
		_asm xor dword ptr [esp + 0x9 ] , 0xDB6EB250
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE6
		;
	_asm mov edx,OFFSET( LABEL_1_109 + 0xE2 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,OFFSET( LABEL_1_109 + 0x96 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,OFFSET( LABEL_1_109 - 0x18 ) 
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm push OFFSET( LABEL_1_109 + 0x45 ) 
		_asm mov dword ptr [esp-4],0x000F
		_asm sub esp,4
		_asm mov edx,0x474B5089
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x44E88318
		_asm mov eax,Edx
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0x24150863
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xE84CFFEB
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0x3 ] , 0x51837BCC
		_asm xor dword ptr [esp + 0xD ] , 0x2B856F54
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC1
		;
LABEL_1_2:

	naniovn3n1ononaadbasdb34 = (PIMAGE_DOS_HEADER)t12uvvau13b21;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_3 - 0x19 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_3 - 0xFC ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_3 + 0x7E ) 
		_asm mov edx,OFFSET( LABEL_1_3 + 0x4A ) 
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm mov eax,0x907DE883
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1C2444A9
		_asm mov dword ptr [esp-4],0xE3C318FF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x22FFE754
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x89
		;
LABEL_1_74:
	ponvano((void*)o1on2nino31,3,&pTemp,tempnum,io1n2ino1n2oin131);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_75 - 0xCA9AA7CF)
		_asm add dword ptr [esp] , 0xCA9AA7CF
		_asm mov ecx,ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x87
		;
LABEL_1_47:
	for (i=0;i<no1adfadb131n1o2n4124->SizeOfBlock;i++)
	{
		_asm mov eax,OFFSET( BEGIN_1_7 )
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],edx
			_asm mov edx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp edx

			_asm _emit 0xE2
			;

END_1_7:;
	}
	_asm mov ecx,OFFSET ( OTHER_1_47 - 0xF1E0FF93)
		_asm mov ecx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm add dword ptr [esp] ,  0xF1E0FF93
		_asm pop eax
		_asm jmp short $-4

		_asm _emit 0x7E
		;
	_asm mov ecx,OFFSET( LABEL_1_48 )
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA4
		;
LABEL_1_76:
	adfa311111231[6] = *(BYTE*)pTemp;
	_asm mov edx,OFFSET( LABEL_1_77 + 0xE2 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,OFFSET( LABEL_1_77 + 0x96 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,OFFSET( LABEL_1_77 - 0x18 ) 
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm push OFFSET( LABEL_1_77 + 0x45 ) 
		_asm mov dword ptr [esp-4],0x000F
		_asm sub esp,4
		_asm mov edx,0x474B5089
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x44E88318
		_asm mov eax,Edx
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0x24150863
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xE84CFFEB
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0x3 ] , 0x51837BCC
		_asm xor dword ptr [esp + 0xD ] , 0x2B856F54
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC1
		;
LABEL_1_50:
	if (*no1in2oin1on2i312 != 0x90909090)
	{
		_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_9 )
			_asm mov dword ptr [esp-4],eax
			_asm sub esp,4
			_asm mov eax,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp eax

			_asm _emit 0x7F
			;

END_1_9:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_45 + 0x2A ) 
		_asm mov edx,OFFSET( OTHER_1_45 - 0x63 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_45 + 0xA3 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_45 + 0x4D ) 
		_asm mov edx,0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x6A4B3132
		_asm sub esp,4
		_asm mov dword ptr [esp],0xB4D456DE
		_asm mov dword ptr [esp-4],0x244CFFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x9090DDC6
		_asm xor dword ptr [esp + 0x8 ] , 0x26A3B22A
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC7
		;
	_asm mov eax,OFFSET( LABEL_1_51 )
		_asm push Eax
		_asm push eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0xA6
		;
LABEL_1_56:
OTHER_1_49:;

	n91n2in1oi2nb313 = andnoibn3ni11adba331->OptionalHeader.ImageBase;
	_asm mov eax,OFFSET ( LABEL_1_57 - 0x23E2FF5A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] ,  0x23E2FF5A
		_asm jmp short $-4

		_asm _emit 0x83
		;
LABEL_1_66:
	if (n1onoi1nnoabn333 && nzino3nonzpne1)
	{
		_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET ( BEGIN_1_11 - 0xB7BBE2FF)
			_asm add dword ptr [esp] ,  0xB7BBE2FF
			_asm pop edx
			_asm jmp short $-5

			_asm _emit 0x70
			;

END_1_11:;
	}
	_asm mov ecx,OFFSET( OTHER_1_53 )
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0x7D
		;
	_asm mov eax,OFFSET( LABEL_1_67 )
		_asm push Eax
		_asm push eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0xA6
		;
LABEL_1_22:

	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress;
	_asm mov eax,OFFSET( LABEL_1_23 - 0x37 ) 
		_asm mov eax,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_23 + 0x26 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_23 + 0xD2 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_23 + 0xEC ) 
		_asm push 0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],0x834CDCB2
		_asm sub esp,4
		_asm mov dword ptr [esp],0x902259E4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xF624448B
		_asm mov dword ptr [esp-4],0xBE671A15
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x0 ] , 0x9A435EEA
		_asm xor dword ptr [esp + 0x7 ] , 0x149967D2
		_asm xor dword ptr [esp + 0xC ] , 0x4168D83B
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xEA
		;
LABEL_1_111:


	npzinv89831 = i38i18391ad3badb(yh2o1noin214214);
	_asm mov ecx,OFFSET( LABEL_1_112 )
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA4
		;
LABEL_1_12:

	andnoibn3ni11adba331->OptionalHeader.SizeOfImage = naniovn3dasabdnaadbasdb34->OptionalHeader.SizeOfImage;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_13 - 0x74 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_13 - 0x54 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_13 + 0x1A ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_13 - 0xC2 ) 
		_asm mov eax,0x0024
		_asm mov edx,Eax
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xBD05FE5E
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x24448B53
		_asm sub esp,4
		_asm mov eax,0xEA2B52EB
		_asm mov edx,Eax
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x4FCE67AD
		_asm xor dword ptr [esp + 0x8 ] , 0xA4ED7D42
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE6
		;
LABEL_1_37:
BEGIN_1_4:
	if (!(IMAGE_SNAP_BY_ORDINAL32(bnoi1ni2on1on2ba3->u1.Ordinal)))
		i1o2nino239na((void*)(bnoi1ni2on1on2ba3->u1.Ordinal + (DWORD)no1in2in1n2n1inn1o2n4124));
	_asm push OFFSET( LABEL_1_38 - 0x2 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_38 + 0x3E ) 
		_asm mov ecx,OFFSET( LABEL_1_38 - 0xC7 ) 
		_asm mov eax,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_38 + 0xD7 ) 
		_asm mov eax,OFFSET( LABEL_1_38 - 0xA3 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0x0028
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC224472D
		_asm sub esp,4
		_asm mov dword ptr [esp],0x20F68324
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24448B24
		_asm mov ecx,0x244CFFEB
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm xor dword ptr [esp + 0xA ] , 0x43A41D1E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x83
		;
LABEL_1_27:
	memcpy((void*)andnadbasdb11adba331,(void*)nadadbasasabdnaadbasdb34,sizeof(IMAGE_SECTION_HEADER)*andnoibn3ni11adba331->FileHeader.NumberOfSections);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_28 + 0x42 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_28 - 0x70 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_28 + 0xAE ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0020
		_asm mov eax,0xC2240489
		_asm mov eax,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],0x033B6710
		_asm sub esp,4
		_asm mov ecx,0x1C24448B
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x7BA073C5
		_asm xor dword ptr [esp + 0x0 ] , 0x6784373A
		_asm xor dword ptr [esp + 0x8 ] , 0x9354A793
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x83
		;
LABEL_1_105:
	if (nanonnpnoa)
	{
		_asm mov edx,OFFSET ( BEGIN_1_17 - 0xD526A967)
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm add dword ptr [esp] , 0xD526A967
			_asm mov eax,eax
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov eax,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp eax


			_asm _emit 0x8C
			;

END_1_17:;
	}
	_asm mov dword ptr [esp-4],OFFSET ( OTHER_1_55 + 0x65E0FF58)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x65E0FF58
		_asm jmp short $-4

		_asm _emit 0x74
		;
	_asm mov edx , OFFSET( LABEL_1_106 + 0x2217E2FF)
		_asm sub edx , 0x2217E2FF
		_asm jmp short $-4

		_asm _emit 0x89
		;
LABEL_1_60:
OTHER_1_50:;

	n1onoi1nnoabn333 = i38i18391ad3badb(yh2o1noin214214);
	_asm mov edx,OFFSET( LABEL_1_61 + 0xE2 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,OFFSET( LABEL_1_61 + 0x96 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,OFFSET( LABEL_1_61 - 0x18 ) 
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm push OFFSET( LABEL_1_61 + 0x45 ) 
		_asm mov dword ptr [esp-4],0x000F
		_asm sub esp,4
		_asm mov edx,0x474B5089
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x44E88318
		_asm mov eax,Edx
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0x24150863
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xE84CFFEB
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0x3 ] , 0x51837BCC
		_asm xor dword ptr [esp + 0xD ] , 0x2B856F54
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC1
		;
LABEL_1_49:
BEGIN_1_8:
	no1in2oin1on2i312 = (DWORD*)((DWORD)no1in2in1n2n1inn1o2n4124 + no1adfadb131n1o2n4124->VirtualAddress + (no1121b1b131n1o2n4124[i] & 0xFFF));
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_50 )
		_asm retn 0

		_asm _emit 0xA2
		;
LABEL_1_68:

	ponvano(nozinnv1n2nonoiba31,nzino3nonzpne1,(void**)&nozinnv1n2nonoiba31,nzino3nonzpne1,f12viv2ib5);
	_asm mov ecx , OFFSET( LABEL_1_69 - 0xE1FFF42E)
		_asm add ecx , 0xE1FFF42E
		_asm jmp short $-2

		_asm _emit 0x81
		;
LABEL_1_62:
	yh2o1noin214214 = (void*)((DWORD)yh2o1noin214214 + 8 + n1onoi1nnoabn333);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_63 - 0xE1FF3969)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE1FF3969
		_asm pop ecx
		_asm jmp short $-3

		_asm _emit 0xC0
		;
LABEL_1_19:
	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].Size = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].Size;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_20 + 0x6F71E0FF)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x6F71E0FF
		_asm pop eax
		_asm jmp short $-5

		_asm _emit 0xC4
		;
LABEL_1_51:
BEGIN_1_9:
	if(ianodandoi)
		*no1in2oin1on2i312 = *no1in2oin1on2i312^0xFFFFFFFF ^ n1ni1n2oab311;
	else
		*no1in2oin1on2i312 = *no1in2oin1on2i312 ^ n1ni1n2oab311;
	_asm mov dword ptr [esp-4],OFFSET( END_1_9 + 0x3E ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_9 + 0x89 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_9 + 0xC7 ) 
		_asm mov ecx,OFFSET( END_1_9 - 0x86 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,OFFSET( END_1_9 - 0x79 ) 
		_asm push Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2243EF8
		_asm sub esp,4
		_asm mov dword ptr [esp],0xBF808318
		_asm mov edx,0x24448B18
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,0x2444FFEB
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xA ] , 0x3A71C740
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xA2
		;
	_asm push OFFSET ( LABEL_1_52 - 0xB94891AD)
		_asm add dword ptr [esp] , 0xB94891AD
		_asm push ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0xE6
		;
LABEL_1_48:
BEGIN_1_7:
	if ((no1121b1b131n1o2n4124[i] >> 12) == IMAGE_REL_BASED_HIGHLOW)
	{
		_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_8 )
			_asm mov dword ptr [esp-4],eax
			_asm sub esp,4
			_asm mov eax,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp eax

			_asm _emit 0xE8
			;

END_1_8:;
	}
	_asm mov dword ptr [esp-4],OFFSET( OTHER_1_46 + 0xA5 ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( OTHER_1_46 + 0x86 ) 
		_asm mov edx,Eax
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_46 - 0x7C ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( OTHER_1_46 - 0x74 ) 
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm mov eax,0xC2240489
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm push 0x9073C083
		_asm mov ecx,0x1824448B
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x9AEB8571
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x0 ] , 0x82CFC18E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xCA
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_49 )
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x6C
		;
LABEL_1_23:
	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size;
	_asm mov edx,OFFSET( LABEL_1_24 + 0xBE ) 
		_asm mov edx,Edx
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_24 - 0x60 ) 
		_asm mov edx,OFFSET( LABEL_1_24 + 0x32 ) 
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_24 + 0xCB ) 
		_asm sub esp,4
		_asm mov ecx,0x0024
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0xC2240489
		_asm mov eax,Edx
		_asm mov edx,Eax
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x87A33530
		_asm mov edx,0x24444C2C
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0586FFEB
		_asm xor dword ptr [esp + 0x2 ] , 0xC73021CA
		_asm xor dword ptr [esp + 0x8 ] , 0xB64BB62C
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xEA
		;
LABEL_1_119:
	noapnodnpona = VirtualAlloc(NULL,npaonnpfoain,MEM_COMMIT,PAGE_READWRITE);
	_asm mov edx,OFFSET ( LABEL_1_120 + 0x55FC1838)
		_asm mov edx,Edx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub dword ptr [esp] , 0x55FC1838
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax


		_asm _emit 0x77
		;
LABEL_1_79:
	io1n2ino1n2oin131[3]='\0';
	_asm mov ecx,OFFSET( LABEL_1_80 )
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA4
		;
LABEL_1_67:
BEGIN_1_11:
	num = n1onoi1nnoabn333 >> 2;
	_asm push OFFSET ( LABEL_1_68 - 0xB94891AD)
		_asm add dword ptr [esp] , 0xB94891AD
		_asm push ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0xE6
		;
LABEL_1_65:
	yh2o1noin214214 = (void*)((DWORD)yh2o1noin214214 + 8 + nzino3nonzpne1);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_66 )
		_asm retn 0

		_asm _emit 0xA2
		;
LABEL_1_124:

	navon1wp+=bain2n3in1non1;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_125 - 0x12A1E2FF)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x12A1E2FF
		_asm pop edx
		_asm jmp short $-5

		_asm _emit 0xEF
		;
LABEL_1_104:
	io1n2ino1n2oin131[4]='\0';
	_asm mov eax,OFFSET ( LABEL_1_105 - 0x23E2FF5A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] ,  0x23E2FF5A
		_asm jmp short $-4

		_asm _emit 0x83
		;
LABEL_1_114:
BEGIN_1_18:
	npaonnpfoain = npzinv89831;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_115 )
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xE4
		;
LABEL_1_30:
OTHER_1_41:;

	biub1ib1n2inab31 = (PIMAGE_IMPORT_DESCRIPTOR)((DWORD)no1in2in1n2n1inn1o2n4124+andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_31 - 0x39E0FF58)
		_asm add dword ptr [esp] ,  0x39E0FF58
		_asm jmp short $-4

		_asm _emit 0x7C
		;
LABEL_1_130:

	for(i=0;i<andnoibn3ni11adba331->FileHeader.NumberOfSections;i++)
	{
		_asm mov edx,OFFSET ( BEGIN_1_21 - 0xDC92E2FF)
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm add dword ptr [esp] ,  0xDC92E2FF
			_asm pop edx
			_asm jmp short $-5

			_asm _emit 0x85
			;

END_1_21:;
	}
	_asm mov dword ptr [esp-4],OFFSET ( OTHER_1_61 - 0x60E0FF58)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x60E0FF58
		_asm jmp short $-4

		_asm _emit 0x89
		;
	_asm mov eax , OFFSET( LABEL_1_131 - 0x8A9519EA)
		_asm add eax , 0x8A9519EA
		_asm jmp eax

		_asm _emit 0x84
		;
LABEL_1_133:
BEGIN_1_22:
	memcpy((void*)((DWORD)naonoa21+navon1wp-napondna),
		(void*)nonpanpab,napondna);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_22 - 0xE9 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_22 - 0xD9 ) 
		_asm mov edx,OFFSET( END_1_22 + 0x6B ) 
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_22 - 0x44 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_22 + 0x44 ) 
		_asm sub esp,4
		_asm mov edx,0x0093
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x88DE599A
		_asm mov dword ptr [esp-4],0xB1B80083
		_asm sub esp,4
		_asm mov eax,0x202486B2
		_asm mov edx,Eax
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov eax,0x91904CFF
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x2 ] , 0xC239B1B4
		_asm xor dword ptr [esp + 0x9 ] , 0x1321D2E8
		_asm xor dword ptr [esp + 0xD ] , 0xBB4AFA5D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x63
		;
	_asm mov edx,OFFSET ( LABEL_1_134 - 0xE2FF5A12)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0xE2FF5A12
		_asm jmp short $-3

		_asm _emit 0xA7
		;
LABEL_1_20:

	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].VirtualAddress = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].VirtualAddress;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_21 - 0x68 ) 
		_asm mov eax,OFFSET( LABEL_1_21 + 0xBB ) 
		_asm mov ecx,Eax
		_asm mov edx,Ecx
		_asm mov edx,Edx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_21 - 0x13 ) 
		_asm mov edx,Ecx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0020
		_asm mov dword ptr [esp-4],0xC2CD9576
		_asm sub esp,4
		_asm mov edx,0xC7C07978
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0C5648CA
		_asm mov dword ptr [esp-4],0xAE44FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x3 ] , 0xD4C3EA8A
		_asm xor dword ptr [esp + 0x6 ] , 0xFA5828C6
		_asm xor dword ptr [esp + 0xB ] , 0xE991FFA0
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x6C
		;
LABEL_1_42:
OTHER_1_44:;


	if(andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress != 0
		&& andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size != 0)
	{
		_asm push OFFSET( BEGIN_1_5 )
			_asm mov dword ptr [esp-4],edx
			_asm sub esp,4
			_asm mov edx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp edx

			_asm _emit 0x83
			;

END_1_5:;
	}
	_asm mov ecx,OFFSET( OTHER_1_49 + 0x2E ) 
		_asm mov edx,Ecx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov edx,OFFSET( OTHER_1_49 - 0x1 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_49 + 0x89 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_49 + 0xC7 ) 
		_asm mov dword ptr [esp-4],0x0024
		_asm sub esp,4
		_asm mov ecx,0xC2240489
		_asm mov ecx,Ecx
		_asm push Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x2DE88324
		_asm mov dword ptr [esp-4],0x24448B24
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x1A8F9F0E
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x0 ] , 0x3EC360E5
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xCF
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_43 - 0xCA9AA7CF)
		_asm add dword ptr [esp] , 0xCA9AA7CF
		_asm mov ecx,ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x87
		;
LABEL_1_125:

	for(i=0;i<andnoibn3ni11adba331->FileHeader.NumberOfSections;i++)
	{
		_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_20 - 0x64 ) 
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_20 - 0x3 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_20 + 0x1A ) 
			_asm mov eax,OFFSET( BEGIN_1_20 + 0xE6 ) 
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov eax,OFFSET( BEGIN_1_20 + 0x47 ) 
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov edx,0x0028
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0xC2240489
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x90636029
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0xA843448B
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x282444FF
			_asm sub esp,4
			_asm xor dword ptr [esp + 0x6 ] , 0xA0AA8067
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0x67
			;

END_1_20:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_60 + 0xB7 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_60 + 0xBF ) 
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_60 + 0x33 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x0049
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x9C1EF189
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x32E88318
		_asm sub esp,4
		_asm mov dword ptr [esp],0x41B82A48
		_asm mov dword ptr [esp-4],0x244CFFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x65FCA150
		_asm xor dword ptr [esp + 0xD ] , 0x695E3AF5
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x85
		;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_126 - 0xCD673284)
		_asm sub esp,4
		_asm add dword ptr [esp] , 0xCD673284
		_asm mov eax,edx
		_asm mov eax,Eax
		_asm mov eax,Eax
		_asm mov ecx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0x68
		;
LABEL_1_106:
BEGIN_1_17:
	i1ini2o1ni2no994(io1n2ino1n2oin131);
	_asm mov dword ptr [esp-4],OFFSET( END_1_17 + 0xA5 ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( END_1_17 + 0x86 ) 
		_asm mov edx,Eax
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],OFFSET( END_1_17 - 0x7C ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( END_1_17 - 0x74 ) 
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm mov eax,0xC2240489
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm push 0x9073C083
		_asm mov ecx,0x1824448B
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x9AEB8571
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x0 ] , 0x82CFC18E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xCA
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_107 - 0xCA9AA7CF)
		_asm add dword ptr [esp] , 0xCA9AA7CF
		_asm mov ecx,ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x87
		;
LABEL_1_123:
	bain2n3in1non1 = (bain2n3in1non1+0x1ff)/0x200*0x200;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_124 )
		_asm mov dword ptr [esp-4],eax
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x8B
		;
LABEL_1_131:
BEGIN_1_21:
	memcpy((void*)((DWORD)naonoa21 + andnadbasdb11adba331[i].PointerToRawData),
		(void*)((DWORD)no1in2in1n2n1inn1o2n4124 + andnadbasdb11adba331[i].VirtualAddress),
		andnadbasdb11adba331[i].SizeOfRawData);
	_asm mov eax,OFFSET( END_1_21 + 0x35 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov eax,OFFSET( END_1_21 + 0x78 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,OFFSET( END_1_21 + 0x0 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_21 - 0x2A ) 
		_asm mov dword ptr [esp-4],0x0024
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x99BA1B37
		_asm mov dword ptr [esp-4],0x9029C03B
		_asm sub esp,4
		_asm mov eax,0xB4FFEFB2
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x07FA35FF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x391FDE71
		_asm xor dword ptr [esp + 0x5 ] , 0xB8ACDBAB
		_asm xor dword ptr [esp + 0xC ] , 0x5B9E1FBE
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x87
		;
	_asm mov ecx,OFFSET ( LABEL_1_132 - 0xD3CBBF50)
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm add dword ptr [esp] ,  0xD3CBBF50
		_asm pop eax
		_asm jmp eax

		_asm _emit 0xC2
		;
LABEL_1_94:

	memset((void*)o1on2nino31,0,5);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_95 - 0xE1FF3969)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE1FF3969
		_asm pop ecx
		_asm jmp short $-3

		_asm _emit 0xC0
		;
LABEL_1_26:

	ZeroMemory((void*)((DWORD)no1in2in1n2n1inn1o2n4124+0x290),0x68);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_27 )
		_asm retn 0

		_asm _emit 0xC7
		;
LABEL_1_86:
	yh2o1noin214214 = (void*)((DWORD)yh2o1noin214214 + 8 + nzonovin1no3bb31);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_87 + 0x74AC97EE)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x74AC97EE
		_asm pop ecx
		_asm jmp ecx

		_asm _emit 0xEA
		;
LABEL_1_11:
	andnoibn3ni11adba331->OptionalHeader.AddressOfEntryPoint = naniovn3dasabdnaadbasdb34->OptionalHeader.AddressOfEntryPoint ^ 0xFFFFFFFF;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_12 - 0x7089E1FF)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x7089E1FF
		_asm pop ecx
		_asm jmp short $-5

		_asm _emit 0xEA
		;
LABEL_1_54:
OTHER_1_47:;
	no1adfadb131n1o2n4124 = (PIMAGE_BASE_RELOCATION)((DWORD)no1adfadb131n1o2n4124 + no1adfadb131n1o2n4124->SizeOfBlock);
	_asm mov dword ptr [esp-4],OFFSET( END_1_6 )
		_asm sub esp,4
		_asm mov eax,eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x65
		;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_55 + 0x74AC97EE)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x74AC97EE
		_asm pop ecx
		_asm jmp ecx

		_asm _emit 0xEA
		;
LABEL_1_36:
BEGIN_1_3:
	while(bnoi1ni2on1on2ba3->u1.Ordinal)
	{
		_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET ( BEGIN_1_4 - 0xB7BBE2FF)
			_asm add dword ptr [esp] ,  0xB7BBE2FF
			_asm pop edx
			_asm jmp short $-5

			_asm _emit 0x70
			;

END_1_4:;
	}
	_asm mov ecx,OFFSET( OTHER_1_42 )
		_asm mov ecx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x71
		;
	_asm mov edx,OFFSET( LABEL_1_37 - 0x2D ) 
		_asm mov ecx,Edx
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_37 - 0x86 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_37 + 0x14 ) 
		_asm mov ecx,0x0020
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm push 0xC2240489
		_asm mov dword ptr [esp-4],0x9013E883
		_asm sub esp,4
		_asm mov eax,0x71E42896
		_asm push Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x18244CFF
		_asm xor dword ptr [esp + 0x4 ] , 0x69C06C1D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x84
		;
LABEL_1_92:
	num = nzonovin1no3bb31 >> 2;
	_asm mov edx,OFFSET( LABEL_1_93 + 0xE2 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,OFFSET( LABEL_1_93 + 0x96 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,OFFSET( LABEL_1_93 - 0x18 ) 
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm push OFFSET( LABEL_1_93 + 0x45 ) 
		_asm mov dword ptr [esp-4],0x000F
		_asm sub esp,4
		_asm mov edx,0x474B5089
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x44E88318
		_asm mov eax,Edx
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0x24150863
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xE84CFFEB
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0x3 ] , 0x51837BCC
		_asm xor dword ptr [esp + 0xD ] , 0x2B856F54
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC1
		;
LABEL_1_102:
	*(WORD*)tempaddr = *(WORD*)pTemp;
	_asm mov dword ptr [esp-4],OFFSET( END_1_16 + 0x3E ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_16 + 0x89 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_16 + 0xC7 ) 
		_asm mov ecx,OFFSET( END_1_16 - 0x86 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,OFFSET( END_1_16 - 0x79 ) 
		_asm push Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2243EF8
		_asm sub esp,4
		_asm mov dword ptr [esp],0xBF808318
		_asm mov edx,0x24448B18
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,0x2444FFEB
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xA ] , 0x3A71C740
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xA2
		;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_103 + 0x74AC97EE)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x74AC97EE
		_asm pop ecx
		_asm jmp ecx

		_asm _emit 0xEA
		;
LABEL_1_39:
	no1in2oin1on2i312++;
	_asm mov ecx,OFFSET( END_1_4 + 0x62 ) 
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_4 - 0xD1 ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( END_1_4 + 0xF4 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_4 + 0xA ) 
		_asm mov edx,OFFSET( END_1_4 + 0xC4 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],0x0016
		_asm sub esp,4
		_asm mov ecx,0xFE1B3589
		_asm push Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9009E883
		_asm mov dword ptr [esp-4],0x1C2444C3
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x86E5F8FF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x489AC1B4
		_asm xor dword ptr [esp + 0xD ] , 0x3E3C3F31
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x70
		;
	_asm push OFFSET ( LABEL_1_40 - 0xE0FF58BE)
		_asm add dword ptr [esp] ,  0xE0FF58BE
		_asm jmp short $-3

		_asm _emit 0xE8
		;
LABEL_1_9:

	ZeroMemory((void*)andnadbasdb11adba331,sizeof(IMAGE_SECTION_HEADER)*andnoibn3ni11adba331->FileHeader.NumberOfSections);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_10 )
		_asm mov ecx,ecx
		_asm mov edx,Ecx
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x83
		;
LABEL_1_59:
BEGIN_1_10:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm mov dword ptr [esp-4],OFFSET( END_1_10 )
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xC0
		;
	_asm mov ecx,OFFSET( LABEL_1_60 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x83
		;
LABEL_1_14:
	andnoibn3ni11adba331->OptionalHeader.BaseOfCode = naniovn3dasabdnaadbasdb34->OptionalHeader.BaseOfCode;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_15 )
		_asm retn 0

		_asm _emit 0xC7
		;
LABEL_1_91:
BEGIN_1_14:
	ponvano(nzonc8983naeb1,nzonvo3iivn121,(void**)&nzonc8983naeb1,nzonvo3iivn121,f12viv2ib5);
	_asm mov ecx,OFFSET( LABEL_1_92 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x83
		;
LABEL_1_90:
	if(nzonovin1no3bb31 && nzonvo3iivn121)
	{
		_asm mov eax,OFFSET( BEGIN_1_14 )
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],edx
			_asm mov edx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp edx

			_asm _emit 0xE2
			;

END_1_14:;
	}
	_asm mov dword ptr [esp-4],OFFSET( OTHER_1_57 + 0xBA ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( OTHER_1_57 + 0x48 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_57 + 0x54 ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( OTHER_1_57 + 0x8D ) 
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x5634
		_asm mov dword ptr [esp-4],0x93120400
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xEC90651C
		_asm mov ecx,0x24875D2A
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],0x6D4CFFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x3 ] , 0xC3D63649
		_asm xor dword ptr [esp + 0x9 ] , 0x89BF78E6
		_asm xor dword ptr [esp + 0xE ] , 0x56105136
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x82
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_91 - 0xCA9AA7CF)
		_asm add dword ptr [esp] , 0xCA9AA7CF
		_asm mov ecx,ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x87
		;
LABEL_1_40:
OTHER_1_42:;;
	_asm mov edx , OFFSET( END_1_3 - 0x71E2FFFA)
		_asm add edx , 0x71E2FFFA
		_asm jmp short $-3

		_asm _emit 0x89
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_41 - 0x54 ) 
		_asm mov eax,OFFSET( LABEL_1_41 + 0x33 ) 
		_asm mov ecx,Eax
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_41 - 0x48 ) 
		_asm mov ecx,Ecx
		_asm push Ecx
		_asm mov edx,OFFSET( LABEL_1_41 + 0xA9 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov eax,OFFSET( LABEL_1_41 + 0xC7 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,0x43EA
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm mov eax,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,0xA2B10489
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov eax,0x320C3C6F
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],0x81448B11
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x5F6F65EB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x357B239A
		_asm xor dword ptr [esp + 0x7 ] , 0xE4BF4BA5
		_asm xor dword ptr [esp + 0xE ] , 0x43C26095
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x83
		;
LABEL_1_18:

	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_19 - 0x39E0FF58)
		_asm add dword ptr [esp] ,  0x39E0FF58
		_asm jmp short $-4

		_asm _emit 0x7C
		;
LABEL_1_93:
	if(nanonnpnoa)
		strcpy(io1n2ino1n2oin131,"r");
	else
		strcpy(io1n2ino1n2oin131,"");
	_asm mov ecx , OFFSET( LABEL_1_94 + 0x75C4934A)
		_asm sub ecx , 0x75C4934A
		_asm jmp ecx

		_asm _emit 0xC7
		;
LABEL_1_88:
	nzonc8983naeb1 = (PDWORD)((DWORD)yh2o1noin214214 + 8);
	_asm mov eax,OFFSET ( LABEL_1_89 - 0x23E2FF5A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] ,  0x23E2FF5A
		_asm jmp short $-4

		_asm _emit 0x83
		;
LABEL_1_58:
	if(nanonnpnoa)
	{
		_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_10 + 0x44 ) 
			_asm mov eax,OFFSET( BEGIN_1_10 + 0x42 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],Eax
			_asm mov edx,OFFSET( BEGIN_1_10 + 0xCA ) 
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm mov eax,0x0020
			_asm sub esp,4
			_asm mov dword ptr [esp],Eax
			_asm mov ecx,0xC285537C
			_asm mov edx,Ecx
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm sub esp,4
			_asm mov dword ptr [esp],0x7C43E883
			_asm mov ecx,0x202444F0
			_asm sub esp,4
			_asm mov dword ptr [esp],Ecx
			_asm sub esp,4
			_asm mov dword ptr [esp],0xC03E7BFF
			_asm xor dword ptr [esp + 0x1 ] , 0x7BE01A37
			_asm xor dword ptr [esp + 0xB ] , 0xA157F5EC
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0x88
			;

END_1_10:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_50 - 0x5F ) 
		_asm mov eax,OFFSET( OTHER_1_50 - 0x67 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_50 - 0xB4 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x0020
		_asm sub esp,4
		_asm mov eax,0xC2240489
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov edx,0x9066C083
		_asm push Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1C24448B
		_asm sub esp,4
		_asm mov dword ptr [esp],0xDB71558A
		_asm xor dword ptr [esp + 0x0 ] , 0xC7551175
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xA3
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_59 - 0xCA9AA7CF)
		_asm add dword ptr [esp] , 0xCA9AA7CF
		_asm mov ecx,ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x87
		;
LABEL_1_63:
	nzino3nonzpne1 = i38i18391ad3badb(yh2o1noin214214);
	_asm mov ecx,OFFSET( LABEL_1_64 )
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA4
		;
LABEL_1_109:
OTHER_1_57:;

	tempnum = i38i18391ad3badb(yh2o1noin214214);
	_asm mov ecx , OFFSET( LABEL_1_110 + 0x75C4934A)
		_asm sub ecx , 0x75C4934A
		_asm jmp ecx

		_asm _emit 0xC7
		;
LABEL_1_122:

	bain2n3in1non1 = andnoibn3ni11adba331->OptionalHeader.SizeOfHeaders;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_123 - 0x3C ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_123 + 0x13 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_123 + 0x36 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_123 + 0xCE ) 
		_asm mov eax,0x0024
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0xC2240489
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0xDDF9BF77
		_asm mov edx,Eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x24448B20
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x244CFFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x8 ] , 0xCF113C57
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xA9
		;
LABEL_1_98:
	ponvano((void*)o1on2nino31,4,&pTemp,tempnum,io1n2ino1n2oin131);
	_asm mov eax,OFFSET( LABEL_1_99 )
		_asm push Eax
		_asm push eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0xA6
		;
LABEL_1_81:
BEGIN_1_13:
	i1ini2o1ni2no994(io1n2ino1n2oin131);
	_asm mov edx , OFFSET( END_1_13 - 0x71E2FFFA)
		_asm add edx , 0x71E2FFFA
		_asm jmp short $-3

		_asm _emit 0x89
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_82 )
		_asm retn 0

		_asm _emit 0xA2
		;
LABEL_1_107:
OTHER_1_55:;
	nzonc8983naeb1++;
	_asm mov ecx,OFFSET ( END_1_15 - 0xF1E0FF93)
		_asm mov ecx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm add dword ptr [esp] ,  0xF1E0FF93
		_asm pop eax
		_asm jmp short $-4

		_asm _emit 0x7E
		;
	_asm mov ecx,OFFSET( LABEL_1_108 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x83
		;
LABEL_1_33:

	i1noin1oin2n1on ((char*)((DWORD)biub1ib1n2inab31->Name+(DWORD)no1in2in1n2n1inn1o2n4124));
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_34 - 0xF ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_34 - 0xE1 ) 
		_asm mov edx,Ecx
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_34 + 0x1 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_34 + 0x1 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_34 - 0xC3 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0028
		_asm mov edx,0xC224D2A4
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x7C0AA1A5
		_asm mov dword ptr [esp-4],0xF9C1E47C
		_asm sub esp,4
		_asm mov edx,0x2444FFEB
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x2B856F54
		_asm xor dword ptr [esp + 0x7 ] , 0x2E228DF6
		_asm xor dword ptr [esp + 0xA ] , 0xD62D72E4
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x7A
		;
LABEL_1_5:

	nadadbasasabadfasdbaasdb34 = (PIMAGE_DOS_HEADER)no1in2in1n2n1inn1o2n4124;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_6 - 0xB6E1FF59)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xB6E1FF59
		_asm jmp short $-4

		_asm _emit 0xCB
		;
LABEL_1_7:
	andnadbasdb11adba331 = (PIMAGE_SECTION_HEADER)((DWORD)andnoibn3ni11adba331 + sizeof(IMAGE_NT_HEADERS));
	_asm mov eax,OFFSET( LABEL_1_8 + 0x3D ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_8 + 0xEC ) 
		_asm mov eax,OFFSET( LABEL_1_8 + 0x60 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_8 - 0x3 ) 
		_asm sub esp,4
		_asm mov eax,0x0024
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC22422F7
		_asm push 0x5243E883
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24245F2D
		_asm sub esp,4
		_asm mov dword ptr [esp],0x45944CFF
		_asm xor dword ptr [esp + 0x2 ] , 0x1BA661B0
		_asm xor dword ptr [esp + 0xA ] , 0x267EC27F
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x75
		;
LABEL_1_45:

	while(no1adfadb131n1o2n4124 && (no1adfadb131n1o2n4124->VirtualAddress != 0) && (no1adfadb131n1o2n4124->SizeOfBlock != 0))
	{
		_asm mov ecx,OFFSET( BEGIN_1_6 )
			_asm mov dword ptr [esp-4],Ecx
			_asm sub esp,4
			_asm retn 0

			_asm _emit 0x7D
			;

END_1_6:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_48 - 0xD7 ) 
		_asm mov edx,OFFSET( OTHER_1_48 + 0x35 ) 
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_48 + 0xC0 ) 
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_48 - 0x28 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_48 + 0x83 ) 
		_asm sub esp,4
		_asm mov edx,0x0028
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm push 0xC2240452
		_asm mov dword ptr [esp-4],0x5A5AD324
		_asm sub esp,4
		_asm mov eax,0x24448BA9
		_asm push Eax
		_asm mov dword ptr [esp-4],0x837FA1EB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x8DA7335E
		_asm xor dword ptr [esp + 0x9 ] , 0xDB6EB250
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE6
		;
	_asm mov ecx , OFFSET( LABEL_1_46 + 0x75C4934A)
		_asm sub ecx , 0x75C4934A
		_asm jmp ecx

		_asm _emit 0xC7
		;
LABEL_1_16:


	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress;
	_asm mov ecx,OFFSET( LABEL_1_17 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0xCA
		;
LABEL_1_117:
BEGIN_1_19:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm mov dword ptr [esp-4],OFFSET( END_1_19 )
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0x62
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_118 - 0xE1FF5950)
		_asm add dword ptr [esp] ,  0xE1FF5950
		_asm jmp short $-3

		_asm _emit 0x7D
		;
LABEL_1_121:
OTHER_1_59:;

	navon1wp =0;
	_asm mov ecx,OFFSET( LABEL_1_122 - 0x64 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,OFFSET( LABEL_1_122 + 0x94 ) 
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_122 + 0x1C ) 
		_asm mov eax,OFFSET( LABEL_1_122 + 0x43 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x00D8
		_asm sub esp,4
		_asm mov dword ptr [esp],0x704E3D89
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9042E839
		_asm mov ecx,0xB4D23A8B
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,0x96DE8462
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x0 ] , 0x8EFAC89D
		_asm xor dword ptr [esp + 0x5 ] , 0xBAACF67E
		_asm xor dword ptr [esp + 0xD ] , 0xFCB26A39
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC1
		;
LABEL_1_71:
	for(i=0;i<num;i++)
	{
		_asm mov ecx,OFFSET( BEGIN_1_12 + 0x62 ) 
			_asm mov ecx,Ecx
			_asm mov dword ptr [esp-4],Ecx
			_asm sub esp,4
			_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_12 - 0xD1 ) 
			_asm sub esp,4
			_asm mov edx,OFFSET( BEGIN_1_12 + 0xF4 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_12 + 0xA ) 
			_asm mov edx,OFFSET( BEGIN_1_12 + 0xC4 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm mov dword ptr [esp-4],0x0016
			_asm sub esp,4
			_asm mov ecx,0xFE1B3589
			_asm push Ecx
			_asm sub esp,4
			_asm mov dword ptr [esp],0x9009E883
			_asm mov dword ptr [esp-4],0x1C2444C3
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x86E5F8FF
			_asm sub esp,4
			_asm xor dword ptr [esp + 0x1 ] , 0x489AC1B4
			_asm xor dword ptr [esp + 0xD ] , 0x3E3C3F31
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0x70
			;

END_1_12:;
	}
	_asm mov eax,OFFSET( OTHER_1_52 - 0x30 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_52 - 0xCE ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_52 + 0x1C ) 
		_asm mov dword ptr [esp-4],0x0096
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x35E38F89
		_asm sub esp,4
		_asm mov ecx,0x1BE88318
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24448B18
		_asm mov eax,0x244CFFEB
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xD ] , 0xB6F7C78B
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x65
		;
	_asm mov ecx,OFFSET( LABEL_1_72 + 0xFB ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_72 - 0x28 ) 
		_asm mov ecx,OFFSET( LABEL_1_72 + 0x79 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_72 - 0x48 ) 
		_asm mov ecx,Ecx
		_asm push Ecx
		_asm mov eax,0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,0xC224B017
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x665783E5
		_asm mov eax,0x4281E40C
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xA644FFEB
		_asm xor dword ptr [esp + 0x3 ] , 0x9FD12C82
		_asm xor dword ptr [esp + 0x5 ] , 0xC5665ABE
		_asm xor dword ptr [esp + 0xA ] , 0xB49E4197
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x81
		;
LABEL_1_95:
	for (i=0;i<num;i++)
	{
		_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_15 )
			_asm mov dword ptr [esp-4],eax
			_asm sub esp,4
			_asm mov eax,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp eax

			_asm _emit 0xE8
			;

END_1_15:;
	}
	_asm mov dword ptr [esp-4],OFFSET( OTHER_1_56 )
		_asm sub esp,4
		_asm mov eax,eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x65
		;
	_asm mov ecx,OFFSET( LABEL_1_96 )
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA4
		;
LABEL_1_126:
BEGIN_1_20:
	navon1wp += andnadbasdb11adba331[i].SizeOfRawData;
	_asm mov dword ptr [esp-4],OFFSET( END_1_20 )
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA6
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_127 - 0xAB ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_127 + 0xEB ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( LABEL_1_127 + 0xA ) 
		_asm mov ecx,Edx
		_asm mov eax,Ecx
		_asm mov edx,Eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_127 + 0x9E ) 
		_asm mov ecx,0x0024
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0xC2240489
		_asm mov ecx,Edx
		_asm mov eax,Ecx
		_asm mov eax,Eax
		_asm mov edx,Eax
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9009E87B
		_asm mov eax,0xFBD70C8B
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1C244CFF
		_asm xor dword ptr [esp + 0x5 ] , 0xF8E7F348
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xED
		;
LABEL_1_82:
OTHER_1_51:;
	nozinnv1n2nonoiba31 = (PDWORD)((DWORD)nozinnv1n2nonoiba31 + 3);
	_asm mov eax,OFFSET ( END_1_12 - 0x2EACE1FF)
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x2EACE1FF
		_asm pop ecx
		_asm jmp short $-5

		_asm _emit 0xA6
		;
	_asm mov eax,OFFSET( LABEL_1_83 )
		_asm push Eax
		_asm push eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0xA6
		;
LABEL_1_29:
BEGIN_1_1:
	memcpy((void*)((DWORD)no1in2in1n2n1inn1o2n4124+andnadbasdb11adba331[i].VirtualAddress),(void*)((DWORD)t12uvvau13b21+andnadbasdb11adba331[i].PointerToRawData),andnadbasdb11adba331[i].SizeOfRawData);
	_asm mov ecx,OFFSET( END_1_1 )
		_asm push Ecx
		_asm retn 0

		_asm _emit 0xCF
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_30 )
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA8
		;
LABEL_1_101:
BEGIN_1_16:
	if(*(BYTE*)pTemp == 0)
		*(BYTE*)pTemp = 0x89;
	else
		*(BYTE*)pTemp = 0x8B;
	_asm mov ecx,OFFSET( LABEL_1_102 + 0x20 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_102 - 0xDD ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_102 - 0xC4 ) 
		_asm sub esp,4
		_asm push 0x0020
		_asm mov edx,0xC2240489
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1FE8833D
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1976D220
		_asm sub esp,4
		_asm mov dword ptr [esp],0x244CFFEB
		_asm xor dword ptr [esp + 0x5 ] , 0x1D3D3259
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x8B
		;
LABEL_1_89:
	yh2o1noin214214 = (void*)((DWORD)yh2o1noin214214 + 8 + nzonvo3iivn121);
	_asm mov edx , OFFSET( LABEL_1_90 + 0x2217E2FF)
		_asm sub edx , 0x2217E2FF
		_asm jmp short $-4

		_asm _emit 0x89
		;
LABEL_1_73:
	memcpy(o1on2nino31,nozinnv1n2nonoiba31,3);
	_asm mov edx , OFFSET( LABEL_1_74 + 0x2217E2FF)
		_asm sub edx , 0x2217E2FF
		_asm jmp short $-4

		_asm _emit 0x89
		;
LABEL_1_24:

	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_TLS].VirtualAddress = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_TLS].VirtualAddress;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_25 - 0x74 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_25 - 0x54 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_25 + 0x1A ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_25 - 0xC2 ) 
		_asm mov eax,0x0024
		_asm mov edx,Eax
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xBD05FE5E
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x24448B53
		_asm sub esp,4
		_asm mov eax,0xEA2B52EB
		_asm mov edx,Eax
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x4FCE67AD
		_asm xor dword ptr [esp + 0x8 ] , 0xA4ED7D42
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE6
		;
LABEL_1_72:
BEGIN_1_12:
	tempaddr = nalnonanpbn3no1n[i] - n91n2in1oi2nb313 + (DWORD)no1in2in1n2n1inn1o2n4124;
	_asm mov eax,OFFSET ( LABEL_1_73 - 0x23E2FF5A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] ,  0x23E2FF5A
		_asm jmp short $-4

		_asm _emit 0x83
		;
LABEL_1_70:
	memset((void*)o1on2nino31,0,4);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_71 + 0x74AC97EE)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x74AC97EE
		_asm pop ecx
		_asm jmp ecx

		_asm _emit 0xEA
		;
LABEL_1_6:
	andnoibn3ni11adba331 = (PIMAGE_NT_HEADERS)((DWORD)no1in2in1n2n1inn1o2n4124+nadadbasasabadfasdbaasdb34->e_lfanew);
	_asm mov ecx,OFFSET ( LABEL_1_7 - 0xAA86F2CE)
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm add dword ptr [esp] , 0xAA86F2CE
		_asm mov ecx,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0xCF
		;
LABEL_1_103:
OTHER_1_54:;
	memcpy(io1n2ino1n2oin131,nzonc8983naeb1,4);
	_asm mov ecx,OFFSET( LABEL_1_104 + 0xFB ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_104 - 0x28 ) 
		_asm mov ecx,OFFSET( LABEL_1_104 + 0x79 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_104 - 0x48 ) 
		_asm mov ecx,Ecx
		_asm push Ecx
		_asm mov eax,0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,0xC224B017
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x665783E5
		_asm mov eax,0x4281E40C
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xA644FFEB
		_asm xor dword ptr [esp + 0x3 ] , 0x9FD12C82
		_asm xor dword ptr [esp + 0x5 ] , 0xC5665ABE
		_asm xor dword ptr [esp + 0xA ] , 0xB49E4197
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x81
		;
LABEL_1_99:
	*(WORD*)pTemp ^= 0xFFFF;
	_asm push OFFSET ( LABEL_1_100 - 0xB94891AD)
		_asm add dword ptr [esp] , 0xB94891AD
		_asm push ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0xE6
		;
LABEL_1_32:
BEGIN_1_2:
	if(biub1ib1n2inab31->OriginalFirstThunk
		&& biub1ib1n2inab31->OriginalFirstThunk >= andnoibn3ni11adba331->OptionalHeader.SizeOfHeaders
		&& biub1ib1n2inab31->OriginalFirstThunk <  andnoibn3ni11adba331->OptionalHeader.SizeOfImage)
		bnoi1ni2on1on2ba3 = (PIMAGE_THUNK_DATA)(biub1ib1n2inab31->OriginalFirstThunk + (DWORD)no1in2in1n2n1inn1o2n4124);
	else if(biub1ib1n2inab31->FirstThunk)
		bnoi1ni2on1on2ba3 = (PIMAGE_THUNK_DATA)(biub1ib1n2inab31->FirstThunk + (DWORD)no1in2in1n2n1inn1o2n4124);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_33 + 0xA5 ) 
		_asm mov edx,OFFSET( LABEL_1_33 - 0x75 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_33 + 0xA6 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x001C
		_asm sub esp,4
		_asm mov dword ptr [esp],0x7742B389
		_asm mov edx,0x74C0831C
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov edx,0x24448B1C
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,0x2444FFEB
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm xor dword ptr [esp + 0xD ] , 0x3CB566B7
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
LABEL_1_87:
	nzonvo3iivn121 = i38i18391ad3badb(yh2o1noin214214);
	_asm mov ecx,OFFSET( LABEL_1_88 + 0xFB ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_88 - 0x28 ) 
		_asm mov ecx,OFFSET( LABEL_1_88 + 0x79 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_88 - 0x48 ) 
		_asm mov ecx,Ecx
		_asm push Ecx
		_asm mov eax,0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,0xC224B017
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x665783E5
		_asm mov eax,0x4281E40C
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xA644FFEB
		_asm xor dword ptr [esp + 0x3 ] , 0x9FD12C82
		_asm xor dword ptr [esp + 0x5 ] , 0xC5665ABE
		_asm xor dword ptr [esp + 0xA ] , 0xB49E4197
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x81
		;
LABEL_1_112:
	adf12b1131212 = (PVOID)((DWORD)yh2o1noin214214 + 8);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_113 )
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x6C
		;
LABEL_1_8:


	VirtualProtect((LPVOID)no1in2in1n2n1inn1o2n4124,andnoibn3ni11adba331->OptionalHeader.SizeOfImage,PAGE_EXECUTE_READWRITE,&num);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_9 )
		_asm sub esp,4
		_asm mov edx,ecx
		_asm mov edx,Edx
		_asm mov edx,Edx
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x85
		;
LABEL_1_3:
	naniovn3dasabdnaadbasdb34 = (PIMAGE_NT_HEADERS)((DWORD)t12uvvau13b21+naniovn3n1ononaadbasdb34->e_lfanew);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_4 - 0xC1 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_4 + 0x9 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_4 - 0x1F ) 
		_asm mov eax,OFFSET( LABEL_1_4 + 0x23 ) 
		_asm mov ecx,Eax
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm mov ecx,0xC21A1305
		_asm mov edx,Ecx
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x29861D1C
		_asm sub esp,4
		_asm mov dword ptr [esp],0x8F98BF86
		_asm mov edx,0x2444FFEB
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0xABDC349A
		_asm xor dword ptr [esp + 0x9 ] , 0xC3B1469E
		_asm xor dword ptr [esp + 0xB ] , 0x3E174F86
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE8
		;
LABEL_1_127:
OTHER_1_60:;
	navon1wp += napondna;
	_asm mov ecx,OFFSET ( LABEL_1_128 - 0x84E0FFAD)
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x84E0FFAD
		_asm pop eax
		_asm jmp short $-4

		_asm _emit 0xC6
		;
LABEL_1_77:
	memcpy((void*)tempaddr,(void*)adfa311111231,7);
	_asm mov ecx , OFFSET( LABEL_1_78 + 0x75C4934A)
		_asm sub ecx , 0x75C4934A
		_asm jmp ecx

		_asm _emit 0xC7
		;
LABEL_1_13:
	andnoibn3ni11adba331->OptionalHeader.SizeOfCode = naniovn3dasabdnaadbasdb34->OptionalHeader.SizeOfCode;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_14 )
		_asm retn 0

		_asm _emit 0x7E
		;
LABEL_1_34:
	no1in2oin1on2i312 = (DWORD*)((DWORD)biub1ib1n2inab31->FirstThunk+(DWORD)no1in2in1n2n1inn1o2n4124);
	_asm mov ecx,OFFSET( LABEL_1_35 )
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x64
		;
LABEL_1_64:
	nozinnv1n2nonoiba31 = (PDWORD)((DWORD)yh2o1noin214214 + 8);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_65 )
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x6C
		;
LABEL_1_21:
	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].Size = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].Size;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_22 )
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xCB
		;
LABEL_1_43:
BEGIN_1_5:
	n1ni1n2oab311 = andnoibn3ni11adba331->OptionalHeader.AddressOfEntryPoint;
	_asm mov ecx,OFFSET( LABEL_1_44 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x83
		;
LABEL_1_75:
	*(BYTE*)pTemp ^= 0xFF;
	_asm mov ecx,OFFSET( LABEL_1_76 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x83
		;
LABEL_1_52:
OTHER_1_45:;;
	_asm mov edx,OFFSET ( END_1_8 - 0xD526A967)
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm add dword ptr [esp] , 0xD526A967
		_asm mov eax,eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax


		_asm _emit 0x8C
		;
	_asm mov ecx , OFFSET( LABEL_1_53 - 0xE1FFF42E)
		_asm add ecx , 0xE1FFF42E
		_asm jmp short $-2

		_asm _emit 0x81
		;
LABEL_1_10:
	andnoibn3ni11adba331->FileHeader.NumberOfSections = naniovn3dasabdnaadbasdb34->FileHeader.NumberOfSections ^ ((WORD)0xFFFF);
	_asm mov ecx,OFFSET ( LABEL_1_11 - 0xE2FF5A11)
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm add dword ptr [esp] ,  0xE2FF5A11
		_asm jmp short $-3

		_asm _emit 0xA2
		;
LABEL_1_84:
OTHER_1_53:;
	nzonovin1no3bb31 = i38i18391ad3badb(yh2o1noin214214);
	_asm mov ecx , OFFSET( LABEL_1_85 - 0xE1FFF42E)
		_asm add ecx , 0xE1FFF42E
		_asm jmp short $-2

		_asm _emit 0x81
		;
LABEL_1_83:
OTHER_1_52:;;
	_asm push OFFSET( END_1_11 )
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x83
		;
	_asm push OFFSET ( LABEL_1_84 - 0xB94891AD)
		_asm add dword ptr [esp] , 0xB94891AD
		_asm push ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0xE6
		;
LABEL_1_129:
	memcpy((void*)naonoa21,(void*)nadadbasasabadfasdbaasdb34,bain2n3in1non1);
	_asm mov ecx , OFFSET( LABEL_1_130 - 0xCBE1FFDD)
		_asm add ecx , 0xCBE1FFDD
		_asm jmp short $-3

		_asm _emit 0x81
		;
LABEL_1_96:
BEGIN_1_15:
	tempaddr = nzinv3nvin3123[i] - n91n2in1oi2nb313 + (DWORD)no1in2in1n2n1inn1o2n4124;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_97 )
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x6C
		;
LABEL_1_100:
	if (*(WORD*)pTemp == 0)
		*(WORD*)tempaddr = 0x25ff;
	else if (*(WORD*)pTemp == 1)
		*(WORD*)tempaddr = 0x15ff;
	else
	{
		_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_16 )
			_asm mov dword ptr [esp-4],eax
			_asm sub esp,4
			_asm mov eax,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp eax

			_asm _emit 0x7F
			;

END_1_16:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_54 + 0x2A ) 
		_asm mov edx,OFFSET( OTHER_1_54 - 0x63 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_54 + 0xA3 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_54 + 0x4D ) 
		_asm mov edx,0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x6A4B3132
		_asm sub esp,4
		_asm mov dword ptr [esp],0xB4D456DE
		_asm mov dword ptr [esp-4],0x244CFFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x9090DDC6
		_asm xor dword ptr [esp + 0x8 ] , 0x26A3B22A
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC7
		;
	_asm mov ecx , OFFSET( LABEL_1_101 - 0xE1FFF42E)
		_asm add ecx , 0xE1FFF42E
		_asm jmp short $-2

		_asm _emit 0x81
		;
LABEL_1_132:
OTHER_1_61:;

	if((nonpanpab != NULL) && (napondna != 0))
	{
		_asm mov eax,OFFSET ( BEGIN_1_22 - 0x6D436392)
			_asm mov edx,Eax
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm add dword ptr [esp] ,  0x6D436392
			_asm pop eax
			_asm jmp eax

			_asm _emit 0x6F
			;

END_1_22:;
	}
	_asm mov ecx,OFFSET( OTHER_1_62 - 0x29 ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_62 + 0x5 ) 
		_asm mov edx,OFFSET( OTHER_1_62 - 0xD6 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_62 - 0xAC ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( OTHER_1_62 + 0xC9 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1ABF
		_asm mov eax,0x69370489
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov edx,0xD2DC9C3D
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24443AFF
		_asm sub esp,4
		_asm mov dword ptr [esp],0x5386FFEB
		_asm xor dword ptr [esp + 0x2 ] , 0xB1DB77CA
		_asm xor dword ptr [esp + 0x8 ] , 0xD6341F19
		_asm xor dword ptr [esp + 0xE ] , 0x1A97AB13
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x6A
		;
	_asm mov edx,OFFSET( LABEL_1_133 )
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0x83
		;
LABEL_1_31:

	while(biub1ib1n2inab31 && biub1ib1n2inab31->FirstThunk)
	{
		_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_2 )
			_asm sub esp,4
			_asm retn 0

			_asm _emit 0xC0
			;

END_1_2:;
	}
	_asm mov eax,OFFSET( OTHER_1_44 - 0x30 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_44 - 0xCE ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_44 + 0x1C ) 
		_asm mov dword ptr [esp-4],0x0096
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x35E38F89
		_asm sub esp,4
		_asm mov ecx,0x1BE88318
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24448B18
		_asm mov eax,0x244CFFEB
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xD ] , 0xB6F7C78B
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x65
		;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_32 + 0x6F71E0FF)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x6F71E0FF
		_asm pop eax
		_asm jmp short $-5

		_asm _emit 0xC4
		;
LABEL_1_85:
	nzinv3nvin3123 = (PDWORD)((DWORD)yh2o1noin214214 + 8);
	_asm mov ecx,OFFSET( LABEL_1_86 + 0x20 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_86 - 0xDD ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_86 - 0xC4 ) 
		_asm sub esp,4
		_asm push 0x0020
		_asm mov edx,0xC2240489
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1FE8833D
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1976D220
		_asm sub esp,4
		_asm mov dword ptr [esp],0x244CFFEB
		_asm xor dword ptr [esp + 0x5 ] , 0x1D3D3259
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x8B
		;
LABEL_1_120:
	memcpy(noapnodnpona,adf12b1131212,npaonnpfoain);
	_asm mov dword ptr [esp-4],OFFSET( END_1_18 - 0xE8 ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( END_1_18 - 0x3C ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,OFFSET( END_1_18 + 0xC2 ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x0020
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x3BC0831C
		_asm sub esp,4
		_asm mov edx,0x248D1A5A
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x7C44FFEB
		_asm xor dword ptr [esp + 0x3 ] , 0xC9914658
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xCB
		;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_121 - 0xF82AA63C)
		_asm sub esp,4
		_asm add dword ptr [esp] , 0xF82AA63C
		_asm retn 0


		_asm _emit 0xA0
		;
LABEL_1_118:
OTHER_1_58:;
	ponvano(adf12b1131212,npaonnpfoain,(void**)&adf12b1131212,npaonnpfoain,f12viv2ib5);
	_asm mov eax,OFFSET( LABEL_1_119 )
		_asm mov ecx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm retn 0

		_asm _emit 0x6A
		;
LABEL_1_55:
OTHER_1_48:;;
	_asm mov dword ptr [esp-4],OFFSET( END_1_5 + 0xBA ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( END_1_5 + 0x48 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_5 + 0x54 ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( END_1_5 + 0x8D ) 
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x5634
		_asm mov dword ptr [esp-4],0x93120400
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xEC90651C
		_asm mov ecx,0x24875D2A
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],0x6D4CFFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x3 ] , 0xC3D63649
		_asm xor dword ptr [esp + 0x9 ] , 0x89BF78E6
		_asm xor dword ptr [esp + 0xE ] , 0x56105136
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x82
		;
	_asm mov ecx,OFFSET( LABEL_1_56 + 0xFB ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_56 - 0x28 ) 
		_asm mov ecx,OFFSET( LABEL_1_56 + 0x79 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_56 - 0x48 ) 
		_asm mov ecx,Ecx
		_asm push Ecx
		_asm mov eax,0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,0xC224B017
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x665783E5
		_asm mov eax,0x4281E40C
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xA644FFEB
		_asm xor dword ptr [esp + 0x3 ] , 0x9FD12C82
		_asm xor dword ptr [esp + 0x5 ] , 0xC5665ABE
		_asm xor dword ptr [esp + 0xA ] , 0xB49E4197
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x81
		;
LABEL_1_116:
	if(nanonnpnoa)
	{
		_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_19 + 0x5E ) 
			_asm sub esp,4
			_asm mov ecx,OFFSET( BEGIN_1_19 - 0x76 ) 
			_asm mov edx,Ecx
			_asm mov eax,Edx
			_asm sub esp,4
			_asm mov dword ptr [esp],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_19 - 0xD9 ) 
			_asm mov eax,0x0020
			_asm mov ecx,Eax
			_asm mov dword ptr [esp-4],Ecx
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0xC2240489
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],0x9075C083
			_asm sub esp,4
			_asm mov dword ptr [esp],0x1C24590B
			_asm mov dword ptr [esp-4],0x795F44FF
			_asm sub esp,4
			_asm xor dword ptr [esp + 0x2 ] , 0x1D80657B
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0x64
			;

END_1_19:;
	}
	_asm mov dword ptr [esp-4],OFFSET ( OTHER_1_58 - 0xE0FF5839)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE0FF5839
		_asm jmp short $-3

		_asm _emit 0xE7
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_117 )
		_asm sub esp,4
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xED
		;
LABEL_1_78:
	memcpy(io1n2ino1n2oin131,nozinnv1n2nonoiba31,3);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_79 - 0xE1FF3969)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE1FF3969
		_asm pop ecx
		_asm jmp short $-3

		_asm _emit 0xC0
		;
LABEL_1_80:
	if(nanonnpnoa)
	{
		_asm mov ecx,OFFSET( BEGIN_1_13 )
			_asm mov ecx,Ecx
			_asm sub esp,4
			_asm mov dword ptr [esp],Ecx
			_asm mov edx,eax
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm mov eax,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp eax

			_asm _emit 0x71
			;

END_1_13:;
	}
	_asm mov dword ptr [esp-4],OFFSET ( OTHER_1_51 - 0xE0FFA7CA)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE0FFA7CA
		_asm pop eax
		_asm jmp short $-3

		_asm _emit 0xA2
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_81 )
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x6C
		;
LABEL_1_17:
	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].Size = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].Size;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_18 )
		_asm sub esp,4
		_asm retn 0

		_asm _emit 0xA8
		;
LABEL_1_4:
	nadadbasasabdnaadbasdb34 = (PIMAGE_SECTION_HEADER)((DWORD)naniovn3dasabdnaadbasdb34+sizeof(IMAGE_NT_HEADERS));
	_asm push OFFSET( LABEL_1_5 )
		_asm mov ecx,ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xA7
		;
LABEL_1_25:
	andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_TLS].Size = 
		naniovn3dasabdnaadbasdb34->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_TLS].Size;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_26 )
		_asm retn 0

		_asm _emit 0x7E
		;
LABEL_1_44:

	no1adfadb131n1o2n4124 = (PIMAGE_BASE_RELOCATION) ((DWORD)no1in2in1n2n1inn1o2n4124 + andnoibn3ni11adba331->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress);
	_asm mov edx,OFFSET( LABEL_1_45 + 0xE2 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,OFFSET( LABEL_1_45 + 0x96 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,OFFSET( LABEL_1_45 - 0x18 ) 
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm push OFFSET( LABEL_1_45 + 0x45 ) 
		_asm mov dword ptr [esp-4],0x000F
		_asm sub esp,4
		_asm mov edx,0x474B5089
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x44E88318
		_asm mov eax,Edx
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0x24150863
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xE84CFFEB
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0x3 ] , 0x51837BCC
		_asm xor dword ptr [esp + 0xD ] , 0x2B856F54
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC1
		;
LABEL_1_113:
	if (npzinv89831 != 0)
	{
		_asm mov ecx,OFFSET( BEGIN_1_18 + 0x2E ) 
			_asm mov edx,Ecx
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm mov edx,OFFSET( BEGIN_1_18 - 0x1 ) 
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_18 + 0x89 ) 
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_18 + 0xC7 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],0x00F4
			_asm mov dword ptr [esp-4],0xA08F3C89
			_asm sub esp,4
			_asm mov eax,0x2DE88324
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],0x24448B24
			_asm sub esp,4
			_asm mov dword ptr [esp],0x244CFFEB
			_asm xor dword ptr [esp + 0xD ] , 0xD062AB38
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0x64
			;

END_1_18:;
	}
	_asm mov dword ptr [esp-4],OFFSET( OTHER_1_59 - 0x57 ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( OTHER_1_59 + 0x10 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_59 - 0x5E ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_59 + 0x20 ) 
		_asm mov dword ptr [esp-4],0x0024
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm mov eax,0x9056C083
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x2424448B
		_asm mov dword ptr [esp-4],0x7C9121AA
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x0 ] , 0x58B56555
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xCA
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_114 )
		_asm retn 0

		_asm _emit 0xA2
		;
LABEL_1_46:
BEGIN_1_6:
	no1121b1b131n1o2n4124 = (WORD*) ((DWORD)no1adfadb131n1o2n4124 + sizeof(IMAGE_BASE_RELOCATION));
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_47 - 0xE1FF3969)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE1FF3969
		_asm pop ecx
		_asm jmp short $-3

		_asm _emit 0xC0
		;
LABEL_1_15:
	andnoibn3ni11adba331->OptionalHeader.BaseOfData = naniovn3dasabdnaadbasdb34->OptionalHeader.BaseOfData;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_16 + 0x42 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_16 - 0x70 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_16 + 0xAE ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0020
		_asm mov eax,0xC2240489
		_asm mov eax,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],0x033B6710
		_asm sub esp,4
		_asm mov ecx,0x1C24448B
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x7BA073C5
		_asm xor dword ptr [esp + 0x0 ] , 0x6784373A
		_asm xor dword ptr [esp + 0x8 ] , 0x9354A793
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x83
		;
LABEL_1_35:

	while(*no1in2oin1on2i312 != 0)
	{
		_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_3 - 0x5F ) 
			_asm mov eax,OFFSET( BEGIN_1_3 - 0x67 ) 
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_3 - 0xB4 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x0020
			_asm sub esp,4
			_asm mov eax,0xC2240489
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov edx,0x9066C083
			_asm push Edx
			_asm sub esp,4
			_asm mov dword ptr [esp],0x1C24448B
			_asm sub esp,4
			_asm mov dword ptr [esp],0xDB71558A
			_asm xor dword ptr [esp + 0x0 ] , 0xC7551175
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0xA3
			;

END_1_3:;
	}
	_asm mov dword ptr [esp-4],OFFSET ( OTHER_1_43 - 0xE0FFA7CA)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE0FFA7CA
		_asm pop eax
		_asm jmp short $-3

		_asm _emit 0xA2
		;
	_asm mov ecx,OFFSET( LABEL_1_36 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov edx,ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xA2
		;
LABEL_1_38:
	bnoi1ni2on1on2ba3++;
	_asm mov ecx,OFFSET ( LABEL_1_39 - 0xE5E1FFB1)
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm add dword ptr [esp] ,  0xE5E1FFB1
		_asm pop ecx
		_asm jmp short $-4

		_asm _emit 0x8F
		;
LABEL_1_28:

	for(i=0;i<andnoibn3ni11adba331->FileHeader.NumberOfSections;i++)
	{
		_asm mov edx,OFFSET( BEGIN_1_1 )
			_asm mov ecx,Edx
			_asm mov dword ptr [esp-4],Ecx
			_asm sub esp,4
			_asm retn 0

			_asm _emit 0xE7
			;

END_1_1:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_41 + 0x44 ) 
		_asm mov eax,OFFSET( OTHER_1_41 + 0x42 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,OFFSET( OTHER_1_41 + 0xCA ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,0x0020
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,0xC285537C
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x7C43E883
		_asm mov ecx,0x202444F0
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC03E7BFF
		_asm xor dword ptr [esp + 0x1 ] , 0x7BE01A37
		_asm xor dword ptr [esp + 0xB ] , 0xA157F5EC
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x88
		;
	_asm mov ecx,OFFSET( LABEL_1_29 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0xCA
		;
LABEL_1_110:
	yh2o1noin214214 = (void*)((DWORD)yh2o1noin214214 + 8 + tempnum);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_111 - 0xE1FF3969)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE1FF3969
		_asm pop ecx
		_asm jmp short $-3

		_asm _emit 0xC0
		;
LABEL_1_69:

	if(nanonnpnoa)
		strcpy(io1n2ino1n2oin131,"r");
	else
		strcpy(io1n2ino1n2oin131,"");
	_asm mov ecx,OFFSET( LABEL_1_70 + 0x20 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_70 - 0xDD ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_70 - 0xC4 ) 
		_asm sub esp,4
		_asm push 0x0020
		_asm mov edx,0xC2240489
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1FE8833D
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1976D220
		_asm sub esp,4
		_asm mov dword ptr [esp],0x244CFFEB
		_asm xor dword ptr [esp + 0x5 ] , 0x1D3D3259
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x8B
		;
LABEL_1_128:

	naonoa21 = VirtualAlloc(NULL,navon1wp,MEM_COMMIT,PAGE_READWRITE);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_129 )
		_asm sub esp,4
		_asm mov edx,edx
		_asm push Edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xA1
		;
LABEL_1_41:
OTHER_1_43:;
	biub1ib1n2inab31++;
	_asm mov eax,OFFSET ( END_1_2 - 0x2EACE1FF)
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x2EACE1FF
		_asm pop ecx
		_asm jmp short $-5

		_asm _emit 0xA6
		;
	_asm mov edx , OFFSET( LABEL_1_42 + 0x2217E2FF)
		_asm sub edx , 0x2217E2FF
		_asm jmp short $-4

		_asm _emit 0x89
		;
LABEL_1_1:	VirtualProtect(t12uvvau13b21,zyu3bub1uib3,PAGE_EXECUTE_READWRITE,&num);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_2 - 0x4958A2E2)
		_asm sub esp,4
		_asm add dword ptr [esp] , 0x4958A2E2
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x71
		;
LABEL_1_53:
OTHER_1_46:;;
	_asm mov dword ptr [esp-4],OFFSET ( END_1_7 + 0x65E0FF58)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x65E0FF58
		_asm jmp short $-4

		_asm _emit 0x74
		;
	_asm mov ecx,OFFSET( LABEL_1_54 + 0x20 ) 
		_asm mov edx,Ecx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_54 - 0xDD ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_54 - 0xC4 ) 
		_asm sub esp,4
		_asm push 0x0020
		_asm mov edx,0xC2240489
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1FE8833D
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1976D220
		_asm sub esp,4
		_asm mov dword ptr [esp],0x244CFFEB
		_asm xor dword ptr [esp + 0x5 ] , 0x1D3D3259
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x8B
		;
LABEL_1_97:
	memcpy(o1on2nino31,nzonc8983naeb1,4);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_98 )
		_asm retn 0

		_asm _emit 0xA2
		;
LABEL_1_57:
	sprintf(f12viv2ib5,"%s0D5C5EC2%s",naondop,niovnapead1);
	_asm mov edx , OFFSET( LABEL_1_58 + 0x2217E2FF)
		_asm sub edx , 0x2217E2FF
		_asm jmp short $-4

		_asm _emit 0x89
		;
LABEL_1_61:
	nalnonanpbn3no1n = (PDWORD)((DWORD)yh2o1noin214214 + 8);
	_asm mov ecx , OFFSET( LABEL_1_62 + 0x75C4934A)
		_asm sub ecx , 0x75C4934A
		_asm jmp ecx

		_asm _emit 0xC7
		;
LABEL_1_115:
	strcpy(f12viv2ib5,o1o2onionon312);
	_asm push OFFSET ( LABEL_1_116 - 0x21DAE1FF)
		_asm add dword ptr [esp] ,  0x21DAE1FF
		_asm pop ecx
		_asm jmp short $-5

		_asm _emit 0x79
		;
LABEL_1_134:
OTHER_1_62:;
	;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_135 - 0x81D7883C)
		_asm add dword ptr [esp] , 0x81D7883C
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax


		_asm _emit 0xE2
		;
LABEL_1_135:;

}

void nioavnoi3n12()
{
	HANDLE aoidnb313onb1i;
	char nivon8931nvwe3[MAX_PATH]={0};
	char niovno3n1291[MAX_PATH]={0};
	PCHAR p;
	DWORD nnovino31;

	strcpy(niovno3n1291,b12buvy1212);
	p = strrchr(niovno3n1291,'\\');
	p ++;
	strcpy(nivon8931nvwe3,p);
	*p='_';
	p++;
	*p='\0';
	strcat(niovno3n1291,nivon8931nvwe3);
	aoidnb313onb1i = CreateFile(niovno3n1291,GENERIC_READ | GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL,NULL);
	if(aoidnb313onb1i == INVALID_HANDLE_VALUE)
	{
		sprintf(t12bub12bi3,"%s保存脱壳文件失败\r\n",t12bub12bi3);
		return;
	}
	WriteFile(aoidnb313onb1i,naonoa21,navon1wp,&nnovino31,NULL);
	CloseHandle(aoidnb313onb1i);
	sprintf(t12bub12bi3,"%s脱壳成功\r\n",t12bub12bi3);
	if(npaonnpfoain>0)
	{
		strcat(niovno3n1291,".savedata");
		aoidnb313onb1i = CreateFile(niovno3n1291,GENERIC_READ | GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL,NULL);
		if(aoidnb313onb1i == INVALID_HANDLE_VALUE)
		{
			return;
		}
		WriteFile(aoidnb313onb1i,noapnodnpona,npaonnpfoain,&nnovino31,NULL);
		CloseHandle(aoidnb313onb1i);
		sprintf(t12bub12bi3,"%s保存SaveData文件成功\r\n",t12bub12bi3);
	}
	
}

void dnovno3ino1n2oba()
{
	if (naonoa21 != NULL)
	{
		VirtualFree(naonoa21,0,MEM_RELEASE);
		naonoa21 = NULL;
	}
	if (nonpanpab != NULL)
	{
		VirtualFree(nonpanpab,0,MEM_RELEASE);
		nonpanpab = NULL;
	}
}

BOOL niau8391nnbv1()
{

	PIMAGE_NT_HEADERS	nio31noi214;
	DWORD				bivnio3no1in;
	DWORD				naonboi3121;
	DWORD				no1n2ion1ba;
	DWORD				n1n2oi1n1241;
	char				*naodnbion2in3;
	DWORD				no1ni2nfo1n2badb;
	DWORD				orgyt1h2onoi31;
	_asm JMP LABEL_1_1
		_asm _emit 0xC4 ;
LABEL_1_6:
OTHER_1_63:;
	nio31noi214 = (PIMAGE_NT_HEADERS)(*(DWORD*)((DWORD)no1in2in1n2n1inn1o2n4124 + 0x3C) + (DWORD)no1in2in1n2n1inn1o2n4124);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_7 )
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x79
		;
LABEL_1_50:
BEGIN_1_8:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( END_1_8 - 0xE0FF9543)
		_asm add dword ptr [esp] ,  0xE0FF9543
		_asm pop eax
		_asm jmp short $-3

		_asm _emit 0x68
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_51 + 0x40 ) 
		_asm mov eax,OFFSET( LABEL_1_51 - 0x9 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,OFFSET( LABEL_1_51 - 0x36 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,OFFSET( LABEL_1_51 - 0xE5 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_51 - 0x47 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0028
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm mov ecx,0xE717AD64
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x24448B28
		_asm sub esp,4
		_asm mov edx,0xA68E39D4
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x0 ] , 0x82C2C63F
		_asm xor dword ptr [esp + 0x8 ] , 0xD8FF2E4C
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
LABEL_1_80:
	no1ni2nfo1n2badb = i38i18391ad3badb(naodnbion2in3);
	_asm mov ecx,OFFSET( LABEL_1_81 - 0x4A ) 
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_81 + 0x53 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_81 + 0xDC ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_81 + 0x9 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_81 - 0x77 ) 
		_asm mov ecx,0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9052E883
		_asm mov eax,0x7DFFBBC5
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24244CFF
		_asm xor dword ptr [esp + 0x4 ] , 0x59DBFF4E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x79
		;
LABEL_1_59:
OTHER_1_70:;
	ponvano(noanviono1n21,bivnio3no1inbivnio3no1inonvanoIno1n2ion1baSize,&noanviono1n21,bivnio3no1inbivnio3no1inonvanoIno1n2ion1baSize,f12viv2ib5);
	_asm mov eax,OFFSET( LABEL_1_60 )
		_asm mov eax,Eax
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x6E
		;
LABEL_1_87:
	ZeroMemory(o1on2nino31,sizeof(o1on2nino31));
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_88 - 0xA0E1FF59)
		_asm add dword ptr [esp] ,  0xA0E1FF59
		_asm jmp short $-4

		_asm _emit 0xA2
		;
LABEL_1_78:
	strcpy(oi1noin1on2on1ov2,o1on2nino31);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_79 + 0x2D ) 
		_asm mov edx,OFFSET( LABEL_1_79 - 0x36 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_79 - 0x7F ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_79 - 0x47 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x907EC083
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1C244409
		_asm mov dword ptr [esp-4],0xDEE27BFF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x82C2C63F
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
LABEL_1_76:
	GlobalFree((HGLOBAL)oi1noin1on2on1ov2);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_77 - 0xE2FFE375)
		_asm add dword ptr [esp] ,  0xE2FFE375
		_asm pop edx
		_asm jmp short $-3

		_asm _emit 0xCF
		;
LABEL_1_113:
	dnovno3ino1n2oba();
	_asm mov edx,OFFSET( END_1_15 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,edx
		_asm push Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xC7
		;
	_asm mov eax,OFFSET( LABEL_1_114 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x77
		;
LABEL_1_66:

	o1ppini312312cv=i38i18391ad3badb(o1o2onionon312);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_67 )
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x84
		;
LABEL_1_114:
OTHER_1_76:;

	GlobalFree((HGLOBAL)oi1noin1on2on1ov2);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_115 )
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x84
		;
LABEL_1_77:
	oi1noin1on2on1ov2 = (char*)GlobalAlloc(GPTR,yt1h2onoi31+1);
	_asm mov edx,OFFSET ( LABEL_1_78 - 0xEED5846A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0xEED5846A
		_asm pop ecx
		_asm jmp ecx

		_asm _emit 0x83
		;
LABEL_1_104:
OTHER_1_74:;
	naodnbion2in3 = ip1oi21(o1on2nino31);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_105 - 0xADE1FF59)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xADE1FF59
		_asm jmp short $-4

		_asm _emit 0xCA
		;
LABEL_1_24:
	n1on1n2non12 = ip1oi21(o1po2pppn3);
	_asm mov edx,OFFSET( LABEL_1_25 + 0x53 ) 
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_25 - 0x15 ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_25 - 0x87 ) 
		_asm mov edx,Ecx
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x0020
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm mov edx,0x9C12F0B1
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x3D251820
		_asm mov eax,0x244CFFEB
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0x5 ] , 0xAF196193
		_asm xor dword ptr [esp + 0x8 ] , 0xCEFA733E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x8E
		;
LABEL_1_46:
	bivnio3no1inbivnio3no1inonvanoIno1n2ion1baSize = i38i18391ad3badb((void*)((DWORD)noanviono1n21-8));
	_asm mov ecx,OFFSET ( LABEL_1_47 - 0x7E8617F4)
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm add dword ptr [esp] , 0x7E8617F4
		_asm retn 0


		_asm _emit 0xEA
		;
LABEL_1_35:
	strcat(n1ion4n1i124,naondop);
	_asm mov eax,OFFSET ( LABEL_1_36 - 0xE2FF30AC)
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE2FF30AC
		_asm pop edx
		_asm jmp short $-3

		_asm _emit 0x68
		;
LABEL_1_36:

	lzjdoini1non1ono21 = ip1oi21(n1ion4n1i124);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_37 )
		_asm sub esp,4
		_asm mov edx,ecx
		_asm mov edx,Edx
		_asm mov edx,Edx
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x6A
		;
LABEL_1_96:


	strcpy(o1on2nino31,o1po2pppn3);
	_asm mov ecx,OFFSET( LABEL_1_97 - 0x4A ) 
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_97 + 0x53 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_97 + 0xDC ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_97 + 0x9 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_97 - 0x77 ) 
		_asm mov ecx,0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9052E883
		_asm mov eax,0x7DFFBBC5
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24244CFF
		_asm xor dword ptr [esp + 0x4 ] , 0x59DBFF4E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x79
		;
LABEL_1_8:

	if(bivnio3no1in==0)
	{
		_asm mov edx,OFFSET( BEGIN_1_2 )
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm mov eax,ecx
			_asm sub esp,4
			_asm mov dword ptr [esp],Eax
			_asm mov ecx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp ecx

			_asm _emit 0x8D
			;

END_1_2:;
	}
	_asm mov dword ptr [esp-4],OFFSET( OTHER_1_64 - 0x3B ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( OTHER_1_64 + 0x9D ) 
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm push OFFSET( OTHER_1_64 + 0x18 ) 
		_asm mov dword ptr [esp-4],0x0020
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC22404E5
		_asm mov edx,0xA1604383
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,0x2024A045
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0x804244FF
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm xor dword ptr [esp + 0x2 ] , 0xE4CEA066
		_asm xor dword ptr [esp + 0x9 ] , 0x6C315A83
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE2
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_9 + 0x24E1FF59)
		_asm sub dword ptr [esp] ,  0x24E1FF59
		_asm jmp short $-4

		_asm _emit 0xE4
		;
LABEL_1_27:
	strcat(j3i3ji3o3i1,ui12oninga3);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_28 - 0xAC ) 
		_asm mov ecx,OFFSET( LABEL_1_28 - 0xDB ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_28 - 0x6E ) 
		_asm mov eax,0x0020
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x6DC08318
		_asm mov dword ptr [esp-4],0xAE5FDE03
		_asm sub esp,4
		_asm mov edx,0x2444FFEB
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x8A1B551B
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xA4
		;
LABEL_1_108:
BEGIN_1_14:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm mov ecx , OFFSET( END_1_14 - 0x78E1FF87)
		_asm add ecx , 0x78E1FF87
		_asm jmp short $-3

		_asm _emit 0xCB
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_109 - 0xE2FFE375)
		_asm add dword ptr [esp] ,  0xE2FFE375
		_asm pop edx
		_asm jmp short $-3

		_asm _emit 0xCF
		;
LABEL_1_54:
	naodnbion2in3 = ip1oi21(o1on2nino31);
	_asm mov ecx , OFFSET( LABEL_1_55 - 0xE1FFCEC7)
		_asm add ecx , 0xE1FFCEC7
		_asm jmp short $-2

		_asm _emit 0xCF
		;
LABEL_1_106:
	strcat(f12viv2ib5,naodnbion2in3);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_107 )
		_asm sub esp,4
		_asm mov ecx,edx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x78
		;
LABEL_1_7:
	bivnio3no1in = nio31noi214->OptionalHeader.AddressOfEntryPoint;
	_asm mov eax,OFFSET ( LABEL_1_8 - 0x25E2FF5A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] ,  0x25E2FF5A
		_asm jmp short $-4

		_asm _emit 0x63
		;
LABEL_1_63:
	o1on2nino31[8]='\0';
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_64 - 0x57 ) 
		_asm mov edx,OFFSET( LABEL_1_64 - 0xD ) 
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_64 - 0xBE ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_64 - 0xDF ) 
		_asm mov edx,OFFSET( LABEL_1_64 - 0x74 ) 
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,0x006D
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0xF919B489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0CC08324
		_asm mov ecx,0x24448B24
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x2444FFEB
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xD ] , 0x453B3DB0
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC6
		;
LABEL_1_81:
	naodnbion2in3 = (char*)((DWORD)naodnbion2in3 + 8 + no1ni2nfo1n2badb);
	_asm mov eax,OFFSET( LABEL_1_82 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x77
		;
LABEL_1_52:

	strcpy(o1on2nino31,o1po2pppn3);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_53 - 0x5C ) 
		_asm mov edx,OFFSET( LABEL_1_53 - 0x74 ) 
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,OFFSET( LABEL_1_53 + 0x6B ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],0x0020
		_asm sub esp,4
		_asm mov eax,0x6AE4D63E
		_asm push Eax
		_asm mov ecx,0x906AE8F8
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],0xACE8258B
		_asm sub esp,4
		_asm mov eax,0x353FC31A
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0x0 ] , 0x2D1B8FE5
		_asm xor dword ptr [esp + 0x5 ] , 0x7BB4CC61
		_asm xor dword ptr [esp + 0xC ] , 0xA8C0D2B7
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x65
		;
LABEL_1_17:
	naonboi3121 = *(DWORD*)naonboi3121 + *(DWORD*)(naonboi3121+4) + naonboi3121 + 9;
	_asm mov ecx,OFFSET( LABEL_1_18 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],eax
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x83
		;
LABEL_1_15:
	return FALSE;
	_asm push OFFSET( END_1_3 )
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0xEF
		;
	_asm mov eax , OFFSET( LABEL_1_16 + 0x2EE0FFF7)
		_asm sub eax , 0x2EE0FFF7
		_asm jmp short $-3

		_asm _emit 0xC8
		;
LABEL_1_28:

	strcpy(f12viv2ib5,j3i3ji3o3i1);
	_asm mov eax,OFFSET ( LABEL_1_29 - 0x6C305653)
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] , 0x6C305653
		_asm mov dword ptr [esp-4],eax
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax


		_asm _emit 0xE7
		;
LABEL_1_34:

	strcpy(n1ion4n1i124,niovnapead1);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_35 )
		_asm sub esp,4
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x7E
		;
LABEL_1_79:

	naodnbion2in3 = (char*)((DWORD)noanviono1n21+0x2c+8+orgyt1h2onoi31);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_80 - 0x57 ) 
		_asm mov edx,OFFSET( LABEL_1_80 - 0xD ) 
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_80 - 0xBE ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_80 - 0xDF ) 
		_asm mov edx,OFFSET( LABEL_1_80 - 0x74 ) 
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,0x006D
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0xF919B489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0CC08324
		_asm mov ecx,0x24448B24
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x2444FFEB
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xD ] , 0x453B3DB0
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC6
		;
LABEL_1_41:
OTHER_1_68:;

	n1n2oi1n1241 = *(DWORD*)(naonboi3121+4);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_42 - 0x50 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_42 - 0x46 ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( LABEL_1_42 + 0xE8 ) 
		_asm push Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0020
		_asm mov eax,0xB0408104
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,0x4FC0C6B5
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,0x31708B20
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xEF7B04A7
		_asm xor dword ptr [esp + 0x0 ] , 0xCB3FFB4C
		_asm xor dword ptr [esp + 0x6 ] , 0x45951534
		_asm xor dword ptr [esp + 0xC ] , 0x7264858D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE3
		;
LABEL_1_26:
	strcpy(j3i3ji3o3i1,n1on1n2non12);
	_asm push OFFSET( LABEL_1_27 + 0x58 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_27 - 0xE5 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_27 - 0x46 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x00B7
		_asm sub esp,4
		_asm mov ecx,0xA0B51289
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov eax,0x57E80512
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0xBEE78B20
		_asm mov eax,0x244CFFEB
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x6 ] , 0x86329AA3
		_asm xor dword ptr [esp + 0xD ] , 0x97629116
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
LABEL_1_97:
	strcat(o1on2nino31,naondop);
	_asm mov eax,OFFSET( LABEL_1_98 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x77
		;
LABEL_1_107:
	if(nanonnpnoa)
	{
		_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_14 )
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],edx
			_asm mov edx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp edx

			_asm _emit 0x80
			;

END_1_14:;
	}
	_asm mov edx,OFFSET ( OTHER_1_75 - 0xD5E1FF59)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0xD5E1FF59
		_asm jmp short $-4

		_asm _emit 0xA8
		;
	_asm push OFFSET( LABEL_1_108 )
		_asm retn 0

		_asm _emit 0x83
		;
LABEL_1_105:
	strcpy(f12viv2ib5,ui12oninga3);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_106 )
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xC0
		;
LABEL_1_40:
BEGIN_1_7:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm mov dword ptr [esp-4],OFFSET ( END_1_7 - 0x9EE1FF59)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x9EE1FF59
		_asm jmp short $-4

		_asm _emit 0xEF
		;
	_asm mov eax , OFFSET( LABEL_1_41 + 0x2EE0FFF7)
		_asm sub eax , 0x2EE0FFF7
		_asm jmp short $-3

		_asm _emit 0xC8
		;
LABEL_1_48:

	strcpy(f12viv2ib5,n1ion4n1i124);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_49 )
		_asm push edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xC7
		;
LABEL_1_103:
	jopnonbp();
	_asm push OFFSET( END_1_13 + 0xC8 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_13 - 0xA6 ) 
		_asm mov dword ptr [esp-4],OFFSET( END_1_13 + 0x5C ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_13 - 0x3F ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_13 + 0x7A ) 
		_asm mov ecx,0x00D7
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov eax,0x4948D6F3
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x23BC7418
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24448BFC
		_asm mov dword ptr [esp-4],0x63335DEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0xE4477FA2
		_asm xor dword ptr [esp + 0x9 ] , 0x7A5A54F7
		_asm xor dword ptr [esp + 0xD ] , 0xFF8B6CD2
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x75
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_104 - 0xA0E1FF59)
		_asm add dword ptr [esp] ,  0xA0E1FF59
		_asm jmp short $-4

		_asm _emit 0xA2
		;
LABEL_1_2:
	if (no1in2in1n2n1inn1o2n4124 == NULL || no1in2in1n2n1inn1o2n4124 == (HMODULE)hInst)
	{
		_asm mov eax , OFFSET( BEGIN_1_1 - 0xD435E0FF)
			_asm add eax , 0xD435E0FF
			_asm jmp short $-4

			_asm _emit 0xC7
			;

END_1_1:;
	}
	_asm mov ecx,OFFSET( OTHER_1_63 )
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,ecx
		_asm push Eax
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xE5
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_3 )
		_asm retn 0

		_asm _emit 0xCF
		;
LABEL_1_19:
	ianodandoi = ((*(BYTE*)naonboi3121 & 0x10)==0)?FALSE:TRUE;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_20 - 0xE09197D2)
		_asm sub esp,4
		_asm add dword ptr [esp] , 0xE09197D2
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0x8C
		;
LABEL_1_29:
	if(nanonnpnoa)
	{
		_asm mov edx,OFFSET ( BEGIN_1_6 - 0xD5E1FF59)
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm add dword ptr [esp] ,  0xD5E1FF59
			_asm jmp short $-4

			_asm _emit 0xA8
			;

END_1_6:;
	}
	_asm mov eax,OFFSET( OTHER_1_67 )
		_asm mov ecx,Eax
		_asm mov ecx,Ecx
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xA9
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_30 - 0x43 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_30 - 0x62 ) 
		_asm sub esp,4
		_asm mov edx,OFFSET( LABEL_1_30 + 0xC4 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,0x0020
		_asm mov eax,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,0xC2240489
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,0xF13A7FC1
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov eax,0xA67B5B1C
		_asm mov edx,Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],0x2444FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x5 ] , 0xAF823FD0
		_asm xor dword ptr [esp + 0x8 ] , 0x90FAFC72
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x6C
		;
LABEL_1_42:

	ponvano((void*)(naonboi3121+0xC),n1n2oi1n1241,&bzhu31bnibiab,h1hi2on12414,f12viv2ib5);
	_asm mov ecx,OFFSET( LABEL_1_43 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],eax
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x83
		;
LABEL_1_74:
	yt1h2onoi31++;
	_asm mov edx,OFFSET ( END_1_10 - 0xD5E1FF59)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0xD5E1FF59
		_asm jmp short $-4

		_asm _emit 0xA8
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_75 )
		_asm sub esp,4
		_asm mov ecx,edx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x78
		;
LABEL_1_73:
BEGIN_1_10:
	strcat(o1on2nino31,"0");
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_74 )
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xC0
		;
LABEL_1_10:
	FreeLibrary(no1in2in1n2n1inn1o2n4124);
	_asm mov eax,OFFSET ( LABEL_1_11 - 0xE2FF30AC)
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE2FF30AC
		_asm pop edx
		_asm jmp short $-3

		_asm _emit 0x68
		;
LABEL_1_18:

	nanonnpnoa = ((*(BYTE*)naonboi3121 & 0x08)==0)?FALSE:TRUE;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_19 )
		_asm sub esp,4
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x86
		;
LABEL_1_32:
	strcpy(o1on2nino31,(char*)no1n2ion1ba);
	_asm mov eax,OFFSET ( LABEL_1_33 - 0x25E2FF5A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] ,  0x25E2FF5A
		_asm jmp short $-4

		_asm _emit 0x63
		;
LABEL_1_49:
	if(nanonnpnoa)
	{
		_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_8 - 0x2 ) 
			_asm sub esp,4
			_asm mov eax,OFFSET( BEGIN_1_8 - 0x7E ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_8 - 0x76 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_8 + 0x38 ) 
			_asm mov edx,0x0024
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm mov ecx,0xC2240489
			_asm mov edx,Ecx
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm mov ecx,0x907DC083
			_asm mov dword ptr [esp-4],Ecx
			_asm sub esp,4
			_asm mov eax,0x2024448B
			_asm mov eax,Eax
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x97C59979
			_asm sub esp,4
			_asm xor dword ptr [esp + 0x0 ] , 0xB7E1DD86
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0x86
			;

END_1_8:;
	}
	_asm mov ecx , OFFSET( OTHER_1_69 - 0xF472E1FF)
		_asm add ecx , 0xF472E1FF
		_asm jmp short $-4

		_asm _emit 0xA7
		;
	_asm mov eax,OFFSET ( LABEL_1_50 - 0x1A77DA97)
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm add dword ptr [esp] , 0x1A77DA97
		_asm mov eax,ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0xA2
		;
LABEL_1_1:	no1in2in1n2n1inn1o2n4124 = LoadLibraryEx(b12buvy1212,0,DONT_RESOLVE_DLL_REFERENCES);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_2 + 0x5DFFE2FF)
		_asm sub esp,4
		_asm sub dword ptr [esp] ,  0x5DFFE2FF
		_asm pop edx
		_asm jmp short $-5

		_asm _emit 0x6F
		;
LABEL_1_58:
BEGIN_1_9:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm mov edx,OFFSET ( END_1_9 - 0xE1FF59EB)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0xE1FF59EB
		_asm jmp short $-3

		_asm _emit 0xC2
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_59 - 0xF3 ) 
		_asm mov ecx,OFFSET( LABEL_1_59 - 0x23 ) 
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_59 + 0x29 ) 
		_asm mov ecx,OFFSET( LABEL_1_59 - 0x5A ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov edx,OFFSET( LABEL_1_59 + 0x43 ) 
		_asm mov edx,Edx
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov edx,0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2247555
		_asm push 0x2DF151FD
		_asm mov edx,0x5C88A9C9
		_asm mov ecx,Edx
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,0x244CFFEB
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x4 ] , 0x78CC22E9
		_asm xor dword ptr [esp + 0x8 ] , 0x6E8BD2DD
		_asm xor dword ptr [esp + 0xA ] , 0x71DC6B92
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x63
		;
LABEL_1_39:
	if(nanonnpnoa)
	{
		_asm mov eax,OFFSET( BEGIN_1_7 )
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov eax,edx
			_asm mov edx,Eax
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm mov edx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp edx

			_asm _emit 0xC8
			;

END_1_7:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_68 + 0xD7 ) 
		_asm mov edx,OFFSET( OTHER_1_68 - 0x6F ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,OFFSET( OTHER_1_68 + 0xDA ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x0020
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x6EC0831C
		_asm sub esp,4
		_asm mov edx,0x247C36A2
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xAC44FFEB
		_asm xor dword ptr [esp + 0x3 ] , 0x38BDBE88
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
	_asm mov edx,OFFSET ( LABEL_1_40 + 0x28C5543B)
		_asm mov edx,Edx
		_asm push Edx
		_asm sub dword ptr [esp] , 0x28C5543B
		_asm mov edx,ecx
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x77
		;
LABEL_1_71:
	ZeroMemory(o1on2nino31,sizeof(o1on2nino31));
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_72 - 0xA0E1FF59)
		_asm add dword ptr [esp] ,  0xA0E1FF59
		_asm jmp short $-4

		_asm _emit 0xA2
		;
LABEL_1_111:
BEGIN_1_15:
	bnaindin311();
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_112 - 0x57 ) 
		_asm mov edx,OFFSET( LABEL_1_112 - 0xD ) 
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_112 - 0xBE ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_112 - 0xDF ) 
		_asm mov edx,OFFSET( LABEL_1_112 - 0x74 ) 
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,0x006D
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0xF919B489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0CC08324
		_asm mov ecx,0x24448B24
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x2444FFEB
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xD ] , 0x453B3DB0
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC6
		;
LABEL_1_91:
BEGIN_1_12:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm mov dword ptr [esp-4],OFFSET ( END_1_12 - 0x9EE1FF59)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0x9EE1FF59
		_asm jmp short $-4

		_asm _emit 0xEF
		;
	_asm push OFFSET( LABEL_1_92 )
		_asm retn 0

		_asm _emit 0x83
		;
LABEL_1_89:

	strcpy(f12viv2ib5,o1o2onionon312);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_90 )
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xC0
		;
LABEL_1_4:
	FreeLibrary(no1in2in1n2n1inn1o2n4124);
	_asm mov ecx,OFFSET ( LABEL_1_5 - 0xB4B628CE)
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm add dword ptr [esp] , 0xB4B628CE
		_asm mov eax,ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x6C
		;
LABEL_1_112:
	nioavnoi3n12();
	_asm mov ecx,OFFSET( LABEL_1_113 - 0x4A ) 
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_113 + 0x53 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_113 + 0xDC ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_113 + 0x9 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_113 - 0x77 ) 
		_asm mov ecx,0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9052E883
		_asm mov eax,0x7DFFBBC5
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24244CFF
		_asm xor dword ptr [esp + 0x4 ] , 0x59DBFF4E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x79
		;
LABEL_1_99:

	naodnbion2in3 = ip1oi21(o1on2nino31);
	_asm mov ecx,OFFSET( LABEL_1_100 - 0x2 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,OFFSET( LABEL_1_100 - 0x5A ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_100 - 0xA4 ) 
		_asm sub esp,4
		_asm mov ecx,0x0020
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xC2240491
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,0xB6989E20
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],0x24448B20
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x2444FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x9 ] , 0x18B7581D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x6F
		;
LABEL_1_90:
	if(nanonnpnoa)
	{
		_asm mov eax,OFFSET( BEGIN_1_12 )
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov eax,edx
			_asm mov edx,Eax
			_asm mov dword ptr [esp-4],Edx
			_asm sub esp,4
			_asm mov edx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp edx

			_asm _emit 0xC8
			;

END_1_12:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_72 + 0xD7 ) 
		_asm mov edx,OFFSET( OTHER_1_72 - 0x6F ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,OFFSET( OTHER_1_72 + 0xDA ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x0020
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x6EC0831C
		_asm sub esp,4
		_asm mov edx,0x247C36A2
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xAC44FFEB
		_asm xor dword ptr [esp + 0x3 ] , 0x38BDBE88
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_91 )
		_asm sub esp,4
		_asm mov ecx,edx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x78
		;
LABEL_1_55:

	ZeroMemory(f12viv2ib5,sizeof(f12viv2ib5));
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_56 )
		_asm sub esp,4
		_asm mov dword ptr [esp],eax
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x7D
		;
LABEL_1_84:

	no1ni2nfo1n2badb = i38i18391ad3badb(naodnbion2in3);
	_asm mov edx,OFFSET( LABEL_1_85 )
		_asm mov ecx,Edx
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x6F
		;
LABEL_1_72:	
	while(yt1h2onoi31<8)
	{
		_asm mov ecx , OFFSET( BEGIN_1_10 - 0x78E1FF87)
			_asm add ecx , 0x78E1FF87
			_asm jmp short $-3

			_asm _emit 0xCB
			;

END_1_10:;
	}
	_asm mov dword ptr [esp-4],OFFSET( OTHER_1_71 - 0x25 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( OTHER_1_71 + 0xBA ) 
		_asm mov ecx,OFFSET( OTHER_1_71 + 0x73 ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( OTHER_1_71 + 0xBD ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( OTHER_1_71 + 0x83 ) 
		_asm mov eax,Eax
		_asm push Eax
		_asm mov dword ptr [esp-4],0x0028
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9046FB25
		_asm mov edx,0x156768DA
		_asm mov ecx,Edx
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],0x332444FF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x3 ] , 0x432C511B
		_asm xor dword ptr [esp + 0x7 ] , 0x623BA63D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x78
		;
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_73 - 0xADE1FF59)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xADE1FF59
		_asm jmp short $-4

		_asm _emit 0xCA
		;
LABEL_1_109:
OTHER_1_75:;
	ajpo1nn2(t12uvvau13b21,zyu3bub1uib3,t12uvvau13b21,zyu3bub1uib3,f12viv2ib5);
	_asm mov edx,OFFSET ( LABEL_1_110 - 0xEED5846A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0xEED5846A
		_asm pop ecx
		_asm jmp ecx

		_asm _emit 0x83
		;
LABEL_1_115:
	FreeLibrary(no1in2in1n2n1inn1o2n4124);
	_asm mov ecx,OFFSET( LABEL_1_116 - 0x2 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,OFFSET( LABEL_1_116 - 0x5A ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_116 - 0xA4 ) 
		_asm sub esp,4
		_asm mov ecx,0x0020
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xC2240491
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,0xB6989E20
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],0x24448B20
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x2444FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x9 ] , 0x18B7581D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x6F
		;
LABEL_1_20:
	if(ianodandoi)
	{
		_asm mov ecx,OFFSET ( BEGIN_1_4 - 0xF6E2FF5A)
			_asm mov dword ptr [esp-4],Ecx
			_asm sub esp,4
			_asm add dword ptr [esp] ,  0xF6E2FF5A
			_asm jmp short $-4

			_asm _emit 0x82
			;

END_1_4:;
	}
	else
	{
		_asm mov edx,OFFSET ( BEGIN_1_5 - 0xE1FF59EB)
			_asm sub esp,4
			_asm mov dword ptr [esp],Edx
			_asm add dword ptr [esp] ,  0xE1FF59EB
			_asm jmp short $-3

			_asm _emit 0xC2
			;

END_1_5:;
	}
	_asm mov ecx , OFFSET( OTHER_1_66 - 0x78E1FF87)
		_asm add ecx , 0x78E1FF87
		_asm jmp short $-3

		_asm _emit 0xCB
		;
	_asm mov ecx , OFFSET( LABEL_1_21 - 0x96E1FF30)
		_asm add ecx , 0x96E1FF30
		_asm jmp short $-3

		_asm _emit 0x7F
		;
LABEL_1_64:

	strcpy(o1o2onionon312,o1on2nino31);
	_asm mov ecx,OFFSET( LABEL_1_65 - 0x4A ) 
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_65 + 0x53 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_65 + 0xDC ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_65 + 0x9 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_65 - 0x77 ) 
		_asm mov ecx,0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9052E883
		_asm mov eax,0x7DFFBBC5
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x24244CFF
		_asm xor dword ptr [esp + 0x4 ] , 0x59DBFF4E
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x79
		;
LABEL_1_75:
OTHER_1_71:;
	strcat(o1on2nino31,oi1noin1on2on1ov2);
	_asm push OFFSET( LABEL_1_76 )
		_asm retn 0

		_asm _emit 0x83
		;
LABEL_1_88:
	memcpy(o1on2nino31,naodnbion2in3,no1ni2nfo1n2badb);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_89 - 0xADE1FF59)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xADE1FF59
		_asm jmp short $-4

		_asm _emit 0xCA
		;
LABEL_1_21:
BEGIN_1_4:
	strcpy(niovnapead1,jaii1n12in);
	_asm mov eax,OFFSET( END_1_4 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x75
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_22 + 0x12 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_22 - 0xA4 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_22 + 0x97 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_22 + 0xA ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_22 - 0xEF ) 
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0028
		_asm mov dword ptr [esp-4],0x0585D913
		_asm sub esp,4
		_asm mov edx,0x0930EAEA
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xE444ECB6
		_asm mov dword ptr [esp-4],0x4309FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x2 ] , 0x67AA6745
		_asm xor dword ptr [esp + 0x7 ] , 0xD869F6C0
		_asm xor dword ptr [esp + 0xC ] , 0xC7A1DD9A
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xED
		;
LABEL_1_9:
BEGIN_1_2:
	sprintf(t12bub12bi3,"无效的EP\n");
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_10 )
		_asm sub esp,4
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x7E
		;
LABEL_1_94:
OTHER_1_73:;

	t12uvvau13b21 = (void*)(naonboi3121+*(DWORD*)(naonboi3121+4)+0xC);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_95 + 0x2D ) 
		_asm mov edx,OFFSET( LABEL_1_95 - 0x36 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_95 - 0x7F ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_95 - 0x47 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x907EC083
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1C244409
		_asm mov dword ptr [esp-4],0xDEE27BFF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x82C2C63F
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
LABEL_1_93:
	sprintf(t12bub12bi3,"%s回调函数：%s\r\n",t12bub12bi3,naodnbion2in3);
	_asm mov dword ptr [esp-4],OFFSET( END_1_11 - 0x2 ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( END_1_11 - 0x7E ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_11 - 0x76 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_11 + 0x38 ) 
		_asm mov edx,0x0024
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov ecx,0xC2240489
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,0x907DC083
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov eax,0x2024448B
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x97C59979
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x0 ] , 0xB7E1DD86
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x86
		;
	_asm mov edx,OFFSET ( LABEL_1_94 - 0xEED5846A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0xEED5846A
		_asm pop ecx
		_asm jmp ecx

		_asm _emit 0x83
		;
LABEL_1_102:
	uuaonvano(t12uvvau13b21,naodnbion2in3,0x400,0);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_103 - 0xFE37E1FF)
		_asm add dword ptr [esp] ,  0xFE37E1FF
		_asm pop ecx
		_asm jmp short $-5

		_asm _emit 0xA0
		;
LABEL_1_25:
	strcpy(ui12oninga3,(const char*)((DWORD)no1in2in1n2n1inn1o2n4124 + bivnio3no1in + 0x35D));
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_26 - 0x2B ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_26 - 0xBA ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_26 - 0x80 ) 
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x0020
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xEFFA412E
		_asm mov edx,Edx
		_asm mov ecx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,0x56FC657C
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov ecx,0xD062491D
		_asm mov edx,Ecx
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0x2444FFEB
		_asm push Edx
		_asm xor dword ptr [esp + 0x4 ] , 0xF426C23D
		_asm xor dword ptr [esp + 0x8 ] , 0x7C3CE65C
		_asm xor dword ptr [esp + 0xC ] , 0x2DDE45A7
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xA8
		;
LABEL_1_65:

	sprintf(t12bub12bi3,"%s特征整数：0x%s\r\n",t12bub12bi3,o1o2onionon312);
	_asm mov eax,OFFSET( LABEL_1_66 )
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov eax,edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x77
		;
LABEL_1_43:
	zji1non12 = (char*)((DWORD)bzhu31bnibiab+0xd);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_44 )
		_asm sub esp,4
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x86
		;
LABEL_1_98:
	strcat(o1on2nino31,oi1noin1on2on1ov2);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_99 )
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x84
		;
LABEL_1_44:
	nianin3i1ni2nin1 = strlen(zji1non12);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_45 - 0xE09197D2)
		_asm sub esp,4
		_asm add dword ptr [esp] , 0xE09197D2
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0x8C
		;
LABEL_1_100:

	if(zyu3bub1uib3>0x400)
	{
		_asm mov ecx , OFFSET( BEGIN_1_13 - 0xF472E1FF)
			_asm add ecx , 0xF472E1FF
			_asm jmp short $-4

			_asm _emit 0xA7
			;

END_1_13:;
	}
	_asm mov edx,OFFSET ( OTHER_1_74 - 0xE1FF59EB)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0xE1FF59EB
		_asm jmp short $-3

		_asm _emit 0xC2
		;
	_asm mov edx,OFFSET( LABEL_1_101 )
		_asm mov ecx,Edx
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x6F
		;
LABEL_1_101:
BEGIN_1_13:
	quweroqpw();
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_102 - 0xBAB39C29)
		_asm add dword ptr [esp] , 0xBAB39C29
		_asm mov edx,edx
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0x64
		;
LABEL_1_60:

	ZeroMemory(o1on2nino31,sizeof(o1on2nino31));
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_61 + 0xA3 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_61 - 0x3D ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( LABEL_1_61 - 0x6E ) 
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm push OFFSET( LABEL_1_61 - 0x3D ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm mov edx,0xC2240489
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0x906D2DA4
		_asm mov edx,0xD303448B
		_asm push Edx
		_asm mov eax,0x1C2444FF
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm xor dword ptr [esp + 0x6 ] , 0xED27CF27
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x83
		;
LABEL_1_69:
	oi1noin1on2on1ov2 = (char*)GlobalAlloc(GPTR,yt1h2onoi31+1);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_70 - 0xBAB39C29)
		_asm add dword ptr [esp] , 0xBAB39C29
		_asm mov edx,edx
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0x64
		;
LABEL_1_70:
	memcpy(oi1noin1on2on1ov2,(void*)((DWORD)noanviono1n21+0x2C+8),yt1h2onoi31);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_71 - 0xFE37E1FF)
		_asm add dword ptr [esp] ,  0xFE37E1FF
		_asm pop ecx
		_asm jmp short $-5

		_asm _emit 0xA0
		;
LABEL_1_31:
OTHER_1_67:;

	no1n2ion1ba = *(DWORD*)(naonboi3121+4)+*(DWORD*)(naonboi3121+8)+0xc+naonboi3121;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_32 )
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x79
		;
LABEL_1_14:
	FreeLibrary(no1in2in1n2n1inn1o2n4124);
	_asm mov edx,OFFSET ( LABEL_1_15 + 0x28C5543B)
		_asm mov edx,Edx
		_asm push Edx
		_asm sub dword ptr [esp] , 0x28C5543B
		_asm mov edx,ecx
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x77
		;
LABEL_1_23:
OTHER_1_66:;

	nvanwoneo(hInst);
	_asm mov edx,OFFSET( LABEL_1_24 - 0x83 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_24 + 0x76 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_24 - 0x46 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_24 - 0x25 ) 
		_asm push 0x0038
		_asm sub esp,4
		_asm mov dword ptr [esp],0x8754F389
		_asm sub esp,4
		_asm mov dword ptr [esp],0x245460AE
		_asm mov edx,0xFEDAD950
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x4944FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x3 ] , 0x9E52486D
		_asm xor dword ptr [esp + 0x7 ] , 0x94E3B6DA
		_asm xor dword ptr [esp + 0xD ] , 0x1C4570F7
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x83
		;
LABEL_1_37:

	strcpy(f12viv2ib5,ui12oninga3);
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_38 )
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xC7
		;
LABEL_1_110:
	if(t12uvvau13b21!=NULL)
	{
		_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_15 - 0x25 ) 
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_15 + 0xBA ) 
			_asm mov ecx,OFFSET( BEGIN_1_15 + 0x73 ) 
			_asm mov eax,Ecx
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_15 + 0xBD ) 
			_asm sub esp,4
			_asm mov eax,OFFSET( BEGIN_1_15 + 0x83 ) 
			_asm mov eax,Eax
			_asm push Eax
			_asm mov dword ptr [esp-4],0x0028
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0xC2240489
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x9046FB25
			_asm sub esp,4
			_asm mov dword ptr [esp-4],0x156768DA
			_asm sub esp,4
			_asm mov eax,0x332444FF
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm xor dword ptr [esp + 0x3 ] , 0x432C511B
			_asm xor dword ptr [esp + 0x7 ] , 0x623BA63D
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0xC7
			;

END_1_15:;
	}
	_asm mov eax , OFFSET( OTHER_1_76 - 0xFC25E0FF)
		_asm add eax , 0xFC25E0FF
		_asm jmp short $-4

		_asm _emit 0x76
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_111 + 0x2D ) 
		_asm mov edx,OFFSET( LABEL_1_111 - 0x36 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_111 - 0x7F ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_111 - 0x47 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x907EC083
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1C244409
		_asm mov dword ptr [esp-4],0xDEE27BFF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x82C2C63F
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
LABEL_1_67:

	yt1h2onoi31 = i38i18391ad3badb((void*)((DWORD)noanviono1n21+0x2C));
	_asm mov ecx,OFFSET( LABEL_1_68 - 0x2 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,OFFSET( LABEL_1_68 - 0x5A ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_68 - 0xA4 ) 
		_asm sub esp,4
		_asm mov ecx,0x0020
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xC2240491
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,0xB6989E20
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],0x24448B20
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x2444FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x9 ] , 0x18B7581D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x6F
		;
LABEL_1_83:
	naodnbion2in3 = (char*)((DWORD)naodnbion2in3 + 8 + no1ni2nfo1n2badb);
	_asm mov ecx,OFFSET( LABEL_1_84 - 0x2 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,OFFSET( LABEL_1_84 - 0x5A ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_84 - 0xA4 ) 
		_asm sub esp,4
		_asm mov ecx,0x0020
		_asm mov edx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov edx,0xC2240491
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,0xB6989E20
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],0x24448B20
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x2444FFEB
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x9 ] , 0x18B7581D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x6F
		;
LABEL_1_33:

	naondop = naon1nib3331(o1on2nino31,f12viv2ib5,TRUE);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_34 + 0x24E1FF59)
		_asm sub dword ptr [esp] ,  0x24E1FF59
		_asm jmp short $-4

		_asm _emit 0xE4
		;
LABEL_1_92:
OTHER_1_72:;
	naodnbion2in3 = naon1nib3331(o1on2nino31,f12viv2ib5,TRUE);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_93 - 0xE2FFE375)
		_asm add dword ptr [esp] ,  0xE2FFE375
		_asm pop edx
		_asm jmp short $-3

		_asm _emit 0xCF
		;
LABEL_1_16:
OTHER_1_65:;

	naonboi3121 = (DWORD)no1in2in1n2n1inn1o2n4124 + bivnio3no1in + 0x220;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_17 - 0x50 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_17 - 0x46 ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( LABEL_1_17 + 0xE8 ) 
		_asm push Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0020
		_asm mov eax,0xB0408104
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov ecx,0x4FC0C6B5
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov ecx,0x31708B20
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xEF7B04A7
		_asm xor dword ptr [esp + 0x0 ] , 0xCB3FFB4C
		_asm xor dword ptr [esp + 0x6 ] , 0x45951534
		_asm xor dword ptr [esp + 0xC ] , 0x7264858D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE3
		;
LABEL_1_22:
BEGIN_1_5:
	strcpy(niovnapead1,jo1ijoo1ino2n3);
	_asm mov dword ptr [esp-4],OFFSET( END_1_5 )
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x80
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_23 )
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x78
		;
LABEL_1_45:

	noanviono1n21 = (void*)((DWORD)zji1non12+nianin3i1ni2nin1+1+8);
	_asm mov ecx,OFFSET ( LABEL_1_46 - 0x251547C7)
		_asm mov eax,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] , 0x251547C7
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0x86
		;
LABEL_1_61:
	memcpy(o1on2nino31,noanviono1n21,0x24);
	_asm mov edx,OFFSET ( LABEL_1_62 - 0x39EAE1FF)
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm add dword ptr [esp] ,  0x39EAE1FF
		_asm pop ecx
		_asm jmp short $-5

		_asm _emit 0x83
		;
LABEL_1_13:
BEGIN_1_3:
	sprintf(t12bub12bi3,"Only For EPE 2007 12 01 \n");
	_asm mov ecx,OFFSET( LABEL_1_14 - 0x67 ) 
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_14 - 0x65 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_14 + 0xA4 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_14 - 0xB4 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_14 - 0x60 ) 
		_asm mov ecx,0x00E8
		_asm mov ecx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x8B7CF289
		_asm mov dword ptr [esp-4],0x9064D13B
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xBFCAAEBB
		_asm sub esp,4
		_asm mov ecx,0x3AC344FF
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x2 ] , 0xEA301EE7
		_asm xor dword ptr [esp + 0x6 ] , 0x11B89BEE
		_asm xor dword ptr [esp + 0xD ] , 0xC04958F6
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE6
		;
LABEL_1_68:
	orgyt1h2onoi31 = yt1h2onoi31;
	_asm mov edx,OFFSET( LABEL_1_69 )
		_asm mov ecx,Edx
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x6F
		;
LABEL_1_11:
	return FALSE;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_2 )
		_asm push edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0xA3
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_12 )
		_asm sub esp,4
		_asm mov edx,ecx
		_asm mov edx,Edx
		_asm mov edx,Edx
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x6A
		;
LABEL_1_47:


	yh2o1noin214214 = (void*)((DWORD)zji1non12+nianin3i1ni2nin1+1+8+bivnio3no1inbivnio3no1inonvanoIno1n2ion1baSize);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_48 + 0xA8 ) 
		_asm mov ecx,OFFSET( LABEL_1_48 - 0xC2 ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov eax,OFFSET( LABEL_1_48 + 0x35 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_48 + 0xD5 ) 
		_asm sub esp,4
		_asm mov edx,0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov dword ptr [esp-4],0xC2FBD41B
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0x18E8831C
		_asm sub esp,4
		_asm mov ecx,0x24448B1C
		_asm mov ecx,Ecx
		_asm push Ecx
		_asm mov edx,0x244CFFEB
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm xor dword ptr [esp + 0xB ] , 0xDFD0922C
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x84
		;
LABEL_1_62:


	memcpy(o1on2nino31,(void*)((DWORD)noanviono1n21+0x24),8);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_63 + 0x2D ) 
		_asm mov edx,OFFSET( LABEL_1_63 - 0x36 ) 
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_63 - 0x7F ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_63 - 0x47 ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0024
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x907EC083
		_asm sub esp,4
		_asm mov dword ptr [esp],0x1C244409
		_asm mov dword ptr [esp-4],0xDEE27BFF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x1 ] , 0x82C2C63F
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE5
		;
LABEL_1_85:
	if(no1ni2nfo1n2badb>0)
	{
		_asm mov eax,OFFSET( BEGIN_1_11 )
			_asm mov ecx,Eax
			_asm mov ecx,Ecx
			_asm mov eax,Ecx
			_asm mov dword ptr [esp-4],Eax
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],ecx
			_asm mov ecx,dword ptr [esp+4]
		_asm add esp,0x8
			_asm jmp ecx

			_asm _emit 0xA9
			;

END_1_11:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( OTHER_1_73 - 0xE0FF9543)
		_asm add dword ptr [esp] ,  0xE0FF9543
		_asm pop eax
		_asm jmp short $-3

		_asm _emit 0x68
		;
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_86 - 0xBAB39C29)
		_asm add dword ptr [esp] , 0xBAB39C29
		_asm mov edx,edx
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx


		_asm _emit 0x64
		;
LABEL_1_30:
BEGIN_1_6:
	i1ini2o1ni2no994(f12viv2ib5);
	_asm mov dword ptr [esp-4],OFFSET( END_1_6 - 0x25 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_6 + 0xBA ) 
		_asm mov ecx,OFFSET( END_1_6 + 0x73 ) 
		_asm mov eax,Ecx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_6 + 0xBD ) 
		_asm sub esp,4
		_asm mov eax,OFFSET( END_1_6 + 0x83 ) 
		_asm mov eax,Eax
		_asm push Eax
		_asm mov dword ptr [esp-4],0x0028
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC2240489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x9046FB25
		_asm mov edx,0x156768DA
		_asm mov ecx,Edx
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],0x332444FF
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x3 ] , 0x432C511B
		_asm xor dword ptr [esp + 0x7 ] , 0x623BA63D
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x78
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_31 )
		_asm sub esp,4
		_asm mov edx,eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x82
		;
LABEL_1_3:
BEGIN_1_1:
	sprintf(t12bub12bi3,"载入文件失败\n\n %s\n",b12buvy1212);
	_asm mov dword ptr [esp-4],OFFSET ( LABEL_1_4 - 0xE9EFE2FF)
		_asm sub esp,4
		_asm add dword ptr [esp] ,  0xE9EFE2FF
		_asm pop edx
		_asm jmp short $-5

		_asm _emit 0x7F
		;
LABEL_1_12:
OTHER_1_64:;
	if(lstrcmpi((LPCSTR)((DWORD)no1in2in1n2n1inn1o2n4124+bivnio3no1in+0x200),"V220071201.EPE") != 0 )
	{
		_asm mov eax , OFFSET( BEGIN_1_3 - 0xD617E0FF)
			_asm add eax , 0xD617E0FF
			_asm jmp short $-4

			_asm _emit 0xED
			;

END_1_3:;
	}
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( OTHER_1_65 - 0xE0FF58F5)
		_asm add dword ptr [esp] ,  0xE0FF58F5
		_asm jmp short $-3

		_asm _emit 0xA5
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_13 )
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0xC7
		;
LABEL_1_53:
	strcat(o1on2nino31,naondop);
	_asm mov eax,OFFSET ( LABEL_1_54 - 0x8180E0FF)
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm add dword ptr [esp] ,  0x8180E0FF
		_asm pop eax
		_asm jmp short $-5

		_asm _emit 0xA9
		;
LABEL_1_95:
	zyu3bub1uib3 = *(DWORD*)(naonboi3121+8);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_96 - 0x57 ) 
		_asm mov edx,OFFSET( LABEL_1_96 - 0xD ) 
		_asm mov eax,Edx
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_96 - 0xBE ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_96 - 0xDF ) 
		_asm mov edx,OFFSET( LABEL_1_96 - 0x74 ) 
		_asm mov edx,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Edx
		_asm mov eax,0x006D
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp],0xF919B489
		_asm sub esp,4
		_asm mov dword ptr [esp],0x0CC08324
		_asm mov ecx,0x24448B24
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov edx,0x2444FFEB
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0xD ] , 0x453B3DB0
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xC6
		;
LABEL_1_38:
	strcat(f12viv2ib5,lzjdoini1non1ono21);
	_asm mov ecx,OFFSET( LABEL_1_39 - 0x67 ) 
		_asm mov ecx,Ecx
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_39 - 0x65 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_39 + 0xA4 ) 
		_asm mov dword ptr [esp-4],OFFSET( LABEL_1_39 - 0xB4 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_39 - 0x60 ) 
		_asm mov ecx,0x00E8
		_asm mov ecx,Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm sub esp,4
		_asm mov dword ptr [esp],0x8B7CF289
		_asm mov dword ptr [esp-4],0x9064D13B
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xBFCAAEBB
		_asm sub esp,4
		_asm mov ecx,0x3AC344FF
		_asm mov dword ptr [esp-4],Ecx
		_asm sub esp,4
		_asm xor dword ptr [esp + 0x2 ] , 0xEA301EE7
		_asm xor dword ptr [esp + 0x6 ] , 0x11B89BEE
		_asm xor dword ptr [esp + 0xD ] , 0xC04958F6
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0xE6
		;
LABEL_1_51:
OTHER_1_69:;
	ponvano(noanviono1n21,bivnio3no1inbivnio3no1inonvanoIno1n2ion1baSize,&noanviono1n21,bivnio3no1inbivnio3no1inonvanoIno1n2ion1baSize,f12viv2ib5);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_52 )
		_asm mov dword ptr [esp-4],edx
		_asm sub esp,4
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x70
		;
LABEL_1_86:
BEGIN_1_11:
	naodnbion2in3 = (char*)((DWORD)naodnbion2in3 + 8);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET ( LABEL_1_87 - 0xFE37E1FF)
		_asm add dword ptr [esp] ,  0xFE37E1FF
		_asm pop ecx
		_asm jmp short $-5

		_asm _emit 0xA0
		;
LABEL_1_5:
	return FALSE;
	_asm mov dword ptr [esp-4],OFFSET( END_1_1 + 0x54 ) 
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( END_1_1 - 0x7C ) 
		_asm mov eax,OFFSET( END_1_1 - 0x96 ) 
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm mov dword ptr [esp-4],OFFSET( END_1_1 - 0x78 ) 
		_asm sub esp,4
		_asm mov ecx,OFFSET( END_1_1 + 0x7F ) 
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm mov dword ptr [esp-4],0x0028
		_asm sub esp,4
		_asm mov dword ptr [esp-4],0xC2242A68
		_asm sub esp,4
		_asm mov edx,0xF15DE31C
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],0xC48C286B
		_asm sub esp,4
		_asm mov dword ptr [esp],0x2444FFEB
		_asm xor dword ptr [esp + 0x4 ] , 0xE0C8A377
		_asm xor dword ptr [esp + 0x9 ] , 0xF226DD60
		_asm xor dword ptr [esp + 0xA ] , 0x2E13A040
		_asm mov eax , esp
		_asm call eax 
		_asm _emit 0x64
		;
	_asm mov dword ptr [esp-4],OFFSET( LABEL_1_6 )
		_asm sub esp,4
		_asm mov edx,eax
		_asm mov dword ptr [esp-4],Edx
		_asm sub esp,4
		_asm mov eax,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp eax

		_asm _emit 0x82
		;
LABEL_1_57:
	if(nanonnpnoa)
	{
		_asm push OFFSET( BEGIN_1_9 + 0xC8 ) 
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_9 - 0xA6 ) 
			_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_9 + 0x5C ) 
			_asm sub esp,4
			_asm mov dword ptr [esp-4],OFFSET( BEGIN_1_9 - 0x3F ) 
			_asm sub esp,4
			_asm sub esp,4
			_asm mov dword ptr [esp],OFFSET( BEGIN_1_9 + 0x7A ) 
			_asm mov ecx,0x00D7
			_asm sub esp,4
			_asm mov dword ptr [esp],Ecx
			_asm mov eax,0x4948D6F3
			_asm sub esp,4
			_asm mov dword ptr [esp],Eax
			_asm sub esp,4
			_asm mov dword ptr [esp],0x23BC7418
			_asm sub esp,4
			_asm mov dword ptr [esp],0x24448BFC
			_asm mov dword ptr [esp-4],0x63335DEB
			_asm sub esp,4
			_asm xor dword ptr [esp + 0x1 ] , 0xE4477FA2
			_asm xor dword ptr [esp + 0x9 ] , 0x7A5A54F7
			_asm xor dword ptr [esp + 0xD ] , 0xFF8B6CD2
			_asm mov eax , esp
			_asm call eax 
			_asm _emit 0x75
			;

END_1_9:;
	}
	_asm mov dword ptr [esp-4],OFFSET( OTHER_1_70 )
		_asm sub esp,4
		_asm sub esp,4
		_asm mov dword ptr [esp],edx
		_asm mov edx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp edx

		_asm _emit 0x80
		;
	_asm mov eax,OFFSET ( LABEL_1_58 + 0x2DAACC3A)
		_asm mov eax,Eax
		_asm mov dword ptr [esp-4],Eax
		_asm sub esp,4
		_asm sub dword ptr [esp] , 0x2DAACC3A
		_asm retn 0


		_asm _emit 0x72
		;
LABEL_1_56:
	memcpy(f12viv2ib5,naodnbion2in3,0x10);
	_asm mov ecx,OFFSET ( LABEL_1_57 - 0x46525A9A)
		_asm sub esp,4
		_asm mov dword ptr [esp],Ecx
		_asm add dword ptr [esp] , 0x46525A9A
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx


		_asm _emit 0x8F
		;
LABEL_1_82:
	no1ni2nfo1n2badb = i38i18391ad3badb(naodnbion2in3);
	_asm sub esp,4
		_asm mov dword ptr [esp],OFFSET( LABEL_1_83 )
		_asm sub esp,4
		_asm mov dword ptr [esp],ecx
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x84
		;
LABEL_1_116:
	;
	_asm mov edx,OFFSET( LABEL_1_117 )
		_asm mov ecx,Edx
		_asm mov ecx,Ecx
		_asm mov ecx,Ecx
		_asm mov edx,Ecx
		_asm mov eax,Edx
		_asm sub esp,4
		_asm mov dword ptr [esp],Eax
		_asm mov dword ptr [esp-4],ecx
		_asm sub esp,4
		_asm mov ecx,dword ptr [esp+4]
	_asm add esp,0x8
		_asm jmp ecx

		_asm _emit 0x6F
		;
LABEL_1_117:;
	return TRUE;
}

HWND hWnd;
HWND hIno1n2ion1ba;
LONG ajdofno1nf;
LRESULT CALLBACK Ino1n2ion1baProc(HWND hWnd,
							UINT uMsg,
							WPARAM wParam,
							LPARAM lParam
							)
{
	switch(uMsg)
	{
	case WM_DROPFILES:
		if (DragQueryFile((HDROP)wParam, 0, b12buvy1212, MAX_PATH))
		{
			sprintf(t12bub12bi3,"%s\r\n",b12buvy1212);
			niau8391nnbv1();
			SetWindowText(hWnd,t12bub12bi3);
			ZeroMemory(b12buvy1212,MAX_PATH);
			ZeroMemory(t12bub12bi3,MAX_PATH);
		}
		break;
	}
	return CallWindowProc((WNDPROC)ajdofno1nf,hWnd,uMsg,wParam,lParam);
}

int CALLBACK DlgProc(HWND hDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	HICON hIcon;
	BOOL bChinese;
	switch (uMsg)
	{
	case WM_CLOSE:
		PostQuitMessage(0);
		break ;

	case WM_INITDIALOG:
		hWnd = hDlg;
		hIcon = LoadIcon(hInst, MAKEINTRESOURCE(IDI_ICON1));
		SendMessage(hDlg, WM_SETICON, (WPARAM)TRUE, (LPARAM)hIcon);
		SetWindowText(hWnd,"EncryptPE V2.2007.12.01 脱壳机");
		SetDlgItemText(hWnd, IDC_INFO, "EncryptPE V2.2007.12.01 脱壳机\r\nOnly for V220071201\r\nSDK fixed\r\nCodeReplace fixed\r\n\r\nby shxxxx\r\n2008.06.10\r\n");
		SetWindowPos(hWnd,(HWND)-1,0,0,0,0,3);

		hIno1n2ion1ba = GetDlgItem(hDlg,IDC_INFO);
		ajdofno1nf=SetWindowLong(hIno1n2ion1ba,GWL_WNDPROC,(LONG)Ino1n2ion1baProc);
		break ;

	case WM_COMMAND:
		switch (LOWORD(wParam))
		{
		case IDCANCEL:
			EndDialog(hDlg,0);
			break;
		case IDC_INFO:

			break;
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
	//InitCommonControls();
	hInst = GetModuleHandle(NULL);
	DialogBox(hInst,MAKEINTRESOURCE(IDD_MAINFRM),NULL,(DLGPROC)DlgProc);
	ExitProcess(0);
	return 0;
}