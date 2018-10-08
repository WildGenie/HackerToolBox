{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit ExeImage;

interface

uses
  Classes, Windows, Graphics, sysutils;

type
  EExeError = class(Exception)
  end;
  TExeImage = class(TComponent)
  public
    f24:String;//f24
    f28:dword;//f28
    f30:dword;//f30
    f34:dword;//f34
    f38:dword;//f38
    f48:dword;//f48
    f4C:dword;//f4C
    f50:dword;//f50
    destructor Destroy; virtual;
  end;

implementation

{$R *.DFM}

//00449E58
//procedure sub_00449E58(?:AnsiString);
//begin
{*
 00449E58    push       ebp
 00449E59    mov        ebp,esp
 00449E5B    push       ebx
 00449E5C    mov        ebx,eax
 00449E5E    mov        ecx,ebx
 00449E60    mov        dl,1
 00449E62    mov        eax,[00449D44]; EExeError
 00449E67    call       Exception.Create; EExeError.Create
 00449E6C    call       @RaiseExcept
 00449E71    pop        ebx
 00449E72    pop        ebp
 00449E73    ret
*}
//end;

//00449E74
//constructor sub_00449E74(?:?; _Dv__:Boolean; ?:?);
//begin
{*
 00449E74    push       ebp
 00449E75    mov        ebp,esp
 00449E77    add        esp,0FFFFFFF8
 00449E7A    push       ebx
 00449E7B    push       esi
 00449E7C    push       edi
 00449E7D    test       dl,dl
>00449E7F    je         00449E89
 00449E81    add        esp,0FFFFFFF0
 00449E84    call       @ClassCreate
 00449E89    mov        byte ptr [ebp-1],dl
 00449E8C    mov        ebx,eax
 00449E8E    xor        edx,edx
 00449E90    mov        eax,ebx
 00449E92    call       TComponent.Create
 00449E97    lea        eax,[ebx+24]
 00449E9A    mov        edx,dword ptr [ebp+8]
 00449E9D    call       @LStrAsg
 00449EA2    push       0
 00449EA4    push       80
 00449EA9    push       3
 00449EAB    push       0
 00449EAD    push       1
 00449EAF    push       0C0000000
 00449EB4    mov        eax,dword ptr [ebx+24]
 00449EB7    call       @LStrToPChar
 00449EBC    push       eax
 00449EBD    call       kernel32.CreateFileA
 00449EC2    mov        esi,eax
 00449EC4    mov        dword ptr [ebx+28],esi
 00449EC7    cmp        esi,0FFFFFFFF
>00449ECA    jne        00449ED6
 00449ECC    mov        eax,449FA0; '11'
 00449ED1    call       00449E58
 00449ED6    push       0
 00449ED8    mov        eax,dword ptr [ebx+28]
 00449EDB    push       eax
 00449EDC    call       kernel32.GetFileSize
 00449EE1    mov        esi,eax
 00449EE3    mov        dword ptr [ebx+50],esi
 00449EE6    mov        eax,esi
 00449EE8    call       @GetMem
 00449EED    mov        edi,eax
 00449EEF    mov        dword ptr [ebx+30],edi
 00449EF2    test       edi,edi
>00449EF4    jne        00449F00
 00449EF6    mov        eax,449FAC; '12'
 00449EFB    call       00449E58
 00449F00    push       0
 00449F02    lea        eax,[ebp-8]
 00449F05    push       eax
 00449F06    mov        eax,dword ptr [ebx+50]
 00449F09    push       eax
 00449F0A    mov        eax,dword ptr [ebx+30]
 00449F0D    push       eax
 00449F0E    mov        eax,dword ptr [ebx+28]
 00449F11    push       eax
 00449F12    call       kernel32.ReadFile
 00449F17    test       eax,eax
>00449F19    jne        00449F25
 00449F1B    mov        eax,449FB8; '13'
 00449F20    call       00449E58
 00449F25    mov        eax,dword ptr [ebx+30]
 00449F28    mov        dword ptr [ebx+34],eax
 00449F2B    mov        ax,word ptr [eax]
 00449F2E    not        ax
 00449F31    cmp        ax,5A4D
>00449F35    jne        00449F41
 00449F37    mov        eax,449FC4; '14'
 00449F3C    call       00449E58
 00449F41    mov        eax,dword ptr [ebx+34]
 00449F44    mov        eax,dword ptr [eax+3C]
 00449F47    add        eax,dword ptr [ebx+34]
 00449F4A    mov        dword ptr [ebx+38],eax
 00449F4D    push       0F8
 00449F52    mov        eax,dword ptr [ebx+38]
 00449F55    push       eax
 00449F56    call       kernel32.IsBadReadPtr
 00449F5B    test       eax,eax
>00449F5D    jne        00449F6A
 00449F5F    mov        eax,dword ptr [ebx+38]
 00449F62    cmp        dword ptr [eax],4550
>00449F68    je         00449F74
 00449F6A    mov        eax,449FD0; '15'
 00449F6F    call       00449E58
 00449F74    mov        eax,ebx
 00449F76    cmp        byte ptr [ebp-1],0
>00449F7A    je         00449F8B
 00449F7C    call       @AfterConstruction
 00449F81    pop        dword ptr fs:[0]
 00449F88    add        esp,0C
 00449F8B    mov        eax,ebx
 00449F8D    pop        edi
 00449F8E    pop        esi
 00449F8F    pop        ebx
 00449F90    pop        ecx
 00449F91    pop        ecx
 00449F92    pop        ebp
 00449F93    ret        4
*}
//end;

//00449FD4
destructor TExeImage.Destroy;
begin
{*
 00449FD4    push       ebp
 00449FD5    mov        ebp,esp
 00449FD7    push       ebx
 00449FD8    push       esi
 00449FD9    call       @BeforeDestruction
 00449FDE    mov        ebx,edx
 00449FE0    mov        esi,eax
 00449FE2    mov        eax,dword ptr [esi+28]; TExeImage.?f28:dword
 00449FE5    cmp        eax,0FFFFFFFF
>00449FE8    je         00449FFF
 00449FEA    push       eax
 00449FEB    call       kernel32.CloseHandle
 00449FF0    mov        eax,dword ptr [esi+30]; TExeImage.?f30:dword
 00449FF3    test       eax,eax
>00449FF5    je         00449FFF
 00449FF7    mov        edx,dword ptr [esi+50]; TExeImage.?f50:dword
 00449FFA    call       @FreeMem
 00449FFF    mov        edx,ebx
 0044A001    and        dl,0FC
 0044A004    mov        eax,esi
 0044A006    call       TComponent.Destroy
 0044A00B    test       bl,bl
>0044A00D    jle        0044A016
 0044A00F    mov        eax,esi
 0044A011    call       @ClassDestroy
 0044A016    pop        esi
 0044A017    pop        ebx
 0044A018    pop        ebp
 0044A019    ret
*}
end;

end.