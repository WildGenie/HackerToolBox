;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

.data?
    hFileIn             dd ?
    hFileOut            dd ?
    hMapping            dd ?
    pMapping            dd ?
    pMem                dd ?
    MemSize             dd ?
    SizeRW              dd ?
    lpCurrentSection    dd ?
    lpSections          dd ?
    FileAlignment       dd ?
    ImageBase           dd ?
    ImageDelta          dd ?
    EntryPoint          dd ?
    lpLastSection       dd ?
    lpCodeSection       dd ?

    tmp1                dd ?
    tmp2                dd ?
    tmp3                db ?

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

.data
    dlgTitle    db "WinUpack unpacker",0

    STUB        db "MZ" ;IMAGE_DOS_SIGNATURE
    _e_cblp     dw 00080h
    _e_cp       dw 00001h
    _e_crlc     dw 00000h
    _e_cparhdr  dw 00004h
    _e_minalloc dw 00010h
    _e_maxalloc dw 0FFFFh
    _e_ss       dw 00000h
    _e_sp       dw 00140h
    _e_csum     dw 00000h
    _e_ip       dw 00000h
    _e_cs       dw 00000h
    _e_lfarlc   dw 00040h
    _e_ovno     dw 00000h
    _e_res      dw 4 dup(0)
    _e_oemid    dw 00000h
    _e_oeminfo  dw 00000h
    _e_res2     dw 10 dup(0)
    _e_lfanew   dd 0B8h ;PE header Offset

                db 00Eh,01Fh,0BAh,00Eh,000h,0B4h,009h,0CDh,021h,0B8h,001h,04Ch,0CDh,021h,054h,068h
                db 069h,073h,020h,070h,072h,06Fh,067h,072h,061h,06Dh,020h,063h,061h,06Eh,06Eh,06Fh
                db 074h,020h,062h,065h,020h,072h,075h,06Eh,020h,069h,06Eh,020h,044h,04Fh,053h,020h
                db 06Dh,06Fh,064h,065h,02Eh,00Dh,00Dh,00Ah,024h,000h,000h,000h,000h,000h,000h,000h
                db 0BFh,054h,0B4h,0C1h,0FBh,035h,0DAh,092h,0FBh,035h,0DAh,092h,0FBh,035h,0DAh,092h
                db 075h,02Ah,0C9h,092h,0FCh,035h,0DAh,092h,096h,0A8h,0A7h,092h,0FAh,035h,0DAh,092h
                db 052h,069h,063h,068h,0FBh,035h,0DAh,092h,000h,000h,000h,000h,000h,000h,000h,000h
                db 000h,000h,000h,000h,000h,000h,000h,000h

;    PE_header:
    _Signature              dd "EP"
;    FileHeader:
    _Machine                dw 0014Ch ;i386
    _NumberOfSections       dw 3    ; !!!
    _TimeDateStamp          dd 0
    _PointerToSymbolTable   dd 0
    _NumberOfSymbols        dd 0
    _SizeOfOptionalHeader   dw sizeof IMAGE_OPTIONAL_HEADER32
    _Characteristics        dw 0818Fh
;    OptionalHeader:
    _Magic                  dw 0010Bh ;PE32
    _MajorLinkerVersion     db 1 ;1.51
    _MinerLinkerVersion     db 51
    _SizeOfCode             dd 0
    _SizeOfInitializedData  dd 0
    _SizeOfUnInitializedData dd 0
    _AddressOfEntryPoint    dd 0
    _BaseOfCode             dd 0
    _BaseOfData             dd 0
    _ImageBase              dd 0
    _SectionAlignment       dd 0
    _FileAlignment          dd 0
    _MajorOSVersion         dw 1
    _MinorOSVersion         dw 0
    _MajorImageVersion      dw 0 ;0.0
    _MinorImageVersion      dw 0
    _MajorSubSystemVerion   dw 4 ;4.0
    _MinorSubSystemVerion   dw 0
    _Win32VersionValue      dd 0 ;Reserved
    _SizeOfImage            dd 0 ;16384 bytes
    _SizeOfHeaders          dd 1000h
    _CheckSum               dd 06B94h
    _SubSystem              dw 2 ;Win32 GUI
    _DllCharacteristics     dw 0
    _SizeOfStackReserve     dd 01000h
    _SizeOfStackCommit      dd 01000h
    _SizeOfHeapReserve      dd 010000h
    _SizeOfHeapRCommit      dd 0
    _LoaderFlags            dd 0 ;Obsolete
    _NumberOfDataDirectories dd 16

; Data_Directories:
    _Export_Table           dd 0,0 ; Rva,Size
    _Import_Table           dd 0,0 ; Rva,Size
    _Resource_Table         dd 0,0 ; Rva,Size
    _Exception_Table        dd 0,0 ; Rva,Size
    _Certificate_Table      dd 0,0 ; Rva,Size
    _Relocation_Table       dd 0,0 ; Rva,Size
    _Debug_Data             dd 0,0 ; Rva,Size
    _Architecture           dd 0,0 ; Rva,Size
    _Global_PTR             dd 0,0 ; Rva,Size
    _TLS_Table              dd 0,0 ; Rva,Size
    _Load_Config_Table      dd 0,0 ; Rva,Size
    _BoundImportTable       dd 0,0 ; Rva,Size
    _ImportAddressTable     dd 0,0 ; Rva,Size
    _DelayImportDescriptor  dd 0,0 ; Rva,Size
    _COMplusRuntimeHeader   dd 0,0 ; Rva,Size
    _Reserved               dd 0,0 ; Rva,Size

    _SectionTable           db 5*28h dup (0)

    STUBSIZE equ $ - STUB

    RebuildImports  PROTO :DWORD
    xResRebuild     PROTO :DWORD

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;

