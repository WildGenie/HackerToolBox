.386
.model flat, stdcall  ;32 bit memory model
option casemap :none  ;case sensitive

include E-Debug Events.inc


include Common Dialog Box.asm
include Dialog.asm
include RadioButton.asm
include CheckBox.asm
include Edit.asm
include krnln.asm
include PE.asm
include Bin.asm
include File.asm
include Process.asm
include Text.asm
include PrivateProfileString.asm
include FileOrDirectory.asm



include Exception.asm
include Junk Code.asm

.code

start:

	invoke GetModuleHandle,NULL
	mov hInstance,eax
        invoke InitCommonControls
        invoke SetUnhandledExceptionFilter,addr ExceptionFilter
	invoke DialogBoxParam,hInstance,IDD_DIALOG1,NULL,addr DlgProc,NULL
	invoke ExitProcess,0

;########################################################################

DlgProc proc hWin:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM

	mov		eax,uMsg
	.if eax==WM_INITDIALOG
                CMov hMainhWin,hWin
                invoke GetConfigName
                invoke GetKeyText,Text('Exceptions'),Text('Address'),NULL,addr lpException,6000,addr lpConfigName
                invoke LoadMenu,hInstance,IDR_MENU
                mov hMenu,eax
                invoke SetMenu,hWin,hMenu
                invoke SetMainICO,hWin,MAIN_ICO
                invoke CheckRadio,hWin,IDC_RBN_Static,TRUE
                invoke GetDlgItem,hWin,IDC_EDT_LOG
                mov hEdit,eax
                invoke GetDlgItem,hWin,IDC_EDT_InterruptAddress
                mov hEditInterrup,eax
                invoke GetLibAddr
                invoke GetVersionAddr
	.elseif eax==WM_COMMAND
                mov eax,wParam
                .if eax==IDC_BTN_OPEN ;打开文件
                	invoke OpenFileName,addr strFile,addr szExeFileAll
                	.if eax==TRUE
                	        mov hSelectFile,TRUE
                	        invoke SelectFile
                	.else
                		mov hSelectFile,FALSE	
                	.endif
                .endif
                .if eax==IDC_BTN_ClearLog ;清除Log
                	invoke ClearEdit,hEdit
                .endif
                .if eax==IDC_BTN_Terminate ;终止进程
                	invoke TerminateP,pi.hProcess
                .endif
                .if eax==IDC_CHK_TopMostWindow ;TopMostWindow
                	invoke IsCheckedBox,hWin,IDC_CHK_TopMostWindow
                	.if eax==TRUE
                		invoke TopMostWindow,hWin,TRUE
                	.else
                		invoke TopMostWindow,hWin,FALSE
                	.endif
                .endif
                .if eax==IDC_BTN_Start  ;开始调试
                	.if hSelectFile==TRUE
                	       invoke ReadFileMapping,addr strFile,addr hMappMemory
                	       invoke ValidPE,hMappMemory
                	       .if eax==FALSE
                	       	      invoke AppText,VPE
                	       	      jmp Error
                	       .endif
                		invoke IsCheckedBox,hWin,IDC_CHK_InterruptAddress ;指定中断地址
                		.if eax==TRUE ;真
                			invoke IsEditNULL,hEditInterrup
                			.if eax==TRUE
                				invoke AppText,Interrupt
                				jmp Error
                			.endif
                			invoke GetHexEdit,hEditInterrup
                			mov hAddress,eax
                			invoke IsCheckedRadio,hWin,IDC_RBN_Static ;静态编译
                			.if eax==TRUE
                				invoke Interruptaddress,hAddress
                				invoke MessageDlg,hWin,addr szReadPWholeMemory,MB_ICONQUESTION+MB_YESNO
                				.if  eax==IDYES
                				        invoke AddressOperations,4
                				.else
                					invoke AddressOperations,0
                				.endif
                			.endif
                			invoke IsCheckedRadio,hWin,IDC_RBN_Independent ;独立编译
                			.if eax==TRUE
                				invoke AddressOperations,2
                			.endif
                			invoke IsCheckedRadio,hWin,IDC_RBN_Compile ;编译
                			.if eax==TRUE
                			      invoke AddressOperations,2
                			.endif
                		.else
                			invoke IsCheckedRadio,hWin,IDC_RBN_Static ;静态编译
	                		.if eax==TRUE 
	                			
	                			invoke FindBin,hMappMemory,hMappSize,addr szBinSignature,14,0
	                			.if eax==-1
	                				invoke AppText,UMemory
	                				invoke AddressOperations,3
	                				jmp Error
	                			.endif
	                			invoke OffsetToVA,hMappMemory,eax
	                			mov hAddress,eax
	                			invoke Interruptaddress,hAddress
	                			invoke AddressOperations,0
	                		.endif
	                		invoke IsCheckedRadio,hWin,IDC_RBN_Independent ;独立编译
	                		.if eax==TRUE
	                			invoke AddressOperations,1
	                		.endif
	                		invoke IsCheckedRadio,hWin,IDC_RBN_Compile ;编译
	                		.if eax==TRUE
	                			invoke AddressOperations,1
	                		.endif
                		.endif
                		
                	Error: 
                	       
                	.else
                		invoke AppText,ErrorFile
                	.endif
                .endif
                .if eax==IDM_JunkCode
                	invoke SendMessage,hWin,WM_CLOSE,NULL,NULL
                	invoke DialogBoxParam,hInstance,IDD_JunkCode,NULL,addr DialogProc,NULL
                .endif
                .if eax==IDM_Exception
                        invoke CThread,addr ExceptionMainPro
                .endif
	.elseif eax==WM_CLOSE
		invoke EndDialog,hWin,0
	.else
		mov		eax,FALSE
		ret
	.endif
	mov		eax,TRUE
	ret

