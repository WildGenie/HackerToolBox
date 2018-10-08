include shell32.inc
includelib shell32.lib
.const
WM_SHELLNOTIFY equ WM_USER+125
MAIN_ICO       equ 1

.data?
note NOTIFYICONDATA <?> 
.code

;设置窗口ICO图标
SetMainICO proc hWin:HWND,IcoID:DWORD
	invoke GetModuleHandle,NULL
	invoke LoadIcon,eax,IcoID
	invoke SendMessage,hWin,WM_SETICON,ICON_BIG,eax
	ret

SetMainICO endp



;设置窗口保持其最顶端的位置，即使它被停用。(Stay on Top)
;uTop 是否总在最前 1：True 0:False
TopMostWindow proc hWin:DWORD,uTop:DWORD
	
	mov eax,uTop
	.if eax==1
		invoke SetWindowPos,hWin, HWND_TOPMOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE
	.else
		invoke SetWindowPos,hWin, HWND_NOTOPMOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE
	.endif
	ret

TopMostWindow endp


;拖动操作(WM_DROPFILES)
;DragAcceptFiles 是否接收拖动
;DragFinish 释放拖放文件时使用的资源
;DragQueryFile 查询拖动的文件名

;注册拖动对象
DragAcceptFile proc hWin:HWND
          invoke DragAcceptFiles,hWin,TRUE
          ret
DragAcceptFile endp

;取函数返回拖动文件的数量
DragFileNumber proc wParam:WPARAM
	invoke DragQueryFile,wParam,-1,NULL,NULL
	ret

DragFileNumber endp

;查询第一个文件
DragQueryFirstFile proc wParam:WPARAM,ulpFile:DWORD,uSize:DWORD
	invoke RtlZeroMemory,ulpFile,uSize
	invoke DragQueryFile,wParam,0,ulpFile,uSize
	ret

DragQueryFirstFile endp

;置托盘图标(WM_SHELLNOTIFY )
;WM_SHELLNOTIFY 被定义为WM_USER+5，只要是唯一的值，就无所谓是多少了，只要大于WM_USER。
;提示文本
SetTrayIcon proc hWnd:DWORD,TooltipText:DWORD,IcoID:DWORD
        mov note.cbSize,sizeof NOTIFYICONDATA 
        push hWnd
        pop note.hwnd 
        mov note.uID,0
        mov note.uFlags,NIF_ICON+NIF_MESSAGE+NIF_TIP 
        mov note.uCallbackMessage,WM_SHELLNOTIFY
        invoke GetModuleHandle,NULL
	invoke LoadIcon,eax,IcoID
        mov note.hIcon,eax
        invoke lstrcpy,addr note.szTip,TooltipText
        invoke Shell_NotifyIcon,NIM_ADD,addr note
        ret
SetTrayIcon endp

;删除图标。释放SetTrayIcon 设置的图标
DeleteTrayIcon proc
        invoke Shell_NotifyIcon,NIM_DELETE,addr note
        ret
DeleteTrayIcon endp


;Enable 允许／禁止指定的窗口(EnableWindow HWND hWnd, BOOL bEnable)
;hDlg 
;nIDDlgItem 控件标识符
;bEnable  TRUE 允许 FALSE 禁止
Enable proc hDlg:DWORD,nIDDlgItem:DWORD,bEnable:DWORD
        invoke GetDlgItem,hDlg,nIDDlgItem
        invoke EnableWindow,eax,bEnable
        ret
Enable endp