.code
Unpack proc szFileIn:DWORD,szFileOut:DWORD
    xor     ebx,ebx
    invoke  CreateFile,szFileIn,GENERIC_READ,FILE_SHARE_READ,ebx,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,ebx
    scall   ShowError,$CT0("Cannot open file"),-1,ofs @EndProc
    mov     hFileIn,eax
    invoke  CreateFileMapping,hFileIn,ebx,PAGE_READONLY,ebx,ebx,ebx
    scall   ShowError,$CT0("Cannot map file"),0,ofs @CloseHandleIn
    mov     hMapping,eax
    invoke  MapViewOfFile,hMapping,FILE_MAP_READ,ebx,ebx,ebx
    scall   ShowError,$CT0("Cannot view file map"),0,ofs @CloseHandleIn
    mov     pMapping,eax

    .IF dword ptr [eax+2] != 'NREK'
        scall   ShowError,$CT0("Probably file doesn't packed by WinUpack"),eax,ofs @CloseHandleIn
    .ENDIF

    ;- allocate memmory for file --------------------------------------------;
    mov     edi,eax
    assume  edi:ptr IMAGE_DOS_HEADER
    add     edi,[edi].e_lfanew
    assume  edi:ptr IMAGE_NT_HEADERS
    m2m     MemSize,[edi].OptionalHeader.SizeOfImage
    add     MemSize,512
    invoke  VirtualAlloc,0,MemSize,MEM_RESERVE or MEM_COMMIT,PAGE_READWRITE
    scall   ShowError,$CT0("Cannot alloc memmory"),0,ofs @UnmapViewOfFile
    mov     pMem,eax

    ;- fill headers ---------------------------------------------------------;
    mov     ebx,[edi].OptionalHeader.SizeOfHeaders
    push    edi
    mov     esi,pMapping
    mov     edi,eax
    mov     ecx,ebx
    rep     movsb
    pop     edi

    ;- fill sections --------------------------------------------------------;
    ; this is a correct way to get poiter to the First Section
    movzx   eax,word ptr [edi].FileHeader.SizeOfOptionalHeader
    assume  edi:nothing
    assume  eax:nothing
    lea     esi,[edi + eax].IMAGE_NT_HEADERS.OptionalHeader
    assume  esi:ptr IMAGE_SECTION_HEADER
    assume  edi:ptr IMAGE_NT_HEADERS

    m2m     FileAlignment,[edi].OptionalHeader.FileAlignment
    m2m     ImageBase,[edi].OptionalHeader.ImageBase
    m2m     EntryPoint,[edi].OptionalHeader.AddressOfEntryPoint

    SectionsWork:
    inc     lpCurrentSection
    mov     ebx,[esi].Misc.VirtualSize
    cmp     ebx,[esi].SizeOfRawData
    jbe     @F
    mov     ebx,[esi].SizeOfRawData
    ; windows loader at first up align the SizeOfRawData
    mov     eax,FileAlignment
    dec     eax
    add     ebx,eax
    not     eax
    and     ebx,eax
    @@:
    push    esi
    push    edi
    mov     edi,[esi].VirtualAddress
    add     edi,pMem
    mov     esi,[esi].PointerToRawData
    ; and down align the PointerToRawData
    mov     eax,FileAlignment
    dec     eax
    not     eax
    and     esi,eax
    add     esi,pMapping

    mov     ecx,ebx
    rep     movsb
    pop     edi
    pop     esi
    add     esi,sizeof IMAGE_SECTION_HEADER
    movsx   eax,word ptr [edi].FileHeader.NumberOfSections
    cmp     lpCurrentSection,eax
    jb      SectionsWork

    ;- correct headers ------------------------------------------------------;
    mov     edi,pMem
    assume  edi:ptr IMAGE_DOS_HEADER
    add     edi,[edi].e_lfanew
    assume  edi:ptr IMAGE_NT_HEADERS
    movzx   eax,word ptr [edi].FileHeader.SizeOfOptionalHeader
    lea     esi,[edi + eax].IMAGE_NT_HEADERS.OptionalHeader
    assume  esi:ptr IMAGE_SECTION_HEADER
    mov     lpCurrentSection,0

    movsx   ecx,word ptr [edi].FileHeader.NumberOfSections
    SectionsWork2:
    test    [esi].Characteristics,IMAGE_SCN_MEM_EXECUTE + IMAGE_SCN_CNT_CODE
    @test:
    je      @F
    mov     lpCodeSection,esi
    mov     byte ptr [@test],0EBh