DlgProc endp

;获取LoadLibrary地址
GetLibAddr proc
        LOCAL l_Lib:DWORD
	invoke ZeroMemoryAlloc,500
	invoke LoadString,hInstance,szDll,eax,500
	invoke LoadLibrary,lpZeroMemory
	mov l_Lib,eax
	invoke ZeroMemorySecondAlloc,500
	invoke LoadString,hInstance,LibA,eax,500
	invoke GetProcAddress,l_Lib,lpZeroMemorySecond
	mov hLib,eax
	invoke ZeroMemoryFree
	invoke ZeroMemorySecondFree
	ret

GetLibAddr endp

;获取GetVersion地址
GetVersionAddr proc
        LOCAL l_Lib:DWORD
        invoke ZeroMemoryAlloc,500
        invoke LoadString,hInstance,szDll,eax,500
        invoke LoadLibrary,lpZeroMemory
        mov l_Lib,eax
        invoke ZeroMemorySecondAlloc,500
        invoke LoadString,hInstance,libVersion,eax,500
        invoke GetProcAddress,l_Lib,lpZeroMemorySecond
        mov hlibVersion,eax
        invoke ZeroMemoryFree
        invoke ZeroMemorySecondFree
	ret

GetVersionAddr endp



;选择文件
SelectFile proc
	invoke AppendTextNewline,hEdit,addr strFile
	ret

SelectFile endp

;中断地址
Interruptaddress proc Address:DWORD
	invoke ZeroMemoryAlloc,100
	invoke wsprintf,lpZeroMemory,addr szInterruptaddress,Address
	invoke AppendTextNewline,hEdit,lpZeroMemory
        invoke ZeroMemoryFree
	ret

Interruptaddress endp

;事件地址
EventAddress proc Address:DWORD
	invoke ZeroMemoryAlloc,100
	invoke wsprintf,lpZeroMemory,addr szEventAddress,Address
	invoke AppendTextNewline,hEdit,lpZeroMemory
        invoke ZeroMemoryFree
	ret

EventAddress endp

;开始地址
StartAddress proc Address:DWORD
	invoke ZeroMemoryAlloc,100
	invoke wsprintf,lpZeroMemory,addr szStartAddress,Address
	invoke AppendTextNewline,hEdit,lpZeroMemory
        invoke ZeroMemoryFree
	ret

StartAddress endp

;加入字符串资源到EDIT
AppText proc ID:DWORD
	invoke ZeroMemoryAlloc,500
	invoke LoadString,hInstance,ID,eax,500
	invoke AppendTextNewline,hEdit,lpZeroMemory
	invoke ZeroMemoryFree
	ret

AppText endp

;地址操作 0 静态编译 静态编译指定地址 1 独立编译 编译 2 独立编译 编译 指定地址 3 静态编译读内存方式 4.静态编译指定地址读内存方式
AddressOperations proc Parameter:DWORD
	mov eax,Parameter
	mov hParameter,eax
	invoke CThread,addr DebugEvent
	ret

AddressOperations endp



