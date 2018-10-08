{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit ehshelprouter;

interface

uses
  Classes, Windows, Graphics;

type
  THelpType = (htWinhelp, htHTMLhelp, htMixedMode);
  TShowType = (stDefault, stMain, stPopup);
  THelpRouter = class(TComponent)
  public
    HelpType:THelpType;//f24
    ShowType:TShowType;//f28
    f30:THelpEvent;//f30
    f32:word;//f32
    f34:THelpRouter;//f34
    OnHelp:THelpEvent;//f38
    f40:String;//f40
    f44:String;//f44
    ValidateID:Boolean;//f48
    destructor Destroy; virtual;
    constructor Create(AOwner:TComponent); virtual;
  end;

implementation

{$R *.DFM}

//00464538
//function sub_00464538:?;
//begin
{*
 00464538    push       ebp
 00464539    mov        ebp,esp
 0046453B    cmp        dword ptr ds:[46D928],0; gvar_0046D928:THelpRouter
>00464542    je         0046455A
 00464544    mov        ecx,464568; 'Multiple instances of THelpRouter are not allowed'
 00464549    mov        dl,1
 0046454B    mov        eax,[0040751C]; Exception
 00464550    call       Exception.Create; Exception.Create
 00464555    call       @RaiseExcept
 0046455A    mov        al,1
 0046455C    pop        ebp
 0046455D    ret
*}
//end;

//0046459C
constructor THelpRouter.Create(AOwner:TComponent);
begin
{*
 0046459C    push       ebp
 0046459D    mov        ebp,esp
 0046459F    push       ebx
 004645A0    push       esi
 004645A1    test       dl,dl
>004645A3    je         004645AD
 004645A5    add        esp,0FFFFFFF0
 004645A8    call       @ClassCreate
 004645AD    mov        ebx,edx
 004645AF    mov        esi,eax
 004645B1    xor        edx,edx
 004645B3    mov        eax,esi
 004645B5    call       TComponent.Create
 004645BA    call       00464538
 004645BF    test       al,al
>004645C1    je         004645FF
 004645C3    test       byte ptr [esi+20],10; THelpRouter.FComponentState:TComponentState
>004645C7    jne        004645FF
 004645C9    mov        eax,[0046C05C]; ^Application:TApplication
 004645CE    mov        eax,dword ptr [eax]
 004645D0    mov        edx,dword ptr [eax+0C8]; TApplication.FOnHelp:THelpEvent
 004645D6    mov        dword ptr [esi+30],edx; THelpRouter.?f30:THelpEvent
 004645D9    mov        edx,dword ptr [eax+0CC]; TApplication.?fCC:THelpRouter
 004645DF    mov        dword ptr [esi+34],edx; THelpRouter.?f34:THelpRouter
 004645E2    mov        eax,[0046C05C]; ^Application:TApplication
 004645E7    mov        eax,dword ptr [eax]
 004645E9    mov        dword ptr [eax+0CC],esi; TApplication.?fCC:THelpRouter
 004645EF    mov        dword ptr [eax+0C8],4647FC; TApplication.FOnHelp:THelpEvent sub_004647FC
 004645F9    mov        dword ptr ds:[46D928],esi; gvar_0046D928:THelpRouter
 004645FF    xor        eax,eax
 00464601    mov        dword ptr [esi+28],eax; THelpRouter.ShowType:TShowType
 00464604    lea        eax,[esi+44]; THelpRouter.?f44:String
 00464607    mov        edx,464634; 'CSHelp.txt'
 0046460C    call       @LStrAsg
 00464611    mov        eax,esi
 00464613    test       bl,bl
>00464615    je         00464626
 00464617    call       @AfterConstruction
 0046461C    pop        dword ptr fs:[0]
 00464623    add        esp,0C
 00464626    mov        eax,esi
 00464628    pop        esi
 00464629    pop        ebx
 0046462A    pop        ebp
 0046462B    ret
*}
end;

//00464640
destructor THelpRouter.Destroy;
begin
{*
 00464640    push       ebp
 00464641    mov        ebp,esp
 00464643    push       ebx
 00464644    push       esi
 00464645    call       @BeforeDestruction
 0046464A    mov        ebx,edx
 0046464C    mov        esi,eax
 0046464E    test       byte ptr [esi+20],10; THelpRouter.FComponentState:TComponentState
>00464652    jne        004646B8
 00464654    cmp        word ptr [esi+32],0; THelpRouter.?f32:word
>00464659    je         00464676
 0046465B    mov        eax,[0046C05C]; ^Application:TApplication
 00464660    mov        eax,dword ptr [eax]
 00464662    mov        edx,dword ptr [esi+30]; THelpRouter.?f30:THelpEvent
 00464665    mov        dword ptr [eax+0C8],edx; TApplication.FOnHelp:THelpEvent
 0046466B    mov        edx,dword ptr [esi+34]; THelpRouter.?f34:THelpRouter
 0046466E    mov        dword ptr [eax+0CC],edx; TApplication.?fCC:THelpRouter
>00464674    jmp        0046468B
 00464676    mov        eax,[0046C05C]; ^Application:TApplication
 0046467B    mov        eax,dword ptr [eax]
 0046467D    xor        edx,edx
 0046467F    mov        dword ptr [eax+0C8],edx; TApplication.FOnHelp:THelpEvent
 00464685    mov        dword ptr [eax+0CC],edx; TApplication.?fCC:THelpRouter
 0046468B    mov        eax,[0046C05C]; ^Application:TApplication
 00464690    mov        eax,dword ptr [eax]
 00464692    cmp        dword ptr [eax+24],0; TApplication.FHandle:HWND
>00464696    je         004646B8
 00464698    mov        eax,[0046C05C]; ^Application:TApplication
 0046469D    mov        eax,dword ptr [eax]
 0046469F    cmp        dword ptr [eax+40],0; TApplication.?f40:String
>004646A3    je         004646B8
 004646A5    mov        eax,[0046C05C]; ^Application:TApplication
 004646AA    mov        eax,dword ptr [eax]
 004646AC    xor        ecx,ecx
 004646AE    mov        edx,2
 004646B3    call       TApplication.HelpCommand
 004646B8    xor        eax,eax
 004646BA    mov        [0046D928],eax; gvar_0046D928:THelpRouter
 004646BF    mov        edx,ebx
 004646C1    and        dl,0FC
 004646C4    mov        eax,esi
 004646C6    call       TComponent.Destroy
 004646CB    test       bl,bl
>004646CD    jle        004646D6
 004646CF    mov        eax,esi
 004646D1    call       @ClassDestroy
 004646D6    pop        esi
 004646D7    pop        ebx
 004646D8    pop        ebp
 004646D9    ret
*}
end;

//004646DC
//function sub_004646DC(?:?):TCustomForm;
//begin
{*
 004646DC    push       ebp
 004646DD    mov        ebp,esp
 004646DF    push       ebx
 004646E0    mov        ebx,eax
 004646E2    mov        eax,[0046C190]; ^Screen:TScreen
 004646E7    mov        eax,dword ptr [eax]
 004646E9    mov        eax,dword ptr [eax+60]; TScreen.FActiveForm:TForm
 004646EC    test       eax,eax
>004646EE    je         004646F9
 004646F0    mov        edx,dword ptr ds:[46C190]; ^Screen:TScreen
 004646F6    pop        ebx
 004646F7    pop        ebp
 004646F8    ret
 004646F9    mov        eax,[0046C190]; ^Screen:TScreen
 004646FE    mov        eax,dword ptr [eax]
 00464700    mov        eax,dword ptr [eax+5C]; TScreen.FActiveCustomForm:TCustomForm
 00464703    test       eax,eax
>00464705    je         0046470F
 00464707    mov        edx,dword ptr ds:[46C190]; ^Screen:TScreen
>0046470D    jmp        0046471D
 0046470F    mov        eax,dword ptr [ebx+4]
 00464712    mov        edx,dword ptr ds:[43EEE8]; TForm
 00464718    call       @AsClass
 0046471D    pop        ebx
 0046471E    pop        ebp
 0046471F    ret
*}
//end;

//00464720
//function THelpRouter.SetHelpType(Self:THelpRouter; ?:?):Boolean;
//begin
{*
 00464720    push       ebp
 00464721    mov        ebp,esp
 00464723    cmp        edx,dword ptr [eax+24]; THelpRouter.HelpType:THelpType
>00464726    je         0046473F
 00464728    mov        dword ptr [eax+24],edx; THelpRouter.HelpType:THelpType
 0046472B    mov        edx,dword ptr [eax+24]; THelpRouter.HelpType:THelpType
 0046472E    dec        edx
 0046472F    sub        edx,2
>00464732    jae        0046473F
 00464734    test       byte ptr [eax+20],10; THelpRouter.FComponentState:TComponentState
>00464738    jne        0046473F
 0046473A    call       00464744
 0046473F    pop        ebp
 00464740    ret
*}
//end;

//00464744
function sub_00464744:Boolean;
begin
{*
 00464744    push       ebp
 00464745    mov        ebp,esp
 00464747    mov        eax,[0046BED8]; ^gvar_0046D920:HINST
 0046474C    cmp        dword ptr [eax],0
>0046474F    jne        00464756
 00464751    call       00464234
 00464756    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 0046475B    cmp        dword ptr [eax],0
 0046475E    setne      al
 00464761    pop        ebp
 00464762    ret
*}
end;

//00464764
//procedure sub_00464764(?:?; ?:AnsiString);
//begin
{*
 00464764    push       ebp
 00464765    mov        ebp,esp
 00464767    push       ebx
 00464768    push       esi
 00464769    push       edi
 0046476A    mov        edi,edx
 0046476C    mov        ebx,eax
 0046476E    mov        eax,ebx
 00464770    call       004646DC
 00464775    mov        esi,eax
 00464777    cmp        dword ptr [ebx+40],0
>0046477B    je         00464789
 0046477D    mov        eax,edi
 0046477F    mov        edx,dword ptr [ebx+40]
 00464782    call       @LStrAsg
>00464787    jmp        004647C0
 00464789    mov        eax,edi
 0046478B    mov        edx,dword ptr ds:[46C05C]; ^Application:TApplication
 00464791    mov        edx,dword ptr [edx]
 00464793    mov        edx,dword ptr [edx+40]; TApplication.?f40:String
 00464796    call       @LStrAsg
 0046479B    test       esi,esi
>0046479D    je         004647C0
 0046479F    mov        eax,esi
 004647A1    call       TWinControl.HandleAllocated
 004647A6    test       al,al
>004647A8    je         004647C0
 004647AA    cmp        dword ptr [esi+224],0; TCustomForm.?f224:String
>004647B1    je         004647C0
 004647B3    mov        eax,edi
 004647B5    mov        edx,dword ptr [esi+224]; TCustomForm.?f224:String
 004647BB    call       @LStrAsg
 004647C0    pop        edi
 004647C1    pop        esi
 004647C2    pop        ebx
 004647C3    pop        ebp
 004647C4    ret
*}
//end;

//004647C8
function sub_004647C8:HWND;
begin
{*
 004647C8    push       ebp
 004647C9    mov        ebp,esp
 004647CB    push       ebx
 004647CC    push       esi
 004647CD    call       004646DC
 004647D2    mov        ebx,eax
 004647D4    mov        eax,[0046C05C]; ^Application:TApplication
 004647D9    mov        eax,dword ptr [eax]
 004647DB    mov        esi,dword ptr [eax+24]; TApplication.FHandle:HWND
 004647DE    test       ebx,ebx
>004647E0    je         004647F6
 004647E2    mov        eax,ebx
 004647E4    call       TWinControl.HandleAllocated
 004647E9    test       al,al
>004647EB    je         004647F6
 004647ED    mov        eax,ebx
 004647EF    call       TWinControl.GetHandle
 004647F4    mov        esi,eax
 004647F6    mov        eax,esi
 004647F8    pop        esi
 004647F9    pop        ebx
 004647FA    pop        ebp
 004647FB    ret
*}
end;

//004647FC
//function sub_004647FC(?:?; ?:?; ?:?; ?:?):LongBool;
//begin
{*
 004647FC    push       ebp
 004647FD    mov        ebp,esp
 004647FF    add        esp,0FFFFFFE4
 00464802    push       ebx
 00464803    push       esi
 00464804    push       edi
 00464805    xor        ebx,ebx
 00464807    mov        dword ptr [ebp-1C],ebx
 0046480A    mov        dword ptr [ebp-10],ebx
 0046480D    mov        dword ptr [ebp-0C],ebx
 00464810    mov        dword ptr [ebp-4],ecx
 00464813    mov        word ptr [ebp-6],dx
 00464817    mov        ebx,eax
 00464819    mov        esi,dword ptr [ebp+8]
 0046481C    xor        eax,eax
 0046481E    push       ebp
 0046481F    push       464AF2
 00464824    push       dword ptr fs:[eax]
 00464827    mov        dword ptr fs:[eax],esp
 0046482A    mov        byte ptr [ebp-7],0
 0046482E    cmp        word ptr [ebx+3A],0
>00464833    je         00464846
 00464835    push       esi
 00464836    mov        ecx,dword ptr [ebp-4]
 00464839    mov        dx,word ptr [ebp-6]
 0046483D    mov        eax,dword ptr [ebx+3C]
 00464840    call       dword ptr [ebx+38]
 00464843    mov        byte ptr [ebp-7],al
 00464846    cmp        byte ptr [esi],0
>00464849    je         00464ACF
 0046484F    cmp        word ptr [ebx+32],0
>00464854    je         00464867
 00464856    push       esi
 00464857    mov        ecx,dword ptr [ebp-4]
 0046485A    mov        dx,word ptr [ebp-6]
 0046485E    mov        eax,dword ptr [ebx+34]
 00464861    call       dword ptr [ebx+30]
 00464864    mov        byte ptr [ebp-7],al
 00464867    cmp        byte ptr [esi],0
>0046486A    je         00464ACF
 00464870    lea        edx,[ebp-0C]
 00464873    mov        eax,ebx
 00464875    call       00464764
 0046487A    mov        edx,dword ptr [ebp-0C]
 0046487D    mov        eax,46D968; gvar_0046D968:AnsiString
 00464882    call       @LStrAsg
 00464887    cmp        dword ptr [ebx+28],1
>0046488B    jne        004648AB
 0046488D    mov        ax,word ptr [ebp-6]
 00464891    sub        ax,8
>00464895    je         004648A5
 00464897    sub        ax,5
>0046489B    jne        004648AB
 0046489D    mov        word ptr [ebp-6],0
>004648A3    jmp        004648AB
 004648A5    mov        word ptr [ebp-6],1
 004648AB    xor        eax,eax
 004648AD    mov        edx,dword ptr [ebx+24]
 004648B0    dec        edx
>004648B1    je         004648B8
 004648B3    dec        edx
>004648B4    je         004648BC
>004648B6    jmp        004648D0
 004648B8    mov        al,1
>004648BA    jmp        004648D0
 004648BC    cmp        word ptr [ebp-6],8
>004648C1    je         004648CA
 004648C3    cmp        word ptr [ebp-6],0D
>004648C8    jne        004648CE
 004648CA    xor        eax,eax
>004648CC    jmp        004648D0
 004648CE    mov        al,1
 004648D0    test       al,al
>004648D2    je         00464A85
 004648D8    mov        eax,ebx
 004648DA    call       00464744
 004648DF    test       al,al
>004648E1    je         00464ACF
 004648E7    xor        edi,edi
 004648E9    lea        ecx,[ebp-10]
 004648EC    mov        edx,464B10; '.chm'
 004648F1    mov        eax,[0046D968]; gvar_0046D968:AnsiString
 004648F6    call       ChangeFileExt
 004648FB    mov        edx,dword ptr [ebp-10]
 004648FE    mov        eax,46D968; gvar_0046D968:AnsiString
 00464903    call       @LStrAsg
 00464908    movzx      eax,word ptr [ebp-6]
 0046490C    cmp        eax,0B
>0046490F    jg         00464936
>00464911    je         0046499F
 00464917    dec        eax
>00464918    je         00464A14
 0046491E    dec        eax
>0046491F    je         004649E3
 00464925    dec        eax
>00464926    je         0046499F
 00464928    sub        eax,5
>0046492B    je         00464A34
>00464931    jmp        00464A7D
 00464936    sub        eax,0D
>00464939    je         004649FB
 0046493F    sub        eax,2
>00464942    je         00464955
 00464944    sub        eax,0F2
>00464949    je         004649C0
 0046494B    sub        eax,4
>0046494E    je         004649C0
>00464950    jmp        00464A7D
 00464955    mov        eax,dword ptr [ebp-4]
 00464958    sub        eax,1
>0046495B    jae        0046497E
 0046495D    push       0
 0046495F    push       1
 00464961    mov        eax,[0046D968]; gvar_0046D968:AnsiString
 00464966    call       @LStrToPChar
 0046496B    push       eax
 0046496C    push       0
 0046496E    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 00464973    mov        eax,dword ptr [eax]
 00464975    call       eax
 00464977    mov        edi,eax
>00464979    jmp        00464A7D
 0046497E    push       0
 00464980    push       2
 00464982    mov        eax,[0046D968]; gvar_0046D968:AnsiString
 00464987    call       @LStrToPChar
 0046498C    push       eax
 0046498D    push       0
 0046498F    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 00464994    mov        eax,dword ptr [eax]
 00464996    call       eax
 00464998    mov        edi,eax
>0046499A    jmp        00464A7D
 0046499F    push       0
 004649A1    push       1
 004649A3    mov        eax,[0046D968]; gvar_0046D968:AnsiString
 004649A8    call       @LStrToPChar
 004649AD    push       eax
 004649AE    push       0
 004649B0    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 004649B5    mov        eax,dword ptr [eax]
 004649B7    call       eax
 004649B9    mov        edi,eax
>004649BB    jmp        00464A7D
 004649C0    mov        eax,dword ptr [ebp-4]
 004649C3    push       eax
 004649C4    push       2
 004649C6    mov        eax,[0046D968]; gvar_0046D968:AnsiString
 004649CB    call       @LStrToPChar
 004649D0    push       eax
 004649D1    push       0
 004649D3    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 004649D8    mov        eax,dword ptr [eax]
 004649DA    call       eax
 004649DC    mov        edi,eax
>004649DE    jmp        00464A7D
 004649E3    push       0
 004649E5    push       12
 004649E7    push       0
 004649E9    push       0
 004649EB    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 004649F0    mov        eax,dword ptr [eax]
 004649F2    call       eax
 004649F4    mov        edi,eax
>004649F6    jmp        00464A7D
 004649FB    lea        edx,[ebp-18]
 004649FE    mov        eax,dword ptr [ebp-4]
 00464A01    call       SmallPointToPoint
 00464A06    mov        eax,dword ptr [ebp-18]
 00464A09    mov        dword ptr [ebx+4C],eax
 00464A0C    mov        eax,dword ptr [ebp-14]
 00464A0F    mov        dword ptr [ebx+50],eax
>00464A12    jmp        00464A7D
 00464A14    mov        eax,dword ptr [ebp-4]
 00464A17    push       eax
 00464A18    push       0F
 00464A1A    mov        eax,[0046D968]; gvar_0046D968:AnsiString
 00464A1F    call       @LStrToPChar
 00464A24    push       eax
 00464A25    push       0
 00464A27    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 00464A2C    mov        eax,dword ptr [eax]
 00464A2E    call       eax
 00464A30    mov        edi,eax
>00464A32    jmp        00464A7D
 00464A34    cmp        dword ptr [ebx+4C],0
>00464A38    jne        00464A49
 00464A3A    cmp        dword ptr [ebx+50],0
>00464A3E    jne        00464A49
 00464A40    lea        eax,[ebx+4C]
 00464A43    push       eax
 00464A44    call       user32.GetCursorPos
 00464A49    mov        eax,dword ptr [ebp-4]
 00464A4C    push       eax
 00464A4D    push       0
 00464A4F    mov        ecx,dword ptr [ebx+50]
 00464A52    mov        edx,dword ptr [ebx+4C]
 00464A55    mov        eax,ebx
 00464A57    call       00464B28
 00464A5C    lea        ecx,[ebp-18]
 00464A5F    xor        edx,edx
 00464A61    xor        eax,eax
 00464A63    call       Point
 00464A68    mov        eax,dword ptr [ebp-18]
 00464A6B    mov        dword ptr [ebx+4C],eax
 00464A6E    mov        eax,dword ptr [ebp-14]
 00464A71    mov        dword ptr [ebx+50],eax
 00464A74    mov        byte ptr [esi],0
 00464A77    mov        byte ptr [ebp-7],1
>00464A7B    jmp        00464ACF
 00464A7D    test       edi,edi
 00464A7F    setne      byte ptr [ebp-7]
>00464A83    jmp        00464ACC
 00464A85    cmp        word ptr [ebp-6],0
>00464A8A    je         00464AC8
 00464A8C    mov        eax,dword ptr [ebp-4]
 00464A8F    push       eax
 00464A90    movzx      eax,word ptr [ebp-6]
 00464A94    push       eax
 00464A95    lea        ecx,[ebp-1C]
 00464A98    mov        edx,464B20; '.hlp'
 00464A9D    mov        eax,[0046D968]; gvar_0046D968:AnsiString
 00464AA2    call       ChangeFileExt
 00464AA7    mov        eax,dword ptr [ebp-1C]
 00464AAA    call       @LStrToPChar
 00464AAF    push       eax
 00464AB0    mov        eax,ebx
 00464AB2    call       004647C8
 00464AB7    push       eax
 00464AB8    call       user32.WinHelpA
 00464ABD    neg        eax
 00464ABF    sbb        eax,eax
 00464AC1    neg        eax
 00464AC3    mov        byte ptr [ebp-7],al
>00464AC6    jmp        00464ACC
 00464AC8    mov        byte ptr [ebp-7],1
 00464ACC    mov        byte ptr [esi],0
 00464ACF    xor        eax,eax
 00464AD1    pop        edx
 00464AD2    pop        ecx
 00464AD3    pop        ecx
 00464AD4    mov        dword ptr fs:[eax],edx
 00464AD7    push       464AF9
 00464ADC    lea        eax,[ebp-1C]
 00464ADF    call       @LStrClr
 00464AE4    lea        eax,[ebp-10]
 00464AE7    mov        edx,2
 00464AEC    call       @LStrArrayClr
 00464AF1    ret
<00464AF2    jmp        @HandleFinally
<00464AF7    jmp        00464ADC
 00464AF9    mov        al,byte ptr [ebp-7]
 00464AFC    pop        edi
 00464AFD    pop        esi
 00464AFE    pop        ebx
 00464AFF    mov        esp,ebp
 00464B01    pop        ebp
 00464B02    ret        4
*}
//end;

//00464B28
//function sub_00464B28(?:?; ?:?; ?:?; ?:?; ?:?):?;
//begin
{*
 00464B28    push       ebp
 00464B29    mov        ebp,esp
 00464B2B    push       0
 00464B2D    push       0
 00464B2F    push       0
 00464B31    push       ebx
 00464B32    push       esi
 00464B33    push       edi
 00464B34    mov        dword ptr [ebp-4],ecx
 00464B37    mov        edi,edx
 00464B39    mov        ebx,eax
 00464B3B    mov        eax,dword ptr [ebp+8]
 00464B3E    call       @LStrAddRef
 00464B43    mov        esi,46D930
 00464B48    xor        eax,eax
 00464B4A    push       ebp
 00464B4B    push       464C82
 00464B50    push       dword ptr fs:[eax]
 00464B53    mov        dword ptr fs:[eax],esp
 00464B56    mov        eax,ebx
 00464B58    call       00464744
 00464B5D    test       al,al
>00464B5F    je         00464C5D
 00464B65    mov        dword ptr [esi],34
 00464B6B    xor        eax,eax
 00464B6D    mov        dword ptr [esi+4],eax
 00464B70    cmp        dword ptr [ebp+8],0
>00464B74    jne        00464B7E
 00464B76    mov        eax,dword ptr [ebp+0C]
 00464B79    mov        dword ptr [esi+8],eax
>00464B7C    jmp        00464B83
 00464B7E    xor        eax,eax
 00464B80    mov        dword ptr [esi+8],eax
 00464B83    mov        eax,dword ptr [ebp+8]
 00464B86    call       @LStrToPChar
 00464B8B    mov        dword ptr [esi+0C],eax
 00464B8E    mov        dword ptr [esi+10],edi
 00464B91    mov        eax,dword ptr [ebp-4]
 00464B94    mov        dword ptr [esi+14],eax
 00464B97    mov        dword ptr [esi+18],0FFFFFFFF
 00464B9E    mov        dword ptr [esi+1C],0FFFFFFFF
 00464BA5    mov        dword ptr [esi+20],0FFFFFFFF
 00464BAC    mov        dword ptr [esi+28],0FFFFFFFF
 00464BB3    mov        dword ptr [esi+24],0FFFFFFFF
 00464BBA    mov        dword ptr [esi+2C],0FFFFFFFF
 00464BC1    mov        eax,464C94
 00464BC6    mov        dword ptr [esi+30],eax
 00464BC9    cmp        dword ptr [esi+8],0
>00464BCD    je         00464C3E
 00464BCF    cmp        dword ptr [ebx+44],0
>00464BD3    jne        00464BE2
 00464BD5    lea        eax,[ebx+44]
 00464BD8    mov        edx,464CB0; 'CSHelp.txt'
 00464BDD    call       @LStrAsg
 00464BE2    lea        edx,[ebp-0C]
 00464BE5    mov        eax,ebx
 00464BE7    call       00464764
 00464BEC    mov        eax,dword ptr [ebp-0C]
 00464BEF    lea        ecx,[ebp-8]
 00464BF2    mov        edx,464CC4; '.chm'
 00464BF7    call       ChangeFileExt
 00464BFC    push       dword ptr [ebp-8]
 00464BFF    push       464CD4; '::/'
 00464C04    push       dword ptr [ebx+44]
 00464C07    mov        eax,46D968; gvar_0046D968:AnsiString
 00464C0C    mov        edx,3
 00464C11    call       @LStrCatN
 00464C16    push       esi
 00464C17    push       0E
 00464C19    mov        eax,[0046D968]; gvar_0046D968:AnsiString
 00464C1E    call       @LStrToPChar
 00464C23    push       eax
 00464C24    mov        eax,ebx
 00464C26    call       004647C8
 00464C2B    push       eax
 00464C2C    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 00464C31    mov        eax,dword ptr [eax]
 00464C33    call       eax
 00464C35    test       eax,eax
 00464C37    setne      al
 00464C3A    mov        ebx,eax
>00464C3C    jmp        00464C5F
 00464C3E    push       esi
 00464C3F    push       0E
 00464C41    push       0
 00464C43    mov        eax,ebx
 00464C45    call       004647C8
 00464C4A    push       eax
 00464C4B    mov        eax,[0046BE24]; ^gvar_0046D91C:Pointer
 00464C50    mov        eax,dword ptr [eax]
 00464C52    call       eax
 00464C54    test       eax,eax
 00464C56    setne      al
 00464C59    mov        ebx,eax
>00464C5B    jmp        00464C5F
 00464C5D    xor        ebx,ebx
 00464C5F    xor        eax,eax
 00464C61    pop        edx
 00464C62    pop        ecx
 00464C63    pop        ecx
 00464C64    mov        dword ptr fs:[eax],edx
 00464C67    push       464C89
 00464C6C    lea        eax,[ebp-0C]
 00464C6F    mov        edx,2
 00464C74    call       @LStrArrayClr
 00464C79    lea        eax,[ebp+8]
 00464C7C    call       @LStrClr
 00464C81    ret
<00464C82    jmp        @HandleFinally
<00464C87    jmp        00464C6C
 00464C89    mov        eax,ebx
 00464C8B    pop        edi
 00464C8C    pop        esi
 00464C8D    pop        ebx
 00464C8E    mov        esp,ebp
 00464C90    pop        ebp
 00464C91    ret        8
*}
//end;

Initialization
Finalization
//00464CD8
{*
 00464CD8    push       ebp
 00464CD9    mov        ebp,esp
 00464CDB    xor        eax,eax
 00464CDD    push       ebp
 00464CDE    push       464D13
 00464CE3    push       dword ptr fs:[eax]
 00464CE6    mov        dword ptr fs:[eax],esp
 00464CE9    inc        dword ptr ds:[46D92C]
>00464CEF    jne        00464D05
 00464CF1    mov        eax,46D968; gvar_0046D968:AnsiString
 00464CF6    call       @LStrClr
 00464CFB    mov        eax,46D964; gvar_0046D964:AnsiString
 00464D00    call       @LStrClr
 00464D05    xor        eax,eax
 00464D07    pop        edx
 00464D08    pop        ecx
 00464D09    pop        ecx
 00464D0A    mov        dword ptr fs:[eax],edx
 00464D0D    push       464D1A
 00464D12    ret
<00464D13    jmp        @HandleFinally
<00464D18    jmp        00464D12
 00464D1A    pop        ebp
 00464D1B    ret
*}
end.