@@: m2m     [esi].SizeOfRawData,[esi].Misc.VirtualSize
    m2m     [esi].PointerToRawData,[esi].VirtualAddress
    mov     dword ptr [esi].Name1,'CES.'
    mov     dword ptr [esi+4].Name1,'NOIT'
    add     esi,sizeof IMAGE_SECTION_HEADER
    dec     ecx
    jnz     SectionsWork2
    sub     esi,sizeof IMAGE_SECTION_HEADER
    add     [esi].SizeOfRawData,512
    add     [esi].Misc.VirtualSize,512
    mov     lpLastSection,esi

    m2m     [edi].OptionalHeader.DataDirectory[(IMAGE_DIR_IMPORT)].VirtualAddress,[esi].VirtualAddress
    m2m     [edi].OptionalHeader.DataDirectory[(IMAGE_DIR_IMPORT)].isize,[esi].SizeOfRawData

    mov     eax,pMem
    sub     eax,ImageBase
    mov     ImageDelta,eax

    test    [edi].FileHeader.Characteristics,IMAGE_FILE_DLL
    jne     @DLLUnpack

    ;- main exe unpacking ---------------------------------------------------;
    pusha

    mov     esi,pMem
    add     esi,EntryPoint

    mov     edi,offset unpackcode1

    mov     ecx,unpackcode1size
    rep     movsb
    mov     ecx,unpackcode2size
    add     esi,08Ah
    mov     edi,offset unpackcode2
    rep     movsb
    mov     ecx,unpackcode3size
    mov     edi,offset unpackcode3
    rep     movsb
    mov     ecx,unpackcode4size
    add     esi,1Eh
    rep     movsb
    add     esi,3
    add     esi,dword ptr [esi]
    add     esi,23
    mov     ecx,unpackcode5size
    mov     edi,offset unpackcode5
    rep     movsb

unpackcode1:
    mov     esi,80808080h
unpackcode1size equ $ - unpackcode1
    add     esi,ImageDelta
    lodsd
    add     eax,ImageDelta
    push    eax
    ;push   dword ptr ds:[esi+34h]  ; LoadLibrary
    push    eax
    ;push   dword ptr ds:[esi+38h]  ; GetProcAddress
    push    eax
    lodsd
    add     eax,ImageDelta
    push    eax
    mov     edi,dword ptr [esi]
    add     edi,ImageDelta
unpackcode2:
    mov     esi,80808080h
unpackcode2size equ $ - unpackcode2
    add     esi,ImageDelta

    push    dword ptr [esi+04Dh]
    pop     dword ptr unpackcode6

unpackcode3:
    push    27h
    pop     ecx
    rep     movsd
    push    dword ptr [esi+4]
    or      eax,-1
    mov     ebx,edi
    stosd
unpackcode3size equ $ - unpackcode3

unpackcode4:
    inc     eax
    stosd
    inc     eax
    mov     cl, 4
    rep     stosd
    shl     eax,0Ah
    mov     ch,010h
    rep     stosd
    mov     edi,dword ptr [esi+0Ch]
unpackcode4size equ $ - unpackcode4
    add     edi,ImageDelta

    push    edi
    push    ecx
    label018:
    pop     eax
    lea     edx,dword ptr [ebx+eax*4+58h]
    ;call   dword ptr ds:[esi]
    call    proc1

    jb      short label06
    label01:
    add     al,0FDh
    sbb     dl,dl
    and     al,dl
    cmp     al,7
    jnb     short label01

unpackcode5:
    push    eax
    movzx   ebp,byte ptr [edi-1]
    shr     ebp,6
    imul    bp,300h
    lea     ebp,[ebx+ebp*4+1008h]
    push    edi
    mov     al,1
