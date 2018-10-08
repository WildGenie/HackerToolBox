{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit62;

interface

uses
  Classes, Windows, Graphics, Placemnt;

type
  TPropInfoList = class(TObject)
  public
    f4:Pointer;//f4
    f8:Integer;//f8
    fC:dword;//fC
    destructor Destroy; virtual;
    //constructor Create(?:TPropInfoList; _Dv__:Boolean; ?:?);
  end;
  TPropsStorage = class(TObject)
  public
    f4:TObject;//f4
    f8:TComponent;//f8
    fC:String;//fC
    f10:String;//f10
    //f18:?;//f18
    f1A:word;//f1A
    f1C:TFormStorage;//f1C
    //f20:?;//f20
    f22:word;//f22
    f24:TFormStorage;//f24
    f28:dword;//f28
    f2A:word;//f2A
    f2C:dword;//f2C
    //procedure sub_0045949C(?:?; ?:?; ?:?; ?:?); virtual;
    //function sub_004594D8(?:?):TPropsStorage; virtual;
    function sub_004594F4:TPropsStorage; virtual;
    //procedure sub_00457920(?:?; ?:?); virtual;
    function sub_00459488():TPropsStorage; virtual;
  end;

implementation

{$R *.DFM}

//00457480
//function sub_00457480(?:?):?;
//begin
{*
 00457480    mov        eax,dword ptr [eax]
 00457482    mov        eax,dword ptr [eax]
 00457484    ret
*}
//end;

//00457488
//constructor TPropInfoList.Create(?:TPropInfoList; _Dv__:Boolean; ?:?);
//begin
{*
 00457488    push       ebp
 00457489    mov        ebp,esp
 0045748B    push       ecx
 0045748C    push       ebx
 0045748D    push       esi
 0045748E    push       edi
 0045748F    test       dl,dl
>00457491    je         0045749B
 00457493    add        esp,0FFFFFFF0
 00457496    call       @ClassCreate
 0045749B    mov        esi,ecx
 0045749D    mov        byte ptr [ebp-1],dl
 004574A0    mov        ebx,eax
 004574A2    mov        edi,dword ptr [ebp+8]
 004574A5    test       esi,esi
>004574A7    je         004574E3
 004574A9    mov        eax,dword ptr [esi]
 004574AB    call       TObject.ClassInfo
 004574B0    xor        ecx,ecx
 004574B2    mov        edx,edi
 004574B4    call       GetPropList
 004574B9    mov        dword ptr [ebx+8],eax; TPropInfoList.?f8:Integer
 004574BC    mov        eax,dword ptr [ebx+8]; TPropInfoList.?f8:Integer
 004574BF    shl        eax,2
 004574C2    mov        dword ptr [ebx+0C],eax; TPropInfoList.?fC:dword
 004574C5    mov        eax,dword ptr [ebx+0C]; TPropInfoList.?fC:dword
 004574C8    call       @GetMem
 004574CD    mov        dword ptr [ebx+4],eax; TPropInfoList.?f4:Pointer
 004574D0    mov        eax,dword ptr [esi]
 004574D2    call       TObject.ClassInfo
 004574D7    mov        ecx,dword ptr [ebx+4]; TPropInfoList.?f4:Pointer
 004574DA    mov        edx,edi
 004574DC    call       GetPropList
>004574E1    jmp        004574ED
 004574E3    xor        eax,eax
 004574E5    mov        dword ptr [ebx+8],eax; TPropInfoList.?f8:Integer
 004574E8    xor        eax,eax
 004574EA    mov        dword ptr [ebx+4],eax; TPropInfoList.?f4:Pointer
 004574ED    mov        eax,ebx
 004574EF    cmp        byte ptr [ebp-1],0
>004574F3    je         00457504
 004574F5    call       @AfterConstruction
 004574FA    pop        dword ptr fs:[0]
 00457501    add        esp,0C
 00457504    mov        eax,ebx
 00457506    pop        edi
 00457507    pop        esi
 00457508    pop        ebx
 00457509    pop        ecx
 0045750A    pop        ebp
 0045750B    ret        4
*}
//end;

//00457510
destructor TPropInfoList.Destroy;
begin
{*
 00457510    push       ebp
 00457511    mov        ebp,esp
 00457513    push       ebx
 00457514    push       esi
 00457515    call       @BeforeDestruction
 0045751A    mov        ebx,edx
 0045751C    mov        esi,eax
 0045751E    mov        eax,dword ptr [esi+4]; TPropInfoList.?f4:Pointer
 00457521    test       eax,eax
>00457523    je         0045752D
 00457525    mov        edx,dword ptr [esi+0C]; TPropInfoList.?fC:dword
 00457528    call       @FreeMem
 0045752D    test       bl,bl
>0045752F    jle        00457538
 00457531    mov        eax,esi
 00457533    call       @ClassDestroy
 00457538    pop        esi
 00457539    pop        ebx
 0045753A    pop        ebp
 0045753B    ret
*}
end;

//0045753C
//function sub_0045753C(?:TObject; ?:AnsiString):?;
//begin
{*
 0045753C    push       ebp
 0045753D    mov        ebp,esp
 0045753F    add        esp,0FFFFFFF4
 00457542    push       ebx
 00457543    push       esi
 00457544    push       edi
 00457545    xor        ecx,ecx
 00457547    mov        dword ptr [ebp-0C],ecx
 0045754A    mov        dword ptr [ebp-4],edx
 0045754D    mov        edi,eax
 0045754F    xor        eax,eax
 00457551    push       ebp
 00457552    push       4575B2
 00457557    push       dword ptr fs:[eax]
 0045755A    mov        dword ptr fs:[eax],esp
 0045755D    mov        esi,dword ptr [edi+8]
 00457560    dec        esi
 00457561    test       esi,esi
>00457563    jl         0045759A
 00457565    inc        esi
 00457566    xor        ebx,ebx
 00457568    mov        eax,dword ptr [edi+4]
 0045756B    mov        eax,dword ptr [eax+ebx*4]
 0045756E    mov        dword ptr [ebp-8],eax
 00457571    lea        eax,[ebp-0C]
 00457574    mov        edx,dword ptr [ebp-8]
 00457577    add        edx,1A
 0045757A    call       @LStrFromString
 0045757F    mov        eax,dword ptr [ebp-0C]
 00457582    mov        edx,dword ptr [ebp-4]
 00457585    call       CompareText
 0045758A    test       eax,eax
>0045758C    jne        00457596
 0045758E    mov        eax,dword ptr [edi+4]
 00457591    mov        ebx,dword ptr [eax+ebx*4]
>00457594    jmp        0045759C
 00457596    inc        ebx
 00457597    dec        esi
<00457598    jne        00457568
 0045759A    xor        ebx,ebx
 0045759C    xor        eax,eax
 0045759E    pop        edx
 0045759F    pop        ecx
 004575A0    pop        ecx
 004575A1    mov        dword ptr fs:[eax],edx
 004575A4    push       4575B9
 004575A9    lea        eax,[ebp-0C]
 004575AC    call       @LStrClr
 004575B1    ret
<004575B2    jmp        @HandleFinally
<004575B7    jmp        004575A9
 004575B9    mov        eax,ebx
 004575BB    pop        edi
 004575BC    pop        esi
 004575BD    pop        ebx
 004575BE    mov        esp,ebp
 004575C0    pop        ebp
 004575C1    ret
*}
//end;

//004575C4
//function sub_004575C4(?:TPropInfoList; ?:?):?;
//begin
{*
 004575C4    mov        eax,dword ptr [eax+4]; TPropInfoList.?f4:Pointer
 004575C7    mov        eax,dword ptr [eax+edx*4]
 004575CA    ret
*}
//end;

//004575CC
//procedure sub_004575CC(?:TComponentName; ?:AnsiString; ?:AnsiString);
//begin
{*
 004575CC    push       ebp
 004575CD    mov        ebp,esp
 004575CF    push       ebx
 004575D0    push       esi
 004575D1    push       edi
 004575D2    mov        edi,ecx
 004575D4    mov        esi,edx
 004575D6    mov        ebx,eax
 004575D8    mov        eax,edi
 004575DA    call       @LStrClr
 004575DF    test       ebx,ebx
>004575E1    je         004575FA
 004575E3    test       esi,esi
>004575E5    je         004575FA
 004575E7    push       ebx
 004575E8    push       457608; '.'
 004575ED    push       esi
 004575EE    mov        eax,edi
 004575F0    mov        edx,3
 004575F5    call       @LStrCatN
 004575FA    pop        edi
 004575FB    pop        esi
 004575FC    pop        ebx
 004575FD    pop        ebp
 004575FE    ret
*}
//end;

//0045760C
//function sub_0045760C(?:AnsiString; ?:AnsiString; ?:AnsiString):?;
//begin
{*
 0045760C    push       ebp
 0045760D    mov        ebp,esp
 0045760F    push       0
 00457611    push       0
 00457613    push       0
 00457615    push       0
 00457617    push       0
 00457619    push       0
 0045761B    push       ebx
 0045761C    push       esi
 0045761D    push       edi
 0045761E    mov        dword ptr [ebp-8],ecx
 00457621    mov        dword ptr [ebp-4],edx
 00457624    mov        edi,eax
 00457626    xor        eax,eax
 00457628    push       ebp
 00457629    push       4576E6
 0045762E    push       dword ptr fs:[eax]
 00457631    mov        dword ptr fs:[eax],esp
 00457634    xor        ebx,ebx
 00457636    mov        eax,edi
 00457638    call       @LStrLen
 0045763D    test       eax,eax
>0045763F    je         004576CB
 00457645    mov        edx,edi
 00457647    mov        eax,457700; '.'
 0045764C    call       @LStrPos
 00457651    mov        esi,eax
 00457653    test       esi,esi
>00457655    jle        004576CB
 00457657    lea        eax,[ebp-10]
 0045765A    push       eax
 0045765B    mov        ecx,esi
 0045765D    dec        ecx
 0045765E    mov        edx,1
 00457663    mov        eax,edi
 00457665    call       @LStrCopy
 0045766A    mov        eax,dword ptr [ebp-10]
 0045766D    lea        edx,[ebp-0C]
 00457670    call       Trim
 00457675    mov        edx,dword ptr [ebp-0C]
 00457678    mov        eax,dword ptr [ebp-4]
 0045767B    call       @LStrAsg
 00457680    lea        eax,[ebp-18]
 00457683    push       eax
 00457684    lea        edx,[esi+1]
 00457687    mov        ecx,7FFFFFFF
 0045768C    mov        eax,edi
 0045768E    call       @LStrCopy
 00457693    mov        eax,dword ptr [ebp-18]
 00457696    lea        edx,[ebp-14]
 00457699    call       Trim
 0045769E    mov        edx,dword ptr [ebp-14]
 004576A1    mov        eax,dword ptr [ebp-8]
 004576A4    call       @LStrAsg
 004576A9    mov        eax,dword ptr [ebp-4]
 004576AC    mov        eax,dword ptr [eax]
 004576AE    call       @LStrLen
 004576B3    test       eax,eax
>004576B5    jle        004576C5
 004576B7    mov        eax,dword ptr [ebp-8]
 004576BA    mov        eax,dword ptr [eax]
 004576BC    call       @LStrLen
 004576C1    test       eax,eax
>004576C3    jg         004576C9
 004576C5    xor        ebx,ebx
>004576C7    jmp        004576CB
 004576C9    mov        bl,1
 004576CB    xor        eax,eax
 004576CD    pop        edx
 004576CE    pop        ecx
 004576CF    pop        ecx
 004576D0    mov        dword ptr fs:[eax],edx
 004576D3    push       4576ED
 004576D8    lea        eax,[ebp-18]
 004576DB    mov        edx,4
 004576E0    call       @LStrArrayClr
 004576E5    ret
<004576E6    jmp        @HandleFinally
<004576EB    jmp        004576D8
 004576ED    mov        eax,ebx
 004576EF    pop        edi
 004576F0    pop        esi
 004576F1    pop        ebx
 004576F2    mov        esp,ebp
 004576F4    pop        ebp
 004576F5    ret
*}
//end;

//00457704
//procedure sub_00457704(?:AnsiString; ?:TComponentName; ?:AnsiString);
//begin
{*
 00457704    push       ebp
 00457705    mov        ebp,esp
 00457707    push       0
 00457709    push       0
 0045770B    push       ebx
 0045770C    push       esi
 0045770D    push       edi
 0045770E    mov        ebx,ecx
 00457710    mov        edi,edx
 00457712    mov        esi,eax
 00457714    xor        eax,eax
 00457716    push       ebp
 00457717    push       457761
 0045771C    push       dword ptr fs:[eax]
 0045771F    mov        dword ptr fs:[eax],esp
 00457722    mov        eax,ebx
 00457724    call       @LStrClr
 00457729    lea        ecx,[ebp-8]
 0045772C    lea        edx,[ebp-4]
 0045772F    mov        eax,esi
 00457731    call       0045760C
 00457736    test       al,al
>00457738    je         00457746
 0045773A    mov        ecx,ebx
 0045773C    mov        edx,dword ptr [ebp-8]
 0045773F    mov        eax,edi
 00457741    call       004575CC
 00457746    xor        eax,eax
 00457748    pop        edx
 00457749    pop        ecx
 0045774A    pop        ecx
 0045774B    mov        dword ptr fs:[eax],edx
 0045774E    push       457768
 00457753    lea        eax,[ebp-8]
 00457756    mov        edx,2
 0045775B    call       @LStrArrayClr
 00457760    ret
<00457761    jmp        @HandleFinally
<00457766    jmp        00457753
 00457768    pop        edi
 00457769    pop        esi
 0045776A    pop        ebx
 0045776B    pop        ecx
 0045776C    pop        ecx
 0045776D    pop        ebp
 0045776E    ret
*}
//end;

//00457770
//procedure sub_00457770(?:TComponent; ?:TStrings; ?:?);
//begin
{*
 00457770    push       ebp
 00457771    mov        ebp,esp
 00457773    push       0
 00457775    push       0
 00457777    push       0
 00457779    push       0
 0045777B    push       0
 0045777D    push       0
 0045777F    push       0
 00457781    push       0
 00457783    push       ebx
 00457784    push       esi
 00457785    push       edi
 00457786    mov        byte ptr [ebp-5],cl
 00457789    mov        esi,edx
 0045778B    mov        dword ptr [ebp-4],eax
 0045778E    xor        eax,eax
 00457790    push       ebp
 00457791    push       457888
 00457796    push       dword ptr fs:[eax]
 00457799    mov        dword ptr fs:[eax],esp
 0045779C    test       esi,esi
>0045779E    je         0045786D
 004577A4    cmp        dword ptr [ebp-4],0
>004577A8    je         0045786D
 004577AE    mov        eax,esi
 004577B0    mov        edx,dword ptr [eax]
 004577B2    call       dword ptr [edx+14]; TStrings.GetCount
 004577B5    mov        ebx,eax
 004577B7    dec        ebx
 004577B8    cmp        ebx,0
>004577BB    jl         0045786D
 004577C1    lea        ecx,[ebp-18]
 004577C4    mov        edx,ebx
 004577C6    mov        eax,esi
 004577C8    mov        edi,dword ptr [eax]
 004577CA    call       dword ptr [edi+0C]; TStrings.Get
 004577CD    mov        eax,dword ptr [ebp-18]
 004577D0    lea        ecx,[ebp-14]
 004577D3    lea        edx,[ebp-10]
 004577D6    call       0045760C
 004577DB    test       al,al
>004577DD    je         0045785A
 004577DF    cmp        byte ptr [ebp-5],0
>004577E3    je         00457812
 004577E5    mov        edx,dword ptr [ebp-10]
 004577E8    mov        eax,dword ptr [ebp-4]
 004577EB    call       TComponent.FindComponent
 004577F0    mov        dword ptr [ebp-0C],eax
 004577F3    cmp        dword ptr [ebp-0C],0
>004577F7    jne        00457804
 004577F9    mov        edx,ebx
 004577FB    mov        eax,esi
 004577FD    mov        ecx,dword ptr [eax]
 004577FF    call       dword ptr [ecx+44]; TStrings.Delete
>00457802    jmp        00457863
 00457804    mov        ecx,dword ptr [ebp-0C]
 00457807    mov        edx,ebx
 00457809    mov        eax,esi
 0045780B    mov        edi,dword ptr [eax]
 0045780D    call       dword ptr [edi+24]; TStrings.PutObject
>00457810    jmp        00457863
 00457812    mov        edx,ebx
 00457814    mov        eax,esi
 00457816    mov        ecx,dword ptr [eax]
 00457818    call       dword ptr [ecx+18]; TStrings.GetObject
 0045781B    mov        dword ptr [ebp-0C],eax
 0045781E    cmp        dword ptr [ebp-0C],0
>00457822    je         0045784F
 00457824    lea        ecx,[ebp-20]
 00457827    mov        edx,ebx
 00457829    mov        eax,esi
 0045782B    mov        edi,dword ptr [eax]
 0045782D    call       dword ptr [edi+0C]; TStrings.Get
 00457830    mov        eax,dword ptr [ebp-20]
 00457833    lea        ecx,[ebp-1C]
 00457836    mov        edx,dword ptr [ebp-0C]
 00457839    mov        edx,dword ptr [edx+8]; TComponent.?f8:TComponentName
 0045783C    call       00457704
 00457841    mov        ecx,dword ptr [ebp-1C]
 00457844    mov        edx,ebx
 00457846    mov        eax,esi
 00457848    mov        edi,dword ptr [eax]
 0045784A    call       dword ptr [edi+20]; TStrings.Put
>0045784D    jmp        00457863
 0045784F    mov        edx,ebx
 00457851    mov        eax,esi
 00457853    mov        ecx,dword ptr [eax]
 00457855    call       dword ptr [ecx+44]; TStrings.Delete
>00457858    jmp        00457863
 0045785A    mov        edx,ebx
 0045785C    mov        eax,esi
 0045785E    mov        ecx,dword ptr [eax]
 00457860    call       dword ptr [ecx+44]; TStrings.Delete
 00457863    dec        ebx
 00457864    cmp        ebx,0FFFFFFFF
<00457867    jne        004577C1
 0045786D    xor        eax,eax
 0045786F    pop        edx
 00457870    pop        ecx
 00457871    pop        ecx
 00457872    mov        dword ptr fs:[eax],edx
 00457875    push       45788F
 0045787A    lea        eax,[ebp-20]
 0045787D    mov        edx,5
 00457882    call       @LStrArrayClr
 00457887    ret
<00457888    jmp        @HandleFinally
<0045788D    jmp        0045787A
 0045788F    pop        edi
 00457890    pop        esi
 00457891    pop        ebx
 00457892    mov        esp,ebp
 00457894    pop        ebp
 00457895    ret
*}
//end;

//00457898
//function sub_00457898(?:AnsiString):TForm;
//begin
{*
 00457898    push       ebp
 00457899    mov        ebp,esp
 0045789B    push       ecx
 0045789C    push       ebx
 0045789D    push       esi
 0045789E    push       edi
 0045789F    mov        dword ptr [ebp-4],eax
 004578A2    mov        eax,[0046C190]; ^Screen:TScreen
 004578A7    mov        eax,dword ptr [eax]
 004578A9    call       TScreen.GetFormCount
 004578AE    mov        ebx,eax
 004578B0    dec        ebx
 004578B1    test       ebx,ebx
>004578B3    jl         004578DB
 004578B5    inc        ebx
 004578B6    xor        edi,edi
 004578B8    mov        eax,[0046C190]; ^Screen:TScreen
 004578BD    mov        eax,dword ptr [eax]
 004578BF    mov        edx,edi
 004578C1    call       TScreen.GetForm
 004578C6    mov        esi,eax
 004578C8    mov        edx,dword ptr [esi+8]; TForm.?f8:TComponentName
 004578CB    mov        eax,dword ptr [ebp-4]
 004578CE    call       CompareText
 004578D3    test       eax,eax
>004578D5    je         00457916
 004578D7    inc        edi
 004578D8    dec        ebx
<004578D9    jne        004578B8
 004578DB    mov        eax,[0046C190]; ^Screen:TScreen
 004578E0    mov        eax,dword ptr [eax]
 004578E2    call       TScreen.GetDataModuleCount
 004578E7    mov        ebx,eax
 004578E9    dec        ebx
 004578EA    test       ebx,ebx
>004578EC    jl         00457914
 004578EE    inc        ebx
 004578EF    xor        edi,edi
 004578F1    mov        eax,[0046C190]; ^Screen:TScreen
 004578F6    mov        eax,dword ptr [eax]
 004578F8    mov        edx,edi
 004578FA    call       TScreen.GetDataModule
 004578FF    mov        esi,eax
 00457901    mov        edx,dword ptr [esi+8]
 00457904    mov        eax,dword ptr [ebp-4]
 00457907    call       CompareText
 0045790C    test       eax,eax
>0045790E    je         00457916
 00457910    inc        edi
 00457911    dec        ebx
<00457912    jne        004578F1
 00457914    xor        esi,esi
 00457916    mov        eax,esi
 00457918    pop        edi
 00457919    pop        esi
 0045791A    pop        ebx
 0045791B    pop        ecx
 0045791C    pop        ebp
 0045791D    ret
*}
//end;

//00457920
//procedure sub_00457920(?:?; ?:?);
//begin
{*
 00457920    push       ebp
 00457921    mov        ebp,esp
 00457923    push       ebx
 00457924    push       esi
 00457925    push       edi
 00457926    mov        edi,ecx
 00457928    mov        esi,edx
 0045792A    mov        ebx,eax
 0045792C    mov        eax,edi
 0045792E    mov        ecx,esi
 00457930    mov        edx,dword ptr [ebx+0C]; TPropsStorage.?fC:String
 00457933    call       @LStrCat3
 00457938    pop        edi
 00457939    pop        esi
 0045793A    pop        ebx
 0045793B    pop        ebp
 0045793C    ret
*}
//end;

//00457940
//procedure sub_00457940(?:TPropsStorage; ?:?);
//begin
{*
 00457940    push       ebp
 00457941    mov        ebp,esp
 00457943    xor        ecx,ecx
 00457945    push       ecx
 00457946    push       ecx
 00457947    push       ecx
 00457948    push       ecx
 00457949    push       ecx
 0045794A    push       ebx
 0045794B    push       esi
 0045794C    push       edi
 0045794D    mov        ebx,edx
 0045794F    mov        esi,eax
 00457951    xor        eax,eax
 00457953    push       ebp
 00457954    push       457BFF
 00457959    push       dword ptr fs:[eax]
 0045795C    mov        dword ptr fs:[eax],esp
 0045795F    xor        eax,eax
 00457961    push       ebp
 00457962    push       457BDA
 00457967    push       dword ptr fs:[eax]
 0045796A    mov        dword ptr fs:[eax],esp
 0045796D    test       ebx,ebx
>0045796F    je         00457BD0
 00457975    mov        eax,dword ptr [ebx]
 00457977    mov        eax,dword ptr [eax]
 00457979    movzx      eax,byte ptr [eax]
 0045797C    cmp        eax,10
>0045797F    ja         00457A6C
 00457985    jmp        dword ptr [eax*4+45798C]
 00457985    dd         457A6C
 00457985    dd         4579D0
 00457985    dd         4579E1
 00457985    dd         4579F2
 00457985    dd         457A00
 00457985    dd         457A46
 00457985    dd         457A54
 00457985    dd         457A62
 00457985    dd         457A6C
 00457985    dd         457A0E
 00457985    dd         457A1C
 00457985    dd         457A6C
 00457985    dd         457A2A
 00457985    dd         457A6C
 00457985    dd         457A6C
 00457985    dd         457A6C
 00457985    dd         457A38
 004579D0    lea        ecx,[ebp-8]
 004579D3    mov        edx,ebx
 004579D5    mov        eax,esi
 004579D7    call       00457DA0
>004579DC    jmp        00457A79
 004579E1    lea        ecx,[ebp-8]
 004579E4    mov        edx,ebx
 004579E6    mov        eax,esi
 004579E8    call       00457DC4
>004579ED    jmp        00457A79
 004579F2    lea        ecx,[ebp-8]
 004579F5    mov        edx,ebx
 004579F7    mov        eax,esi
 004579F9    call       00457DE8
>004579FE    jmp        00457A79
 00457A00    lea        ecx,[ebp-8]
 00457A03    mov        edx,ebx
 00457A05    mov        eax,esi
 00457A07    call       00457E14
>00457A0C    jmp        00457A79
 00457A0E    lea        ecx,[ebp-8]
 00457A11    mov        edx,ebx
 00457A13    mov        eax,esi
 00457A15    call       00457F00
>00457A1A    jmp        00457A79
 00457A1C    lea        ecx,[ebp-8]
 00457A1F    mov        edx,ebx
 00457A21    mov        eax,esi
 00457A23    call       00457EE0
>00457A28    jmp        00457A79
 00457A2A    lea        ecx,[ebp-8]
 00457A2D    mov        edx,ebx
 00457A2F    mov        eax,esi
 00457A31    call       00457F24
>00457A36    jmp        00457A79
 00457A38    lea        ecx,[ebp-8]
 00457A3B    mov        edx,ebx
 00457A3D    mov        eax,esi
 00457A3F    call       00457F84
>00457A44    jmp        00457A79
 00457A46    lea        ecx,[ebp-8]
 00457A49    mov        edx,ebx
 00457A4B    mov        eax,esi
 00457A4D    call       00457EC0
>00457A52    jmp        00457A79
 00457A54    lea        ecx,[ebp-8]
 00457A57    mov        edx,ebx
 00457A59    mov        eax,esi
 00457A5B    call       00457FA8
>00457A60    jmp        00457A79
 00457A62    lea        eax,[ebp-8]
 00457A65    call       @LStrClr
>00457A6A    jmp        00457A79
 00457A6C    xor        eax,eax
 00457A6E    pop        edx
 00457A6F    pop        ecx
 00457A70    pop        ecx
 00457A71    mov        dword ptr fs:[eax],edx
>00457A74    jmp        00457BE4
 00457A79    cmp        dword ptr [ebp-8],0
>00457A7D    jne        00457A99
 00457A7F    mov        eax,dword ptr [ebx]
 00457A81    mov        eax,dword ptr [eax]
 00457A83    mov        al,byte ptr [eax]
 00457A85    sub        al,5
>00457A87    je         00457A99
 00457A89    sub        al,2
>00457A8B    je         00457A99
 00457A8D    mov        eax,dword ptr [ebx]
 00457A8F    mov        eax,dword ptr [eax]
 00457A91    mov        al,byte ptr [eax]
 00457A93    add        al,0F7
 00457A95    sub        al,2
>00457A97    jae        00457AD2
 00457A99    mov        eax,dword ptr [ebp-8]
 00457A9C    push       eax
 00457A9D    lea        eax,[ebp-0C]
 00457AA0    push       eax
 00457AA1    lea        eax,[ebp-14]
 00457AA4    lea        edx,[ebx+1A]
 00457AA7    call       @LStrFromString
 00457AAC    mov        edx,dword ptr [ebp-14]
 00457AAF    lea        ecx,[ebp-10]
 00457AB2    mov        eax,esi
 00457AB4    mov        edi,dword ptr [eax]
 00457AB6    call       dword ptr [edi+0C]; TPropsStorage.sub_00457920
 00457AB9    mov        ecx,dword ptr [ebp-10]
 00457ABC    mov        edx,dword ptr [esi+10]; TPropsStorage.?f10:String
 00457ABF    mov        eax,esi
 00457AC1    mov        edi,dword ptr [eax]
 00457AC3    call       dword ptr [edi]; TPropsStorage.sub_0045949C
 00457AC5    mov        eax,dword ptr [ebp-0C]
 00457AC8    lea        edx,[ebp-4]
 00457ACB    call       Trim
>00457AD0    jmp        00457ADA
 00457AD2    lea        eax,[ebp-4]
 00457AD5    call       @LStrClr
 00457ADA    mov        eax,dword ptr [ebx]
 00457ADC    mov        eax,dword ptr [eax]
 00457ADE    movzx      eax,byte ptr [eax]
 00457AE1    cmp        eax,10
>00457AE4    ja         00457BD0
 00457AEA    jmp        dword ptr [eax*4+457AF1]
 00457AEA    dd         457BD0
 00457AEA    dd         457B35
 00457AEA    dd         457B46
 00457AEA    dd         457B54
 00457AEA    dd         457B62
 00457AEA    dd         457BA8
 00457AEA    dd         457BB6
 00457AEA    dd         457BC4
 00457AEA    dd         457BD0
 00457AEA    dd         457B70
 00457AEA    dd         457B7E
 00457AEA    dd         457BD0
 00457AEA    dd         457B8C
 00457AEA    dd         457BD0
 00457AEA    dd         457BD0
 00457AEA    dd         457BD0
 00457AEA    dd         457B9A
 00457B35    mov        ecx,ebx
 00457B37    mov        edx,dword ptr [ebp-4]
 00457B3A    mov        eax,esi
 00457B3C    call       00458714
>00457B41    jmp        00457BD0
 00457B46    mov        ecx,ebx
 00457B48    mov        edx,dword ptr [ebp-4]
 00457B4B    mov        eax,esi
 00457B4D    call       0045873C
>00457B52    jmp        00457BD0
 00457B54    mov        ecx,ebx
 00457B56    mov        edx,dword ptr [ebp-4]
 00457B59    mov        eax,esi
 00457B5B    call       00458750
>00457B60    jmp        00457BD0
 00457B62    mov        ecx,ebx
 00457B64    mov        edx,dword ptr [ebp-4]
 00457B67    mov        eax,esi
 00457B69    call       004587E8
>00457B6E    jmp        00457BD0
 00457B70    mov        ecx,ebx
 00457B72    mov        edx,dword ptr [ebp-4]
 00457B75    mov        eax,esi
 00457B77    call       004588B0
>00457B7C    jmp        00457BD0
 00457B7E    mov        ecx,ebx
 00457B80    mov        edx,dword ptr [ebp-4]
 00457B83    mov        eax,esi
 00457B85    call       004588A0
>00457B8A    jmp        00457BD0
 00457B8C    mov        ecx,ebx
 00457B8E    mov        edx,dword ptr [ebp-4]
 00457B91    mov        eax,esi
 00457B93    call       004588C4
>00457B98    jmp        00457BD0
 00457B9A    mov        ecx,ebx
 00457B9C    mov        edx,dword ptr [ebp-4]
 00457B9F    mov        eax,esi
 00457BA1    call       00458878
>00457BA6    jmp        00457BD0
 00457BA8    mov        ecx,ebx
 00457BAA    mov        edx,dword ptr [ebp-4]
 00457BAD    mov        eax,esi
 00457BAF    call       00458924
>00457BB4    jmp        00457BD0
 00457BB6    mov        ecx,ebx
 00457BB8    mov        edx,dword ptr [ebp-4]
 00457BBB    mov        eax,esi
 00457BBD    call       00458934
>00457BC2    jmp        00457BD0
 00457BC4    mov        ecx,ebx
 00457BC6    mov        edx,dword ptr [ebp-4]
 00457BC9    mov        eax,esi
 00457BCB    call       00458E0C
 00457BD0    xor        eax,eax
 00457BD2    pop        edx
 00457BD3    pop        ecx
 00457BD4    pop        ecx
 00457BD5    mov        dword ptr fs:[eax],edx
>00457BD8    jmp        00457BE4
<00457BDA    jmp        @HandleAnyException
 00457BDF    call       @DoneExcept
 00457BE4    xor        eax,eax
 00457BE6    pop        edx
 00457BE7    pop        ecx
 00457BE8    pop        ecx
 00457BE9    mov        dword ptr fs:[eax],edx
 00457BEC    push       457C06
 00457BF1    lea        eax,[ebp-14]
 00457BF4    mov        edx,5
 00457BF9    call       @LStrArrayClr
 00457BFE    ret
<00457BFF    jmp        @HandleFinally
<00457C04    jmp        00457BF1
 00457C06    pop        edi
 00457C07    pop        esi
 00457C08    pop        ebx
 00457C09    mov        esp,ebp
 00457C0B    pop        ebp
 00457C0C    ret
*}
//end;

//00457C10
//procedure sub_00457C10(?:TPropsStorage; ?:?);
//begin
{*
 00457C10    push       ebp
 00457C11    mov        ebp,esp
 00457C13    xor        ecx,ecx
 00457C15    push       ecx
 00457C16    push       ecx
 00457C17    push       ecx
 00457C18    push       ecx
 00457C19    push       ebx
 00457C1A    push       esi
 00457C1B    mov        ebx,edx
 00457C1D    mov        esi,eax
 00457C1F    xor        eax,eax
 00457C21    push       ebp
 00457C22    push       457D90
 00457C27    push       dword ptr fs:[eax]
 00457C2A    mov        dword ptr fs:[eax],esp
 00457C2D    test       ebx,ebx
>00457C2F    je         00457D75
 00457C35    mov        eax,dword ptr [ebx]
 00457C37    mov        eax,dword ptr [eax]
 00457C39    movzx      eax,byte ptr [eax]
 00457C3C    cmp        eax,10
>00457C3F    ja         00457D75
 00457C45    jmp        dword ptr [eax*4+457C4C]
 00457C45    dd         457D75
 00457C45    dd         457C90
 00457C45    dd         457CA1
 00457C45    dd         457CAF
 00457C45    dd         457CBD
 00457C45    dd         457D03
 00457C45    dd         457D11
 00457C45    dd         457D1F
 00457C45    dd         457D75
 00457C45    dd         457CD9
 00457C45    dd         457CCB
 00457C45    dd         457D75
 00457C45    dd         457CE7
 00457C45    dd         457D75
 00457C45    dd         457D75
 00457C45    dd         457D75
 00457C45    dd         457CF5
 00457C90    lea        ecx,[ebp-4]
 00457C93    mov        edx,ebx
 00457C95    mov        eax,esi
 00457C97    call       00457DA0
>00457C9C    jmp        00457D2B
 00457CA1    lea        ecx,[ebp-4]
 00457CA4    mov        edx,ebx
 00457CA6    mov        eax,esi
 00457CA8    call       00457DC4
>00457CAD    jmp        00457D2B
 00457CAF    lea        ecx,[ebp-4]
 00457CB2    mov        edx,ebx
 00457CB4    mov        eax,esi
 00457CB6    call       00457DE8
>00457CBB    jmp        00457D2B
 00457CBD    lea        ecx,[ebp-4]
 00457CC0    mov        edx,ebx
 00457CC2    mov        eax,esi
 00457CC4    call       00457E14
>00457CC9    jmp        00457D2B
 00457CCB    lea        ecx,[ebp-4]
 00457CCE    mov        edx,ebx
 00457CD0    mov        eax,esi
 00457CD2    call       00457EE0
>00457CD7    jmp        00457D2B
 00457CD9    lea        ecx,[ebp-4]
 00457CDC    mov        edx,ebx
 00457CDE    mov        eax,esi
 00457CE0    call       00457F00
>00457CE5    jmp        00457D2B
 00457CE7    lea        ecx,[ebp-4]
 00457CEA    mov        edx,ebx
 00457CEC    mov        eax,esi
 00457CEE    call       00457F24
>00457CF3    jmp        00457D2B
 00457CF5    lea        ecx,[ebp-4]
 00457CF8    mov        edx,ebx
 00457CFA    mov        eax,esi
 00457CFC    call       00457F84
>00457D01    jmp        00457D2B
 00457D03    lea        ecx,[ebp-4]
 00457D06    mov        edx,ebx
 00457D08    mov        eax,esi
 00457D0A    call       00457EC0
>00457D0F    jmp        00457D2B
 00457D11    lea        ecx,[ebp-4]
 00457D14    mov        edx,ebx
 00457D16    mov        eax,esi
 00457D18    call       00457FA8
>00457D1D    jmp        00457D2B
 00457D1F    lea        ecx,[ebp-4]
 00457D22    mov        edx,ebx
 00457D24    mov        eax,esi
 00457D26    call       00458448
 00457D2B    cmp        dword ptr [ebp-4],0
>00457D2F    jne        00457D41
 00457D31    mov        eax,dword ptr [ebx]
 00457D33    mov        eax,dword ptr [eax]
 00457D35    mov        al,byte ptr [eax]
 00457D37    sub        al,5
>00457D39    je         00457D41
 00457D3B    add        al,0FC
 00457D3D    sub        al,2
>00457D3F    jae        00457D75
 00457D41    lea        edx,[ebp-8]
 00457D44    mov        eax,dword ptr [ebp-4]
 00457D47    call       Trim
 00457D4C    mov        eax,dword ptr [ebp-8]
 00457D4F    push       eax
 00457D50    lea        eax,[ebp-10]
 00457D53    lea        edx,[ebx+1A]
 00457D56    call       @LStrFromString
 00457D5B    mov        edx,dword ptr [ebp-10]
 00457D5E    lea        ecx,[ebp-0C]
 00457D61    mov        eax,esi
 00457D63    mov        ebx,dword ptr [eax]
 00457D65    call       dword ptr [ebx+0C]; TPropsStorage.sub_00457920
 00457D68    mov        ecx,dword ptr [ebp-0C]
 00457D6B    mov        edx,dword ptr [esi+10]; TPropsStorage.?f10:String
 00457D6E    mov        eax,esi
 00457D70    mov        ebx,dword ptr [eax]
 00457D72    call       dword ptr [ebx+4]; TPropsStorage.sub_004594D8
 00457D75    xor        eax,eax
 00457D77    pop        edx
 00457D78    pop        ecx
 00457D79    pop        ecx
 00457D7A    mov        dword ptr fs:[eax],edx
 00457D7D    push       457D97
 00457D82    lea        eax,[ebp-10]
 00457D85    mov        edx,4
 00457D8A    call       @LStrArrayClr
 00457D8F    ret
<00457D90    jmp        @HandleFinally
<00457D95    jmp        00457D82
 00457D97    pop        esi
 00457D98    pop        ebx
 00457D99    mov        esp,ebp
 00457D9B    pop        ebp
 00457D9C    ret
*}
//end;

//00457DA0
//function sub_00457DA0(?:TPropsStorage; ?:?; ?:AnsiString):AnsiString;
//begin
{*
 00457DA0    push       ebp
 00457DA1    mov        ebp,esp
 00457DA3    push       ebx
 00457DA4    push       esi
 00457DA5    push       edi
 00457DA6    mov        edi,ecx
 00457DA8    mov        esi,edx
 00457DAA    mov        ebx,eax
 00457DAC    mov        edx,esi
 00457DAE    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457DB1    call       GetOrdProp
 00457DB6    mov        edx,edi
 00457DB8    call       IntToStr
 00457DBD    pop        edi
 00457DBE    pop        esi
 00457DBF    pop        ebx
 00457DC0    pop        ebp
 00457DC1    ret
*}
//end;

//00457DC4
//procedure sub_00457DC4(?:TPropsStorage; ?:?; ?:AnsiString);
//begin
{*
 00457DC4    push       ebp
 00457DC5    mov        ebp,esp
 00457DC7    push       ebx
 00457DC8    push       esi
 00457DC9    push       edi
 00457DCA    mov        edi,ecx
 00457DCC    mov        esi,edx
 00457DCE    mov        ebx,eax
 00457DD0    mov        edx,esi
 00457DD2    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457DD5    call       GetOrdProp
 00457DDA    mov        edx,eax
 00457DDC    mov        eax,edi
 00457DDE    call       @LStrFromChar
 00457DE3    pop        edi
 00457DE4    pop        esi
 00457DE5    pop        ebx
 00457DE6    pop        ebp
 00457DE7    ret
*}
//end;

//00457DE8
//function sub_00457DE8(?:TPropsStorage; ?:?; ?:AnsiString):AnsiString;
//begin
{*
 00457DE8    push       ebp
 00457DE9    mov        ebp,esp
 00457DEB    push       ebx
 00457DEC    push       esi
 00457DED    push       edi
 00457DEE    mov        edi,ecx
 00457DF0    mov        esi,edx
 00457DF2    mov        ebx,eax
 00457DF4    mov        edx,esi
 00457DF6    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457DF9    call       GetOrdProp
 00457DFE    push       eax
 00457DFF    mov        eax,esi
 00457E01    call       00457480
 00457E06    mov        ecx,edi
 00457E08    pop        edx
 00457E09    call       GetEnumName
 00457E0E    pop        edi
 00457E0F    pop        esi
 00457E10    pop        ebx
 00457E11    pop        ebp
 00457E12    ret
*}
//end;

//00457E14
//procedure sub_00457E14(?:TPropsStorage; ?:?; ?:AnsiString);
//begin
{*
 00457E14    push       ebp
 00457E15    mov        ebp,esp
 00457E17    push       0
 00457E19    push       0
 00457E1B    push       ebx
 00457E1C    push       esi
 00457E1D    push       edi
 00457E1E    mov        edi,ecx
 00457E20    mov        esi,edx
 00457E22    mov        ebx,eax
 00457E24    xor        eax,eax
 00457E26    push       ebp
 00457E27    push       457EA4
 00457E2C    push       dword ptr fs:[eax]
 00457E2F    mov        dword ptr fs:[eax],esp
 00457E32    push       edi
 00457E33    mov        edx,esi
 00457E35    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457E38    call       GetFloatProp
 00457E3D    add        esp,0FFFFFFF4
 00457E40    fstp       tbyte ptr [esp]
 00457E43    wait
 00457E44    lea        eax,[ebp-4]
 00457E47    push       eax
 00457E48    mov        eax,esi
 00457E4A    call       00457480
 00457E4F    call       GetTypeData
 00457E54    movzx      eax,byte ptr [eax]
 00457E57    mov        edx,dword ptr [eax*4+46ABF0]
 00457E5E    xor        ecx,ecx
 00457E60    xor        eax,eax
 00457E62    call       FloatToStrF
 00457E67    mov        eax,dword ptr [ebp-4]
 00457E6A    push       eax
 00457E6B    lea        eax,[ebp-8]
 00457E6E    mov        edx,dword ptr ds:[46C174]; ^DecimalSeparator:Char
 00457E74    mov        dl,byte ptr [edx]
 00457E76    call       @LStrFromChar
 00457E7B    mov        edx,dword ptr [ebp-8]
 00457E7E    mov        ecx,457EBC; '.'
 00457E83    pop        eax
 00457E84    call       00450318
 00457E89    xor        eax,eax
 00457E8B    pop        edx
 00457E8C    pop        ecx
 00457E8D    pop        ecx
 00457E8E    mov        dword ptr fs:[eax],edx
 00457E91    push       457EAB
 00457E96    lea        eax,[ebp-8]
 00457E99    mov        edx,2
 00457E9E    call       @LStrArrayClr
 00457EA3    ret
<00457EA4    jmp        @HandleFinally
<00457EA9    jmp        00457E96
 00457EAB    pop        edi
 00457EAC    pop        esi
 00457EAD    pop        ebx
 00457EAE    pop        ecx
 00457EAF    pop        ecx
 00457EB0    pop        ebp
 00457EB1    ret
*}
//end;

//00457EC0
//function sub_00457EC0(?:TPropsStorage; ?:?; ?:AnsiString):AnsiString;
//begin
{*
 00457EC0    push       ebp
 00457EC1    mov        ebp,esp
 00457EC3    push       ebx
 00457EC4    push       esi
 00457EC5    push       edi
 00457EC6    mov        edi,ecx
 00457EC8    mov        esi,edx
 00457ECA    mov        ebx,eax
 00457ECC    mov        ecx,edi
 00457ECE    mov        edx,esi
 00457ED0    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457ED3    call       GetStrProp
 00457ED8    pop        edi
 00457ED9    pop        esi
 00457EDA    pop        ebx
 00457EDB    pop        ebp
 00457EDC    ret
*}
//end;

//00457EE0
//function sub_00457EE0(?:TPropsStorage; ?:?; ?:AnsiString):AnsiString;
//begin
{*
 00457EE0    push       ebp
 00457EE1    mov        ebp,esp
 00457EE3    push       ebx
 00457EE4    push       esi
 00457EE5    push       edi
 00457EE6    mov        edi,ecx
 00457EE8    mov        esi,edx
 00457EEA    mov        ebx,eax
 00457EEC    mov        ecx,edi
 00457EEE    mov        edx,esi
 00457EF0    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457EF3    call       GetStrProp
 00457EF8    pop        edi
 00457EF9    pop        esi
 00457EFA    pop        ebx
 00457EFB    pop        ebp
 00457EFC    ret
*}
//end;

//00457F00
//procedure sub_00457F00(?:TPropsStorage; ?:?; ?:AnsiString);
//begin
{*
 00457F00    push       ebp
 00457F01    mov        ebp,esp
 00457F03    push       ebx
 00457F04    push       esi
 00457F05    push       edi
 00457F06    mov        edi,ecx
 00457F08    mov        esi,edx
 00457F0A    mov        ebx,eax
 00457F0C    mov        edx,esi
 00457F0E    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457F11    call       GetOrdProp
 00457F16    mov        edx,eax
 00457F18    mov        eax,edi
 00457F1A    call       @LStrFromChar
 00457F1F    pop        edi
 00457F20    pop        esi
 00457F21    pop        ebx
 00457F22    pop        ebp
 00457F23    ret
*}
//end;

//00457F24
//procedure sub_00457F24(?:TPropsStorage; ?:?; ?:AnsiString);
//begin
{*
 00457F24    push       ebp
 00457F25    mov        ebp,esp
 00457F27    push       0
 00457F29    push       0
 00457F2B    push       0
 00457F2D    push       0
 00457F2F    push       ebx
 00457F30    push       esi
 00457F31    push       edi
 00457F32    mov        edi,ecx
 00457F34    mov        esi,edx
 00457F36    mov        ebx,eax
 00457F38    xor        eax,eax
 00457F3A    push       ebp
 00457F3B    push       457F73
 00457F40    push       dword ptr fs:[eax]
 00457F43    mov        dword ptr fs:[eax],esp
 00457F46    lea        ecx,[ebp-10]
 00457F49    mov        edx,esi
 00457F4B    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457F4E    call       GetVariantProp
 00457F53    lea        edx,[ebp-10]
 00457F56    mov        eax,edi
 00457F58    call       @VarToLStr
 00457F5D    xor        eax,eax
 00457F5F    pop        edx
 00457F60    pop        ecx
 00457F61    pop        ecx
 00457F62    mov        dword ptr fs:[eax],edx
 00457F65    push       457F7A
 00457F6A    lea        eax,[ebp-10]
 00457F6D    call       @VarClr
 00457F72    ret
<00457F73    jmp        @HandleFinally
<00457F78    jmp        00457F6A
 00457F7A    pop        edi
 00457F7B    pop        esi
 00457F7C    pop        ebx
 00457F7D    mov        esp,ebp
 00457F7F    pop        ebp
 00457F80    ret
*}
//end;

//00457F84
//function sub_00457F84(?:TPropsStorage; ?:?; ?:AnsiString):AnsiString;
//begin
{*
 00457F84    push       ebp
 00457F85    mov        ebp,esp
 00457F87    push       ebx
 00457F88    push       esi
 00457F89    push       edi
 00457F8A    mov        edi,ecx
 00457F8C    mov        esi,edx
 00457F8E    mov        ebx,eax
 00457F90    mov        edx,esi
 00457F92    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00457F95    call       GetInt64Prop
 00457F9A    push       edx
 00457F9B    push       eax
 00457F9C    mov        eax,edi
 00457F9E    call       IntToStr
 00457FA3    pop        edi
 00457FA4    pop        esi
 00457FA5    pop        ebx
 00457FA6    pop        ebp
 00457FA7    ret
*}
//end;

//00457FA8
//procedure sub_00457FA8(?:TPropsStorage; ?:?; ?:AnsiString);
//begin
{*
 00457FA8    push       ebp
 00457FA9    mov        ebp,esp
 00457FAB    add        esp,0FFFFFFF8
 00457FAE    push       ebx
 00457FAF    push       esi
 00457FB0    push       edi
 00457FB1    xor        ebx,ebx
 00457FB3    mov        dword ptr [ebp-8],ebx
 00457FB6    mov        esi,ecx
 00457FB8    mov        ebx,edx
 00457FBA    mov        edi,eax
 00457FBC    xor        eax,eax
 00457FBE    push       ebp
 00457FBF    push       458059
 00457FC4    push       dword ptr fs:[eax]
 00457FC7    mov        dword ptr fs:[eax],esp
 00457FCA    mov        eax,esi
 00457FCC    mov        edx,458070; '['
 00457FD1    call       @LStrAsg
 00457FD6    mov        eax,dword ptr [edi+4]; TPropsStorage.?f4:TObject
 00457FD9    mov        edx,ebx
 00457FDB    call       GetOrdProp
 00457FE0    mov        edi,eax
 00457FE2    mov        eax,ebx
 00457FE4    call       00457480
 00457FE9    call       GetTypeData
 00457FEE    mov        eax,dword ptr [eax+1]
 00457FF1    mov        eax,dword ptr [eax]
 00457FF3    mov        dword ptr [ebp-4],eax
 00457FF6    xor        ebx,ebx
 00457FF8    mov        eax,ebx
 00457FFA    cmp        eax,1F
>00457FFD    ja         00458002
 00457FFF    bt         edi,eax
>00458002    jae        00458031
 00458004    mov        eax,dword ptr [esi]
 00458006    call       @LStrLen
 0045800B    dec        eax
>0045800C    je         0045801A
 0045800E    mov        eax,esi
 00458010    mov        edx,45807C; ','
 00458015    call       @LStrCat
 0045801A    lea        ecx,[ebp-8]
 0045801D    mov        edx,ebx
 0045801F    mov        eax,dword ptr [ebp-4]
 00458022    call       GetEnumName
 00458027    mov        edx,dword ptr [ebp-8]
 0045802A    mov        eax,esi
 0045802C    call       @LStrCat
 00458031    inc        ebx
 00458032    cmp        ebx,20
<00458035    jne        00457FF8
 00458037    mov        eax,esi
 00458039    mov        edx,458088; ']'
 0045803E    call       @LStrCat
 00458043    xor        eax,eax
 00458045    pop        edx
 00458046    pop        ecx
 00458047    pop        ecx
 00458048    mov        dword ptr fs:[eax],edx
 0045804B    push       458060
 00458050    lea        eax,[ebp-8]
 00458053    call       @LStrClr
 00458058    ret
<00458059    jmp        @HandleFinally
<0045805E    jmp        00458050
 00458060    pop        edi
 00458061    pop        esi
 00458062    pop        ebx
 00458063    pop        ecx
 00458064    pop        ecx
 00458065    pop        ebp
 00458066    ret
*}
//end;

//0045808C
//procedure sub_0045808C(?:TPropsStorage; ?:?; ?:AnsiString);
//begin
{*
 0045808C    push       ebp
 0045808D    mov        ebp,esp
 0045808F    add        esp,0FFFFFFC8
 00458092    push       ebx
 00458093    push       esi
 00458094    push       edi
 00458095    xor        ebx,ebx
 00458097    mov        dword ptr [ebp-2C],ebx
 0045809A    mov        dword ptr [ebp-30],ebx
 0045809D    mov        dword ptr [ebp-28],ebx
 004580A0    mov        dword ptr [ebp-20],ebx
 004580A3    mov        dword ptr [ebp-24],ebx
 004580A6    mov        dword ptr [ebp-8],ebx
 004580A9    mov        edi,ecx
 004580AB    mov        esi,edx
 004580AD    mov        ebx,eax
 004580AF    xor        eax,eax
 004580B1    push       ebp
 004580B2    push       4581D7
 004580B7    push       dword ptr fs:[eax]
 004580BA    mov        dword ptr fs:[eax],esp
 004580BD    mov        eax,edi
 004580BF    call       @LStrClr
 004580C4    mov        edx,esi
 004580C6    mov        eax,dword ptr [ebx+4]
 004580C9    call       GetOrdProp
 004580CE    mov        dword ptr [ebp-4],eax
 004580D1    lea        eax,[ebp-8]
 004580D4    push       eax
 004580D5    mov        eax,dword ptr [ebx+10]
 004580D8    mov        dword ptr [ebp-1C],eax
 004580DB    mov        byte ptr [ebp-18],0B
 004580DF    lea        eax,[ebp-24]
 004580E2    lea        edx,[esi+1A]
 004580E5    call       @LStrFromString
 004580EA    mov        edx,dword ptr [ebp-24]
 004580ED    lea        ecx,[ebp-20]
 004580F0    mov        eax,ebx
 004580F2    mov        esi,dword ptr [eax]
 004580F4    call       dword ptr [esi+0C]
 004580F7    mov        eax,dword ptr [ebp-20]
 004580FA    mov        dword ptr [ebp-14],eax
 004580FD    mov        byte ptr [ebp-10],0B
 00458101    lea        edx,[ebp-1C]
 00458104    mov        ecx,1
 00458109    mov        eax,4581F0; '%s.%s'
 0045810E    call       Format
 00458113    mov        edx,dword ptr [ebp-8]
 00458116    mov        eax,ebx
 00458118    mov        ecx,dword ptr [eax]
 0045811A    call       dword ptr [ecx+8]
 0045811D    mov        eax,dword ptr [ebp-4]
 00458120    mov        edx,dword ptr ds:[40EF58]; TStrings
 00458126    call       @IsClass
 0045812B    test       al,al
>0045812D    je         004581B4
 00458133    mov        eax,dword ptr [ebp-4]
 00458136    mov        edx,dword ptr [eax]
 00458138    call       dword ptr [edx+14]
 0045813B    test       eax,eax
>0045813D    jle        004581B4
 0045813F    mov        esi,dword ptr [ebp-4]
 00458142    mov        eax,esi
 00458144    mov        edx,dword ptr [eax]
 00458146    call       dword ptr [edx+14]
 00458149    lea        edx,[ebp-28]
 0045814C    call       IntToStr
 00458151    mov        eax,dword ptr [ebp-28]
 00458154    push       eax
 00458155    mov        ecx,458200; 'Count'
 0045815A    mov        edx,dword ptr [ebp-8]
 0045815D    mov        eax,ebx
 0045815F    mov        edi,dword ptr [eax]
 00458161    call       dword ptr [edi+4]
 00458164    mov        eax,esi
 00458166    mov        edx,dword ptr [eax]
 00458168    call       dword ptr [edx+14]
 0045816B    dec        eax
 0045816C    test       eax,eax
>0045816E    jl         004581B4
 00458170    inc        eax
 00458171    mov        dword ptr [ebp-0C],eax
 00458174    xor        esi,esi
 00458176    lea        ecx,[ebp-2C]
 00458179    mov        edx,esi
 0045817B    mov        eax,dword ptr [ebp-4]
 0045817E    mov        edi,dword ptr [eax]
 00458180    call       dword ptr [edi+0C]
 00458183    mov        eax,dword ptr [ebp-2C]
 00458186    push       eax
 00458187    lea        eax,[ebp-30]
 0045818A    push       eax
 0045818B    mov        dword ptr [ebp-38],esi
 0045818E    mov        byte ptr [ebp-34],0
 00458192    lea        edx,[ebp-38]
 00458195    xor        ecx,ecx
 00458197    mov        eax,458210; 'Item%d'
 0045819C    call       Format
 004581A1    mov        ecx,dword ptr [ebp-30]
 004581A4    mov        edx,dword ptr [ebp-8]
 004581A7    mov        eax,ebx
 004581A9    mov        edi,dword ptr [eax]
 004581AB    call       dword ptr [edi+4]
 004581AE    inc        esi
 004581AF    dec        dword ptr [ebp-0C]
<004581B2    jne        00458176
 004581B4    xor        eax,eax
 004581B6    pop        edx
 004581B7    pop        ecx
 004581B8    pop        ecx
 004581B9    mov        dword ptr fs:[eax],edx
 004581BC    push       4581DE
 004581C1    lea        eax,[ebp-30]
 004581C4    mov        edx,5
 004581C9    call       @LStrArrayClr
 004581CE    lea        eax,[ebp-8]
 004581D1    call       @LStrClr
 004581D6    ret
<004581D7    jmp        @HandleFinally
<004581DC    jmp        004581C1
 004581DE    pop        edi
 004581DF    pop        esi
 004581E0    pop        ebx
 004581E1    mov        esp,ebp
 004581E3    pop        ebp
 004581E4    ret
*}
//end;

//00458218
//procedure sub_00458218(?:TPropsStorage; ?:?; ?:?);
//begin
{*
 00458218    push       ebp
 00458219    mov        ebp,esp
 0045821B    add        esp,0FFFFFEE8
 00458221    push       ebx
 00458222    push       esi
 00458223    push       edi
 00458224    xor        ebx,ebx
 00458226    mov        dword ptr [ebp-108],ebx
 0045822C    mov        dword ptr [ebp-4],ebx
 0045822F    mov        edi,ecx
 00458231    mov        ebx,edx
 00458233    mov        esi,eax
 00458235    xor        eax,eax
 00458237    push       ebp
 00458238    push       458346
 0045823D    push       dword ptr fs:[eax]
 00458240    mov        dword ptr fs:[eax],esp
 00458243    mov        edx,ebx
 00458245    mov        eax,dword ptr [esi+4]
 00458248    call       GetOrdProp
 0045824D    mov        ebx,eax
 0045824F    test       ebx,ebx
>00458251    je         00458319
 00458257    mov        eax,edi
 00458259    mov        edx,dword ptr [ebx+8]
 0045825C    call       @LStrAsg
 00458261    cmp        dword ptr [ebx+4],0
>00458265    je         00458325
 0045826B    mov        eax,dword ptr [ebx+4]
 0045826E    cmp        eax,dword ptr [esi+8]
>00458271    je         00458325
 00458277    lea        eax,[ebp-4]
 0045827A    mov        edx,dword ptr [ebx+4]
 0045827D    mov        edx,dword ptr [edx+8]
 00458280    call       @LStrLAsg
 00458285    cmp        dword ptr [ebp-4],0
>00458289    jne        004582CF
 0045828B    lea        edx,[ebp-104]
 00458291    mov        eax,dword ptr [ebx+4]
 00458294    mov        eax,dword ptr [eax]
 00458296    call       TObject.ClassName
 0045829B    lea        edx,[ebp-104]
 004582A1    lea        eax,[ebp-4]
 004582A4    call       @LStrFromString
 004582A9    cmp        dword ptr [ebp-4],0
>004582AD    je         004582CF
 004582AF    mov        eax,dword ptr [ebp-4]
 004582B2    mov        al,byte ptr [eax]
 004582B4    call       UpCase
 004582B9    cmp        al,54
>004582BB    jne        004582CF
 004582BD    lea        eax,[ebp-4]
 004582C0    mov        ecx,1
 004582C5    mov        edx,1
 004582CA    call       @LStrDelete
 004582CF    lea        eax,[ebp-108]
 004582D5    push       eax
 004582D6    mov        eax,dword ptr [ebp-4]
 004582D9    mov        dword ptr [ebp-118],eax
 004582DF    mov        byte ptr [ebp-114],0B
 004582E6    mov        eax,dword ptr [edi]
 004582E8    mov        dword ptr [ebp-110],eax
 004582EE    mov        byte ptr [ebp-10C],0B
 004582F5    lea        edx,[ebp-118]
 004582FB    mov        ecx,1
 00458300    mov        eax,45835C; '%s.%s'
 00458305    call       Format
 0045830A    mov        edx,dword ptr [ebp-108]
 00458310    mov        eax,edi
 00458312    call       @LStrAsg
>00458317    jmp        00458325
 00458319    mov        eax,edi
 0045831B    mov        edx,45836C; '(null)'
 00458320    call       @LStrAsg
 00458325    xor        eax,eax
 00458327    pop        edx
 00458328    pop        ecx
 00458329    pop        ecx
 0045832A    mov        dword ptr fs:[eax],edx
 0045832D    push       45834D
 00458332    lea        eax,[ebp-108]
 00458338    call       @LStrClr
 0045833D    lea        eax,[ebp-4]
 00458340    call       @LStrClr
 00458345    ret
<00458346    jmp        @HandleFinally
<0045834B    jmp        00458332
 0045834D    pop        edi
 0045834E    pop        esi
 0045834F    pop        ebx
 00458350    mov        esp,ebp
 00458352    pop        ebp
 00458353    ret
*}
//end;

//00458374
//procedure sub_00458374(?:TCollectionItem; ?:AnsiString; ?:String; ?:?);
//begin
{*
 00458374    push       ebp
 00458375    mov        ebp,esp
 00458377    add        esp,0FFFFFFF8
 0045837A    push       ebx
 0045837B    push       esi
 0045837C    push       edi
 0045837D    mov        esi,ecx
 0045837F    mov        ebx,edx
 00458381    mov        dword ptr [ebp-4],eax
 00458384    mov        edi,dword ptr [ebp+8]
 00458387    add        edi,0FFFFFFFC
 0045838A    mov        eax,dword ptr [edi]
 0045838C    mov        edx,dword ptr [ebp-4]
 0045838F    mov        dword ptr [eax+4],edx
 00458392    mov        eax,dword ptr [edi]
 00458394    add        eax,0C
 00458397    mov        edx,ebx
 00458399    call       @LStrAsg
 0045839E    mov        eax,dword ptr [edi]
 004583A0    add        eax,10
 004583A3    mov        edx,esi
 004583A5    call       @LStrAsg
 004583AA    mov        eax,dword ptr [edi]
 004583AC    mov        edx,dword ptr [ebp+8]
 004583AF    mov        edx,dword ptr [edx-8]
 004583B2    mov        ecx,dword ptr [edx+20]
 004583B5    mov        dword ptr [eax+20],ecx
 004583B8    mov        ecx,dword ptr [edx+24]
 004583BB    mov        dword ptr [eax+24],ecx
 004583BE    mov        eax,dword ptr [edi]
 004583C0    mov        edx,dword ptr [ebp+8]
 004583C3    mov        edx,dword ptr [edx-8]
 004583C6    mov        ecx,dword ptr [edx+28]
 004583C9    mov        dword ptr [eax+28],ecx
 004583CC    mov        ecx,dword ptr [edx+2C]
 004583CF    mov        dword ptr [eax+2C],ecx
 004583D2    mov        eax,[00458444]; 0x3FEFE
 004583D7    push       eax
 004583D8    mov        eax,dword ptr [edi]
 004583DA    mov        ecx,dword ptr [eax+4]
 004583DD    mov        dl,1
 004583DF    mov        eax,[0045739C]; TPropInfoList
 004583E4    call       TPropInfoList.Create; TPropInfoList.Create
 004583E9    mov        dword ptr [ebp-8],eax
 004583EC    xor        eax,eax
 004583EE    push       ebp
 004583EF    push       458435
 004583F4    push       dword ptr fs:[eax]
 004583F7    mov        dword ptr fs:[eax],esp
 004583FA    mov        eax,dword ptr [ebp-8]
 004583FD    mov        ebx,dword ptr [eax+8]; TPropInfoList.?f8:Integer
 00458400    dec        ebx
 00458401    test       ebx,ebx
>00458403    jl         0045841F
 00458405    inc        ebx
 00458406    xor        esi,esi
 00458408    mov        edx,esi
 0045840A    mov        eax,dword ptr [ebp-8]
 0045840D    call       004575C4
 00458412    mov        edx,eax
 00458414    mov        eax,dword ptr [edi]
 00458416    call       00457C10
 0045841B    inc        esi
 0045841C    dec        ebx
<0045841D    jne        00458408
 0045841F    xor        eax,eax
 00458421    pop        edx
 00458422    pop        ecx
 00458423    pop        ecx
 00458424    mov        dword ptr fs:[eax],edx
 00458427    push       45843C
 0045842C    mov        eax,dword ptr [ebp-8]
 0045842F    call       TObject.Free
 00458434    ret
<00458435    jmp        @HandleFinally
<0045843A    jmp        0045842C
 0045843C    pop        edi
 0045843D    pop        esi
 0045843E    pop        ebx
 0045843F    pop        ecx
 00458440    pop        ecx
 00458441    pop        ebp
 00458442    ret
*}
//end;

//00458448
//procedure sub_00458448(?:TPropsStorage; ?:?; ?:?);
//begin
{*
 00458448    push       ebp
 00458449    mov        ebp,esp
 0045844B    add        esp,0FFFFFFB0
 0045844E    push       ebx
 0045844F    push       esi
 00458450    xor        ebx,ebx
 00458452    mov        dword ptr [ebp-4C],ebx
 00458455    mov        dword ptr [ebp-50],ebx
 00458458    mov        dword ptr [ebp-34],ebx
 0045845B    mov        dword ptr [ebp-40],ebx
 0045845E    mov        dword ptr [ebp-38],ebx
 00458461    mov        dword ptr [ebp-3C],ebx
 00458464    mov        dword ptr [ebp-18],ebx
 00458467    mov        dword ptr [ebp-2C],ebx
 0045846A    mov        dword ptr [ebp-30],ebx
 0045846D    mov        dword ptr [ebp-14],ebx
 00458470    mov        ebx,ecx
 00458472    mov        dword ptr [ebp-0C],edx
 00458475    mov        dword ptr [ebp-8],eax
 00458478    xor        eax,eax
 0045847A    push       ebp
 0045847B    push       4586DA
 00458480    push       dword ptr fs:[eax]
 00458483    mov        dword ptr fs:[eax],esp
 00458486    mov        eax,ebx
 00458488    call       @LStrClr
 0045848D    mov        eax,dword ptr [ebp-8]
 00458490    mov        eax,dword ptr [eax+4]; TPropsStorage.?f4:TObject
 00458493    mov        edx,dword ptr [ebp-0C]
 00458496    call       GetOrdProp
 0045849B    mov        dword ptr [ebp-10],eax
 0045849E    cmp        dword ptr [ebp-10],0
>004584A2    je         0045863D
 004584A8    mov        eax,dword ptr [ebp-10]
 004584AB    mov        edx,dword ptr ds:[40EF58]; TStrings
 004584B1    call       @IsClass
 004584B6    test       al,al
>004584B8    je         004584CD
 004584BA    lea        ecx,[ebp-14]
 004584BD    mov        edx,dword ptr [ebp-0C]
 004584C0    mov        eax,dword ptr [ebp-8]
 004584C3    call       0045808C
>004584C8    jmp        0045863D
 004584CD    mov        eax,dword ptr [ebp-10]
 004584D0    mov        edx,dword ptr ds:[40EE5C]; TCollection
 004584D6    call       @IsClass
 004584DB    test       al,al
>004584DD    je         0045861C
 004584E3    lea        eax,[ebp-18]
 004584E6    push       eax
 004584E7    mov        eax,dword ptr [ebp-8]
 004584EA    mov        eax,dword ptr [eax+10]; TPropsStorage.?f10:String
 004584ED    mov        dword ptr [ebp-28],eax
 004584F0    mov        byte ptr [ebp-24],0B
 004584F4    lea        eax,[ebp-30]
 004584F7    mov        edx,dword ptr [ebp-0C]
 004584FA    add        edx,1A
 004584FD    call       @LStrFromString
 00458502    mov        ecx,dword ptr [ebp-30]
 00458505    mov        eax,dword ptr [ebp-8]
 00458508    mov        edx,dword ptr [eax+0C]; TPropsStorage.?fC:String
 0045850B    lea        eax,[ebp-2C]
 0045850E    call       @LStrCat3
 00458513    mov        eax,dword ptr [ebp-2C]
 00458516    mov        dword ptr [ebp-20],eax
 00458519    mov        byte ptr [ebp-1C],0B
 0045851D    lea        edx,[ebp-28]
 00458520    mov        ecx,1
 00458525    mov        eax,4586F0; '%s.%s'
 0045852A    call       Format
 0045852F    mov        edx,dword ptr [ebp-18]
 00458532    mov        eax,dword ptr [ebp-8]
 00458535    mov        ecx,dword ptr [eax]
 00458537    call       dword ptr [ecx+8]; TPropsStorage.sub_004594F4
 0045853A    mov        eax,dword ptr [ebp-8]
 0045853D    mov        edx,dword ptr [eax]
 0045853F    call       dword ptr [edx+10]; TPropsStorage.sub_00459488
 00458542    mov        dword ptr [ebp-4],eax
 00458545    xor        eax,eax
 00458547    push       ebp
 00458548    push       458615
 0045854D    push       dword ptr fs:[eax]
 00458550    mov        dword ptr fs:[eax],esp
 00458553    mov        eax,dword ptr [ebp-10]
 00458556    call       TCollection.GetCount
 0045855B    mov        esi,eax
 0045855D    dec        esi
 0045855E    test       esi,esi
>00458560    jl         004585FF
 00458566    inc        esi
 00458567    xor        ebx,ebx
 00458569    push       ebp
 0045856A    lea        eax,[ebp-34]
 0045856D    push       eax
 0045856E    mov        eax,dword ptr [ebp-8]
 00458571    mov        eax,dword ptr [eax+10]; TPropsStorage.?f10:String
 00458574    mov        dword ptr [ebp-28],eax
 00458577    mov        byte ptr [ebp-24],0B
 0045857B    lea        eax,[ebp-3C]
 0045857E    mov        edx,dword ptr [ebp-0C]
 00458581    add        edx,1A
 00458584    call       @LStrFromString
 00458589    mov        ecx,dword ptr [ebp-3C]
 0045858C    mov        eax,dword ptr [ebp-8]
 0045858F    mov        edx,dword ptr [eax+0C]; TPropsStorage.?fC:String
 00458592    lea        eax,[ebp-38]
 00458595    call       @LStrCat3
 0045859A    mov        eax,dword ptr [ebp-38]
 0045859D    mov        dword ptr [ebp-20],eax
 004585A0    mov        byte ptr [ebp-1C],0B
 004585A4    lea        edx,[ebp-28]
 004585A7    mov        ecx,1
 004585AC    mov        eax,4586F0; '%s.%s'
 004585B1    call       Format
 004585B6    mov        eax,dword ptr [ebp-34]
 004585B9    push       eax
 004585BA    lea        eax,[ebp-40]
 004585BD    push       eax
 004585BE    mov        dword ptr [ebp-48],ebx
 004585C1    mov        byte ptr [ebp-44],0
 004585C5    lea        edx,[ebp-48]
 004585C8    xor        ecx,ecx
 004585CA    mov        eax,458700; 'Item%d'
 004585CF    call       Format
 004585D4    lea        eax,[ebp-40]
 004585D7    mov        edx,458710; '_'
 004585DC    call       @LStrCat
 004585E1    mov        eax,dword ptr [ebp-40]
 004585E4    push       eax
 004585E5    mov        edx,ebx
 004585E7    mov        eax,dword ptr [ebp-10]
 004585EA    call       TCollection.GetItem
 004585EF    pop        edx
 004585F0    pop        ecx
 004585F1    call       00458374
 004585F6    pop        ecx
 004585F7    inc        ebx
 004585F8    dec        esi
<004585F9    jne        00458569
 004585FF    xor        eax,eax
 00458601    pop        edx
 00458602    pop        ecx
 00458603    pop        ecx
 00458604    mov        dword ptr fs:[eax],edx
 00458607    push       45863D
 0045860C    mov        eax,dword ptr [ebp-4]
 0045860F    call       TObject.Free
 00458614    ret
<00458615    jmp        @HandleFinally
<0045861A    jmp        0045860C
 0045861C    mov        eax,dword ptr [ebp-10]
 0045861F    mov        edx,dword ptr ds:[40F6D8]; TComponent
 00458625    call       @IsClass
 0045862A    test       al,al
>0045862C    je         0045863D
 0045862E    mov        ecx,ebx
 00458630    mov        edx,dword ptr [ebp-0C]
 00458633    mov        eax,dword ptr [ebp-8]
 00458636    call       00458218
>0045863B    jmp        004586A5
 0045863D    mov        eax,dword ptr [ebp-8]
 00458640    mov        edx,dword ptr [eax]
 00458642    call       dword ptr [edx+10]; TPropsStorage.sub_00459488
 00458645    mov        dword ptr [ebp-4],eax
 00458648    xor        eax,eax
 0045864A    push       ebp
 0045864B    push       45869E
 00458650    push       dword ptr fs:[eax]
 00458653    mov        dword ptr fs:[eax],esp
 00458656    push       ebp
 00458657    lea        eax,[ebp-50]
 0045865A    mov        edx,dword ptr [ebp-0C]
 0045865D    add        edx,1A
 00458660    call       @LStrFromString
 00458665    mov        ecx,dword ptr [ebp-50]
 00458668    mov        eax,dword ptr [ebp-8]
 0045866B    mov        edx,dword ptr [eax+0C]; TPropsStorage.?fC:String
 0045866E    lea        eax,[ebp-4C]
 00458671    call       @LStrCat3
 00458676    mov        edx,dword ptr [ebp-4C]
 00458679    mov        eax,dword ptr [ebp-8]
 0045867C    mov        ecx,dword ptr [eax+10]; TPropsStorage.?f10:String
 0045867F    mov        eax,dword ptr [ebp-10]
 00458682    call       00458374
 00458687    pop        ecx
 00458688    xor        eax,eax
 0045868A    pop        edx
 0045868B    pop        ecx
 0045868C    pop        ecx
 0045868D    mov        dword ptr fs:[eax],edx
 00458690    push       4586A5
 00458695    mov        eax,dword ptr [ebp-4]
 00458698    call       TObject.Free
 0045869D    ret
<0045869E    jmp        @HandleFinally
<004586A3    jmp        00458695
 004586A5    xor        eax,eax
 004586A7    pop        edx
 004586A8    pop        ecx
 004586A9    pop        ecx
 004586AA    mov        dword ptr fs:[eax],edx
 004586AD    push       4586E1
 004586B2    lea        eax,[ebp-50]
 004586B5    mov        edx,2
 004586BA    call       @LStrArrayClr
 004586BF    lea        eax,[ebp-40]
 004586C2    mov        edx,6
 004586C7    call       @LStrArrayClr
 004586CC    lea        eax,[ebp-18]
 004586CF    mov        edx,2
 004586D4    call       @LStrArrayClr
 004586D9    ret
<004586DA    jmp        @HandleFinally
<004586DF    jmp        004586B2
 004586E1    pop        esi
 004586E2    pop        ebx
 004586E3    mov        esp,ebp
 004586E5    pop        ebp
 004586E6    ret
*}
//end;

//00458714
//procedure sub_00458714(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 00458714    push       ebp
 00458715    mov        ebp,esp
 00458717    push       ebx
 00458718    push       esi
 00458719    push       edi
 0045871A    mov        edi,ecx
 0045871C    mov        esi,edx
 0045871E    mov        ebx,eax
 00458720    xor        edx,edx
 00458722    mov        eax,esi
 00458724    call       StrToIntDef
 00458729    mov        ecx,eax
 0045872B    mov        edx,edi
 0045872D    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00458730    call       SetOrdProp
 00458735    pop        edi
 00458736    pop        esi
 00458737    pop        ebx
 00458738    pop        ebp
 00458739    ret
*}
//end;

