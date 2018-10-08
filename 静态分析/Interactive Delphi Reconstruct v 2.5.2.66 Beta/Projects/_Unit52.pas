{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit52;

interface

uses
  Classes, Windows, Graphics;


implementation

//00451464
procedure sub_00451464;
begin
{*
 00451464    push       ebx
 00451465    push       esi
 00451466    mov        bl,0B
 00451468    mov        esi,46D87C
 0045146D    mov        eax,dword ptr [esi]
 0045146F    call       TObject.Free
 00451474    add        esi,4
 00451477    dec        bl
<00451479    jne        0045146D
 0045147B    pop        esi
 0045147C    pop        ebx
 0045147D    ret
*}
end;

Initialization
//00451534
{*
 00451534    sub        dword ptr ds:[46D878],1
>0045153B    jae        00451558
 0045153D    mov        eax,451480
 00451542    call       @InitImports
 00451547    mov        eax,46D87C
 0045154C    xor        ecx,ecx
 0045154E    mov        edx,2C
 00451553    call       @FillChar
 00451558    ret
*}
Finalization
//004514FC
{*
 004514FC    push       ebp
 004514FD    mov        ebp,esp
 004514FF    xor        eax,eax
 00451501    push       ebp
 00451502    push       451528
 00451507    push       dword ptr fs:[eax]
 0045150A    mov        dword ptr fs:[eax],esp
 0045150D    inc        dword ptr ds:[46D878]
>00451513    jne        0045151A
 00451515    call       00451464
 0045151A    xor        eax,eax
 0045151C    pop        edx
 0045151D    pop        ecx
 0045151E    pop        ecx
 0045151F    mov        dword ptr fs:[eax],edx
 00451522    push       45152F
 00451527    ret
<00451528    jmp        @HandleFinally
<0045152D    jmp        00451527
 0045152F    pop        ebp
 00451530    ret
*}
end.