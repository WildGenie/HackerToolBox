include comdlg32.inc
includelib comdlg32.lib

.data
szExeFile db 'Executable Files (*.exe)',0,'*.exe',0,0
szExeFileAll db 'Executable Files (*.exe)',0,'*.exe',0
             db 'All Files(*.*)',0,'*.*',0,0  
.data?
strFile db 256 dup(?)  ;保存文件名   
.code
;----------------------------------------------------------------
;lpstrFilter
;该字段决定了对话框中“文件类型”下拉式列表框中的内容，字符串可以由多组内容组成，每组包括一个说明字符串和一个筛选字符串，字符串的最后用两个0结束。如下面的字符串将在列表框中显示两项内容，选择不同项目的时候分别列出“*.txt”文件或者所有文件“*.*”：

;Text Files(*.txt)',0,'*.txt',0,'All Files(*.*)',0,'*.*',0,0

;筛选字符串中也可以同时指定多个扩展名，中间用分号隔开，如'*.txt;*.doc'。

;示例:
;All Files(*.*)',0,'*.*',0,0     
;Text Files(*.txt)',0,'*.txt',0,,0
;"Executable Files (*.exe, *.dll)",0,"*.exe;*.dll",0,0
;"Executable Files (*.exe)",0,"*.exe",0,0
;----------------------------------------------------------------

;选择文件返回TRUE，未选择返回假
;打开文件对话框    lpstrFile 包含文件名的缓冲区 大小为 256 lpstrFilter 指定文件名筛选字符串 可为空
OpenFileName proc uses ecx edx lpstrFile:DWORD,lpstrFilter:DWORD
	LOCAL ofn:OPENFILENAME
	invoke RtlZeroMemory,lpstrFile,256
	invoke RtlZeroMemory,addr ofn,sizeof  OPENFILENAME
	mov ofn.lStructSize,sizeof OPENFILENAME
	mov eax,lpstrFile
	mov ofn.lpstrFile,eax
	mov ofn.nMaxFile,256
	mov eax,lpstrFilter
	.if eax!=0
		mov ofn.lpstrFilter,eax
	.endif
	mov ofn.Flags,OFN_FILEMUSTEXIST or OFN_HIDEREADONLY
	invoke GetOpenFileName,addr ofn
	ret

OpenFileName endp