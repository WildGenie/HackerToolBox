
include shlwapi.inc
includelib shlwapi.lib

.data
szHex db '%X',0
sz8Hex db '%08X',0
.code

;StrToInt 10进制字符串转换数值
StrToInt proc String:DWORD
         LOCAL  hGlobal:DWORD
         LOCAL  Temp:DWORD
         mov Temp,0
         invoke GlobalAlloc,GPTR,50
         .if eax!=0
         	mov hGlobal,eax
         	invoke StrToInt64Ex,String,0,eax;STIF_DEFAULT=0
         	.if eax!=0
         	       mov eax,hGlobal
         	       mov eax,dword ptr ss:[eax]
         	       mov Temp,eax
         	.else
         	       mov Temp,0
         	.endif
         	invoke GlobalFree,hGlobal
         .endif
         mov eax,Temp
         ret
StrToInt endp

;16进制字符串转换数值
StrToHex proc String:DWORD
         LOCAL  hGlobal:DWORD
         LOCAL  Temp:DWORD
         LOCAL  l_Temp[MAX_PATH]:byte
         mov Temp,0
         invoke GlobalAlloc,GPTR,50
         .if eax!=0
         	mov hGlobal,eax
         	invoke RtlZeroMemory,addr l_Temp,MAX_PATH
         	mov eax,7830H
         	mov word ptr ds:[l_Temp],ax
         	invoke lstrcat,addr l_Temp,String
         	invoke StrToInt64Ex,addr l_Temp,1,hGlobal;STIF_SUPPORT_HEX=1
         	.if eax!=0
         	       mov eax,hGlobal
         	       mov eax,dword ptr ss:[eax]
         	       mov Temp,eax
         	.else
         	       mov Temp,0
         	.endif
         	invoke GlobalFree,hGlobal
         .endif
         mov eax,Temp
         ret
         
StrToHex endp

;HexToStr 数值转换16进制字符串（大写）
HexToStr proc lpBuffer:DWORD,Hex:DWORD
	invoke wsprintf,lpBuffer,addr szHex,Hex
	ret

HexToStr endp

;HexToStr 数值转换16进制字符串（大写 长度为8）
HexTo8Str proc lpBuffer:DWORD,Hex:DWORD
	invoke wsprintf,lpBuffer,addr sz8Hex,Hex
	ret

HexTo8Str endp