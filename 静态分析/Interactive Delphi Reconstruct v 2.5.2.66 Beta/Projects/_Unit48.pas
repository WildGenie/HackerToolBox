{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit48;

interface

uses
  Classes, Windows, Graphics;


implementation

//00450318
//procedure sub_00450318(?:AnsiString; ?:AnsiString; ?:AnsiString; ?:?);
//begin
{*
 00450318    push       ebp
 00450319    mov        ebp,esp
 0045031B    push       0
 0045031D    push       0
 0045031F    push       0
 00450321    push       ebx
 00450322    push       esi
 00450323    push       edi
 00450324    mov        dword ptr [ebp-4],ecx
 00450327    mov        edi,edx
 00450329    mov        ebx,eax
 0045032B    mov        esi,dword ptr [ebp+8]
 0045032E    xor        eax,eax
 00450330    push       ebp
 00450331    push       4503CC
 00450336    push       dword ptr fs:[eax]
 00450339    mov        dword ptr fs:[eax],esp
 0045033C    lea        eax,[ebp-8]
 0045033F    mov        edx,ebx
 00450341    call       @LStrLAsg
 00450346    mov        eax,esi
 00450348    call       @LStrClr
 0045034D    mov        edx,dword ptr [ebp-8]
 00450350    mov        eax,edi
 00450352    call       @LStrPos
 00450357    mov        ebx,eax
 00450359    test       ebx,ebx
>0045035B    jle        004503A3
 0045035D    push       dword ptr [esi]
 0045035F    lea        eax,[ebp-0C]
 00450362    push       eax
 00450363    mov        ecx,ebx
 00450365    dec        ecx
 00450366    mov        edx,1
 0045036B    mov        eax,dword ptr [ebp-8]
 0045036E    call       @LStrCopy
 00450373    push       dword ptr [ebp-0C]
 00450376    push       dword ptr [ebp-4]
 00450379    mov        eax,esi
 0045037B    mov        edx,3
 00450380    call       @LStrCatN
 00450385    lea        eax,[ebp-8]
 00450388    push       eax
 00450389    mov        eax,edi
 0045038B    call       @LStrLen
 00450390    mov        edx,eax
 00450392    add        edx,ebx
 00450394    mov        ecx,7FFFFFFF
 00450399    mov        eax,dword ptr [ebp-8]
 0045039C    call       @LStrCopy
>004503A1    jmp        004503AD
 004503A3    mov        eax,esi
 004503A5    mov        edx,dword ptr [ebp-8]
 004503A8    call       @LStrCat
 004503AD    test       ebx,ebx
<004503AF    jg         0045034D
 004503B1    xor        eax,eax
 004503B3    pop        edx
 004503B4    pop        ecx
 004503B5    pop        ecx
 004503B6    mov        dword ptr fs:[eax],edx
 004503B9    push       4503D3
 004503BE    lea        eax,[ebp-0C]
 004503C1    mov        edx,2
 004503C6    call       @LStrArrayClr
 004503CB    ret
<004503CC    jmp        @HandleFinally
<004503D1    jmp        004503BE
 004503D3    pop        edi
 004503D4    pop        esi
 004503D5    pop        ebx
 004503D6    mov        esp,ebp
 004503D8    pop        ebp
 004503D9    ret        4
*}
//end;

//004503DC
//function sub_004503DC(?:AnsiString; ?:?):?;
//begin
{*
 004503DC    push       ebp
 004503DD    mov        ebp,esp
 004503DF    push       ecx
 004503E0    push       ebx
 004503E1    push       esi
 004503E2    push       edi
 004503E3    mov        edi,edx
 004503E5    mov        esi,eax
 004503E7    xor        eax,eax
 004503E9    mov        dword ptr [ebp-4],eax
 004503EC    mov        ebx,1
 004503F1    mov        eax,esi
 004503F3    call       @LStrLen
 004503F8    cmp        eax,ebx
>004503FA    jb         00450433
>004503FC    jmp        004503FF
 004503FE    inc        ebx
 004503FF    cmp        eax,ebx
>00450401    jb         00450412
 00450403    mov        dl,byte ptr [esi+ebx-1]
 00450407    and        edx,0FF
 0045040D    bt         dword ptr [edi],edx
<00450410    jb         004503FE
 00450412    cmp        eax,ebx
>00450414    jb         0045041C
 00450416    inc        dword ptr [ebp-4]
>00450419    jmp        0045041C
 0045041B    inc        ebx
 0045041C    cmp        eax,ebx
>0045041E    jb         0045042F
 00450420    mov        dl,byte ptr [esi+ebx-1]
 00450424    and        edx,0FF
 0045042A    bt         dword ptr [edi],edx
<0045042D    jae        0045041B
 0045042F    cmp        eax,ebx
<00450431    jae        004503FF
 00450433    mov        eax,dword ptr [ebp-4]
 00450436    pop        edi
 00450437    pop        esi
 00450438    pop        ebx
 00450439    pop        ecx
 0045043A    pop        ebp
 0045043B    ret
*}
//end;

//0045043C
//function sub_0045043C(?:?; ?:AnsiString; ?:?):?;
//begin
{*
 0045043C    push       ebp
 0045043D    mov        ebp,esp
 0045043F    add        esp,0FFFFFFF4
 00450442    push       ebx
 00450443    push       esi
 00450444    push       edi
 00450445    mov        edi,ecx
 00450447    mov        esi,edx
 00450449    mov        dword ptr [ebp-4],eax
 0045044C    xor        eax,eax
 0045044E    mov        dword ptr [ebp-0C],eax
 00450451    mov        ebx,1
 00450456    xor        eax,eax
 00450458    mov        dword ptr [ebp-8],eax
>0045045B    jmp        004504B0
>0045045D    jmp        00450460
 0045045F    inc        ebx
 00450460    mov        eax,esi
 00450462    call       @LStrLen
 00450467    cmp        ebx,eax
>00450469    jg         00450479
 0045046B    mov        al,byte ptr [esi+ebx-1]
 0045046F    and        eax,0FF
 00450474    bt         dword ptr [edi],eax
<00450477    jb         0045045F
 00450479    mov        eax,esi
 0045047B    call       @LStrLen
 00450480    cmp        ebx,eax
>00450482    jg         00450487
 00450484    inc        dword ptr [ebp-0C]
 00450487    mov        eax,dword ptr [ebp-0C]
 0045048A    cmp        eax,dword ptr [ebp-4]
>0045048D    je         004504AD
>0045048F    jmp        00450492
 00450491    inc        ebx
 00450492    mov        eax,esi
 00450494    call       @LStrLen
 00450499    cmp        ebx,eax
>0045049B    jg         004504B0
 0045049D    mov        al,byte ptr [esi+ebx-1]
 004504A1    and        eax,0FF
 004504A6    bt         dword ptr [edi],eax
<004504A9    jae        00450491
>004504AB    jmp        004504B0
 004504AD    mov        dword ptr [ebp-8],ebx
 004504B0    mov        eax,esi
 004504B2    call       @LStrLen
 004504B7    cmp        ebx,eax
>004504B9    jg         004504C3
 004504BB    mov        eax,dword ptr [ebp-0C]
 004504BE    cmp        eax,dword ptr [ebp-4]
<004504C1    jne        00450460
 004504C3    mov        eax,dword ptr [ebp-8]
 004504C6    pop        edi
 004504C7    pop        esi
 004504C8    pop        ebx
 004504C9    mov        esp,ebp
 004504CB    pop        ebp
 004504CC    ret
*}
//end;

//004504D0
//procedure sub_004504D0(?:?; ?:AnsiString; ?:?; ?:?);
//begin
{*
 004504D0    push       ebp
 004504D1    mov        ebp,esp
 004504D3    add        esp,0FFFFFFF8
 004504D6    push       ebx
 004504D7    push       esi
 004504D8    push       edi
 004504D9    mov        dword ptr [ebp-8],ecx
 004504DC    mov        edi,edx
 004504DE    mov        dword ptr [ebp-4],eax
 004504E1    xor        esi,esi
 004504E3    mov        ecx,dword ptr [ebp-8]
 004504E6    mov        edx,edi
 004504E8    mov        eax,dword ptr [ebp-4]
 004504EB    call       0045043C
 004504F0    mov        ebx,eax
 004504F2    test       ebx,ebx
>004504F4    je         00450530
>004504F6    jmp        00450514
 004504F8    inc        esi
 004504F9    mov        eax,dword ptr [ebp+8]
 004504FC    mov        edx,esi
 004504FE    call       @LStrSetLength
 00450503    mov        eax,dword ptr [ebp+8]
 00450506    call       UniqueString
 0045050B    mov        dl,byte ptr [edi+ebx-1]
 0045050F    mov        byte ptr [eax+esi-1],dl
 00450513    inc        ebx
 00450514    mov        eax,edi
 00450516    call       @LStrLen
 0045051B    cmp        ebx,eax
>0045051D    jg         00450530
 0045051F    mov        al,byte ptr [edi+ebx-1]
 00450523    mov        edx,dword ptr [ebp-8]
 00450526    and        eax,0FF
 0045052B    bt         dword ptr [edx],eax
<0045052E    jae        004504F8
 00450530    mov        eax,dword ptr [ebp+8]
 00450533    mov        edx,esi
 00450535    call       @LStrSetLength
 0045053A    pop        edi
 0045053B    pop        esi
 0045053C    pop        ebx
 0045053D    pop        ecx
 0045053E    pop        ecx
 0045053F    pop        ebp
 00450540    ret        4
*}
//end;

end.