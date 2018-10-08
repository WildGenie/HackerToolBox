.586p
.model flat,stdcall
option casemap:none
include		e:\archives\masm32\include\comctl32.inc
include		e:\archives\masm32\include\comdlg32.inc
include		e:\archives\masm32\include\kernel32.inc
include		e:\archives\masm32\include\user32.inc
include		e:\archives\masm32\include\shell32.inc
include		e:\archives\masm32\include\windows.inc
includelib	e:\archives\masm32\lib\comctl32.lib
includelib	e:\archives\masm32\lib\comdlg32.lib
includelib	e:\archives\masm32\lib\kernel32.lib
includelib	e:\archives\masm32\lib\user32.lib
includelib	e:\archives\masm32\lib\shell32.lib
b equ byte ptr
w equ word ptr
d equ dword ptr
q equ qword ptr
f equ fword ptr
o equ offset
IDD_DIALOG	equ 100
BTN_FILE	equ 110
BTN_OEP		equ 111
BTN_DETTACH	equ 112
BTN_COUNT	equ 113
BTN_EXIT	equ 114
IDC_FILE	equ 120
IDC_EDIT1	equ 121
IDC_EDIT2	equ 122
IDC_EDIT3	equ 123
IDC_CHECK	equ 130
IDC_CHECK2	equ 131
IDC_CHECK3	equ 132
IDC_CHECK4	equ 133
IDC_COMBO	equ 140
IDC_LIST	equ 150

DlgProc		proto :dword,:dword,:dword,:dword

.data?
context		CONTEXT <>
ofn		OPENFILENAME <>
pentry		PROCESSENTRY32 <>
sinfo		STARTUPINFO <>
pinfo		PROCESS_INFORMATION <>
ldte		LDT_ENTRY <>
dbevent		DEBUG_EVENT <>
fs30		dd ?
buffer		db 512 dup (?)
editbuff	db 16 dup (?)
hInst		dd ?
hIcon		dd ?
hCombo		dd ?
hList		dd ?
hEdit1		dd ?
hEdit2		dd ?
hSnap		dd ?
imagebase	dd ?
basestart	dd ?
baseend		dd ?
range		dd ?
temp		dd ?
zero		dd ?
counter		dd ?
de_counter	dd ?
pehdr		db 4096 dup (?)
sectionlist	dd 32 dup (?,?)
lasteip		dd ?
int3addr	dd ?
opcodebuff	db 16 dup (?)
oeptext		db 9 dup (?)
useint3		db ?
usehvp		db ?
count		db ?
guarder		db ?
dettach		db ?
npatched	db ?
kpatched	db ?
upatched	db ?
stolenbytes	db ?,?

.data
assume cs:nothing
filterstring	db "exe files",0,"*.exe",0,"all files",0,"*.*",0,0
oepcapt		db "Is this Oep:",0
dettachcapt	db "Dettached Process :)",0
dettachtext	db "Attach with Olly, press F9,F12",13,10,9,"And OK here!",0
secttext	db "secttext - "
addrtext	db "00000000 - "
rangetext	db "00000000 - "
axxtext		db "RWE",0
infjump		db 0ebh,0feh
int3		db 0cch
combocount	dd 0,1,2,-1
combotext1	db "0",0
combotext2	db "1",0
combotext3	db "2",0
combotext4	db "All",0
explorer	db "explorer.exe"
explorerend:

ntdll				db "ntdll.dll",0
zwqueryinformationprocess	db "ZwQueryInformationProcess",0

kernel				db "kernel32.dll",0
createthread			db "CreateThread",0
process32next			db "Process32Next",0
setpriorityclass		db "SetPriorityClass",0
terminateprocess		db "TerminateProcess",0
virtualprotectex		db "VirtualProtectEx",0

user				db "user32.dll",0
blockinput			db "BlockInput",0
;setwindowlonga			db "SetWindowLongA",0
hook_retn			db 0c2h,4,0
jmp_hook			db 0e9h,0,0,0,0

hook_zwqueryinformationprocess:
	db 5 dup (90h)
	cmp d [esp+8],7
	je short no_zwqueryinformationprocess
ret_zwqueryinformationprocess:
	push 12345678h
	ret
no_zwqueryinformationprocess:
	mov eax,[esp+0ch]
	mov d [eax],0
	retn 14h
end_zwqueryinformationprocess:

hook_createthread:
	call near ptr delta_createthread
delta_createthread:
	pop eax
	sub eax,o delta_createthread
	cmp [eax+o nr_ct],0
	jne short old_createthread
	mov d [eax+o hook_createthread],900018c2h
	retn 18h
old_createthread:
	db 5 dup (90h)
	dec d [eax+o nr_ct]
ret_createthread:
	push 12345678h
	ret
