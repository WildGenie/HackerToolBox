{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit80;

interface

uses
  Classes, Windows, Graphics;


implementation

//00464234
function sub_00464234:Boolean;
begin
{*
 00464234    push       ebp
 00464235    mov        ebp,esp
 00464237    push       ebx
 00464238    push       esi
 00464239    push       edi
 0046423A    cmp        dword ptr ds:[46D920],0; gvar_0046D920:HINST
>00464241    jne        00464299
 00464243    xor        eax,eax
 00464245    push       ebp
 00464246    push       46428F
 0046424B    push       dword ptr fs:[eax]
 0046424E    mov        dword ptr fs:[eax],esp
 00464251    xor        eax,eax
 00464253    mov        [0046D91C],eax; gvar_0046D91C:Pointer
 00464258    push       4642A8; 'HHCTRL.OCX'
 0046425D    call       kernel32.LoadLibraryA
 00464262    mov        [0046D920],eax; gvar_0046D920:HINST
 00464267    cmp        dword ptr ds:[46D920],0; gvar_0046D920:HINST
>0046426E    je         00464285
 00464270    push       4642B4; 'HtmlHelpA'
 00464275    mov        eax,[0046D920]; gvar_0046D920:HINST
 0046427A    push       eax
 0046427B    call       kernel32.GetProcAddress
 00464280    mov        [0046D91C],eax; gvar_0046D91C:Pointer
 00464285    xor        eax,eax
 00464287    pop        edx
 00464288    pop        ecx
 00464289    pop        ecx
 0046428A    mov        dword ptr fs:[eax],edx
>0046428D    jmp        00464299
<0046428F    jmp        @HandleAnyException
 00464294    call       @DoneExcept
 00464299    cmp        dword ptr ds:[46D920],0; gvar_0046D920:HINST
 004642A0    setne      al
 004642A3    pop        edi
 004642A4    pop        esi
 004642A5    pop        ebx
 004642A6    pop        ebp
 004642A7    ret
*}
end;

Initialization
//00464304
{*
 00464304    sub        dword ptr ds:[46D924],1
>0046430B    jae        00464314
 0046430D    xor        eax,eax
 0046430F    mov        [0046D920],eax; gvar_0046D920:HINST
 00464314    ret
*}
Finalization
//004642C0
{*
 004642C0    push       ebp
 004642C1    mov        ebp,esp
 004642C3    xor        eax,eax
 004642C5    push       ebp
 004642C6    push       4642FB
 004642CB    push       dword ptr fs:[eax]
 004642CE    mov        dword ptr fs:[eax],esp
 004642D1    inc        dword ptr ds:[46D924]
>004642D7    jne        004642ED
 004642D9    cmp        dword ptr ds:[46D920],0; gvar_0046D920:HINST
>004642E0    je         004642ED
 004642E2    mov        eax,[0046D920]; gvar_0046D920:HINST
 004642E7    push       eax
 004642E8    call       kernel32.FreeLibrary
 004642ED    xor        eax,eax
 004642EF    pop        edx
 004642F0    pop        ecx
 004642F1    pop        ecx
 004642F2    mov        dword ptr fs:[eax],edx
 004642F5    push       464302
 004642FA    ret
<004642FB    jmp        @HandleFinally
<00464300    jmp        004642FA
 00464302    pop        ebp
 00464303    ret
*}
end.