unpackcode5size equ $ - unpackcode5

    jecxz   short label02
    sub     edi,[ebx+8]

    label03:
    test    [edi],cl
    setnz   ah
    inc     ah
    lea     edx,[ebp+eax*4+0]

    ;call   dword ptr [esi]
    call    proc1
    adc     al,al
    shr     cl,1
    jz      short label04
    sub     ah,al
    and     ah,1
    jnz     short label03
    xor     ecx,ecx

    label02:
    mov     ch,1
    ;call   dword ptr [esi+50h]
    call    proc2

    label04:
    xor     ecx,ecx
    pop     edi

    label05:
    jmp     label011

    label06:
    add     al,0F9h
    sbb     al,al
    mov     cl,030h
    and     al,003h
    mov     ebp,[ebx+08h]
    add     al,008h
    add     edx,ecx
    ;call   dword ptr [esi]
    call    proc1
    jnb     short label09
    add     edx,ecx
    ;call   dword ptr [esi]
    call    proc1
    jb      short label07
    add     edx,ecx
    ;call   dword ptr [esi]
    call    proc1
    jb      short label08
    or      al,1
    push    eax
    mov     eax,edi
    sub     eax,[ebx+8]
    mov     cl,80h
    mov     al,byte ptr [eax]
    jmp     short label05

    label07:
    add     edx,60h
    ;call   dword ptr [esi]
    call    proc1
    xchg    ebp,[ebx+0Ch]
    jnb     short label08
    add     edx,ecx
    ;call   dword ptr [esi]
    call    proc1
    xchg    ebp,[ebx+10h]
    jnb     short label08
    xchg    ebp,[ebx+14h]

    label08:
    push    eax
    push    ebp
    lea     edx,[ebx+778h]
    ;call   dword ptr [esi+54h]
    call    proc3
    pop     ebp
    xchg    eax,ecx
    jmp     label012

    label09:
    dec     eax
    xchg    ebp,[ebx+0Ch]
    push    eax
    xchg    ebp,[ebx+10h]
    lea     edx,[ebx+0BC0h]
    mov     [ebx+14h], ebp
    ;call   dword ptr [esi+54h]
    call    proc3
    push    3
    pop     ecx
    push    eax
    dec     eax
    cmp     eax,ecx
    jb      short label010
    mov     eax,ecx

    label010:
    mov     cl,40h
    mul     cl
    lea     ebp,[ebx+eax*4+378h]
    ;call   dword ptr [esi+4Ch]
    call    proc2_
    cmp     al,4
    mov     ebp,eax
    jb      short label013
    xor     ebp,ebp
    shr     eax,1
    adc     ebp,2
    dec     eax
    xchg    eax,ecx
    shl     ebp,cl
    cmp     cl,5
    lea     edx,[ebx+ebp*4+178h]
    jbe     short label014
    sub     cl,4
    xor     eax,eax

    label016:
    mov     edx,[ebx-4]
    add     edx,ImageDelta
    shr     dword ptr [ebx],1
    mov     edx,[edx]
    bswap   edx
    sub     edx,[ebx+4]
    add     eax,eax
    cmp     edx,[ebx]
    jb      short label015
    mov     edx,[ebx]
    inc     eax
    add     [ebx+4], edx

    label015:
    ;call   dword ptr [esi+10h]
    call    proc4
    loop    short label016
    mov     cl,4
    shl     eax,cl
    add     ebp,eax
    lea     edx,dword ptr [ebx+18h]

    label014:
    xor     eax,eax
    push    ebp
    inc     eax
    push    ecx
    shl     eax,cl
    mov     ebp,edx
    xchg    eax,ecx
    ;call   dword ptr [esi+04Ch]
    call    proc2_

    cdq
    pop     ecx

    label017:
    shr     eax,1
    adc     edx,edx
    loop    short label017
    pop     ebp
    add     ebp,edx

    label013:
    inc     ebp
    pop     ecx

    label012:
    mov     dword ptr [ebx+08h],ebp
    push    esi
    mov     esi,edi
    sub     esi,ebp
    rep     movsb

    lodsb
    pop     esi
    mov     cl,80h

    label011:
    stosb
    push    eax
    mov     eax,dword ptr [esi+034h]
    add     eax,ImageDelta
    cmp     edi,eax
    pop     eax
    jb      label018
    pop     eax
    pop     edi
    pop     ecx
    jecxz   short label019

    label020:
    mov     al,byte ptr [edi]

    label021:
    inc     edi
    add     al,18h
    cmp     al,02h
    jnb     short label020

    mov     eax,dword ptr [edi]
    cmp     al,1
unpackcode6 equ $ - 4

    jnz     short label021
    mov     al,0
    bswap   eax
    add     eax,dword ptr [esi+038h]
    add     eax,ImageDelta
    sub     eax,edi
    stos    dword ptr [edi]
    loop    short label020

    label019:
    pop     esi
    pop     ebp

    label024:
    inc     esi
    invoke  RebuildImports,esi

    label022:
    pop     eax
    pop     eax
    sub     eax,pMem
    mov     EntryPoint,eax
    popa
    jmp     @SaveFile

    ;-------------------------------------------;

    proc1:
    push    eax
    mov     eax,dword ptr [ebx]
    push    edx
    shr     eax,0Bh
    mul     dword ptr [edx]
    mov     edx,dword ptr [ebx-4]
    add     edx,ImageDelta
    mov     edx,dword ptr [edx]
    bswap   edx
    sub     edx,dword ptr [ebx+4]
    cmp     eax,edx
    pop     edx
    jbe     label11
    mov     dword ptr [ebx],eax
    xor     eax,eax
    mov     ah,8
    sub     eax,dword ptr [edx]
    shr     eax,5
    add     dword ptr [edx],eax
    jmp     label12
    label11:
    add     dword ptr [ebx+4],eax
    sub     dword ptr [ebx],eax
    mov     eax,dword ptr [edx]
    shr     eax,5
    sub     dword ptr [edx],eax
    stc
    label12:
    pop     eax

    pushfd
    cmp     byte ptr [ebx+3],0
    jnz     label13
    inc     dword ptr [ebx-4]
    shl     dword ptr [ebx+4],8
    shl     dword ptr [ebx],8
    label13:
    popfd
    retn

    ;-------------------------------------------;

    proc2_:
    xor     eax,eax
    inc     eax
    proc2:
    lea     edx,dword ptr [ebp+eax*4]
    ;call    dword ptr [esi]
    call    proc1
    adc     eax,eax
    cmp     eax,ecx
    jb      short proc2
    sub     eax,ecx
    retn

    ;-------------------------------------------;

    proc3:
    mov     cl,8
    ;call   dword ptr [esi]
    call    proc1
    lea     edx,dword ptr [edx+4]
    mov     al,1
    jnb     short label31
    ;call   dword ptr [esi]
    call    proc1
    mov     al,9
    jnb     short label31
    shl     ecx,5
    mov     al,011h
    label31:
    push    eax
    lea     ebp,dword ptr [edx+eax*4]
    ;call   dword ptr [esi+04Ch]
    call    proc2_
    pop     ebp
    add     eax,ebp
    retn

    ;-------------------------------------------;

    proc4:
    pushfd
    cmp     byte ptr [ebx+3],0
    jnz     short label41
    inc     dword ptr [ebx-4]
    shl     dword ptr [ebx+4],8
    shl     dword ptr [ebx],8
    label41:
    popfd
    retn