//0045873C
//procedure sub_0045873C(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 0045873C    push       ebp
 0045873D    mov        ebp,esp
 0045873F    movzx      edx,byte ptr [edx]
 00458742    mov        eax,dword ptr [eax+4]; TPropsStorage.?f4:TObject
 00458745    xchg       edx,ecx
 00458747    call       SetOrdProp
 0045874C    pop        ebp
 0045874D    ret
*}
//end;

//00458750
//procedure sub_00458750(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 00458750    push       ebp
 00458751    mov        ebp,esp
 00458753    add        esp,0FFFFFFF0
 00458756    push       ebx
 00458757    push       esi
 00458758    push       edi
 00458759    xor        ebx,ebx
 0045875B    mov        dword ptr [ebp-10],ebx
 0045875E    mov        dword ptr [ebp-0C],ecx
 00458761    mov        dword ptr [ebp-8],edx
 00458764    mov        dword ptr [ebp-4],eax
 00458767    xor        eax,eax
 00458769    push       ebp
 0045876A    push       4587D8
 0045876F    push       dword ptr fs:[eax]
 00458772    mov        dword ptr fs:[eax],esp
 00458775    mov        eax,dword ptr [ebp-0C]
 00458778    call       00457480
 0045877D    mov        edi,eax
 0045877F    mov        eax,edi
 00458781    call       GetTypeData
 00458786    mov        ebx,dword ptr [eax+1]
 00458789    mov        esi,dword ptr [eax+5]
 0045878C    sub        esi,ebx
