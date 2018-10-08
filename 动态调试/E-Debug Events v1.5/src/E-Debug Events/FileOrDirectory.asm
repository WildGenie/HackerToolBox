;Slash  斜杠
include shlwapi.inc
includelib shlwapi.lib
include shell32.inc
includelib Shell32.lib

;GetSystemDirectory 取系统目录 C:\windows\system32

.data
szIEPath  db 'program files\Internet Explorer\IEXPLORE.EXE',0

.code
;GetWindowsToDisk 取系统盘所在的硬盘 比如:C 盘  Slash:是否保留斜杠
GetWindowsToDisk proc lpBuffer:DWORD,uSize:DWORD,Slash:DWORD
	invoke GetWindowsDirectory,lpBuffer,uSize
	mov eax,Slash
	.if eax!=0
		invoke lstrcpyn,lpBuffer,lpBuffer,4
	.else
		 invoke lstrcpyn,lpBuffer,lpBuffer,3
	.endif
	ret

GetWindowsToDisk endp

;GetIEName; 取IE文件路径 例如:
GetIEName proc proc lpBuffer:DWORD,uSize:DWORD
	invoke GetWindowsToDisk,lpBuffer,uSize,TRUE
	invoke lstrcat,lpBuffer,addr szIEPath
	ret

GetIEName endp

;取运行目录
GetRunPath proc lpBuffer:DWORD,uSize:DWORD
	invoke GetModuleHandle,NULL
	invoke GetModuleFileName,eax,lpBuffer,uSize
        invoke PathRemoveFileSpec,lpBuffer
	ret

GetRunPath endp

;取桌面目录
GetDesktopPath proc lpBuffer:DWORD
        invoke SHGetSpecialFolderPath,NULL,lpBuffer,CSIDL_DESKTOP,FALSE
	ret

GetDesktopPath endp




