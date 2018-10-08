{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit75;

interface

uses
  Classes, Windows, Graphics;


implementation

//00460EB4
//function sub_00460EB4(?:dword):?;
//begin
{*
 00460EB4    mov        edx,eax
 00460EB6    add        edx,dword ptr [eax+3C]
 00460EB9    mov        eax,edx
 00460EBB    add        eax,18
 00460EBE    ret
*}
//end;

//00460EC0
//function sub_00460EC0(?:?; ?:?):?;
//begin
{*
 00460EC0    push       ebp
 00460EC1    mov        ebp,esp
 00460EC3    push       ecx
 00460EC4    push       ebx
 00460EC5    push       esi
 00460EC6    push       edi
 00460EC7    mov        edx,dword ptr [ebp+0C]
 00460ECA    xor        eax,eax
 00460ECC    mov        dword ptr [ebp-4],eax
 00460ECF    mov        eax,dword ptr [ebp+8]
 00460ED2    mov        ecx,dword ptr [eax+3C]
 00460ED5    add        ecx,eax
 00460ED7    mov        eax,ecx
 00460ED9    mov        esi,eax
 00460EDB    add        esi,0F8
 00460EE1    movzx      edi,word ptr [eax+6]
 00460EE5    dec        edi
 00460EE6    test       edi,edi
>00460EE8    jb         00460F13
 00460EEA    inc        edi
 00460EEB    mov        eax,esi
 00460EED    mov        ecx,dword ptr [eax+0C]
 00460EF0    cmp        edx,ecx
>00460EF2    jb         00460F0D
 00460EF4    mov        ebx,ecx
 00460EF6    add        ebx,dword ptr [eax+10]
 00460EF9    cmp        edx,ebx
>00460EFB    jae        00460F0D
 00460EFD    cmp        dword ptr [eax+10],0
>00460F01    jbe        00460F0D
 00460F03    mov        ebx,edx
 00460F05    sub        ebx,ecx
 00460F07    add        ebx,dword ptr [eax+14]
 00460F0A    mov        dword ptr [ebp-4],ebx
 00460F0D    add        esi,28
 00460F10    dec        edi
<00460F11    jne        00460EEB
 00460F13    mov        eax,dword ptr [ebp-4]
 00460F16    pop        edi
 00460F17    pop        esi
 00460F18    pop        ebx
 00460F19    pop        ecx
 00460F1A    pop        ebp
 00460F1B    ret        8
*}
//end;

//00460F20
//procedure sub_00460F20(?:dword);
//begin
{*
 00460F20    push       ebp
 00460F21    mov        ebp,esp
 00460F23    add        esp,0FFFFFFF4
 00460F26    push       ebx
 00460F27    push       esi
 00460F28    push       edi
 00460F29    mov        dword ptr [ebp-8],eax
 00460F2C    xor        edx,edx
 00460F2E    push       ebp
 00460F2F    push       460FC8
 00460F34    push       dword ptr fs:[edx]
 00460F37    mov        dword ptr fs:[edx],esp
 00460F3A    mov        eax,dword ptr [ebp-8]
 00460F3D    call       00460EB4
 00460F42    mov        ebx,eax
 00460F44    mov        esi,dword ptr [ebx+88]
 00460F4A    push       esi
 00460F4B    mov        eax,dword ptr [ebp-8]
 00460F4E    push       eax
 00460F4F    call       00460EC0
 00460F54    mov        dword ptr [ebp-4],eax
 00460F57    mov        eax,dword ptr [ebx+1C]
 00460F5A    mov        edx,400000
 00460F5F    sub        edx,eax
 00460F61    mov        dword ptr [ebp-0C],edx
 00460F64    mov        dword ptr [ebx+1C],400000
 00460F6B    mov        eax,dword ptr [ebp-8]
 00460F6E    add        dword ptr [ebp-4],eax
 00460F71    pushad
 00460F72    mov        esi,dword ptr [ebp-4]
 00460F75    cmp        dword ptr [esi],0
>00460F78    je         00460FBD
 00460F7A    mov        ecx,dword ptr [esi+4]
 00460F7D    sub        ecx,8
 00460F80    shr        ecx,1
 00460F82    mov        edi,dword ptr [esi]
 00460F84    add        esi,8
 00460F87    xor        ebx,ebx
 00460F89    mov        bx,word ptr [esi]
 00460F8C    shr        ebx,0C
 00460F8F    cmp        ebx,3
>00460F92    jne        00460FB6
 00460F94    push       esi
 00460F95    push       ecx
 00460F96    mov        bx,word ptr [esi]
 00460F99    and        ebx,0FFF
 00460F9F    mov        eax,ebx
 00460FA1    add        eax,edi
 00460FA3    push       eax
 00460FA4    push       dword ptr [ebp-8]
 00460FA7    call       00460EC0
 00460FAC    add        eax,dword ptr [ebp-8]
 00460FAF    mov        ebx,dword ptr [ebp-0C]
 00460FB2    add        dword ptr [eax],ebx
 00460FB4    pop        ecx
 00460FB5    pop        esi
 00460FB6    add        esi,2
 00460FB9    loop       00460F87
<00460FBB    jmp        00460F75
 00460FBD    popad
 00460FBE    xor        eax,eax
 00460FC0    pop        edx
 00460FC1    pop        ecx
 00460FC2    pop        ecx
 00460FC3    mov        dword ptr fs:[eax],edx
>00460FC6    jmp        00460FD2
<00460FC8    jmp        @HandleAnyException
 00460FCD    call       @DoneExcept
 00460FD2    pop        edi
 00460FD3    pop        esi
 00460FD4    pop        ebx
 00460FD5    mov        esp,ebp
 00460FD7    pop        ebp
 00460FD8    ret
*}
//end;

end.