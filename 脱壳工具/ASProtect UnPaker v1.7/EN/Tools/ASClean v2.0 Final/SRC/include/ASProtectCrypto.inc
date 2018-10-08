;-- INIT KEY of TypeLib value
AC_ConvertKey proc uses esi edi, lpBuf:LPSTR, lpHash: LPSTR
  mov esi,lpBuf
  inc esi
  mov edi,lpHash
  xor ecx,ecx
  mov cl,4
  call AC_StrToHexRev
  add esi,9
  add edi,4
  mov cl,2
  call AC_StrToHexRev
  add esi,5
  add edi,2
  mov cl,2
  call AC_StrToHexRev
  add esi,5
  add edi,2
  mov cl,2
  call AC_StrToHexRev
  add esi,5
  add edi,2
  mov cl,6
  call AC_StrToHexRev
  ret
AC_ConvertKey endp

; esi - pointer to szInBuffer
; edi - pointer to OutBuffer
; ecx - size of OutBuffer
AC_StrToHexRev proc uses esi
@@:
  lodsb
  call GetByte
  mov dl,al
  shl dl,4
  lodsb
  call GetByte
  or al,dl
  mov B [edi+ecx-1],al
  loop @B
  ret
AC_StrToHexRev endp

GetByte proc
  sub al,30h
  cmp al,09h
  jbe @F
  sub al,07h
@@:  
  ret
GetByte endp

; dwBufSize - Size of Buffer (2Ch)
; eax		- pointer to InitKey
; ecx		- pointer to Buffer
; edx		- Size of Hash (10h)
AC_GenerateHash proc dwBufSize: DWORD 
  buf_200 = D -200h
  arg_0   = D 8
  add     esp, 0FFFFFE00h
  push    ebx
  push    esi
  mov     esi, edx
  mov     ebx, eax
  lea     eax, [ebp+buf_200]
  mov     edx, ecx
  mov     ecx, [ebp+arg_0]
  call    AC_InitBuffer
  push    esi
  lea     eax, [ebp+buf_200]
  mov     ecx, ebx
  mov     edx, ebx
  call    AC_MakeHash
  lea     eax, [ebp+buf_200]
  call    FillBuffer
  pop     esi
  pop     ebx
  ret
AC_GenerateHash  endp

FillBuffer proc
 mov     cl, 0FFh
 mov     edx, 200h
 call    __FillChar ; Borland Visual Component Library & Packages
 ret
FillBuffer endp

__FillChar proc
 and     ecx, 0FFh
 call    System_FillChar
 retn
__FillChar endp

System_FillChar proc
 push    edi
 mov     edi, eax
 mov     ch, cl
 mov     eax, ecx
 shl     eax, 10h
 mov     ax, cx
 mov     ecx, edx
 sar     ecx, 2
 js      short loc_4028C1
 rep stosd
 mov     ecx, edx
 and     ecx, 3
 rep stosb
loc_4028C1:                             ; CODE XREF: System::__linkproc__ FillChar(void)+12j
 pop     edi
 ret
System_FillChar endp


AC_InitBuffer proc
 var_104 = D -104h
 var_100 = D -100h
 push    ebx
 push    esi
 push    edi
 push    ebp
 add     esp, 0FFFFFEFCh
 mov     ebp, edx
 mov     [esp+104h+var_104], eax
 xor     ebx, ebx
 mov     esi, [esp+104h+var_104]
 lea     edi, [esp+104h+var_100]
loc_40BB84:                             ; CODE XREF: InitBuffer+2Ej
 mov     [esi], bl
 mov     eax, ebx
 cdq
 idiv    ecx
 add     edx, ebp
 mov     al, [edx]
 mov     [edi], al
 inc     ebx
 inc     edi
 inc     esi
 cmp     ebx, 100h
 jnz     short loc_40BB84
 xor     esi, esi
 mov     ebx, 100h
 mov     eax, [esp+104h+var_104]
 lea     edi, [esp+104h+var_100]