@DLLUnpack:
    pusha

    mov     esi,pMem
    add     esi,EntryPoint
    add     esi,6
    push    esi
    add     esi,34h
    mov     al,byte ptr [esi]
    mov     byte ptr [tmps2],al
    add     esi,25h
    mov     al,byte ptr [esi]
    mov     byte ptr [tmps1],al
    add     esi,1B8h
    lodsd
    add     eax,esi
    sub     eax,pMem
    mov     EntryPoint,eax
    jmp     sub_100060D0

loc_100060CB:
    jmp     loc_100062D6

sub_100060D0:
    xor     ecx, ecx
    pop     esi
    xchg    ecx, dword ptr [esi]
    jecxz   short loc_100060CB
    sub     esi, ecx
    mov     ebx, esi
    lodsd
    sub     ebx, eax
    lodsd
    add     eax, ebx
    push    eax
    xchg    eax, edi
    lodsd
    xchg    eax, ecx
    rep     movsd
    pop     esi
    lodsd
    push    esi
    xchg    eax, ecx

loc_100060EB:
    add     dword ptr [esi], ebx
    lodsd
    loop    loc_100060EB
    lodsd
    lea     ebp, [esi+10h]
    add     [ebp+0], ebx
    lea     edi, [ebp+1Ch]
    mov     ch, 7
tmps2 equ $ - 1
    rep     stosd
    pop     esi
    lodsd
    push    ebx
    push    eax
    push    ecx
    xchg    eax, edi

proc04:
    pop     eax
    lea     edx, [ebp+eax*4+5Ch]
    ;call   dword ptr [esi]
    call    proc01
    jb      short loc_10006164
    sub     al, 3
    jnb     short loc_10006113
    mov     al, 0

loc_10006113:
    cmp     al, 7
    jb      short loc_10006119
    sub     al, 3

loc_10006119:
    push    eax
    movzx   ebx, byte ptr [edi-1]
    shl     ebx, 0
tmps1 equ $ - 1
    mov     bl, 0
    lea     ebx, [ebx+ebx*2]
    lea     ebx, [ebp+ebx*4+100Ch]
    mov     al, 1
    jecxz   short loc_1000615A
    mov     edx, edi
    sub     edx, [ebp+0Ch]
    mov     ch, [edx]
    xor     edx, edx

loc_1000613A:
    test    cl, ch
    setnz   dh
    push    edx
    inc     dh
    mov     dl, al
    lea     edx, [ebx+edx*4]
    ;call   dword ptr [esi]
    call    proc01
    pop     edx
    lahf
    adc     al, al
    shr     cl, 1
    jz      short loc_1000615F
    sahf
    sbb     dh, dl
    jz      short loc_1000613A
    mov     ah, 0
    xor     ecx, ecx

loc_1000615A:
    mov     ch, 1
    ;call   dword ptr [esi+8]
    call    loc_1000633E

loc_1000615F:
    xor     ecx, ecx
    ;jmp    dword ptr [esi+1Ch]
    jmp     proc02

loc_10006164:
    mov     cl, 30h
    mov     ebx, [ebp+0Ch]
    add     edx, ecx
    ;call   dword ptr [esi]
    call    proc01
    jnb     short loc_100061BB
    add     edx, ecx
    ;call   dword ptr [esi]
    call    proc01
    jb      short loc_1000618E
    add     edx, ecx
    ;call   dword ptr [esi]
    call    proc01
    jb      short loc_100061A4
    cmp     al, 7
    mov     al, 9
    jb      short loc_10006183
    mov     al, 0Bh

loc_10006183:
    push    eax
    mov     eax, edi
    sub     eax, [ebp+0Ch]
    mov     al, [eax]
    ;jmp    dword ptr [esi+18h]
    jmp     proc07


loc_1000618E:
    add     edx, 60h
    ;call   dword ptr [esi]
    call    proc01
    xchg    ebx, [ebp+10h]
    jnb     short loc_100061A4
    add     edx, ecx
    ;call   dword ptr [esi]
    call    proc01
    xchg    ebx, [ebp+14h]
    jnb     short loc_100061A4
    xchg    ebx, [ebp+18h]

loc_100061A4:
    cmp     al, 7
    mov     al, 8
    jb      short loc_100061AC
    mov     al, 0Bh

loc_100061AC:
    push    eax
    push    ebx
    mov     edx, ebp
    add     edx, dword ptr [esi+38h]
    ;call   dword ptr [esi+0Ch]
    call    proc03
    pop     ebx
    xchg    eax, ecx
    ;jmp    dword ptr [esi+30h]
    jmp     proc06

loc_100061BB:
    cmp     al, 7
    mov     al, 7
    jb      short loc_100061C3
    mov     al, 0Ah

