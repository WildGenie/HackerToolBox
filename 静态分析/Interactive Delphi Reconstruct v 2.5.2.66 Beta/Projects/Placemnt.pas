{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit Placemnt;

interface

uses
  Classes, Windows, Graphics, RxHook, Messages;

type
  TPlacementOption = (fpState, fpPosition, fpActiveControl);
  TPlacementOptions = set of TPlacementOption;
  TWinMinMaxInfo = class(TPersistent)
  public
    f4:TFormPlacement;//f4
    //f8:?;//f8
    procedure Assign(Source:TPersistent); virtual;
  end;
  TFormPlacement = class(TComponent)
  public
    Active:Boolean;//f24
    f28:PString;//f28
    f2C:PString;//f2C
    f30:dword;//f30
    UseRegistry:Boolean;//f34
    f38:dword;//f38
    f3C:TList;//f3C
    Options:TPlacementOptions;//f40
    f42:byte;//f42
    f43:byte;//f43
    PreventResize:Boolean;//f44
    MinMaxInfo:TWinMinMaxInfo;//f48
    f4C:byte;//f4C
    f50:TRxWindowHook;//f50
    f58:dword;//f58
    f5C:dword;//f5C
    f60:dword;//f60
    f64:dword;//f64
    f68:dword;//f68
    f6C:dword;//f6C
    OnSavePlacement:TNotifyEvent;//f70
    f72:word;//f72
    f74:dword;//f74
    OnRestorePlacement:TNotifyEvent;//f78
    f7A:word;//f7A
    f7C:dword;//f7C
    destructor Destroy; virtual;
    function Loaded:dword; virtual;
    constructor Create(AOwner:TComponent); virtual;
    procedure sub_0045A598; virtual;
    procedure sub_0045A728; virtual;
    procedure sub_0045A580; dynamic;
    procedure sub_0045A568; dynamic;
  end;
  TFormStorage = class(TFormPlacement)
  public
    StoredProps:TStrings;//f80
    destructor Destroy; virtual;
    procedure Loaded; virtual;
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;
    procedure WriteState(Writer:TWriter); virtual;
    constructor Create(AOwner:TComponent); virtual;
    procedure sub_0045AFF8; virtual;
    procedure sub_0045B010; virtual;
  end;

implementation

{$R *.DFM}

//00459A80
constructor TFormPlacement.Create(AOwner:TComponent);
begin
{*
 00459A80    push       ebp
 00459A81    mov        ebp,esp
 00459A83    push       ebx
 00459A84    push       esi
 00459A85    push       edi
 00459A86    test       dl,dl
>00459A88    je         00459A92
 00459A8A    add        esp,0FFFFFFF0
 00459A8D    call       @ClassCreate
 00459A92    mov        esi,ecx
 00459A94    mov        ebx,edx
 00459A96    mov        edi,eax
 00459A98    mov        ecx,esi
 00459A9A    xor        edx,edx
 00459A9C    mov        eax,edi
 00459A9E    call       TComponent.Create
 00459AA3    mov        eax,[0046C12C]; ^NullStr:System.PString
 00459AA8    mov        eax,dword ptr [eax]
 00459AAA    mov        dword ptr [edi+28],eax; TFormPlacement.?f28:PString
 00459AAD    mov        eax,[0046C12C]; ^NullStr:System.PString
 00459AB2    mov        eax,dword ptr [eax]
 00459AB4    mov        dword ptr [edi+2C],eax; TFormPlacement.?f2C:PString
 00459AB7    mov        byte ptr [edi+24],1; TFormPlacement.Active:Boolean
 00459ABB    mov        eax,esi
 00459ABD    mov        edx,dword ptr ds:[43EEE8]; TForm
 00459AC3    call       @IsClass
 00459AC8    test       al,al
>00459ACA    je         00459AD6
 00459ACC    mov        al,[00459B3C]; 0x3
 00459AD1    mov        byte ptr [edi+40],al; TFormPlacement.Options:TPlacementOptions
>00459AD4    jmp        00459ADE
 00459AD6    mov        al,[00459B40]; 0x0
 00459ADB    mov        byte ptr [edi+40],al; TFormPlacement.Options:TPlacementOptions
 00459ADE    mov        ecx,edi
 00459AE0    mov        dl,1
 00459AE2    mov        eax,[0044F6B0]; TRxWindowHook
 00459AE7    call       TRxWindowHook.Create; TRxWindowHook.Create
 00459AEC    mov        esi,eax
 00459AEE    mov        dword ptr [edi+50],esi; TFormPlacement.?f50:TRxWindowHook
 00459AF1    mov        dword ptr [esi+3C],edi; TRxWindowHook.?f3C:TFormPlacement
 00459AF4    mov        dword ptr [esi+38],459E48; TRxWindowHook.AfterMessage:THookMessageEvent sub_00459E48
 00459AFB    mov        dl,1
 00459AFD    mov        eax,[004595A8]; TWinMinMaxInfo
 00459B02    call       TObject.Create; TWinMinMaxInfo.Create
 00459B07    mov        esi,eax
 00459B09    mov        dword ptr [edi+48],esi; TFormPlacement.MinMaxInfo:TWinMinMaxInfo
 00459B0C    mov        dword ptr [esi+4],edi; TWinMinMaxInfo.?f4:TFormPlacement
 00459B0F    mov        dl,1
 00459B11    mov        eax,[0040EBFC]; TList
 00459B16    call       TObject.Create; TList.Create
 00459B1B    mov        dword ptr [edi+3C],eax; TFormPlacement.?f3C:TList
 00459B1E    mov        eax,edi
 00459B20    test       bl,bl
>00459B22    je         00459B33
 00459B24    call       @AfterConstruction
 00459B29    pop        dword ptr fs:[0]
 00459B30    add        esp,0C
 00459B33    mov        eax,edi
 00459B35    pop        edi
 00459B36    pop        esi
 00459B37    pop        ebx
 00459B38    pop        ebp
 00459B39    ret
*}
end;

//00459B44
destructor TFormPlacement.Destroy;
begin
{*
 00459B44    push       ebp
 00459B45    mov        ebp,esp
 00459B47    push       ebx
 00459B48    push       esi
 00459B49    push       edi
 00459B4A    call       @BeforeDestruction
 00459B4F    mov        ebx,edx
 00459B51    mov        edi,eax
 00459B53    mov        eax,edi
 00459B55    call       0045A878
>00459B5A    jmp        00459B6C
 00459B5C    mov        eax,esi
 00459B5E    call       TList.Last
 00459B63    mov        edx,eax
 00459B65    mov        eax,edi
 00459B67    call       00459C44
 00459B6C    mov        esi,dword ptr [edi+3C]; TFormPlacement.?f3C:TList
 00459B6F    cmp        dword ptr [esi+8],0; TList.FCount:Integer
<00459B73    jg         00459B5C
 00459B75    mov        eax,dword ptr [edi+3C]; TFormPlacement.?f3C:TList
 00459B78    call       TObject.Free
 00459B7D    test       byte ptr [edi+20],10; TFormPlacement.FComponentState:TComponentState
>00459B81    jne        00459B91
 00459B83    mov        eax,edi
 00459B85    call       00459DC8
 00459B8A    mov        eax,edi
 00459B8C    call       00459D30
 00459B91    mov        eax,dword ptr [edi+28]; TFormPlacement.?f28:PString
 00459B94    call       DisposeStr
 00459B99    mov        eax,dword ptr [edi+2C]; TFormPlacement.?f2C:PString
 00459B9C    call       DisposeStr
 00459BA1    mov        eax,dword ptr [edi+48]; TFormPlacement.MinMaxInfo:TWinMinMaxInfo
 00459BA4    call       TObject.Free
 00459BA9    mov        edx,ebx
 00459BAB    and        dl,0FC
 00459BAE    mov        eax,edi
 00459BB0    call       TComponent.Destroy
 00459BB5    test       bl,bl
>00459BB7    jle        00459BC0
 00459BB9    mov        eax,edi
 00459BBB    call       @ClassDestroy
 00459BC0    pop        edi
 00459BC1    pop        esi
 00459BC2    pop        ebx
 00459BC3    pop        ebp
 00459BC4    ret
*}
end;

//00459BC8
function TFormPlacement.Loaded:dword;
begin
{*
 00459BC8    push       ebp
 00459BC9    mov        ebp,esp
 00459BCB    push       ebx
 00459BCC    push       esi
 00459BCD    mov        esi,eax
 00459BCF    test       byte ptr [esi+20],1; TFormPlacement.FComponentState:TComponentState
 00459BD3    setne      bl
 00459BD6    mov        eax,esi
 00459BD8    call       TComponent.Loaded
 00459BDD    test       byte ptr [esi+20],10; TFormPlacement.FComponentState:TComponentState
>00459BE1    jne        00459BF5
 00459BE3    test       bl,bl
>00459BE5    je         00459BEE
 00459BE7    mov        eax,esi
 00459BE9    call       00459C88
 00459BEE    mov        eax,esi
 00459BF0    call       00459DD8
 00459BF5    pop        esi
 00459BF6    pop        ebx
 00459BF7    pop        ebp
 00459BF8    ret
*}
end;

//00459BFC
//procedure sub_00459BFC(?:TFormPlacement; ?:?);
//begin
{*
 00459BFC    push       ebp
 00459BFD    mov        ebp,esp
 00459BFF    push       ecx
 00459C00    push       ebx
 00459C01    push       esi
 00459C02    push       edi
 00459C03    mov        dword ptr [ebp-4],edx
 00459C06    mov        edi,eax
 00459C08    mov        eax,dword ptr [edi+3C]; TFormPlacement.?f3C:TList
 00459C0B    mov        ebx,dword ptr [eax+8]; TList.FCount:Integer
 00459C0E    dec        ebx
 00459C0F    test       ebx,ebx
>00459C11    jl         00459C3C
 00459C13    inc        ebx
 00459C14    xor        esi,esi
 00459C16    mov        eax,dword ptr [edi+3C]; TFormPlacement.?f3C:TList
 00459C19    mov        edx,esi
 00459C1B    call       TList.Get
 00459C20    mov        edx,dword ptr [ebp-4]
 00459C23    sub        edx,1
>00459C26    jb         00459C2C
>00459C28    je         00459C33
>00459C2A    jmp        00459C38
 00459C2C    mov        edx,dword ptr [eax]
 00459C2E    call       dword ptr [edx+0C]
>00459C31    jmp        00459C38
 00459C33    mov        edx,dword ptr [eax]
 00459C35    call       dword ptr [edx+10]
 00459C38    inc        esi
 00459C39    dec        ebx
<00459C3A    jne        00459C16
 00459C3C    pop        edi
 00459C3D    pop        esi
 00459C3E    pop        ebx
 00459C3F    pop        ecx
 00459C40    pop        ebp
 00459C41    ret
*}
//end;

//00459C44
//function sub_00459C44(?:TFormPlacement; ?:Pointer):Integer;
//begin
{*
 00459C44    push       ebp
 00459C45    mov        ebp,esp
 00459C47    xor        ecx,ecx
 00459C49    mov        dword ptr [edx+4],ecx
 00459C4C    mov        eax,dword ptr [eax+3C]; TFormPlacement.?f3C:TList
 00459C4F    call       TList.Remove
 00459C54    pop        ebp
 00459C55    ret
*}
//end;

//00459C58
//function sub_00459C58(?:TFormPlacement):?;
//begin
{*
 00459C58    push       ebp
 00459C59    mov        ebp,esp
 00459C5B    push       ebx
 00459C5C    push       esi
 00459C5D    mov        ebx,eax
 00459C5F    mov        esi,dword ptr [ebx+4]; TFormPlacement.FOwner:TComponent
 00459C62    mov        eax,esi
 00459C64    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00459C6A    call       @IsClass
 00459C6F    test       al,al
>00459C71    je         00459C82
 00459C73    mov        eax,esi
 00459C75    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00459C7B    call       @AsClass
>00459C80    jmp        00459C84
 00459C82    xor        eax,eax
 00459C84    pop        esi
 00459C85    pop        ebx
 00459C86    pop        ebp
 00459C87    ret
*}
//end;

//00459C88
//function sub_00459C88(?:TFormPlacement):TFormPlacement;
//begin
{*
 00459C88    push       ebp
 00459C89    mov        ebp,esp
 00459C8B    push       ebx
 00459C8C    mov        ebx,eax
 00459C8E    mov        eax,dword ptr [ebx+4]; TFormPlacement.FOwner:TComponent
 00459C91    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00459C97    call       @IsClass
 00459C9C    test       al,al
>00459C9E    je         00459D2B
 00459CA4    mov        eax,ebx
 00459CA6    call       00459C58
 00459CAB    mov        edx,dword ptr [eax+2B0]
 00459CB1    mov        dword ptr [ebx+58],edx; TFormPlacement.?f58:dword
 00459CB4    mov        edx,dword ptr [eax+2B4]
 00459CBA    mov        dword ptr [ebx+5C],edx; TFormPlacement.?f5C:dword
 00459CBD    mov        dword ptr [eax+2B4],ebx
 00459CC3    mov        dword ptr [eax+2B0],45A0D8; sub_0045A0D8
 00459CCD    mov        edx,dword ptr [eax+280]
 00459CD3    mov        dword ptr [ebx+68],edx; TFormPlacement.?f68:dword
 00459CD6    mov        edx,dword ptr [eax+284]
 00459CDC    mov        dword ptr [ebx+6C],edx; TFormPlacement.?f6C:dword
 00459CDF    mov        dword ptr [eax+284],ebx
 00459CE5    mov        dword ptr [eax+280],45A148; sub_0045A148
 00459CEF    mov        edx,dword ptr [eax+2C0]
 00459CF5    mov        dword ptr [ebx+60],edx; TFormPlacement.?f60:dword
 00459CF8    mov        edx,dword ptr [eax+2C4]
 00459CFE    mov        dword ptr [ebx+64],edx; TFormPlacement.?f64:dword
 00459D01    mov        dword ptr [eax+2C4],ebx
 00459D07    mov        dword ptr [eax+2C0],45A1DC; sub_0045A1DC
 00459D11    test       byte ptr [eax+210],4
 00459D18    setne      al
 00459D1B    mov        byte ptr [ebx+4C],al; TFormPlacement.?f4C:byte
 00459D1E    cmp        byte ptr [ebx+44],0; TFormPlacement.PreventResize:Boolean
>00459D22    je         00459D2B
 00459D24    mov        eax,ebx
 00459D26    call       0045A388
 00459D2B    pop        ebx
 00459D2C    pop        ebp
 00459D2D    ret
*}
//end;

//00459D30
//procedure sub_00459D30(?:TFormPlacement);
//begin
{*
 00459D30    push       ebp
 00459D31    mov        ebp,esp
 00459D33    push       ebx
 00459D34    push       esi
 00459D35    mov        ebx,eax
 00459D37    mov        esi,dword ptr [ebx+4]; TFormPlacement.FOwner:TComponent
 00459D3A    test       esi,esi
>00459D3C    je         00459D8C
 00459D3E    mov        eax,esi
 00459D40    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00459D46    call       @IsClass
 00459D4B    test       al,al
>00459D4D    je         00459D8C
 00459D4F    mov        eax,ebx
 00459D51    call       00459C58
 00459D56    mov        edx,dword ptr [ebx+58]; TFormPlacement.?f58:dword
 00459D59    mov        dword ptr [eax+2B0],edx
 00459D5F    mov        edx,dword ptr [ebx+5C]; TFormPlacement.?f5C:dword
 00459D62    mov        dword ptr [eax+2B4],edx
 00459D68    mov        edx,dword ptr [ebx+68]; TFormPlacement.?f68:dword
 00459D6B    mov        dword ptr [eax+280],edx
 00459D71    mov        edx,dword ptr [ebx+6C]; TFormPlacement.?f6C:dword
 00459D74    mov        dword ptr [eax+284],edx
 00459D7A    mov        edx,dword ptr [ebx+60]; TFormPlacement.?f60:dword
 00459D7D    mov        dword ptr [eax+2C0],edx
 00459D83    mov        edx,dword ptr [ebx+64]; TFormPlacement.?f64:dword
 00459D86    mov        dword ptr [eax+2C4],edx
 00459D8C    pop        esi
 00459D8D    pop        ebx
 00459D8E    pop        ebp
 00459D8F    ret
*}
//end;

//00459D90
//function sub_00459D90(?:TFormPlacement):dword;
//begin
{*
 00459D90    push       ebp
 00459D91    mov        ebp,esp
 00459D93    push       ebx
 00459D94    mov        ebx,eax
 00459D96    test       byte ptr [ebx+20],10; TFormPlacement.FComponentState:TComponentState
>00459D9A    jne        00459DC5
 00459D9C    cmp        dword ptr [ebx+4],0; TFormPlacement.FOwner:TComponent
>00459DA0    je         00459DC5
 00459DA2    mov        eax,dword ptr [ebx+4]; TFormPlacement.FOwner:TComponent
 00459DA5    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00459DAB    call       @IsClass
 00459DB0    test       al,al
>00459DB2    je         00459DC5
 00459DB4    mov        eax,ebx
 00459DB6    call       00459C58
 00459DBB    mov        edx,eax
 00459DBD    mov        eax,dword ptr [ebx+50]; TFormPlacement.?f50:TRxWindowHook
 00459DC0    call       TRxWindowHook.SetWinControl
 00459DC5    pop        ebx
 00459DC6    pop        ebp
 00459DC7    ret
*}
//end;

//00459DC8
//function sub_00459DC8(?:TFormPlacement):dword;
//begin
{*
 00459DC8    push       ebp
 00459DC9    mov        ebp,esp
 00459DCB    xor        edx,edx
 00459DCD    mov        eax,dword ptr [eax+50]; TFormPlacement.?f50:TRxWindowHook
 00459DD0    call       TRxWindowHook.SetWinControl
 00459DD5    pop        ebp
 00459DD6    ret
*}
//end;

//00459DD8
//function sub_00459DD8(?:TFormPlacement):dword;
//begin
{*
 00459DD8    push       ebp
 00459DD9    mov        ebp,esp
 00459DDB    push       ebx
 00459DDC    mov        ebx,eax
 00459DDE    mov        eax,ebx
 00459DE0    call       00459E04
 00459DE5    test       al,al
>00459DE7    jne        00459DEF
 00459DE9    cmp        byte ptr [ebx+44],0; TFormPlacement.PreventResize:Boolean
>00459DED    je         00459DF9
 00459DEF    mov        eax,ebx
 00459DF1    call       00459D90
 00459DF6    pop        ebx
 00459DF7    pop        ebp
 00459DF8    ret
 00459DF9    mov        eax,ebx
 00459DFB    call       00459DC8
 00459E00    pop        ebx
 00459E01    pop        ebp
 00459E02    ret
*}
//end;

//00459E04
//function sub_00459E04(?:TFormPlacement):?;
//begin
{*
 00459E04    push       ebp
 00459E05    mov        ebp,esp
 00459E07    push       ebx
 00459E08    mov        ebx,eax
 00459E0A    mov        eax,dword ptr [ebx+48]; TFormPlacement.MinMaxInfo:TWinMinMaxInfo
 00459E0D    call       0045AC7C
 00459E12    xor        al,1
 00459E14    pop        ebx
 00459E15    pop        ebp
 00459E16    ret
*}
//end;

//00459E18
//function sub_00459E18(?:TFormPlacement):dword;
//begin
{*
 00459E18    push       ebp
 00459E19    mov        ebp,esp
 00459E1B    push       ebx
 00459E1C    mov        ebx,eax
 00459E1E    mov        eax,ebx
 00459E20    call       0045A264
 00459E25    test       byte ptr [ebx+20],1; TFormPlacement.FComponentState:TComponentState
>00459E29    jne        00459E32
 00459E2B    mov        eax,ebx
 00459E2D    call       00459DD8
 00459E32    pop        ebx
 00459E33    pop        ebp
 00459E34    ret
*}
//end;

//00459E38
procedure TFormPlacement.SetMinMaxInfo(Self:TFormPlacement);
begin
{*
 00459E38    push       ebp
 00459E39    mov        ebp,esp
 00459E3B    mov        eax,dword ptr [eax+48]; TFormPlacement.MinMaxInfo:TWinMinMaxInfo
 00459E3E    mov        ecx,dword ptr [eax]
 00459E40    call       dword ptr [ecx+8]; TWinMinMaxInfo.Assign
 00459E43    pop        ebp
 00459E44    ret
*}
end;

//00459E48
//procedure sub_00459E48(?:?; ?:?; ?:?);
//begin
{*
 00459E48    push       ebp
 00459E49    mov        ebp,esp
 00459E4B    add        esp,0FFFFFFF8
 00459E4E    push       ebx
 00459E4F    push       esi
 00459E50    push       edi
 00459E51    mov        esi,ecx
 00459E53    mov        ebx,eax
 00459E55    cmp        byte ptr [ebx+44],0
>00459E59    je         00459F9B
 00459E5F    mov        eax,dword ptr [ebx+4]
 00459E62    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00459E68    call       @IsClass
 00459E6D    test       al,al
>00459E6F    je         00459F9B
 00459E75    mov        eax,dword ptr [esi]
 00459E77    sub        eax,24
>00459E7A    je         00459E95
 00459E7C    sub        eax,60
>00459E7F    je         00459F82
 00459E85    sub        eax,93
>00459E8A    je         00459F26
>00459E90    jmp        0045A0CE
 00459E95    mov        eax,ebx
 00459E97    call       00459C58
 00459E9C    call       TWinControl.HandleAllocated
 00459EA1    test       al,al
>00459EA3    je         0045A0CE
 00459EA9    mov        eax,ebx
 00459EAB    call       00459C58
 00459EB0    call       TWinControl.GetHandle
 00459EB5    push       eax
 00459EB6    call       user32.IsWindowVisible
 00459EBB    test       eax,eax
>00459EBD    je         0045A0CE
 00459EC3    mov        edi,dword ptr [esi+8]
 00459EC6    mov        eax,ebx
 00459EC8    call       00459C58
 00459ECD    mov        eax,dword ptr [eax+3C]
 00459ED0    push       eax
 00459ED1    mov        eax,ebx
 00459ED3    call       00459C58
 00459ED8    mov        eax,dword ptr [eax+38]
 00459EDB    lea        ecx,[ebp-8]
 00459EDE    pop        edx
 00459EDF    call       Point
 00459EE4    mov        eax,dword ptr [ebp-8]
 00459EE7    mov        dword ptr [edi+18],eax
 00459EEA    mov        eax,dword ptr [ebp-4]
 00459EED    mov        dword ptr [edi+1C],eax
 00459EF0    mov        eax,ebx
 00459EF2    call       00459C58
 00459EF7    mov        eax,dword ptr [eax+3C]
 00459EFA    push       eax
 00459EFB    mov        eax,ebx
 00459EFD    call       00459C58
 00459F02    mov        eax,dword ptr [eax+38]
 00459F05    lea        ecx,[ebp-8]
 00459F08    pop        edx
 00459F09    call       Point
 00459F0E    mov        eax,dword ptr [ebp-8]
 00459F11    mov        dword ptr [edi+20],eax
 00459F14    mov        eax,dword ptr [ebp-4]
 00459F17    mov        dword ptr [edi+24],eax
 00459F1A    mov        dword ptr [esi+0C],1
>00459F21    jmp        0045A0CE
 00459F26    cmp        word ptr [esi+0A],0
>00459F2B    je         0045A0CE
 00459F31    mov        eax,ebx
 00459F33    call       00459C58
 00459F38    cmp        dword ptr [eax+230],0
>00459F3F    je         00459F56
 00459F41    mov        eax,ebx
 00459F43    call       00459C58
 00459F48    mov        eax,dword ptr [eax+230]
 00459F4E    mov        edx,dword ptr [esi+4]
 00459F51    call       TMenu.DispatchPopup
 00459F56    push       1
 00459F58    push       0F000
 00459F5D    mov        eax,dword ptr [esi+4]
 00459F60    push       eax
 00459F61    call       user32.EnableMenuItem
 00459F66    push       1
 00459F68    push       0F030
 00459F6D    mov        eax,dword ptr [esi+4]
 00459F70    push       eax
 00459F71    call       user32.EnableMenuItem
 00459F76    mov        dword ptr [esi+0C],1
>00459F7D    jmp        0045A0CE
 00459F82    mov        eax,dword ptr [esi+0C]
 00459F85    add        eax,0FFFFFFF6
 00459F88    sub        eax,8
>00459F8B    jae        0045A0CE
 00459F91    xor        eax,eax
 00459F93    mov        dword ptr [esi+0C],eax
>00459F96    jmp        0045A0CE
 00459F9B    cmp        dword ptr [esi],24
>00459F9E    jne        0045A0CE
 00459FA4    mov        eax,ebx
 00459FA6    call       00459E04
 00459FAB    test       al,al
>00459FAD    je         0045A0BA
 00459FB3    mov        edi,dword ptr [esi+8]
 00459FB6    mov        edx,7
 00459FBB    mov        eax,dword ptr [ebx+48]
 00459FBE    call       TWinMinMaxInfo.GetMaxPosLeft
 00459FC3    test       eax,eax
>00459FC5    je         00459FD7
 00459FC7    mov        edx,7
 00459FCC    mov        eax,dword ptr [ebx+48]
 00459FCF    call       TWinMinMaxInfo.GetMaxPosLeft
 00459FD4    mov        dword ptr [edi+18],eax
 00459FD7    mov        edx,6
 00459FDC    mov        eax,dword ptr [ebx+48]
 00459FDF    call       TWinMinMaxInfo.GetMaxPosLeft
 00459FE4    test       eax,eax
>00459FE6    je         00459FF8
 00459FE8    mov        edx,6
 00459FED    mov        eax,dword ptr [ebx+48]
 00459FF0    call       TWinMinMaxInfo.GetMaxPosLeft
 00459FF5    mov        dword ptr [edi+1C],eax
 00459FF8    mov        edx,5
 00459FFD    mov        eax,dword ptr [ebx+48]
 0045A000    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A005    test       eax,eax
>0045A007    je         0045A019
 0045A009    mov        edx,5
 0045A00E    mov        eax,dword ptr [ebx+48]
 0045A011    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A016    mov        dword ptr [edi+20],eax
 0045A019    mov        edx,4
 0045A01E    mov        eax,dword ptr [ebx+48]
 0045A021    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A026    test       eax,eax
>0045A028    je         0045A03A
 0045A02A    mov        edx,4
 0045A02F    mov        eax,dword ptr [ebx+48]
 0045A032    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A037    mov        dword ptr [edi+24],eax
 0045A03A    mov        edx,3
 0045A03F    mov        eax,dword ptr [ebx+48]
 0045A042    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A047    test       eax,eax
>0045A049    je         0045A05B
 0045A04B    mov        edx,3
 0045A050    mov        eax,dword ptr [ebx+48]
 0045A053    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A058    mov        dword ptr [edi+8],eax
 0045A05B    mov        edx,2
 0045A060    mov        eax,dword ptr [ebx+48]
 0045A063    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A068    test       eax,eax
>0045A06A    je         0045A07C
 0045A06C    mov        edx,2
 0045A071    mov        eax,dword ptr [ebx+48]
 0045A074    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A079    mov        dword ptr [edi+0C],eax
 0045A07C    xor        edx,edx
 0045A07E    mov        eax,dword ptr [ebx+48]
 0045A081    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A086    test       eax,eax
>0045A088    je         0045A097
 0045A08A    xor        edx,edx
 0045A08C    mov        eax,dword ptr [ebx+48]
 0045A08F    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A094    mov        dword ptr [edi+10],eax
 0045A097    mov        edx,1
 0045A09C    mov        eax,dword ptr [ebx+48]
 0045A09F    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A0A4    test       eax,eax
>0045A0A6    je         0045A0C7
 0045A0A8    mov        edx,1
 0045A0AD    mov        eax,dword ptr [ebx+48]
 0045A0B0    call       TWinMinMaxInfo.GetMaxPosLeft
 0045A0B5    mov        dword ptr [edi+14],eax
>0045A0B8    jmp        0045A0C7
 0045A0BA    mov        eax,dword ptr [esi+8]
 0045A0BD    xor        edx,edx
 0045A0BF    mov        dword ptr [eax+10],edx
 0045A0C2    xor        edx,edx
 0045A0C4    mov        dword ptr [eax+14],edx
 0045A0C7    mov        dword ptr [esi+0C],1
 0045A0CE    pop        edi
 0045A0CF    pop        esi
 0045A0D0    pop        ebx
 0045A0D1    pop        ecx
 0045A0D2    pop        ecx
 0045A0D3    pop        ebp
 0045A0D4    ret        4
*}
//end;

//0045A0D8
//procedure sub_0045A0D8(?:?; ?:?);
//begin
{*
 0045A0D8    push       ebp
 0045A0D9    mov        ebp,esp
 0045A0DB    add        esp,0FFFFFFF8
 0045A0DE    push       ebx
 0045A0DF    push       esi
 0045A0E0    push       edi
 0045A0E1    mov        dword ptr [ebp-8],edx
 0045A0E4    mov        dword ptr [ebp-4],eax
 0045A0E7    mov        eax,dword ptr [ebp-4]
 0045A0EA    cmp        byte ptr [eax+24],0
>0045A0EE    je         0045A129
 0045A0F0    xor        eax,eax
 0045A0F2    push       ebp
 0045A0F3    push       45A110
 0045A0F8    push       dword ptr fs:[eax]
 0045A0FB    mov        dword ptr fs:[eax],esp
 0045A0FE    mov        eax,dword ptr [ebp-4]
 0045A101    call       0045AA18
 0045A106    xor        eax,eax
 0045A108    pop        edx
 0045A109    pop        ecx
 0045A10A    pop        ecx
 0045A10B    mov        dword ptr fs:[eax],edx
>0045A10E    jmp        0045A129
<0045A110    jmp        @HandleAnyException
 0045A115    mov        eax,[0046C05C]; ^Application:TApplication
 0045A11A    mov        eax,dword ptr [eax]
 0045A11C    mov        edx,dword ptr [ebp-4]
 0045A11F    call       TApplication.HandleException
 0045A124    call       @DoneExcept
 0045A129    mov        eax,dword ptr [ebp-4]
 0045A12C    cmp        word ptr [eax+5A],0
>0045A131    je         0045A13F
 0045A133    mov        ebx,dword ptr [ebp-4]
 0045A136    mov        edx,dword ptr [ebp-8]
 0045A139    mov        eax,dword ptr [ebx+5C]
 0045A13C    call       dword ptr [ebx+58]
 0045A13F    pop        edi
 0045A140    pop        esi
 0045A141    pop        ebx
 0045A142    pop        ecx
 0045A143    pop        ecx
 0045A144    pop        ebp
 0045A145    ret
*}
//end;

//0045A148
//procedure sub_0045A148(?:?; ?:?; ?:?);
//begin
{*
 0045A148    push       ebp
 0045A149    mov        ebp,esp
 0045A14B    push       ecx
 0045A14C    push       ebx
 0045A14D    push       esi
 0045A14E    push       edi
 0045A14F    mov        ebx,ecx
 0045A151    mov        dword ptr [ebp-4],eax
 0045A154    mov        eax,dword ptr [ebp-4]
 0045A157    cmp        word ptr [eax+6A],0
>0045A15C    je         0045A169
 0045A15E    mov        ecx,ebx
 0045A160    mov        esi,dword ptr [ebp-4]
 0045A163    mov        eax,dword ptr [esi+6C]
 0045A166    call       dword ptr [esi+68]
 0045A169    cmp        byte ptr [ebx],0
>0045A16C    je         0045A1D6
 0045A16E    mov        eax,dword ptr [ebp-4]
 0045A171    cmp        byte ptr [eax+24],0
>0045A175    je         0045A1D6
 0045A177    mov        eax,dword ptr [ebp-4]
 0045A17A    mov        eax,dword ptr [eax+4]
 0045A17D    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 0045A183    call       @IsClass
 0045A188    test       al,al
>0045A18A    je         0045A1D6
 0045A18C    mov        eax,dword ptr [ebp-4]
 0045A18F    call       00459C58
 0045A194    call       TWinControl.GetHandle
 0045A199    test       eax,eax
>0045A19B    je         0045A1D6
 0045A19D    xor        eax,eax
 0045A19F    push       ebp
 0045A1A0    push       45A1BD
 0045A1A5    push       dword ptr fs:[eax]
 0045A1A8    mov        dword ptr fs:[eax],esp
 0045A1AB    mov        eax,dword ptr [ebp-4]
 0045A1AE    call       0045A9AC
 0045A1B3    xor        eax,eax
 0045A1B5    pop        edx
 0045A1B6    pop        ecx
 0045A1B7    pop        ecx
 0045A1B8    mov        dword ptr fs:[eax],edx
>0045A1BB    jmp        0045A1D6
<0045A1BD    jmp        @HandleAnyException
 0045A1C2    mov        eax,[0046C05C]; ^Application:TApplication
 0045A1C7    mov        eax,dword ptr [eax]
 0045A1C9    mov        edx,dword ptr [ebp-4]
 0045A1CC    call       TApplication.HandleException
 0045A1D1    call       @DoneExcept
 0045A1D6    pop        edi
 0045A1D7    pop        esi
 0045A1D8    pop        ebx
 0045A1D9    pop        ecx
 0045A1DA    pop        ebp
 0045A1DB    ret
*}
//end;

//0045A1DC
//procedure sub_0045A1DC(?:?; ?:?);
//begin
{*
 0045A1DC    push       ebp
 0045A1DD    mov        ebp,esp
 0045A1DF    add        esp,0FFFFFFF8
 0045A1E2    push       ebx
 0045A1E3    push       esi
 0045A1E4    push       edi
 0045A1E5    mov        dword ptr [ebp-8],edx
 0045A1E8    mov        dword ptr [ebp-4],eax
 0045A1EB    mov        eax,dword ptr [ebp-4]
 0045A1EE    cmp        byte ptr [eax+24],0
>0045A1F2    je         0045A244
 0045A1F4    mov        eax,dword ptr [ebp-4]
 0045A1F7    cmp        byte ptr [eax+41],0
>0045A1FB    jne        0045A244
 0045A1FD    mov        eax,dword ptr [ebp-4]
 0045A200    mov        byte ptr [eax+43],1
 0045A204    xor        eax,eax
 0045A206    push       ebp
 0045A207    push       45A224
 0045A20C    push       dword ptr fs:[eax]
 0045A20F    mov        dword ptr fs:[eax],esp
 0045A212    mov        eax,dword ptr [ebp-4]
 0045A215    call       0045A9AC
 0045A21A    xor        eax,eax
 0045A21C    pop        edx
 0045A21D    pop        ecx
 0045A21E    pop        ecx
 0045A21F    mov        dword ptr fs:[eax],edx
>0045A222    jmp        0045A23D
<0045A224    jmp        @HandleAnyException
 0045A229    mov        eax,[0046C05C]; ^Application:TApplication
 0045A22E    mov        eax,dword ptr [eax]
 0045A230    mov        edx,dword ptr [ebp-4]
 0045A233    call       TApplication.HandleException
 0045A238    call       @DoneExcept
 0045A23D    mov        eax,dword ptr [ebp-4]
 0045A240    mov        byte ptr [eax+43],0
 0045A244    mov        eax,dword ptr [ebp-4]
 0045A247    cmp        word ptr [eax+62],0
>0045A24C    je         0045A25A
 0045A24E    mov        ebx,dword ptr [ebp-4]
 0045A251    mov        edx,dword ptr [ebp-8]
 0045A254    mov        eax,dword ptr [ebx+64]
 0045A257    call       dword ptr [ebx+60]
 0045A25A    pop        edi
 0045A25B    pop        esi
 0045A25C    pop        ebx
 0045A25D    pop        ecx
 0045A25E    pop        ecx
 0045A25F    pop        ebp
 0045A260    ret
*}
//end;

//0045A264
//function sub_0045A264(?:TFormPlacement):TFormPlacement;
//begin
{*
 0045A264    push       ebp
 0045A265    mov        ebp,esp
 0045A267    add        esp,0FFFFFFCC
 0045A26A    push       ebx
 0045A26B    push       esi
 0045A26C    mov        ebx,eax
 0045A26E    mov        esi,dword ptr [ebx+4]; TFormPlacement.FOwner:TComponent
 0045A271    test       esi,esi
>0045A273    je         0045A380
 0045A279    mov        eax,esi
 0045A27B    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 0045A281    call       @IsClass
 0045A286    test       al,al
>0045A288    je         0045A380
 0045A28E    mov        eax,ebx
 0045A290    call       00459C58
 0045A295    call       TWinControl.HandleAllocated
 0045A29A    test       al,al
>0045A29C    je         0045A380
 0045A2A2    test       byte ptr [ebx+20],1; TFormPlacement.FComponentState:TComponentState
>0045A2A6    jne        0045A380
 0045A2AC    cmp        byte ptr [ebx+44],0; TFormPlacement.PreventResize:Boolean
>0045A2B0    jne        0045A380
 0045A2B6    mov        eax,ebx
 0045A2B8    call       00459E04
 0045A2BD    test       al,al
>0045A2BF    jne        0045A380
 0045A2C5    mov        dword ptr [ebp-2C],2C
 0045A2CC    lea        eax,[ebp-2C]
 0045A2CF    push       eax
 0045A2D0    mov        eax,ebx
 0045A2D2    call       00459C58
 0045A2D7    call       TWinControl.GetHandle
 0045A2DC    push       eax
 0045A2DD    call       user32.GetWindowPlacement
 0045A2E2    mov        eax,ebx
 0045A2E4    call       00459C58
 0045A2E9    call       TWinControl.GetHandle
 0045A2EE    push       eax
 0045A2EF    call       user32.IsWindowVisible
 0045A2F4    test       eax,eax
>0045A2F6    jne        0045A2FD
 0045A2F8    xor        eax,eax
 0045A2FA    mov        dword ptr [ebp-24],eax
 0045A2FD    mov        eax,ebx
 0045A2FF    call       00459C58
 0045A304    cmp        byte ptr [eax+211],0
>0045A30B    je         0045A352
 0045A30D    mov        eax,ebx
 0045A30F    call       00459C58
 0045A314    movzx      eax,byte ptr [eax+211]
 0045A31B    movzx      eax,word ptr [eax*2+46AC02]
 0045A323    push       eax
 0045A324    call       user32.GetSystemMetrics
 0045A329    neg        eax
 0045A32B    mov        dword ptr [ebp-18],eax
 0045A32E    mov        eax,ebx
 0045A330    call       00459C58
 0045A335    movzx      eax,byte ptr [eax+211]
 0045A33C    movzx      eax,word ptr [eax*2+46AC02]
 0045A344    inc        eax
 0045A345    push       eax
 0045A346    call       user32.GetSystemMetrics
 0045A34B    neg        eax
 0045A34D    mov        dword ptr [ebp-14],eax
>0045A350    jmp        0045A36A
 0045A352    lea        ecx,[ebp-34]
 0045A355    xor        edx,edx
 0045A357    xor        eax,eax
 0045A359    call       Point
 0045A35E    mov        eax,dword ptr [ebp-34]
 0045A361    mov        dword ptr [ebp-18],eax
 0045A364    mov        eax,dword ptr [ebp-30]
 0045A367    mov        dword ptr [ebp-14],eax
 0045A36A    lea        eax,[ebp-2C]
 0045A36D    push       eax
 0045A36E    mov        eax,ebx
 0045A370    call       00459C58
 0045A375    call       TWinControl.GetHandle
 0045A37A    push       eax
 0045A37B    call       user32.SetWindowPlacement
 0045A380    pop        esi
 0045A381    pop        ebx
 0045A382    mov        esp,ebp
 0045A384    pop        ebp
 0045A385    ret
*}
//end;

//0045A388
//function sub_0045A388(?:TFormPlacement):TFormPlacement;
//begin
{*
 0045A388    push       ebp
 0045A389    mov        ebp,esp
 0045A38B    add        esp,0FFFFFFF8
 0045A38E    mov        dword ptr [ebp-4],eax
 0045A391    mov        eax,dword ptr [ebp-4]
 0045A394    test       byte ptr [eax+20],10; TFormPlacement.FComponentState:TComponentState
>0045A398    jne        0045A492
 0045A39E    mov        eax,dword ptr [ebp-4]
 0045A3A1    mov        eax,dword ptr [eax+4]; TFormPlacement.FOwner:TComponent
 0045A3A4    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 0045A3AA    call       @IsClass
 0045A3AF    test       al,al
>0045A3B1    je         0045A492
 0045A3B7    mov        eax,dword ptr [ebp-4]
 0045A3BA    cmp        byte ptr [eax+44],0; TFormPlacement.PreventResize:Boolean
>0045A3BE    je         0045A3D8
 0045A3C0    mov        eax,dword ptr [ebp-4]
 0045A3C3    call       00459C58
 0045A3C8    test       byte ptr [eax+210],4
 0045A3CF    setne      al
 0045A3D2    mov        edx,dword ptr [ebp-4]
 0045A3D5    mov        byte ptr [edx+4C],al; TFormPlacement.?f4C:byte
 0045A3D8    mov        eax,dword ptr [ebp-4]
 0045A3DB    mov        al,byte ptr [eax+24]; TFormPlacement.Active:Boolean
 0045A3DE    mov        byte ptr [ebp-5],al
 0045A3E1    mov        eax,dword ptr [ebp-4]
 0045A3E4    mov        byte ptr [eax+24],0; TFormPlacement.Active:Boolean
 0045A3E8    xor        eax,eax
 0045A3EA    push       ebp
 0045A3EB    push       45A47A
 0045A3F0    push       dword ptr fs:[eax]
 0045A3F3    mov        dword ptr fs:[eax],esp
 0045A3F6    mov        eax,dword ptr [ebp-4]
 0045A3F9    cmp        byte ptr [eax+44],0; TFormPlacement.PreventResize:Boolean
>0045A3FD    jne        0045A43E
 0045A3FF    mov        eax,dword ptr [ebp-4]
 0045A402    cmp        byte ptr [eax+4C],0; TFormPlacement.?f4C:byte
>0045A406    je         0045A43E
 0045A408    mov        eax,dword ptr [ebp-4]
 0045A40B    call       00459C58
 0045A410    cmp        byte ptr [eax+211],3
>0045A417    je         0045A43E
 0045A419    mov        eax,dword ptr [ebp-4]
 0045A41C    call       00459C58
 0045A421    mov        al,byte ptr [eax+210]
 0045A427    or         al,byte ptr ds:[45A498]; 0x4
 0045A42D    push       eax
 0045A42E    mov        eax,dword ptr [ebp-4]
 0045A431    call       00459C58
 0045A436    pop        edx
 0045A437    call       TCustomForm.SetBorderIcons
>0045A43C    jmp        0045A463
 0045A43E    mov        eax,dword ptr [ebp-4]
 0045A441    call       00459C58
 0045A446    mov        dl,byte ptr ds:[45A498]; 0x4
 0045A44C    not        edx
 0045A44E    and        dl,byte ptr [eax+210]
 0045A454    push       edx
 0045A455    mov        eax,dword ptr [ebp-4]
 0045A458    call       00459C58
 0045A45D    pop        edx
 0045A45E    call       TCustomForm.SetBorderIcons
 0045A463    xor        eax,eax
 0045A465    pop        edx
 0045A466    pop        ecx
 0045A467    pop        ecx
 0045A468    mov        dword ptr fs:[eax],edx
 0045A46B    push       45A481
 0045A470    mov        eax,dword ptr [ebp-4]
 0045A473    mov        dl,byte ptr [ebp-5]
 0045A476    mov        byte ptr [eax+24],dl; TFormPlacement.Active:Boolean
 0045A479    ret
<0045A47A    jmp        @HandleFinally
<0045A47F    jmp        0045A470
 0045A481    mov        eax,dword ptr [ebp-4]
 0045A484    test       byte ptr [eax+20],1; TFormPlacement.FComponentState:TComponentState
>0045A488    jne        0045A492
 0045A48A    mov        eax,dword ptr [ebp-4]
 0045A48D    call       00459DD8
 0045A492    pop        ecx
 0045A493    pop        ecx
 0045A494    pop        ebp
 0045A495    ret
*}
//end;

//0045A49C
//function TFormPlacement.SetPreventResize(Self:TFormPlacement; ?:?):TFormPlacement;
//begin
{*
 0045A49C    push       ebp
 0045A49D    mov        ebp,esp
 0045A49F    push       ebx
 0045A4A0    push       esi
 0045A4A1    mov        ebx,edx
 0045A4A3    mov        esi,eax
 0045A4A5    mov        eax,esi
 0045A4A7    call       00459C58
 0045A4AC    test       eax,eax
>0045A4AE    je         0045A4C6
 0045A4B0    cmp        bl,byte ptr [esi+44]; TFormPlacement.PreventResize:Boolean
>0045A4B3    je         0045A4C6
 0045A4B5    mov        byte ptr [esi+44],bl; TFormPlacement.PreventResize:Boolean
 0045A4B8    mov        eax,esi
 0045A4BA    call       0045A264
 0045A4BF    mov        eax,esi
 0045A4C1    call       0045A388
 0045A4C6    pop        esi
 0045A4C7    pop        ebx
 0045A4C8    pop        ebp
 0045A4C9    ret
*}
//end;

//0045A4CC
//function sub_0045A4CC(?:TFormPlacement):dword;
//begin
{*
 0045A4CC    cmp        byte ptr [eax+34],0; TFormPlacement.UseRegistry:Boolean
>0045A4D0    je         0045A4D6
 0045A4D2    mov        eax,dword ptr [eax+38]; TFormPlacement.?f38:dword
 0045A4D5    ret
 0045A4D6    mov        eax,dword ptr [eax+30]; TFormPlacement.?f30:dword
 0045A4D9    ret
*}
//end;

//0045A4DC
//procedure TFormPlacement.GetIniFileName(Self:TFormPlacement; ?:AnsiString);
//begin
{*
 0045A4DC    push       ebp
 0045A4DD    mov        ebp,esp
 0045A4DF    push       ebx
 0045A4E0    push       esi
 0045A4E1    mov        esi,edx
 0045A4E3    mov        ebx,eax
 0045A4E5    mov        eax,esi
 0045A4E7    mov        edx,dword ptr [ebx+28]; TFormPlacement.?f28:PString
 0045A4EA    mov        edx,dword ptr [edx]
 0045A4EC    call       @LStrAsg
 0045A4F1    cmp        dword ptr [esi],0
>0045A4F4    jne        0045A512
 0045A4F6    test       byte ptr [ebx+20],10; TFormPlacement.FComponentState:TComponentState
>0045A4FA    jne        0045A512
 0045A4FC    cmp        byte ptr [ebx+34],0; TFormPlacement.UseRegistry:Boolean
>0045A500    je         0045A50B
 0045A502    mov        eax,esi
 0045A504    call       0045682C
>0045A509    jmp        0045A512
 0045A50B    mov        eax,esi
 0045A50D    call       004567B4
 0045A512    pop        esi
 0045A513    pop        ebx
 0045A514    pop        ebp
 0045A515    ret
*}
//end;

//0045A518
procedure TFormPlacement.SetIniFileName(Self:TFormPlacement);
begin
{*
 0045A518    push       ebp
 0045A519    mov        ebp,esp
 0045A51B    add        eax,28; TFormPlacement.?f28:PString
 0045A51E    call       AssignStr
 0045A523    pop        ebp
 0045A524    ret
*}
end;

//0045A528
//procedure TFormPlacement.GetIniSection(Self:TFormPlacement; ?:AnsiString);
//begin
{*
 0045A528    push       ebp
 0045A529    mov        ebp,esp
 0045A52B    push       ebx
 0045A52C    push       esi
 0045A52D    mov        esi,edx
 0045A52F    mov        ebx,eax
 0045A531    mov        eax,esi
 0045A533    mov        edx,dword ptr [ebx+2C]; TFormPlacement.?f2C:PString
 0045A536    mov        edx,dword ptr [edx]
 0045A538    call       @LStrAsg
 0045A53D    cmp        dword ptr [esi],0
>0045A540    jne        0045A552
 0045A542    test       byte ptr [ebx+20],10; TFormPlacement.FComponentState:TComponentState
>0045A546    jne        0045A552
 0045A548    mov        edx,esi
 0045A54A    mov        eax,dword ptr [ebx+4]; TFormPlacement.FOwner:TComponent
 0045A54D    call       0045662C
 0045A552    pop        esi
 0045A553    pop        ebx
 0045A554    pop        ebp
 0045A555    ret
*}
//end;

//0045A558
procedure TFormPlacement.SetIniSection(Self:TFormPlacement);
begin
{*
 0045A558    push       ebp
 0045A559    mov        ebp,esp
 0045A55B    add        eax,2C; TFormPlacement.?f2C:PString
 0045A55E    call       AssignStr
 0045A563    pop        ebp
 0045A564    ret
*}
end;

//0045A568
procedure TFormPlacement.sub_0045A568;
begin
{*
 0045A568    push       ebp
 0045A569    mov        ebp,esp
 0045A56B    push       ebx
 0045A56C    cmp        word ptr [eax+72],0; TFormPlacement.?f72:word
>0045A571    je         0045A57D
 0045A573    mov        ebx,eax
 0045A575    mov        edx,eax
 0045A577    mov        eax,dword ptr [ebx+74]; TFormPlacement.?f74:dword
 0045A57A    call       dword ptr [ebx+70]; TFormPlacement.OnSavePlacement
 0045A57D    pop        ebx
 0045A57E    pop        ebp
 0045A57F    ret
*}
end;

//0045A580
procedure TFormPlacement.sub_0045A580;
begin
{*
 0045A580    push       ebp
 0045A581    mov        ebp,esp
 0045A583    push       ebx
 0045A584    cmp        word ptr [eax+7A],0; TFormPlacement.?f7A:word
>0045A589    je         0045A595
 0045A58B    mov        ebx,eax
 0045A58D    mov        edx,eax
 0045A58F    mov        eax,dword ptr [ebx+7C]; TFormPlacement.?f7C:dword
 0045A592    call       dword ptr [ebx+78]; TFormPlacement.OnRestorePlacement
 0045A595    pop        ebx
 0045A596    pop        ebp
 0045A597    ret
*}
end;

//0045A598
procedure sub_0045A598;
begin
{*
 0045A598    push       ebp
 0045A599    mov        ebp,esp
 0045A59B    xor        ecx,ecx
 0045A59D    push       ecx
 0045A59E    push       ecx
 0045A59F    push       ecx
 0045A5A0    push       ecx
 0045A5A1    push       ecx
 0045A5A2    push       ecx
 0045A5A3    push       ebx
 0045A5A4    push       esi
 0045A5A5    mov        ebx,eax
 0045A5A7    xor        eax,eax
 0045A5A9    push       ebp
 0045A5AA    push       45A6F1
 0045A5AF    push       dword ptr fs:[eax]
 0045A5B2    mov        dword ptr fs:[eax],esp
 0045A5B5    mov        eax,dword ptr [ebx+4]; TFormPlacement.FOwner:TComponent
 0045A5B8    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 0045A5BE    call       @IsClass
 0045A5C3    test       al,al
>0045A5C5    je         0045A6CD
 0045A5CB    cmp        byte ptr [ebx+34],0; TFormPlacement.UseRegistry:Boolean
>0045A5CF    je         0045A650
 0045A5D1    lea        edx,[ebp-4]
 0045A5D4    mov        eax,ebx
 0045A5D6    call       TFormPlacement.GetIniSection
 0045A5DB    mov        eax,dword ptr [ebp-4]
 0045A5DE    push       eax
 0045A5DF    mov        eax,ebx
 0045A5E1    call       00459C58
 0045A5E6    mov        edx,dword ptr [ebx+38]; TFormPlacement.?f38:dword
 0045A5E9    pop        ecx
 0045A5EA    call       00456E80
 0045A5EF    test       byte ptr [ebx+40],4; TFormPlacement.Options:TPlacementOptions
>0045A5F3    je         0045A630
 0045A5F5    mov        eax,ebx
 0045A5F7    call       00459C58
 0045A5FC    cmp        dword ptr [eax+208],0
>0045A603    je         0045A630
 0045A605    mov        eax,ebx
 0045A607    call       00459C58
 0045A60C    mov        eax,dword ptr [eax+208]
 0045A612    mov        eax,dword ptr [eax+8]
 0045A615    push       eax
 0045A616    lea        edx,[ebp-8]
 0045A619    mov        eax,ebx
 0045A61B    call       TFormPlacement.GetIniSection
 0045A620    mov        edx,dword ptr [ebp-8]
 0045A623    mov        ecx,45A708; 'ActiveControl'
 0045A628    mov        eax,dword ptr [ebx+38]; TFormPlacement.?f38:dword
 0045A62B    call       TRegIniFile.WriteString
 0045A630    mov        al,byte ptr [ebx+43]; TFormPlacement.?f43:byte
 0045A633    push       eax
 0045A634    lea        edx,[ebp-0C]
 0045A637    mov        eax,ebx
 0045A639    call       TFormPlacement.GetIniSection
 0045A63E    mov        edx,dword ptr [ebp-0C]
 0045A641    mov        ecx,45A720; 'Visible'
 0045A646    mov        eax,dword ptr [ebx+38]; TFormPlacement.?f38:dword
 0045A649    call       TRegIniFile.WriteBool
>0045A64E    jmp        0045A6CD
 0045A650    lea        edx,[ebp-10]
 0045A653    mov        eax,ebx
 0045A655    call       TFormPlacement.GetIniSection
 0045A65A    mov        eax,dword ptr [ebp-10]
 0045A65D    push       eax
 0045A65E    mov        eax,ebx
 0045A660    call       00459C58
 0045A665    mov        edx,dword ptr [ebx+30]; TFormPlacement.?f30:dword
 0045A668    pop        ecx
 0045A669    call       00456E8C
 0045A66E    test       byte ptr [ebx+40],4; TFormPlacement.Options:TPlacementOptions
>0045A672    je         0045A6AF
 0045A674    mov        eax,ebx
 0045A676    call       00459C58
 0045A67B    cmp        dword ptr [eax+208],0
>0045A682    je         0045A6AF
 0045A684    mov        eax,ebx
 0045A686    call       00459C58
 0045A68B    mov        eax,dword ptr [eax+208]
 0045A691    mov        eax,dword ptr [eax+8]
 0045A694    push       eax
 0045A695    lea        edx,[ebp-14]
 0045A698    mov        eax,ebx
 0045A69A    call       TFormPlacement.GetIniSection
 0045A69F    mov        edx,dword ptr [ebp-14]
 0045A6A2    mov        ecx,45A708; 'ActiveControl'
 0045A6A7    mov        eax,dword ptr [ebx+30]; TFormPlacement.?f30:dword
 0045A6AA    mov        esi,dword ptr [eax]
 0045A6AC    call       dword ptr [esi+4]
 0045A6AF    mov        al,byte ptr [ebx+43]; TFormPlacement.?f43:byte
 0045A6B2    push       eax
 0045A6B3    lea        edx,[ebp-18]
 0045A6B6    mov        eax,ebx
 0045A6B8    call       TFormPlacement.GetIniSection
 0045A6BD    mov        edx,dword ptr [ebp-18]
 0045A6C0    mov        ecx,45A720; 'Visible'
 0045A6C5    mov        eax,dword ptr [ebx+30]; TFormPlacement.?f30:dword
 0045A6C8    mov        esi,dword ptr [eax]
 0045A6CA    call       dword ptr [esi+14]
 0045A6CD    xor        edx,edx
 0045A6CF    mov        eax,ebx
 0045A6D1    call       00459BFC
 0045A6D6    xor        eax,eax
 0045A6D8    pop        edx
 0045A6D9    pop        ecx
 0045A6DA    pop        ecx
 0045A6DB    mov        dword ptr fs:[eax],edx
 0045A6DE    push       45A6F8
 0045A6E3    lea        eax,[ebp-18]
 0045A6E6    mov        edx,6
 0045A6EB    call       @LStrArrayClr
 0045A6F0    ret
<0045A6F1    jmp        @HandleFinally
<0045A6F6    jmp        0045A6E3
 0045A6F8    pop        esi
 0045A6F9    pop        ebx
 0045A6FA    mov        esp,ebp
 0045A6FC    pop        ebp
 0045A6FD    ret
*}
end;

//0045A728
procedure sub_0045A728;
begin
{*
 0045A728    push       ebp
 0045A729    mov        ebp,esp
 0045A72B    push       0
 0045A72D    push       0
 0045A72F    push       ebx
 0045A730    mov        ebx,eax
 0045A732    xor        eax,eax
 0045A734    push       ebp
 0045A735    push       45A7DD
 0045A73A    push       dword ptr fs:[eax]
 0045A73D    mov        dword ptr fs:[eax],esp
 0045A740    mov        eax,dword ptr [ebx+4]; TFormPlacement.FOwner:TComponent
 0045A743    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 0045A749    call       @IsClass
 0045A74E    test       al,al
>0045A750    je         0045A7B6
 0045A752    cmp        byte ptr [ebx+34],0; TFormPlacement.UseRegistry:Boolean
>0045A756    je         0045A788
 0045A758    test       byte ptr [ebx+40],1; TFormPlacement.Options:TPlacementOptions
 0045A75C    setne      al
 0045A75F    push       eax
 0045A760    test       byte ptr [ebx+40],2; TFormPlacement.Options:TPlacementOptions
 0045A764    setne      al
 0045A767    push       eax
 0045A768    lea        edx,[ebp-4]
 0045A76B    mov        eax,ebx
 0045A76D    call       TFormPlacement.GetIniSection
 0045A772    mov        eax,dword ptr [ebp-4]
 0045A775    push       eax
 0045A776    mov        eax,ebx
 0045A778    call       00459C58
 0045A77D    mov        edx,dword ptr [ebx+38]; TFormPlacement.?f38:dword
 0045A780    pop        ecx
 0045A781    call       00457328
>0045A786    jmp        0045A7B6
 0045A788    test       byte ptr [ebx+40],1; TFormPlacement.Options:TPlacementOptions
 0045A78C    setne      al
 0045A78F    push       eax
 0045A790    test       byte ptr [ebx+40],2; TFormPlacement.Options:TPlacementOptions
 0045A794    setne      al
 0045A797    push       eax
 0045A798    lea        edx,[ebp-8]
 0045A79B    mov        eax,ebx
 0045A79D    call       TFormPlacement.GetIniSection
 0045A7A2    mov        eax,dword ptr [ebp-8]
 0045A7A5    push       eax
 0045A7A6    mov        eax,ebx
 0045A7A8    call       00459C58
 0045A7AD    mov        edx,dword ptr [ebx+30]; TFormPlacement.?f30:dword
 0045A7B0    pop        ecx
 0045A7B1    call       00457340
 0045A7B6    mov        edx,1
 0045A7BB    mov        eax,ebx
 0045A7BD    call       00459BFC
 0045A7C2    xor        eax,eax
 0045A7C4    pop        edx
 0045A7C5    pop        ecx
 0045A7C6    pop        ecx
 0045A7C7    mov        dword ptr fs:[eax],edx
 0045A7CA    push       45A7E4
 0045A7CF    lea        eax,[ebp-8]
 0045A7D2    mov        edx,2
 0045A7D7    call       @LStrArrayClr
 0045A7DC    ret
<0045A7DD    jmp        @HandleFinally
<0045A7E2    jmp        0045A7CF
 0045A7E4    pop        ebx
 0045A7E5    pop        ecx
 0045A7E6    pop        ecx
 0045A7E7    pop        ebp
 0045A7E8    ret
*}
end;

//0045A7EC
//procedure sub_0045A7EC(?:?);
//begin
{*
 0045A7EC    push       ebp
 0045A7ED    mov        ebp,esp
 0045A7EF    push       0
 0045A7F1    push       0
 0045A7F3    push       ebx
 0045A7F4    mov        ebx,eax
 0045A7F6    xor        eax,eax
 0045A7F8    push       ebp
 0045A7F9    push       45A86A
 0045A7FE    push       dword ptr fs:[eax]
 0045A801    mov        dword ptr fs:[eax],esp
 0045A804    mov        eax,ebx
 0045A806    call       0045A4CC
 0045A80B    test       eax,eax
>0045A80D    jne        0045A84F
 0045A80F    cmp        byte ptr [ebx+34],0
>0045A813    je         0045A833
 0045A815    lea        edx,[ebp-4]
 0045A818    mov        eax,ebx
 0045A81A    call       TFormPlacement.GetIniFileName
 0045A81F    mov        ecx,dword ptr [ebp-4]
 0045A822    mov        dl,1
 0045A824    mov        eax,[0044E70C]; TRegIniFile
 0045A829    call       TRegIniFile.Create; TRegIniFile.Create
 0045A82E    mov        dword ptr [ebx+38],eax
>0045A831    jmp        0045A84F
 0045A833    lea        edx,[ebp-8]
 0045A836    mov        eax,ebx
 0045A838    call       TFormPlacement.GetIniFileName
 0045A83D    mov        ecx,dword ptr [ebp-8]
 0045A840    mov        dl,1
 0045A842    mov        eax,[0044DA94]; TIniFile
 0045A847    call       TCustomIniFile.Create; TIniFile.Create
 0045A84C    mov        dword ptr [ebx+30],eax
 0045A84F    xor        eax,eax
 0045A851    pop        edx
 0045A852    pop        ecx
 0045A853    pop        ecx
 0045A854    mov        dword ptr fs:[eax],edx
 0045A857    push       45A871
 0045A85C    lea        eax,[ebp-8]
 0045A85F    mov        edx,2
 0045A864    call       @LStrArrayClr
 0045A869    ret
<0045A86A    jmp        @HandleFinally
<0045A86F    jmp        0045A85C
 0045A871    pop        ebx
 0045A872    pop        ecx
 0045A873    pop        ecx
 0045A874    pop        ebp
 0045A875    ret
*}
//end;

//0045A878
//procedure sub_0045A878(?:TFormPlacement);
//begin
{*
 0045A878    push       ebp
 0045A879    mov        ebp,esp
 0045A87B    push       ebx
 0045A87C    mov        ebx,eax
 0045A87E    mov        eax,ebx
 0045A880    call       0045A4CC
 0045A885    test       eax,eax
>0045A887    je         0045A89F
 0045A889    mov        eax,ebx
 0045A88B    call       0045A4CC
 0045A890    call       TObject.Free
 0045A895    xor        eax,eax
 0045A897    mov        dword ptr [ebx+30],eax; TFormPlacement.?f30:dword
 0045A89A    xor        eax,eax
 0045A89C    mov        dword ptr [ebx+38],eax; TFormPlacement.?f38:dword
 0045A89F    pop        ebx
 0045A8A0    pop        ebp
 0045A8A1    ret
*}
//end;

//0045A8A4
//procedure sub_0045A8A4(?:?; ?:?; ?:?; ?:?; ?:?);
//begin
{*
 0045A8A4    push       ebp
 0045A8A5    mov        ebp,esp
 0045A8A7    push       ecx
 0045A8A8    push       ebx
 0045A8A9    push       esi
 0045A8AA    push       edi
 0045A8AB    mov        esi,ecx
 0045A8AD    mov        ebx,edx
 0045A8AF    mov        dword ptr [ebp-4],eax
 0045A8B2    mov        edi,dword ptr [ebp+0C]
 0045A8B5    mov        eax,dword ptr [ebp-4]
 0045A8B8    call       0045A4CC
 0045A8BD    test       eax,eax
>0045A8BF    je         0045A8D9
 0045A8C1    push       edi
 0045A8C2    mov        eax,dword ptr [ebp+8]
 0045A8C5    push       eax
 0045A8C6    mov        eax,dword ptr [ebp-4]
 0045A8C9    call       0045A4CC
 0045A8CE    mov        ecx,esi
 0045A8D0    mov        edx,ebx
 0045A8D2    call       00456914
>0045A8D7    jmp        0045A922
 0045A8D9    mov        eax,dword ptr [ebp-4]
 0045A8DC    call       0045A7EC
 0045A8E1    xor        eax,eax
 0045A8E3    push       ebp
 0045A8E4    push       45A91B
 0045A8E9    push       dword ptr fs:[eax]
 0045A8EC    mov        dword ptr fs:[eax],esp
 0045A8EF    push       edi
 0045A8F0    mov        eax,dword ptr [ebp+8]
 0045A8F3    push       eax
 0045A8F4    mov        eax,dword ptr [ebp-4]
 0045A8F7    call       0045A4CC
 0045A8FC    mov        ecx,esi
 0045A8FE    mov        edx,ebx
 0045A900    call       00456914
 0045A905    xor        eax,eax
 0045A907    pop        edx
 0045A908    pop        ecx
 0045A909    pop        ecx
 0045A90A    mov        dword ptr fs:[eax],edx
 0045A90D    push       45A922
 0045A912    mov        eax,dword ptr [ebp-4]
 0045A915    call       0045A878
 0045A91A    ret
<0045A91B    jmp        @HandleFinally
<0045A920    jmp        0045A912
 0045A922    pop        edi
 0045A923    pop        esi
 0045A924    pop        ebx
 0045A925    pop        ecx
 0045A926    pop        ebp
 0045A927    ret        8
*}
//end;

//0045A92C
//procedure sub_0045A92C(?:?; ?:?; ?:?; ?:?);
//begin
{*
 0045A92C    push       ebp
 0045A92D    mov        ebp,esp
 0045A92F    push       ecx
 0045A930    push       ebx
 0045A931    push       esi
 0045A932    push       edi
 0045A933    mov        esi,ecx
 0045A935    mov        ebx,edx
 0045A937    mov        dword ptr [ebp-4],eax
 0045A93A    mov        edi,dword ptr [ebp+8]
 0045A93D    mov        eax,dword ptr [ebp-4]
 0045A940    call       0045A4CC
 0045A945    test       eax,eax
>0045A947    je         0045A95D
 0045A949    push       edi
 0045A94A    mov        eax,dword ptr [ebp-4]
 0045A94D    call       0045A4CC
 0045A952    mov        ecx,esi
 0045A954    mov        edx,ebx
 0045A956    call       00456984
>0045A95B    jmp        0045A9A2
 0045A95D    mov        eax,dword ptr [ebp-4]
 0045A960    call       0045A7EC
 0045A965    xor        eax,eax
 0045A967    push       ebp
 0045A968    push       45A99B
 0045A96D    push       dword ptr fs:[eax]
 0045A970    mov        dword ptr fs:[eax],esp
 0045A973    push       edi
 0045A974    mov        eax,dword ptr [ebp-4]
 0045A977    call       0045A4CC
 0045A97C    mov        ecx,esi
 0045A97E    mov        edx,ebx
 0045A980    call       00456984
 0045A985    xor        eax,eax
 0045A987    pop        edx
 0045A988    pop        ecx
 0045A989    pop        ecx
 0045A98A    mov        dword ptr fs:[eax],edx
 0045A98D    push       45A9A2
 0045A992    mov        eax,dword ptr [ebp-4]
 0045A995    call       0045A878
 0045A99A    ret
<0045A99B    jmp        @HandleFinally
<0045A9A0    jmp        0045A992
 0045A9A2    pop        edi
 0045A9A3    pop        esi
 0045A9A4    pop        ebx
 0045A9A5    pop        ecx
 0045A9A6    pop        ebp
 0045A9A7    ret        4
*}
//end;

//0045A9AC
//procedure sub_0045A9AC(?:?);
//begin
{*
 0045A9AC    push       ebp
 0045A9AD    mov        ebp,esp
 0045A9AF    push       ecx
 0045A9B0    push       ebx
 0045A9B1    mov        dword ptr [ebp-4],eax
 0045A9B4    mov        eax,dword ptr [ebp-4]
 0045A9B7    cmp        byte ptr [eax+42],0
>0045A9BB    jne        0045A9C6
 0045A9BD    mov        eax,dword ptr [ebp-4]
 0045A9C0    cmp        byte ptr [eax+24],0
>0045A9C4    jne        0045AA14
 0045A9C6    mov        eax,dword ptr [ebp-4]
 0045A9C9    call       0045A7EC
 0045A9CE    xor        eax,eax
 0045A9D0    push       ebp
 0045A9D1    push       45AA0D
 0045A9D6    push       dword ptr fs:[eax]
 0045A9D9    mov        dword ptr fs:[eax],esp
 0045A9DC    mov        eax,dword ptr [ebp-4]
 0045A9DF    mov        edx,dword ptr [eax]
 0045A9E1    call       dword ptr [edx+30]
 0045A9E4    mov        eax,dword ptr [ebp-4]
 0045A9E7    mov        bx,0FFF0
 0045A9EB    call       @CallDynaInst
 0045A9F0    mov        eax,dword ptr [ebp-4]
 0045A9F3    mov        byte ptr [eax+41],1
 0045A9F7    xor        eax,eax
 0045A9F9    pop        edx
 0045A9FA    pop        ecx
 0045A9FB    pop        ecx
 0045A9FC    mov        dword ptr fs:[eax],edx
 0045A9FF    push       45AA14
 0045AA04    mov        eax,dword ptr [ebp-4]
 0045AA07    call       0045A878
 0045AA0C    ret
<0045AA0D    jmp        @HandleFinally
<0045AA12    jmp        0045AA04
 0045AA14    pop        ebx
 0045AA15    pop        ecx
 0045AA16    pop        ebp
 0045AA17    ret
*}
//end;

//0045AA18
//procedure sub_0045AA18(?:?);
//begin
{*
 0045AA18    push       ebp
 0045AA19    mov        ebp,esp
 0045AA1B    push       0
 0045AA1D    push       0
 0045AA1F    push       0
 0045AA21    push       ebx
 0045AA22    push       esi
 0045AA23    mov        dword ptr [ebp-4],eax
 0045AA26    xor        eax,eax
 0045AA28    push       ebp
 0045AA29    push       45AB3D
 0045AA2E    push       dword ptr fs:[eax]
 0045AA31    mov        dword ptr fs:[eax],esp
 0045AA34    mov        eax,dword ptr [ebp-4]
 0045AA37    mov        byte ptr [eax+41],0
 0045AA3B    mov        eax,dword ptr [ebp-4]
 0045AA3E    call       0045A7EC
 0045AA43    xor        eax,eax
 0045AA45    push       ebp
 0045AA46    push       45AB13
 0045AA4B    push       dword ptr fs:[eax]
 0045AA4E    mov        dword ptr fs:[eax],esp
 0045AA51    mov        eax,dword ptr [ebp-4]
 0045AA54    mov        edx,dword ptr [eax]
 0045AA56    call       dword ptr [edx+34]
 0045AA59    mov        eax,dword ptr [ebp-4]
 0045AA5C    mov        byte ptr [eax+42],1
 0045AA60    mov        eax,dword ptr [ebp-4]
 0045AA63    mov        bx,0FFEF
 0045AA67    call       @CallDynaInst
 0045AA6C    mov        eax,dword ptr [ebp-4]
 0045AA6F    test       byte ptr [eax+40],4
>0045AA73    je         0045AAFD
 0045AA79    mov        eax,dword ptr [ebp-4]
 0045AA7C    mov        eax,dword ptr [eax+4]
 0045AA7F    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 0045AA85    call       @IsClass
 0045AA8A    test       al,al
>0045AA8C    je         0045AAFD
 0045AA8E    push       0
 0045AA90    lea        eax,[ebp-8]
 0045AA93    push       eax
 0045AA94    lea        edx,[ebp-0C]
 0045AA97    mov        eax,dword ptr [ebp-4]
 0045AA9A    call       TFormPlacement.GetIniSection
 0045AA9F    mov        eax,dword ptr [ebp-0C]
 0045AAA2    push       eax
 0045AAA3    mov        eax,dword ptr [ebp-4]
 0045AAA6    call       0045A4CC
 0045AAAB    mov        ecx,45AB54; 'ActiveControl'
 0045AAB0    pop        edx
 0045AAB1    call       00456914
 0045AAB6    mov        eax,dword ptr [ebp-8]
 0045AAB9    push       eax
 0045AABA    mov        eax,dword ptr [ebp-4]
 0045AABD    call       00459C58
 0045AAC2    pop        edx
 0045AAC3    call       TComponent.FindComponent
 0045AAC8    mov        esi,eax
 0045AACA    test       esi,esi
>0045AACC    je         0045AAFD
 0045AACE    mov        eax,esi
 0045AAD0    mov        edx,dword ptr ds:[4275C4]; TWinControl
 0045AAD6    call       @IsClass
 0045AADB    test       al,al
>0045AADD    je         0045AAFD
 0045AADF    mov        eax,esi
 0045AAE1    mov        bx,0FFBC
 0045AAE5    call       @CallDynaInst
 0045AAEA    test       al,al
>0045AAEC    je         0045AAFD
 0045AAEE    mov        eax,dword ptr [ebp-4]
 0045AAF1    call       00459C58
 0045AAF6    mov        edx,esi
 0045AAF8    call       TCustomForm.SetActiveControl
 0045AAFD    xor        eax,eax
 0045AAFF    pop        edx
 0045AB00    pop        ecx
 0045AB01    pop        ecx
 0045AB02    mov        dword ptr fs:[eax],edx
 0045AB05    push       45AB1A
 0045AB0A    mov        eax,dword ptr [ebp-4]
 0045AB0D    call       0045A878
 0045AB12    ret
<0045AB13    jmp        @HandleFinally
<0045AB18    jmp        0045AB0A
 0045AB1A    mov        eax,dword ptr [ebp-4]
 0045AB1D    call       0045A264
 0045AB22    xor        eax,eax
 0045AB24    pop        edx
 0045AB25    pop        ecx
 0045AB26    pop        ecx
 0045AB27    mov        dword ptr fs:[eax],edx
 0045AB2A    push       45AB44
 0045AB2F    lea        eax,[ebp-0C]
 0045AB32    mov        edx,2
 0045AB37    call       @LStrArrayClr
 0045AB3C    ret
<0045AB3D    jmp        @HandleFinally
<0045AB42    jmp        0045AB2F
 0045AB44    pop        esi
 0045AB45    pop        ebx
 0045AB46    mov        esp,ebp
 0045AB48    pop        ebp
 0045AB49    ret
*}
//end;

//0045AB64
procedure TWinMinMaxInfo.Assign(Source:TPersistent);
begin
{*
 0045AB64    push       ebp
 0045AB65    mov        ebp,esp
 0045AB67    push       ebx
 0045AB68    push       esi
 0045AB69    push       edi
 0045AB6A    mov        esi,edx
 0045AB6C    mov        ebx,eax
 0045AB6E    mov        eax,esi
 0045AB70    mov        edx,dword ptr ds:[4595A8]; TWinMinMaxInfo
 0045AB76    call       @IsClass
 0045AB7B    test       al,al
>0045AB7D    je         0045AB9A
 0045AB7F    add        esi,8
 0045AB82    lea        edi,[ebx+8]; TWinMinMaxInfo.?f8:?
 0045AB85    mov        ecx,0A
 0045AB8A    rep movs   dword ptr [edi],dword ptr [esi]
 0045AB8C    mov        eax,dword ptr [ebx+4]; TWinMinMaxInfo.?f4:TFormPlacement
 0045AB8F    test       eax,eax
>0045AB91    je         0045ABA3
 0045AB93    call       00459E18
>0045AB98    jmp        0045ABA3
 0045AB9A    mov        edx,esi
 0045AB9C    mov        eax,ebx
 0045AB9E    call       TPersistent.Assign
 0045ABA3    pop        edi
 0045ABA4    pop        esi
 0045ABA5    pop        ebx
 0045ABA6    pop        ebp
 0045ABA7    ret
*}
end;

//0045ABA8
//function TWinMinMaxInfo.GetMaxPosLeft(Self:TWinMinMaxInfo; ?:?):?;
//begin
{*
 0045ABA8    add        eax,8; TWinMinMaxInfo.?f8:?
 0045ABAB    cmp        edx,7
>0045ABAE    ja         0045ABF7
 0045ABB0    jmp        dword ptr [edx*4+45ABB7]
 0045ABB0    dd         45ABD7
 0045ABB0    dd         45ABDB
 0045ABB0    dd         45ABDF
 0045ABB0    dd         45ABE3
 0045ABB0    dd         45ABE7
 0045ABB0    dd         45ABEB
 0045ABB0    dd         45ABEF
 0045ABB0    dd         45ABF3
 0045ABD7    mov        eax,dword ptr [eax+10]
 0045ABDA    ret
 0045ABDB    mov        eax,dword ptr [eax+14]
 0045ABDE    ret
 0045ABDF    mov        eax,dword ptr [eax+0C]
 0045ABE2    ret
 0045ABE3    mov        eax,dword ptr [eax+8]
 0045ABE6    ret
 0045ABE7    mov        eax,dword ptr [eax+24]
 0045ABEA    ret
 0045ABEB    mov        eax,dword ptr [eax+20]
 0045ABEE    ret
 0045ABEF    mov        eax,dword ptr [eax+1C]
 0045ABF2    ret
 0045ABF3    mov        eax,dword ptr [eax+18]
 0045ABF6    ret
 0045ABF7    xor        eax,eax
 0045ABF9    ret
*}
//end;

//0045ABFC
//function TWinMinMaxInfo.SetMaxPosLeft(Self:TWinMinMaxInfo; ?:?; ?:?):dword;
//begin
{*
 0045ABFC    push       ebp
 0045ABFD    mov        ebp,esp
 0045ABFF    push       ebx
 0045AC00    push       esi
 0045AC01    push       edi
 0045AC02    mov        edi,ecx
 0045AC04    mov        esi,edx
 0045AC06    mov        ebx,eax
 0045AC08    mov        edx,esi
 0045AC0A    mov        eax,ebx
 0045AC0C    call       TWinMinMaxInfo.GetMaxPosLeft
 0045AC11    cmp        edi,eax
>0045AC13    je         0045AC76
 0045AC15    lea        eax,[ebx+8]; TWinMinMaxInfo.?f8:?
 0045AC18    cmp        esi,7
>0045AC1B    ja         0045AC6A
 0045AC1D    jmp        dword ptr [esi*4+45AC24]
 0045AC1D    dd         45AC44
 0045AC1D    dd         45AC49
 0045AC1D    dd         45AC4E
 0045AC1D    dd         45AC53
 0045AC1D    dd         45AC58
 0045AC1D    dd         45AC5D
 0045AC1D    dd         45AC62
 0045AC1D    dd         45AC67
 0045AC44    mov        dword ptr [eax+10],edi
>0045AC47    jmp        0045AC6A
 0045AC49    mov        dword ptr [eax+14],edi
>0045AC4C    jmp        0045AC6A
 0045AC4E    mov        dword ptr [eax+0C],edi
>0045AC51    jmp        0045AC6A
 0045AC53    mov        dword ptr [eax+8],edi
>0045AC56    jmp        0045AC6A
 0045AC58    mov        dword ptr [eax+24],edi
>0045AC5B    jmp        0045AC6A
 0045AC5D    mov        dword ptr [eax+20],edi
>0045AC60    jmp        0045AC6A
 0045AC62    mov        dword ptr [eax+1C],edi
>0045AC65    jmp        0045AC6A
 0045AC67    mov        dword ptr [eax+18],edi
 0045AC6A    mov        eax,dword ptr [ebx+4]; TWinMinMaxInfo.?f4:TFormPlacement
 0045AC6D    test       eax,eax
>0045AC6F    je         0045AC76
 0045AC71    call       00459E18
 0045AC76    pop        edi
 0045AC77    pop        esi
 0045AC78    pop        ebx
 0045AC79    pop        ebp
 0045AC7A    ret
*}
//end;

//0045AC7C
//function sub_0045AC7C(?:TWinMinMaxInfo):?;
//begin
{*
 0045AC7C    add        eax,8; TWinMinMaxInfo.?f8:?
 0045AC7F    cmp        dword ptr [eax+18],0
>0045AC83    jne        0045ACAF
 0045AC85    cmp        dword ptr [eax+1C],0
>0045AC89    jne        0045ACAF
 0045AC8B    cmp        dword ptr [eax+20],0
>0045AC8F    jne        0045ACAF
 0045AC91    cmp        dword ptr [eax+24],0
>0045AC95    jne        0045ACAF
 0045AC97    cmp        dword ptr [eax+8],0
>0045AC9B    jne        0045ACAF
 0045AC9D    cmp        dword ptr [eax+0C],0
>0045ACA1    jne        0045ACAF
 0045ACA3    cmp        dword ptr [eax+10],0
>0045ACA7    jne        0045ACAF
 0045ACA9    cmp        dword ptr [eax+14],0
>0045ACAD    je         0045ACB2
 0045ACAF    xor        eax,eax
 0045ACB1    ret
 0045ACB2    mov        al,1
 0045ACB4    ret
*}
//end;

//0045ACB8
constructor TFormStorage.Create(AOwner:TComponent);
begin
{*
 0045ACB8    push       ebp
 0045ACB9    mov        ebp,esp
 0045ACBB    push       ebx
 0045ACBC    push       esi
 0045ACBD    test       dl,dl
>0045ACBF    je         0045ACC9
 0045ACC1    add        esp,0FFFFFFF0
 0045ACC4    call       @ClassCreate
 0045ACC9    mov        ebx,edx
 0045ACCB    mov        esi,eax
 0045ACCD    xor        edx,edx
 0045ACCF    mov        eax,esi
 0045ACD1    call       TFormPlacement.Create
 0045ACD6    mov        dl,1
 0045ACD8    mov        eax,[0040F078]; TStringList
 0045ACDD    call       TObject.Create; TStringList.Create
 0045ACE2    mov        dword ptr [esi+80],eax; TFormStorage.StoredProps:TStrings
 0045ACE8    mov        eax,esi
 0045ACEA    test       bl,bl
>0045ACEC    je         0045ACFD
 0045ACEE    call       @AfterConstruction
 0045ACF3    pop        dword ptr fs:[0]
 0045ACFA    add        esp,0C
 0045ACFD    mov        eax,esi
 0045ACFF    pop        esi
 0045AD00    pop        ebx
 0045AD01    pop        ebp
 0045AD02    ret
*}
end;

//0045AD04
destructor TFormStorage.Destroy;
begin
{*
 0045AD04    push       ebp
 0045AD05    mov        ebp,esp
 0045AD07    push       ebx
 0045AD08    push       esi
 0045AD09    call       @BeforeDestruction
 0045AD0E    mov        ebx,edx
 0045AD10    mov        esi,eax
 0045AD12    mov        eax,dword ptr [esi+80]; TFormStorage.StoredProps:TStrings
 0045AD18    call       TObject.Free
 0045AD1D    xor        eax,eax
 0045AD1F    mov        dword ptr [esi+80],eax; TFormStorage.StoredProps:TStrings
 0045AD25    mov        edx,ebx
 0045AD27    and        dl,0FC
 0045AD2A    mov        eax,esi
 0045AD2C    call       TFormPlacement.Destroy
 0045AD31    test       bl,bl
>0045AD33    jle        0045AD3C
 0045AD35    mov        eax,esi
 0045AD37    call       @ClassDestroy
 0045AD3C    pop        esi
 0045AD3D    pop        ebx
 0045AD3E    pop        ebp
 0045AD3F    ret
*}
end;

//0045AD40
//procedure sub_0045AD40(?:TFormStorage);
//begin
{*
 0045AD40    push       ebp
 0045AD41    mov        ebp,esp
 0045AD43    push       ebx
 0045AD44    push       esi
 0045AD45    mov        esi,eax
 0045AD47    mov        eax,dword ptr [esi+80]; TFormStorage.StoredProps:TStrings
 0045AD4D    mov        edx,dword ptr [eax]
 0045AD4F    call       dword ptr [edx+14]; TStrings.GetCount
 0045AD52    mov        ebx,eax
 0045AD54    dec        ebx
 0045AD55    cmp        ebx,0
>0045AD58    jl         0045AD78
 0045AD5A    mov        eax,dword ptr [esi+80]; TFormStorage.StoredProps:TStrings
 0045AD60    mov        edx,ebx
 0045AD62    mov        ecx,dword ptr [eax]
 0045AD64    call       dword ptr [ecx+18]; TStrings.GetObject
 0045AD67    test       eax,eax
>0045AD69    je         0045AD72
 0045AD6B    mov        edx,esi
 0045AD6D    call       TComponent.FreeNotification
 0045AD72    dec        ebx
 0045AD73    cmp        ebx,0FFFFFFFF
<0045AD76    jne        0045AD5A
 0045AD78    pop        esi
 0045AD79    pop        ebx
 0045AD7A    pop        ebp
 0045AD7B    ret
*}
//end;

//0045AD7C
procedure TFormStorage.SetStoredProps(Self:TFormStorage);
begin
{*
 0045AD7C    push       ebp
 0045AD7D    mov        ebp,esp
 0045AD7F    push       esi
 0045AD80    mov        esi,eax
 0045AD82    mov        eax,dword ptr [esi+80]; TFormStorage.StoredProps:TStrings
 0045AD88    mov        ecx,dword ptr [eax]
 0045AD8A    call       dword ptr [ecx+8]; TStrings.Assign
 0045AD8D    mov        eax,esi
 0045AD8F    call       0045AD40
 0045AD94    pop        esi
 0045AD95    pop        ebp
 0045AD96    ret
*}
end;

//0045AD98
procedure TFormStorage.Loaded;
begin
{*
 0045AD98    push       ebp
 0045AD99    mov        ebp,esp
 0045AD9B    push       ebx
 0045AD9C    mov        ebx,eax
 0045AD9E    mov        eax,ebx
 0045ADA0    call       TFormPlacement.Loaded
 0045ADA5    mov        cl,1
 0045ADA7    mov        edx,dword ptr [ebx+80]; TFormStorage.StoredProps:TStrings
 0045ADAD    mov        eax,dword ptr [ebx+4]; TFormStorage.FOwner:TComponent
 0045ADB0    call       00457770
 0045ADB5    pop        ebx
 0045ADB6    pop        ebp
 0045ADB7    ret
*}
end;

//0045ADB8
procedure TFormStorage.WriteState(Writer:TWriter);
begin
{*
 0045ADB8    push       ebp
 0045ADB9    mov        ebp,esp
 0045ADBB    push       ebx
 0045ADBC    push       esi
 0045ADBD    mov        esi,edx
 0045ADBF    mov        ebx,eax
 0045ADC1    xor        ecx,ecx
 0045ADC3    mov        edx,dword ptr [ebx+80]; TFormStorage.StoredProps:TStrings
 0045ADC9    mov        eax,dword ptr [ebx+4]; TFormStorage.FOwner:TComponent
 0045ADCC    call       00457770
 0045ADD1    mov        edx,esi
 0045ADD3    mov        eax,ebx
 0045ADD5    call       TComponent.WriteState
 0045ADDA    pop        esi
 0045ADDB    pop        ebx
 0045ADDC    pop        ebp
 0045ADDD    ret
*}
end;

//0045ADE0
procedure TFormStorage.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0045ADE0    push       ebp
 0045ADE1    mov        ebp,esp
 0045ADE3    push       ecx
 0045ADE4    push       ebx
 0045ADE5    push       esi
 0045ADE6    mov        ebx,ecx
 0045ADE8    mov        dword ptr [ebp-4],edx
 0045ADEB    mov        esi,eax
 0045ADED    mov        ecx,ebx
 0045ADEF    mov        edx,dword ptr [ebp-4]
 0045ADF2    mov        eax,esi
 0045ADF4    call       TComponent.Notification
 0045ADF9    test       byte ptr [esi+20],8; TFormStorage.FComponentState:TComponentState
>0045ADFD    jne        0045AE45
 0045ADFF    cmp        bl,1
>0045AE02    jne        0045AE45
 0045AE04    cmp        dword ptr [esi+80],0; TFormStorage.StoredProps:TStrings
>0045AE0B    je         0045AE45
 0045AE0D    mov        eax,dword ptr [esi+80]; TFormStorage.StoredProps:TStrings
 0045AE13    mov        edx,dword ptr [eax]
 0045AE15    call       dword ptr [edx+14]; TStrings.GetCount
 0045AE18    mov        ebx,eax
 0045AE1A    dec        ebx
 0045AE1B    cmp        ebx,0
>0045AE1E    jl         0045AE45
 0045AE20    mov        edx,ebx
 0045AE22    mov        eax,dword ptr [esi+80]; TFormStorage.StoredProps:TStrings
 0045AE28    mov        ecx,dword ptr [eax]
 0045AE2A    call       dword ptr [ecx+18]; TStrings.GetObject
 0045AE2D    cmp        eax,dword ptr [ebp-4]
>0045AE30    jne        0045AE3F
 0045AE32    mov        edx,ebx
 0045AE34    mov        eax,dword ptr [esi+80]; TFormStorage.StoredProps:TStrings
 0045AE3A    mov        ecx,dword ptr [eax]
 0045AE3C    call       dword ptr [ecx+44]; TStrings.Delete
 0045AE3F    dec        ebx
 0045AE40    cmp        ebx,0FFFFFFFF
<0045AE43    jne        0045AE20
 0045AE45    pop        esi
 0045AE46    pop        ebx
 0045AE47    pop        ecx
 0045AE48    pop        ebp
 0045AE49    ret
*}
end;