>0045878E    jl         004587C2
 00458790    inc        esi
 00458791    lea        ecx,[ebp-10]
 00458794    mov        edx,ebx
 00458796    mov        eax,edi
 00458798    call       GetEnumName
 0045879D    mov        eax,dword ptr [ebp-10]
 004587A0    mov        edx,dword ptr [ebp-8]
 004587A3    call       CompareText
 004587A8    test       eax,eax
>004587AA    jne        004587BE
 004587AC    mov        eax,dword ptr [ebp-4]
 004587AF    mov        eax,dword ptr [eax+4]; TPropsStorage.?f4:TObject
 004587B2    mov        ecx,ebx
 004587B4    mov        edx,dword ptr [ebp-0C]
 004587B7    call       SetOrdProp
>004587BC    jmp        004587C2
 004587BE    inc        ebx
 004587BF    dec        esi
<004587C0    jne        00458791
 004587C2    xor        eax,eax
 004587C4    pop        edx
 004587C5    pop        ecx
 004587C6    pop        ecx
 004587C7    mov        dword ptr fs:[eax],edx
 004587CA    push       4587DF
 004587CF    lea        eax,[ebp-10]
 004587D2    call       @LStrClr
 004587D7    ret
<004587D8    jmp        @HandleFinally
<004587DD    jmp        004587CF
 004587DF    pop        edi
 004587E0    pop        esi
 004587E1    pop        ebx
 004587E2    mov        esp,ebp
 004587E4    pop        ebp
 004587E5    ret
