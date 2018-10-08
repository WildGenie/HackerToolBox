{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit59;

interface

uses
  Classes, Windows, Graphics;


implementation

Initialization
Finalization
//0045654C
{*
 0045654C    push       ebp
 0045654D    mov        ebp,esp
 0045654F    xor        eax,eax
 00456551    push       ebp
 00456552    push       45657D
 00456557    push       dword ptr fs:[eax]
 0045655A    mov        dword ptr fs:[eax],esp
 0045655D    inc        dword ptr ds:[46D8C8]
>00456563    jne        0045656F
 00456565    mov        eax,[0046ABE4]
 0045656A    call       TObject.Free
 0045656F    xor        eax,eax
 00456571    pop        edx
 00456572    pop        ecx
 00456573    pop        ecx
 00456574    mov        dword ptr fs:[eax],edx
 00456577    push       456584
 0045657C    ret
<0045657D    jmp        @HandleFinally
<00456582    jmp        0045657C
 00456584    pop        ebp
 00456585    ret
*}
end.