nr_ct dd 0
end_createthread:

hook_process32next:
	call near ptr delta_process32next
delta_process32next:
	pop eax
	sub eax,o delta_process32next
	pop d [eax+o ret_process+2]
	push ebx
	mov ebx,[esp+8]
	mov d [eax+o old_pentry+2],ebx
	pop ebx
	lea eax,[eax+o old_pentry]
	push eax
ret_process32next:
	mov eax,1234567h
old_process32next:
	db 5 dup (90h)
	jmp eax
old_pentry:
	push eax
	mov eax,12345678h
	cmp d [eax.PROCESSENTRY32.th32ParentProcessID],12345678h
our_pid:
	jne short ret_process
	mov d [eax.PROCESSENTRY32.th32ParentProcessID],12345678h
ret_process:
	pop eax
	push 12345678h
	ret
end_process32next:

hook_virtualprotectex:
	db 5 dup (90h)
	cmp d [esp+14h],PAGE_EXECUTE_READ
	je short do_virtualprotectex
	cmp d [esp+14h],PAGE_EXECUTE_READWRITE
	jne short ret_virtualprotectex
do_virtualprotectex:
	mov d [esp+14h],PAGE_EXECUTE_READWRITE or PAGE_GUARD
ret_virtualprotectex:
	push 12345678h
	ret
end_virtualprotectex:

;hook_setwindowlonga:
;	db 5 dup (90h)
;	and d [esp+10h],not 8000000h
;ret_setwindowlonga:
;	push 12345678h
;	ret
;end_setwindowlonga:



.code
start:
	invoke InitCommonControls
	invoke GetModuleHandle,0
	mov hInst,eax
	invoke LoadIcon,hInst,900
	mov hIcon,eax
	invoke DialogBoxParam,hInst,IDD_DIALOG,0,o DlgProc,0
	invoke ExitProcess,0



DlgProc proc hDlg:dword,uMsg:dword,wParam:dword,lParam:dword
	mov eax,uMsg
	cmp eax,WM_INITDIALOG
	jne initiated
	mov context.ContextFlags,CONTEXT_FULL
	invoke GetCurrentProcessId
	mov d our_pid-4,eax
	invoke CreateToolhelp32Snapshot,TH32CS_SNAPPROCESS,eax
	mov hSnap,eax
	mov pentry.dwSize,size PROCESSENTRY32
	invoke Process32First,hSnap,o pentry
	or eax,eax
	je exit_exe
next_exe:
	invoke Process32Next,hSnap,o pentry
	or eax,eax
	je exit_exe
	mov esi,o pentry.szExeFile
	mov edi,o explorer
	mov ecx,o explorerend-o explorer
cmpname:
	lodsb
	or al,20h
	cmp al,[edi]
	jne next_exe
	inc edi
	dec ecx
	jne cmpname
exit_exe:
	invoke CloseHandle,hSnap
	mov eax,pentry.th32ProcessID
	mov d ret_process-4,eax

	invoke SendMessage,hDlg,WM_SETICON,1,hIcon
	invoke CheckDlgButton,hDlg,IDC_CHECK,BST_CHECKED
	invoke GetDlgItem,hDlg,IDC_COMBO
	mov hCombo,eax
	invoke SendMessage,hCombo,CB_ADDSTRING,0,o combotext1
	invoke SendMessage,hCombo,CB_ADDSTRING,0,o combotext2
	invoke SendMessage,hCombo,CB_ADDSTRING,0,o combotext3
	invoke SendMessage,hCombo,CB_ADDSTRING,0,o combotext4
	invoke SendMessage,hCombo,CB_SETCURSEL,3,0
	invoke GetDlgItem,hDlg,IDC_LIST
	mov hList,eax
	invoke GetDlgItem,hDlg,IDC_EDIT1
	mov hEdit1,eax
	invoke GetDlgItem,hDlg,IDC_EDIT2
	mov hEdit2,eax
	xor ebx,ebx
	mov ecx,8
	mov edi,o editbuff+1
	mov b [edi+1],0
	call hex
	invoke SetDlgItemText,hDlg,IDC_EDIT3,o editbuff

	invoke GetCommandLineW
	invoke CommandLineToArgvW,eax,o temp
	cmp temp,2
	jne initiated
	mov esi,[eax+4]
	mov edi,o buffer
conv:
	lodsw
	stosb
	or ax,ax
	jne conv
	jmp read_file
initiated:
	cmp eax,WM_CLOSE
	je _wmclose
	cmp eax,WM_COMMAND
	jne maybe_move
	cmp wParam,IDC_CHECK4
	je toggle_custom
	cmp wParam,BTN_FILE
	je get_file
	cmp wParam,BTN_OEP
	je do_oep
	cmp wParam,BTN_DETTACH
	je do_dettach
	cmp wParam,BTN_COUNT
	je do_count
	cmp wParam,BTN_EXIT
	je _wmclose