*}
//end;

//004587E8
//procedure sub_004587E8(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 004587E8    push       ebp
 004587E9    mov        ebp,esp
 004587EB    push       0
 004587ED    push       0
 004587EF    push       ebx
 004587F0    push       esi
 004587F1    push       edi
 004587F2    mov        edi,ecx
 004587F4    mov        esi,edx
 004587F6    mov        ebx,eax
 004587F8    xor        eax,eax
 004587FA    push       ebp
 004587FB    push       45885D
 00458800    push       dword ptr fs:[eax]
 00458803    mov        dword ptr fs:[eax],esp
 00458806    lea        eax,[ebp-4]
 00458809    push       eax
 0045880A    lea        eax,[ebp-8]
 0045880D    mov        edx,dword ptr ds:[46C174]; ^DecimalSeparator:Char
 00458813    mov        dl,byte ptr [edx]
 00458815    call       @LStrFromChar
 0045881A    mov        ecx,dword ptr [ebp-8]
 0045881D    mov        edx,458874; '.'
 00458822    mov        eax,esi
 00458824    call       00450318
 00458829    mov        eax,dword ptr [ebp-4]
 0045882C    call       StrToFloat
 00458831    add        esp,0FFFFFFF4
 00458834    fstp       tbyte ptr [esp]
 00458837    wait
 00458838    mov        edx,edi
 0045883A    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 0045883D    call       SetFloatProp
 00458842    xor        eax,eax
 00458844    pop        edx
 00458845    pop        ecx
 00458846    pop        ecx
 00458847    mov        dword ptr fs:[eax],edx
 0045884A    push       458864
 0045884F    lea        eax,[ebp-8]
 00458852    mov        edx,2
 00458857    call       @LStrArrayClr
 0045885C    ret
