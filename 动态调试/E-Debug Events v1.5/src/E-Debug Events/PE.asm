GetImageBase proto Buffer:DWORD

.code
;检测PE的有效性
ValidPE proc Buffer:DWORD
        LOCAL l_PE:DWORD
	mov edi,Buffer
	invoke IsBadCodePtr,edi
	.if eax!=0
		jmp Error
	.endif
	assume edi:ptr IMAGE_DOS_HEADER
        .if [edi].e_magic==IMAGE_DOS_SIGNATURE 
                        add edi,[edi].e_lfanew
                        invoke IsBadCodePtr,edi
                        .if eax!=0
                        	jmp Error
                        .endif
                        assume edi:ptr  IMAGE_NT_HEADERS 
                        .if [edi].Signature==IMAGE_NT_SIGNATURE
                                 mov l_PE,TRUE
                        .else    
                                 mov l_PE,FALSE        
                        .endif
        .else
        Error:
                 mov l_PE,FALSE
        .endif
        mov eax,l_PE
	ret

ValidPE endp

;根据提供RVA 取节偏移
GetRVASectionOffset proc uses edi esi edx ecx Buffer:DWORD,RVA:DWORD 
	   mov edi,Buffer
           mov esi,RVA
           assume edi:ptr IMAGE_DOS_HEADER
           add edi,[edi].e_lfanew
           add edi,IMAGE_NT_HEADERS.FileHeader
           assume edi:ptr IMAGE_FILE_HEADER
           movzx eax,[edi].NumberOfSections
           sub edi,IMAGE_NT_HEADERS.FileHeader
           add edi,size IMAGE_NT_HEADERS
           mov ecx,eax
Tsection:
           mov edx,edi
           mov eax,[edx+IMAGE_SECTION_HEADER.VirtualAddress]
           mov ebx,[edx+IMAGE_SECTION_HEADER.Misc.VirtualSize]
           add ebx,eax
           .if  esi>=eax
             .if esi<ebx
             	  jmp _Break
             .endif
        .endif
        add edi,size IMAGE_SECTION_HEADER
        loop Tsection
_Break:
         mov eax,[edx+IMAGE_SECTION_HEADER.PointerToRawData]
        mov ebx,[edx+IMAGE_SECTION_HEADER.VirtualAddress]
        sub ebx,eax
        mov eax,ebx
	ret

GetRVASectionOffset endp

;根据提供offset 取节偏移
GetSectionOffset proc uses edi esi edx ecx Buffer:DWORD,uOffset:DWORD
        mov edi,Buffer
        mov esi,uOffset
        assume edi:ptr IMAGE_DOS_HEADER
        add edi,[edi].e_lfanew
        add edi,IMAGE_NT_HEADERS.FileHeader
        assume edi:ptr IMAGE_FILE_HEADER
        movzx eax,[edi].NumberOfSections
        sub edi,IMAGE_NT_HEADERS.FileHeader
        add edi,size IMAGE_NT_HEADERS
        mov ecx,eax
        Tsection:
        mov edx,edi
        mov eax,[edx+IMAGE_SECTION_HEADER.PointerToRawData]
        mov ebx,[edx+IMAGE_SECTION_HEADER.SizeOfRawData]
        add ebx,eax
        .if  esi>=eax
             .if esi<ebx
             	  jmp _Break
             .endif
        .endif
        add edi,size IMAGE_SECTION_HEADER
        loop Tsection
_Break:
        mov eax,[edx+IMAGE_SECTION_HEADER.PointerToRawData]
        mov ebx,[edx+IMAGE_SECTION_HEADER.VirtualAddress]
        sub ebx,eax
        mov eax,ebx
        ret
GetSectionOffset endp

;将 RVA 转换成实际的数据位置
RVAToOffset PROC uses ebx edi esi edx ecx Buffer:DWORD,RVA:DWORD 
         invoke GetRVASectionOffset,Buffer,RVA
         mov ecx,eax
         mov eax,RVA
         sub eax,ecx
         ret
