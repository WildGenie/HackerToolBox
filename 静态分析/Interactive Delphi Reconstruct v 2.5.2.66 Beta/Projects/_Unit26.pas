{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit26;

interface

uses
  Classes, Windows, Graphics;


implementation

Initialization
Finalization
//0041FF64
{*
 0041FF64    push       ebp
 0041FF65    mov        ebp,esp
 0041FF67    xor        eax,eax
 0041FF69    push       ebp
 0041FF6A    push       41FF95
 0041FF6F    push       dword ptr fs:[eax]
 0041FF72    mov        dword ptr fs:[eax],esp
 0041FF75    inc        dword ptr ds:[46D704]
>0041FF7B    jne        0041FF87
 0041FF7D    mov        eax,[0046A62C]
 0041FF82    call       TObject.Free
 0041FF87    xor        eax,eax
 0041FF89    pop        edx
 0041FF8A    pop        ecx
 0041FF8B    pop        ecx
 0041FF8C    mov        dword ptr fs:[eax],edx
 0041FF8F    push       41FF9C
 0041FF94    ret
<0041FF95    jmp        @HandleFinally
<0041FF9A    jmp        0041FF94
 0041FF9C    pop        ebp
 0041FF9D    ret
*}
end.