<0045885D    jmp        @HandleFinally
<00458862    jmp        0045884F
 00458864    pop        edi
 00458865    pop        esi
 00458866    pop        ebx
 00458867    pop        ecx
 00458868    pop        ecx
 00458869    pop        ebp
 0045886A    ret
*}
//end;

//00458878
//procedure sub_00458878(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 00458878    push       ebp
 00458879    mov        ebp,esp
 0045887B    push       ebx
 0045887C    push       esi
 0045887D    push       edi
 0045887E    mov        edi,ecx
 00458880    mov        esi,edx
 00458882    mov        ebx,eax
 00458884    push       0
 00458886    push       0
 00458888    mov        eax,esi
 0045888A    call       StrToInt64Def
 0045888F    push       edx
 00458890    push       eax
 00458891    mov        edx,edi
 00458893    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 00458896    call       SetInt64Prop
 0045889B    pop        edi
 0045889C    pop        esi
 0045889D    pop        ebx
 0045889E    pop        ebp
 0045889F    ret
*}
//end;

//004588A0
//procedure sub_004588A0(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 004588A0    push       ebp
 004588A1    mov        ebp,esp
 004588A3    mov        eax,dword ptr [eax+4]; TPropsStorage.?f4:TObject
 004588A6    xchg       ecx,edx
 004588A8    call       SetStrProp
 004588AD    pop        ebp
 004588AE    ret
*}
//end;

//004588B0
//procedure sub_004588B0(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 004588B0    push       ebp
 004588B1    mov        ebp,esp
 004588B3    movzx      edx,byte ptr [edx]
 004588B6    mov        eax,dword ptr [eax+4]; TPropsStorage.?f4:TObject
 004588B9    xchg       edx,ecx
 004588BB    call       SetOrdProp
 004588C0    pop        ebp
 004588C1    ret
*}
//end;

