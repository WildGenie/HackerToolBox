{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit51;

interface

uses
  Classes, Windows, Graphics;


implementation

Initialization
//004513F0
{*
 004513F0    push       ebp
 004513F1    mov        ebp,esp
 004513F3    push       0
 004513F5    xor        eax,eax
 004513F7    push       ebp
 004513F8    push       451447
 004513FD    push       dword ptr fs:[eax]
 00451400    mov        dword ptr fs:[eax],esp
 00451403    sub        dword ptr ds:[46D874],1
>0045140A    jae        00451431
 0045140C    lea        edx,[ebp-4]
 0045140F    mov        eax,[0046BF0C]; ^ShortDateFormat:AnsiString
 00451414    mov        eax,dword ptr [eax]
 00451416    call       AnsiUpperCase
 0045141B    mov        edx,dword ptr [ebp-4]
 0045141E    mov        eax,45145C; 'YYYY'
 00451423    call       @LStrPos
 00451428    test       eax,eax
 0045142A    setg       byte ptr ds:[46D870]
 00451431    xor        eax,eax
 00451433    pop        edx
 00451434    pop        ecx
 00451435    pop        ecx
 00451436    mov        dword ptr fs:[eax],edx
 00451439    push       45144E
 0045143E    lea        eax,[ebp-4]
 00451441    call       @LStrClr
 00451446    ret
<00451447    jmp        @HandleFinally
<0045144C    jmp        0045143E
 0045144E    pop        ecx
 0045144F    pop        ebp
 00451450    ret
*}
Finalization
end.