maybe_move:
	cmp eax,WM_LBUTTONDOWN
	jne unknown
	invoke SendMessage,hDlg,WM_NCLBUTTONDOWN,HTCAPTION,0
unknown:
	xor eax,eax
	ret



_wmclose:
	invoke EndDialog,hDlg,0
	jmp unknown



toggle_custom:
	invoke IsDlgButtonChecked,hDlg,IDC_CHECK4
	xor al,1
	mov ebx,eax
	invoke SendMessage,hEdit1,EM_SETREADONLY,ebx,0
	invoke SendMessage,hEdit2,EM_SETREADONLY,ebx,0
	invoke EnableWindow,hList,ebx
	jmp unknown



get_file:
	mov ofn.lStructSize,size ofn
	mov ofn.lpstrFilter,o filterstring
	mov ofn.lpstrFile,o buffer
	mov ofn.nMaxFile,512
	mov ofn.Flags,OFN_FILEMUSTEXIST or OFN_PATHMUSTEXIST or OFN_LONGNAMES
	invoke GetOpenFileName,o ofn
	or eax,eax
	je unknown
read_file:
	invoke SetDlgItemText,hDlg,IDC_FILE,o buffer
	invoke SendMessage,hList,LB_RESETCONTENT,0,0

	invoke CreateFile,o buffer,GENERIC_READ,0,0,OPEN_EXISTING,20h,0
	push eax
	invoke ReadFile,eax,o pehdr,4096,o temp,0
	pop eax
	invoke CloseHandle,eax

	xor ecx,ecx
	mov edx,o pehdr
	add edx,[edx.IMAGE_DOS_HEADER.e_lfanew]
	mov eax,[edx.IMAGE_NT_HEADERS.OptionalHeader.ImageBase]
	mov imagebase,eax
	mov cx,[edx.IMAGE_NT_HEADERS.FileHeader.NumberOfSections]
	add edx,size IMAGE_NT_HEADERS
	mov edi,o sectionlist
section_loop:
	push ecx
	mov ebx,[edx.IMAGE_SECTION_HEADER.VirtualAddress]
	add ebx,imagebase
	mov [edi],ebx
	push edi
	mov ecx,8
	mov edi,o addrtext+7
	call hex
	pop edi

	mov ebx,[edx.IMAGE_SECTION_HEADER.Misc.VirtualSize]
	mov [edi+4],ebx
	push edi	
	mov ecx,8
	mov edi,o rangetext+7
	call hex
	mov ecx,8
	lea esi,[edx.IMAGE_SECTION_HEADER.Name1]
	mov edi,o secttext
conv_name:
	lodsb
	or al,al
	jne letter
	add al,20h
letter:
	stosb
	dec ecx
	jne conv_name

	mov ebx,[edx.IMAGE_SECTION_HEADER.Characteristics]
	mov al,20h
	test ebx,IMAGE_SCN_MEM_READ
	je no_read
	mov al,"R"
no_read:
	mov [axxtext],al
	mov al,20h
	test ebx,IMAGE_SCN_MEM_WRITE
	je no_write
	mov al,"W"
no_write:
	mov [axxtext+1],al
	mov al,20h
	test ebx,IMAGE_SCN_MEM_EXECUTE
	je no_execute
	mov al,"X"
no_execute:
	mov [axxtext+2],al

	push edx
	invoke SendMessage,hList,LB_ADDSTRING,0,o secttext
	pop edx
	pop edi
	pop ecx
	add edx,size IMAGE_SECTION_HEADER
	add edi,8
	dec ecx
	jne section_loop
	invoke SendMessage,hList,LB_SETCURSEL,0,0
	jmp unknown



do_count:
	mov count,1
	jmp find_oep
do_dettach:
	mov dettach,1
	mov count,0
	jmp find_oep
do_oep:
	mov dettach,0
	mov count,0
find_oep:
	mov counter,0
	mov int3addr,0
	mov npatched,0
	mov kpatched,0
	mov upatched,0
	invoke IsDlgButtonChecked,hDlg,IDC_CHECK
	mov useint3,al
	invoke IsDlgButtonChecked,hDlg,IDC_CHECK3
	mov usehvp,al
	invoke SendMessage,hCombo,CB_GETCURSEL,0,0
	mov eax,[4*eax+o combocount]
	mov nr_ct,eax
	invoke GetDlgItemText,hDlg,IDC_EDIT3,o editbuff,3
	call unhex
	mov de_counter,eax

	invoke IsDlgButtonChecked,hDlg,IDC_CHECK4
	or eax,eax
	je get_selected
	invoke GetDlgItemText,hDlg,IDC_EDIT1,o editbuff,10
	or eax,eax
	je unknown
	call unhex
	or eax,eax
	je unknown
	mov basestart,eax
	invoke GetDlgItemText,hDlg,IDC_EDIT2,o editbuff,10
	or eax,eax
	je unknown
	call unhex
	or eax,eax
	je unknown
	mov range,eax
	add eax,basestart
	mov baseend,eax
	jmp create_target