//0045AE4C
//procedure sub_0045AE4C(?:TFormStorage);
//begin
{*
 0045AE4C    push       ebp
 0045AE4D    mov        ebp,esp
 0045AE4F    add        esp,0FFFFFFF8
 0045AE52    push       ebx
 0045AE53    xor        edx,edx
 0045AE55    mov        dword ptr [ebp-8],edx
 0045AE58    mov        ebx,eax
 0045AE5A    xor        eax,eax
 0045AE5C    push       ebp
 0045AE5D    push       45AF17
 0045AE62    push       dword ptr fs:[eax]
 0045AE65    mov        dword ptr fs:[eax],esp
 0045AE68    mov        dl,1
 0045AE6A    mov        eax,[004573F8]; TPropsStorage
 0045AE6F    call       TObject.Create; TPropsStorage.Create
 0045AE74    mov        dword ptr [ebp-4],eax
 0045AE77    xor        eax,eax
 0045AE79    push       ebp
 0045AE7A    push       45AEFA
 0045AE7F    push       dword ptr fs:[eax]
 0045AE82    mov        dword ptr fs:[eax],esp
 0045AE85    lea        edx,[ebp-8]
 0045AE88    mov        eax,ebx
 0045AE8A    call       TFormPlacement.GetIniSection
 0045AE8F    mov        edx,dword ptr [ebp-8]
 0045AE92    mov        eax,dword ptr [ebp-4]
 0045AE95    add        eax,10; TPropsStorage.?f10:String
 0045AE98    call       @LStrAsg
 0045AE9D    mov        eax,dword ptr [ebp-4]
 0045AEA0    mov        dword ptr [eax+24],ebx; TPropsStorage.?f24:TFormStorage
 0045AEA3    mov        dword ptr [eax+20],45A92C; TPropsStorage.?f20:? sub_0045A92C
 0045AEAA    cmp        byte ptr [ebx+34],0; TFormStorage.UseRegistry:Boolean
>0045AEAE    je         0045AEC2
 0045AEB0    mov        eax,dword ptr [ebx+38]; TFormStorage.?f38:dword
 0045AEB3    mov        edx,dword ptr [ebp-4]
 0045AEB6    mov        dword ptr [edx+2C],eax; TPropsStorage.?f2C:dword
 0045AEB9    mov        dword ptr [edx+28],44F4A8; TPropsStorage.?f28:dword
>0045AEC0    jmp        0045AED3
 0045AEC2    mov        eax,dword ptr [ebx+30]; TFormStorage.?f30:dword
 0045AEC5    mov        edx,dword ptr [ebp-4]
 0045AEC8    mov        dword ptr [edx+2C],eax; TPropsStorage.?f2C:dword
 0045AECB    mov        eax,dword ptr [eax]
 0045AECD    mov        eax,dword ptr [eax+44]
 0045AED0    mov        dword ptr [edx+28],eax; TPropsStorage.?f28:dword
 0045AED3    mov        ecx,dword ptr [ebx+80]; TFormStorage.StoredProps:TStrings
 0045AED9    mov        edx,dword ptr [ebx+4]; TFormStorage.FOwner:TComponent
 0045AEDC    mov        eax,dword ptr [ebp-4]
 0045AEDF    call       0045932C
 0045AEE4    xor        eax,eax
 0045AEE6    pop        edx
 0045AEE7    pop        ecx
 0045AEE8    pop        ecx
 0045AEE9    mov        dword ptr fs:[eax],edx
 0045AEEC    push       45AF01
 0045AEF1    mov        eax,dword ptr [ebp-4]
 0045AEF4    call       TObject.Free
 0045AEF9    ret
<0045AEFA    jmp        @HandleFinally
<0045AEFF    jmp        0045AEF1
 0045AF01    xor        eax,eax
 0045AF03    pop        edx
 0045AF04    pop        ecx
 0045AF05    pop        ecx
 0045AF06    mov        dword ptr fs:[eax],edx
 0045AF09    push       45AF1E
 0045AF0E    lea        eax,[ebp-8]
 0045AF11    call       @LStrClr
 0045AF16    ret
<0045AF17    jmp        @HandleFinally
<0045AF1C    jmp        0045AF0E
 0045AF1E    pop        ebx
 0045AF1F    pop        ecx
 0045AF20    pop        ecx
 0045AF21    pop        ebp
 0045AF22    ret
*}
//end;