//004588C4
//procedure sub_004588C4(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 004588C4    push       ebp
 004588C5    mov        ebp,esp
 004588C7    push       0
 004588C9    push       0
 004588CB    push       0
 004588CD    push       0
 004588CF    push       ebx
 004588D0    push       esi
 004588D1    push       edi
 004588D2    mov        edi,ecx
 004588D4    mov        esi,edx
 004588D6    mov        ebx,eax
 004588D8    xor        eax,eax
 004588DA    push       ebp
 004588DB    push       458913
 004588E0    push       dword ptr fs:[eax]
 004588E3    mov        dword ptr fs:[eax],esp
 004588E6    lea        eax,[ebp-10]
 004588E9    mov        edx,esi
 004588EB    call       @VarFromLStr
 004588F0    lea        ecx,[ebp-10]
 004588F3    mov        edx,edi
 004588F5    mov        eax,dword ptr [ebx+4]; TPropsStorage.?f4:TObject
 004588F8    call       SetVariantProp
 004588FD    xor        eax,eax
 004588FF    pop        edx
 00458900    pop        ecx
 00458901    pop        ecx
 00458902    mov        dword ptr fs:[eax],edx
 00458905    push       45891A
 0045890A    lea        eax,[ebp-10]
 0045890D    call       @VarClr
 00458912    ret
<00458913    jmp        @HandleFinally
<00458918    jmp        0045890A
 0045891A    pop        edi
 0045891B    pop        esi
 0045891C    pop        ebx
 0045891D    mov        esp,ebp
 0045891F    pop        ebp
 00458920    ret
*}
//end;

//00458924
//procedure sub_00458924(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 00458924    push       ebp
 00458925    mov        ebp,esp
 00458927    mov        eax,dword ptr [eax+4]; TPropsStorage.?f4:TObject
 0045892A    xchg       ecx,edx
 0045892C    call       SetStrProp
 00458931    pop        ebp
 00458932    ret
*}
//end;

//00458934
//procedure sub_00458934(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 00458934    push       ebp
 00458935    mov        ebp,esp
 00458937    add        esp,0FFFFFFE0
 0045893A    push       ebx
 0045893B    push       esi
 0045893C    push       edi
 0045893D    xor        ebx,ebx
 0045893F    mov        dword ptr [ebp-1C],ebx
 00458942    mov        dword ptr [ebp-0C],ecx
 00458945    mov        dword ptr [ebp-8],edx
 00458948    mov        dword ptr [ebp-4],eax
 0045894B    xor        eax,eax
 0045894D    push       ebp
 0045894E    push       458A0D
 00458953    push       dword ptr fs:[eax]
 00458956    mov        dword ptr fs:[eax],esp
 00458959    xor        eax,eax
 0045895B    mov        dword ptr [ebp-14],eax
 0045895E    mov        eax,dword ptr [ebp-0C]
 00458961    call       00457480
 00458966    call       GetTypeData
 0045896B    mov        eax,dword ptr [eax+1]
 0045896E    mov        eax,dword ptr [eax]
 00458970    mov        dword ptr [ebp-10],eax
 00458973    mov        edx,458A1C
 00458978    mov        eax,dword ptr [ebp-8]
 0045897B    call       004503DC
 00458980    test       eax,eax
>00458982    jle        004589E6
 00458984    mov        dword ptr [ebp-20],eax
 00458987    mov        dword ptr [ebp-18],1
 0045898E    lea        eax,[ebp-1C]
 00458991    push       eax
 00458992    mov        ecx,458A1C
 00458997    mov        edx,dword ptr [ebp-8]
 0045899A    mov        eax,dword ptr [ebp-18]
 0045899D    call       004504D0
 004589A2    xor        eax,eax
 004589A4    push       ebp
 004589A5    push       4589D4
 004589AA    push       dword ptr fs:[eax]
 004589AD    mov        dword ptr fs:[eax],esp
 004589B0    mov        edx,dword ptr [ebp-1C]
 004589B3    mov        eax,dword ptr [ebp-10]
 004589B6    call       GetEnumValue
 004589BB    mov        ebx,eax
 004589BD    test       ebx,ebx
>004589BF    jl         004589CA
 004589C1    cmp        ebx,1F
>004589C4    ja         004589CA
 004589C6    bts        dword ptr [ebp-14],ebx
 004589CA    xor        eax,eax
 004589CC    pop        edx
 004589CD    pop        ecx
 004589CE    pop        ecx
 004589CF    mov        dword ptr fs:[eax],edx
>004589D2    jmp        004589DE
<004589D4    jmp        @HandleAnyException
 004589D9    call       @DoneExcept
 004589DE    inc        dword ptr [ebp-18]
 004589E1    dec        dword ptr [ebp-20]
<004589E4    jne        0045898E
 004589E6    mov        eax,dword ptr [ebp-4]
 004589E9    mov        eax,dword ptr [eax+4]; TPropsStorage.?f4:TObject
 004589EC    mov        ecx,dword ptr [ebp-14]
 004589EF    mov        edx,dword ptr [ebp-0C]
 004589F2    call       SetOrdProp
 004589F7    xor        eax,eax
 004589F9    pop        edx
 004589FA    pop        ecx
 004589FB    pop        ecx
 004589FC    mov        dword ptr fs:[eax],edx
 004589FF    push       458A14
 00458A04    lea        eax,[ebp-1C]
 00458A07    call       @LStrClr
 00458A0C    ret
<00458A0D    jmp        @HandleFinally
<00458A12    jmp        00458A04
 00458A14    pop        edi
 00458A15    pop        esi
 00458A16    pop        ebx
 00458A17    mov        esp,ebp
 00458A19    pop        ebp
 00458A1A    ret
*}
//end;

//00458A3C
//procedure sub_00458A3C(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 00458A3C    push       ebp
 00458A3D    mov        ebp,esp
 00458A3F    add        esp,0FFFFFFC0
 00458A42    push       ebx
 00458A43    push       esi
 00458A44    push       edi
 00458A45    xor        ebx,ebx
 00458A47    mov        dword ptr [ebp-34],ebx
 00458A4A    mov        dword ptr [ebp-38],ebx
 00458A4D    mov        dword ptr [ebp-2C],ebx
 00458A50    mov        dword ptr [ebp-30],ebx
 00458A53    mov        dword ptr [ebp-24],ebx
 00458A56    mov        dword ptr [ebp-28],ebx
 00458A59    mov        dword ptr [ebp-10],ebx
 00458A5C    mov        esi,ecx
 00458A5E    mov        ebx,eax
 00458A60    xor        eax,eax
 00458A62    push       ebp
 00458A63    push       458BBE
 00458A68    push       dword ptr fs:[eax]
 00458A6B    mov        dword ptr fs:[eax],esp
 00458A6E    mov        eax,dword ptr [ebx+4]
 00458A71    mov        edx,esi
 00458A73    call       GetOrdProp
 00458A78    mov        dword ptr [ebp-4],eax
 00458A7B    mov        eax,dword ptr [ebp-4]
 00458A7E    mov        edx,dword ptr ds:[40EF58]; TStrings
 00458A84    call       @IsClass
 00458A89    test       al,al
>00458A8B    je         00458B9B
 00458A91    lea        eax,[ebp-10]
 00458A94    push       eax
 00458A95    mov        eax,dword ptr [ebx+10]
 00458A98    mov        dword ptr [ebp-20],eax
 00458A9B    mov        byte ptr [ebp-1C],0B
 00458A9F    lea        eax,[ebp-28]
 00458AA2    lea        edx,[esi+1A]
 00458AA5    call       @LStrFromString
 00458AAA    mov        edx,dword ptr [ebp-28]
 00458AAD    lea        ecx,[ebp-24]
 00458AB0    mov        eax,ebx
 00458AB2    mov        esi,dword ptr [eax]
 00458AB4    call       dword ptr [esi+0C]
 00458AB7    mov        eax,dword ptr [ebp-24]
 00458ABA    mov        dword ptr [ebp-18],eax
 00458ABD    mov        byte ptr [ebp-14],0B
 00458AC1    lea        edx,[ebp-20]
 00458AC4    mov        ecx,1
 00458AC9    mov        eax,458BD4; '%s.%s'
 00458ACE    call       Format
 00458AD3    push       458BE4; '0'
 00458AD8    lea        eax,[ebp-30]
 00458ADB    push       eax
 00458ADC    mov        ecx,458BF0; 'Count'
 00458AE1    mov        edx,dword ptr [ebp-10]
 00458AE4    mov        eax,ebx
 00458AE6    mov        esi,dword ptr [eax]
 00458AE8    call       dword ptr [esi]
 00458AEA    mov        eax,dword ptr [ebp-30]
 00458AED    lea        edx,[ebp-2C]
 00458AF0    call       Trim
 00458AF5    mov        eax,dword ptr [ebp-2C]
 00458AF8    xor        edx,edx
 00458AFA    call       StrToIntDef
 00458AFF    mov        esi,eax
 00458B01    test       esi,esi
>00458B03    jle        00458B9B
 00458B09    mov        dl,1
 00458B0B    mov        eax,[0040F078]; TStringList
 00458B10    call       TObject.Create; TStringList.Create
 00458B15    mov        dword ptr [ebp-8],eax
 00458B18    xor        eax,eax
 00458B1A    push       ebp
 00458B1B    push       458B94
 00458B20    push       dword ptr fs:[eax]
 00458B23    mov        dword ptr fs:[eax],esp
 00458B26    dec        esi
 00458B27    test       esi,esi
>00458B29    jl         00458B73
 00458B2B    inc        esi
 00458B2C    mov        dword ptr [ebp-0C],0
 00458B33    push       0
 00458B35    lea        eax,[ebp-34]
 00458B38    push       eax
 00458B39    lea        eax,[ebp-38]
 00458B3C    push       eax
 00458B3D    mov        eax,dword ptr [ebp-0C]
 00458B40    mov        dword ptr [ebp-40],eax
 00458B43    mov        byte ptr [ebp-3C],0
 00458B47    lea        edx,[ebp-40]
 00458B4A    xor        ecx,ecx
 00458B4C    mov        eax,458C00; 'Item%d'
 00458B51    call       Format
 00458B56    mov        ecx,dword ptr [ebp-38]
 00458B59    mov        edx,dword ptr [ebp-10]
 00458B5C    mov        eax,ebx
 00458B5E    mov        edi,dword ptr [eax]
 00458B60    call       dword ptr [edi]
 00458B62    mov        edx,dword ptr [ebp-34]
 00458B65    mov        eax,dword ptr [ebp-8]
 00458B68    mov        ecx,dword ptr [eax]
 00458B6A    call       dword ptr [ecx+34]; TStringList.Add
 00458B6D    inc        dword ptr [ebp-0C]
 00458B70    dec        esi
<00458B71    jne        00458B33
 00458B73    mov        edx,dword ptr [ebp-8]
 00458B76    mov        eax,dword ptr [ebp-4]
 00458B79    mov        ecx,dword ptr [eax]
 00458B7B    call       dword ptr [ecx+8]
 00458B7E    xor        eax,eax
 00458B80    pop        edx
 00458B81    pop        ecx
 00458B82    pop        ecx
 00458B83    mov        dword ptr fs:[eax],edx
 00458B86    push       458B9B
 00458B8B    mov        eax,dword ptr [ebp-8]
 00458B8E    call       TObject.Free
 00458B93    ret
<00458B94    jmp        @HandleFinally
<00458B99    jmp        00458B8B
 00458B9B    xor        eax,eax
 00458B9D    pop        edx
 00458B9E    pop        ecx
 00458B9F    pop        ecx
 00458BA0    mov        dword ptr fs:[eax],edx
 00458BA3    push       458BC5
 00458BA8    lea        eax,[ebp-38]
 00458BAB    mov        edx,6
 00458BB0    call       @LStrArrayClr
 00458BB5    lea        eax,[ebp-10]
 00458BB8    call       @LStrClr
 00458BBD    ret
<00458BBE    jmp        @HandleFinally
<00458BC3    jmp        00458BA8
 00458BC5    pop        edi
 00458BC6    pop        esi
 00458BC7    pop        ebx
 00458BC8    mov        esp,ebp
 00458BCA    pop        ebp
 00458BCB    ret
*}
//end;

//00458C08
//procedure sub_00458C08(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 00458C08    push       ebp
 00458C09    mov        ebp,esp
 00458C0B    push       0
 00458C0D    push       0
 00458C0F    push       0
 00458C11    push       0
 00458C13    push       0
 00458C15    push       0
 00458C17    push       0
 00458C19    push       ebx
 00458C1A    push       esi
 00458C1B    push       edi
 00458C1C    mov        dword ptr [ebp-4],ecx
 00458C1F    mov        ebx,edx
 00458C21    mov        edi,eax
 00458C23    xor        eax,eax
 00458C25    push       ebp
 00458C26    push       458D1F
 00458C2B    push       dword ptr fs:[eax]
 00458C2E    mov        dword ptr fs:[eax],esp
 00458C31    lea        edx,[ebp-10]
 00458C34    mov        eax,ebx
 00458C36    call       Trim
 00458C3B    cmp        dword ptr [ebp-10],0
>00458C3F    je         00458D04
 00458C45    lea        edx,[ebp-14]
 00458C48    mov        eax,ebx
 00458C4A    call       Trim
 00458C4F    mov        edx,dword ptr [ebp-14]
 00458C52    mov        eax,458D38; '(null)'
 00458C57    call       CompareText
 00458C5C    test       eax,eax
>00458C5E    jne        00458C72
 00458C60    mov        eax,dword ptr [edi+4]
 00458C63    xor        ecx,ecx
 00458C65    mov        edx,dword ptr [ebp-4]
 00458C68    call       SetOrdProp
>00458C6D    jmp        00458D04
 00458C72    mov        edx,ebx
 00458C74    mov        eax,458D48; '.'
 00458C79    call       @LStrPos
 00458C7E    mov        esi,eax
 00458C80    test       esi,esi
>00458C82    jle        00458CC2
 00458C84    lea        eax,[ebp-18]
 00458C87    push       eax
 00458C88    mov        ecx,esi
 00458C8A    dec        ecx
 00458C8B    mov        edx,1
 00458C90    mov        eax,ebx
 00458C92    call       @LStrCopy
 00458C97    mov        eax,dword ptr [ebp-18]
 00458C9A    lea        edx,[ebp-8]
 00458C9D    call       Trim
 00458CA2    lea        eax,[ebp-1C]
 00458CA5    push       eax
 00458CA6    lea        edx,[esi+1]
 00458CA9    mov        ecx,7FFFFFFF
 00458CAE    mov        eax,ebx
 00458CB0    call       @LStrCopy
 00458CB5    mov        eax,dword ptr [ebp-1C]
 00458CB8    lea        edx,[ebp-0C]
 00458CBB    call       Trim
>00458CC0    jmp        00458CD4
 00458CC2    lea        eax,[ebp-8]
 00458CC5    call       @LStrClr
 00458CCA    lea        edx,[ebp-0C]
 00458CCD    mov        eax,ebx
 00458CCF    call       Trim
 00458CD4    cmp        dword ptr [ebp-8],0
>00458CD8    je         00458CE6
 00458CDA    mov        eax,dword ptr [ebp-8]
 00458CDD    call       00457898
 00458CE2    mov        ebx,eax
>00458CE4    jmp        00458CE9
 00458CE6    mov        ebx,dword ptr [edi+8]
 00458CE9    test       ebx,ebx
>00458CEB    je         00458D04
 00458CED    mov        edx,dword ptr [ebp-0C]
 00458CF0    mov        eax,ebx
 00458CF2    call       TComponent.FindComponent
 00458CF7    mov        ecx,eax
 00458CF9    mov        eax,dword ptr [edi+4]
 00458CFC    mov        edx,dword ptr [ebp-4]
 00458CFF    call       SetOrdProp
 00458D04    xor        eax,eax
 00458D06    pop        edx
 00458D07    pop        ecx
 00458D08    pop        ecx
 00458D09    mov        dword ptr fs:[eax],edx
 00458D0C    push       458D26
 00458D11    lea        eax,[ebp-1C]
 00458D14    mov        edx,6
 00458D19    call       @LStrArrayClr
 00458D1E    ret
<00458D1F    jmp        @HandleFinally
<00458D24    jmp        00458D11
 00458D26    pop        edi
 00458D27    pop        esi
 00458D28    pop        ebx
 00458D29    mov        esp,ebp
 00458D2B    pop        ebp
 00458D2C    ret
*}
//end;