get_selected:
	invoke SendMessage,hList,LB_GETCURSEL,0,0
	mov ebx,[8*eax+o sectionlist]
	mov ecx,[8*eax+o sectionlist+4]
	mov basestart,ebx
	mov range,ecx
	add ebx,ecx
	mov baseend,ebx

create_target:
	invoke GetStartupInfo,o sinfo
	invoke CreateProcess,o buffer,0,0,0,0,DEBUG_PROCESS or DEBUG_ONLY_THIS_PROCESS,0,0,o sinfo,o pinfo
	or eax,eax
	je unknown

	.while TRUE
	invoke WaitForDebugEvent,o dbevent,-1

	invoke GetAsyncKeyState,VK_ESCAPE
	or eax,eax
	jne abort_it

	.if dbevent.dwDebugEventCode==EXIT_PROCESS_DEBUG_EVENT
	cmp count,0
	je no_count
	mov ebx,counter
	mov ecx,2
	mov edi,o editbuff+1
	mov b [edi+1],0
	call hex
	invoke SetDlgItemText,hDlg,IDC_EDIT3,o editbuff
no_count:
	invoke ContinueDebugEvent,dbevent.dwProcessId,dbevent.dwThreadId,DBG_CONTINUE
	.break

	.elseif dbevent.dwDebugEventCode==CREATE_PROCESS_DEBUG_EVENT
	invoke IsDlgButtonChecked,hDlg,IDC_CHECK2
	or eax,eax
	je no_pre_alloc
pre_alloc:
	invoke VirtualAllocEx,pinfo.hProcess,0,4096,MEM_COMMIT,PAGE_EXECUTE_READWRITE
	cmp eax,400000h
	jb pre_alloc
	invoke VirtualFreeEx,pinfo.hProcess,eax,0,MEM_RELEASE
no_pre_alloc:
	invoke GetThreadContext,pinfo.hThread,o context
	invoke GetThreadSelectorEntry,pinfo.hThread,context.regFs,o ldte
	mov ah,ldte.HighWord1.Bytes.BaseHi
	mov al,ldte.HighWord1.Bytes.BaseMid
	shl eax,16
	mov ax,ldte.BaseLow
	add eax,30h
	invoke ReadProcessMemory,pinfo.hProcess,eax,o fs30,4,0
	mov eax,fs30
	add eax,2
	invoke WriteProcessMemory,pinfo.hProcess,eax,o zero,1,0
	mov eax,context.regEip
	mov lasteip,eax
	call restore_guard

	.elseif dbevent.dwDebugEventCode==LOAD_DLL_DEBUG_EVENT
	cmp npatched,0
	jne no_ntdll
	mov npatched,1
	invoke GetModuleHandle,o ntdll
	invoke GetProcAddress,eax,o zwqueryinformationprocess
	push eax
	invoke VirtualProtectEx,pinfo.hProcess,eax,4096,PAGE_EXECUTE_READWRITE,o temp
	pop eax
	push eax
	invoke ReadProcessMemory,pinfo.hProcess,eax,o hook_zwqueryinformationprocess,5,0
	invoke VirtualAllocEx,pinfo.hProcess,0,4096,MEM_COMMIT or MEM_TOP_DOWN,PAGE_EXECUTE_READWRITE
	pop ebx
	lea ecx,[eax-5]
	sub ecx,ebx
	mov d jmp_hook+1,ecx
	lea ecx,[ebx+5]
	mov d ret_zwqueryinformationprocess+1,ecx
	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_zwqueryinformationprocess,o end_zwqueryinformationprocess-o hook_zwqueryinformationprocess,0
	invoke WriteProcessMemory,pinfo.hProcess,ebx,o jmp_hook,5,0