loc_40BBAA:                             ; CODE XREF: InitBuffer+63j
 mov     dl, [eax]
 xor     ecx, ecx
 mov     cl, dl
 add     esi, ecx
 xor     ecx, ecx
 mov     cl, [edi]
 add     esi, ecx
 and     esi, 0FFh
 mov     ecx, [esp+104h+var_104]
 mov     cl, [ecx+esi]
 mov     [eax], cl
 mov     ecx, [esp+104h+var_104]
 mov     [ecx+esi], dl
 inc     edi
 inc     eax
 dec     ebx
 jnz     short loc_40BBAA
 mov     edx, [esp+104h+var_104]
 mov     eax, [esp+104h+var_104]
 add     eax, 100h
 mov     ecx, 100h
 call    __Move
 add     esp, 104h
 pop     ebp
 pop     edi
 pop     esi
 pop     ebx
 ret
AC_InitBuffer endp

__Move proc
  xchg    eax, edx
  call    @System@Move$qqrpxvpvi ; System::Move(void *,void *,int)
  retn
__Move endp

@System@Move$qqrpxvpvi proc
  push    esi
  push    edi
  mov     esi, eax
  mov     edi, edx
  mov     eax, ecx
  cmp     edi, esi
  ja      short loc_402677
  jz      short loc_402695
  sar     ecx, 2
  js      short loc_402695
  rep movsd
  mov     ecx, eax
  and     ecx, 3
  rep movsb
  pop     edi
  pop     esi
  ret
; ---------------------------------------------------------------------------
loc_402677:                             ; CODE XREF: System::Move(void *,void *,int)+Aj
  lea     esi, [esi+ecx-4]
  lea     edi, [edi+ecx-4]
  sar     ecx, 2
  js      short loc_402695
  std
  rep movsd
  mov     ecx, eax
  and     ecx, 3
  add     esi, 3
  add     edi, 3
  rep movsb
  cld
loc_402695:                             ; CODE XREF: System::Move(void *,void *,int)+Cj
  pop     edi
  pop     esi
  ret
@System@Move$qqrpxvpvi endp
  
AC_MakeHash proc dwKeyLen: DWORD
 var_14          = dword ptr -14h
 var_10          = dword ptr -10h
 var_9           = byte ptr -9
 var_8           = dword ptr -8
 var_4           = dword ptr -4
 arg_0           = dword ptr  8
  add     esp, 0FFFFFFECh
  push    ebx
  push    esi
  push    edi
  mov     [ebp+var_8], ecx
  mov     [ebp+var_4], edx
  xor     ecx, ecx
  xor     edx, edx
  mov     ebx, [ebp+arg_0]
  dec     ebx
  test    ebx, ebx
  jl      short loc_40BC95
  inc     ebx
  mov     [ebp+var_14], ebx
  mov     [ebp+var_10], 0
loc_40BC2A:                             ; CODE XREF: MakeHesh+8Fj
  inc     ecx
  and     cl, 0FFh
  xor     ebx, ebx
  mov     bl, cl
  add     dl, [eax+ebx]
  and     dl, 0FFh
  xor     ebx, ebx
  mov     bl, cl
  mov     bl, [eax+ebx]
  mov     [ebp+var_9], bl
  mov     esi, edx
  and     esi, 0FFh
  xor     ebx, ebx
  mov     bl, cl
  lea     edi, [eax+ebx]
  mov     bl, [eax+esi]
  mov     [edi], bl
  mov     bl, [ebp+var_9]
  mov     [eax+esi], bl
  xor     ebx, ebx
  mov     bl, cl
  mov     bl, [eax+ebx]
  mov     esi, edx
  and     esi, 0FFh
  add     bl, [eax+esi]
  and     bl, 0FFh
  mov     [ebp+var_9], bl
  mov     ebx, [ebp+var_4]
  mov     esi, [ebp+var_10]
  mov     bl, [ebx+esi]
  movzx   esi, [ebp+var_9]
  xor     bl, [eax+esi]
  mov     esi, [ebp+var_8]
  mov     edi, [ebp+var_10]
  mov     [esi+edi], bl
  inc     [ebp+var_10]
  dec     [ebp+var_14]
  jnz     short loc_40BC2A
loc_40BC95:                             ; CODE XREF: MakeHesh+19j
  pop     edi
  pop     esi
  pop     ebx
  ret
AC_MakeHash        endp