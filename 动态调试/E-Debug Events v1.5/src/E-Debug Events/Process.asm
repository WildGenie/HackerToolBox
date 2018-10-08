;P 是Process的简写
;C 是Create的简写

include psapi.inc
includelib psapi.lib

PROCESS_MEMORY_COUNTERS struct
    cb dd ?
    PageFaultCount dd ?
    PeakWorkingSetSize dd ?
    WorkingSetSize dd ?
    QuotaPeakPagedPoolUsage dd ?
    QuotaPagedPoolUsage dd ?
    QuotaPeakNonPagedPoolUsage dd ?
    QuotaNonPagedPoolUsage dd ?
    PagefileUsage dd ?
    PeakPagefileUsage dd ?
PROCESS_MEMORY_COUNTERS ENDS

.data
szMemoryUsage db 20 dup(?)
.data?
ThreadID       dd ?
hBaseSize      dd ?
hmodBaseAddr   dd ?
pi    PROCESS_INFORMATION<>

.code


;创建进程 
;lpApplicationName:指定可执行文件名
;Flags： 标志
;lpProcessInformation:指向一个PROCESS_INFORMATION结构，这个结构用来供函数返回新建进程的相关信息。
;如果函数执行成功，返回值是非0值，否则函数返回0。
CreateP proc lpApplicationName:DWORD,Flags:DWORD,lpProcessInformation:DWORD
	LOCAL stStartUp:STARTUPINFO
	invoke GetStartupInfo,addr stStartUp
	invoke CreateProcess,lpApplicationName,NULL,NULL,NULL,FALSE,Flags,NULL,NULL,addr stStartUp,lpProcessInformation
	ret

CreateP endp

;写内存
WritePMemory proc hProcess:DWORD,lpBaseAddress:DWORD,lpBuffer:DWORD,nSize:DWORD 
       LOCAL l_BytesWritten:DWORD
       invoke WriteProcessMemory,hProcess,lpBaseAddress,lpBuffer,nSize,addr l_BytesWritten
       ret
WritePMemory endp

;读内存
ReadPMemory proc hProcess:DWORD,lpBaseAddress:DWORD,lpBuffer:DWORD,nSize:DWORD 
       LOCAL l_BytesWritten:DWORD
       invoke ReadProcessMemory,hProcess,lpBaseAddress,lpBuffer,nSize,addr l_BytesWritten
       ret
ReadPMemory endp

;读取指定进程的整个内存,返回大小
ReadPWholeMemory proc ProcessID:DWORD
       LOCAL l_ModuleSnap:DWORD
       LOCAL l_me32:MODULEENTRY32
       invoke CreateToolhelp32Snapshot,TH32CS_SNAPMODULE,ProcessID 
       mov l_ModuleSnap,eax
       invoke Module32First,l_ModuleSnap,addr l_me32
       mov eax,l_me32.modBaseAddr
       mov hmodBaseAddr,eax
       mov eax,l_me32.modBaseSize
       mov hBaseSize,eax
       ret
ReadPWholeMemory endp

;终止进程
TerminateP proc hProcess:DWORD
	invoke TerminateProcess,hProcess,NULL
	ret

TerminateP endp

;创建线程(ThreadProc proc uses ecx Param:DWORD)
CThread proc StartFunction:DWORD
        invoke CreateThread,NULL,NULL,StartFunction,NULL,0,addr ThreadID
        invoke CloseHandle,eax
        ret

CThread endp

;取得当前进程的内存使用大小 返回字符串
;比如: 2808KB
GetMemoryUsage proc uses ecx
         LOCAL l_hP:DWORD
         LOCAL l_PM:PROCESS_MEMORY_COUNTERS
         LOCAL l_Fm[10]:BYTE

         invoke RtlZeroMemory,addr szMemoryUsage,20
         invoke RtlZeroMemory,addr l_hP,4
         invoke RtlZeroMemory,addr l_PM,sizeof PROCESS_MEMORY_COUNTERS
         invoke RtlZeroMemory,addr l_Fm,10
         invoke GetCurrentProcessId
         invoke OpenProcess,PROCESS_ALL_ACCESS,FALSE,eax
         mov l_hP,eax
         invoke GetProcessMemoryInfo,l_hP,addr l_PM,sizeof PROCESS_MEMORY_COUNTERS
         .if eax==TRUE
         	mov eax,l_PM.WorkingSetSize
         	cdq
         	mov ecx,1024
         	idiv ecx
         	lea ecx,l_Fm
         	mov byte ptr ds:[ecx],'%'
         	mov byte ptr ds:[ecx+1],'d'
         	mov byte ptr ds:[ecx+2],'K'
         	mov byte ptr ds:[ecx+3],'B'
         	invoke wsprintf,addr szMemoryUsage,ecx,eax
         .endif
         invoke CloseHandle,l_hP
         lea eax,szMemoryUsage
         ret
GetMemoryUsage endp