no_ntdll:
	cmp kpatched,0
	jne no_kernel
	invoke GetModuleHandle,o kernel
	invoke GetProcAddress,eax,o setpriorityclass
	push eax
	invoke VirtualProtectEx,pinfo.hProcess,eax,4096,PAGE_EXECUTE_READWRITE,o temp
	pop eax
	mov b hook_retn+1,8
	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_retn,3,0
	or eax,eax
	je no_kernel

	mov kpatched,1
	invoke GetModuleHandle,o kernel
	invoke GetProcAddress,eax,o createthread
	push eax
	invoke VirtualProtectEx,pinfo.hProcess,eax,4096,PAGE_EXECUTE_READWRITE,o temp
	pop eax
	push eax
	invoke ReadProcessMemory,pinfo.hProcess,eax,o old_createthread,5,0
	invoke VirtualAllocEx,pinfo.hProcess,0,4096,MEM_COMMIT or MEM_TOP_DOWN,PAGE_EXECUTE_READWRITE
	pop ebx
	lea ecx,[eax-5]
	sub ecx,ebx
	mov d jmp_hook+1,ecx
	lea ecx,[ebx+5]
	mov d ret_createthread+1,ecx
	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_createthread,o end_createthread-o hook_createthread,0
	invoke WriteProcessMemory,pinfo.hProcess,ebx,o jmp_hook,5,0

	invoke GetModuleHandle,o kernel
	invoke GetProcAddress,eax,o process32next
	push eax
	invoke VirtualProtectEx,pinfo.hProcess,eax,4096,PAGE_EXECUTE_READWRITE,o temp
	pop eax
	push eax
	invoke ReadProcessMemory,pinfo.hProcess,eax,o old_process32next,5,0
	invoke VirtualAllocEx,pinfo.hProcess,0,4096,MEM_COMMIT or MEM_TOP_DOWN,PAGE_EXECUTE_READWRITE
	pop ebx
	lea ecx,[eax-5]
	sub ecx,ebx
	mov d jmp_hook+1,ecx
	lea ecx,[ebx+5]
	mov d ret_process32next+1,ecx
	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_process32next,o end_process32next-o hook_process32next,0
	invoke WriteProcessMemory,pinfo.hProcess,ebx,o jmp_hook,5,0

	invoke GetModuleHandle,o kernel
	invoke GetProcAddress,eax,o terminateprocess
	push eax
	invoke VirtualProtectEx,pinfo.hProcess,eax,4096,PAGE_EXECUTE_READWRITE,o temp
	pop eax
	mov b hook_retn+1,8
	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_retn,3,0

	cmp usehvp,0
	je no_kernel
	invoke GetModuleHandle,o kernel
	invoke GetProcAddress,eax,o virtualprotectex
	push eax
	invoke VirtualProtectEx,pinfo.hProcess,eax,4096,PAGE_EXECUTE_READWRITE,o temp
	pop eax
	push eax
	invoke ReadProcessMemory,pinfo.hProcess,eax,o hook_virtualprotectex,5,0
	invoke VirtualAllocEx,pinfo.hProcess,0,4096,MEM_COMMIT or MEM_TOP_DOWN,PAGE_EXECUTE_READWRITE
	pop ebx
	lea ecx,[eax-5]
	sub ecx,ebx
	mov d jmp_hook+1,ecx
	lea ecx,[ebx+5]
	mov d ret_virtualprotectex+1,ecx
	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_virtualprotectex,o end_virtualprotectex-o hook_virtualprotectex,0
	invoke WriteProcessMemory,pinfo.hProcess,ebx,o jmp_hook,5,0
no_kernel:
	cmp upatched,0
	jne no_user
	invoke GetModuleHandle,o user
	invoke GetProcAddress,eax,o blockinput
	push eax
	invoke VirtualProtectEx,pinfo.hProcess,eax,4096,PAGE_EXECUTE_READWRITE,o temp
	pop eax
	mov b hook_retn+1,4
	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_retn,3,0
	or eax,eax
	je no_user

	mov upatched,1
;	invoke GetModuleHandle,o user
;	invoke GetProcAddress,eax,o setwindowlonga
;	push eax
;	invoke VirtualProtectEx,pinfo.hProcess,eax,4096,PAGE_EXECUTE_READWRITE,o temp
;	pop eax
;	push eax
;	invoke ReadProcessMemory,pinfo.hProcess,eax,o hook_setwindowlonga,5,0
;	invoke VirtualAllocEx,pinfo.hProcess,0,4096,MEM_COMMIT or MEM_TOP_DOWN,PAGE_EXECUTE_READWRITE
;	pop ebx
;	lea ecx,[eax-5]
;	sub ecx,ebx
;	mov d jmp_hook+1,ecx
;	lea ecx,[ebx+5]
;	mov d ret_setwindowlonga+1,ecx
;	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_setwindowlonga,o end_setwindowlonga-o hook_setwindowlonga,0
;	invoke WriteProcessMemory,pinfo.hProcess,ebx,o jmp_hook,5,0
no_user:
	call restore_guard

	.elseif dbevent.dwDebugEventCode==EXCEPTION_DEBUG_EVENT
	.if dbevent.u.Exception.pExceptionRecord.ExceptionCode==STATUS_INVALID_HANDLE
	call restore_guard
	invoke ContinueDebugEvent,dbevent.dwProcessId,dbevent.dwThreadId,DBG_CONTINUE
	.continue

	.elseif dbevent.u.Exception.pExceptionRecord.ExceptionCode==EXCEPTION_ACCESS_VIOLATION
	inc counter
	call restore_guard

	.elseif dbevent.u.Exception.pExceptionRecord.ExceptionCode==EXCEPTION_SINGLE_STEP
	call restore_guard

	.elseif dbevent.u.Exception.pExceptionRecord.ExceptionCode==EXCEPTION_BREAKPOINT
	cmp int3addr,0
	je not_our_int3
	invoke GetThreadContext,pinfo.hThread,o context
	dec d context.regEip
	mov eax,int3addr
	cmp eax,context.regEip
	jne not_our_int3
	mov int3addr,0
	invoke WriteProcessMemory,pinfo.hProcess,eax,o stolenbytes,1,0
	invoke SetThreadContext,pinfo.hThread,o context
	call restore_guard
	invoke ContinueDebugEvent,dbevent.dwProcessId,dbevent.dwThreadId,DBG_CONTINUE
	.continue