loc_100061C3:
    push    eax
    xchg    ebx, [ebp+10h]
    xchg    ebx, [ebp+14h]
    mov     [ebp+18h], ebx
    mov     edx, ebp
    add     edx, dword ptr [esi+3Ch]
    ;call   dword ptr [esi+0Ch]
    call    proc03
    push    3
    pop     ecx
    push    eax
    dec     eax
    cmp     eax, ecx
    jb      short loc_100061E0
    mov     eax, ecx

loc_100061E0:
    shl     eax, 6
    mov     cl, 40h
    lea     ebx, [ebp+eax*4+37Ch]
    ;call   dword ptr [esi+4]
    call    proc05
    cmp     al, 4
    mov     ebx, eax
    jb      short loc_10006254
    xor     ebx, ebx
    shr     eax, 1
    adc     ebx, ebx
    dec     eax
    inc     ebx
    xchg    eax, ecx
    inc     ebx
    shl     ebx, cl
    cmp     cl, 5
    lea     edx, [ebp+ebx*4+17Ch]
    jbe     short loc_1000623B
    sub     cl, 4
    xor     eax, eax

loc_10006212:
    mov     edx, [ebp+0]
    shr     dword ptr [ebp+8], 1
    mov     edx, [edx]
    bswap   edx
    sub     edx, [ebp+4]
    add     eax, eax
    cmp     edx, [ebp+8]
    jb      short loc_1000622D
    mov     edx, [ebp+8]
    inc     eax
    add     [ebp+4], edx

loc_1000622D:
    ;call   dword ptr [esi+10h]
    call    proc08
    loop    loc_10006212
    mov     cl, 4
    shl     eax, cl
    add     ebx, eax
    lea     edx, [ebp+1Ch]

loc_1000623B:
    xor     eax, eax
    push    ebx
    inc     eax
    push    ecx
    shl     eax, cl
    mov     ebx, edx
    xchg    eax, ecx
    ;call   dword ptr [esi+4]
    call    proc05
    xor     edx, edx
    pop     ecx

loc_1000624B:
    shr     eax, 1
    adc     edx, edx
    loop    loc_1000624B
    pop     ebx
    add     ebx, edx

loc_10006254:
    inc     ebx
    pop     ecx

proc06:
    mov     [ebp+0Ch], ebx
    push    esi
    mov     esi, edi
    sub     esi, ebx
    rep     movsb
    lodsb
    pop     esi

proc07:
    mov     cl, 80h

proc02:
    stosb
    cmp     edi, dword ptr [esi+24h]
    jnb     short loc_1000626D
    ;jmp    dword ptr [esi+20h]
    jmp     proc04

loc_1000626D:
    pop     eax
    mov     ecx, dword ptr [esi+40h]
    pop     edi
    pop     edx
    push    edi
    jecxz   short loc_10006291

loc_10006276:
    mov     al, [edi]
    inc     edi
    add     al, 18h
    cmp     al, 2
    jnb     short loc_10006276
    mov     eax, dword ptr [edi]
    cmp     al, 0
    jnz     short loc_10006276
    mov     al, 0
    bswap   eax
    add     eax, dword ptr [esi+14h]
    sub     eax, edi
    stosd
    loop    loc_10006276

loc_10006291:
    mov     ebx, dword ptr [esi+28h]
    push    esi
    push    edx
    mov     esi, dword ptr [esi+2Ch]

loc_10006299:
    inc     esi
    invoke  RebuildImports,esi

loc_100062D6:
    add     esp,0Ch
    popa
    jmp     @SaveFile

proc01:
    push    eax
    mov     eax, [ebp+8]
    push    edx
    shr     eax, 0Bh
    mul     dword ptr [edx]
    mov     edx, [ebp+0]
    mov     edx, [edx]
    bswap   edx
    sub     edx, [ebp+4]
    cmp     eax, edx
    pop     edx
    jbe     short loc_10006318
    mov     [ebp+8], eax
    xor     eax, eax
    mov     ah, 8
    sub     eax, [edx]
    shr     eax, 5
    add     [edx], eax
    jmp     short loc_10006326

loc_10006318:
    add     [ebp+4], eax
    sub     [ebp+8], eax
    mov     eax, [edx]
    shr     eax, 5
    sub     [edx], eax
    stc

loc_10006326:
    pop     eax

proc08:
    pushf
    cmp     byte ptr [ebp+0Bh], 0
    jnz     short loc_10006339
    inc     dword ptr [ebp+0]
    shl     dword ptr [ebp+4], 8
    shl     dword ptr [ebp+8], 8

loc_10006339:
    popf
    retn

proc05:
    xor     eax, eax
    inc     eax

loc_1000633E:
    lea     edx, [ebx+eax*4]
    ;call   dword ptr [esi]
    call    proc01
    adc     eax, eax
    cmp     eax, ecx
    jb      short loc_1000633E
    sub     eax, ecx
    retn

proc03:
    mov     cl, 8
    ;call   dword ptr [esi]
    call    proc01
    lea     edx, [edx+4]
    mov     al, 1
    jnb     short loc_10006362
    ;call   dword ptr [esi]
    call    proc01
    mov     al, 9
    jnb     short loc_10006362
    shl     ecx, 5
    mov     al, 11h

