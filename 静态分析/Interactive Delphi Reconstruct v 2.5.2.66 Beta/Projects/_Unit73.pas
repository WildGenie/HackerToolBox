{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit73;

interface

uses
  Classes, Windows, Graphics;

type
  TResPatch = class(TObject)
  public
    f4:Integer;//f4
    f8:Pointer;//f8
    fC:dword;//fC
    f10:dword;//f10
    destructor Destroy; virtual;
    //constructor Create(?:TResPatch; _Dv__:Boolean);
  end;

implementation

{$R *.DFM}

//0045E168
//function sub_0045E168(?:dword):?;
//begin
{*
 0045E168    mov        edx,eax
 0045E16A    add        edx,dword ptr [eax+3C]
 0045E16D    mov        eax,edx
 0045E16F    ret
*}
//end;

//0045E170
//function sub_0045E170(?:dword; ?:?):?;
//begin
{*
 0045E170    push       ebp
 0045E171    mov        ebp,esp
 0045E173    push       ecx
 0045E174    push       ebx
 0045E175    push       esi
 0045E176    push       edi
 0045E177    mov        ebx,edx
 0045E179    xor        edx,edx
 0045E17B    mov        dword ptr [ebp-4],edx
 0045E17E    call       0045E168
 0045E183    mov        edx,eax
 0045E185    mov        eax,edx
 0045E187    add        eax,0F8
 0045E18C    movzx      edx,word ptr [edx+6]
 0045E190    test       edx,edx
>0045E192    jbe        0045E1C7
 0045E194    mov        edi,dword ptr [eax+0C]
 0045E197    cmp        ebx,edi
>0045E199    jb         0045E1A2
 0045E19B    add        edi,dword ptr [eax+8]
 0045E19E    cmp        ebx,edi
>0045E1A0    jb         0045E1B0
 0045E1A2    mov        esi,dword ptr [eax+0C]
 0045E1A5    cmp        ebx,esi
>0045E1A7    jb         0045E1C1
 0045E1A9    add        esi,dword ptr [eax+10]
 0045E1AC    cmp        ebx,esi
>0045E1AE    jae        0045E1C1
 0045E1B0    cmp        dword ptr [eax+0C],0
>0045E1B4    je         0045E1C1
 0045E1B6    add        ebx,dword ptr [eax+14]
 0045E1B9    sub        ebx,dword ptr [eax+0C]
 0045E1BC    mov        dword ptr [ebp-4],ebx
>0045E1BF    jmp        0045E1C7
 0045E1C1    add        eax,28
 0045E1C4    dec        edx
<0045E1C5    jne        0045E194
 0045E1C7    mov        eax,dword ptr [ebp-4]
 0045E1CA    pop        edi
 0045E1CB    pop        esi
 0045E1CC    pop        ebx
 0045E1CD    pop        ecx
 0045E1CE    pop        ebp
 0045E1CF    ret
*}
//end;

//0045E1D0
//function sub_0045E1D0(?:dword; ?:?):?;
//begin
{*
 0045E1D0    push       ebp
 0045E1D1    mov        ebp,esp
 0045E1D3    push       ebx
 0045E1D4    push       esi
 0045E1D5    push       edi
 0045E1D6    mov        ebx,edx
 0045E1D8    xor        esi,esi
 0045E1DA    call       0045E168
 0045E1DF    mov        edx,eax
 0045E1E1    mov        eax,edx
 0045E1E3    add        eax,0F8
 0045E1E8    movzx      edi,word ptr [edx+6]
 0045E1EC    test       edi,edi
>0045E1EE    jbe        0045E20F
 0045E1F0    mov        edx,dword ptr [eax+14]
 0045E1F3    cmp        ebx,edx
>0045E1F5    jb         0045E209
 0045E1F7    mov        ecx,edx
 0045E1F9    add        ecx,dword ptr [eax+10]
 0045E1FC    cmp        ebx,ecx
>0045E1FE    jae        0045E209
 0045E200    mov        esi,dword ptr [eax+0C]
 0045E203    add        esi,ebx
 0045E205    sub        esi,edx
>0045E207    jmp        0045E20F
 0045E209    add        eax,28
 0045E20C    dec        edi
<0045E20D    jne        0045E1F0
 0045E20F    mov        eax,esi
 0045E211    pop        edi
 0045E212    pop        esi
 0045E213    pop        ebx
 0045E214    pop        ebp
 0045E215    ret
*}
//end;

//0045E218
//function sub_0045E218(?:dword):?;
//begin
{*
 0045E218    push       ebp
 0045E219    mov        ebp,esp
 0045E21B    push       ebx
 0045E21C    mov        ebx,eax
 0045E21E    mov        eax,ebx
 0045E220    call       0045E168
 0045E225    mov        edx,dword ptr [eax+88]
 0045E22B    mov        eax,ebx
 0045E22D    call       0045E170
 0045E232    pop        ebx
 0045E233    pop        ebp
 0045E234    ret
*}
//end;

//0045E238
//constructor TResPatch.Create(?:TResPatch; _Dv__:Boolean);
//begin
{*
 0045E238    push       ebp
 0045E239    mov        ebp,esp
 0045E23B    push       ebx
 0045E23C    push       esi
 0045E23D    test       dl,dl
>0045E23F    je         0045E249
 0045E241    add        esp,0FFFFFFF0
 0045E244    call       @ClassCreate
 0045E249    mov        ebx,edx
 0045E24B    mov        esi,eax
 0045E24D    xor        edx,edx
 0045E24F    mov        eax,esi
 0045E251    call       TObject.Create
 0045E256    xor        eax,eax
 0045E258    mov        dword ptr [esi+8],eax; TResPatch.?f8:Pointer
 0045E25B    xor        eax,eax
 0045E25D    mov        dword ptr [esi+4],eax; TResPatch.?f4:Integer
 0045E260    mov        eax,esi
 0045E262    test       bl,bl
>0045E264    je         0045E275
 0045E266    call       @AfterConstruction
 0045E26B    pop        dword ptr fs:[0]
 0045E272    add        esp,0C
 0045E275    mov        eax,esi
 0045E277    pop        esi
 0045E278    pop        ebx
 0045E279    pop        ebp
 0045E27A    ret
*}
//end;

//0045E27C
destructor TResPatch.Destroy;
begin
{*
 0045E27C    push       ebp
 0045E27D    mov        ebp,esp
 0045E27F    push       ebx
 0045E280    push       esi
 0045E281    call       @BeforeDestruction
 0045E286    mov        ebx,edx
 0045E288    mov        esi,eax
 0045E28A    mov        eax,dword ptr [esi+4]; TResPatch.?f4:Integer
 0045E28D    test       eax,eax
>0045E28F    je         0045E29B
 0045E291    mov        edx,eax
 0045E293    mov        eax,dword ptr [esi+8]; TResPatch.?f8:Pointer
 0045E296    call       @FreeMem
 0045E29B    xor        edx,edx
 0045E29D    mov        eax,esi
 0045E29F    call       TObject.Create
 0045E2A4    test       bl,bl
>0045E2A6    jle        0045E2AF
 0045E2A8    mov        eax,esi
 0045E2AA    call       @ClassDestroy
 0045E2AF    pop        esi
 0045E2B0    pop        ebx
 0045E2B1    pop        ebp
 0045E2B2    ret
*}
end;

//0045E2B4
//procedure sub_0045E2B4(?:?; ?:?; ?:?);
//begin
{*
 0045E2B4    push       ebp
 0045E2B5    mov        ebp,esp
 0045E2B7    mov        ecx,dword ptr [ebp+8]
 0045E2BA    mov        ecx,dword ptr [ecx-4]
 0045E2BD    mov        dword ptr [ecx],eax
 0045E2BF    mov        eax,dword ptr [ebp+8]
 0045E2C2    mov        eax,dword ptr [eax-4]
 0045E2C5    mov        word ptr [eax+4],dx
 0045E2C9    mov        eax,dword ptr [ebp+8]
 0045E2CC    add        dword ptr [eax-4],6
 0045E2D0    mov        eax,dword ptr [ebp+8]
 0045E2D3    mov        eax,dword ptr [eax-8]
 0045E2D6    inc        dword ptr [eax+10]
 0045E2D9    pop        ebp
 0045E2DA    ret
*}
//end;

//0045E2DC
//function sub_0045E2DC(?:?; ?:?; ?:?):Integer;
//begin
{*
 0045E2DC    push       ebp
 0045E2DD    mov        ebp,esp
 0045E2DF    push       ebx
 0045E2E0    push       esi
 0045E2E1    push       edi
 0045E2E2    mov        edi,ecx
 0045E2E4    mov        ebx,edx
 0045E2E6    mov        esi,eax
 0045E2E8    test       ebx,ebx
>0045E2EA    jne        0045E2EF
 0045E2EC    or         ebx,0FFFFFFFF
 0045E2EF    push       0
 0045E2F1    push       0
 0045E2F3    push       0
 0045E2F5    push       0
 0045E2F7    push       ebx
 0045E2F8    push       esi
 0045E2F9    push       0
 0045E2FB    push       0
 0045E2FD    call       kernel32.WideCharToMultiByte
 0045E302    mov        ebx,eax
 0045E304    mov        eax,edi
 0045E306    mov        edx,ebx
 0045E308    call       @LStrSetLength
 0045E30D    push       0
 0045E30F    push       0
 0045E311    push       ebx
 0045E312    mov        eax,dword ptr [edi]
 0045E314    call       @LStrToPChar
 0045E319    push       eax
 0045E31A    push       ebx
 0045E31B    push       esi
 0045E31C    push       0
 0045E31E    push       0
 0045E320    call       kernel32.WideCharToMultiByte
 0045E325    pop        edi
 0045E326    pop        esi
 0045E327    pop        ebx
 0045E328    pop        ebp
 0045E329    ret
*}
//end;

//0045E32C
//procedure sub_0045E32C(?:TResPatch; ?:dword);
//begin
{*
 0045E32C    push       ebp
 0045E32D    mov        ebp,esp
 0045E32F    add        esp,0FFFFFFE0
 0045E332    push       ebx
 0045E333    push       esi
 0045E334    push       edi
 0045E335    xor        ecx,ecx
 0045E337    mov        dword ptr [ebp-20],ecx
 0045E33A    mov        dword ptr [ebp-0C],edx
 0045E33D    mov        dword ptr [ebp-8],eax
 0045E340    xor        eax,eax
 0045E342    push       ebp
 0045E343    push       45E4F1
 0045E348    push       dword ptr fs:[eax]
 0045E34B    mov        dword ptr fs:[eax],esp
 0045E34E    mov        eax,dword ptr [ebp-0C]
 0045E351    call       0045E218
 0045E356    mov        dword ptr [ebp-10],eax
 0045E359    mov        edx,dword ptr [ebp-10]
 0045E35C    mov        eax,dword ptr [ebp-0C]
 0045E35F    call       0045E1D0
 0045E364    mov        edx,dword ptr [ebp-8]
 0045E367    mov        dword ptr [edx+0C],eax; TResPatch.?fC:dword
 0045E36A    mov        eax,dword ptr [ebp-0C]
 0045E36D    add        eax,dword ptr [ebp-10]
 0045E370    mov        esi,eax
 0045E372    add        esi,10
 0045E375    mov        dx,word ptr [eax+0C]
 0045E379    mov        word ptr [ebp-16],dx
 0045E37D    mov        bx,word ptr [eax+0E]
 0045E381    movzx      edx,dx
 0045E384    movzx      eax,word ptr [eax+0E]
 0045E388    add        edx,eax
 0045E38A    inc        edx
 0045E38B    mov        eax,edx
 0045E38D    add        eax,eax
 0045E38F    lea        eax,[eax+eax*2]
 0045E392    mov        edx,dword ptr [ebp-8]
 0045E395    mov        dword ptr [edx+4],eax; TResPatch.?f4:Integer
 0045E398    mov        eax,dword ptr [ebp-8]
 0045E39B    mov        eax,dword ptr [eax+4]; TResPatch.?f4:Integer
 0045E39E    shr        eax,3
 0045E3A1    test       eax,eax
>0045E3A3    je         0045E3AF
 0045E3A5    inc        eax
 0045E3A6    shl        eax,3
 0045E3A9    mov        edx,dword ptr [ebp-8]
 0045E3AC    mov        dword ptr [edx+4],eax; TResPatch.?f4:Integer
 0045E3AF    mov        eax,dword ptr [ebp-8]
 0045E3B2    mov        eax,dword ptr [eax+4]; TResPatch.?f4:Integer
 0045E3B5    call       @GetMem
 0045E3BA    mov        edi,eax
 0045E3BC    mov        eax,dword ptr [ebp-8]
 0045E3BF    mov        dword ptr [eax+8],edi; TResPatch.?f8:Pointer
 0045E3C2    mov        dword ptr [ebp-4],edi
 0045E3C5    mov        eax,dword ptr [ebp-8]
 0045E3C8    xor        edx,edx
 0045E3CA    mov        dword ptr [eax+10],edx; TResPatch.?f10:dword
 0045E3CD    movzx      eax,word ptr [ebp-16]
 0045E3D1    movzx      edx,bx
 0045E3D4    add        eax,edx
 0045E3D6    test       eax,eax
>0045E3D8    jle        0045E4A1
 0045E3DE    mov        dword ptr [ebp-1C],eax
 0045E3E1    mov        dword ptr [ebp-14],1
 0045E3E8    movzx      eax,word ptr [ebp-16]
 0045E3EC    cmp        eax,dword ptr [ebp-14]
>0045E3EF    jl         0045E404
 0045E3F1    mov        bl,1
 0045E3F3    mov        edi,dword ptr [ebp-0C]
 0045E3F6    add        edi,dword ptr [ebp-10]
 0045E3F9    mov        eax,dword ptr [esi]
 0045E3FB    and        eax,7FFFFFFF
 0045E400    add        edi,eax
>0045E402    jmp        0045E408
 0045E404    xor        ebx,ebx
 0045E406    mov        edi,dword ptr [esi]
 0045E408    test       bl,bl
>0045E40A    je         0045E429
 0045E40C    lea        ecx,[ebp-20]
 0045E40F    movzx      edx,word ptr [edi]
 0045E412    lea        eax,[edi+2]
 0045E415    call       0045E2DC
 0045E41A    mov        eax,dword ptr [ebp-20]
 0045E41D    mov        edx,45E508; 'TYPELIB'
 0045E422    call       @LStrCmp
>0045E427    jne        0045E442
 0045E429    test       bl,bl
>0045E42B    jne        0045E492
 0045E42D    dec        edi
 0045E42E    sub        edi,3
>0045E431    jb         0045E492
 0045E433    sub        edi,8
>0045E436    je         0045E492
 0045E438    sub        edi,2
>0045E43B    je         0045E492
 0045E43D    sub        edi,2
>0045E440    je         0045E492
 0045E442    mov        ebx,dword ptr [ebp-0C]
 0045E445    add        ebx,dword ptr [ebp-10]
 0045E448    mov        eax,dword ptr [esi+4]
 0045E44B    and        eax,7FFFFFFF
 0045E450    add        ebx,eax
 0045E452    cmp        word ptr [ebx+0C],0
>0045E457    je         0045E472
 0045E459    push       ebp
 0045E45A    lea        edx,[ebx+0C]
 0045E45D    sub        edx,dword ptr [ebp-0C]
 0045E460    mov        eax,dword ptr [ebp-0C]
 0045E463    call       0045E1D0
 0045E468    mov        dx,word ptr [ebx+0C]
 0045E46C    call       0045E2B4
 0045E471    pop        ecx
 0045E472    cmp        word ptr [ebx+0E],0
>0045E477    je         0045E492
 0045E479    push       ebp
 0045E47A    lea        edx,[ebx+0E]
 0045E47D    sub        edx,dword ptr [ebp-0C]
 0045E480    mov        eax,dword ptr [ebp-0C]
 0045E483    call       0045E1D0
 0045E488    mov        dx,word ptr [ebx+0E]
 0045E48C    call       0045E2B4
 0045E491    pop        ecx
 0045E492    add        esi,8
 0045E495    inc        dword ptr [ebp-14]
 0045E498    dec        dword ptr [ebp-1C]
<0045E49B    jne        0045E3E8
 0045E4A1    mov        eax,dword ptr [ebp-8]
 0045E4A4    cmp        dword ptr [eax+10],0; TResPatch.?f10:dword
>0045E4A8    jle        0045E4B5
 0045E4AA    push       ebp
 0045E4AB    xor        edx,edx
 0045E4AD    xor        eax,eax
 0045E4AF    call       0045E2B4
 0045E4B4    pop        ecx
 0045E4B5    mov        eax,dword ptr [ebp-8]
 0045E4B8    mov        eax,dword ptr [eax+10]; TResPatch.?f10:dword
 0045E4BB    add        eax,eax
 0045E4BD    lea        eax,[eax+eax*2]
 0045E4C0    mov        edx,dword ptr [ebp-8]
 0045E4C3    mov        dword ptr [edx+4],eax; TResPatch.?f4:Integer
 0045E4C6    mov        edx,eax
 0045E4C8    shr        edx,3
 0045E4CB    test       edx,edx
>0045E4CD    je         0045E4DB
 0045E4CF    inc        edx
 0045E4D0    mov        eax,edx
 0045E4D2    shl        eax,3
 0045E4D5    mov        edx,dword ptr [ebp-8]
 0045E4D8    mov        dword ptr [edx+4],eax; TResPatch.?f4:Integer
 0045E4DB    xor        eax,eax
 0045E4DD    pop        edx
 0045E4DE    pop        ecx
 0045E4DF    pop        ecx
 0045E4E0    mov        dword ptr fs:[eax],edx
 0045E4E3    push       45E4F8
 0045E4E8    lea        eax,[ebp-20]
 0045E4EB    call       @LStrClr
 0045E4F0    ret
<0045E4F1    jmp        @HandleFinally
<0045E4F6    jmp        0045E4E8
 0045E4F8    pop        edi
 0045E4F9    pop        esi
 0045E4FA    pop        ebx
 0045E4FB    mov        esp,ebp
 0045E4FD    pop        ebp
 0045E4FE    ret
*}
//end;

//0045E510
//procedure sub_0045E510(?:TResPatch; ?:Pointer);
//begin
{*
 0045E510    push       ebx
 0045E511    push       esi
 0045E512    mov        ebx,dword ptr [eax+8]; TResPatch.?f8:Pointer
 0045E515    mov        ecx,dword ptr [eax+10]; TResPatch.?f10:dword
 0045E518    dec        ecx
 0045E519    test       ecx,ecx
>0045E51B    jle        0045E52F
 0045E51D    mov        esi,dword ptr [ebx]
 0045E51F    sub        esi,dword ptr [eax+0C]
 0045E522    add        esi,edx
 0045E524    mov        word ptr [esi],1
 0045E529    add        ebx,6
 0045E52C    dec        ecx
<0045E52D    jne        0045E51D
 0045E52F    pop        esi
 0045E530    pop        ebx
 0045E531    ret
*}
//end;

end.