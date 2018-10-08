FreeReadFile proto Memory:DWORD

.data
hMappMemory dd ?
hMappSize   dd ? ;保存ReadFileMapping读入文件大小
.code

;读入文件
;调用GlobalFree来释放Memory数据。
;内存映射文件读入文件 返回文件大小  File:文件名 Memory: 保存数据内存地址
;示例:invoke ReadFileMapping,addr lpFile,addr hMemory
;返回文件大小 返回-1为失败
ReadFileMapping proc File:DWORD,Memory:DWORD
                LOCAL l_hFile:DWORD
                LOCAL l_hMapFile:DWORD
                LOCAL l_hSize:DWORD
                LOCAL l_hAlloc:DWORD
                LOCAL l_Memory:DWORD
                mov ebx,Memory
                mov eax,dword ptr ds:[ebx]
                invoke FreeReadFile,eax
                invoke CreateFile,File,GENERIC_READ,FILE_SHARE_READ or FILE_SHARE_WRITE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL
                mov l_hFile,eax
                .if eax!=INVALID_HANDLE_VALUE
                        invoke GetFileSize,l_hFile,0
                        mov l_hSize,eax
                        invoke CreateFileMapping,l_hFile,NULL,PAGE_READONLY,0,0,NULL
                        mov l_hMapFile,eax
                        invoke MapViewOfFile,l_hMapFile,FILE_MAP_READ,0,0,0
                        mov l_Memory,eax
                        invoke CloseHandle,l_hMapFile
                        invoke CloseHandle,l_hFile
                .endif
                .if eax!=-1
                	  mov eax,l_hSize
                	  invoke GlobalAlloc,GPTR,eax
                	  mov l_hAlloc,eax
                	  mov ebx,Memory
                          mov dword ptr ds:[ebx],eax
                	  invoke RtlMoveMemory,l_hAlloc,l_Memory,l_hSize
                	  invoke UnmapViewOfFile,l_Memory
                	  mov eax,l_hSize
                	  mov hMappSize,eax
                .endif
                ret
ReadFileMapping endp

;释放ReadFileMapping 读取的文件
FreeReadFile proc Memory:DWORD
	.if Memory!=0
                       invoke GlobalFree,Memory
         .endif	
	ret

FreeReadFile endp


;写到文件
;本命令用作将一个或数个字节集顺序写到指定文件中，文件原有内容被覆盖。
CWriteFile proc File:DWORD,Buffer:DWORD,nNumberOfBytesToWrite:DWORD
        LOCAL  l_hFile:DWORD
        LOCAL  L_dwritten:DWORD
	invoke CreateFile,File,GENERIC_WRITE,FILE_SHARE_READ,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL
	.if eax!=INVALID_HANDLE_VALUE
		mov l_hFile,eax
		invoke WriteFile,l_hFile,Buffer,nNumberOfBytesToWrite,addr L_dwritten,NULL
		invoke CloseHandle,l_hFile
	.endif
	
	ret

CWriteFile endp

