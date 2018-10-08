{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit79;

interface

uses
  Classes, Windows, Graphics;


implementation

//004641E4
//function sub_004641E4(?:dword):dword;
//begin
{*
 004641E4    push       ebp
 004641E5    mov        ebp,esp
 004641E7    cmp        dword ptr [eax+40],0
>004641EB    je         004641F9
 004641ED    mov        byte ptr [eax+24],1
 004641F1    mov        eax,dword ptr [eax+40]
 004641F4    call       TThread.Terminate
 004641F9    pop        ebp
 004641FA    ret
*}
//end;

end.