loc_10006362:
    push    eax
    lea     ebx, [edx+eax*4]
    ;call   dword ptr [esi+4]
    call    proc05
    pop     ebx
    add     eax, ebx
    retn

    ;- save file ------------------------------------------------------------;

    @SaveFile:
    call    RebuildPE
    mov     edi,pMem
    assume  edi:ptr IMAGE_DOS_HEADER
    add     edi,[edi].e_lfanew
    assume  edi:ptr IMAGE_NT_HEADERS
    ; change EntryPoint
    m2m     [edi].OptionalHeader.AddressOfEntryPoint,EntryPoint

    xor     ebx,ebx
    invoke  CreateFile,szFileOut,GENERIC_WRITE,ebx,ebx,CREATE_ALWAYS,ebx,ebx
    scall   ShowError,$CT0("Cannot create file"),-1,ofs @FreeMem
    mov     hFileOut,eax

    ;- write to file --------------------------------------------------------;
    invoke  WriteFile,hFileOut,pMem,MemSize,offset SizeRW,ebx
    scall   ShowError,$CT0("Cannot write to file"),ebx,ofs @CloseHandleOut

    invoke  MessageBoxA,ebx,$CT0("done"),$CT0("Congratulation\:"),MB_TOPMOST

    @CloseHandleOut:
    invoke  CloseHandle,hFileOut
    invoke  xResRebuild,szFileOut
    @FreeMem:
    invoke  VirtualFree,pMem,MemSize,MEM_DECOMMIT
    @UnmapViewOfFile:
    invoke  UnmapViewOfFile,pMapping
    @CloseHandleIn:
    invoke  CloseHandle,hFileIn
    @EndProc:
    ret
Unpack endp

;-----------------------------------------------------------------------------------------;
xResRebuild proc lpFileName2
local mf:MAP_FILE,pMem1:DWORD,ResSize:DWORD

;     int     3
    m2m     mf.lpFileName,lpFileName2
    mov     mf.dwFlags,MAP_READ or MAP_WRITE or MAP_PEFILE
    invoke  MapFile,addr mf

    invoke  CorrectSections,mf.pMapping,SEC_VA2RO
    invoke  CorrectSections,mf.pMapping,SEC_REALIGN

    invoke  ResRebuild,mf.pMapping,addr ResSize,RES_CLEARSEC;RES_CLEAROLD
    mov     pMem1,eax
    invoke  CloseHandle,mf.hFile
    invoke  CreateFile,mf.lpFileName,GENERIC_WRITE,0,0,OPEN_EXISTING,0,0
    mov     mf.hFile,eax
    invoke  WriteFile,mf.hFile,mf.pMapping,mf.ImageSize,addr SizeRW,0
    invoke  UnmapFile,addr mf

    .if pMem1
        invoke  AddResToPEFile,mf.lpFileName,pMem1,ResSize
        invoke  VirtualFree,pMem1,ResSize,MEM_DECOMMIT
    .endif

    invoke  PERealign,mf.lpFileName,0,0,0
    return

xResRebuild endp

RebuildImports proc lpImports:DWORD
local Elements:DWORD
local Libs:DWORD
local ImportDescriptor:IMAGE_IMPORT_DESCRIPTOR
local LibRVA:DWORD

local lpDescriptors:DWORD
local lpThunks:DWORD
local lpJumps:DWORD
local lpLinks:DWORD
local lpNames:DWORD

    pusha
    mov     esi,lpImports
    xor     eax,eax
    mov     Elements,eax
    mov     Libs,eax

    dec     esi
    ;- calculate number of elements ------------;
    calc:
    inc     esi
    lodsd
    test    eax,eax
    je      EndCalc
    inc     Libs
    @@:
    lodsb
    test    al,al
    jne     @B
    getimports:
    cmp     byte ptr [esi],0FFh ; if not by ordinal
    jne     @F
    lodsd   ; skip
    jmp     incEl
    @@:
    lodsb
    test    al,al
    jne     @B
    incEl:
    inc     Elements
    cmp     byte ptr [esi],0
    je      calc
    jmp     getimports
    EndCalc:

    ; calc space for ImageImportDescriptors
    mov     eax,Libs
    inc     eax
    inc     eax
    imul    eax,eax,sizeof IMAGE_IMPORT_DESCRIPTOR

    ; calc space for ThunkValues
    mov     ecx,Elements
    add     ecx,Libs
    shl     ecx,2

    mov     edi,lpLastSection
    assume  edi:ptr IMAGE_SECTION_HEADER
    mov     edi,[edi].PointerToRawData
    add     edi,pMem ; ebx - ptr to array of IMAGE_IMPORT_DESCRIPTOR
    mov     lpDescriptors,edi
    add     edi,eax
    mov     lpThunks,edi
    sub     lpThunks,sizeof IMAGE_IMPORT_DESCRIPTOR
    add     edi,ecx
    mov     lpNames,edi

    mov     esi,lpImports
    dec     esi
    calc2:
    inc     esi
    lodsd
    test    eax,eax
    je      EndCalc2
    mov     lpLinks,eax
    call    StoreLib
    getimports2:
    call    StoreThunk
    cmp     byte ptr [esi],0
    je      calc2
    jmp     getimports2
    EndCalc2:
    mov     edi,lpDescriptors
    xor     eax,eax
    stosd
    stosd
    stosd
    stosd
    stosd
    mov     edi,lpThunks
    stosd
    popa
    ret