RVAToOffset endp 

;将文件偏移转换成RVA
OffsetToRVA PROC uses ebx edi esi edx ecx Buffer:DWORD,uOffset:DWORD 
	invoke GetSectionOffset,Buffer,uOffset
	mov ecx,eax
        mov eax,uOffset
        add eax,ecx
	ret

OffsetToRVA endp

;将文件偏移转换成VA

OffsetToVA proc uses ebx edi esi edx ecx Buffer:DWORD,uOffset:DWORD 
	invoke OffsetToRVA,Buffer,uOffset
	mov ebx,eax
	invoke GetImageBase,Buffer
	add eax,ebx
	ret

OffsetToVA endp

;将 RVA 转换成内存地址
RVAToVA proc uses ebx edi esi edx ecx  Buffer:DWORD,RVA:DWORD
	invoke GetImageBase,Buffer
	mov ebx,RVA
	add eax,ebx
	ret

RVAToVA endp

;将 VA 转换成RVA
VAToRVA proc uses edi esi edx ecx  Buffer:DWORD,VA:DWORD
        mov ebx,VA
        invoke GetImageBase,Buffer
        sub ebx,eax
        mov eax,ebx
        ret
VAToRVA endp

;将 VA 转换成 Offset
VAToOffset proc uses ebx edi esi edx ecx  Buffer:DWORD,VA:DWORD
	invoke VAToRVA,Buffer,VA
	invoke RVAToOffset,Buffer,eax
	ret

VAToOffset endp

;获取装载基地址
GetImageBase proc uses ebx edi esi edx ecx Buffer:DWORD
        mov edi,Buffer
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	add edi,size IMAGE_NT_HEADERS.Signature
	add edi,size IMAGE_NT_HEADERS.FileHeader
	assume edi:ptr IMAGE_OPTIONAL_HEADER32
	mov eax,[edi].ImageBase
	
        ret
GetImageBase endp

;获取导入表实际的数据位置 文件没有导入表 则返回0 否则返回正确的数据地址
GetImportOffset proc Buffer:DWORD
	mov edi,Buffer
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	assume edi:ptr IMAGE_NT_HEADERS 
	mov edi,[edi].OptionalHeader.DataDirectory[sizeof IMAGE_DATA_DIRECTORY].VirtualAddress
	.if edi!=0
		invoke RVAToOffset,Buffer,edi
	.else
		 mov eax,edi
	.endif
	
	ret

GetImportOffset endp


;获取导入表RVA 位置
GetImportRVA proc uses edi esi edx ecx Buffer:DWORD
	mov edi,Buffer
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	assume edi:ptr IMAGE_NT_HEADERS 
	mov edi,[edi].OptionalHeader.DataDirectory[sizeof IMAGE_DATA_DIRECTORY].VirtualAddress
        mov eax,edi

	
	ret

GetImportRVA endp

;获取导入表大小
GetImportSize proc Buffer:DWORD
	mov edi,Buffer
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	assume edi:ptr IMAGE_NT_HEADERS 
	mov edi,[edi].OptionalHeader.DataDirectory[sizeof IMAGE_DATA_DIRECTORY].isize
        mov eax,edi

	ret

GetImportSize endp

;获取导出表RVA 位置
GetEmportRVA  proc uses edi esi edx ecx Buffer:DWORD
        mov edi,Buffer
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	assume edi:ptr IMAGE_NT_HEADERS 
	mov edi,[edi].OptionalHeader.DataDirectory.VirtualAddress
        mov eax,edi
        ret
GetEmportRVA endp

;获取导出表offset 位置
GetEmportOffset proc uses edi esi edx ecx Buffer:DWORD
        mov edi,Buffer
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	assume edi:ptr IMAGE_NT_HEADERS 
	mov edi,[edi].OptionalHeader.DataDirectory.VirtualAddress
        .if edi!=0
		invoke RVAToOffset,Buffer,edi
	.else
		 mov eax,edi
	.endif
        ret
GetEmportOffset endp


