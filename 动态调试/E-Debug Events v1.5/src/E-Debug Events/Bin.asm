.code

;寻找字节集(返回一字节集在另一字节集中最先出现的位置，位置值从 1 开始。如果未找到，返回 -1。)
;byBin 被搜寻的字节集
;uSize 大小
;Bin   欲搜寻的字节集
;ubSize 大小
;Start 起始搜寻位置
FindBin proc uses edx ebx ecx edi esi byBin:DWORD,uSize:DWORD,Bin:DWORD,ubSize:DWORD,Start:DWORD
       LOCAL l_Len:DWORD
	mov eax,ubSize
	mov l_Len,eax
	xor esi,esi
	mov edi,byBin
	mov ecx,Start
	.if Start!=1
	     add edi,ecx
	.endif
	mov ecx,uSize
	xor eax,eax
	mov ebx,Bin
	mov al,byte ptr ds:[ebx]
	repne scasb
	.while ZERO?
	       push eax
	       mov eax,uSize
	       .if ecx>=eax
		   .break
	       .endif
	       pop eax
	       mov ecx,l_Len
	       sub ecx,1
	       xor edx,edx
	       xor esi,esi
	       inc esi
	       inc ebx
	       .while ecx>0
	              mov al,byte ptr ds:[ebx]
	              mov dl,byte ptr ds:[edi+esi-1]
	              .if al==dl
	              	  inc esi
	              .else
	              	   .break
	              .endif
	              inc ebx
	       	      dec ecx
	       .endw
	       mov ecx,l_Len
	       .if ecx==esi
	             .break
	       .endif
	       mov ebx,Bin
	       mov al,byte ptr ds:[ebx]
	       mov ecx,byBin
	       mov edx,edi
	       sub edx,ecx
	       mov ecx,uSize
	       sub ecx,edx
	       .if ecx==0
	       	   .break
	       .endif
	       repne scasb
	.endw
	mov ecx,l_Len
	.if esi==ecx
	       mov eax,edi
	       mov ecx,byBin
	       sub eax,ecx
	       sub eax,1
	.else
		mov eax,-1
	.endif
	
	
	ret

FindBin endp

;字节集替换(进行所有可能的替换。主要用于花指令清除技术)
;byBin 被搜寻的字节集
;uSize 大小
;Bin   ;欲被替换的字节集
;RepBin :用作替换的字节集
;ubSize 大小
;返回  返回替换的次数，失败返回-1
RpBin proc uses edx ebx ecx edi esi byBin:DWORD,uSize:DWORD,Bin:DWORD,RepBin:DWORD,ubSize:DWORD
        LOCAL l_S:DWORD
	mov ecx,0
	mov l_S,1
	invoke FindBin,byBin,uSize,Bin,ubSize,l_S
	.while eax!=-1
		inc ecx
		mov l_S,eax
		push ecx
		mov ecx,byBin
		add eax,ecx
		mov edi,eax
		mov ecx,ubSize
		mov esi,RepBin
		rep movsb
		pop ecx
		mov eax,l_S
		inc eax
		mov l_S,eax
		invoke FindBin,byBin,uSize,Bin,ubSize,l_S
	.endw
	.if ecx!=0
	       mov eax,ecx
	.endif
	ret
	
RpBin endp