{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit74;

interface

uses
  Classes, Windows, Graphics;

type
  TLZB = class(TObject)
  public
    f4:dword;//f4
    f8:byte;//f8
    f10:dword;//f10
    f14:dword;//f14
    f18:dword;//f18
    f1C:dword;//f1C
    f20:dword;//f20
    f24:byte;//f24
    f25:byte;//f25
    f28:Pointer;//f28
    f2C:Pointer;//f2C
    //constructor Create(?:TLZB; _Dv__:Boolean);
  end;

implementation

{$R *.DFM}

//0045E5C0
//constructor TLZB.Create(?:TLZB; _Dv__:Boolean);
//begin
{*
 0045E5C0    test       dl,dl
>0045E5C2    je         0045E5CC
 0045E5C4    add        esp,0FFFFFFF0
 0045E5C7    call       @ClassCreate
 0045E5CC    mov        byte ptr [eax+25],0; TLZB.?f25:byte
 0045E5D0    test       dl,dl
>0045E5D2    je         0045E5E3
 0045E5D4    call       @AfterConstruction
 0045E5D9    pop        dword ptr fs:[0]
 0045E5E0    add        esp,0C
 0045E5E3    ret
*}
//end;

//0045E5E4
//function sub_0045E5E4(?:Pointer; ?:?; ?:?; ?:?):?;
//begin
{*
 0045E5E4    push       ebp
 0045E5E5    mov        ebp,esp
 0045E5E7    add        esp,0FFFFFEF8
 0045E5ED    mov        dword ptr [ebp-4],edx
 0045E5F0    mov        dword ptr [ebp-8],eax
 0045E5F3    mov        eax,dword ptr [ebp+8]
 0045E5F6    mov        eax,dword ptr [eax-8]
 0045E5F9    mov        dword ptr [eax+20],ecx
 0045E5FC    cmp        ecx,2
>0045E5FF    jne        0045E60A
 0045E601    mov        eax,dword ptr [ebp+8]
 0045E604    mov        byte ptr [eax-1],1
>0045E608    jmp        0045E611
 0045E60A    mov        eax,dword ptr [ebp+8]
 0045E60D    mov        byte ptr [eax-1],0
 0045E611    lea        eax,[ebp-108]
 0045E617    xor        ecx,ecx
 0045E619    mov        edx,100
 0045E61E    call       @FillChar
 0045E623    push       ecx
 0045E624    push       esi
 0045E625    push       ebx
 0045E626    mov        ecx,dword ptr [ebp-4]
 0045E629    sub        ecx,5
 0045E62C    mov        esi,dword ptr [ebp-8]
 0045E62F    xor        ebx,ebx
 0045E631    or         ecx,ecx
>0045E633    je         0045E661
>0045E635    js         0045E661
 0045E637    lods       byte ptr [esi]
 0045E638    cmp        al,0E8
>0045E63A    je         0045E64A
 0045E63C    cmp        byte ptr [ebp-1],0
>0045E640    jne        0045E646
 0045E642    cmp        al,0E9
>0045E644    je         0045E64A
 0045E646    inc        ebx
 0045E647    dec        ecx
<0045E648    jmp        0045E631
 0045E64A    mov        eax,dword ptr [esi]
 0045E64C    add        eax,ebx
 0045E64E    cmp        eax,dword ptr [ebp-4]
<0045E651    jb         0045E646
 0045E653    xor        eax,eax
 0045E655    mov        al,byte ptr [esi]
 0045E657    mov        byte ptr [ebp+eax-108],1
<0045E65F    jmp        0045E646
 0045E661    pop        ebx
 0045E662    pop        esi
 0045E663    pop        ecx
 0045E664    xor        eax,eax
 0045E666    xor        edx,edx
 0045E668    lea        ecx,[ebp-108]
 0045E66E    cmp        byte ptr [ecx],0
>0045E671    jne        0045E680
 0045E673    mov        eax,dword ptr [ebp+8]
 0045E676    mov        eax,dword ptr [eax-8]
 0045E679    mov        byte ptr [eax+24],dl
 0045E67C    mov        al,1
>0045E67E    jmp        0045E686
 0045E680    inc        edx
 0045E681    inc        ecx
 0045E682    test       dl,dl
<0045E684    jne        0045E66E
 0045E686    mov        esp,ebp
 0045E688    pop        ebp
 0045E689    ret
*}
//end;

//0045E68C
//procedure sub_0045E68C(?:TLZB; ?:Pointer; ?:?);
//begin
{*
 0045E68C    push       ebp
 0045E68D    mov        ebp,esp
 0045E68F    add        esp,0FFFFFFEC
 0045E692    mov        dword ptr [ebp-0C],ecx
 0045E695    mov        dword ptr [ebp-10],edx
 0045E698    mov        dword ptr [ebp-8],eax
 0045E69B    push       ebp
 0045E69C    mov        ecx,1
 0045E6A1    mov        edx,dword ptr [ebp-0C]
 0045E6A4    mov        eax,dword ptr [ebp-10]
 0045E6A7    call       0045E5E4
 0045E6AC    pop        ecx
 0045E6AD    test       al,al
>0045E6AF    jne        0045E6D1
 0045E6B1    push       ebp
 0045E6B2    mov        ecx,2
 0045E6B7    mov        edx,dword ptr [ebp-0C]
 0045E6BA    mov        eax,dword ptr [ebp-10]
 0045E6BD    call       0045E5E4
 0045E6C2    pop        ecx
 0045E6C3    test       al,al
>0045E6C5    jne        0045E6D1
 0045E6C7    mov        eax,dword ptr [ebp-8]
 0045E6CA    mov        dword ptr [eax+20],3; TLZB.?f20:dword
 0045E6D1    mov        eax,dword ptr [ebp-8]
 0045E6D4    mov        eax,dword ptr [eax+20]; TLZB.?f20:dword
 0045E6D7    dec        eax
>0045E6D8    je         0045E6E2
 0045E6DA    dec        eax
>0045E6DB    je         0045E6F5
 0045E6DD    dec        eax
>0045E6DE    je         0045E708
>0045E6E0    jmp        0045E710
 0045E6E2    mov        byte ptr [ebp-1],0
 0045E6E6    mov        byte ptr [ebp-11],1
 0045E6EA    mov        eax,dword ptr [ebp-8]
 0045E6ED    mov        al,byte ptr [eax+24]; TLZB.?f24:byte
 0045E6F0    mov        byte ptr [ebp-12],al
>0045E6F3    jmp        0045E710
 0045E6F5    mov        byte ptr [ebp-1],1
 0045E6F9    mov        byte ptr [ebp-11],1
 0045E6FD    mov        eax,dword ptr [ebp-8]
 0045E700    mov        al,byte ptr [eax+24]; TLZB.?f24:byte
 0045E703    mov        byte ptr [ebp-12],al
>0045E706    jmp        0045E710
 0045E708    mov        byte ptr [ebp-1],0
 0045E70C    mov        byte ptr [ebp-11],0
 0045E710    push       ecx
 0045E711    push       esi
 0045E712    push       ebx
 0045E713    mov        ecx,dword ptr [ebp-0C]
 0045E716    sub        ecx,5
 0045E719    mov        esi,dword ptr [ebp-10]
 0045E71C    xor        ebx,ebx
 0045E71E    or         ecx,ecx
>0045E720    je         0045E759
>0045E722    js         0045E759
 0045E724    lods       byte ptr [esi]
 0045E725    cmp        al,0E8
>0045E727    je         0045E737
 0045E729    cmp        byte ptr [ebp-1],0
>0045E72D    jne        0045E733
 0045E72F    cmp        al,0E9
>0045E731    je         0045E737
 0045E733    inc        ebx
 0045E734    dec        ecx
<0045E735    jmp        0045E71E
 0045E737    mov        eax,dword ptr [esi]
 0045E739    add        eax,ebx
 0045E73B    cmp        byte ptr [ebp-11],0
>0045E73F    je         0045E74C
 0045E741    cmp        eax,dword ptr [ebp-0C]
<0045E744    jae        0045E733
 0045E746    ror        eax,18
 0045E749    mov        al,byte ptr [ebp-12]
 0045E74C    mov        dword ptr [esi],eax
 0045E74E    add        ebx,5
 0045E751    add        esi,4
 0045E754    sub        ecx,5
<0045E757    jmp        0045E71E
 0045E759    pop        ebx
 0045E75A    pop        esi
 0045E75B    pop        ecx
 0045E75C    mov        esp,ebp
 0045E75E    pop        ebp
 0045E75F    ret
*}
//end;

//0045E760
//procedure sub_0045E760(?:TLZB; ?:?; ?:?; ?:?);
//begin
{*
 0045E760    push       ebp
 0045E761    mov        ebp,esp
 0045E763    push       ebx
 0045E764    mov        ebx,dword ptr [eax+20]; TLZB.?f20:dword
 0045E767    dec        ebx
>0045E768    je         0045E772
 0045E76A    dec        ebx
>0045E76B    je         0045E790
 0045E76D    dec        ebx
>0045E76E    je         0045E7A4
>0045E770    jmp        0045E7AD
 0045E772    mov        bx,word ptr ds:[46AC4C]
 0045E779    mov        word ptr [ecx],bx
 0045E77C    mov        cx,word ptr ds:[46AC4C]
 0045E783    mov        word ptr [edx],cx
 0045E786    mov        edx,dword ptr [ebp+8]
 0045E789    mov        al,byte ptr [eax+24]; TLZB.?f24:byte
 0045E78C    mov        byte ptr [edx],al
>0045E78E    jmp        0045E7AD
 0045E790    mov        cx,word ptr ds:[46AC4C]
 0045E797    mov        word ptr [edx],cx
 0045E79A    mov        edx,dword ptr [ebp+8]
 0045E79D    mov        al,byte ptr [eax+24]; TLZB.?f24:byte
 0045E7A0    mov        byte ptr [edx],al
>0045E7A2    jmp        0045E7AD
 0045E7A4    mov        ax,[0046AC4C]
 0045E7AA    mov        word ptr [ecx],ax
 0045E7AD    pop        ebx
 0045E7AE    pop        ebp
 0045E7AF    ret        4
*}
//end;

//0045E7B4
//procedure sub_0045E7B4(?:TLZB; ?:?);
//begin
{*
 0045E7B4    mov        ecx,edx
 0045E7B6    mov        dword ptr [eax+18],ecx; TLZB.?f18:dword
 0045E7B9    add        ecx,2000
 0045E7BF    mov        dword ptr [eax+1C],ecx; TLZB.?f1C:dword
 0045E7C2    ret
*}
//end;

//0045E7C4
//function sub_0045E7C4(?:TLZB):Integer;
//begin
{*
 0045E7C4    push       ebp
 0045E7C5    mov        ebp,esp
 0045E7C7    add        esp,0FFFFFFE8
 0045E7CA    push       ebx
 0045E7CB    push       esi
 0045E7CC    push       edi
 0045E7CD    mov        ebx,eax
 0045E7CF    cmp        byte ptr [ebx+25],0; TLZB.?f25:byte
>0045E7D3    je         0045E7EA
 0045E7D5    mov        eax,4
 0045E7DA    mov        dword ptr [ebp-8],80
 0045E7E1    mov        dword ptr [ebp-14],4
>0045E7E8    jmp        0045E7FD
 0045E7EA    mov        eax,1
 0045E7EF    mov        dword ptr [ebp-8],20
 0045E7F6    mov        dword ptr [ebp-14],1
 0045E7FD    shl        eax,0A
 0045E800    mov        esi,eax
 0045E802    shl        esi,0A
 0045E805    cmp        esi,dword ptr [ebx+18]; TLZB.?f18:dword
>0045E808    jbe        0045E813
 0045E80A    mov        dword ptr [ebp-0C],2
>0045E811    jmp        0045E81B
 0045E813    mov        eax,esi
 0045E815    shr        eax,2
 0045E818    mov        dword ptr [ebp-0C],eax
 0045E81B    mov        eax,dword ptr [ebp-0C]
 0045E81E    add        eax,esi
 0045E820    shl        eax,3
 0045E823    add        eax,9B000
 0045E828    mov        dword ptr [ebp-10],eax
 0045E82B    cmp        dword ptr [ebp-14],1
>0045E82F    jbe        0045E840
 0045E831    mov        eax,dword ptr [ebp-8]
 0045E834    add        eax,3
 0045E837    shl        eax,8
 0045E83A    shl        eax,0A
 0045E83D    add        dword ptr [ebp-10],eax
 0045E840    mov        byte ptr [ebx+8],0; TLZB.?f8:byte
 0045E844    mov        eax,dword ptr [ebp-10]
 0045E847    call       @GetMem
 0045E84C    mov        edi,eax
 0045E84E    test       edi,edi
>0045E850    jne        0045E863
 0045E852    mov        ecx,45E8FC; 'Memory error'
 0045E857    mov        dl,1
 0045E859    mov        eax,[0040751C]; Exception
 0045E85E    call       Exception.Create; Exception.Create
 0045E863    lea        eax,[ebp-4]
 0045E866    push       eax
 0045E867    push       edi
 0045E868    mov        eax,dword ptr [ebp-14]
 0045E86B    push       eax
 0045E86C    mov        eax,dword ptr [ebp-8]
 0045E86F    push       eax
 0045E870    mov        eax,dword ptr [ebp-0C]
 0045E873    push       eax
 0045E874    push       esi
 0045E875    call       00460E27
 0045E87A    add        esp,18
 0045E87D    mov        eax,dword ptr [ebx+18]; TLZB.?f18:dword
 0045E880    mov        dword ptr [ebx+14],eax; TLZB.?f14:dword
 0045E883    lea        eax,[ebp-18]
 0045E886    push       eax
 0045E887    mov        eax,dword ptr [ebx+4]; TLZB.?f4:dword
 0045E88A    push       eax
 0045E88B    mov        eax,dword ptr [ebx+1C]; TLZB.?f1C:dword
 0045E88E    push       eax
 0045E88F    mov        eax,dword ptr [ebx+2C]; TLZB.?f2C:Pointer
 0045E892    push       eax
 0045E893    mov        eax,dword ptr [ebx+18]; TLZB.?f18:dword
 0045E896    push       eax
 0045E897    mov        eax,dword ptr [ebx+28]; TLZB.?f28:Pointer
 0045E89A    push       eax
 0045E89B    mov        eax,dword ptr [ebp-4]
 0045E89E    push       eax
 0045E89F    call       00460E52
 0045E8A4    add        esp,1C
 0045E8A7    cmp        eax,1
>0045E8AA    jne        0045E8C2
 0045E8AC    mov        ecx,45E914; 'Compression Error'
 0045E8B1    mov        dl,1
 0045E8B3    mov        eax,[0040751C]; Exception
 0045E8B8    call       Exception.Create; Exception.Create
 0045E8BD    call       @RaiseExcept
 0045E8C2    cmp        eax,1
>0045E8C5    jbe        0045E8CB
 0045E8C7    mov        byte ptr [ebx+8],1; TLZB.?f8:byte
 0045E8CB    mov        eax,dword ptr [ebp-18]
 0045E8CE    mov        dword ptr [ebx+10],eax; TLZB.?f10:dword
 0045E8D1    cmp        dword ptr [ebx+4],0; TLZB.?f4:dword
>0045E8D5    je         0045E8E2
 0045E8D7    push       eax
 0045E8D8    mov        eax,dword ptr [ebx+18]; TLZB.?f18:dword
 0045E8DB    push       eax
 0045E8DC    call       dword ptr [ebx+4]
 0045E8DF    add        esp,8
 0045E8E2    mov        edx,dword ptr [ebp-10]
 0045E8E5    mov        eax,edi
 0045E8E7    call       @FreeMem
 0045E8EC    pop        edi
 0045E8ED    pop        esi
 0045E8EE    pop        ebx
 0045E8EF    mov        esp,ebp
 0045E8F1    pop        ebp
 0045E8F2    ret
*}
//end;

//0045E928
//function sub_0045E928:?;
//begin
{*
 0045E928    mov        edx,dword ptr [esp+8]
 0045E92C    mov        eax,dword ptr [esp+4]
 0045E930    mov        dword ptr [ecx+18],edx
 0045E933    mov        edx,dword ptr [esp+0C]
 0045E937    mov        dword ptr [ecx+4],eax
 0045E93A    mov        dword ptr [ecx+1C],edx
 0045E93D    mov        edx,dword ptr [esp+10]
 0045E941    lea        eax,[eax+eax+1]
 0045E945    push       esi
 0045E946    mov        dword ptr [ecx+20],edx
 0045E949    mov        edx,dword ptr [esp+18]
 0045E94D    mov        esi,eax
 0045E94F    shl        esi,4
 0045E952    mov        dword ptr [ecx+8],edx
 0045E955    add        edx,esi
 0045E957    mov        dword ptr [ecx+0C],edx
 0045E95A    mov        dword ptr [ecx+10],eax
 0045E95D    lea        edx,[edx+eax*4]
 0045E960    pop        esi
 0045E961    mov        dword ptr [ecx+14],edx
 0045E964    lea        eax,[edx+eax+3]
 0045E968    mov        ecx,eax
 0045E96A    and        ecx,3
 0045E96D    sub        eax,ecx
 0045E96F    ret        14
*}
//end;

//0045E972
procedure sub_0045E972;
begin
{*
 0045E972    mov        eax,dword ptr [esp+4]
 0045E976    mov        dword ptr [ecx],eax
 0045E978    ret        4
*}
end;

//0045E97B
//procedure sub_0045E97B(?:?; ?:?; ?:?);
//begin
{*
 0045E97B    mov        edx,dword ptr [ecx+4]
 0045E97E    xor        eax,eax
 0045E980    test       edx,edx
>0045E982    jbe        0045E99D
 0045E984    push       esi
 0045E985    xor        edx,edx
 0045E987    mov        esi,dword ptr [ecx+8]
 0045E98A    inc        eax
 0045E98B    mov        dword ptr [esi+edx],0
 0045E992    mov        esi,dword ptr [ecx+4]
 0045E995    add        edx,10
 0045E998    cmp        eax,esi
<0045E99A    jb         0045E987
 0045E99C    pop        esi
 0045E99D    ret
*}
//end;

//0045E99E
procedure sub_0045E99E;
begin
{*
 0045E99E    mov        eax,dword ptr [esp+4]
 0045E9A2    mov        ecx,dword ptr [ecx+8]
 0045E9A5    shl        eax,4
 0045E9A8    add        eax,ecx
 0045E9AA    inc        dword ptr [eax]
 0045E9AC    ret        4
*}
end;

//0045E9AF
//function sub_0045E9AF(?:?; ?:?; ?:?):?;
//begin
{*
 0045E9AF    mov        eax,dword ptr [ecx+0C]
 0045E9B2    mov        edx,dword ptr [ecx+24]
 0045E9B5    push       esi
 0045E9B6    push       1
 0045E9B8    mov        edx,dword ptr [eax+edx*4]
 0045E9BB    mov        esi,dword ptr [eax+4]
 0045E9BE    mov        dword ptr [eax+4],edx
 0045E9C1    mov        edx,dword ptr [ecx+24]
 0045E9C4    dec        edx
 0045E9C5    mov        dword ptr [ecx+24],edx
 0045E9C8    call       0045EA15
 0045E9CD    mov        eax,esi
 0045E9CF    pop        esi
 0045E9D0    ret
*}
//end;

//0045E9D1
//function sub_0045E9D1(?:?; ?:?; ?:?):?;
//begin
{*
 0045E9D1    mov        eax,dword ptr [ecx+8]
 0045E9D4    push       ebx
 0045E9D5    push       esi
 0045E9D6    mov        esi,dword ptr [esp+0C]
 0045E9DA    push       edi
 0045E9DB    mov        edi,dword ptr [esp+14]
 0045E9DF    mov        edx,esi
 0045E9E1    mov        ebx,edi
 0045E9E3    shl        edx,4
 0045E9E6    shl        ebx,4
 0045E9E9    mov        edx,dword ptr [edx+eax]
 0045E9EC    mov        eax,dword ptr [ebx+eax]
 0045E9EF    cmp        edx,eax
>0045E9F1    jb         0045EA0A
>0045E9F3    jne        0045EA02
 0045E9F5    mov        ecx,dword ptr [ecx+14]
 0045E9F8    mov        al,byte ptr [ecx+esi]
 0045E9FB    mov        dl,byte ptr [ecx+edi]
 0045E9FE    cmp        al,dl
>0045EA00    jbe        0045EA0A
 0045EA02    pop        edi
 0045EA03    pop        esi
 0045EA04    xor        eax,eax
 0045EA06    pop        ebx
 0045EA07    ret        8
 0045EA0A    pop        edi
 0045EA0B    pop        esi
 0045EA0C    mov        eax,1
 0045EA11    pop        ebx
 0045EA12    ret        8
*}
//end;

//0045EA15
//procedure sub_0045EA15(?:?; ?:?; ?:?);
//begin
{*
 0045EA15    push       ebx
 0045EA16    mov        ebx,dword ptr [esp+8]
 0045EA1A    push       ebp
 0045EA1B    push       esi
 0045EA1C    mov        esi,ecx
 0045EA1E    push       edi
 0045EA1F    lea        edi,[ebx+ebx]
 0045EA22    mov        eax,dword ptr [esi+0C]
 0045EA25    mov        ecx,dword ptr [eax+ebx*4]
 0045EA28    mov        eax,dword ptr [esi+24]
 0045EA2B    cmp        edi,eax
 0045EA2D    mov        dword ptr [esp+14],ecx
>0045EA31    ja         0045EA94
>0045EA33    jae        0045EA4D
 0045EA35    mov        eax,dword ptr [esi+0C]
 0045EA38    mov        ecx,dword ptr [eax+edi*4]
 0045EA3B    mov        edx,dword ptr [eax+edi*4+4]
 0045EA3F    push       ecx
 0045EA40    push       edx
 0045EA41    mov        ecx,esi
 0045EA43    call       0045E9D1
 0045EA48    test       al,al
>0045EA4A    je         0045EA4D
 0045EA4C    inc        edi
 0045EA4D    mov        eax,dword ptr [esi+0C]
 0045EA50    mov        ecx,dword ptr [esp+14]
 0045EA54    mov        ebp,dword ptr [eax+edi*4]
 0045EA57    push       ebp
 0045EA58    push       ecx
 0045EA59    mov        ecx,esi
 0045EA5B    call       0045E9D1
 0045EA60    mov        edx,dword ptr [esi+0C]
 0045EA63    test       al,al
>0045EA65    jne        0045EA86
 0045EA67    mov        dword ptr [edx+ebx*4],ebp
 0045EA6A    mov        eax,dword ptr [esi+24]
 0045EA6D    mov        ebx,edi
 0045EA6F    shl        edi,1
 0045EA71    cmp        edi,eax
<0045EA73    jbe        0045EA33
 0045EA75    mov        eax,dword ptr [esi+0C]
 0045EA78    mov        ecx,dword ptr [esp+14]
 0045EA7C    pop        edi
 0045EA7D    pop        esi
 0045EA7E    mov        dword ptr [eax+ebx*4],ecx
 0045EA81    pop        ebp
 0045EA82    pop        ebx
 0045EA83    ret        4
 0045EA86    mov        eax,dword ptr [esp+14]
 0045EA8A    pop        edi
 0045EA8B    pop        esi
 0045EA8C    mov        dword ptr [edx+ebx*4],eax
 0045EA8F    pop        ebp
 0045EA90    pop        ebx
 0045EA91    ret        4
 0045EA94    mov        edx,dword ptr [esi+0C]
 0045EA97    pop        edi
 0045EA98    pop        esi
 0045EA99    pop        ebp
 0045EA9A    mov        dword ptr [edx+ebx*4],ecx
 0045EA9D    pop        ebx
 0045EA9E    ret        4
*}
//end;

//0045EAA1
//procedure sub_0045EAA1(?:?; ?:?; ?:?);
//begin
{*
 0045EAA1    push       ebx
 0045EAA2    push       ebp
 0045EAA3    mov        edx,ecx
 0045EAA5    push       esi
 0045EAA6    push       edi
 0045EAA7    mov        ecx,10
 0045EAAC    lea        edi,[edx+28]
 0045EAAF    xor        eax,eax
 0045EAB1    rep stos   dword ptr [edi]
 0045EAB3    mov        ecx,dword ptr [edx+0C]
 0045EAB6    mov        eax,dword ptr [esp+18]
 0045EABA    mov        esi,dword ptr [edx+8]
 0045EABD    xor        ebx,ebx
 0045EABF    mov        ecx,dword ptr [ecx+eax*4]
 0045EAC2    shl        ecx,4
 0045EAC5    inc        eax
 0045EAC6    mov        dword ptr [ecx+esi+0C],ebx
 0045EACA    mov        ecx,dword ptr [edx+10]
 0045EACD    cmp        eax,ecx
 0045EACF    mov        dword ptr [esp+18],eax
>0045EAD3    jae        0045EBF4
>0045EAD9    jmp        0045EADF
 0045EADB    mov        eax,dword ptr [esp+18]
 0045EADF    mov        ecx,dword ptr [edx+0C]
 0045EAE2    mov        ebp,dword ptr [edx+20]
 0045EAE5    mov        edi,dword ptr [ecx+eax*4]
 0045EAE8    mov        ecx,dword ptr [edx+8]
 0045EAEB    mov        esi,edi
 0045EAED    shl        esi,4
 0045EAF0    mov        eax,dword ptr [esi+ecx+8]
 0045EAF4    shl        eax,4
 0045EAF7    mov        eax,dword ptr [eax+ecx+0C]
 0045EAFB    inc        eax
 0045EAFC    cmp        eax,ebp
>0045EAFE    jbe        0045EB03
 0045EB00    mov        eax,ebp
 0045EB02    inc        ebx
 0045EB03    mov        dword ptr [esi+ecx+0C],eax
 0045EB07    mov        ecx,dword ptr [esp+14]
 0045EB0B    cmp        edi,ecx
>0045EB0D    ja         0045EB3F
 0045EB0F    mov        ebp,dword ptr [edx+eax*4+28]
 0045EB13    inc        ebp
 0045EB14    mov        dword ptr [edx+eax*4+28],ebp
 0045EB18    mov        ebp,dword ptr [edx+18]
 0045EB1B    test       ebp,ebp
>0045EB1D    je         0045EB2F
 0045EB1F    mov        ecx,dword ptr [edx+1C]
 0045EB22    cmp        edi,ecx
>0045EB24    jb         0045EB2F
 0045EB26    sub        ebp,ecx
 0045EB28    xor        ecx,ecx
 0045EB2A    mov        cl,byte ptr [edi+ebp]
>0045EB2D    jmp        0045EB31
 0045EB2F    xor        ecx,ecx
 0045EB31    mov        edi,dword ptr [edx+8]
 0045EB34    add        ecx,eax
 0045EB36    mov        eax,dword ptr [edi+esi]
 0045EB39    imul       eax,ecx
 0045EB3C    add        dword ptr [edx+68],eax
 0045EB3F    mov        eax,dword ptr [esp+18]
 0045EB43    mov        ecx,dword ptr [edx+10]
 0045EB46    inc        eax
 0045EB47    cmp        eax,ecx
 0045EB49    mov        dword ptr [esp+18],eax
<0045EB4D    jb         0045EADB
 0045EB4F    test       ebx,ebx
>0045EB51    je         0045EBF4
 0045EB57    mov        esi,2
 0045EB5C    mov        eax,dword ptr [edx+20]
 0045EB5F    dec        eax
 0045EB60    mov        edi,dword ptr [edx+eax*4+28]
 0045EB64    lea        ecx,[edx+eax*4+28]
 0045EB68    test       edi,edi
>0045EB6A    jne        0045EB77
 0045EB6C    mov        edi,dword ptr [ecx-4]
 0045EB6F    sub        ecx,4
 0045EB72    dec        eax
 0045EB73    test       edi,edi
<0045EB75    je         0045EB6C
 0045EB77    mov        ecx,dword ptr [edx+eax*4+28]
 0045EB7B    sub        ebx,esi
 0045EB7D    dec        ecx
 0045EB7E    mov        dword ptr [edx+eax*4+28],ecx
 0045EB82    mov        ebp,dword ptr [edx+eax*4+2C]
 0045EB86    add        ebp,esi
 0045EB88    mov        dword ptr [edx+eax*4+2C],ebp
 0045EB8C    mov        ecx,dword ptr [edx+20]
 0045EB8F    mov        edi,dword ptr [edx+ecx*4+28]
 0045EB93    lea        eax,[edx+ecx*4+28]
 0045EB97    dec        edi
 0045EB98    test       ebx,ebx
 0045EB9A    mov        dword ptr [eax],edi
<0045EB9C    jg         0045EB5C
 0045EB9E    mov        ecx,dword ptr [edx+20]
 0045EBA1    test       ecx,ecx
>0045EBA3    je         0045EBF4
 0045EBA5    lea        ebx,[edx+ecx*4+28]
 0045EBA9    mov        edi,dword ptr [ebx]
 0045EBAB    test       edi,edi
>0045EBAD    je         0045EBEC
 0045EBAF    mov        eax,dword ptr [esp+18]
 0045EBB3    mov        esi,dword ptr [edx+0C]
 0045EBB6    dec        eax
 0045EBB7    mov        dword ptr [esp+18],eax
 0045EBBB    mov        eax,dword ptr [esi+eax*4]
 0045EBBE    mov        esi,dword ptr [esp+14]
 0045EBC2    cmp        eax,esi
>0045EBC4    ja         0045EBE8
 0045EBC6    mov        esi,dword ptr [edx+8]
 0045EBC9    shl        eax,4
 0045EBCC    add        eax,esi
 0045EBCE    mov        esi,dword ptr [eax+0C]
 0045EBD1    cmp        esi,ecx
>0045EBD3    je         0045EBE7
 0045EBD5    mov        ebp,ecx
 0045EBD7    sub        ebp,esi
 0045EBD9    mov        esi,dword ptr [edx+68]
 0045EBDC    imul       ebp,dword ptr [eax]
 0045EBDF    add        esi,ebp
 0045EBE1    mov        dword ptr [edx+68],esi
 0045EBE4    mov        dword ptr [eax+0C],ecx
 0045EBE7    dec        edi
 0045EBE8    test       edi,edi
<0045EBEA    jne        0045EBAF
 0045EBEC    dec        ecx
 0045EBED    sub        ebx,4
 0045EBF0    test       ecx,ecx
<0045EBF2    jne        0045EBA9
 0045EBF4    pop        edi
 0045EBF5    pop        esi
 0045EBF6    pop        ebp
 0045EBF7    pop        ebx
 0045EBF8    ret        8
*}
//end;

//0045EBFB
procedure sub_0045EBFB;
begin
{*
 0045EBFB    sub        esp,40
 0045EBFE    xor        eax,eax
 0045EC00    lea        edx,[ecx+28]
 0045EC03    push       ebx
 0045EC04    push       esi
 0045EC05    push       edi
 0045EC06    lea        esi,[esp+10]
 0045EC0A    mov        edi,0F
 0045EC0F    mov        ebx,dword ptr [edx]
 0045EC11    add        edx,4
 0045EC14    add        ebx,eax
 0045EC16    add        esi,4
 0045EC19    shl        ebx,1
 0045EC1B    mov        eax,ebx
 0045EC1D    dec        edi
 0045EC1E    mov        dword ptr [esi-4],eax
<0045EC21    jne        0045EC0F
 0045EC23    mov        edx,dword ptr [ecx+64]
 0045EC26    lea        eax,[edx+eax-1]
 0045EC2A    cmp        eax,7FFF
>0045EC2F    je         0045EC46
 0045EC31    mov        ecx,dword ptr ds:[46AC50]
 0045EC37    lea        edx,[esp+50]
 0045EC3B    push       46AD36
 0045EC40    push       edx
 0045EC41    mov        dword ptr [esp+58],ecx
 0045EC45    int        3
 0045EC46    mov        eax,dword ptr [esp+50]
 0045EC4A    xor        edi,edi
 0045EC4C    lea        ebx,[eax+1]
 0045EC4F    mov        edx,dword ptr [ecx+8]
 0045EC52    lea        eax,[edi+edx]
 0045EC55    mov        edx,dword ptr [edi+edx+0C]
 0045EC59    test       edx,edx
>0045EC5B    je         0045EC6B
 0045EC5D    mov        esi,dword ptr [esp+edx*4+0C]
 0045EC61    lea        edx,[esp+edx*4+0C]
 0045EC65    mov        dword ptr [eax+4],esi
 0045EC68    inc        esi
 0045EC69    mov        dword ptr [edx],esi
 0045EC6B    add        edi,10
 0045EC6E    dec        ebx
<0045EC6F    jne        0045EC4F
 0045EC71    pop        edi
 0045EC72    pop        esi
 0045EC73    pop        ebx
 0045EC74    add        esp,40
 0045EC77    ret        4
*}
end;

//0045EC7A
//procedure sub_0045EC7A(?:?; ?:?; ?:?);
//begin
{*
 0045EC7A    sub        esp,14
 0045EC7D    push       ebx
 0045EC7E    push       ebp
 0045EC7F    push       esi
 0045EC80    mov        esi,ecx
 0045EC82    push       edi
 0045EC83    xor        ebx,ebx
 0045EC85    mov        ecx,dword ptr [esi+4]
 0045EC88    or         edi,0FFFFFFFF
 0045EC8B    xor        eax,eax
 0045EC8D    cmp        ecx,ebx
 0045EC8F    mov        dword ptr [esp+10],edi
 0045EC93    mov        dword ptr [esi+24],ebx
>0045EC96    jbe        0045ECCD
 0045EC98    xor        edx,edx
 0045EC9A    mov        ecx,dword ptr [esi+8]
 0045EC9D    add        ecx,edx
 0045EC9F    cmp        dword ptr [ecx],ebx
>0045ECA1    je         0045ECBB
 0045ECA3    mov        ecx,dword ptr [esi+24]
 0045ECA6    mov        ebp,dword ptr [esi+0C]
 0045ECA9    inc        ecx
 0045ECAA    mov        edi,eax
 0045ECAC    mov        dword ptr [esi+24],ecx
 0045ECAF    mov        dword ptr [ebp+ecx*4],eax
 0045ECB3    mov        ecx,dword ptr [esi+14]
 0045ECB6    mov        byte ptr [ecx+eax],bl
>0045ECB9    jmp        0045ECBE
 0045ECBB    mov        dword ptr [ecx+0C],ebx
 0045ECBE    mov        ecx,dword ptr [esi+4]
 0045ECC1    inc        eax
 0045ECC2    add        edx,10
 0045ECC5    cmp        eax,ecx
<0045ECC7    jb         0045EC9A
 0045ECC9    mov        dword ptr [esp+10],edi
 0045ECCD    mov        ecx,dword ptr [esi+24]
 0045ECD0    cmp        ecx,2
>0045ECD3    jae        0045ED13
 0045ECD5    cmp        edi,2
>0045ECD8    jge        0045ECDF
 0045ECDA    inc        edi
 0045ECDB    mov        eax,edi
>0045ECDD    jmp        0045ECE1
 0045ECDF    xor        eax,eax
 0045ECE1    mov        edx,dword ptr [esi+0C]
 0045ECE4    inc        ecx
 0045ECE5    mov        dword ptr [esi+24],ecx
 0045ECE8    mov        dword ptr [edx+ecx*4],eax
 0045ECEB    mov        edx,dword ptr [esi+8]
 0045ECEE    mov        ecx,eax
 0045ECF0    shl        ecx,4
 0045ECF3    mov        dword ptr [ecx+edx],1
 0045ECFA    mov        ecx,dword ptr [esi+14]
 0045ECFD    mov        byte ptr [ecx+eax],bl
 0045ED00    mov        ecx,dword ptr [esi+68]
 0045ED03    dec        ecx
 0045ED04    mov        dword ptr [esi+68],ecx
 0045ED07    mov        ecx,dword ptr [esi+24]
 0045ED0A    cmp        ecx,2
<0045ED0D    jb         0045ECD5
 0045ED0F    mov        dword ptr [esp+10],edi
 0045ED13    mov        edi,dword ptr [esi+24]
 0045ED16    shr        edi,1
 0045ED18    cmp        edi,1
>0045ED1B    jb         0045ED2B
 0045ED1D    push       edi
 0045ED1E    mov        ecx,esi
 0045ED20    call       0045EA15
 0045ED25    dec        edi
 0045ED26    cmp        edi,1
<0045ED29    jae        0045ED1D
 0045ED2B    mov        ebx,dword ptr [esi+4]
 0045ED2E    mov        dword ptr [esp+14],ebx
 0045ED32    lea        ebp,[ebx+ebx+1]
 0045ED36    shl        ebx,4
 0045ED39    mov        dword ptr [esp+18],ebx
 0045ED3D    mov        ecx,esi
 0045ED3F    call       0045E9AF
 0045ED44    mov        edx,dword ptr [esi+0C]
 0045ED47    dec        ebp
 0045ED48    dec        ebp
 0045ED49    mov        edi,eax
 0045ED4B    mov        ecx,dword ptr [edx+4]
 0045ED4E    mov        dword ptr [edx+ebp*4+4],eax
 0045ED52    mov        edx,dword ptr [esi+0C]
 0045ED55    mov        dword ptr [esp+1C],ecx
 0045ED59    mov        dword ptr [esp+20],eax
 0045ED5D    mov        dword ptr [edx+ebp*4],ecx
 0045ED60    mov        edx,dword ptr [esi+8]
 0045ED63    shl        ecx,4
 0045ED66    shl        edi,4
 0045ED69    mov        eax,dword ptr [ecx+edx]
 0045ED6C    add        eax,dword ptr [edx+edi]
 0045ED6F    mov        dword ptr [ebx+edx],eax
 0045ED72    mov        eax,dword ptr [esi+14]
 0045ED75    mov        edx,dword ptr [esp+1C]
 0045ED79    mov        ebx,dword ptr [esp+20]
 0045ED7D    mov        dl,byte ptr [eax+edx]
 0045ED80    mov        bl,byte ptr [eax+ebx]
 0045ED83    cmp        bl,dl
>0045ED85    ja         0045ED89
 0045ED87    mov        bl,dl
 0045ED89    mov        edx,dword ptr [esp+14]
 0045ED8D    inc        bl
 0045ED8F    push       1
 0045ED91    mov        byte ptr [eax+edx],bl
 0045ED94    mov        eax,dword ptr [esi+8]
 0045ED97    mov        ebx,dword ptr [esp+1C]
 0045ED9B    mov        dword ptr [eax+ecx+8],edx
 0045ED9F    mov        ecx,dword ptr [esi+8]
 0045EDA2    add        ebx,10
 0045EDA5    mov        dword ptr [ecx+edi+8],edx
 0045EDA9    mov        eax,dword ptr [esi+0C]
 0045EDAC    mov        ecx,esi
 0045EDAE    mov        dword ptr [esp+1C],ebx
 0045EDB2    mov        dword ptr [eax+4],edx
 0045EDB5    inc        edx
 0045EDB6    mov        dword ptr [esp+18],edx
 0045EDBA    call       0045EA15
 0045EDBF    cmp        dword ptr [esi+24],2
<0045EDC3    jae        0045ED3D
 0045EDC9    mov        eax,dword ptr [esi+0C]
 0045EDCC    mov        edi,dword ptr [esp+10]
 0045EDD0    dec        ebp
 0045EDD1    mov        ecx,dword ptr [eax+4]
 0045EDD4    push       ebp
 0045EDD5    mov        dword ptr [eax+ebp*4],ecx
 0045EDD8    push       edi
 0045EDD9    mov        ecx,esi
 0045EDDB    call       0045EAA1
 0045EDE0    push       edi
 0045EDE1    mov        ecx,esi
 0045EDE3    call       0045EBFB
 0045EDE8    mov        ecx,dword ptr [esi+4]
 0045EDEB    xor        eax,eax
 0045EDED    test       ecx,ecx
>0045EDEF    jbe        0045EE0D
 0045EDF1    mov        edi,dword ptr [esp+28]
 0045EDF5    xor        ecx,ecx
 0045EDF7    mov        edx,dword ptr [esi+8]
 0045EDFA    inc        eax
 0045EDFB    mov        dl,byte ptr [edx+ecx+0C]
 0045EDFF    add        ecx,10
 0045EE02    mov        byte ptr [eax+edi-1],dl
 0045EE06    mov        edx,dword ptr [esi+4]
 0045EE09    cmp        eax,edx
<0045EE0B    jb         0045EDF7
 0045EE0D    pop        edi
 0045EE0E    pop        esi
 0045EE0F    pop        ebp
 0045EE10    pop        ebx
 0045EE11    add        esp,14
 0045EE14    ret        4
*}
//end;

//0045EE17
procedure sub_0045EE17;
begin
{*
 0045EE17    mov        eax,dword ptr [esp+4]
 0045EE1B    mov        edx,dword ptr [ecx+8]
 0045EE1E    shl        eax,4
 0045EE21    add        eax,edx
 0045EE23    push       esi
 0045EE24    push       edi
 0045EE25    mov        esi,dword ptr [eax+0C]
 0045EE28    mov        edi,dword ptr [eax+4]
 0045EE2B    mov        eax,dword ptr [ecx]
 0045EE2D    test       esi,esi
>0045EE2F    jbe        0045EE82
 0045EE31    push       ebx
 0045EE32    mov        ebx,dword ptr [eax+4]
 0045EE35    cmp        esi,ebx
>0045EE37    jae        0045EE3B
 0045EE39    mov        ebx,esi
 0045EE3B    mov        dl,byte ptr [eax+8]
 0045EE3E    mov        cl,bl
 0045EE40    shl        dl,cl
 0045EE42    sub        esi,ebx
 0045EE44    mov        ecx,esi
 0045EE46    mov        byte ptr [eax+8],dl
 0045EE49    mov        edx,edi
 0045EE4B    shr        edx,cl
 0045EE4D    mov        cl,byte ptr [eax+8]
 0045EE50    or         cl,dl
 0045EE52    mov        byte ptr [esp+10],cl
 0045EE56    mov        byte ptr [eax+8],cl
 0045EE59    mov        ecx,esi
 0045EE5B    shl        edx,cl
 0045EE5D    mov        ecx,dword ptr [eax+4]
 0045EE60    sub        edi,edx
 0045EE62    sub        ecx,ebx
 0045EE64    mov        dword ptr [eax+4],ecx
>0045EE67    jne        0045EE7D
 0045EE69    mov        ecx,dword ptr [eax]
 0045EE6B    mov        dl,byte ptr [esp+10]
 0045EE6F    mov        byte ptr [ecx],dl
 0045EE71    mov        ecx,dword ptr [eax]
 0045EE73    inc        ecx
 0045EE74    mov        dword ptr [eax+4],8
 0045EE7B    mov        dword ptr [eax],ecx
 0045EE7D    test       esi,esi
<0045EE7F    ja         0045EE32
 0045EE81    pop        ebx
 0045EE82    pop        edi
 0045EE83    pop        esi
 0045EE84    ret        4
*}
end;

//0045EE87
procedure sub_0045EE87;
begin
{*
 0045EE87    mov        eax,dword ptr [esp+4]
 0045EE8B    mov        edx,dword ptr [esp+8]
 0045EE8F    mov        dword ptr [ecx+4],eax
 0045EE92    mov        dword ptr [ecx+8],0
 0045EE99    mov        dword ptr [ecx],edx
 0045EE9B    ret        8
*}
end;

//0045EE9E
//function sub_0045EE9E(?:?; ?:?; ?:?):?;
//begin
{*
 0045EE9E    mov        edx,dword ptr [ecx+8]
 0045EEA1    push       ebx
 0045EEA2    push       ebp
 0045EEA3    mov        eax,dword ptr [ecx]
 0045EEA5    push       esi
 0045EEA6    mov        esi,dword ptr [esp+18]
 0045EEAA    push       edi
 0045EEAB    mov        edi,dword ptr [esp+14]
 0045EEAF    lea        ebx,[edx+edi]
 0045EEB2    add        ebx,esi
 0045EEB4    cmp        ebx,eax
>0045EEB6    jbe        0045EEBE
 0045EEB8    sub        eax,edx
 0045EEBA    sub        eax,edi
 0045EEBC    mov        esi,eax
 0045EEBE    mov        ecx,dword ptr [ecx+4]
 0045EEC1    mov        ebp,dword ptr [esp+18]
 0045EEC5    add        ecx,edx
 0045EEC7    inc        ebp
 0045EEC8    add        ecx,edi
 0045EECA    xor        eax,eax
 0045EECC    test       esi,esi
>0045EECE    jbe        0045EEE1
 0045EED0    mov        bl,byte ptr [eax+ecx]
 0045EED3    mov        edx,eax
 0045EED5    sub        edx,ebp
 0045EED7    cmp        bl,byte ptr [edx+ecx]
>0045EEDA    jne        0045EEE1
 0045EEDC    inc        eax
 0045EEDD    cmp        eax,esi
<0045EEDF    jb         0045EED0
 0045EEE1    pop        edi
 0045EEE2    pop        esi
 0045EEE3    pop        ebp
 0045EEE4    pop        ebx
 0045EEE5    ret        0C
*}
//end;

//0045EEEC
//function sub_0045EEEC:?;
//begin
{*
 0045EEEC    mov        edx,dword ptr [esp+0C]
 0045EEF0    mov        eax,dword ptr [esp+8]
 0045EEF4    mov        dword ptr [ecx+10],edx
 0045EEF7    mov        edx,dword ptr [esp+10]
 0045EEFB    mov        dword ptr [ecx+0C],eax
 0045EEFE    mov        dword ptr [ecx+2C],edx
 0045EF01    add        eax,edx
 0045EF03    mov        edx,dword ptr [esp+4]
 0045EF07    mov        dword ptr [ecx+14],edx
 0045EF0A    add        edx,40000
 0045EF10    mov        dword ptr [ecx+20],edx
 0045EF13    mov        dword ptr [ecx+30],eax
 0045EF16    lea        edx,[edx+eax*4]
 0045EF19    mov        dword ptr [ecx+24],edx
 0045EF1C    lea        eax,[edx+eax*4]
 0045EF1F    ret        10
*}
//end;

//0045EF22
procedure sub_0045EF22;
begin
{*
 0045EF22    mov        eax,dword ptr [esp+8]
 0045EF26    push       esi
 0045EF27    mov        esi,ecx
 0045EF29    push       eax
 0045EF2A    mov        ecx,dword ptr [esp+0C]
 0045EF2E    push       ecx
 0045EF2F    mov        ecx,esi
 0045EF31    call       0045EE87
 0045EF36    xor        eax,eax
 0045EF38    mov        edx,dword ptr [esi+14]
 0045EF3B    add        eax,4
 0045EF3E    cmp        eax,40000
 0045EF43    mov        dword ptr [edx+eax-4],0FFFFFFFF
<0045EF4B    jl         0045EF38
 0045EF4D    mov        eax,dword ptr [esi+20]
 0045EF50    mov        ecx,dword ptr [esi+24]
 0045EF53    mov        dword ptr [esi+18],eax
 0045EF56    mov        eax,dword ptr [esi]
 0045EF58    cmp        eax,2
 0045EF5B    mov        dword ptr [esi+1C],ecx
>0045EF5E    jb         0045EF6E
 0045EF60    mov        edx,dword ptr [esi+30]
 0045EF63    dec        eax
 0045EF64    mov        dword ptr [esi+28],eax
 0045EF67    mov        dword ptr [esi+34],edx
 0045EF6A    pop        esi
 0045EF6B    ret        8
 0045EF6E    mov        eax,dword ptr [esi+30]
 0045EF71    mov        dword ptr [esi+28],0
 0045EF78    mov        dword ptr [esi+34],eax
 0045EF7B    pop        esi
 0045EF7C    ret        8
*}
end;

//0045EF7F
//procedure sub_0045EF7F(?:?; ?:?; ?:?);
//begin
{*
 0045EF7F    sub        esp,24
 0045EF82    push       ebx
 0045EF83    mov        ebx,ecx
 0045EF85    push       ebp
 0045EF86    push       esi
 0045EF87    mov        eax,dword ptr [ebx+8]
 0045EF8A    mov        ecx,dword ptr [ebx+28]
 0045EF8D    cmp        eax,ecx
 0045EF8F    push       edi
>0045EF90    jae        0045F1D6
 0045EF96    mov        ecx,dword ptr [ebx+0C]
 0045EF99    cmp        eax,ecx
>0045EF9B    jbe        0045EFA7
 0045EF9D    mov        edi,eax
 0045EF9F    sub        edi,ecx
 0045EFA1    mov        dword ptr [esp+30],edi
>0045EFA5    jmp        0045EFB3
 0045EFA7    mov        dword ptr [esp+30],0
 0045EFAF    mov        edi,dword ptr [esp+30]
 0045EFB3    mov        ecx,dword ptr [ebx+4]
 0045EFB6    mov        edx,dword ptr [ebx+14]
 0045EFB9    mov        esi,eax
 0045EFBB    add        esi,ecx
 0045EFBD    xor        ecx,ecx
 0045EFBF    mov        dword ptr [esp+2C],esi
 0045EFC3    mov        ch,byte ptr [esi+1]
 0045EFC6    mov        cl,byte ptr [esi]
 0045EFC8    mov        esi,dword ptr [edx+ecx*4]
 0045EFCB    cmp        esi,edi
 0045EFCD    mov        dword ptr [edx+ecx*4],eax
 0045EFD0    lea        edx,[edx+ecx*4]
>0045EFD3    jb         0045F1BC
 0045EFD9    cmp        esi,0FFFFFFFF
>0045EFDC    je         0045F1BC
 0045EFE2    mov        eax,dword ptr [ebx+8]
 0045EFE5    mov        edx,dword ptr [ebx+1C]
 0045EFE8    lea        ecx,[eax*4+0]
 0045EFEF    add        edx,ecx
 0045EFF1    mov        dword ptr [esp+14],edx
 0045EFF5    mov        edx,dword ptr [ebx+18]
 0045EFF8    add        edx,ecx
 0045EFFA    mov        ecx,dword ptr [ebx+10]
 0045EFFD    mov        dword ptr [esp+28],edx
 0045F001    mov        edx,dword ptr [ebx]
 0045F003    lea        edi,[ecx+eax]
 0045F006    cmp        edi,edx
>0045F008    ja         0045F010
 0045F00A    mov        dword ptr [esp+1C],ecx
>0045F00E    jmp        0045F016
 0045F010    sub        edx,eax
 0045F012    mov        dword ptr [esp+1C],edx
 0045F016    mov        ecx,dword ptr [esp+38]
 0045F01A    mov        edx,2
 0045F01F    sub        eax,esi
 0045F021    mov        edi,edx
 0045F023    dec        eax
 0045F024    mov        dword ptr [esp+20],edi
 0045F028    mov        dword ptr [esp+24],edx
 0045F02C    mov        dword ptr [esp+18],edx
 0045F030    mov        dword ptr [esp+10],edx
 0045F034    mov        dword ptr [ecx+8],eax
 0045F037    mov        ecx,dword ptr [ebx+4]
 0045F03A    mov        eax,dword ptr [esp+1C]
 0045F03E    mov        ebp,esi
 0045F040    add        ebp,ecx
 0045F042    cmp        edx,eax
>0045F044    jae        0045F10C
 0045F04A    mov        eax,dword ptr [esp+2C]
 0045F04E    mov        ecx,dword ptr [esp+2C]
 0045F052    lea        edi,[edx+eax]
 0045F055    mov        eax,ebp
 0045F057    sub        eax,ecx
 0045F059    mov        cl,byte ptr [eax+edi]
 0045F05C    cmp        cl,byte ptr [edi]
>0045F05E    jne        0045F073
 0045F060    mov        ecx,dword ptr [esp+1C]
 0045F064    inc        edx
 0045F065    inc        edi
 0045F066    cmp        edx,ecx
<0045F068    jb         0045F059
 0045F06A    mov        edi,dword ptr [esp+20]
>0045F06E    jmp        0045F108
 0045F073    mov        edi,dword ptr [esp+20]
 0045F077    cmp        edx,edi
>0045F079    jbe        0045F0A2
 0045F07B    mov        eax,dword ptr [ebx+8]
 0045F07E    sub        eax,esi
 0045F080    dec        eax
 0045F081    inc        edi
 0045F082    cmp        edi,edx
>0045F084    ja         0045F09C
 0045F086    mov        ecx,dword ptr [esp+38]
 0045F08A    lea        ecx,[ecx+edi*4]
 0045F08D    mov        dword ptr [esp+20],ecx
 0045F091    mov        ecx,edx
 0045F093    sub        ecx,edi
 0045F095    mov        edi,dword ptr [esp+20]
 0045F099    inc        ecx
 0045F09A    rep stos   dword ptr [edi]
 0045F09C    mov        edi,edx
 0045F09E    mov        dword ptr [esp+20],edi
 0045F0A2    mov        ecx,dword ptr [esp+2C]
 0045F0A6    mov        al,byte ptr [edx+ebp]
 0045F0A9    cmp        al,byte ptr [edx+ecx]
>0045F0AC    jae        0045F0DA
 0045F0AE    mov        eax,dword ptr [esp+28]
 0045F0B2    mov        dword ptr [eax],esi
 0045F0B4    mov        ecx,dword ptr [ebx+1C]
 0045F0B7    mov        eax,dword ptr [esp+24]
 0045F0BB    lea        esi,[ecx+esi*4]
 0045F0BE    cmp        edx,eax
 0045F0C0    mov        dword ptr [esp+28],esi
 0045F0C4    mov        esi,dword ptr [esi]
>0045F0C6    jbe        0045F108
 0045F0C8    mov        eax,dword ptr [esp+18]
 0045F0CC    mov        dword ptr [esp+24],edx
 0045F0D0    cmp        edx,eax
>0045F0D2    jb         0045F104
 0045F0D4    mov        dword ptr [esp+10],eax
>0045F0D8    jmp        0045F108
 0045F0DA    mov        eax,dword ptr [esp+14]
 0045F0DE    mov        dword ptr [eax],esi
 0045F0E0    mov        ecx,dword ptr [ebx+18]
 0045F0E3    mov        eax,dword ptr [esp+18]
 0045F0E7    lea        esi,[ecx+esi*4]
 0045F0EA    cmp        edx,eax
 0045F0EC    mov        dword ptr [esp+14],esi
 0045F0F0    mov        esi,dword ptr [esi]
>0045F0F2    jbe        0045F108
 0045F0F4    mov        eax,dword ptr [esp+24]
 0045F0F8    mov        dword ptr [esp+18],edx
 0045F0FC    cmp        eax,edx
 0045F0FE    mov        dword ptr [esp+10],eax
>0045F102    jb         0045F108
 0045F104    mov        dword ptr [esp+10],edx
 0045F108    cmp        edx,dword ptr [esp+1C]
>0045F10C    jne        0045F164
 0045F10E    mov        eax,dword ptr [ebx+8]
 0045F111    sub        eax,esi
 0045F113    dec        eax
 0045F114    inc        edi
 0045F115    cmp        edi,edx
>0045F117    ja         0045F129
 0045F119    mov        ecx,dword ptr [esp+38]
 0045F11D    lea        ebp,[ecx+edi*4]
 0045F120    mov        ecx,edx
 0045F122    sub        ecx,edi
 0045F124    mov        edi,ebp
 0045F126    inc        ecx
 0045F127    rep stos   dword ptr [edi]
 0045F129    mov        eax,dword ptr [ebx+10]
 0045F12C    mov        edi,edx
 0045F12E    cmp        edx,eax
 0045F130    mov        dword ptr [esp+20],edi
>0045F134    jae        0045F178
 0045F136    mov        eax,dword ptr [esp+14]
 0045F13A    mov        dword ptr [eax],esi
 0045F13C    mov        ecx,dword ptr [ebx+18]
 0045F13F    mov        eax,dword ptr [esp+18]
 0045F143    lea        esi,[ecx+esi*4]
 0045F146    cmp        edx,eax
 0045F148    mov        dword ptr [esp+14],esi
 0045F14C    mov        esi,dword ptr [esi]
>0045F14E    jbe        0045F164
 0045F150    mov        eax,dword ptr [esp+24]
 0045F154    mov        dword ptr [esp+18],edx
 0045F158    cmp        eax,edx
 0045F15A    mov        dword ptr [esp+10],eax
>0045F15E    jb         0045F164
 0045F160    mov        dword ptr [esp+10],edx
 0045F164    cmp        esi,dword ptr [esp+30]
>0045F168    jb         0045F19C
 0045F16A    cmp        esi,0FFFFFFFF
>0045F16D    je         0045F19C
 0045F16F    mov        edx,dword ptr [esp+10]
<0045F173    jmp        0045F037
 0045F178    mov        eax,dword ptr [ebx+1C]
 0045F17B    pop        edi
 0045F17C    mov        ecx,dword ptr [eax+esi*4]
 0045F17F    mov        eax,dword ptr [esp+10]
 0045F183    mov        dword ptr [eax],ecx
 0045F185    mov        ecx,dword ptr [ebx+18]
 0045F188    mov        eax,dword ptr [ecx+esi*4]
 0045F18B    mov        ecx,dword ptr [esp+24]
 0045F18F    pop        esi
 0045F190    pop        ebp
 0045F191    mov        dword ptr [ecx],eax
 0045F193    mov        eax,edx
 0045F195    pop        ebx
 0045F196    add        esp,24
 0045F199    ret        4
 0045F19C    mov        edx,dword ptr [esp+14]
 0045F1A0    mov        eax,dword ptr [esp+28]
 0045F1A4    mov        dword ptr [edx],0FFFFFFFF
 0045F1AA    mov        dword ptr [eax],0FFFFFFFF
 0045F1B0    mov        eax,edi
 0045F1B2    pop        edi
 0045F1B3    pop        esi
 0045F1B4    pop        ebp
 0045F1B5    pop        ebx
 0045F1B6    add        esp,24
 0045F1B9    ret        4
 0045F1BC    mov        ecx,dword ptr [ebx+8]
 0045F1BF    mov        edx,dword ptr [ebx+18]
 0045F1C2    mov        dword ptr [edx+ecx*4],0FFFFFFFF
 0045F1C9    mov        eax,dword ptr [ebx+8]
 0045F1CC    mov        ecx,dword ptr [ebx+1C]
 0045F1CF    mov        dword ptr [ecx+eax*4],0FFFFFFFF
 0045F1D6    pop        edi
 0045F1D7    pop        esi
 0045F1D8    pop        ebp
 0045F1D9    mov        eax,1
 0045F1DE    pop        ebx
 0045F1DF    add        esp,24
 0045F1E2    ret        4
*}
//end;

//0045F1E5
//procedure sub_0045F1E5(?:?; ?:?; ?:?);
//begin
{*
 0045F1E5    sub        esp,20
 0045F1E8    push       ebx
 0045F1E9    push       ebp
 0045F1EA    push       esi
 0045F1EB    mov        esi,ecx
 0045F1ED    push       edi
 0045F1EE    mov        eax,dword ptr [esi+8]
 0045F1F1    mov        ecx,dword ptr [esi+28]
 0045F1F4    cmp        eax,ecx
>0045F1F6    jae        0045F3CF
 0045F1FC    mov        ecx,dword ptr [esi+0C]
 0045F1FF    cmp        eax,ecx
>0045F201    jbe        0045F209
 0045F203    mov        edi,eax
 0045F205    sub        edi,ecx
>0045F207    jmp        0045F20B
 0045F209    xor        edi,edi
 0045F20B    mov        edx,dword ptr [esi+4]
 0045F20E    mov        ecx,eax
 0045F210    add        ecx,edx
 0045F212    xor        edx,edx
 0045F214    mov        dword ptr [esp+24],ecx
 0045F218    mov        dword ptr [esp+28],edi
 0045F21C    mov        dh,byte ptr [ecx+1]
 0045F21F    mov        dl,byte ptr [ecx]
 0045F221    mov        ecx,edx
 0045F223    mov        edx,dword ptr [esi+14]
 0045F226    lea        ecx,[edx+ecx*4]
 0045F229    mov        edx,dword ptr [ecx]
 0045F22B    mov        dword ptr [ecx],eax
 0045F22D    cmp        edx,edi
>0045F22F    jb         0045F3B5
 0045F235    cmp        edx,0FFFFFFFF
>0045F238    je         0045F3B5
 0045F23E    mov        eax,dword ptr [esi+8]
 0045F241    mov        ebx,dword ptr [esi+1C]
 0045F244    mov        ecx,dword ptr [esi+18]
 0045F247    lea        edi,[eax*4+0]
 0045F24E    add        ebx,edi
 0045F250    add        ecx,edi
 0045F252    mov        edi,dword ptr [esi+10]
 0045F255    mov        dword ptr [esp+20],ecx
 0045F259    mov        ecx,dword ptr [esi]
 0045F25B    mov        dword ptr [esp+10],ebx
 0045F25F    lea        ebp,[edi+eax]
 0045F262    cmp        ebp,ecx
>0045F264    ja         0045F26C
 0045F266    mov        dword ptr [esp+1C],edi
>0045F26A    jmp        0045F272
 0045F26C    sub        ecx,eax
 0045F26E    mov        dword ptr [esp+1C],ecx
 0045F272    mov        ebp,2
 0045F277    mov        dword ptr [esp+14],ebp
 0045F27B    mov        dword ptr [esp+18],ebp
 0045F27F    mov        ecx,ebp
 0045F281    mov        eax,dword ptr [esi+4]
 0045F284    mov        edi,edx
 0045F286    add        edi,eax
 0045F288    cmp        ecx,dword ptr [esp+1C]
 0045F28C    mov        eax,ecx
>0045F28E    jae        0045F2C1
 0045F290    mov        ebx,dword ptr [esp+24]
 0045F294    lea        ebp,[ecx+ebx]
 0045F297    mov        ebx,edi
 0045F299    sub        ebx,dword ptr [esp+24]
 0045F29D    mov        dword ptr [esp+2C],ebx
>0045F2A1    jmp        0045F2A7
 0045F2A3    mov        ebx,dword ptr [esp+2C]
 0045F2A7    mov        bl,byte ptr [ebx+ebp]
 0045F2AA    cmp        bl,byte ptr [ebp]
>0045F2AD    jne        0045F30A
 0045F2AF    mov        ebx,dword ptr [esp+1C]
 0045F2B3    inc        eax
 0045F2B4    inc        ebp
 0045F2B5    cmp        eax,ebx
<0045F2B7    jb         0045F2A3
 0045F2B9    mov        ebx,dword ptr [esp+10]
 0045F2BD    mov        ebp,dword ptr [esp+14]
 0045F2C1    cmp        eax,dword ptr [esp+1C]
>0045F2C5    jne        0045F2F2
 0045F2C7    cmp        eax,dword ptr [esi+10]
>0045F2CA    jae        0045F381
 0045F2D0    mov        dword ptr [ebx],edx
 0045F2D2    mov        edi,dword ptr [esi+18]
 0045F2D5    lea        ebx,[edi+edx*4]
 0045F2D8    mov        edi,dword ptr [esp+18]
 0045F2DC    cmp        eax,edi
 0045F2DE    mov        dword ptr [esp+10],ebx
 0045F2E2    mov        edx,dword ptr [ebx]
>0045F2E4    jbe        0045F2F2
 0045F2E6    cmp        ebp,eax
 0045F2E8    mov        dword ptr [esp+18],eax
 0045F2EC    mov        ecx,ebp
>0045F2EE    jb         0045F2F2
 0045F2F0    mov        ecx,eax
 0045F2F2    cmp        edx,dword ptr [esp+28]
>0045F2F6    jb         0045F39D
 0045F2FC    cmp        edx,0FFFFFFFF
>0045F2FF    je         0045F39D
<0045F305    jmp        0045F281
 0045F30A    mov        bl,byte ptr [eax+edi]
 0045F30D    mov        edi,dword ptr [esp+24]
 0045F311    cmp        bl,byte ptr [eax+edi]
>0045F314    jae        0045F349
 0045F316    mov        edi,dword ptr [esp+20]
 0045F31A    mov        ebp,dword ptr [esp+14]
 0045F31E    cmp        eax,ebp
 0045F320    mov        dword ptr [edi],edx
 0045F322    mov        edi,dword ptr [esi+1C]
 0045F325    lea        edx,[edi+edx*4]
 0045F328    mov        dword ptr [esp+20],edx
 0045F32C    mov        edx,dword ptr [edx]
>0045F32E    jbe        0045F340
 0045F330    mov        ecx,dword ptr [esp+18]
 0045F334    mov        ebp,eax
 0045F336    cmp        eax,ecx
 0045F338    mov        dword ptr [esp+14],ebp
>0045F33C    jae        0045F340
 0045F33E    mov        ecx,eax
 0045F340    mov        ebx,dword ptr [esp+10]
<0045F344    jmp        0045F2C1
 0045F349    mov        edi,dword ptr [esp+10]
 0045F34D    mov        dword ptr [edi],edx
 0045F34F    mov        edi,dword ptr [esi+18]
 0045F352    lea        ebx,[edi+edx*4]
 0045F355    mov        edi,dword ptr [esp+18]
 0045F359    cmp        eax,edi
 0045F35B    mov        dword ptr [esp+10],ebx
 0045F35F    mov        edx,dword ptr [ebx]
<0045F361    jbe        0045F2BD
 0045F367    mov        ebp,dword ptr [esp+14]
 0045F36B    mov        dword ptr [esp+18],eax
 0045F36F    cmp        ebp,eax
>0045F371    jae        0045F37A
 0045F373    mov        ecx,ebp
<0045F375    jmp        0045F2C1
 0045F37A    mov        ecx,eax
<0045F37C    jmp        0045F2C1
 0045F381    mov        eax,dword ptr [esi+1C]
 0045F384    pop        edi
 0045F385    mov        ecx,dword ptr [eax+edx*4]
 0045F388    mov        dword ptr [ebx],ecx
 0045F38A    mov        eax,dword ptr [esi+18]
 0045F38D    pop        esi
 0045F38E    pop        ebp
 0045F38F    mov        ecx,dword ptr [eax+edx*4]
 0045F392    mov        edx,dword ptr [esp+14]
 0045F396    pop        ebx
 0045F397    mov        dword ptr [edx],ecx
 0045F399    add        esp,20
 0045F39C    ret
 0045F39D    mov        eax,dword ptr [esp+20]
 0045F3A1    pop        edi
 0045F3A2    pop        esi
 0045F3A3    mov        dword ptr [ebx],0FFFFFFFF
 0045F3A9    pop        ebp
 0045F3AA    mov        dword ptr [eax],0FFFFFFFF
 0045F3B0    pop        ebx
 0045F3B1    add        esp,20
 0045F3B4    ret
 0045F3B5    mov        ecx,dword ptr [esi+8]
 0045F3B8    mov        edx,dword ptr [esi+18]
 0045F3BB    mov        dword ptr [edx+ecx*4],0FFFFFFFF
 0045F3C2    mov        eax,dword ptr [esi+8]
 0045F3C5    mov        ecx,dword ptr [esi+1C]
 0045F3C8    mov        dword ptr [ecx+eax*4],0FFFFFFFF
 0045F3CF    pop        edi
 0045F3D0    pop        esi
 0045F3D1    pop        ebp
 0045F3D2    pop        ebx
 0045F3D3    add        esp,20
 0045F3D6    ret
*}
//end;

//0045F3D7
//function sub_0045F3D7:?;
//begin
{*
 0045F3D7    mov        edx,dword ptr [esp+0C]
 0045F3DB    mov        ecx,dword ptr [esp+4]
 0045F3DF    mov        eax,edx
 0045F3E1    dec        edx
 0045F3E2    push       edi
 0045F3E3    mov        edi,ecx
 0045F3E5    test       eax,eax
>0045F3E7    je         0045F3FF
 0045F3E9    push       esi
 0045F3EA    lea        esi,[edx+1]
 0045F3ED    mov        edx,dword ptr [esp+10]
 0045F3F1    mov        al,byte ptr [edx]
 0045F3F3    mov        byte ptr [ecx],al
 0045F3F5    inc        ecx
 0045F3F6    inc        edx
 0045F3F7    dec        esi
<0045F3F8    jne        0045F3F1
 0045F3FA    mov        eax,edi
 0045F3FC    pop        esi
 0045F3FD    pop        edi
 0045F3FE    ret
 0045F3FF    mov        eax,edi
 0045F401    pop        edi
 0045F402    ret
*}
//end;

//0045F45D
//procedure sub_0045F45D(?:?; ?:?; ?:?);
//begin
{*
 0045F45D    mov        eax,dword ptr [ecx+8]
 0045F460    mov        edx,dword ptr [ecx+34]
 0045F463    inc        eax
 0045F464    cmp        eax,edx
 0045F466    mov        dword ptr [ecx+8],eax
>0045F469    jb         0045F46D
<0045F46B    jmp        0045F403
 0045F46D    ret
*}
//end;

//0045F46E
//procedure sub_0045F46E(?:?; ?:?; ?:?);
//begin
{*
 0045F46E    sub        esp,0C
 0045F471    push       ebx
 0045F472    mov        ebx,ecx
 0045F474    push       ebp
 0045F475    push       esi
 0045F476    xor        edx,edx
 0045F478    push       edi
 0045F479    mov        dword ptr [esp+18],ebx
 0045F47D    xor        eax,eax
 0045F47F    lea        esi,[ebx+18B34]
 0045F485    mov        dword ptr [esi],edx
 0045F487    mov        cl,byte ptr [eax+46AC8C]
 0045F48D    mov        edi,1
 0045F492    add        esi,4
 0045F495    shl        edi,cl
 0045F497    add        edx,edi
 0045F499    inc        eax
 0045F49A    cmp        eax,3A
<0045F49D    jb         0045F485
 0045F49F    mov        dword ptr [esp+10],0
 0045F4A7    xor        edx,edx
 0045F4A9    mov        cl,byte ptr [edx+46AC70]
 0045F4AF    mov        esi,1
 0045F4B4    shl        esi,cl
 0045F4B6    test       esi,esi
>0045F4B8    jle        0045F4EB
 0045F4BA    mov        eax,dword ptr [esp+10]
 0045F4BE    mov        ecx,esi
 0045F4C0    mov        ebp,ecx
 0045F4C2    lea        edi,[eax+ebx+18634]
 0045F4C9    mov        al,dl
 0045F4CB    mov        bl,al
 0045F4CD    mov        bh,bl
 0045F4CF    mov        eax,ebx
 0045F4D1    shl        eax,10
 0045F4D4    mov        ax,bx
 0045F4D7    mov        ebx,dword ptr [esp+18]
 0045F4DB    shr        ecx,2
 0045F4DE    rep stos   dword ptr [edi]
 0045F4E0    mov        ecx,ebp
 0045F4E2    and        ecx,3
 0045F4E5    rep stos   byte ptr [edi]
 0045F4E7    add        dword ptr [esp+10],esi
 0045F4EB    inc        edx
 0045F4EC    cmp        edx,1C
<0045F4EF    jb         0045F4A9
 0045F4F1    xor        edi,edi
 0045F4F3    xor        dl,dl
 0045F4F5    mov        dword ptr [esp+10],edi
 0045F4F9    mov        dword ptr [esp+14],46AC8C
 0045F501    mov        ecx,dword ptr [esp+14]
 0045F505    mov        esi,1
 0045F50A    mov        cl,byte ptr [ecx]
 0045F50C    shl        esi,cl
 0045F50E    test       esi,esi
>0045F510    jbe        0045F545
 0045F512    mov        al,dl
 0045F514    lea        edi,[edi+ebx+18734]
 0045F51B    mov        bl,al
 0045F51D    mov        ecx,esi
 0045F51F    mov        bh,bl
 0045F521    mov        ebp,ecx
 0045F523    mov        eax,ebx
 0045F525    shl        eax,10
 0045F528    mov        ax,bx
 0045F52B    mov        ebx,dword ptr [esp+18]
 0045F52F    shr        ecx,2
 0045F532    rep stos   dword ptr [edi]
 0045F534    mov        ecx,ebp
 0045F536    and        ecx,3
 0045F539    rep stos   byte ptr [edi]
 0045F53B    mov        edi,dword ptr [esp+10]
 0045F53F    add        edi,esi
 0045F541    mov        dword ptr [esp+10],edi
 0045F545    mov        ecx,dword ptr [esp+14]
 0045F549    inc        dl
 0045F54B    inc        ecx
 0045F54C    cmp        dl,14
 0045F54F    mov        dword ptr [esp+14],ecx
<0045F553    jb         0045F501
 0045F555    pop        edi
 0045F556    pop        esi
 0045F557    pop        ebp
 0045F558    pop        ebx
 0045F559    add        esp,0C
 0045F55C    ret
*}
//end;

//0045F55D
//procedure sub_0045F55D(?:?; ?:?; ?:?);
//begin
{*
 0045F55D    push       ecx
 0045F55E    push       ebx
 0045F55F    push       ebp
 0045F560    push       esi
 0045F561    mov        esi,ecx
 0045F563    push       edi
 0045F564    cmp        dword ptr [esi+1862C],1
>0045F56B    jle        0045F595
 0045F56D    mov        eax,dword ptr [esi+18200]
 0045F573    mov        ecx,dword ptr [esi]
 0045F575    add        eax,3
 0045F578    and        ecx,0FFFF
 0045F57E    imul       eax,ecx
 0045F581    mov        edx,dword ptr [esi+18620]
 0045F587    lea        ebp,[edx+eax*4]
 0045F58A    lea        eax,[ebp+8]
 0045F58D    mov        dword ptr [esi+181FC],eax
>0045F593    jmp        0045F599
 0045F595    mov        ebp,dword ptr [esp+10]
 0045F599    mov        ecx,dword ptr [esi+181FC]
 0045F59F    lea        ebx,[esi+18004]
 0045F5A5    push       ecx
 0045F5A6    mov        ecx,ebx
 0045F5A8    call       0045EF7F
 0045F5AD    mov        edx,dword ptr [esi+181FC]
 0045F5B3    mov        ecx,dword ptr [esi+18200]
 0045F5B9    mov        edi,eax
 0045F5BB    cmp        edi,ecx
 0045F5BD    mov        eax,dword ptr [edx+edi*4]
 0045F5C0    mov        dword ptr [esi+18208],eax
>0045F5C6    jne        0045F5EB
 0045F5C8    cmp        ecx,108
>0045F5CE    je         0045F5EB
 0045F5D0    mov        ecx,108
 0045F5D5    sub        ecx,edi
 0045F5D7    push       ecx
 0045F5D8    push       eax
 0045F5D9    push       edi
 0045F5DA    mov        ecx,ebx
 0045F5DC    call       0045EE9E
 0045F5E1    add        eax,edi
 0045F5E3    mov        dword ptr [esi+18204],eax
>0045F5E9    jmp        0045F5F1
 0045F5EB    mov        dword ptr [esi+18204],edi
 0045F5F1    cmp        dword ptr [esi+1862C],1
>0045F5F8    jle        0045F60C
 0045F5FA    mov        edx,dword ptr [esi+18208]
 0045F600    mov        dword ptr [ebp],edx
 0045F603    mov        eax,dword ptr [esi+18204]
 0045F609    mov        dword ptr [ebp+4],eax
 0045F60C    mov        ecx,ebx
 0045F60E    call       0045F45D
 0045F613    mov        ecx,dword ptr [esi]
 0045F615    mov        eax,dword ptr [esi+1820C]
 0045F61B    inc        ecx
 0045F61C    inc        eax
 0045F61D    mov        dword ptr [esi],ecx
 0045F61F    mov        dword ptr [esi+1820C],eax
 0045F625    pop        edi
 0045F626    pop        esi
 0045F627    pop        ebp
 0045F628    pop        ebx
 0045F629    pop        ecx
 0045F62A    ret
*}
//end;

//0045F65A
//procedure sub_0045F65A(?:?; ?:?; ?:?);
//begin
{*
 0045F65A    mov        edx,dword ptr [ecx]
 0045F65C    mov        eax,dword ptr [esp+4]
 0045F660    cmp        eax,edx
>0045F662    jne        0045F66C
 0045F664    call       0045F55D
 0045F669    ret        4
 0045F66C    push       esi
 0045F66D    mov        esi,dword ptr [ecx+1862C]
 0045F673    cmp        esi,1
 0045F676    pop        esi
>0045F677    jne        0045F691
 0045F679    inc        eax
 0045F67A    cmp        eax,edx
>0045F67C    je         0045F6C5
 0045F67E    lea        eax,[esp+4]
 0045F682    push       45F64A
 0045F687    push       eax
 0045F688    mov        dword ptr [esp+0C],78C
 0045F690    int        3
 0045F691    mov        edx,dword ptr [ecx+18200]
 0045F697    and        eax,0FFFF
 0045F69C    add        edx,3
 0045F69F    imul       edx,eax
 0045F6A2    mov        eax,dword ptr [ecx+18620]
 0045F6A8    lea        eax,[eax+edx*4]
 0045F6AB    lea        edx,[eax+8]
 0045F6AE    mov        dword ptr [ecx+181FC],edx
 0045F6B4    mov        edx,dword ptr [eax]
 0045F6B6    mov        dword ptr [ecx+18208],edx
 0045F6BC    mov        eax,dword ptr [eax+4]
 0045F6BF    mov        dword ptr [ecx+18204],eax
 0045F6C5    ret        4
*}
//end;

//0045F6C8
//procedure sub_0045F6C8(?:?; ?:?; ?:?);
//begin
{*
 0045F6C8    push       ebx
 0045F6C9    push       esi
 0045F6CA    mov        esi,ecx
 0045F6CC    push       edi
 0045F6CD    cmp        dword ptr [esi+1862C],1
>0045F6D4    jle        0045F705
 0045F6D6    mov        ebx,dword ptr [esp+10]
 0045F6DA    xor        edi,edi
 0045F6DC    test       ebx,ebx
>0045F6DE    jbe        0045F736
 0045F6E0    mov        eax,dword ptr [esi+1861C]
 0045F6E6    mov        ecx,dword ptr [esi+18624]
 0045F6EC    add        eax,ecx
 0045F6EE    lea        ecx,[eax+edi+1]
 0045F6F2    push       ecx
 0045F6F3    mov        ecx,esi
 0045F6F5    call       0045F65A
 0045F6FA    inc        edi
 0045F6FB    cmp        edi,ebx
<0045F6FD    jb         0045F6E0
 0045F6FF    pop        edi
 0045F700    pop        esi
 0045F701    pop        ebx
 0045F702    ret        4
 0045F705    mov        ebx,dword ptr [esp+10]
 0045F709    test       ebx,ebx
>0045F70B    jbe        0045F736
 0045F70D    lea        edi,[esi+18004]
 0045F713    mov        ecx,edi
 0045F715    call       0045F1E5
 0045F71A    mov        ecx,edi
 0045F71C    call       0045F45D
 0045F721    mov        edx,dword ptr [esi]
 0045F723    mov        ecx,dword ptr [esi+1820C]
 0045F729    inc        edx
 0045F72A    inc        ecx
 0045F72B    dec        ebx
 0045F72C    mov        dword ptr [esi],edx
 0045F72E    mov        dword ptr [esi+1820C],ecx
<0045F734    jne        0045F713
 0045F736    pop        edi
 0045F737    pop        esi
 0045F738    pop        ebx
 0045F739    ret        4
*}
//end;

//0045F73C
//function sub_0045F73C:?;
//begin
{*
 0045F73C    mov        eax,dword ptr [esp+8]
 0045F740    mov        edx,dword ptr [esp+4]
 0045F744    push       ebp
 0045F745    push       esi
 0045F746    sub        eax,2
 0045F749    push       edi
 0045F74A    mov        esi,ecx
>0045F74C    jne        0045F761
 0045F74E    cmp        edx,80
>0045F754    jbe        0045F766
 0045F756    pop        edi
 0045F757    pop        esi
 0045F758    mov        eax,0FFFFFFF
 0045F75D    pop        ebp
 0045F75E    ret        8
 0045F761    cmp        eax,7
>0045F764    jae        0045F76C
 0045F766    mov        ebp,eax
 0045F768    xor        edi,edi
>0045F76A    jmp        0045F77C
 0045F76C    xor        ecx,ecx
 0045F76E    mov        ebp,7
 0045F773    mov        cl,byte ptr [eax+esi+184F9]
 0045F77A    mov        edi,ecx
 0045F77C    cmp        edx,400
>0045F782    jae        0045F78F
 0045F784    xor        eax,eax
 0045F786    mov        al,byte ptr [edx+esi+18734]
>0045F78D    jmp        0045F7C4
 0045F78F    cmp        edx,40000
>0045F795    jae        0045F7AC
 0045F797    mov        eax,edx
 0045F799    xor        ecx,ecx
 0045F79B    shr        eax,9
 0045F79E    mov        cl,byte ptr [eax+esi+18734]
 0045F7A5    mov        eax,ecx
 0045F7A7    add        eax,12
>0045F7AA    jmp        0045F7C4
 0045F7AC    cmp        edx,200000
 0045F7B2    mov        eax,edx
>0045F7B4    jae        0045F7BE
 0045F7B6    shr        eax,11
 0045F7B9    add        eax,22
>0045F7BC    jmp        0045F7C4
 0045F7BE    shr        eax,12
 0045F7C1    add        eax,2A
 0045F7C4    cmp        byte ptr [eax+46AC8C],3
>0045F7CB    jb         0045F7DB
 0045F7CD    and        edx,7
 0045F7D0    xor        ecx,ecx
 0045F7D2    mov        cl,byte ptr [edx+esi+18600]
 0045F7D9    add        edi,ecx
 0045F7DB    lea        edx,[ebp+eax*8+18330]
 0045F7E2    xor        eax,eax
 0045F7E4    mov        al,byte ptr [edx+esi]
 0045F7E7    add        eax,edi
 0045F7E9    pop        edi
 0045F7EA    pop        esi
 0045F7EB    pop        ebp
 0045F7EC    ret        8
*}
//end;

//0045F7EF
//procedure sub_0045F7EF(?:?; ?:?; ?:?);
//begin
{*
 0045F7EF    push       ebx
 0045F7F0    push       ebp
 0045F7F1    push       esi
 0045F7F2    push       edi
 0045F7F3    mov        edi,dword ptr [esp+18]
 0045F7F7    mov        dword ptr [ecx+18210],edi
 0045F7FD    lea        eax,[edi+edi*2]
 0045F800    mov        edx,dword ptr [ecx+eax*8+8]
 0045F804    mov        ebx,dword ptr [ecx+eax*8+0C]
 0045F808    lea        eax,[ecx+eax*8]
 0045F80B    mov        esi,edx
 0045F80D    lea        edx,[edx+edx*2]
 0045F810    mov        ebp,ebx
 0045F812    mov        ebx,dword ptr [ecx+edx*8+0C]
 0045F816    lea        eax,[ecx+edx*8]
 0045F819    test       esi,esi
 0045F81B    mov        edx,dword ptr [eax+8]
 0045F81E    mov        dword ptr [eax+0C],ebp
 0045F821    mov        dword ptr [eax+8],edi
 0045F824    mov        edi,esi
<0045F826    ja         0045F80B
 0045F828    mov        edx,dword ptr [esp+14]
 0045F82C    mov        eax,dword ptr [ecx+0C]
 0045F82F    pop        edi
 0045F830    pop        esi
 0045F831    mov        dword ptr [edx],eax
 0045F833    mov        eax,dword ptr [ecx+8]
 0045F836    pop        ebp
 0045F837    mov        dword ptr [ecx+18214],eax
 0045F83D    pop        ebx
 0045F83E    ret        8
*}
//end;

//0045F841
//procedure sub_0045F841(?:?; ?:?; ?:?);
//begin
{*
 0045F841    sub        esp,2C
 0045F844    push       ebx
 0045F845    push       ebp
 0045F846    push       esi
 0045F847    mov        esi,ecx
 0045F849    push       edi
 0045F84A    mov        ecx,dword ptr [esi+18214]
 0045F850    mov        eax,dword ptr [esi+18210]
 0045F856    cmp        eax,ecx
>0045F858    je         0045F88C
 0045F85A    lea        eax,[ecx+ecx*2]
 0045F85D    pop        edi
 0045F85E    lea        edx,[esi+eax*8]
 0045F861    mov        eax,dword ptr [esi+eax*8+8]
 0045F865    sub        eax,ecx
 0045F867    mov        ecx,dword ptr [edx+0C]
 0045F86A    mov        edx,dword ptr [esp+3C]
 0045F86E    mov        dword ptr [edx],ecx
 0045F870    mov        ecx,dword ptr [esi+18214]
 0045F876    lea        ecx,[ecx+ecx*2]
 0045F879    mov        edx,dword ptr [esi+ecx*8+8]
 0045F87D    mov        dword ptr [esi+18214],edx
 0045F883    pop        esi
 0045F884    pop        ebp
 0045F885    pop        ebx
 0045F886    add        esp,2C
 0045F889    ret        4
 0045F88C    mov        eax,dword ptr [esi+1861C]
 0045F892    mov        edx,dword ptr [esi+18624]
 0045F898    add        eax,edx
 0045F89A    xor        ebp,ebp
 0045F89C    push       eax
 0045F89D    mov        ecx,esi
 0045F89F    mov        dword ptr [esi+18214],ebp
 0045F8A5    mov        dword ptr [esi+18210],ebp
 0045F8AB    call       0045F65A
 0045F8B0    mov        edx,dword ptr [esi+1821C]
 0045F8B6    mov        ecx,dword ptr [esi+18208]
 0045F8BC    mov        eax,dword ptr [esi+18220]
 0045F8C2    mov        edi,dword ptr [esi+18204]
 0045F8C8    mov        dword ptr [esp+24],edx
 0045F8CC    mov        edx,dword ptr [esp+18]
 0045F8D0    mov        dword ptr [esp+20],ecx
 0045F8D4    mov        ecx,dword ptr [esi+18224]
 0045F8DA    mov        dword ptr [esp+28],eax
 0045F8DE    lea        eax,[edx*4+0]
 0045F8E5    mov        dword ptr [esp+14],edi
 0045F8E9    mov        dword ptr [esp+2C],ecx
 0045F8ED    mov        dword ptr [esp+1C],eax
 0045F8F1    lea        ebx,[ebp*4+0]
 0045F8F8    mov        eax,dword ptr [esp+ebx+24]
 0045F8FC    cmp        eax,0FFFFFFFF
>0045F8FF    je         0045F921
 0045F901    mov        ecx,dword ptr [esi+1820C]
 0045F907    push       108
 0045F90C    neg        ecx
 0045F90E    push       eax
 0045F90F    push       ecx
 0045F910    lea        ecx,[esi+18004]
 0045F916    call       0045EE9E
 0045F91B    mov        dword ptr [esp+ebx+30],eax
>0045F91F    jmp        0045F929
 0045F921    mov        dword ptr [esp+ebx+30],0
 0045F929    test       ebp,ebp
>0045F92B    je         0045F93B
 0045F92D    mov        eax,dword ptr [esp+1C]
 0045F931    mov        edx,dword ptr [esp+ebx+30]
 0045F935    cmp        edx,dword ptr [esp+eax+30]
>0045F939    jbe        0045F943
 0045F93B    mov        dword ptr [esp+18],ebp
 0045F93F    mov        dword ptr [esp+1C],ebx
 0045F943    inc        ebp
 0045F944    cmp        ebp,3
<0045F947    jb         0045F8F1
 0045F949    mov        ecx,dword ptr [esp+18]
 0045F94D    mov        eax,dword ptr [esi+18218]
 0045F953    mov        ebx,dword ptr [esp+ecx*4+30]
 0045F957    cmp        ebx,eax
>0045F959    jb         0045F978
 0045F95B    mov        edx,dword ptr [esp+40]
 0045F95F    lea        eax,[ebx-1]
 0045F962    push       eax
 0045F963    mov        dword ptr [edx],ecx
 0045F965    mov        ecx,esi
 0045F967    call       0045F6C8
 0045F96C    pop        edi
 0045F96D    pop        esi
 0045F96E    mov        eax,ebx
 0045F970    pop        ebp
 0045F971    pop        ebx
 0045F972    add        esp,2C
 0045F975    ret        4
 0045F978    cmp        edi,2
>0045F97B    jae        0045F98C
 0045F97D    pop        edi
 0045F97E    pop        esi
 0045F97F    pop        ebp
 0045F980    mov        eax,1
 0045F985    pop        ebx
 0045F986    add        esp,2C
 0045F989    ret        4
 0045F98C    cmp        edi,eax
>0045F98E    jb         0045F9B4
 0045F990    mov        ecx,dword ptr [esp+20]
 0045F994    mov        edx,dword ptr [esp+40]
 0045F998    add        ecx,3
 0045F99B    lea        eax,[edi-1]
 0045F99E    mov        dword ptr [edx],ecx
 0045F9A0    push       eax
 0045F9A1    mov        ecx,esi
 0045F9A3    call       0045F6C8
 0045F9A8    mov        eax,edi
 0045F9AA    pop        edi
 0045F9AB    pop        esi
 0045F9AC    pop        ebp
 0045F9AD    pop        ebx
 0045F9AE    add        esp,2C
 0045F9B1    ret        4
 0045F9B4    mov        ecx,dword ptr [esi+1800C]
 0045F9BA    mov        ebx,dword ptr [esi+18008]
 0045F9C0    mov        edx,dword ptr [esi+1820C]
 0045F9C6    add        ecx,ebx
 0045F9C8    sub        ecx,edx
 0045F9CA    xor        edx,edx
 0045F9CC    xor        eax,eax
 0045F9CE    mov        ebx,2
 0045F9D3    mov        dl,byte ptr [ecx]
 0045F9D5    mov        ecx,dword ptr [esp+24]
 0045F9D9    cmp        edi,ebx
 0045F9DB    mov        al,byte ptr [edx+esi+18230]
 0045F9E2    mov        edx,dword ptr [esp+28]
 0045F9E6    mov        dword ptr [esi+1C],eax
 0045F9E9    mov        eax,dword ptr [esp+2C]
 0045F9ED    mov        dword ptr [esi+20],0
 0045F9F4    mov        dword ptr [esi+10],ecx
 0045F9F7    mov        dword ptr [esi+14],edx
 0045F9FA    mov        dword ptr [esi+18],eax
>0045F9FD    jb         0045FA2C
 0045F9FF    lea        ebp,[esi+3C]
 0045FA02    mov        dword ptr [ebp-4],0
 0045FA09    mov        ecx,dword ptr [esi+181FC]
 0045FA0F    push       ebx
 0045FA10    mov        eax,dword ptr [ecx+ebx*4]
 0045FA13    mov        ecx,esi
 0045FA15    add        eax,3
 0045FA18    push       eax
 0045FA19    mov        dword ptr [ebp],eax
 0045FA1C    call       0045F73C
 0045FA21    mov        dword ptr [ebp-8],eax
 0045FA24    inc        ebx
 0045FA25    add        ebp,18
 0045FA28    cmp        ebx,edi
<0045FA2A    jbe        0045FA02
 0045FA2C    lea        edx,[esp+30]
 0045FA30    xor        edi,edi
 0045FA32    mov        dword ptr [esp+1C],edx
 0045FA36    mov        eax,dword ptr [esp+1C]
 0045FA3A    mov        ebp,2
 0045FA3F    mov        eax,dword ptr [eax]
 0045FA41    cmp        eax,ebp
 0045FA43    mov        dword ptr [esp+20],eax
>0045FA47    jb         0045FA77
 0045FA49    lea        ebx,[esi+34]
 0045FA4C    cmp        ebp,dword ptr [esp+14]
>0045FA50    ja         0045FA77
 0045FA52    push       ebp
 0045FA53    push       edi
 0045FA54    mov        ecx,esi
 0045FA56    call       0045F73C
 0045FA5B    cmp        eax,dword ptr [ebx]
>0045FA5D    jae        0045FA6B
 0045FA5F    mov        dword ptr [ebx],eax
 0045FA61    mov        dword ptr [ebx+4],0
 0045FA68    mov        dword ptr [ebx+8],edi
 0045FA6B    mov        eax,dword ptr [esp+20]
 0045FA6F    inc        ebp
 0045FA70    add        ebx,18
 0045FA73    cmp        ebp,eax
<0045FA75    jbe        0045FA4C
 0045FA77    mov        ecx,dword ptr [esp+1C]
 0045FA7B    inc        edi
 0045FA7C    add        ecx,4
 0045FA7F    cmp        edi,3
 0045FA82    mov        dword ptr [esp+1C],ecx
<0045FA86    jb         0045FA36
 0045FA88    mov        ecx,dword ptr [esp+14]
 0045FA8C    xor        edi,edi
 0045FA8E    mov        dword ptr [esp+14],ecx
 0045FA92    lea        ebx,[esi+0C]
>0045FA95    jmp        0045FA9B
 0045FA97    mov        ebx,dword ptr [esp+1C]
 0045FA9B    mov        eax,dword ptr [ebx+14]
 0045FA9E    inc        edi
 0045FA9F    add        ebx,18
 0045FAA2    mov        dword ptr [esp+10],edi
 0045FAA6    lea        edx,[edi-1]
 0045FAA9    mov        dword ptr [esp+1C],ebx
 0045FAAD    cmp        eax,edx
>0045FAAF    je         0045FB1E
 0045FAB1    mov        ebp,dword ptr [ebx]
 0045FAB3    cmp        ebp,3
 0045FAB6    mov        dword ptr [esp+20],ebp
>0045FABA    jae        0045FB00
 0045FABC    lea        ebx,[eax+eax*2]
 0045FABF    shl        ebx,1
 0045FAC1    lea        ecx,[ebx+ebp]
 0045FAC4    mov        edx,dword ptr [esi+ecx*4+10]
 0045FAC8    mov        ecx,1
 0045FACD    mov        dword ptr [esp+24],edx
 0045FAD1    lea        edx,[esp+28]
>0045FAD5    jmp        0045FADB
 0045FAD7    mov        ebp,dword ptr [esp+20]
 0045FADB    cmp        ecx,ebp
>0045FADD    jne        0045FAE8
 0045FADF    lea        ebp,[eax+eax*2]
 0045FAE2    mov        ebp,dword ptr [esi+ebp*8+10]
>0045FAE6    jmp        0045FAEF
 0045FAE8    lea        ebp,[ebx+ecx]
 0045FAEB    mov        ebp,dword ptr [esi+ebp*4+10]
 0045FAEF    mov        dword ptr [edx],ebp
 0045FAF1    inc        ecx
 0045FAF2    add        edx,4
 0045FAF5    cmp        ecx,3
<0045FAF8    jb         0045FAD7
 0045FAFA    mov        ebx,dword ptr [esp+1C]
>0045FAFE    jmp        0045FB1E
 0045FB00    lea        eax,[eax+eax*2]
 0045FB03    add        ebp,0FFFFFFFD
 0045FB06    mov        dword ptr [esp+24],ebp
 0045FB0A    mov        ecx,dword ptr [esi+eax*8+10]
 0045FB0E    mov        edx,dword ptr [esi+eax*8+14]
 0045FB12    lea        eax,[esi+eax*8+10]
 0045FB16    mov        dword ptr [esp+28],ecx
 0045FB1A    mov        dword ptr [esp+2C],edx
 0045FB1E    mov        ecx,dword ptr [esp+24]
 0045FB22    mov        edx,dword ptr [esp+28]
 0045FB26    lea        eax,[ebx+4]
 0045FB29    mov        dword ptr [ebx+4],ecx
 0045FB2C    mov        ecx,dword ptr [esp+2C]
 0045FB30    mov        dword ptr [eax+4],edx
 0045FB33    mov        dword ptr [eax+8],ecx
 0045FB36    mov        eax,dword ptr [esp+14]
 0045FB3A    cmp        edi,eax
>0045FB3C    je         0045FCFC
 0045FB42    mov        edx,dword ptr [esi+1861C]
 0045FB48    mov        eax,dword ptr [esi+18624]
 0045FB4E    add        edx,eax
 0045FB50    mov        ecx,esi
 0045FB52    add        edx,edi
 0045FB54    push       edx
 0045FB55    call       0045F65A
 0045FB5A    mov        ebp,dword ptr [esi+18204]
 0045FB60    mov        eax,dword ptr [esi+18218]
 0045FB66    cmp        ebp,eax
 0045FB68    mov        dword ptr [esp+18],ebp
>0045FB6C    jae        0045FD13
 0045FB72    mov        eax,dword ptr [esi+1800C]
 0045FB78    mov        edx,dword ptr [esi+18008]
 0045FB7E    add        eax,edx
 0045FB80    mov        edx,dword ptr [esi+1820C]
 0045FB86    mov        ecx,dword ptr [ebx-8]
 0045FB89    sub        eax,edx
 0045FB8B    xor        edx,edx
 0045FB8D    mov        dword ptr [esp+20],ecx
 0045FB91    mov        dl,byte ptr [eax+edi]
 0045FB94    xor        eax,eax
 0045FB96    mov        al,byte ptr [edx+esi+18230]
 0045FB9D    add        eax,ecx
 0045FB9F    mov        ecx,dword ptr [ebx+10]
 0045FBA2    cmp        eax,ecx
>0045FBA4    jae        0045FBAC
 0045FBA6    mov        dword ptr [ebx+10],eax
 0045FBA9    mov        dword ptr [ebx+14],edi
 0045FBAC    cmp        ebp,2
>0045FBAF    jb         0045FBF8
 0045FBB1    mov        edx,dword ptr [esp+14]
 0045FBB5    lea        eax,[edi+ebp]
 0045FBB8    cmp        eax,edx
>0045FBBA    jbe        0045FBF8
 0045FBBC    cmp        eax,0FFF
>0045FBC1    jbe        0045FBD0
 0045FBC3    mov        eax,0FFF
 0045FBC8    sub        eax,edi
 0045FBCA    mov        dword ptr [esp+18],eax
 0045FBCE    mov        ebp,eax
 0045FBD0    lea        ebx,[edi+ebp]
 0045FBD3    cmp        edx,ebx
>0045FBD5    jae        0045FBF8
 0045FBD7    inc        edx
 0045FBD8    cmp        edx,ebx
>0045FBDA    ja         0045FBF4
 0045FBDC    lea        eax,[edx+edx*2]
 0045FBDF    lea        ecx,[esi+eax*8+4]
 0045FBE3    mov        eax,ebx
 0045FBE5    sub        eax,edx
 0045FBE7    inc        eax
 0045FBE8    mov        dword ptr [ecx],0FFFFFFF
 0045FBEE    add        ecx,18
 0045FBF1    dec        eax
<0045FBF2    jne        0045FBE8
 0045FBF4    mov        dword ptr [esp+14],ebx
 0045FBF8    xor        ebp,ebp
 0045FBFA    mov        eax,dword ptr [esp+ebp*4+24]
 0045FBFE    cmp        eax,0FFFFFFFF
>0045FC01    je         0045FC25
 0045FC03    mov        edx,dword ptr [esi+1820C]
 0045FC09    mov        ecx,edi
 0045FC0B    push       108
 0045FC10    sub        ecx,edx
 0045FC12    push       eax
 0045FC13    push       ecx
 0045FC14    lea        ecx,[esi+18004]
 0045FC1A    call       0045EE9E
 0045FC1F    mov        dword ptr [esp+ebp*4+30],eax
>0045FC23    jmp        0045FC2D
 0045FC25    mov        dword ptr [esp+ebp*4+30],0
 0045FC2D    mov        eax,dword ptr [esp+ebp*4+30]
 0045FC31    mov        ebx,2
 0045FC36    cmp        eax,ebx
>0045FC38    jb         0045FC87
 0045FC3A    mov        edx,dword ptr [esp+1C]
 0045FC3E    lea        edi,[edx+28]
 0045FC41    cmp        ebx,dword ptr [esp+18]
>0045FC45    ja         0045FC83
 0045FC47    mov        eax,dword ptr [esp+10]
 0045FC4B    lea        ecx,[ebx+eax]
 0045FC4E    mov        eax,dword ptr [esp+14]
 0045FC52    cmp        ecx,eax
>0045FC54    ja         0045FC83
 0045FC56    push       ebx
 0045FC57    push       ebp
 0045FC58    mov        ecx,esi
 0045FC5A    call       0045F73C
 0045FC5F    mov        edx,dword ptr [esp+20]
 0045FC63    mov        ecx,dword ptr [edi]
 0045FC65    add        eax,edx
 0045FC67    cmp        eax,ecx
>0045FC69    jae        0045FC77
 0045FC6B    mov        edx,dword ptr [esp+10]
 0045FC6F    mov        dword ptr [edi],eax
 0045FC71    mov        dword ptr [edi+4],edx
 0045FC74    mov        dword ptr [edi+8],ebp
 0045FC77    mov        eax,dword ptr [esp+ebp*4+30]
 0045FC7B    inc        ebx
 0045FC7C    add        edi,18
 0045FC7F    cmp        ebx,eax
<0045FC81    jbe        0045FC41
 0045FC83    mov        edi,dword ptr [esp+10]
 0045FC87    inc        ebp
 0045FC88    cmp        ebp,3
<0045FC8B    jb         0045FBFA
 0045FC91    mov        eax,dword ptr [esp+18]
 0045FC95    mov        ebx,2
 0045FC9A    cmp        eax,ebx
<0045FC9C    jb         0045FA97
 0045FCA2    mov        eax,dword ptr [esp+1C]
 0045FCA6    lea        ebp,[eax+28]
 0045FCA9    mov        eax,dword ptr [esp+14]
 0045FCAD    lea        ecx,[ebx+edi]
 0045FCB0    cmp        ecx,eax
<0045FCB2    ja         0045FA97
 0045FCB8    mov        edx,dword ptr [esi+181FC]
 0045FCBE    push       ebx
 0045FCBF    mov        ecx,esi
 0045FCC1    mov        eax,dword ptr [edx+ebx*4]
 0045FCC4    lea        edi,[eax+3]
 0045FCC7    push       edi
 0045FCC8    call       0045F73C
 0045FCCD    mov        edx,dword ptr [esp+20]
 0045FCD1    mov        ecx,dword ptr [ebp]
 0045FCD4    add        eax,edx
 0045FCD6    cmp        eax,ecx
>0045FCD8    jae        0045FCE7
 0045FCDA    mov        dword ptr [ebp],eax
 0045FCDD    mov        eax,dword ptr [esp+10]
 0045FCE1    mov        dword ptr [ebp+4],eax
 0045FCE4    mov        dword ptr [ebp+8],edi
 0045FCE7    mov        eax,dword ptr [esp+18]
 0045FCEB    mov        edi,dword ptr [esp+10]
 0045FCEF    inc        ebx
 0045FCF0    add        ebp,18
 0045FCF3    cmp        ebx,eax
<0045FCF5    jbe        0045FCA9
<0045FCF7    jmp        0045FA97
 0045FCFC    mov        ecx,dword ptr [esp+40]
 0045FD00    push       edi
 0045FD01    push       ecx
 0045FD02    mov        ecx,esi
 0045FD04    call       0045F7EF
 0045FD09    pop        edi
 0045FD0A    pop        esi
 0045FD0B    pop        ebp
 0045FD0C    pop        ebx
 0045FD0D    add        esp,2C
 0045FD10    ret        4
 0045FD13    mov        edx,dword ptr [esp+40]
 0045FD17    push       edi
 0045FD18    push       edx
 0045FD19    mov        ecx,esi
 0045FD1B    call       0045F7EF
 0045FD20    pop        edi
 0045FD21    pop        esi
 0045FD22    pop        ebp
 0045FD23    pop        ebx
 0045FD24    add        esp,2C
 0045FD27    ret        4
*}
//end;

//0045FD2A
function sub_0045FD2A:Integer;
begin
{*
 0045FD2A    mov        eax,dword ptr [esp+10]
 0045FD2E    push       ebx
 0045FD2F    push       ebp
 0045FD30    push       esi
 0045FD31    mov        esi,ecx
 0045FD33    push       edi
 0045FD34    mov        dword ptr [esi+1862C],eax
 0045FD3A    call       0045F46E
 0045FD3F    mov        ecx,dword ptr [esp+24]
 0045FD43    lea        ebx,[esi+1804C]
 0045FD49    push       ecx
 0045FD4A    push       0F
 0045FD4C    push       0
 0045FD4E    push       0
 0045FD50    push       2D1
 0045FD55    mov        ecx,ebx
 0045FD57    call       0045E928
 0045FD5C    push       eax
 0045FD5D    push       0F
 0045FD5F    lea        ebp,[esi+180B8]
 0045FD65    push       0
 0045FD67    push       46AC70
 0045FD6C    push       1C
 0045FD6E    mov        ecx,ebp
 0045FD70    call       0045E928
 0045FD75    push       eax
 0045FD76    push       0F
 0045FD78    push       0
 0045FD7A    push       0
 0045FD7C    lea        ecx,[esi+18124]
 0045FD82    push       8
 0045FD84    call       0045E928
 0045FD89    push       eax
 0045FD8A    push       0F
 0045FD8C    push       0
 0045FD8E    push       46ACC8
 0045FD93    lea        ecx,[esi+18190]
 0045FD99    push       13
 0045FD9B    call       0045E928
 0045FDA0    mov        dword ptr [esi+1822C],eax
 0045FDA6    lea        edi,[esi+1803C]
 0045FDAC    add        eax,30000
 0045FDB1    push       edi
 0045FDB2    mov        ecx,ebx
 0045FDB4    mov        dword ptr [esp+28],eax
 0045FDB8    call       0045E972
 0045FDBD    push       edi
 0045FDBE    mov        ecx,ebp
 0045FDC0    call       0045E972
 0045FDC5    push       edi
 0045FDC6    lea        ecx,[esi+18124]
 0045FDCC    call       0045E972
 0045FDD1    push       edi
 0045FDD2    lea        ecx,[esi+18190]
 0045FDD8    call       0045E972
 0045FDDD    mov        edx,dword ptr [esp+18]
 0045FDE1    mov        eax,dword ptr [esp+14]
 0045FDE5    mov        edi,dword ptr [esp+1C]
 0045FDE9    mov        ecx,dword ptr [esp+24]
 0045FDED    push       edx
 0045FDEE    add        eax,0FFFFFFFD
 0045FDF1    push       edi
 0045FDF2    push       eax
 0045FDF3    push       ecx
 0045FDF4    lea        ecx,[esi+18004]
 0045FDFA    call       0045EEEC
 0045FDFF    mov        edx,dword ptr [esi+1862C]
 0045FE05    lea        ecx,[edi+1]
 0045FE08    cmp        edx,1
 0045FE0B    mov        dword ptr [esi+18200],edi
 0045FE11    mov        dword ptr [esi+18218],ecx
>0045FE17    jle        0045FE2E
 0045FE19    add        edi,3
 0045FE1C    mov        dword ptr [esi+18620],eax
 0045FE22    shl        edi,12
 0045FE25    add        eax,edi
 0045FE27    pop        edi
 0045FE28    pop        esi
 0045FE29    pop        ebp
 0045FE2A    pop        ebx
 0045FE2B    ret        14
 0045FE2E    mov        dword ptr [esi+181FC],eax
 0045FE34    pop        edi
 0045FE35    pop        esi
 0045FE36    pop        ebp
 0045FE37    lea        eax,[eax+ecx*4]
 0045FE3A    pop        ebx
 0045FE3B    ret        14
*}
end;

//0045FE3E
procedure sub_0045FE3E;
begin
{*
 0045FE3E    mov        edx,dword ptr [esp+4]
 0045FE42    mov        eax,dword ptr [esp+10]
 0045FE46    push       esi
 0045FE47    mov        esi,ecx
 0045FE49    mov        ecx,dword ptr [esp+0C]
 0045FE4D    push       ecx
 0045FE4E    push       edx
 0045FE4F    lea        ecx,[esi+18004]
 0045FE55    mov        dword ptr [esi+18630],eax
 0045FE5B    mov        dword ptr [esi],0
 0045FE61    mov        byte ptr [esi+1860C],0
 0045FE68    call       0045EF22
 0045FE6D    mov        eax,dword ptr [esp+10]
 0045FE71    mov        ecx,esi
 0045FE73    mov        dword ptr [esi+1803C],eax
 0045FE79    mov        dword ptr [esi+18048],eax
 0045FE7F    mov        dword ptr [esi+18040],8
 0045FE89    call       0045FE92
 0045FE8E    pop        esi
 0045FE8F    ret        10
*}
end;

//0045FE92
//procedure sub_0045FE92(?:?; ?:?; ?:?);
//begin
{*
 0045FE92    push       ebp
 0045FE93    push       esi
 0045FE94    mov        esi,ecx
 0045FE96    push       edi
 0045FE97    mov        ecx,3
 0045FE9C    or         edx,0FFFFFFFF
 0045FE9F    lea        eax,[esi+18610]
 0045FEA5    mov        dword ptr [eax-3F4],edx
 0045FEAB    mov        dword ptr [eax],edx
 0045FEAD    add        eax,4
 0045FEB0    dec        ecx
<0045FEB1    jne        0045FEA5
 0045FEB3    mov        ecx,0BD
 0045FEB8    xor        eax,eax
 0045FEBA    lea        edi,[esi+18C1C]
 0045FEC0    xor        ebp,ebp
 0045FEC2    rep stos   dword ptr [edi]
 0045FEC4    stos       byte ptr [edi]
 0045FEC5    mov        ecx,0BD
 0045FECA    xor        eax,eax
 0045FECC    lea        edi,[esi+18F11]
 0045FED2    rep stos   dword ptr [edi]
 0045FED4    stos       byte ptr [edi]
 0045FED5    lea        ecx,[esi+1804C]
 0045FEDB    mov        dword ptr [esi+18228],ebp
 0045FEE1    mov        dword ptr [esi+18210],ebp
 0045FEE7    mov        dword ptr [esi+18214],ebp
 0045FEED    mov        dword ptr [esi+1820C],ebp
 0045FEF3    mov        dword ptr [esi+18608],ebp
 0045FEF9    mov        dword ptr [esi+18624],ebp
 0045FEFF    mov        dword ptr [esi+18628],ebp
 0045FF05    mov        dword ptr [esi+1861C],ebp
 0045FF0B    call       0045E97B
 0045FF10    lea        ecx,[esi+180B8]
 0045FF16    call       0045E97B
 0045FF1B    lea        ecx,[esi+18124]
 0045FF21    call       0045E97B
 0045FF26    lea        edi,[esi+18230]
 0045FF2C    mov        ecx,40
 0045FF31    mov        eax,8080808
 0045FF36    rep stos   dword ptr [edi]
 0045FF38    mov        ecx,0FFFE7B00
 0045FF3D    lea        eax,[esi+18500]
 0045FF43    sub        ecx,esi
 0045FF45    xor        edx,edx
 0045FF47    mov        dl,byte ptr [eax+134]
 0045FF4D    mov        dl,byte ptr [edx+46AC70]
 0045FF53    add        dl,5
 0045FF56    mov        byte ptr [eax],dl
 0045FF58    inc        eax
 0045FF59    lea        edx,[ecx+eax]
 0045FF5C    cmp        edx,100
<0045FF62    jl         0045FF45
 0045FF64    xor        edx,edx
 0045FF66    lea        edi,[esi+18330]
 0045FF6C    xor        ecx,ecx
 0045FF6E    mov        al,byte ptr [edx+46AC8C]
 0045FF74    cmp        al,3
>0045FF76    jb         0045FF7A
 0045FF78    sub        al,3
 0045FF7A    add        al,8
 0045FF7C    mov        byte ptr [edi+ecx],al
 0045FF7F    inc        ecx
 0045FF80    cmp        ecx,8
<0045FF83    jb         0045FF6E
 0045FF85    inc        edx
 0045FF86    add        edi,8
 0045FF89    cmp        edx,3A
<0045FF8C    jb         0045FF6C
 0045FF8E    lea        eax,[esi+18600]
 0045FF94    mov        ecx,3030303
 0045FF99    pop        edi
 0045FF9A    pop        esi
 0045FF9B    mov        dword ptr [eax],ecx
 0045FF9D    pop        ebp
 0045FF9E    mov        dword ptr [eax+4],ecx
 0045FFA1    ret
*}
//end;

//0045FFA2
//function sub_0045FFA2(?:?; ?:?; ?:?):?;
//begin
{*
 0045FFA2    sub        esp,0C
 0045FFA5    push       ebx
 0045FFA6    push       ebp
 0045FFA7    push       esi
 0045FFA8    mov        esi,ecx
 0045FFAA    push       edi
 0045FFAB    xor        edi,edi
 0045FFAD    cmp        dword ptr [esi+18228],edi
>0045FFB3    jne        0045FFC8
 0045FFB5    lea        eax,[esp+18]
 0045FFB9    push       45F64A
 0045FFBE    push       eax
 0045FFBF    mov        dword ptr [esp+20],3D7FD
 0045FFC7    int        3
 0045FFC8    lea        ecx,[esi+1804C]
 0045FFCE    push       2D0
 0045FFD3    call       0045E99E
 0045FFD8    mov        ecx,esi
 0045FFDA    call       004605B8
 0045FFDF    mov        ecx,dword ptr [esi+1862C]
 0045FFE5    mov        eax,dword ptr [esi+18628]
 0045FFEB    dec        ecx
 0045FFEC    cmp        eax,ecx
>0045FFEE    jne        0046024B
 0045FFF4    mov        eax,dword ptr [esi+18228]
 0045FFFA    mov        dword ptr [esp+14],edi
 0045FFFE    cmp        eax,edi
>00460000    jbe        0046024B
 00460006    mov        dword ptr [esp+18],edi
 0046000A    mov        ebp,dword ptr [esi+1822C]
 00460010    xor        edx,edx
 00460012    add        ebp,edi
 00460014    lea        ecx,[esi+1804C]
 0046001A    mov        dx,word ptr [ebp]
 0046001E    push       edx
 0046001F    call       0045EE17
 00460024    mov        eax,dword ptr [esi+1822C]
 0046002A    cmp        word ptr [eax+edi],100
>00460030    jb         00460202
 00460036    mov        al,byte ptr [ebp+2]
 00460039    test       al,al
>0046003B    je         004600DE
 00460041    xor        ecx,ecx
 00460043    mov        cl,byte ptr [ebp+3]
 00460046    push       ecx
 00460047    lea        ecx,[esi+180B8]
 0046004D    call       0045EE17
 00460052    xor        edx,edx
 00460054    xor        eax,eax
 00460056    mov        dl,byte ptr [ebp+3]
 00460059    xor        edi,edi
 0046005B    mov        di,word ptr [ebp+4]
 0046005F    mov        al,byte ptr [edx+46AC70]
 00460065    mov        edx,eax
 00460067    test       edx,edx
>00460069    jbe        004600DE
 0046006B    mov        ebx,dword ptr [esi+18040]
 00460071    cmp        edx,ebx
>00460073    jae        00460077
 00460075    mov        ebx,edx
 00460077    mov        al,byte ptr [esi+18044]
 0046007D    mov        cl,bl
 0046007F    shl        al,cl
 00460081    sub        edx,ebx
 00460083    mov        ecx,edx
 00460085    mov        byte ptr [esi+18044],al
 0046008B    mov        eax,edi
 0046008D    shr        eax,cl
 0046008F    mov        cl,byte ptr [esi+18044]
 00460095    or         cl,al
 00460097    mov        byte ptr [esp+13],cl
 0046009B    mov        byte ptr [esi+18044],cl
 004600A1    mov        ecx,edx
 004600A3    shl        eax,cl
 004600A5    sub        edi,eax
 004600A7    mov        eax,dword ptr [esi+18040]
 004600AD    sub        eax,ebx
 004600AF    mov        dword ptr [esi+18040],eax
>004600B5    jne        004600DA
 004600B7    mov        ecx,dword ptr [esi+1803C]
 004600BD    mov        al,byte ptr [esp+13]
 004600C1    mov        byte ptr [ecx],al
 004600C3    mov        eax,dword ptr [esi+1803C]
 004600C9    inc        eax
 004600CA    mov        dword ptr [esi+18040],8
 004600D4    mov        dword ptr [esi+1803C],eax
 004600DA    test       edx,edx
<004600DC    ja         0046006B
 004600DE    mov        dl,byte ptr [ebp+0C]
 004600E1    cmp        dl,3
>004600E4    jb         00460184
 004600EA    mov        edi,dword ptr [ebp+8]
 004600ED    and        edx,0FF
 004600F3    sub        edx,3
 004600F6    shr        edi,3
 004600F9    test       edx,edx
>004600FB    jbe        00460170
 004600FD    mov        ebx,dword ptr [esi+18040]
 00460103    cmp        edx,ebx
>00460105    jae        00460109
 00460107    mov        ebx,edx
 00460109    mov        al,byte ptr [esi+18044]
 0046010F    mov        cl,bl
 00460111    shl        al,cl
 00460113    sub        edx,ebx
 00460115    mov        ecx,edx
 00460117    mov        byte ptr [esi+18044],al
 0046011D    mov        eax,edi
 0046011F    shr        eax,cl
 00460121    mov        cl,byte ptr [esi+18044]
 00460127    or         cl,al
 00460129    mov        byte ptr [esp+13],cl
 0046012D    mov        byte ptr [esi+18044],cl
 00460133    mov        ecx,edx
 00460135    shl        eax,cl
 00460137    sub        edi,eax
 00460139    mov        eax,dword ptr [esi+18040]
 0046013F    sub        eax,ebx
 00460141    mov        dword ptr [esi+18040],eax
>00460147    jne        0046016C
 00460149    mov        ecx,dword ptr [esi+1803C]
 0046014F    mov        al,byte ptr [esp+13]
 00460153    mov        byte ptr [ecx],al
 00460155    mov        eax,dword ptr [esi+1803C]
 0046015B    inc        eax
 0046015C    mov        dword ptr [esi+18040],8
 00460166    mov        dword ptr [esi+1803C],eax
 0046016C    test       edx,edx
<0046016E    ja         004600FD
 00460170    mov        ecx,dword ptr [ebp+8]
 00460173    and        ecx,7
 00460176    push       ecx
 00460177    lea        ecx,[esi+18124]
 0046017D    call       0045EE17
>00460182    jmp        00460202
 00460184    mov        edi,dword ptr [ebp+8]
 00460187    and        edx,0FF
>0046018D    jbe        00460202
 0046018F    mov        ebx,dword ptr [esi+18040]
 00460195    cmp        edx,ebx
>00460197    jae        0046019B
 00460199    mov        ebx,edx
 0046019B    mov        al,byte ptr [esi+18044]
 004601A1    mov        cl,bl
 004601A3    shl        al,cl
 004601A5    sub        edx,ebx
 004601A7    mov        ecx,edx
 004601A9    mov        byte ptr [esi+18044],al
 004601AF    mov        eax,edi
 004601B1    shr        eax,cl
 004601B3    mov        cl,byte ptr [esi+18044]
 004601B9    or         cl,al
 004601BB    mov        byte ptr [esp+13],cl
 004601BF    mov        byte ptr [esi+18044],cl
 004601C5    mov        ecx,edx
 004601C7    shl        eax,cl
 004601C9    sub        edi,eax
 004601CB    mov        eax,dword ptr [esi+18040]
 004601D1    sub        eax,ebx
 004601D3    mov        dword ptr [esi+18040],eax
>004601D9    jne        004601FE
 004601DB    mov        eax,dword ptr [esi+1803C]
 004601E1    mov        cl,byte ptr [esp+13]
 004601E5    mov        byte ptr [eax],cl
 004601E7    mov        eax,dword ptr [esi+1803C]
 004601ED    inc        eax
 004601EE    mov        dword ptr [esi+18040],8
 004601F8    mov        dword ptr [esi+1803C],eax
 004601FE    test       edx,edx
<00460200    ja         0046018F
 00460202    mov        ebp,dword ptr [esi+18040]
 00460208    mov        edi,dword ptr [esi+18048]
 0046020E    mov        ecx,dword ptr [esi+1803C]
 00460214    cmp        ebp,8
 00460217    mov        eax,dword ptr [esi+18630]
 0046021D    sbb        edx,edx
 0046021F    neg        edx
 00460221    sub        edx,edi
 00460223    add        edx,ecx
 00460225    cmp        edx,eax
>00460227    ja         00460265
 00460229    mov        eax,dword ptr [esp+14]
 0046022D    mov        edi,dword ptr [esp+18]
 00460231    mov        ecx,dword ptr [esi+18228]
 00460237    inc        eax
 00460238    add        edi,10
 0046023B    cmp        eax,ecx
 0046023D    mov        dword ptr [esp+14],eax
 00460241    mov        dword ptr [esp+18],edi
<00460245    jb         0046000A
 0046024B    mov        al,1
 0046024D    mov        dword ptr [esi+18228],0
 00460257    mov        byte ptr [esi+1860C],al
 0046025D    pop        edi
 0046025E    pop        esi
 0046025F    pop        ebp
 00460260    pop        ebx
 00460261    add        esp,0C
 00460264    ret
 00460265    pop        edi
 00460266    pop        esi
 00460267    pop        ebp
 00460268    xor        al,al
 0046026A    pop        ebx
 0046026B    add        esp,0C
 0046026E    ret
*}
//end;

//0046026F
//procedure sub_0046026F(?:?; ?:?; ?:?);
//begin
{*
 0046026F    sub        esp,14
 00460272    push       ebx
 00460273    push       ebp
 00460274    mov        ebp,dword ptr [esp+20]
 00460278    xor        ebx,ebx
 0046027A    push       esi
 0046027B    push       edi
 0046027C    mov        bl,byte ptr [ebp]
 0046027F    mov        esi,ecx
 00460281    xor        edi,edi
 00460283    mov        dword ptr [esp+1C],0FF
 0046028B    test       ebx,ebx
 0046028D    mov        eax,7
 00460292    mov        ecx,4
>00460297    jne        004602A3
 00460299    mov        eax,8A
 0046029E    mov        ecx,3
 004602A3    mov        edx,dword ptr [esp+2C]
 004602A7    mov        dword ptr [esp+14],0
 004602AF    test       edx,edx
 004602B1    mov        byte ptr [edx+ebp],0FF
>004602B5    jle        004605AE
>004602BB    jmp        004602C1
 004602BD    mov        ebx,dword ptr [esp+20]
 004602C1    mov        ebp,dword ptr [esp+14]
 004602C5    mov        dword ptr [esp+18],ebx
 004602C9    mov        ebx,dword ptr [esp+28]
 004602CD    xor        edx,edx
 004602CF    inc        edi
 004602D0    mov        dl,byte ptr [ebx+ebp+1]
 004602D4    mov        ebp,dword ptr [esp+18]
 004602D8    cmp        edi,eax
 004602DA    mov        dword ptr [esp+20],edx
>004602DE    jge        004602E8
 004602E0    cmp        ebp,edx
>004602E2    je         00460599
 004602E8    cmp        edi,ecx
>004602EA    jge        0046033F
 004602EC    xor        ebx,ebx
 004602EE    test       edi,edi
>004602F0    jle        00460565
 004602F6    mov        al,byte ptr [esp+34]
 004602FA    test       al,al
>004602FC    je         00460318
 004602FE    mov        ecx,dword ptr [esp+14]
 00460302    mov        eax,ebx
 00460304    sub        eax,edi
 00460306    add        eax,ecx
 00460308    mov        cl,byte ptr [eax+esi+18C1D]
 0046030F    mov        eax,ebp
 00460311    sub        eax,ecx
 00460313    and        eax,0F
>00460316    jmp        0046031A
 00460318    mov        eax,ebp
 0046031A    mov        cl,byte ptr [esp+30]
 0046031E    push       eax
 0046031F    test       cl,cl
 00460321    lea        ecx,[esi+18190]
>00460327    je         00460330
 00460329    call       0045EE17
>0046032E    jmp        00460335
 00460330    call       0045E99E
 00460335    inc        ebx
 00460336    cmp        ebx,edi
<00460338    jl         004602F6
>0046033A    jmp        00460565
 0046033F    test       ebp,ebp
>00460341    je         00460422
 00460347    cmp        ebp,dword ptr [esp+1C]
>0046034B    je         00460389
 0046034D    mov        al,byte ptr [esp+34]
 00460351    test       al,al
>00460353    je         0046036B
 00460355    mov        edx,dword ptr [esp+14]
 00460359    mov        eax,ebp
 0046035B    sub        edx,edi
 0046035D    mov        cl,byte ptr [edx+esi+18C1D]
 00460364    sub        eax,ecx
 00460366    and        eax,0F
>00460369    jmp        0046036D
 0046036B    mov        eax,ebp
 0046036D    mov        cl,byte ptr [esp+30]
 00460371    push       eax
 00460372    test       cl,cl
 00460374    lea        ecx,[esi+18190]
>0046037A    je         00460383
 0046037C    call       0045EE17
>00460381    jmp        00460388
 00460383    call       0045E99E
 00460388    dec        edi
 00460389    mov        al,byte ptr [esp+30]
 0046038D    push       10
 0046038F    test       al,al
 00460391    lea        ecx,[esi+18190]
>00460397    je         00460560
 0046039D    call       0045EE17
 004603A2    mov        edx,2
 004603A7    add        edi,0FFFFFFFD
 004603AA    mov        ebx,dword ptr [esi+18040]
 004603B0    cmp        edx,ebx
>004603B2    jae        004603B6
 004603B4    mov        ebx,edx
 004603B6    mov        al,byte ptr [esi+18044]
 004603BC    mov        cl,bl
 004603BE    shl        al,cl
 004603C0    sub        edx,ebx
 004603C2    mov        ecx,edx
 004603C4    mov        byte ptr [esi+18044],al
 004603CA    mov        eax,edi
 004603CC    shr        eax,cl
 004603CE    mov        cl,byte ptr [esi+18044]
 004603D4    or         cl,al
 004603D6    mov        byte ptr [esp+13],cl
 004603DA    mov        byte ptr [esi+18044],cl
 004603E0    mov        ecx,edx
 004603E2    shl        eax,cl
 004603E4    sub        edi,eax
 004603E6    mov        eax,dword ptr [esi+18040]
 004603EC    sub        eax,ebx
 004603EE    mov        dword ptr [esi+18040],eax
>004603F4    jne        00460419
 004603F6    mov        eax,dword ptr [esi+1803C]
 004603FC    mov        cl,byte ptr [esp+13]
 00460400    mov        byte ptr [eax],cl
 00460402    mov        eax,dword ptr [esi+1803C]
 00460408    inc        eax
 00460409    mov        dword ptr [esi+18040],8
 00460413    mov        dword ptr [esi+1803C],eax
 00460419    test       edx,edx
<0046041B    ja         004603AA
>0046041D    jmp        00460565
 00460422    mov        al,byte ptr [esp+30]
 00460426    cmp        edi,0A
>00460429    jg         004604C9
 0046042F    test       al,al
 00460431    push       11
 00460433    lea        ecx,[esi+18190]
>00460439    je         00460560
 0046043F    call       0045EE17
 00460444    mov        edx,3
 00460449    add        edi,0FFFFFFFD
 0046044C    mov        ebp,8
 00460451    mov        ebx,dword ptr [esi+18040]
 00460457    cmp        edx,ebx
>00460459    jae        0046045D
 0046045B    mov        ebx,edx
 0046045D    mov        al,byte ptr [esi+18044]
 00460463    mov        cl,bl
 00460465    shl        al,cl
 00460467    sub        edx,ebx
 00460469    mov        ecx,edx
 0046046B    mov        byte ptr [esi+18044],al
 00460471    mov        eax,edi
 00460473    shr        eax,cl
 00460475    mov        cl,byte ptr [esi+18044]
 0046047B    or         cl,al
 0046047D    mov        byte ptr [esp+13],cl
 00460481    mov        byte ptr [esi+18044],cl
 00460487    mov        ecx,edx
 00460489    shl        eax,cl
 0046048B    sub        edi,eax
 0046048D    mov        eax,dword ptr [esi+18040]
 00460493    sub        eax,ebx
 00460495    mov        dword ptr [esi+18040],eax
>0046049B    jne        004604BC
 0046049D    mov        eax,dword ptr [esi+1803C]
 004604A3    mov        cl,byte ptr [esp+13]
 004604A7    mov        byte ptr [eax],cl
 004604A9    mov        eax,dword ptr [esi+1803C]
 004604AF    inc        eax
 004604B0    mov        dword ptr [esi+18040],ebp
 004604B6    mov        dword ptr [esi+1803C],eax
 004604BC    test       edx,edx
<004604BE    ja         00460451
 004604C0    mov        ebp,dword ptr [esp+18]
>004604C4    jmp        00460565
 004604C9    test       al,al
 004604CB    push       12
 004604CD    lea        ecx,[esi+18190]
>004604D3    je         00460560
 004604D9    call       0045EE17
 004604DE    mov        edx,7
 004604E3    add        edi,0FFFFFFF5
 004604E6    mov        ebp,8
 004604EB    mov        ebx,dword ptr [esi+18040]
 004604F1    cmp        edx,ebx
>004604F3    jae        004604F7
 004604F5    mov        ebx,edx
 004604F7    mov        al,byte ptr [esi+18044]
 004604FD    mov        cl,bl
 004604FF    shl        al,cl
 00460501    sub        edx,ebx
 00460503    mov        ecx,edx
 00460505    mov        byte ptr [esi+18044],al
 0046050B    mov        eax,edi
 0046050D    shr        eax,cl
 0046050F    mov        cl,byte ptr [esi+18044]
 00460515    or         cl,al
 00460517    mov        byte ptr [esp+13],cl
 0046051B    mov        byte ptr [esi+18044],cl
 00460521    mov        ecx,edx
 00460523    shl        eax,cl
 00460525    sub        edi,eax
 00460527    mov        eax,dword ptr [esi+18040]
 0046052D    sub        eax,ebx
 0046052F    mov        dword ptr [esi+18040],eax
>00460535    jne        00460556
 00460537    mov        eax,dword ptr [esi+1803C]
 0046053D    mov        cl,byte ptr [esp+13]
 00460541    mov        byte ptr [eax],cl
 00460543    mov        eax,dword ptr [esi+1803C]
 00460549    inc        eax
 0046054A    mov        dword ptr [esi+18040],ebp
 00460550    mov        dword ptr [esi+1803C],eax
 00460556    test       edx,edx
<00460558    ja         004604EB
 0046055A    mov        ebp,dword ptr [esp+18]
>0046055E    jmp        00460565
 00460560    call       0045E99E
 00460565    mov        eax,dword ptr [esp+20]
 00460569    xor        edi,edi
 0046056B    test       eax,eax
 0046056D    mov        dword ptr [esp+1C],ebp
>00460571    jne        0046057F
 00460573    mov        eax,8A
 00460578    mov        ecx,3
>0046057D    jmp        00460599
 0046057F    cmp        ebp,eax
>00460581    jne        0046058F
 00460583    mov        eax,6
 00460588    mov        ecx,3
>0046058D    jmp        00460599
 0046058F    mov        eax,7
 00460594    mov        ecx,4
 00460599    mov        edx,dword ptr [esp+14]
 0046059D    mov        ebx,dword ptr [esp+2C]
 004605A1    inc        edx
 004605A2    cmp        edx,ebx
 004605A4    mov        dword ptr [esp+14],edx
<004605A8    jl         004602BD
 004605AE    pop        edi
 004605AF    pop        esi
 004605B0    pop        ebp
 004605B1    pop        ebx
 004605B2    add        esp,14
 004605B5    ret        10
*}
//end;

//004605B8
procedure sub_004605B8;
begin
{*
 004605B8    sub        esp,314
 004605BE    lea        eax,[esp+1C]
 004605C2    push       esi
 004605C3    mov        esi,ecx
 004605C5    push       eax
 004605C6    lea        ecx,[esi+1804C]
 004605CC    call       0045EC7A
 004605D1    lea        ecx,[esp+2F1]
 004605D8    push       ecx
 004605D9    lea        ecx,[esi+180B8]
 004605DF    call       0045EC7A
 004605E4    lea        edx,[esp+30D]
 004605EB    lea        ecx,[esi+18124]
 004605F1    push       edx
 004605F2    call       0045EC7A
 004605F7    mov        eax,dword ptr [esi+1862C]
 004605FD    mov        ecx,dword ptr [esi+18628]
 00460603    dec        eax
 00460604    cmp        ecx,eax
>00460606    jne        004608A2
 0046060C    mov        eax,dword ptr [esi+18608]
 00460612    push       ebx
 00460613    push       ebp
 00460614    cmp        eax,1
 00460617    push       edi
>00460618    jne        00460719
 0046061E    lea        edi,[esi+18190]
 00460624    xor        ebp,ebp
 00460626    mov        ecx,edi
 00460628    mov        dword ptr [esi+181F8],ebp
 0046062E    call       0045E97B
 00460633    push       ebp
 00460634    push       ebp
 00460635    lea        ecx,[esp+34]
 00460639    push       2F5
 0046063E    push       ecx
 0046063F    mov        ecx,esi
 00460641    call       0046026F
 00460646    lea        edx,[esp+18]
 0046064A    mov        ecx,edi
 0046064C    push       edx
 0046064D    call       0045EC7A
 00460652    mov        ebx,dword ptr [esi+181F8]
 00460658    mov        ecx,edi
 0046065A    mov        dword ptr [esi+181F8],ebp
 00460660    call       0045E97B
 00460665    push       1
 00460667    push       ebp
 00460668    lea        eax,[esp+34]
 0046066C    push       2F5
 00460671    push       eax
 00460672    mov        ecx,esi
 00460674    call       0046026F
 00460679    lea        ecx,[esp+18]
 0046067D    push       ecx
 0046067E    mov        ecx,edi
 00460680    call       0045EC7A
 00460685    cmp        dword ptr [esi+181F8],ebx
 0046068B    setb       al
 0046068E    test       al,al
 00460690    mov        byte ptr [esp+14],al
>00460694    je         0046071E
 0046069A    mov        edx,1
 0046069F    mov        edi,edx
 004606A1    mov        ebx,dword ptr [esi+18040]
 004606A7    cmp        edx,ebx
>004606A9    jae        004606AD
 004606AB    mov        ebx,edx
 004606AD    mov        al,byte ptr [esi+18044]
 004606B3    mov        cl,bl
 004606B5    shl        al,cl
 004606B7    sub        edx,ebx
 004606B9    mov        ecx,edx
 004606BB    mov        byte ptr [esi+18044],al
 004606C1    mov        eax,edi
 004606C3    shr        eax,cl
 004606C5    mov        cl,byte ptr [esi+18044]
 004606CB    or         cl,al
 004606CD    mov        byte ptr [esp+13],cl
 004606D1    mov        byte ptr [esi+18044],cl
 004606D7    mov        ecx,edx
 004606D9    shl        eax,cl
 004606DB    sub        edi,eax
 004606DD    mov        eax,dword ptr [esi+18040]
 004606E3    sub        eax,ebx
 004606E5    mov        dword ptr [esi+18040],eax
>004606EB    jne        00460710
 004606ED    mov        eax,dword ptr [esi+1803C]
 004606F3    mov        cl,byte ptr [esp+13]
 004606F7    mov        byte ptr [eax],cl
 004606F9    mov        eax,dword ptr [esi+1803C]
 004606FF    inc        eax
 00460700    mov        dword ptr [esi+18040],8
 0046070A    mov        dword ptr [esi+1803C],eax
 00460710    cmp        edx,ebp
<00460712    ja         004606A1
>00460714    jmp        004607AA
 00460719    mov        byte ptr [esp+14],0
 0046071E    xor        ebp,ebp
 00460720    mov        edx,1
 00460725    xor        edi,edi
 00460727    mov        ebx,dword ptr [esi+18040]
 0046072D    cmp        edx,ebx
>0046072F    jae        00460733
 00460731    mov        ebx,edx
 00460733    mov        al,byte ptr [esi+18044]
 00460739    mov        cl,bl
 0046073B    shl        al,cl
 0046073D    sub        edx,ebx
 0046073F    mov        ecx,edx
 00460741    mov        byte ptr [esi+18044],al
 00460747    mov        eax,edi
 00460749    shr        eax,cl
 0046074B    mov        cl,byte ptr [esi+18044]
 00460751    or         cl,al
 00460753    mov        byte ptr [esp+13],cl
 00460757    mov        byte ptr [esi+18044],cl
 0046075D    mov        ecx,edx
 0046075F    shl        eax,cl
 00460761    sub        edi,eax
 00460763    mov        eax,dword ptr [esi+18040]
 00460769    sub        eax,ebx
 0046076B    mov        dword ptr [esi+18040],eax
>00460771    jne        00460796
 00460773    mov        eax,dword ptr [esi+1803C]
 00460779    mov        cl,byte ptr [esp+13]
 0046077D    mov        byte ptr [eax],cl
 0046077F    mov        eax,dword ptr [esi+1803C]
 00460785    inc        eax
 00460786    mov        dword ptr [esi+18040],8
 00460790    mov        dword ptr [esi+1803C],eax
 00460796    cmp        edx,ebp
<00460798    ja         00460727
 0046079A    mov        ecx,0BD
 0046079F    xor        eax,eax
 004607A1    lea        edi,[esi+18C1C]
 004607A7    rep stos   dword ptr [edi]
 004607A9    stos       byte ptr [edi]
 004607AA    lea        edi,[esi+18190]
 004607B0    mov        ecx,edi
 004607B2    call       0045E97B
 004607B7    mov        edx,dword ptr [esp+14]
 004607BB    lea        eax,[esp+2C]
 004607BF    push       edx
 004607C0    push       ebp
 004607C1    push       2F5
 004607C6    push       eax
 004607C7    mov        ecx,esi
 004607C9    call       0046026F
 004607CE    lea        ecx,[esp+18]
 004607D2    push       ecx
 004607D3    mov        ecx,edi
 004607D5    call       0045EC7A
 004607DA    xor        eax,eax
 004607DC    mov        edx,4
 004607E1    mov        al,byte ptr [esp+ebp+18]
 004607E5    mov        edi,eax
 004607E7    mov        ebx,dword ptr [esi+18040]
 004607ED    cmp        edx,ebx
>004607EF    jae        004607F3
 004607F1    mov        ebx,edx
 004607F3    mov        al,byte ptr [esi+18044]
 004607F9    mov        cl,bl
 004607FB    shl        al,cl
 004607FD    sub        edx,ebx
 004607FF    mov        ecx,edx
 00460801    mov        byte ptr [esi+18044],al
 00460807    mov        eax,edi
 00460809    shr        eax,cl
 0046080B    mov        cl,byte ptr [esi+18044]
 00460811    or         cl,al
 00460813    mov        byte ptr [esp+13],cl
 00460817    mov        byte ptr [esi+18044],cl
 0046081D    mov        ecx,edx
 0046081F    shl        eax,cl
 00460821    sub        edi,eax
 00460823    mov        eax,dword ptr [esi+18040]
 00460829    sub        eax,ebx
 0046082B    mov        dword ptr [esi+18040],eax
>00460831    jne        00460856
 00460833    mov        ecx,dword ptr [esi+1803C]
 00460839    mov        al,byte ptr [esp+13]
 0046083D    mov        byte ptr [ecx],al
 0046083F    mov        eax,dword ptr [esi+1803C]
 00460845    inc        eax
 00460846    mov        dword ptr [esi+18040],8
 00460850    mov        dword ptr [esi+1803C],eax
 00460856    test       edx,edx
<00460858    ja         004607E7
 0046085A    inc        ebp
 0046085B    cmp        ebp,13
<0046085E    jb         004607DA
 00460864    mov        ecx,dword ptr [esp+14]
 00460868    lea        edx,[esp+2C]
 0046086C    push       ecx
 0046086D    push       1
 0046086F    push       2F5
 00460874    push       edx
 00460875    mov        ecx,esi
 00460877    call       0046026F
 0046087C    lea        eax,[esp+2C]
 00460880    push       2F5
 00460885    lea        ecx,[esi+18C1C]
 0046088B    push       eax
 0046088C    push       ecx
 0046088D    call       0045F3D7
 00460892    add        esp,0C
 00460895    mov        dword ptr [esi+18608],1
 0046089F    pop        edi
 004608A0    pop        ebp
 004608A1    pop        ebx
 004608A2    lea        edx,[esp+20]
 004608A6    push       2F5
 004608AB    add        esi,18F11
 004608B1    push       edx
 004608B2    push       esi
 004608B3    call       0045F3D7
 004608B8    add        esp,0C
 004608BB    pop        esi
 004608BC    add        esp,314
 004608C2    ret
*}
end;

//004608C3
//procedure sub_004608C3(?:?; ?:?; ?:?);
//begin
{*
 004608C3    push       ebx
 004608C4    mov        ebx,ecx
 004608C6    mov        eax,dword ptr [ebx+18628]
 004608CC    test       eax,eax
>004608CE    jne        004608E0
 004608D0    push       2D0
 004608D5    lea        ecx,[ebx+1804C]
 004608DB    call       0045EE17
 004608E0    lea        ecx,[ebx+1804C]
 004608E6    call       0045E97B
 004608EB    lea        ecx,[ebx+180B8]
 004608F1    call       0045E97B
 004608F6    lea        ecx,[ebx+18124]
 004608FC    call       0045E97B
 00460901    xor        eax,eax
 00460903    mov        dl,0D
 00460905    mov        cl,byte ptr [ebx+eax+18F11]
 0046090C    test       cl,cl
>0046090E    je         00460919
 00460910    mov        byte ptr [eax+ebx+18230],cl
>00460917    jmp        00460920
 00460919    mov        byte ptr [eax+ebx+18230],dl
 00460920    inc        eax
 00460921    cmp        eax,100
<00460926    jl         00460905
 00460928    push       ebp
 00460929    push       esi
 0046092A    mov        esi,0FFFE7B00
 0046092F    push       edi
 00460930    lea        eax,[ebx+18500]
 00460936    sub        esi,ebx
 00460938    xor        ecx,ecx
 0046093A    mov        cl,byte ptr [eax+134]
 00460940    mov        dl,byte ptr [ebx+ecx+191E2]
 00460947    test       dl,dl
>00460949    je         0046094F
 0046094B    mov        byte ptr [eax],dl
>0046094D    jmp        00460952
 0046094F    mov        byte ptr [eax],0A
 00460952    mov        cl,byte ptr [ecx+46AC70]
 00460958    mov        dl,byte ptr [eax]
 0046095A    add        dl,cl
 0046095C    mov        byte ptr [eax],dl
 0046095E    inc        eax
 0046095F    lea        edx,[esi+eax]
 00460962    cmp        edx,100
<00460968    jl         00460938
 0046096A    xor        ebp,ebp
 0046096C    lea        ecx,[ebx+18330]
 00460972    lea        esi,[ebx+19011]
 00460978    lea        eax,[ebx+18330]
 0046097E    sub        esi,eax
 00460980    mov        edi,8
 00460985    mov        dl,byte ptr [esi+ecx]
 00460988    test       dl,dl
>0046098A    jne        0046098E
 0046098C    mov        dl,8
 0046098E    mov        al,byte ptr [ebp+46AC8C]
 00460994    cmp        al,3
>00460996    jb         0046099A
 00460998    sub        al,3
 0046099A    add        al,dl
 0046099C    mov        byte ptr [ecx],al
 0046099E    inc        ecx
 0046099F    dec        edi
<004609A0    jne        00460985
 004609A2    inc        ebp
 004609A3    cmp        ebp,3A
<004609A6    jb         00460972
 004609A8    mov        edx,0FFFE7A00
 004609AD    pop        edi
 004609AE    pop        esi
 004609AF    lea        eax,[ebx+18600]
 004609B5    sub        edx,ebx
 004609B7    pop        ebp
 004609B8    mov        cl,byte ptr [eax+0BFE]
 004609BE    test       cl,cl
>004609C0    jne        004609C4
 004609C2    mov        cl,4
 004609C4    mov        byte ptr [eax],cl
 004609C6    inc        eax
 004609C7    lea        ecx,[edx+eax]
 004609CA    cmp        ecx,8
<004609CD    jb         004609B8
 004609CF    mov        byte ptr [ebx+1860C],0
 004609D6    pop        ebx
 004609D7    ret
*}
//end;

//004609D8
procedure sub_004609D8;
begin
{*
 004609D8    mov        eax,dword ptr [esp+8]
 004609DC    push       ebx
 004609DD    xor        ebx,ebx
 004609DF    push       ebp
 004609E0    push       esi
 004609E1    cmp        eax,ebx
 004609E3    push       edi
 004609E4    mov        esi,ecx
>004609E6    jne        004609F7
 004609E8    mov        eax,dword ptr [esp+28]
 004609EC    pop        edi
 004609ED    pop        esi
 004609EE    pop        ebp
 004609EF    mov        dword ptr [eax],ebx
 004609F1    xor        eax,eax
 004609F3    pop        ebx
 004609F4    ret        18
 004609F7    mov        ecx,dword ptr [esp+20]
 004609FB    mov        edx,dword ptr [esp+1C]
 004609FF    push       ecx
 00460A00    push       edx
 00460A01    push       eax
 00460A02    mov        eax,dword ptr [esp+20]
 00460A06    push       eax
 00460A07    mov        ecx,esi
 00460A09    call       0045FE3E
 00460A0E    mov        dword ptr [esp+18],ebx
 00460A12    mov        al,byte ptr [esi+1860C]
 00460A18    test       al,al
>00460A1A    je         00460A23
 00460A1C    mov        ecx,esi
 00460A1E    call       004608C3
 00460A23    lea        ecx,[esp+20]
 00460A27    push       ecx
 00460A28    mov        ecx,esi
 00460A2A    call       0045F841
 00460A2F    mov        edi,dword ptr [esi+18228]
 00460A35    mov        edx,dword ptr [esi+1822C]
 00460A3B    shl        edi,4
 00460A3E    add        edi,edx
 00460A40    cmp        eax,2
 00460A43    mov        ebp,eax
>00460A45    jb         00460B87
 00460A4B    sub        eax,2
 00460A4E    cmp        eax,7
>00460A51    jae        00460A5B
 00460A53    mov        byte ptr [edi+2],0
 00460A57    mov        edx,eax
>00460A59    jmp        00460A84
 00460A5B    mov        edx,7
 00460A60    mov        byte ptr [edi+2],1
 00460A64    sub        eax,edx
 00460A66    mov        cl,byte ptr [eax+esi+18634]
 00460A6D    mov        byte ptr [edi+3],cl
 00460A70    and        ecx,0FF
 00460A76    movzx      cx,byte ptr [ecx+46AC54]
 00460A7E    sub        eax,ecx
 00460A80    mov        word ptr [edi+4],ax
 00460A84    mov        eax,dword ptr [esp+20]
 00460A88    cmp        eax,400
>00460A8D    jae        00460A9C
 00460A8F    xor        ecx,ecx
 00460A91    mov        cl,byte ptr [eax+esi+18734]
 00460A98    mov        eax,ecx
>00460A9A    jmp        00460ACB
 00460A9C    cmp        eax,40000
>00460AA1    jae        00460AB6
 00460AA3    shr        eax,9
 00460AA6    xor        ecx,ecx
 00460AA8    mov        cl,byte ptr [eax+esi+18734]
 00460AAF    mov        eax,ecx
 00460AB1    add        eax,12
>00460AB4    jmp        00460ACB
 00460AB6    cmp        eax,200000
>00460ABB    jae        00460AC5
 00460ABD    shr        eax,11
 00460AC0    add        eax,22
>00460AC3    jmp        00460ACB
 00460AC5    shr        eax,12
 00460AC8    add        eax,2A
 00460ACB    lea        edx,[edx+eax*8+100]
 00460AD2    mov        word ptr [edi],dx
 00460AD5    mov        cl,byte ptr [eax+46AC8C]
 00460ADB    mov        byte ptr [edi+0C],cl
 00460ADE    mov        ecx,dword ptr [esp+20]
 00460AE2    mov        edx,dword ptr [esi+eax*4+18B34]
 00460AE9    mov        al,byte ptr [edi+0C]
 00460AEC    sub        ecx,edx
 00460AEE    cmp        al,3
 00460AF0    mov        dword ptr [edi+8],ecx
>00460AF3    jb         00460B04
 00460AF5    and        ecx,7
 00460AF8    push       ecx
 00460AF9    lea        ecx,[esi+18124]
 00460AFF    call       0045E99E
 00460B04    xor        edx,edx
 00460B06    lea        ecx,[esi+1804C]
 00460B0C    mov        dx,word ptr [edi]
 00460B0F    push       edx
 00460B10    call       0045E99E
 00460B15    mov        al,byte ptr [edi+2]
 00460B18    test       al,al
>00460B1A    je         00460B2D
 00460B1C    xor        eax,eax
 00460B1E    lea        ecx,[esi+180B8]
 00460B24    mov        al,byte ptr [edi+3]
 00460B27    push       eax
 00460B28    call       0045E99E
 00460B2D    mov        eax,dword ptr [esp+20]
 00460B31    cmp        eax,3
>00460B34    jae        00460B3F
 00460B36    mov        ecx,dword ptr [esi+eax*4+1821C]
>00460B3D    jmp        00460B42
 00460B3F    lea        ecx,[eax-3]
 00460B42    cmp        eax,3
>00460B45    jae        00460B67
 00460B47    cmp        eax,ebx
>00460B49    je         00460BC3
 00460B4B    mov        edx,dword ptr [esi+eax*4+1821C]
 00460B52    mov        ecx,dword ptr [esi+1821C]
 00460B58    mov        dword ptr [esi+1821C],edx
 00460B5E    mov        dword ptr [esi+eax*4+1821C],ecx
>00460B65    jmp        00460BC3
 00460B67    mov        eax,dword ptr [esi+18220]
 00460B6D    mov        edx,dword ptr [esi+1821C]
 00460B73    mov        dword ptr [esi+18224],eax
 00460B79    mov        dword ptr [esi+18220],edx
 00460B7F    mov        dword ptr [esi+1821C],ecx
>00460B85    jmp        00460BC3
 00460B87    mov        eax,dword ptr [esi+1800C]
 00460B8D    mov        ecx,dword ptr [esi+18008]
 00460B93    mov        ebx,dword ptr [esi+1820C]
 00460B99    add        eax,ecx
 00460B9B    sub        eax,ebx
 00460B9D    mov        bl,byte ptr [eax]
 00460B9F    mov        byte ptr [esp+1C],bl
 00460BA3    mov        ecx,dword ptr [esp+1C]
 00460BA7    and        ecx,0FF
 00460BAD    push       ecx
 00460BAE    lea        ecx,[esi+1804C]
 00460BB4    call       0045E99E
 00460BB9    xor        dx,dx
 00460BBC    mov        dl,bl
 00460BBE    xor        ebx,ebx
 00460BC0    mov        word ptr [edi],dx
 00460BC3    mov        eax,dword ptr [esi+18228]
 00460BC9    mov        ecx,dword ptr [esi+1822C]
 00460BCF    shl        eax,4
 00460BD2    mov        edx,dword ptr [esp+18]
 00460BD6    mov        word ptr [eax+ecx+6],bp
 00460BDB    mov        edi,dword ptr [esi+1820C]
 00460BE1    mov        eax,dword ptr [esi+18228]
 00460BE7    sub        edi,ebp
 00460BE9    mov        dword ptr [esi+1820C],edi
 00460BEF    mov        ecx,edi
 00460BF1    mov        edi,dword ptr [esi+1861C]
 00460BF7    add        edx,ebp
 00460BF9    add        edi,ebp
 00460BFB    mov        dword ptr [esp+18],edx
 00460BFF    mov        edx,edi
 00460C01    inc        eax
 00460C02    cmp        edx,0EEF7
 00460C08    mov        dword ptr [esi+18228],eax
 00460C0E    mov        dword ptr [esi+1861C],edi
>00460C14    jae        00460C1D
 00460C16    cmp        eax,2000
>00460C1B    jb         00460C2D
 00460C1D    mov        edx,dword ptr [esi+18210]
 00460C23    mov        eax,dword ptr [esi+18214]
 00460C29    cmp        edx,eax
>00460C2B    je         00460C49
 00460C2D    cmp        ecx,ebx
<00460C2F    jne        00460A12
 00460C35    mov        eax,dword ptr [esi+18004]
 00460C3B    mov        ecx,dword ptr [esi+1800C]
 00460C41    sub        eax,ecx
<00460C43    jne        00460A12
 00460C49    mov        ecx,dword ptr [esi+18210]
 00460C4F    mov        eax,dword ptr [esi+18214]
 00460C55    cmp        ecx,eax
>00460C57    jne        00460D53
 00460C5D    mov        ecx,esi
 00460C5F    call       0045FFA2
 00460C64    test       al,al
>00460C66    je         00460D66
 00460C6C    mov        edx,dword ptr [esi+18628]
 00460C72    mov        ecx,dword ptr [esi+1862C]
 00460C78    inc        edx
 00460C79    mov        eax,edx
 00460C7B    mov        dword ptr [esi+18628],edx
 00460C81    cmp        eax,ecx
>00460C83    jne        00460D1B
 00460C89    cmp        dword ptr [esi+1820C],ebx
>00460C8F    jne        00460CA5
 00460C91    mov        edx,dword ptr [esi+18004]
 00460C97    mov        eax,dword ptr [esi+1800C]
 00460C9D    sub        edx,eax
>00460C9F    je         00460D72
 00460CA5    mov        eax,dword ptr [esp+24]
 00460CA9    cmp        eax,ebx
>00460CAB    je         00460CDD
 00460CAD    mov        ecx,dword ptr [esi+18040]
 00460CB3    mov        edi,dword ptr [esi+18048]
 00460CB9    mov        edx,dword ptr [esi+1803C]
 00460CBF    cmp        ecx,8
 00460CC2    sbb        ecx,ecx
 00460CC4    neg        ecx
 00460CC6    sub        ecx,edi
 00460CC8    add        ecx,edx
 00460CCA    mov        edx,dword ptr [esp+18]
 00460CCE    push       ecx
 00460CCF    push       edx
 00460CD0    call       eax
 00460CD2    add        esp,8
 00460CD5    cmp        eax,ebx
>00460CD7    jne        00460E20
 00460CDD    mov        eax,dword ptr [esi+1861C]
 00460CE3    mov        ecx,dword ptr [esi+18624]
 00460CE9    add        ecx,eax
 00460CEB    mov        dword ptr [esi+18628],ebx
 00460CF1    mov        dword ptr [esi+18624],ecx
 00460CF7    lea        eax,[esi+18610]
 00460CFD    mov        ecx,3
 00460D02    mov        edx,dword ptr [eax-3F4]
 00460D08    mov        dword ptr [eax],edx
 00460D0A    add        eax,4
 00460D0D    dec        ecx
<00460D0E    jne        00460D02
 00460D10    mov        dword ptr [esi+1861C],ebx
<00460D16    jmp        00460A12
 00460D1B    mov        eax,dword ptr [esi+18624]
 00460D21    mov        ecx,dword ptr [esi]
 00460D23    sub        ecx,eax
 00460D25    mov        dword ptr [esp+18],eax
 00460D29    mov        dword ptr [esi+1820C],ecx
 00460D2F    lea        eax,[esi+1821C]
 00460D35    mov        ecx,3
 00460D3A    mov        edx,dword ptr [eax+3F4]
 00460D40    mov        dword ptr [eax],edx
 00460D42    add        eax,4
 00460D45    dec        ecx
<00460D46    jne        00460D3A
 00460D48    mov        dword ptr [esi+1861C],ebx
<00460D4E    jmp        00460A12
 00460D53    lea        eax,[esp+28]
 00460D57    push       45F64A
 00460D5C    push       eax
 00460D5D    mov        dword ptr [esp+30],3D186
 00460D65    int        3
 00460D66    pop        edi
 00460D67    pop        esi
 00460D68    pop        ebp
 00460D69    mov        eax,1
 00460D6E    pop        ebx
 00460D6F    ret        18
 00460D72    mov        edx,dword ptr [esi+18040]
 00460D78    mov        ebp,8
 00460D7D    cmp        edx,ebp
>00460D7F    jae        00460DFC
 00460D81    xor        edi,edi
 00460D83    cmp        edx,ebx
>00460D85    jbe        00460DF6
 00460D87    mov        ebx,dword ptr [esi+18040]
 00460D8D    cmp        edx,ebx
>00460D8F    jae        00460D93
 00460D91    mov        ebx,edx
 00460D93    mov        al,byte ptr [esi+18044]
 00460D99    mov        cl,bl
 00460D9B    shl        al,cl
 00460D9D    sub        edx,ebx
 00460D9F    mov        ecx,edx
 00460DA1    mov        byte ptr [esi+18044],al
 00460DA7    mov        eax,edi
 00460DA9    shr        eax,cl
 00460DAB    mov        cl,byte ptr [esi+18044]
 00460DB1    or         cl,al
 00460DB3    mov        byte ptr [esp+18],cl
 00460DB7    mov        byte ptr [esi+18044],cl
 00460DBD    mov        ecx,edx
 00460DBF    shl        eax,cl
 00460DC1    sub        edi,eax
 00460DC3    mov        eax,dword ptr [esi+18040]
 00460DC9    sub        eax,ebx
 00460DCB    mov        dword ptr [esi+18040],eax
>00460DD1    jne        00460DF2
 00460DD3    mov        ecx,dword ptr [esi+1803C]
 00460DD9    mov        al,byte ptr [esp+18]
 00460DDD    mov        byte ptr [ecx],al
 00460DDF    mov        eax,dword ptr [esi+1803C]
 00460DE5    inc        eax
 00460DE6    mov        dword ptr [esi+18040],ebp
 00460DEC    mov        dword ptr [esi+1803C],eax
 00460DF2    test       edx,edx
<00460DF4    ja         00460D87
 00460DF6    mov        dword ptr [esi+18040],ebp
 00460DFC    mov        ebx,dword ptr [esi+18040]
 00460E02    mov        edx,dword ptr [esi+18048]
 00460E08    mov        eax,dword ptr [esi+1803C]
 00460E0E    cmp        ebx,ebp
 00460E10    sbb        ecx,ecx
 00460E12    neg        ecx
 00460E14    sub        ecx,edx
 00460E16    mov        edx,dword ptr [esp+28]
 00460E1A    add        ecx,eax
 00460E1C    xor        eax,eax
 00460E1E    mov        dword ptr [edx],ecx
 00460E20    pop        edi
 00460E21    pop        esi
 00460E22    pop        ebp
 00460E23    pop        ebx
 00460E24    ret        18
*}
end;

//00460E27
function sub_00460E27:Integer;
begin
{*
 00460E27    mov        ecx,dword ptr [esp+14]
 00460E2B    mov        eax,dword ptr [esp+18]
 00460E2F    lea        edx,[ecx+19208]
 00460E35    mov        dword ptr [eax],ecx
 00460E37    mov        eax,dword ptr [esp+10]
 00460E3B    push       edx
 00460E3C    mov        edx,dword ptr [esp+10]
 00460E40    push       eax
 00460E41    mov        eax,dword ptr [esp+10]
 00460E45    push       edx
 00460E46    mov        edx,dword ptr [esp+10]
 00460E4A    push       eax
 00460E4B    push       edx
 00460E4C    call       0045FD2A
 00460E51    ret
*}
end;

//00460E52
procedure sub_00460E52;
begin
{*
 00460E52    mov        eax,dword ptr [esp+1C]
 00460E56    mov        ecx,dword ptr [esp+18]
 00460E5A    mov        edx,dword ptr [esp+14]
 00460E5E    push       eax
 00460E5F    mov        eax,dword ptr [esp+14]
 00460E63    push       ecx
 00460E64    mov        ecx,dword ptr [esp+14]
 00460E68    push       edx
 00460E69    mov        edx,dword ptr [esp+14]
 00460E6D    push       eax
 00460E6E    push       ecx
 00460E6F    mov        ecx,dword ptr [esp+18]
 00460E73    push       edx
 00460E74    call       004609D8
 00460E79    ret
*}
end;

end.