//0045AF24
//procedure sub_0045AF24(?:TFormStorage);
//begin
{*
 0045AF24    push       ebp
 0045AF25    mov        ebp,esp
 0045AF27    add        esp,0FFFFFFF8
 0045AF2A    push       ebx
 0045AF2B    push       esi
 0045AF2C    push       edi
 0045AF2D    xor        edx,edx
 0045AF2F    mov        dword ptr [ebp-8],edx
 0045AF32    mov        ebx,eax
 0045AF34    xor        eax,eax
 0045AF36    push       ebp
 0045AF37    push       45AFEA
 0045AF3C    push       dword ptr fs:[eax]
 0045AF3F    mov        dword ptr fs:[eax],esp
 0045AF42    mov        dl,1
 0045AF44    mov        eax,[004573F8]; TPropsStorage
 0045AF49    call       TObject.Create; TPropsStorage.Create
 0045AF4E    mov        dword ptr [ebp-4],eax
 0045AF51    xor        eax,eax
 0045AF53    push       ebp
 0045AF54    push       45AFCD
 0045AF59    push       dword ptr fs:[eax]
 0045AF5C    mov        dword ptr fs:[eax],esp
 0045AF5F    lea        edx,[ebp-8]
 0045AF62    mov        eax,ebx
 0045AF64    call       TFormPlacement.GetIniSection
 0045AF69    mov        edx,dword ptr [ebp-8]
 0045AF6C    mov        eax,dword ptr [ebp-4]
 0045AF6F    add        eax,10; TPropsStorage.?f10:String
 0045AF72    call       @LStrAsg
 0045AF77    mov        eax,dword ptr [ebp-4]
 0045AF7A    mov        dword ptr [eax+1C],ebx; TPropsStorage.?f1C:TFormStorage
 0045AF7D    mov        dword ptr [eax+18],45A8A4; TPropsStorage.?f18:? sub_0045A8A4
 0045AF84    xor        eax,eax
 0045AF86    push       ebp
 0045AF87    push       45AFAD
 0045AF8C    push       dword ptr fs:[eax]
 0045AF8F    mov        dword ptr fs:[eax],esp
 0045AF92    mov        ecx,dword ptr [ebx+80]; TFormStorage.StoredProps:TStrings
 0045AF98    mov        edx,dword ptr [ebx+4]; TFormStorage.FOwner:TComponent
 0045AF9B    mov        eax,dword ptr [ebp-4]
 0045AF9E    call       004591D0
 0045AFA3    xor        eax,eax
 0045AFA5    pop        edx
 0045AFA6    pop        ecx
 0045AFA7    pop        ecx
 0045AFA8    mov        dword ptr fs:[eax],edx
>0045AFAB    jmp        0045AFB7
<0045AFAD    jmp        @HandleAnyException
 0045AFB2    call       @DoneExcept
 0045AFB7    xor        eax,eax
 0045AFB9    pop        edx
 0045AFBA    pop        ecx
 0045AFBB    pop        ecx
 0045AFBC    mov        dword ptr fs:[eax],edx
 0045AFBF    push       45AFD4
 0045AFC4    mov        eax,dword ptr [ebp-4]
 0045AFC7    call       TObject.Free
 0045AFCC    ret
<0045AFCD    jmp        @HandleFinally
<0045AFD2    jmp        0045AFC4
 0045AFD4    xor        eax,eax
 0045AFD6    pop        edx
 0045AFD7    pop        ecx
 0045AFD8    pop        ecx
 0045AFD9    mov        dword ptr fs:[eax],edx
 0045AFDC    push       45AFF1
 0045AFE1    lea        eax,[ebp-8]
 0045AFE4    call       @LStrClr
 0045AFE9    ret
<0045AFEA    jmp        @HandleFinally
<0045AFEF    jmp        0045AFE1
 0045AFF1    pop        edi
 0045AFF2    pop        esi
 0045AFF3    pop        ebx
 0045AFF4    pop        ecx
 0045AFF5    pop        ecx
 0045AFF6    pop        ebp
 0045AFF7    ret
*}
//end;

//0045AFF8
procedure sub_0045AFF8;
begin
{*
 0045AFF8    push       ebp
 0045AFF9    mov        ebp,esp
 0045AFFB    push       ebx
 0045AFFC    mov        ebx,eax
 0045AFFE    mov        eax,ebx
 0045B000    call       0045A598
 0045B005    mov        eax,ebx
 0045B007    call       0045AE4C
 0045B00C    pop        ebx
 0045B00D    pop        ebp
 0045B00E    ret
*}
end;

//0045B010
procedure sub_0045B010;
begin
{*
 0045B010    push       ebp
 0045B011    mov        ebp,esp
 0045B013    push       ebx
 0045B014    mov        ebx,eax
 0045B016    mov        eax,ebx
 0045B018    call       0045A728
 0045B01D    mov        byte ptr [ebx+42],1; TFormStorage.?f42:byte
 0045B021    mov        eax,ebx
 0045B023    call       0045AF24
 0045B028    pop        ebx
 0045B029    pop        ebp
 0045B02A    ret
*}
end;

end.