not_our_int3:
	call restore_guard

	.elseif dbevent.u.Exception.pExceptionRecord.ExceptionCode==STATUS_GUARD_PAGE_VIOLATION
	cmp useint3,0
	jne no_guarder
	inc guarder
	test guarder,3
	jne no_guarder
	call restore_guard
no_guarder:
	invoke GetThreadContext,pinfo.hThread,o context
	mov eax,lasteip
	mov ebx,context.regEip
	mov lasteip,ebx
	cmp ebx,baseend
	ja no_oep
	cmp ebx,basestart
	jb no_oep
	sub eax,ebx
	jnl no_minus
	neg eax
no_minus:
	cmp eax,16
	jl no_oep
	mov ecx,8
	mov edi,o oeptext+7
	call hex
	invoke MessageBox,hDlg,o oeptext,o oepcapt,MB_YESNO
	cmp eax,IDNO
	je no_oep
	cmp usehvp,0
	je no_unhookvp
	mov eax,d ret_virtualprotectex+1
	sub eax,5
	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_virtualprotectex,5,0
no_unhookvp:
;	mov eax,d ret_setwindowlonga+1
;	sub eax,5
;	invoke WriteProcessMemory,pinfo.hProcess,eax,o hook_setwindowlonga,5,0
	invoke VirtualProtectEx,pinfo.hProcess,basestart,range,PAGE_EXECUTE_READWRITE,o temp

	mov eax,imagebase
	lea eax,[eax.IMAGE_DOS_HEADER.e_lfanew]
	invoke ReadProcessMemory,pinfo.hProcess,eax,o temp,4,0
	mov eax,imagebase
	add eax,temp
	lea eax,[eax.IMAGE_NT_HEADERS.OptionalHeader.DataDirectory+IMAGE_DIRECTORY_ENTRY_TLS*size IMAGE_DATA_DIRECTORY+IMAGE_DATA_DIRECTORY.VirtualAddress]
	invoke ReadProcessMemory,pinfo.hProcess,eax,o temp,4,0
	cmp temp,0
	je no_tls
	mov eax,imagebase
	add eax,temp
	add eax,0ch
	invoke WriteProcessMemory,pinfo.hProcess,eax,o zero,4,0
no_tls:

	cmp dettach,0
	jne dettach_it
abort_it:
	invoke ContinueDebugEvent,dbevent.dwProcessId,dbevent.dwThreadId,DBG_CONTINUE
	invoke DebugActiveProcessStop,pinfo.dwProcessId
	.break
dettach_it:
	invoke ReadProcessMemory,pinfo.hProcess,context.regEip,o stolenbytes,2,0
	invoke WriteProcessMemory,pinfo.hProcess,context.regEip,o infjump,2,0
	invoke ContinueDebugEvent,dbevent.dwProcessId,dbevent.dwThreadId,DBG_CONTINUE
	invoke DebugActiveProcessStop,pinfo.dwProcessId
	invoke SuspendThread,pinfo.hThread
	invoke MessageBox,hDlg,o dettachtext,o dettachcapt,MB_OK
	invoke WriteProcessMemory,pinfo.hProcess,context.regEip,o stolenbytes,2,0
	invoke ResumeThread,pinfo.hThread
	.break
no_oep:
	cmp useint3,0
	je no_int3
	cmp int3addr,0
	je no_restore
	invoke ReadProcessMemory,pinfo.hProcess,int3addr,o stolenbytes+1,1,0
	cmp b [stolenbytes+1],0cch
	jne no_restore
	invoke WriteProcessMemory,pinfo.hProcess,int3addr,o stolenbytes,1,0