;获取导入表大小
GetEmportSize proc Buffer:DWORD
	mov edi,Buffer
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	assume edi:ptr IMAGE_NT_HEADERS 
	mov edi,[edi].OptionalHeader.DataDirectory.isize
        mov eax,edi
	
	ret

GetEmportSize endp

;根据RVA 取它所在的区段 返回 区段名
GetRVASection proc uses edi esi edx ecx Buffer:DWORD,RVA:DWORD 
	   mov edi,Buffer
           mov esi,RVA
           assume edi:ptr IMAGE_DOS_HEADER
           add edi,[edi].e_lfanew
           add edi,IMAGE_NT_HEADERS.FileHeader
           assume edi:ptr IMAGE_FILE_HEADER
           movzx eax,[edi].NumberOfSections
           sub edi,IMAGE_NT_HEADERS.FileHeader
           add edi,size IMAGE_NT_HEADERS
           mov ecx,eax
Tsection:
           mov edx,edi
           mov eax,[edx+IMAGE_SECTION_HEADER.VirtualAddress]
           mov ebx,[edx+IMAGE_SECTION_HEADER.Misc.VirtualSize]
           add ebx,eax
           .if  esi>=eax
             .if esi<ebx
             	  jmp _Break
             .endif
        .endif
        add edi,size IMAGE_SECTION_HEADER
        loop Tsection
_Break:
        mov eax,edx
        add eax,IMAGE_SECTION_HEADER.Name1
        ret
GetRVASection endp

;根据Offset 取它所在的区段大小
GetOffsetSectionSize proc uses edi esi edx ecx Buffer:DWORD,uOffset:DWORD 
	mov edi,Buffer
	mov esi,uOffset
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	add edi,IMAGE_NT_HEADERS.FileHeader
	assume edi:ptr IMAGE_FILE_HEADER
	movzx eax,[edi].NumberOfSections
	sub edi,IMAGE_NT_HEADERS.FileHeader
	add edi,size IMAGE_NT_HEADERS
	mov ecx,eax
Tsection:
           mov edx,edi
           mov eax,[edx+IMAGE_SECTION_HEADER.PointerToRawData]
           mov ebx,[edx+IMAGE_SECTION_HEADER.SizeOfRawData]
           add ebx,eax
           .if  esi>=eax
             .if esi<ebx
             	  jmp _Break
             .endif
        .endif
        add edi,size IMAGE_SECTION_HEADER
        loop Tsection
_Break:
        mov eax,edx
        add eax,IMAGE_SECTION_HEADER.SizeOfRawData
        mov eax,dword ptr ds:[eax]
        ret
GetOffsetSectionSize endp

;根据Offset 取它所在的区段的上一个区段的起始位置(Offset)
GetPriorOffset proc uses edi esi edx ecx Buffer:DWORD,uOffset:DWORD 
        mov edi,Buffer
	mov esi,uOffset
	assume edi:ptr IMAGE_DOS_HEADER
	add edi,[edi].e_lfanew
	add edi,IMAGE_NT_HEADERS.FileHeader
	assume edi:ptr IMAGE_FILE_HEADER
	movzx eax,[edi].NumberOfSections
	sub edi,IMAGE_NT_HEADERS.FileHeader
	add edi,size IMAGE_NT_HEADERS
	mov ecx,eax
Tsection:
           mov edx,edi
           mov eax,[edx+IMAGE_SECTION_HEADER.PointerToRawData]
           mov ebx,[edx+IMAGE_SECTION_HEADER.SizeOfRawData]
           add ebx,eax
           .if  esi>=eax
             .if esi<ebx
             	  jmp _Break
             .endif
        .endif
        add edi,size IMAGE_SECTION_HEADER
        loop Tsection
_Break:
        mov eax,edx
        sub eax,size IMAGE_SECTION_HEADER
        add eax,IMAGE_SECTION_HEADER.PointerToRawData
        mov eax,dword ptr ds:[eax]
        ret
GetPriorOffset endp