//00458D4C
//procedure sub_00458D4C(?:TCollectionItem; ?:AnsiString; ?:String; ?:?);
//begin
{*
 00458D4C    push       ebp
 00458D4D    mov        ebp,esp
 00458D4F    add        esp,0FFFFFFF8
 00458D52    push       ebx
 00458D53    push       esi
 00458D54    push       edi
 00458D55    mov        esi,ecx
 00458D57    mov        ebx,edx
 00458D59    mov        dword ptr [ebp-4],eax
 00458D5C    mov        edi,dword ptr [ebp+8]
 00458D5F    add        edi,0FFFFFFFC
 00458D62    mov        eax,dword ptr [edi]
 00458D64    mov        edx,dword ptr [ebp-4]
 00458D67    mov        dword ptr [eax+4],edx
 00458D6A    mov        eax,dword ptr [edi]
 00458D6C    add        eax,0C
 00458D6F    mov        edx,ebx
 00458D71    call       @LStrAsg
 00458D76    mov        eax,dword ptr [edi]
 00458D78    add        eax,10
 00458D7B    mov        edx,esi
 00458D7D    call       @LStrAsg
 00458D82    mov        eax,dword ptr [edi]
 00458D84    mov        edx,dword ptr [ebp+8]
 00458D87    mov        edx,dword ptr [edx-8]
 00458D8A    mov        ecx,dword ptr [edx+18]
 00458D8D    mov        dword ptr [eax+18],ecx
 00458D90    mov        ecx,dword ptr [edx+1C]
 00458D93    mov        dword ptr [eax+1C],ecx
 00458D96    mov        eax,[00458E08]; 0x3FEFE
 00458D9B    push       eax
 00458D9C    mov        eax,dword ptr [edi]
 00458D9E    mov        ecx,dword ptr [eax+4]
 00458DA1    mov        dl,1
 00458DA3    mov        eax,[0045739C]; TPropInfoList
 00458DA8    call       TPropInfoList.Create; TPropInfoList.Create
 00458DAD    mov        dword ptr [ebp-8],eax
 00458DB0    xor        eax,eax
 00458DB2    push       ebp
 00458DB3    push       458DF9
 00458DB8    push       dword ptr fs:[eax]
 00458DBB    mov        dword ptr fs:[eax],esp
 00458DBE    mov        eax,dword ptr [ebp-8]
 00458DC1    mov        ebx,dword ptr [eax+8]; TPropInfoList.?f8:Integer
 00458DC4    dec        ebx
 00458DC5    test       ebx,ebx
>00458DC7    jl         00458DE3
 00458DC9    inc        ebx
 00458DCA    xor        esi,esi
 00458DCC    mov        edx,esi
 00458DCE    mov        eax,dword ptr [ebp-8]
 00458DD1    call       004575C4
 00458DD6    mov        edx,eax
 00458DD8    mov        eax,dword ptr [edi]
 00458DDA    call       00457940
 00458DDF    inc        esi
 00458DE0    dec        ebx
<00458DE1    jne        00458DCC
 00458DE3    xor        eax,eax
 00458DE5    pop        edx
 00458DE6    pop        ecx
 00458DE7    pop        ecx
 00458DE8    mov        dword ptr fs:[eax],edx
 00458DEB    push       458E00
 00458DF0    mov        eax,dword ptr [ebp-8]
 00458DF3    call       TObject.Free
 00458DF8    ret
<00458DF9    jmp        @HandleFinally
<00458DFE    jmp        00458DF0
 00458E00    pop        edi
 00458E01    pop        esi
 00458E02    pop        ebx
 00458E03    pop        ecx
 00458E04    pop        ecx
 00458E05    pop        ebp
 00458E06    ret
*}
//end;

//00458E0C
//procedure sub_00458E0C(?:TPropsStorage; ?:AnsiString; ?:?);
//begin
{*
 00458E0C    push       ebp
 00458E0D    mov        ebp,esp
 00458E0F    add        esp,0FFFFFFC0
 00458E12    push       ebx
 00458E13    push       esi
 00458E14    xor        ebx,ebx
 00458E16    mov        dword ptr [ebp-3C],ebx
 00458E19    mov        dword ptr [ebp-40],ebx
 00458E1C    mov        dword ptr [ebp-14],ebx
 00458E1F    mov        dword ptr [ebp-30],ebx
 00458E22    mov        dword ptr [ebp-28],ebx
 00458E25    mov        dword ptr [ebp-2C],ebx
 00458E28    mov        dword ptr [ebp-0C],ecx
 00458E2B    mov        ebx,edx
 00458E2D    mov        dword ptr [ebp-8],eax
 00458E30    xor        eax,eax
 00458E32    push       ebp
 00458E33    push       459062
 00458E38    push       dword ptr fs:[eax]
 00458E3B    mov        dword ptr fs:[eax],esp
 00458E3E    mov        eax,dword ptr [ebp-8]
 00458E41    mov        eax,dword ptr [eax+4]; TPropsStorage.?f4:TObject
 00458E44    mov        edx,dword ptr [ebp-0C]
 00458E47    call       GetOrdProp
 00458E4C    mov        dword ptr [ebp-10],eax
 00458E4F    cmp        dword ptr [ebp-10],0
>00458E53    je         00458FCA
 00458E59    mov        eax,dword ptr [ebp-10]
 00458E5C    mov        edx,dword ptr ds:[40EF58]; TStrings
 00458E62    call       @IsClass
 00458E67    test       al,al
>00458E69    je         00458E7D
 00458E6B    mov        ecx,dword ptr [ebp-0C]
 00458E6E    mov        edx,ebx
 00458E70    mov        eax,dword ptr [ebp-8]
 00458E73    call       00458A3C
>00458E78    jmp        00458FCA
 00458E7D    mov        eax,dword ptr [ebp-10]
 00458E80    mov        edx,dword ptr ds:[40EE5C]; TCollection
 00458E86    call       @IsClass
 00458E8B    test       al,al
>00458E8D    je         00458FA9
 00458E93    mov        eax,dword ptr [ebp-8]
 00458E96    mov        edx,dword ptr [eax]
 00458E98    call       dword ptr [edx+10]; TPropsStorage.sub_00459488
 00458E9B    mov        dword ptr [ebp-4],eax
 00458E9E    xor        eax,eax
 00458EA0    push       ebp
 00458EA1    push       458FA2
 00458EA6    push       dword ptr fs:[eax]
 00458EA9    mov        dword ptr fs:[eax],esp
 00458EAC    mov        ebx,dword ptr [ebp-10]
 00458EAF    mov        eax,ebx
 00458EB1    mov        edx,dword ptr [eax]
 00458EB3    call       dword ptr [edx+14]
 00458EB6    xor        eax,eax
 00458EB8    push       ebp
 00458EB9    push       458F85
 00458EBE    push       dword ptr fs:[eax]
 00458EC1    mov        dword ptr fs:[eax],esp
 00458EC4    mov        eax,ebx
 00458EC6    call       TCollection.GetCount
 00458ECB    mov        esi,eax
 00458ECD    dec        esi
 00458ECE    test       esi,esi
>00458ED0    jl         00458F6F
 00458ED6    inc        esi
 00458ED7    xor        ebx,ebx
 00458ED9    push       ebp
 00458EDA    lea        eax,[ebp-14]
 00458EDD    push       eax
 00458EDE    mov        eax,dword ptr [ebp-8]
 00458EE1    mov        eax,dword ptr [eax+10]; TPropsStorage.?f10:String
 00458EE4    mov        dword ptr [ebp-24],eax
 00458EE7    mov        byte ptr [ebp-20],0B
 00458EEB    lea        eax,[ebp-2C]
 00458EEE    mov        edx,dword ptr [ebp-0C]
 00458EF1    add        edx,1A
 00458EF4    call       @LStrFromString
 00458EF9    mov        ecx,dword ptr [ebp-2C]
 00458EFC    mov        eax,dword ptr [ebp-8]
 00458EFF    mov        edx,dword ptr [eax+0C]; TPropsStorage.?fC:String
 00458F02    lea        eax,[ebp-28]
 00458F05    call       @LStrCat3
 00458F0A    mov        eax,dword ptr [ebp-28]
 00458F0D    mov        dword ptr [ebp-1C],eax
 00458F10    mov        byte ptr [ebp-18],0B
 00458F14    lea        edx,[ebp-24]
 00458F17    mov        ecx,1
 00458F1C    mov        eax,459078; '%s.%s'
 00458F21    call       Format
 00458F26    mov        eax,dword ptr [ebp-14]
 00458F29    push       eax
 00458F2A    lea        eax,[ebp-30]
 00458F2D    push       eax
 00458F2E    mov        dword ptr [ebp-38],ebx
 00458F31    mov        byte ptr [ebp-34],0
 00458F35    lea        edx,[ebp-38]
 00458F38    xor        ecx,ecx
 00458F3A    mov        eax,459088; 'Item%d'
 00458F3F    call       Format
 00458F44    lea        eax,[ebp-30]
 00458F47    mov        edx,459098; '_'
 00458F4C    call       @LStrCat
 00458F51    mov        eax,dword ptr [ebp-30]
 00458F54    push       eax
 00458F55    mov        edx,ebx
 00458F57    mov        eax,dword ptr [ebp-10]
 00458F5A    call       TCollection.GetItem
 00458F5F    pop        edx
 00458F60    pop        ecx
 00458F61    call       00458D4C
 00458F66    pop        ecx
 00458F67    inc        ebx
 00458F68    dec        esi
<00458F69    jne        00458ED9
 00458F6F    xor        eax,eax
 00458F71    pop        edx
 00458F72    pop        ecx
 00458F73    pop        ecx
 00458F74    mov        dword ptr fs:[eax],edx
 00458F77    push       458F8C
 00458F7C    mov        eax,dword ptr [ebp-10]
 00458F7F    mov        edx,dword ptr [eax]
 00458F81    call       dword ptr [edx+18]
 00458F84    ret
<00458F85    jmp        @HandleFinally
<00458F8A    jmp        00458F7C
 00458F8C    xor        eax,eax
 00458F8E    pop        edx
 00458F8F    pop        ecx
 00458F90    pop        ecx
 00458F91    mov        dword ptr fs:[eax],edx
 00458F94    push       458FCA
 00458F99    mov        eax,dword ptr [ebp-4]
 00458F9C    call       TObject.Free
 00458FA1    ret
<00458FA2    jmp        @HandleFinally
<00458FA7    jmp        00458F99
 00458FA9    mov        eax,dword ptr [ebp-10]
 00458FAC    mov        edx,dword ptr ds:[40F6D8]; TComponent
 00458FB2    call       @IsClass
 00458FB7    test       al,al
>00458FB9    je         00458FCA
 00458FBB    mov        ecx,dword ptr [ebp-0C]
 00458FBE    mov        edx,ebx
 00458FC0    mov        eax,dword ptr [ebp-8]
 00458FC3    call       00458C08
>00458FC8    jmp        00459032
 00458FCA    mov        eax,dword ptr [ebp-8]
 00458FCD    mov        edx,dword ptr [eax]
 00458FCF    call       dword ptr [edx+10]; TPropsStorage.sub_00459488
 00458FD2    mov        dword ptr [ebp-4],eax
 00458FD5    xor        eax,eax
 00458FD7    push       ebp
 00458FD8    push       45902B
 00458FDD    push       dword ptr fs:[eax]
 00458FE0    mov        dword ptr fs:[eax],esp
 00458FE3    push       ebp
 00458FE4    lea        eax,[ebp-40]
 00458FE7    mov        edx,dword ptr [ebp-0C]
 00458FEA    add        edx,1A
 00458FED    call       @LStrFromString
 00458FF2    mov        ecx,dword ptr [ebp-40]
 00458FF5    mov        eax,dword ptr [ebp-8]
 00458FF8    mov        edx,dword ptr [eax+0C]; TPropsStorage.?fC:String
 00458FFB    lea        eax,[ebp-3C]
 00458FFE    call       @LStrCat3
 00459003    mov        edx,dword ptr [ebp-3C]
 00459006    mov        eax,dword ptr [ebp-8]
 00459009    mov        ecx,dword ptr [eax+10]; TPropsStorage.?f10:String
 0045900C    mov        eax,dword ptr [ebp-10]
 0045900F    call       00458D4C
 00459014    pop        ecx
 00459015    xor        eax,eax
 00459017    pop        edx
 00459018    pop        ecx
 00459019    pop        ecx
 0045901A    mov        dword ptr fs:[eax],edx
 0045901D    push       459032
 00459022    mov        eax,dword ptr [ebp-4]
 00459025    call       TObject.Free
 0045902A    ret
<0045902B    jmp        @HandleFinally
<00459030    jmp        00459022
 00459032    xor        eax,eax
 00459034    pop        edx
 00459035    pop        ecx
 00459036    pop        ecx
 00459037    mov        dword ptr fs:[eax],edx
 0045903A    push       459069
 0045903F    lea        eax,[ebp-40]
 00459042    mov        edx,2
 00459047    call       @LStrArrayClr
 0045904C    lea        eax,[ebp-30]
 0045904F    mov        edx,3
 00459054    call       @LStrArrayClr
 00459059    lea        eax,[ebp-14]
 0045905C    call       @LStrClr
 00459061    ret
<00459062    jmp        @HandleFinally
<00459067    jmp        0045903F
 00459069    pop        esi
 0045906A    pop        ebx
 0045906B    mov        esp,ebp
 0045906D    pop        ebp
 0045906E    ret
*}
//end;

//0045909C
//function sub_0045909C(?:TPropsStorage; ?:TComponent; ?:TStrings):TStringList;
//begin
{*
 0045909C    push       ebp
 0045909D    mov        ebp,esp
 0045909F    add        esp,0FFFFFFF0
 004590A2    push       ebx
 004590A3    push       esi
 004590A4    push       edi
 004590A5    mov        dword ptr [ebp-4],ecx
 004590A8    xor        ecx,ecx
 004590AA    mov        eax,edx
 004590AC    mov        edx,dword ptr [ebp-4]
 004590AF    call       00457770
 004590B4    mov        dl,1
 004590B6    mov        eax,[0040F078]; TStringList
 004590BB    call       TObject.Create; TStringList.Create
 004590C0    mov        dword ptr [ebp-8],eax
 004590C3    xor        eax,eax
 004590C5    push       ebp
 004590C6    push       459172
 004590CB    push       dword ptr fs:[eax]
 004590CE    mov        dword ptr fs:[eax],esp
 004590D1    mov        dl,1
 004590D3    mov        eax,dword ptr [ebp-8]
 004590D6    call       TStringList.SetSorted
 004590DB    mov        eax,dword ptr [ebp-4]
 004590DE    mov        edx,dword ptr [eax]
 004590E0    call       dword ptr [edx+14]
 004590E3    mov        esi,eax
 004590E5    dec        esi
 004590E6    test       esi,esi
>004590E8    jl         00459168
 004590EA    inc        esi
 004590EB    mov        dword ptr [ebp-0C],0
 004590F2    mov        edx,dword ptr [ebp-0C]
 004590F5    mov        eax,dword ptr [ebp-4]
 004590F8    mov        ecx,dword ptr [eax]
 004590FA    call       dword ptr [ecx+18]
 004590FD    mov        ebx,eax
 004590FF    mov        edx,dword ptr [ebx+8]
 00459102    mov        eax,dword ptr [ebp-8]
 00459105    mov        ecx,dword ptr [eax]
 00459107    call       dword ptr [ecx+50]; TStringList.IndexOf
 0045910A    test       eax,eax
>0045910C    jge        00459162
 0045910E    mov        eax,[00459194]; 0x3FEFE
 00459113    push       eax
 00459114    mov        ecx,ebx
 00459116    mov        dl,1
 00459118    mov        eax,[0045739C]; TPropInfoList
 0045911D    call       TPropInfoList.Create; TPropInfoList.Create
 00459122    mov        dword ptr [ebp-10],eax
 00459125    xor        eax,eax
 00459127    push       ebp
 00459128    push       45914B
 0045912D    push       dword ptr fs:[eax]
 00459130    mov        dword ptr fs:[eax],esp
 00459133    mov        edx,dword ptr [ebx+8]
 00459136    mov        ecx,dword ptr [ebp-10]
 00459139    mov        eax,dword ptr [ebp-8]
 0045913C    mov        ebx,dword ptr [eax]
 0045913E    call       dword ptr [ebx+38]; TStrings.AddObject
 00459141    xor        eax,eax
 00459143    pop        edx
 00459144    pop        ecx
 00459145    pop        ecx
 00459146    mov        dword ptr fs:[eax],edx
>00459149    jmp        00459162
<0045914B    jmp        @HandleAnyException
 00459150    mov        eax,dword ptr [ebp-10]
 00459153    call       TObject.Free
 00459158    call       @RaiseAgain
 0045915D    call       @DoneExcept
 00459162    inc        dword ptr [ebp-0C]
 00459165    dec        esi
<00459166    jne        004590F2
 00459168    xor        eax,eax
 0045916A    pop        edx
 0045916B    pop        ecx
 0045916C    pop        ecx
 0045916D    mov        dword ptr fs:[eax],edx
>00459170    jmp        00459189
<00459172    jmp        @HandleAnyException
 00459177    mov        eax,dword ptr [ebp-8]
 0045917A    call       TObject.Free
 0045917F    xor        eax,eax
 00459181    mov        dword ptr [ebp-8],eax
 00459184    call       @DoneExcept
 00459189    mov        eax,dword ptr [ebp-8]
 0045918C    pop        edi
 0045918D    pop        esi
 0045918E    pop        ebx
 0045918F    mov        esp,ebp
 00459191    pop        ebp
 00459192    ret
*}
//end;