;调试
DebugEvent proc
	mov hContinue,0
	invoke CreateP,addr strFile,DEBUG_PROCESS or DEBUG_ONLY_THIS_PROCESS,addr pi
	.while TRUE
		invoke WaitForDebugEvent, addr DBEvent,INFINITE
		.if DBEvent.dwDebugEventCode==EXIT_PROCESS_DEBUG_EVENT
			invoke AppText,ExitP
			invoke AppText,EEnd
			.break
	        .elseif DBEvent.dwDebugEventCode==CREATE_PROCESS_DEBUG_EVENT
	        	invoke AppText,CP
	        	mov eax,DBEvent.u.CreateProcessInfo.lpStartAddress
	        	mov hStartAddress,eax
	        	invoke StartAddress,hStartAddress
	        	mov eax,hParameter
	        	.if eax==0 ;静态编译支持
	        		invoke WritePMemory,pi.hProcess,hAddress,addr szint3,1 
	        	.elseif eax>=1 
        	        	invoke ReadPMemory,pi.hProcess,hStartAddress,addr lpStartAddress,1
        	                invoke WritePMemory,pi.hProcess,hStartAddress,addr szint3,1 
	        	        
	        	.endif
	        	
	       .elseif DBEvent.dwDebugEventCode==EXCEPTION_DEBUG_EVENT
	        	.if DBEvent.u.Exception.pExceptionRecord.ExceptionCode==EXCEPTION_BREAKPOINT
	        	      mov context.ContextFlags,CONTEXT_FULL
	        	      invoke GetThreadContext,pi.hThread,addr context
	        	      mov edi,hAddress
	        	      inc edi
	        	      .if context.regEip==edi ;获取事件地址
	        	             dec context.regEip
	        	             invoke WritePMemory,pi.hProcess,hAddress,addr szFF,1 ;恢复数据
	        	             invoke SetThreadContext,pi.hThread,addr context 
	        	             mov eax,context.regEbp
	        	             sub eax,4
	        	             invoke ReadPMemory,pi.hProcess,eax,addr hEventAddress,4 ;读取地址
	        	             invoke IsException,hEventAddress
	        	             .if eax==FALSE
	        	             	   invoke EventAddress,hEventAddress
	        	             .endif
	        	             invoke ReadPMemory,pi.hProcess,hEventAddress,addr hBreakEventAddress,1 ;设置断点
	        	             invoke WritePMemory,pi.hProcess,hEventAddress,addr szint3,1
	        	      .endif
	        	      mov edi,hEventAddress
	        	      inc edi
	        	      .if context.regEip==edi ;事件地址中断
	        	      	      dec context.regEip
	        	      	      invoke WritePMemory,pi.hProcess,hEventAddress,addr hBreakEventAddress,1 ;恢复数据
	        	      	      invoke SetThreadContext,pi.hThread,addr context 
	        	      	      invoke WritePMemory,pi.hProcess,hAddress,addr szint3,1
	        	      .endif
	        	      mov edi,hStartAddress
	        	      inc edi
	        	      .if context.regEip==edi ;开始地址中断
	        	      	     dec context.regEip
	        	      	     invoke WritePMemory,pi.hProcess,hStartAddress,addr lpStartAddress,1 ;恢复开始地址数据
	        	      	     invoke SetThreadContext,pi.hThread,addr context
	        	      	     mov eax,hParameter
	        	      	     .if eax<3 ;LoadLibrary
	        	      	     	   invoke ReadPMemory,pi.hProcess,hLib,addr lpLib,1  ;读取并设置断点
	        	      	           invoke WritePMemory,pi.hProcess,hLib,addr szint3,1
	        	      	     .elseif eax>=3 ;GetVersion
	        	                   invoke ReadPMemory,pi.hProcess,hlibVersion,addr lplibVersion,1
	        	                   invoke WritePMemory,pi.hProcess,hlibVersion,addr szint3,1
	        	      	     .endif
	        	      	     
	        	      .endif
	        	      mov edi,hlibVersion
	        	      inc edi
	        	      .if context.regEip==edi ;GetVersion
	        	             dec context.regEip
	        	             invoke WritePMemory,pi.hProcess,hlibVersion,addr lplibVersion,1
		        	     invoke SetThreadContext,pi.hThread,addr context
	        	             mov eax,hParameter
	        	             .if eax==3
		        	           invoke ReadPWholeMemory,pi.dwProcessId
		        	           invoke ZeroMemorySecondAlloc,eax
		        	           invoke ReadPMemory,pi.hProcess,hmodBaseAddr,lpZeroMemorySecond,hBaseSize
		        	           invoke FindBin,lpZeroMemorySecond,hBaseSize,addr szBinSignature,14,0
		        	           .if eax!=-1
		        	             	invoke OffsetToVA,lpZeroMemorySecond,eax
		        	             	mov hAddress,eax
		        	             	invoke Interruptaddress,hAddress
		        	             	invoke ZeroMemorySecondFree
	        	                   .endif
	        	             .endif
	        	            
	        	             invoke WritePMemory,pi.hProcess,hAddress,addr szint3,1
	        	      .endif
	        	      mov edi,hLib
	        	      inc edi
	        	      .if context.regEip==edi ;LoadLibrary 地址中断
	        	      	    dec context.regEip
	        	      	    invoke WritePMemory,pi.hProcess,hLib,addr lpLib,1 ;恢复数据
	        	      	    invoke SetThreadContext,pi.hThread,addr context
	        	      	    mov eax,context.regEsp
	        	      	    invoke ReadPMemory,pi.hProcess,eax,addr hLibEsp,4  ;读取ESP寄存器的数值
	        	      	    invoke ReadPMemory,pi.hProcess,hLibEsp,addr lpLibEsp,1   ;读取并设置断点
	        	      	    invoke WritePMemory,pi.hProcess,hLibEsp,addr szint3,1
	        	      	    mov eax,context.regEsp
	        	      	    add eax,4
	        	      	    invoke ReadPMemory,pi.hProcess,eax,addr hLibEspDec4,4 ;读取ESP+4寄存器的数值
	        	      	    invoke ZeroMemoryAlloc,500
	        	      	    invoke ReadPMemory,pi.hProcess,hLibEspDec4,eax,500  ;读取hLibEspDec4地址的字符串并添加到EDIT中
	        	      	    invoke AppendTextNewline,hEdit,lpZeroMemory
	        	      	    invoke ReadFileMapping,lpZeroMemory,addr hMappMemory
	        	      	    .if eax!=-1
	        	      	         invoke ZeroMemoryFree
	        	      	         .if hParameter==1
	        	      	         	invoke FindBin,hMappMemory,hMappSize,addr szBinSignature,14,0
	        	      	         	.if eax!=-1
	        	      	         		invoke OffsetToVA,hMappMemory,eax
		        	      	          	mov hAddress,eax
		        	      	          	invoke Interruptaddress,hAddress ;指令中断地址
		        	      	         .else
		        	      	         	mov hAddress,0
	        	      	         	.endif
	        	      	         .endif
        	      	              	.if hParameter==2
        	      	          		invoke Interruptaddress,hAddress
        	      	          	.endif
	        	      	        .if hContinue==1
	        	      	               inc hContinue
	        	      	        .endif
	        	      	        invoke FreeReadFile,hMappMemory
	        	      	     .else
	        	      	     	  inc hContinue
	        	      	     	  invoke ZeroMemoryFree
	        	      	    .endif
	        	      	    
	        	      	    
	        	      .endif
	        	      mov edi,hLibEsp
	        	      inc edi
	        	      .if context.regEip==edi ;hLibEsp 地址中断 (LoadLibrary)
	        	      	    dec context.regEip
	        	      	    invoke WritePMemory,pi.hProcess,hLibEsp,addr lpLibEsp,1 ;恢复数据
	        	      	    invoke SetThreadContext,pi.hThread,addr context
	        	      	    .if hAddress!=0
	        	      	        invoke WritePMemory,pi.hProcess,hAddress,addr szint3,1
	        	      	    .endif
	        	      	    .if hContinue==1
	        	      	        invoke WritePMemory,pi.hProcess,hLib,addr szint3,1  ;设置断点
	        	      	    .endif
	        	      	    
	        	      .endif
	        	      invoke ContinueDebugEvent, DBEvent.dwProcessId, DBEvent.dwThreadId, DBG_CONTINUE
	        	      .continue 
	        	.endif
		.endif
		invoke ContinueDebugEvent, DBEvent.dwProcessId, DBEvent.dwThreadId, DBG_EXCEPTION_NOT_HANDLED 
        .endw
        invoke CloseHandle,pi.hProcess
        invoke CloseHandle,pi.hThread
	ret

DebugEvent endp

;异常处理
ExceptionFilter proc
	invoke MessageDlg,NULL,Text('程序发生异常，bug ? 联系 E-Mail: cektop@163.com'),MB_ICONINFORMATION
	invoke ExitProcess,NULL
	ret

ExceptionFilter endp

end start