no_restore:
	invoke ReadProcessMemory,pinfo.hProcess,context.regEip,o opcodebuff,16,0
	cmp b opcodebuff,0c3h
	je no_int3
	push o opcodebuff
	call ldex86
	add eax,context.regEip
	mov int3addr,eax
	push eax
	invoke ReadProcessMemory,pinfo.hProcess,eax,o stolenbytes,1,0
	pop eax
	invoke WriteProcessMemory,pinfo.hProcess,eax,o int3,1,0
	invoke VirtualProtectEx,pinfo.hProcess,basestart,range,PAGE_EXECUTE_READWRITE,o temp
no_int3:
	invoke ContinueDebugEvent,dbevent.dwProcessId,dbevent.dwThreadId,DBG_CONTINUE
	.continue
	.endif
	.endif

	invoke ContinueDebugEvent,dbevent.dwProcessId,dbevent.dwThreadId,DBG_EXCEPTION_NOT_HANDLED
	.endw

	invoke CloseHandle,pinfo.hProcess
	invoke CloseHandle,pinfo.hThread
	jmp unknown
DlgProc endp



restore_guard:
	cmp count,0
	jne no_guard
	mov eax,counter
	cmp eax,de_counter
	jb no_guard
	invoke VirtualProtectEx,pinfo.hProcess,basestart,range,PAGE_EXECUTE_READWRITE or PAGE_GUARD,o temp
no_guard:
	ret



hex:
	mov eax,ebx
	and al,0fh
	add al,90h
	daa
	adc al,40h
	daa
	shr ebx,4
	mov [edi],al
	dec edi
	dec ecx
	jne hex
	ret



unhex:
	mov ecx,eax
	cmp ecx,8
	jl good_unhex
	mov ecx,8
good_unhex:
	sub eax,ecx
	lea esi,[eax+o editbuff]
	xor eax,eax
next_unhex:
	mov bl,[esi]
	inc esi
	cmp bl,"0"
	jb bad_unhex
	cmp bl,"9"
	ja char_unhex
	sub bl,"0"
	jmp add_unhex
char_unhex:
	cmp bl,"A"
	jb bad_unhex
	cmp bl,"F"
	ja bad_unhex
	sub bl,"A"-10
add_unhex:
	shl eax,4
	or al,bl
	dec ecx
	jne next_unhex
	ret
bad_unhex:
	xor eax,eax
	ret



