include shlwapi.inc
includelib shlwapi.lib

;P 表示Path
;FileName 表示文件名 比如: SectionDIY.exe
;----------------
;PathStripPath
;功能:移除pszPath指定的路径的目录文件
;示例:
;TCHAR szPath[] = _T("D:\\玄幻小说\\蛮荒记.pdf");
;::PathStripPath( szPath );
;//szPath值为:蛮荒记.pdf)

;PathRemoveFileSpec
;原型:BOOL PathRemoveFileSpec(  LPTSTR pszPath );
;功能:移除pszPath指定的路径末尾的文件名和反斜杠部分(如果存在)
;示例:
;TCHAR szPath[] = _T("D:\\玄幻小说\\蛮荒记.pdf");
;PathRemoveFileSpec( szPath )
;//szPath值为: D:\玄幻小说


.const
ReplacePszPath equ 1

.code

;功能: 重命名文件名
;pszPath 原路径
;lpPath  提供缓冲区，保存新的路径 (ReplacePszPath 不使用此参数，直接替换pszPath)
;FileName 文件名
;示例: pszPath : C:\Text.exe lpPath: ReplacePszPath  FileName: Rt.exe
; 执行后:   pszPath: C:\Rt.exe
PRenameFileName proc pszPath:DWORD,lpPath:DWORD,FileName:DWORD
	
        .if lpPath==ReplacePszPath
                invoke PathRemoveFileSpec,pszPath
	        invoke PathAddBackslash,pszPath
	        invoke lstrcat,pszPath,FileName
	.else
		invoke lstrcpy,lpPath,pszPath
		invoke PathRemoveFileSpec,lpPath
	        invoke PathAddBackslash,lpPath
	        invoke lstrcat,lpPath,FileName
        .endif
	ret

PRenameFileName endp

;功能: 在文件名中插入字符串
;String 插入的字符串
;示例: pszPath : C:\Text.exe lpPath: ReplacePszPath  FileName: _
; 执行后:   pszPath: C:\Text_.exe
PRenameInsertFileName  proc uses ecx ebx pszPath:DWORD,lpPath:DWORD,String:DWORD
         LOCAL l_File[256]:byte
        invoke RtlZeroMemory,addr l_File,256
        invoke PathFindExtension,pszPath
        mov ebx,eax
        mov ecx,pszPath
        sub eax,ecx
        inc eax
        invoke lstrcpyn,addr l_File,pszPath,eax
        invoke lstrcat,addr l_File,String
        invoke lstrcat,addr l_File,ebx
        .if lpPath==ReplacePszPath
               invoke lstrcpy,pszPath,addr l_File
	.else
		invoke lstrcpy,lpPath,addr l_File
        .endif
	ret

PRenameInsertFileName endp


;GetDirectoryLen取文件名的目录长度返回如文件“c:\cektop\file.ext”时，这里将返回9(c:\cektop)。
GetDirectoryLen proc String:DWORD
	mov eax,String
	invoke lstrlen,eax
	mov ecx,eax
	mov eax,String
	add eax,ecx
	mov edi,eax
	dec edi
	xor eax,eax
	.while  ecx!=0
		mov al,byte ptr ss:[edi]
		.if eax==5CH
			mov eax,ecx
			dec eax
			.break
		.endif
		dec ecx
		dec edi
		xor eax,eax
	.endw
	ret

GetDirectoryLen endp

;GetDirectory 取文件名的目录 szFile:文件名 lpBuffer:保存目录的缓冲区 例如:szFile c:\cektop\file.ext lpBuffer=c:\cektop
GetDirectory proc  szFile:DWORD,lpBuffer:DWORD
        push edi
	mov eax,szFile
	;invoke RtlZeroMemory,eax,nMaxCount
	invoke GetDirectoryLen,eax
	.if eax!=0
		inc eax
	.endif
	invoke lstrcpyn,lpBuffer,szFile,eax
	pop edi
	ret

GetDirectory endp

;GetFilName 返回FileName的内存地址 String:文件名  例如: String c:\cektop\file.ext  则返回file.ext的内存地址
GetFilName proc String:DWORD
        push edi
        mov eax,String
	invoke lstrlen,eax
	mov ecx,eax
	mov eax,String
	add eax,ecx
	mov edi,eax
	dec edi
	xor eax,eax
	.while  ecx!=0
		mov al,byte ptr ss:[edi]
		.if eax==5CH
			mov eax,edi
			inc eax
			.break
		.endif
		dec ecx
		dec edi
		xor eax,eax
	.endw
	pop edi
        ret
         
GetFilName endp



;GetDefExt 返回DefExt的内存地址 String:文件名  例如: String c:\cektop\file.ext  则返回ext的内存地址
GetDefExt proc String:DWORD
        push edi
        mov eax,String
	invoke lstrlen,eax
	mov ecx,eax
	mov eax,String
	add eax,ecx
	mov edi,eax
	dec edi
	xor eax,eax
	.while  ecx!=0
		mov al,byte ptr ss:[edi]
		.if eax==2eH
			mov eax,edi
			inc eax
			.break
		.endif
		dec ecx
		dec edi
		xor eax,eax
	.endw
	pop edi
        ret
GetDefExt endp

;GetFilNameUDefExt 取文件名不含后缀 szFile:文件名 lpBuffer:保存目录的缓冲区 例如:szFile c:\cektop\file.ext lpBuffer=cektop
GetFilNameUDefExt proc szFile:DWORD,lpBuffer:DWORD
        LOCAL  Temp:DWORD
        invoke GetFilName,szFile
        mov Temp,eax
        invoke GetDefExt,szFile
        mov ecx,Temp
        sub eax,ecx
        .if eax>=0
        	invoke lstrcpyn,lpBuffer,Temp,eax
        .endif
        ret
GetFilNameUDefExt endp


;CatFilNameUDefExt 追加FilNameUDefExt szFile:文件名 AppStr:追加的文本 例如: szFile c:\cektop\file.ext  AppStr: _cn 则szFile为 c:\cektop\file_cn.ext
CatFilNameUDefExt proc szFile:DWORD,AppStr:DWORD
        LOCAL hMem:DWORD
        LOCAL hMemUDefExt:DWORD
        LOCAL  Temp:DWORD
        invoke GlobalAlloc,GPTR,256
        mov hMem,eax
        .if eax!=0
        	invoke GetDirectory,szFile,eax
        	.if eax!=0
        	       mov Temp,eax
        	       invoke lstrlen,eax
        	       mov ebx,Temp
        	       add eax,ebx     	       
        	       mov byte ptr ss:[eax],5cH
        	       invoke GlobalAlloc,GPTR,256
        	       .if eax!=0
        	       	      mov hMemUDefExt,eax
        	       	      invoke GetFilNameUDefExt,szFile,eax
        	       	      mov eax,hMemUDefExt
        	       	      invoke lstrcat,eax,AppStr
        	       	      invoke GetDefExt,szFile
        	       	      dec eax
        	       	      mov ebx,hMemUDefExt
        	       	      invoke lstrcat,ebx,eax
        	       	      mov eax,hMem
        	       	      mov ebx,hMemUDefExt
        	       	      invoke lstrcat,eax,ebx
        	       	      mov eax,hMem
        	       	      invoke lstrcpy,szFile,eax
        	       .endif
        	       
        	.endif
        	invoke GlobalFree,hMem
        	invoke GlobalFree,hMemUDefExt
        .endif
        mov eax,szFile
        ret
CatFilNameUDefExt endp
