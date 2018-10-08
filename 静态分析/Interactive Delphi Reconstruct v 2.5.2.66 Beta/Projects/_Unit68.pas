{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit68;

interface

uses
  Classes, Windows, Graphics;


implementation

//0045C1E0
//function sub_0045C1E0(?:TCanvas; ?:?):LongBool;
//begin
{*
 0045C1E0    push       ebp
 0045C1E1    mov        ebp,esp
 0045C1E3    add        esp,0FFFFFFF0
 0045C1E6    push       ebx
 0045C1E7    push       esi
 0045C1E8    push       edi
 0045C1E9    mov        esi,edx
 0045C1EB    lea        edi,[ebp-10]
 0045C1EE    push       ecx
 0045C1EF    mov        ecx,4
 0045C1F4    rep movs   dword ptr [edi],dword ptr [esi]
 0045C1F6    pop        ecx
 0045C1F7    mov        ebx,ecx
 0045C1F9    mov        esi,eax
 0045C1FB    mov        eax,dword ptr [ebx*8+46AC14]
 0045C202    push       eax
 0045C203    mov        eax,dword ptr [ebx*8+46AC10]
 0045C20A    push       eax
 0045C20B    lea        eax,[ebp-10]
 0045C20E    push       eax
 0045C20F    mov        eax,esi
 0045C211    call       TCanvas.GetHandle
 0045C216    push       eax
 0045C217    call       user32.DrawEdge
 0045C21C    pop        edi
 0045C21D    pop        esi
 0045C21E    pop        ebx
 0045C21F    mov        esp,ebp
 0045C221    pop        ebp
 0045C222    ret
*}
//end;

end.