//00459198
//procedure sub_00459198(?:TPropsStorage; ?:TStringList);
//begin
{*
 00459198    push       ebp
 00459199    mov        ebp,esp
 0045919B    push       ebx
 0045919C    push       esi
 0045919D    mov        esi,edx
 0045919F    mov        eax,esi
 004591A1    mov        edx,dword ptr [eax]
 004591A3    call       dword ptr [edx+14]; TStringList.GetCount
 004591A6    mov        ebx,eax
 004591A8    dec        ebx
 004591A9    cmp        ebx,0
>004591AC    jl         004591C2
 004591AE    mov        edx,ebx
 004591B0    mov        eax,esi
 004591B2    mov        ecx,dword ptr [eax]
 004591B4    call       dword ptr [ecx+18]; TStringList.GetObject
 004591B7    call       TObject.Free
 004591BC    dec        ebx
 004591BD    cmp        ebx,0FFFFFFFF
<004591C0    jne        004591AE
 004591C2    mov        eax,esi
 004591C4    call       TObject.Free
 004591C9    pop        esi
 004591CA    pop        ebx
 004591CB    pop        ebp
 004591CC    ret
*}
//end;

//004591D0
//procedure sub_004591D0(?:TPropsStorage; ?:TComponent; ?:TStrings);
//begin
{*
 004591D0    push       ebp
 004591D1    mov        ebp,esp
 004591D3    add        esp,0FFFFFFE8
 004591D6    push       ebx
 004591D7    push       esi
 004591D8    push       edi
 004591D9    xor        ebx,ebx
 004591DB    mov        dword ptr [ebp-18],ebx
 004591DE    mov        dword ptr [ebp-10],ebx
 004591E1    mov        dword ptr [ebp-14],ebx
 004591E4    mov        dword ptr [ebp-8],ecx
 004591E7    mov        ebx,edx
 004591E9    mov        dword ptr [ebp-4],eax
 004591EC    xor        eax,eax
 004591EE    push       ebp
 004591EF    push       459310
 004591F4    push       dword ptr fs:[eax]
 004591F7    mov        dword ptr fs:[eax],esp
 004591FA    mov        ecx,dword ptr [ebp-8]
 004591FD    mov        edx,ebx
 004591FF    mov        eax,dword ptr [ebp-4]
 00459202    call       0045909C
 00459207    mov        dword ptr [ebp-0C],eax
 0045920A    cmp        dword ptr [ebp-0C],0
>0045920E    je         004592F5
 00459214    xor        eax,eax
 00459216    push       ebp
 00459217    push       4592EE
 0045921C    push       dword ptr fs:[eax]
 0045921F    mov        dword ptr fs:[eax],esp
 00459222    mov        eax,dword ptr [ebp-4]
 00459225    mov        dword ptr [eax+8],ebx; TPropsStorage.?f8:TComponent
 00459228    mov        eax,dword ptr [ebp-8]
 0045922B    mov        edx,dword ptr [eax]
 0045922D    call       dword ptr [edx+14]; TStrings.GetCount
 00459230    mov        esi,eax
 00459232    dec        esi
 00459233    test       esi,esi
>00459235    jl         004592CD
 0045923B    inc        esi
 0045923C    xor        ebx,ebx
 0045923E    lea        ecx,[ebp-18]
 00459241    mov        edx,ebx
 00459243    mov        eax,dword ptr [ebp-8]
 00459246    mov        edi,dword ptr [eax]
 00459248    call       dword ptr [edi+0C]; TStrings.Get
 0045924B    mov        eax,dword ptr [ebp-18]
 0045924E    lea        ecx,[ebp-14]
 00459251    lea        edx,[ebp-10]
 00459254    call       0045760C
 00459259    test       al,al
>0045925B    je         004592C5
 0045925D    mov        edx,ebx
 0045925F    mov        eax,dword ptr [ebp-8]
 00459262    mov        ecx,dword ptr [eax]
 00459264    call       dword ptr [ecx+18]; TStrings.GetObject
 00459267    mov        edi,eax
 00459269    mov        eax,dword ptr [ebp-4]
 0045926C    mov        dword ptr [eax+4],edi; TPropsStorage.?f4:TObject
 0045926F    mov        eax,dword ptr [ebp-4]
 00459272    add        eax,0C; TPropsStorage.?fC:String
 00459275    mov        edx,dword ptr [edi+8]
 00459278    call       @LStrAsg
 0045927D    mov        eax,dword ptr [ebp-4]
 00459280    mov        edx,dword ptr [eax+0C]; TPropsStorage.?fC:String
 00459283    mov        eax,dword ptr [ebp-0C]
 00459286    mov        ecx,dword ptr [eax]
 00459288    call       dword ptr [ecx+50]; TStringList.IndexOf
 0045928B    mov        edi,eax
 0045928D    test       edi,edi
>0045928F    jl         004592C5
 00459291    mov        eax,dword ptr [ebp-4]
 00459294    add        eax,0C; TPropsStorage.?fC:String
 00459297    mov        edx,459328; '_'
 0045929C    call       @LStrCat
 004592A1    mov        edx,edi
 004592A3    mov        eax,dword ptr [ebp-0C]
 004592A6    mov        ecx,dword ptr [eax]
 004592A8    call       dword ptr [ecx+18]; TStringList.GetObject
 004592AB    mov        edi,eax
 004592AD    test       edi,edi
>004592AF    je         004592C5
 004592B1    mov        edx,dword ptr [ebp-14]
 004592B4    mov        eax,edi
 004592B6    call       0045753C
 004592BB    mov        edx,eax
 004592BD    mov        eax,dword ptr [ebp-4]
 004592C0    call       00457940
 004592C5    inc        ebx
 004592C6    dec        esi
<004592C7    jne        0045923E
 004592CD    xor        eax,eax
 004592CF    pop        edx
 004592D0    pop        ecx
 004592D1    pop        ecx
 004592D2    mov        dword ptr fs:[eax],edx
 004592D5    push       4592F5
 004592DA    mov        eax,dword ptr [ebp-4]
 004592DD    xor        edx,edx
 004592DF    mov        dword ptr [eax+8],edx; TPropsStorage.?f8:TComponent
 004592E2    mov        edx,dword ptr [ebp-0C]
 004592E5    mov        eax,dword ptr [ebp-4]
 004592E8    call       00459198
 004592ED    ret
<004592EE    jmp        @HandleFinally
<004592F3    jmp        004592DA
 004592F5    xor        eax,eax
 004592F7    pop        edx
 004592F8    pop        ecx
 004592F9    pop        ecx
 004592FA    mov        dword ptr fs:[eax],edx
 004592FD    push       459317
 00459302    lea        eax,[ebp-18]
 00459305    mov        edx,3
 0045930A    call       @LStrArrayClr
 0045930F    ret
<00459310    jmp        @HandleFinally
<00459315    jmp        00459302
 00459317    pop        edi
 00459318    pop        esi
 00459319    pop        ebx
 0045931A    mov        esp,ebp
 0045931C    pop        ebp
 0045931D    ret
*}
//end;

//0045932C
//procedure sub_0045932C(?:TPropsStorage; ?:TComponent; ?:TStrings);
//begin
{*
 0045932C    push       ebp
 0045932D    mov        ebp,esp
 0045932F    add        esp,0FFFFFFE8
 00459332    push       ebx
 00459333    push       esi
 00459334    push       edi
 00459335    xor        ebx,ebx
 00459337    mov        dword ptr [ebp-18],ebx
 0045933A    mov        dword ptr [ebp-10],ebx
 0045933D    mov        dword ptr [ebp-14],ebx
 00459340    mov        dword ptr [ebp-8],ecx
 00459343    mov        ebx,edx
 00459345    mov        dword ptr [ebp-4],eax
 00459348    xor        eax,eax
 0045934A    push       ebp
 0045934B    push       45946C
 00459350    push       dword ptr fs:[eax]
 00459353    mov        dword ptr fs:[eax],esp
 00459356    mov        ecx,dword ptr [ebp-8]
 00459359    mov        edx,ebx
 0045935B    mov        eax,dword ptr [ebp-4]
 0045935E    call       0045909C
 00459363    mov        dword ptr [ebp-0C],eax
 00459366    cmp        dword ptr [ebp-0C],0
>0045936A    je         00459451
 00459370    xor        eax,eax
 00459372    push       ebp
 00459373    push       45944A
 00459378    push       dword ptr fs:[eax]
 0045937B    mov        dword ptr fs:[eax],esp
 0045937E    mov        eax,dword ptr [ebp-4]
 00459381    mov        dword ptr [eax+8],ebx; TPropsStorage.?f8:TComponent
 00459384    mov        eax,dword ptr [ebp-8]
 00459387    mov        edx,dword ptr [eax]
 00459389    call       dword ptr [edx+14]; TStrings.GetCount
 0045938C    mov        esi,eax
 0045938E    dec        esi
 0045938F    test       esi,esi
>00459391    jl         00459429
 00459397    inc        esi
 00459398    xor        ebx,ebx
 0045939A    lea        ecx,[ebp-18]
 0045939D    mov        edx,ebx
 0045939F    mov        eax,dword ptr [ebp-8]
 004593A2    mov        edi,dword ptr [eax]
 004593A4    call       dword ptr [edi+0C]; TStrings.Get
 004593A7    mov        eax,dword ptr [ebp-18]
 004593AA    lea        ecx,[ebp-14]
 004593AD    lea        edx,[ebp-10]
 004593B0    call       0045760C
 004593B5    test       al,al
>004593B7    je         00459421
 004593B9    mov        edx,ebx
 004593BB    mov        eax,dword ptr [ebp-8]
 004593BE    mov        ecx,dword ptr [eax]
 004593C0    call       dword ptr [ecx+18]; TStrings.GetObject
 004593C3    mov        edi,eax
 004593C5    mov        eax,dword ptr [ebp-4]
 004593C8    mov        dword ptr [eax+4],edi; TPropsStorage.?f4:TObject
 004593CB    mov        eax,dword ptr [ebp-4]
 004593CE    add        eax,0C; TPropsStorage.?fC:String
 004593D1    mov        edx,dword ptr [edi+8]
 004593D4    call       @LStrAsg
 004593D9    mov        eax,dword ptr [ebp-4]
 004593DC    mov        edx,dword ptr [eax+0C]; TPropsStorage.?fC:String
 004593DF    mov        eax,dword ptr [ebp-0C]
 004593E2    mov        ecx,dword ptr [eax]
 004593E4    call       dword ptr [ecx+50]; TStringList.IndexOf
 004593E7    mov        edi,eax
 004593E9    test       edi,edi
>004593EB    jl         00459421
 004593ED    mov        eax,dword ptr [ebp-4]
 004593F0    add        eax,0C; TPropsStorage.?fC:String
 004593F3    mov        edx,459484; '_'
 004593F8    call       @LStrCat
 004593FD    mov        edx,edi
 004593FF    mov        eax,dword ptr [ebp-0C]
 00459402    mov        ecx,dword ptr [eax]
 00459404    call       dword ptr [ecx+18]; TStringList.GetObject
 00459407    mov        edi,eax
 00459409    test       edi,edi
>0045940B    je         00459421
 0045940D    mov        edx,dword ptr [ebp-14]
 00459410    mov        eax,edi
 00459412    call       0045753C
 00459417    mov        edx,eax
 00459419    mov        eax,dword ptr [ebp-4]
 0045941C    call       00457C10
 00459421    inc        ebx
 00459422    dec        esi
<00459423    jne        0045939A
 00459429    xor        eax,eax
 0045942B    pop        edx
 0045942C    pop        ecx
 0045942D    pop        ecx
 0045942E    mov        dword ptr fs:[eax],edx
 00459431    push       459451
 00459436    mov        eax,dword ptr [ebp-4]
 00459439    xor        edx,edx
 0045943B    mov        dword ptr [eax+8],edx; TPropsStorage.?f8:TComponent
 0045943E    mov        edx,dword ptr [ebp-0C]
 00459441    mov        eax,dword ptr [ebp-4]
 00459444    call       00459198
 00459449    ret
<0045944A    jmp        @HandleFinally
<0045944F    jmp        00459436
 00459451    xor        eax,eax
 00459453    pop        edx
 00459454    pop        ecx
 00459455    pop        ecx
 00459456    mov        dword ptr fs:[eax],edx
 00459459    push       459473
 0045945E    lea        eax,[ebp-18]
 00459461    mov        edx,3
 00459466    call       @LStrArrayClr
 0045946B    ret
<0045946C    jmp        @HandleFinally
<00459471    jmp        0045945E
 00459473    pop        edi
 00459474    pop        esi
 00459475    pop        ebx
 00459476    mov        esp,ebp
 00459478    pop        ebp
 00459479    ret
*}
//end;

//00459488
function sub_00459488():TPropsStorage;
begin
{*
 00459488    push       ebp
 00459489    mov        ebp,esp
 0045948B    mov        dl,1
 0045948D    mov        eax,[004573F8]; TPropsStorage
 00459492    call       TObject.Create; TPropsStorage.Create
 00459497    pop        ebp
 00459498    ret
*}
end;

//0045949C
//procedure sub_0045949C(?:?; ?:?; ?:?; ?:?);
//begin
{*
 0045949C    push       ebp
 0045949D    mov        ebp,esp
 0045949F    add        esp,0FFFFFFF8
 004594A2    push       ebx
 004594A3    push       esi
 004594A4    mov        dword ptr [ebp-8],ecx
 004594A7    mov        dword ptr [ebp-4],edx
 004594AA    mov        ebx,eax
 004594AC    mov        esi,dword ptr [ebp+8]
 004594AF    cmp        word ptr [ebx+1A],0; TPropsStorage.?f1A:word
>004594B4    je         004594C9
 004594B6    mov        eax,dword ptr [ebp+0C]
 004594B9    push       eax
 004594BA    push       esi
 004594BB    mov        ecx,dword ptr [ebp-8]
 004594BE    mov        edx,dword ptr [ebp-4]
 004594C1    mov        eax,dword ptr [ebx+1C]; TPropsStorage.?f1C:TFormStorage
 004594C4    call       dword ptr [ebx+18]
>004594C7    jmp        004594D0
 004594C9    mov        eax,esi
 004594CB    call       @LStrClr
 004594D0    pop        esi
 004594D1    pop        ebx
 004594D2    pop        ecx
 004594D3    pop        ecx
 004594D4    pop        ebp
 004594D5    ret        8
*}
//end;

//004594D8
//function sub_004594D8(?:?):TPropsStorage;
//begin
{*
 004594D8    push       ebp
 004594D9    mov        ebp,esp
 004594DB    push       ebx
 004594DC    cmp        word ptr [eax+22],0; TPropsStorage.?f22:word
>004594E1    je         004594EF
 004594E3    mov        ebx,dword ptr [ebp+8]
 004594E6    push       ebx
 004594E7    mov        ebx,eax
 004594E9    mov        eax,dword ptr [ebx+24]; TPropsStorage.?f24:TFormStorage
 004594EC    call       dword ptr [ebx+20]
 004594EF    pop        ebx
 004594F0    pop        ebp
 004594F1    ret        4
*}
//end;

//004594F4
function sub_004594F4:TPropsStorage;
begin
{*
 004594F4    push       ebp
 004594F5    mov        ebp,esp
 004594F7    push       ebx
 004594F8    cmp        word ptr [eax+2A],0; TPropsStorage.?f2A:word
>004594FD    je         00459507
 004594FF    mov        ebx,eax
 00459501    mov        eax,dword ptr [ebx+2C]; TPropsStorage.?f2C:dword
 00459504    call       dword ptr [ebx+28]
 00459507    pop        ebx
 00459508    pop        ebp
 00459509    ret
*}
end;

end.