StoreThunk:
    mov     edi,lpThunks
    cmp     byte ptr [esi],0FFh
    jne     noneordinal
    inc     esi
    xor     eax,eax
    lodsw
    or      eax,IMAGE_ORDINAL_FLAG32
    stosd
    mov     lpThunks,edi
    inc     esi
    jmp     StopStoreThunk
    noneordinal:
    mov     eax,lpNames
    sub     eax,pMem
    stosd
    mov     lpThunks,edi
    mov     edi,lpNames
    xor     eax,eax
    stosw
    @@:
    lodsb
    test    al,al
    je      Next
    stosb
    jmp     @B
    Next:
    stosb
    mov     lpNames,edi
    StopStoreThunk:

    push    esi
    mov     eax,lpLinks
    mov     ebx,lpThunks
    sub     ebx,4
    sub     ebx,ImageDelta
    mov     esi,lpCodeSection
    mov     ecx,[esi].SizeOfRawData
    mov     esi,[esi].PointerToRawData
    add     esi,pMem

    @search:
    cmp     dword ptr [esi],eax
    jne     @F
    mov     dword ptr [esi],ebx
    @@:
    inc     esi
    loop    @search
    add     eax,4
    mov     lpLinks,eax
    pop     esi

    retn

StoreLib:
    mov     edi,lpThunks
    xor     eax,eax
    stosd
    mov     lpThunks,edi
    ; save decriptor
    mov     edi,lpDescriptors
    stosd
    stosd
    stosd
    mov     eax,lpNames
    sub     eax,pMem    ; RVA to LibName
    stosd
    mov     eax,lpThunks
    sub     eax,pMem    ; RVA to Thunks
    stosd
    mov     lpDescriptors,edi
    ; save LibName
    mov     edi,lpNames
    @@:
    lodsb
    test    al,al
    je      StopStoreLib
    stosb
    jmp     @B
    StopStoreLib:
    stosb
    mov     lpNames,edi
    retn

RebuildImports endp

;-----------------------------------------------------------------------------------------;

RebuildPE proc
    mov     edi,pMem
    assume  edi:ptr IMAGE_DOS_HEADER
    add     edi,[edi].e_lfanew
    assume  edi:ptr IMAGE_NT_HEADERS

    movzx   ecx,word ptr [edi].FileHeader.NumberOfSections
    mov     _NumberOfSections,cx
    m2m     _Characteristics,[edi].FileHeader.Characteristics
;    m2m     _SizeOfCode,[edi].OptionalHeader.SizeOfCode
;    m2m     _SizeOfInitializedData,[edi].OptionalHeader.SizeOfInitializedData
;    m2m     _SizeOfUnInitializedData,[edi].OptionalHeader.SizeOfUninitializedData
    m2m     _AddressOfEntryPoint,[edi].OptionalHeader.AddressOfEntryPoint
    m2m     _BaseOfCode,[edi].OptionalHeader.BaseOfCode
    m2m     _BaseOfData,[edi].OptionalHeader.BaseOfData
    m2m     _ImageBase,[edi].OptionalHeader.ImageBase
    m2m     _SectionAlignment,[edi].OptionalHeader.SectionAlignment
    m2m     _FileAlignment,[edi].OptionalHeader.FileAlignment
    m2m     _SizeOfImage,[edi].OptionalHeader.SizeOfImage
    add     _SizeOfImage,512
    m2m     word ptr [_SubSystem],word ptr [edi].OptionalHeader.Subsystem
    m2m     _DllCharacteristics,[edi].OptionalHeader.DllCharacteristics
    m2m     _SizeOfStackReserve,[edi].OptionalHeader.SizeOfStackReserve
    m2m     _SizeOfStackCommit,[edi].OptionalHeader.SizeOfStackCommit
    m2m     _SizeOfHeapReserve,[edi].OptionalHeader.SizeOfHeapReserve
    m2m     _SizeOfHeapRCommit,[edi].OptionalHeader.SizeOfHeapCommit

    m2m      _Import_Table,     [edi].OptionalHeader.DataDirectory[(IMAGE_DIR_IMPORT)].VirtualAddress
    m2m     [_Import_Table+4],  [edi].OptionalHeader.DataDirectory[(IMAGE_DIR_IMPORT)].isize
    add     [_Import_Table+4],  512
    m2m      _Resource_Table,   [edi].OptionalHeader.DataDirectory[(IMAGE_DIR_RESOURCE)].VirtualAddress
    m2m     [_Resource_Table+4],[edi].OptionalHeader.DataDirectory[(IMAGE_DIR_RESOURCE)].isize
    m2m      _Export_Table,     [edi].OptionalHeader.DataDirectory[(IMAGE_DIR_EXPORT)].VirtualAddress
    m2m     [_Export_Table+4],  [edi].OptionalHeader.DataDirectory[(IMAGE_DIR_EXPORT)].isize

    movzx   eax,word ptr [edi].FileHeader.SizeOfOptionalHeader
    lea     esi,[edi + eax].OptionalHeader
    assume  esi:ptr IMAGE_SECTION_HEADER
    imul    ecx,ecx,28h
    mov     edi,offset _SectionTable
    rep     movsb

    mov     edi,pMem
    mov     esi,offset STUB
    mov     ecx,STUBSIZE
    rep     movsb

    ret
RebuildPE endp

;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH;
