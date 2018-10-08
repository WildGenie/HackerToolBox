include shlwapi.inc
includelib shlwapi.lib

.data?
lpZeroMemory       dd ?
lpZeroMemorySecond dd ?
hRCDataMemory      dd ?
hRCDataSize        dd ?
.code


;退出
Exit proc
	invoke ExitProcess,NULL
	ret

Exit endp

;信息框(标准信息框，不可指定消息框样式)
ShowMessage proc hWin:DWORD,szText:DWORD
        LOCAL l_Alloc:DWORD
        invoke GlobalAlloc,GPTR,256
        mov l_Alloc,eax
        .if eax!=0
        	invoke GetModuleHandle,NULL
	        invoke GetModuleFileName,eax,l_Alloc,256
	        invoke PathRemoveExtension,l_Alloc
	        invoke PathStripPath,l_Alloc
	        invoke MessageBox,hWin,szText,l_Alloc,MB_OK
	        invoke GlobalFree,l_Alloc
        .endif
	
	ret
ShowMessage endp

;信息(标准信息框，可指定消息框样式)
MessageDlg proc hWin:DWORD,szText:DWORD,uType:DWORD
	LOCAL l_Alloc:DWORD
	LOCAL l_Ret:DWORD
        invoke GlobalAlloc,GPTR,256
        mov l_Alloc,eax
        mov l_Ret,-1
        .if eax!=0
        	invoke GetModuleHandle,NULL
	        invoke GetModuleFileName,eax,l_Alloc,256
	        invoke PathRemoveExtension,l_Alloc
	        invoke PathStripPath,l_Alloc
	        invoke MessageBox,hWin,szText,l_Alloc,uType
	        mov l_Ret,eax
	        invoke GlobalFree,l_Alloc
        .endif
        mov eax,l_Ret
	ret

MessageDlg endp


;申请内存
;初始化内存内容到零。
ZeroMemoryAlloc proc Allocbytes:DWORD
        invoke GlobalAlloc,GPTR,Allocbytes
        mov lpZeroMemory,eax
	ret
ZeroMemoryAlloc endp


;释放内存
ZeroMemoryFree proc
	invoke GlobalFree,lpZeroMemory
	ret

ZeroMemoryFree endp

;申请内存Second(二)
ZeroMemorySecondAlloc proc Allocbytes:DWORD
        invoke GlobalAlloc,GPTR,Allocbytes
        mov lpZeroMemorySecond,eax
	ret
ZeroMemorySecondAlloc endp


;释放内存Second
ZeroMemorySecondFree proc
	invoke GlobalFree,lpZeroMemorySecond
	ret

ZeroMemorySecondFree endp

;加载到全局内存指定的资源。(RCDATA),返回地址
;ResID 资源ID
LoadRCDataResource proc ResID:DWORD
        LOCAL  l_Module:DWORD
        LOCAL  l_Res:DWORD
        invoke GetModuleHandle,NULL
        mov l_Module,eax
        invoke FindResource,l_Module,ResID,RT_RCDATA
        mov l_Res,eax
        invoke LoadResource,l_Module,eax
        invoke LockResource,eax
        mov hRCDataMemory,eax
        invoke SizeofResource,l_Module,l_Res
        mov hRCDataSize,eax
        mov eax,hRCDataMemory
        ret
LoadRCDataResource endp