ldex86:
 db 0C8h,008h,000h,000h,060h,0E9h,04Fh,001h
 db 000h,000h,08Fh,045h,0F8h,033h,0FFh,033h
 db 0C0h,089h,045h,0FCh,033h,0D2h,08Bh,075h
 db 008h,08Ah,00Eh,033h,0C0h,08Ah,0C1h,08Bh
 db 05Dh,0F8h,08Ah,01Ch,018h,080h,0FBh,020h
 db 075h,01Ch,080h,0F9h,066h,075h,005h,0BFh
 db 001h,000h,000h,000h,080h,0F9h,067h,075h
 db 007h,0C7h,045h,0FCh,001h,000h,000h,000h
 db 042h,046h,08Ah,00Eh,0EBh,0D5h,033h,0C0h
 db 080h,0F9h,0F6h,08Ah,0C1h,08Bh,05Dh,0F8h
 db 08Ah,004h,018h,074h,005h,080h,0F9h,0F7h
 db 075h,00Ah,08Ah,04Eh,001h,0F6h,0C1h,038h
 db 074h,002h,0B0h,002h,085h,0FFh,074h,008h
 db 0A8h,010h,074h,004h,024h,0EFh,00Ch,008h
 db 08Bh,04Dh,0FCh,085h,0C9h,074h,006h,024h
 db 0EFh,024h,0FBh,00Ch,008h,03Ch,040h,075h
 db 012h,042h,046h,033h,0C0h,08Ah,006h,08Bh
 db 05Dh,0F8h,081h,0C3h,000h,001h,000h,000h
 db 08Ah,004h,018h,042h,0A8h,002h,00Fh,084h
 db 097h,000h,000h,000h,042h,046h,08Ah,00Eh
 db 08Bh,0F1h,081h,0E6h,0FFh,000h,000h,000h
 db 08Bh,0DEh,0C1h,0FBh,006h,084h,0DBh,075h
 db 00Bh,083h,0E6h,007h,083h,0FEh,005h,075h
 db 003h,083h,0C2h,004h,033h,0DBh,08Ah,0D9h
 db 08Bh,0F3h,0C1h,0FEh,006h,083h,0FEh,003h
 db 074h,037h,083h,0E3h,007h,083h,0FBh,004h
 db 075h,02Fh,042h,033h,0DBh,08Ah,0D9h,08Bh
 db 0F3h,0C1h,0FEh,006h,04Eh,075h,009h,083h
 db 0E3h,007h,083h,0FBh,004h,075h,001h,042h
 db 033h,0DBh,08Ah,0D9h,08Bh,0F3h,0C1h,0FEh
 db 006h,083h,0FEh,002h,075h,00Bh,083h,0E3h
 db 007h,083h,0FBh,004h,075h,003h,083h,0C2h
 db 004h,080h,0F9h,040h,072h,012h,080h,0F9h
 db 07Fh,077h,00Dh,033h,0DBh,08Ah,0D9h,083h
 db 0E3h,007h,083h,0FBh,004h,074h,001h,042h
 db 080h,0F9h,080h,072h,016h,080h,0F9h,0BFh
 db 077h,011h,081h,0E1h,0FFh,000h,000h,000h
 db 083h,0E1h,007h,083h,0F9h,004h,074h,003h
 db 083h,0C2h,004h,08Bh,0C8h,0F6h,0C1h,010h
 db 074h,003h,083h,0C2h,004h,0F6h,0C1h,004h
 db 074h,001h,042h,0F6h,0C1h,008h,074h,003h
 db 083h,0C2h,002h,084h,0C0h,075h,001h,042h
 db 089h,054h,024h,01Ch,061h,0C9h,0C2h,004h
 db 000h,0E8h,0ACh,0FEh,0FFh,0FFh,002h,002h
 db 002h,002h,004h,010h,001h,001h,002h,002h
 db 002h,002h,004h,010h,001h,040h,002h,002h
 db 002h,002h,004h,010h,001h,001h,002h,002h
 db 002h,002h,004h,010h,001h,001h,002h,002h
 db 002h,002h,004h,010h,020h,001h,002h,002h
 db 002h,002h,004h,010h,020h,001h,002h,002h
 db 002h,002h,004h,010h,020h,001h,002h,002h
 db 002h,002h,004h,010h,020h,001h,001h,001h
 db 001h,001h,001h,001h,001h,001h,001h,001h
 db 001h,001h,001h,001h,001h,001h,001h,001h
 db 001h,001h,001h,001h,001h,001h,001h,001h
 db 001h,001h,001h,001h,001h,001h,001h,001h
 db 002h,002h,020h,020h,020h,020h,010h,012h
 db 004h,006h,001h,001h,001h,001h,004h,004h
 db 004h,004h,004h,004h,004h,004h,004h,004h
 db 004h,004h,004h,004h,004h,004h,006h,012h
 db 006h,006h,002h,002h,002h,002h,002h,002h
 db 002h,002h,002h,002h,002h,002h,001h,001h
 db 001h,001h,001h,001h,001h,001h,001h,001h
 db 018h,001h,001h,001h,001h,001h,010h,010h
 db 010h,010h,001h,001h,001h,001h,004h,010h
 db 001h,001h,001h,001h,001h,001h,004h,004h
 db 004h,004h,004h,004h,004h,004h,010h,010h
 db 010h,010h,010h,010h,010h,010h,006h,006h
 db 008h,001h,002h,002h,006h,012h,00Ch,001h
 db 008h,001h,001h,004h,001h,001h,002h,002h
 db 002h,002h,004h,004h,001h,001h,002h,002h
 db 002h,002h,002h,002h,002h,002h,004h,004h
 db 004h,004h,004h,004h,004h,004h,010h,010h
 db 018h,004h,001h,001h,001h,001h,020h,001h
 db 020h,020h,001h,001h,006h,012h,001h,001h
 db 001h,001h,001h,001h,002h,002h,002h,002h
 db 002h,002h,000h,000h,001h,000h,001h,001h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,002h,002h
 db 002h,002h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,001h,001h
 db 001h,001h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,002h,002h
 db 002h,002h,002h,002h,002h,002h,002h,002h
 db 002h,002h,002h,002h,002h,002h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,010h,010h
 db 010h,010h,010h,010h,010h,010h,010h,010h
 db 010h,010h,010h,010h,010h,010h,002h,002h
 db 002h,002h,002h,002h,002h,002h,002h,002h
 db 002h,002h,002h,002h,002h,002h,001h,001h
 db 001h,002h,006h,002h,000h,000h,001h,001h
 db 001h,002h,006h,002h,000h,002h,002h,002h
 db 002h,002h,002h,002h,002h,002h,000h,000h
 db 006h,002h,002h,002h,002h,002h,002h,002h
 db 000h,000h,000h,000h,000h,000h,001h,001h
 db 001h,001h,001h,001h,001h,001h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h,000h,000h
 db 000h,000h,000h,000h,000h,000h
end start