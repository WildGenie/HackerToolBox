{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit AnimCtl;

interface

uses
  Classes, Windows, Graphics, Controls;

type
  TAnimateControl = class(TWinControl)
  public
    f1F0:String;//f1F0
    Active:Boolean;//f1F4
    Centered:Boolean;//f1F5
    f1F6:byte;//f1F6
    function Loaded:Longint; virtual;
    constructor Create(AOwner:TComponent); virtual;
    procedure CreateParams(var Params:TCreateParams); virtual;
  end;

implementation

{$R *.DFM}

//0045B8FC
constructor TAnimateControl.Create(AOwner:TComponent);
begin
{*
 0045B8FC    push       ebp
 0045B8FD    mov        ebp,esp
 0045B8FF    push       ebx
 0045B900    push       esi
 0045B901    test       dl,dl
>0045B903    je         0045B90D
 0045B905    add        esp,0FFFFFFF0
 0045B908    call       @ClassCreate
 0045B90D    mov        ebx,edx
 0045B90F    mov        esi,eax
 0045B911    xor        edx,edx
 0045B913    mov        eax,esi
 0045B915    call       TWinControl.Create
 0045B91A    mov        edx,28
 0045B91F    mov        eax,esi
 0045B921    call       TControl.SetWidth
 0045B926    mov        edx,28
 0045B92B    mov        eax,esi
 0045B92D    call       TControl.SetHeight
 0045B932    mov        eax,esi
 0045B934    test       bl,bl
>0045B936    je         0045B947
 0045B938    call       @AfterConstruction
 0045B93D    pop        dword ptr fs:[0]
 0045B944    add        esp,0C
 0045B947    mov        eax,esi
 0045B949    pop        esi
 0045B94A    pop        ebx
 0045B94B    pop        ebp
 0045B94C    ret
*}
end;

//0045B950
procedure TAnimateControl.CreateParams(var Params:TCreateParams);
begin
{*
 0045B950    push       ebp
 0045B951    mov        ebp,esp
 0045B953    push       ebx
 0045B954    push       esi
 0045B955    mov        esi,edx
 0045B957    mov        ebx,eax
 0045B959    mov        edx,esi
 0045B95B    mov        eax,ebx
 0045B95D    call       TWinControl.CreateParams
 0045B962    mov        ecx,45B988; 'SysAnimate32'
 0045B967    mov        edx,esi
 0045B969    mov        eax,ebx
 0045B96B    call       TWinControl.CreateSubClass
 0045B970    or         dword ptr [esi+4],2; TCreateParams.Style:DWORD
 0045B974    cmp        byte ptr [ebx+1F5],0; TAnimateControl.Centered:Boolean
>0045B97B    je         0045B981
 0045B97D    or         dword ptr [esi+4],1; TCreateParams.Style:DWORD
 0045B981    pop        esi
 0045B982    pop        ebx
 0045B983    pop        ebp
 0045B984    ret
*}
end;

//0045B998
//function sub_0045B998(?:TAnimateControl):Longint;
//begin
{*
 0045B998    push       ebp
 0045B999    mov        ebp,esp
 0045B99B    push       ebx
 0045B99C    mov        ebx,eax
 0045B99E    mov        eax,dword ptr [ebx+1F0]; TAnimateControl.?f1F0:String
 0045B9A4    call       @LStrToPChar
 0045B9A9    push       eax
 0045B9AA    push       0
 0045B9AC    push       464
 0045B9B1    mov        eax,ebx
 0045B9B3    call       TWinControl.GetHandle
 0045B9B8    push       eax
 0045B9B9    call       user32.SendMessageA
 0045B9BE    mov        byte ptr [ebx+1F6],1; TAnimateControl.?f1F6:byte
 0045B9C5    pop        ebx
 0045B9C6    pop        ebp
 0045B9C7    ret
*}
//end;

//0045B9C8
//function sub_0045B9C8(?:TAnimateControl):Longint;
//begin
{*
 0045B9C8    push       ebp
 0045B9C9    mov        ebp,esp
 0045B9CB    push       ebx
 0045B9CC    mov        ebx,eax
 0045B9CE    mov        dx,0FFFF
 0045B9D2    xor        eax,eax
 0045B9D4    call       MakeLong
 0045B9D9    push       eax
 0045B9DA    push       0FF
 0045B9DC    push       465
 0045B9E1    mov        eax,ebx
 0045B9E3    call       TWinControl.GetHandle
 0045B9E8    push       eax
 0045B9E9    call       user32.SendMessageA
 0045B9EE    pop        ebx
 0045B9EF    pop        ebp
 0045B9F0    ret
*}
//end;

//0045B9F4
//function sub_0045B9F4(?:TAnimateControl):Longint;
//begin
{*
 0045B9F4    push       ebp
 0045B9F5    mov        ebp,esp
 0045B9F7    push       ebx
 0045B9F8    mov        ebx,eax
 0045B9FA    xor        edx,edx
 0045B9FC    xor        eax,eax
 0045B9FE    call       MakeLong
 0045BA03    push       eax
 0045BA04    push       1
 0045BA06    push       465
 0045BA0B    mov        eax,ebx
 0045BA0D    call       TWinControl.GetHandle
 0045BA12    push       eax
 0045BA13    call       user32.SendMessageA
 0045BA18    pop        ebx
 0045BA19    pop        ebp
 0045BA1A    ret
*}
//end;

//0045BA1C
//function TAnimateControl.SetActive(Self:TAnimateControl; ?:?):Longint;
//begin
{*
 0045BA1C    push       ebp
 0045BA1D    mov        ebp,esp
 0045BA1F    cmp        dl,byte ptr [eax+1F4]; TAnimateControl.Active:Boolean
>0045BA25    je         0045BA32
 0045BA27    mov        byte ptr [eax+1F4],dl; TAnimateControl.Active:Boolean
 0045BA2D    call       0045BA88
 0045BA32    pop        ebp
 0045BA33    ret
*}
//end;

//0045BA34
//function TAnimateControl.SetAVI(Self:TAnimateControl; ?:?):Longint;
//begin
{*
 0045BA34    push       ebp
 0045BA35    mov        ebp,esp
 0045BA37    push       ebx
 0045BA38    push       esi
 0045BA39    mov        esi,edx
 0045BA3B    mov        ebx,eax
 0045BA3D    lea        eax,[ebx+1F0]; TAnimateControl.?f1F0:String
 0045BA43    mov        edx,esi
 0045BA45    call       @LStrAsg
 0045BA4A    mov        byte ptr [ebx+1F6],0; TAnimateControl.?f1F6:byte
 0045BA51    mov        eax,ebx
 0045BA53    call       0045BA88
 0045BA58    pop        esi
 0045BA59    pop        ebx
 0045BA5A    pop        ebp
 0045BA5B    ret
*}
//end;

//0045BA5C
//function TAnimateControl.SetCentered(Self:TAnimateControl; ?:?):Longint;
//begin
{*
 0045BA5C    push       ebp
 0045BA5D    mov        ebp,esp
 0045BA5F    push       ebx
 0045BA60    mov        ebx,eax
 0045BA62    cmp        dl,byte ptr [ebx+1F5]; TAnimateControl.Centered:Boolean
>0045BA68    je         0045BA85
 0045BA6A    mov        byte ptr [ebx+1F5],dl; TAnimateControl.Centered:Boolean
 0045BA70    mov        eax,ebx
 0045BA72    call       TWinControl.RecreateWnd
 0045BA77    mov        byte ptr [ebx+1F6],0; TAnimateControl.?f1F6:byte
 0045BA7E    mov        eax,ebx
 0045BA80    call       0045BA88
 0045BA85    pop        ebx
 0045BA86    pop        ebp
 0045BA87    ret
*}
//end;

//0045BA88
//function sub_0045BA88(?:TAnimateControl):Longint;
//begin
{*
 0045BA88    push       ebp
 0045BA89    mov        ebp,esp
 0045BA8B    push       ebx
 0045BA8C    mov        ebx,eax
 0045BA8E    test       byte ptr [ebx+20],1; TAnimateControl.FComponentState:TComponentState
>0045BA92    jne        0045BABD
 0045BA94    cmp        byte ptr [ebx+1F6],0; TAnimateControl.?f1F6:byte
>0045BA9B    jne        0045BAA4
 0045BA9D    mov        eax,ebx
 0045BA9F    call       0045B998
 0045BAA4    cmp        byte ptr [ebx+1F4],0; TAnimateControl.Active:Boolean
>0045BAAB    je         0045BAB6
 0045BAAD    mov        eax,ebx
 0045BAAF    call       0045B9C8
>0045BAB4    jmp        0045BABD
 0045BAB6    mov        eax,ebx
 0045BAB8    call       0045B9F4
 0045BABD    pop        ebx
 0045BABE    pop        ebp
 0045BABF    ret
*}
//end;

//0045BAC0
function TAnimateControl.Loaded:Longint;
begin
{*
 0045BAC0    push       ebp
 0045BAC1    mov        ebp,esp
 0045BAC3    push       ebx
 0045BAC4    mov        ebx,eax
 0045BAC6    mov        eax,ebx
 0045BAC8    call       TControl.Loaded
 0045BACD    mov        eax,ebx
 0045BACF    call       0045BA88
 0045BAD4    pop        ebx
 0045BAD5    pop        ebp
 0045BAD6    ret
*}
end;

end.