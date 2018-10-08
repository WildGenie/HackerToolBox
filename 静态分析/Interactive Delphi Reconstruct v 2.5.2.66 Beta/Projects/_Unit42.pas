{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit42;

interface

uses
  Classes, Windows, Graphics;


implementation

Initialization
//0044F568
{*
 0044F568    push       ebp
 0044F569    mov        ebp,esp
 0044F56B    sub        dword ptr ds:[46D838],1
>0044F572    jae        0044F5BA
 0044F574    push       44F5BC; 'RX_HANDCUR'
 0044F579    mov        eax,[0046D4DC]; HInstance:HINST
 0044F57E    push       eax
 0044F57F    call       user32.LoadCursorA
 0044F584    mov        ecx,eax
 0044F586    mov        eax,[0046C190]; ^Screen:TScreen
 0044F58B    mov        eax,dword ptr [eax]
 0044F58D    mov        edx,36B0
 0044F592    call       TScreen.SetCursors
 0044F597    push       44F5C8; 'RX_DRAGCUR'
 0044F59C    mov        eax,[0046D4DC]; HInstance:HINST
 0044F5A1    push       eax
 0044F5A2    call       user32.LoadCursorA
 0044F5A7    mov        ecx,eax
 0044F5A9    mov        eax,[0046C190]; ^Screen:TScreen
 0044F5AE    mov        eax,dword ptr [eax]
 0044F5B0    mov        edx,36B1
 0044F5B5    call       TScreen.SetCursors
 0044F5BA    pop        ebp
 0044F5BB    ret
*}
Finalization
end.