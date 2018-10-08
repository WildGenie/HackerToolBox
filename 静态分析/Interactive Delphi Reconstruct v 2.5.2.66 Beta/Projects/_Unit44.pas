{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit44;

interface

uses
  Classes, Windows, Graphics;


implementation

//0044F60C
procedure sub_0044F60C;
begin
{*
 0044F60C    cmp        dword ptr ds:[46AB14],0; gvar_0046AB14
>0044F613    je         0044F61F
 0044F615    mov        eax,[0046AB14]; gvar_0046AB14
 0044F61A    call       TObject.Free
 0044F61F    xor        eax,eax
 0044F621    mov        [0046AB14],eax; gvar_0046AB14
 0044F626    ret
*}
end;

Initialization
Finalization
//0044F628
{*
 0044F628    push       ebp
 0044F629    mov        ebp,esp
 0044F62B    xor        eax,eax
 0044F62D    push       ebp
 0044F62E    push       44F654
 0044F633    push       dword ptr fs:[eax]
 0044F636    mov        dword ptr fs:[eax],esp
 0044F639    inc        dword ptr ds:[46D840]
>0044F63F    jne        0044F646
 0044F641    call       0044F60C
 0044F646    xor        eax,eax
 0044F648    pop        edx
 0044F649    pop        ecx
 0044F64A    pop        ecx
 0044F64B    mov        dword ptr fs:[eax],edx
 0044F64E    push       44F65B
 0044F653    ret
<0044F654    jmp        @HandleFinally
<0044F659    jmp        0044F653
 0044F65B    pop        ebp
 0044F65C    ret
*}
end.