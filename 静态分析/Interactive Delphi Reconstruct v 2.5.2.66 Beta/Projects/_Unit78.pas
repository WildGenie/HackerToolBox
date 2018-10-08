{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit78;

interface

uses
  Classes, Windows, Graphics;


implementation

//0046417C
procedure sub_0046417C;
begin
{*
 0046417C    cmp        dword ptr ds:[46BD84],0; gvar_0046BD84
>00464183    je         00464196
 00464185    mov        eax,[0046BD84]; gvar_0046BD84
 0046418A    call       TObject.Free
 0046418F    xor        eax,eax
 00464191    mov        [0046BD84],eax; gvar_0046BD84
 00464196    ret
*}
end;

Initialization
//004641D0
{*
 004641D0    sub        dword ptr ds:[46D914],1
>004641D7    jae        004641E0
 004641D9    xor        eax,eax
 004641DB    mov        [0046BD84],eax; gvar_0046BD84
 004641E0    ret
*}
Finalization
//00464198
{*
 00464198    push       ebp
 00464199    mov        ebp,esp
 0046419B    xor        eax,eax
 0046419D    push       ebp
 0046419E    push       4641C4
 004641A3    push       dword ptr fs:[eax]
 004641A6    mov        dword ptr fs:[eax],esp
 004641A9    inc        dword ptr ds:[46D914]
>004641AF    jne        004641B6
 004641B1    call       0046417C
 004641B6    xor        eax,eax
 004641B8    pop        edx
 004641B9    pop        ecx
 004641BA    pop        ecx
 004641BB    mov        dword ptr fs:[eax],edx
 004641BE    push       4641CB
 004641C3    ret
<004641C4    jmp        @HandleFinally
<004641C9    jmp        004641C3
 004641CB    pop        ebp
 004641CC    ret
*}
end.