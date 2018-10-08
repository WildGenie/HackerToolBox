{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit NewGauge;

interface

uses
  Classes, Windows, Graphics, Controls;

type
  TNewGauge = class(TGraphicControl)
  public
    MinValue:Integer;//f128
    MaxValue:Integer;//f12C
    Progress:Integer;//f130
    ShowText:Boolean;//f134
    ForeColor:TColor;//f138
    BackColor:TColor;//f13C
    constructor Create(AOwner:TComponent); virtual;
    procedure Paint; virtual;
  end;

implementation

{$R *.DFM}

//0045C570
constructor TNewGauge.Create(AOwner:TComponent);
begin
{*
 0045C570    push       ebp
 0045C571    mov        ebp,esp
 0045C573    push       ebx
 0045C574    push       esi
 0045C575    test       dl,dl
>0045C577    je         0045C581
 0045C579    add        esp,0FFFFFFF0
 0045C57C    call       @ClassCreate
 0045C581    mov        ebx,edx
 0045C583    mov        esi,eax
 0045C585    xor        edx,edx
 0045C587    mov        eax,esi
 0045C589    call       TGraphicControl.Create
 0045C58E    mov        eax,[0045C5F4]; 0x40
 0045C593    or         eax,dword ptr [esi+40]; TNewGauge.FControlStyle:TControlStyle
 0045C596    mov        dword ptr [esi+40],eax; TNewGauge.FControlStyle:TControlStyle
 0045C599    mov        dword ptr [esi+12C],64; TNewGauge.MaxValue:Integer
 0045C5A3    mov        byte ptr [esi+134],1; TNewGauge.ShowText:Boolean
 0045C5AA    mov        dword ptr [esi+138],800000; TNewGauge.ForeColor:TColor
 0045C5B4    mov        dword ptr [esi+13C],0FFFFFF; TNewGauge.BackColor:TColor
 0045C5BE    mov        edx,64
 0045C5C3    mov        eax,esi
 0045C5C5    call       TControl.SetWidth
 0045C5CA    mov        edx,64
 0045C5CF    mov        eax,esi
 0045C5D1    call       TControl.SetHeight
 0045C5D6    mov        eax,esi
 0045C5D8    test       bl,bl
>0045C5DA    je         0045C5EB
 0045C5DC    call       @AfterConstruction
 0045C5E1    pop        dword ptr fs:[0]
 0045C5E8    add        esp,0C
 0045C5EB    mov        eax,esi
 0045C5ED    pop        esi
 0045C5EE    pop        ebx
 0045C5EF    pop        ebp
 0045C5F0    ret
*}
end;

//0045C5F8
//function sub_0045C5F8(?:HDC; ?:?):Integer;
//begin
{*
 0045C5F8    push       ebp
 0045C5F9    mov        ebp,esp
 0045C5FB    push       ebx
 0045C5FC    push       esi
 0045C5FD    mov        ebx,eax
 0045C5FF    push       ebx
 0045C600    call       gdi32.SaveDC
 0045C605    mov        esi,eax
 0045C607    mov        eax,dword ptr [ebp+8]
 0045C60A    mov        eax,dword ptr [eax-1C]
 0045C60D    push       eax
 0045C60E    mov        eax,dword ptr [ebp+8]
 0045C611    mov        eax,dword ptr [eax-20]
 0045C614    push       eax
 0045C615    mov        eax,dword ptr [ebp+8]
 0045C618    mov        eax,dword ptr [eax-24]
 0045C61B    push       eax
 0045C61C    mov        eax,dword ptr [ebp+8]
 0045C61F    mov        eax,dword ptr [eax-28]
 0045C622    push       eax
 0045C623    push       ebx
 0045C624    call       gdi32.IntersectClipRect
 0045C629    push       925
 0045C62E    mov        eax,dword ptr [ebp+8]
 0045C631    add        eax,0FFFFFFE8
 0045C634    push       eax
 0045C635    push       0FF
 0045C637    mov        eax,dword ptr [ebp+8]
 0045C63A    add        eax,0FFFFFFFA
 0045C63D    push       eax
 0045C63E    push       ebx
 0045C63F    call       user32.DrawTextA
 0045C644    push       esi
 0045C645    push       ebx
 0045C646    call       gdi32.RestoreDC
 0045C64B    pop        esi
 0045C64C    pop        ebx
 0045C64D    pop        ebp
 0045C64E    ret
*}
//end;

//0045C650
procedure TNewGauge.Paint;
begin
{*
 0045C650    push       ebp
 0045C651    mov        ebp,esp
 0045C653    add        esp,0FFFFFFC8
 0045C656    push       ebx
 0045C657    push       esi
 0045C658    push       edi
 0045C659    mov        dword ptr [ebp-2C],eax
 0045C65C    lea        edx,[ebp-18]
 0045C65F    mov        eax,dword ptr [ebp-2C]
 0045C662    mov        ecx,dword ptr [eax]
 0045C664    call       dword ptr [ecx+40]; TControl.GetClientRect
 0045C667    mov        eax,dword ptr [ebp-2C]
 0045C66A    mov        eax,dword ptr [eax+120]; TNewGauge.FCanvas:TCanvas
 0045C670    mov        ecx,1
 0045C675    lea        edx,[ebp-18]
 0045C678    call       0045C1E0
 0045C67D    sub        dword ptr [ebp-10],4
 0045C681    sub        dword ptr [ebp-0C],4
 0045C685    cmp        dword ptr [ebp-10],1
>0045C689    jl         0045C8B1
 0045C68F    cmp        dword ptr [ebp-0C],1
>0045C693    jl         0045C8B1
 0045C699    mov        dl,1
 0045C69B    mov        eax,[00417224]; TBitmap
 0045C6A0    call       TBitmap.Create; TBitmap.Create
 0045C6A5    mov        dword ptr [ebp-30],eax
 0045C6A8    xor        ecx,ecx
 0045C6AA    push       ebp
 0045C6AB    push       45C8AA
 0045C6B0    push       dword ptr fs:[ecx]
 0045C6B3    mov        dword ptr fs:[ecx],esp
 0045C6B6    mov        edx,dword ptr [ebp-0C]
 0045C6B9    mov        eax,dword ptr [ebp-30]
 0045C6BC    mov        ecx,dword ptr [eax]
 0045C6BE    call       dword ptr [ecx+34]; TBitmap.SetHeight
 0045C6C1    mov        edx,dword ptr [ebp-10]
 0045C6C4    mov        eax,dword ptr [ebp-30]
 0045C6C7    mov        ecx,dword ptr [eax]
 0045C6C9    call       dword ptr [ecx+40]; TBitmap.SetWidth
 0045C6CC    xor        eax,eax
 0045C6CE    push       ebp
 0045C6CF    push       45C73E
 0045C6D4    push       dword ptr fs:[eax]
 0045C6D7    mov        dword ptr fs:[eax],esp
 0045C6DA    mov        eax,dword ptr [ebp-2C]
 0045C6DD    mov        ebx,dword ptr [eax+128]; TNewGauge.MinValue:Integer
 0045C6E3    mov        eax,dword ptr [ebp-2C]
 0045C6E6    mov        esi,dword ptr [eax+12C]; TNewGauge.MaxValue:Integer
 0045C6EC    cmp        ebx,esi
>0045C6EE    je         0045C727
 0045C6F0    sub        esi,ebx
 0045C6F2    push       esi
 0045C6F3    mov        eax,dword ptr [ebp-2C]
 0045C6F6    mov        eax,dword ptr [eax+130]; TNewGauge.Progress:Integer
 0045C6FC    sub        eax,ebx
 0045C6FE    push       eax
 0045C6FF    push       64
 0045C701    call       kernel32.MulDiv
 0045C706    mov        dword ptr [ebp-38],eax
 0045C709    mov        byte ptr [ebp-34],0
 0045C70D    lea        eax,[ebp-38]
 0045C710    push       eax
 0045C711    push       0
 0045C713    mov        ecx,45C8B8; '%d %%'
 0045C718    lea        eax,[ebp-6]
 0045C71B    mov        edx,5
 0045C720    call       StrLFmt
>0045C725    jmp        0045C734
 0045C727    mov        edx,45C8C0; '0 %'
 0045C72C    lea        eax,[ebp-6]
 0045C72F    call       StrCopy
 0045C734    xor        eax,eax
 0045C736    pop        edx
 0045C737    pop        ecx
 0045C738    pop        ecx
 0045C739    mov        dword ptr fs:[eax],edx
>0045C73C    jmp        0045C755
<0045C73E    jmp        @HandleAnyException
 0045C743    mov        edx,45C8C4; '?'
 0045C748    lea        eax,[ebp-6]
 0045C74B    call       StrCopy
 0045C750    call       @DoneExcept
 0045C755    xor        ecx,ecx
 0045C757    push       ebp
 0045C758    push       45C7A1
 0045C75D    push       dword ptr fs:[ecx]
 0045C760    mov        dword ptr fs:[ecx],esp
 0045C763    mov        eax,dword ptr [ebp-2C]
 0045C766    mov        eax,dword ptr [eax+128]; TNewGauge.MinValue:Integer
 0045C76C    mov        edx,dword ptr [ebp-2C]
 0045C76F    mov        edx,dword ptr [edx+12C]; TNewGauge.MaxValue:Integer
 0045C775    cmp        eax,edx
>0045C777    je         0045C795
 0045C779    sub        edx,eax
 0045C77B    push       edx
 0045C77C    mov        edx,dword ptr [ebp-2C]
 0045C77F    mov        edx,dword ptr [edx+130]; TNewGauge.Progress:Integer
 0045C785    sub        edx,eax
 0045C787    push       edx
 0045C788    mov        eax,dword ptr [ebp-10]
 0045C78B    push       eax
 0045C78C    call       kernel32.MulDiv
 0045C791    mov        esi,eax
>0045C793    jmp        0045C797
 0045C795    xor        esi,esi
 0045C797    xor        eax,eax
 0045C799    pop        edx
 0045C79A    pop        ecx
 0045C79B    pop        ecx
 0045C79C    mov        dword ptr fs:[eax],edx
>0045C79F    jmp        0045C7AD
<0045C7A1    jmp        @HandleAnyException
 0045C7A6    xor        esi,esi
 0045C7A8    call       @DoneExcept
 0045C7AD    mov        eax,dword ptr [ebp-30]
 0045C7B0    call       TBitmap.GetCanvas
 0045C7B5    mov        ebx,eax
 0045C7B7    mov        eax,dword ptr [ebp-0C]
 0045C7BA    push       eax
 0045C7BB    lea        eax,[ebp-28]
 0045C7BE    push       eax
 0045C7BF    mov        ecx,esi
 0045C7C1    xor        edx,edx
 0045C7C3    xor        eax,eax
 0045C7C5    call       Rect
 0045C7CA    mov        eax,dword ptr [ebp-2C]
 0045C7CD    mov        edx,dword ptr [eax+138]; TNewGauge.ForeColor:TColor
 0045C7D3    mov        eax,dword ptr [ebx+14]; TCanvas.Brush:TBrush
 0045C7D6    call       TBrush.SetColor
 0045C7DB    lea        edx,[ebp-28]
 0045C7DE    mov        eax,ebx
 0045C7E0    call       TCanvas.FillRect
 0045C7E5    mov        eax,dword ptr [ebp-2C]
 0045C7E8    cmp        byte ptr [eax+134],0; TNewGauge.ShowText:Boolean
>0045C7EF    je         0045C81E
 0045C7F1    mov        eax,dword ptr [ebp-2C]
 0045C7F4    mov        edx,dword ptr [eax+58]; TNewGauge.FFont:TFont
 0045C7F7    mov        eax,dword ptr [ebx+0C]; TCanvas.Font:TFont
 0045C7FA    mov        ecx,dword ptr [eax]
 0045C7FC    call       dword ptr [ecx+8]; TFont.Assign
 0045C7FF    mov        eax,dword ptr [ebp-2C]
 0045C802    mov        edx,dword ptr [eax+13C]; TNewGauge.BackColor:TColor
 0045C808    mov        eax,dword ptr [ebx+0C]; TCanvas.Font:TFont
 0045C80B    call       TFont.SetColor
 0045C810    push       ebp
 0045C811    mov        eax,ebx
 0045C813    call       TCanvas.GetHandle
 0045C818    call       0045C5F8
 0045C81D    pop        ecx
 0045C81E    mov        eax,dword ptr [ebp-0C]
 0045C821    push       eax
 0045C822    lea        eax,[ebp-28]
 0045C825    push       eax
 0045C826    mov        ecx,dword ptr [ebp-10]
 0045C829    xor        edx,edx
 0045C82B    mov        eax,esi
 0045C82D    call       Rect
 0045C832    mov        eax,dword ptr [ebp-2C]
 0045C835    mov        edx,dword ptr [eax+13C]; TNewGauge.BackColor:TColor
 0045C83B    mov        eax,dword ptr [ebx+14]; TCanvas.Brush:TBrush
 0045C83E    call       TBrush.SetColor
 0045C843    lea        edx,[ebp-28]
 0045C846    mov        eax,ebx
 0045C848    call       TCanvas.FillRect
 0045C84D    mov        eax,dword ptr [ebp-2C]
 0045C850    cmp        byte ptr [eax+134],0; TNewGauge.ShowText:Boolean
>0045C857    je         0045C878
 0045C859    mov        eax,dword ptr [ebp-2C]
 0045C85C    mov        edx,dword ptr [eax+138]; TNewGauge.ForeColor:TColor
 0045C862    mov        eax,dword ptr [ebx+0C]; TCanvas.Font:TFont
 0045C865    call       TFont.SetColor
 0045C86A    push       ebp
 0045C86B    mov        eax,ebx
 0045C86D    call       TCanvas.GetHandle
 0045C872    call       0045C5F8
 0045C877    pop        ecx
 0045C878    mov        eax,dword ptr [ebp-30]
 0045C87B    push       eax
 0045C87C    mov        eax,dword ptr [ebp-2C]
 0045C87F    mov        eax,dword ptr [eax+120]; TNewGauge.FCanvas:TCanvas
 0045C885    mov        ecx,2
 0045C88A    mov        edx,2
 0045C88F    call       TCanvas.Draw
 0045C894    xor        eax,eax
 0045C896    pop        edx
 0045C897    pop        ecx
 0045C898    pop        ecx
 0045C899    mov        dword ptr fs:[eax],edx
 0045C89C    push       45C8B1
 0045C8A1    mov        eax,dword ptr [ebp-30]
 0045C8A4    call       TObject.Free
 0045C8A9    ret
<0045C8AA    jmp        @HandleFinally
<0045C8AF    jmp        0045C8A1
 0045C8B1    pop        edi
 0045C8B2    pop        esi
 0045C8B3    pop        ebx
 0045C8B4    mov        esp,ebp
 0045C8B6    pop        ebp
 0045C8B7    ret
*}
end;

//0045C8C8
//procedure TNewGauge.SetShowText(Self:TNewGauge; ?:?);
//begin
{*
 0045C8C8    push       ebp
 0045C8C9    mov        ebp,esp
 0045C8CB    cmp        dl,byte ptr [eax+134]; TNewGauge.ShowText:Boolean
>0045C8D1    je         0045C8DE
 0045C8D3    mov        byte ptr [eax+134],dl; TNewGauge.ShowText:Boolean
 0045C8D9    mov        edx,dword ptr [eax]
 0045C8DB    call       dword ptr [edx+74]; TControl.Invalidate
 0045C8DE    pop        ebp
 0045C8DF    ret
*}
//end;

//0045C8E0
//procedure TNewGauge.SetForeColor(Self:TNewGauge; ?:?);
//begin
{*
 0045C8E0    push       ebp
 0045C8E1    mov        ebp,esp
 0045C8E3    cmp        edx,dword ptr [eax+138]; TNewGauge.ForeColor:TColor
>0045C8E9    je         0045C8F6
 0045C8EB    mov        dword ptr [eax+138],edx; TNewGauge.ForeColor:TColor
 0045C8F1    mov        edx,dword ptr [eax]
 0045C8F3    call       dword ptr [edx+74]; TControl.Invalidate
 0045C8F6    pop        ebp
 0045C8F7    ret
*}
//end;

//0045C8F8
//procedure TNewGauge.SetBackColor(Self:TNewGauge; ?:?);
//begin
{*
 0045C8F8    push       ebp
 0045C8F9    mov        ebp,esp
 0045C8FB    cmp        edx,dword ptr [eax+13C]; TNewGauge.BackColor:TColor
>0045C901    je         0045C90E
 0045C903    mov        dword ptr [eax+13C],edx; TNewGauge.BackColor:TColor
 0045C909    mov        edx,dword ptr [eax]
 0045C90B    call       dword ptr [edx+74]; TControl.Invalidate
 0045C90E    pop        ebp
 0045C90F    ret
*}
//end;

//0045C910
//procedure TNewGauge.SetMinValue(Self:TNewGauge; ?:?);
//begin
{*
 0045C910    push       ebp
 0045C911    mov        ebp,esp
 0045C913    add        esp,0FFFFFFEC
 0045C916    push       ebx
 0045C917    xor        ecx,ecx
 0045C919    mov        dword ptr [ebp-14],ecx
 0045C91C    mov        ebx,eax
 0045C91E    xor        eax,eax
 0045C920    push       ebp
 0045C921    push       45C9AD
 0045C926    push       dword ptr fs:[eax]
 0045C929    mov        dword ptr fs:[eax],esp
 0045C92C    cmp        edx,dword ptr [ebx+128]; TNewGauge.MinValue:Integer
>0045C932    je         0045C997
 0045C934    cmp        edx,dword ptr [ebx+12C]; TNewGauge.MaxValue:Integer
>0045C93A    jle        0045C97C
 0045C93C    mov        dword ptr [ebp-10],80000001
 0045C943    mov        byte ptr [ebp-0C],0
 0045C947    mov        eax,dword ptr [ebx+12C]; TNewGauge.MaxValue:Integer
 0045C94D    dec        eax
 0045C94E    mov        dword ptr [ebp-8],eax
 0045C951    mov        byte ptr [ebp-4],0
 0045C955    lea        eax,[ebp-10]
 0045C958    push       eax
 0045C959    push       1
 0045C95B    lea        edx,[ebp-14]
 0045C95E    mov        eax,[0046BF74]; ^SOutOfRange:TResStringRec
 0045C963    call       LoadResString
 0045C968    mov        ecx,dword ptr [ebp-14]
 0045C96B    mov        dl,1
 0045C96D    mov        eax,[0040EB9C]; EInvalidOperation
 0045C972    call       Exception.CreateFmt; EInvalidOperation.Create
 0045C977    call       @RaiseExcept
 0045C97C    mov        dword ptr [ebx+128],edx; TNewGauge.MinValue:Integer
 0045C982    cmp        edx,dword ptr [ebx+130]; TNewGauge.Progress:Integer
>0045C988    jle        0045C990
 0045C98A    mov        dword ptr [ebx+130],edx; TNewGauge.Progress:Integer
 0045C990    mov        eax,ebx
 0045C992    mov        edx,dword ptr [eax]
 0045C994    call       dword ptr [edx+74]; TControl.Invalidate
 0045C997    xor        eax,eax
 0045C999    pop        edx
 0045C99A    pop        ecx
 0045C99B    pop        ecx
 0045C99C    mov        dword ptr fs:[eax],edx
 0045C99F    push       45C9B4
 0045C9A4    lea        eax,[ebp-14]
 0045C9A7    call       @LStrClr
 0045C9AC    ret
<0045C9AD    jmp        @HandleFinally
<0045C9B2    jmp        0045C9A4
 0045C9B4    pop        ebx
 0045C9B5    mov        esp,ebp
 0045C9B7    pop        ebp
 0045C9B8    ret
*}
//end;

//0045C9BC
//procedure TNewGauge.SetMaxValue(Self:TNewGauge; ?:?);
//begin
{*
 0045C9BC    push       ebp
 0045C9BD    mov        ebp,esp
 0045C9BF    add        esp,0FFFFFFEC
 0045C9C2    push       ebx
 0045C9C3    xor        ecx,ecx
 0045C9C5    mov        dword ptr [ebp-14],ecx
 0045C9C8    mov        ebx,eax
 0045C9CA    xor        eax,eax
 0045C9CC    push       ebp
 0045C9CD    push       45CA59
 0045C9D2    push       dword ptr fs:[eax]
 0045C9D5    mov        dword ptr fs:[eax],esp
 0045C9D8    cmp        edx,dword ptr [ebx+12C]; TNewGauge.MaxValue:Integer
>0045C9DE    je         0045CA43
 0045C9E0    cmp        edx,dword ptr [ebx+128]; TNewGauge.MinValue:Integer
>0045C9E6    jge        0045CA28
 0045C9E8    mov        eax,dword ptr [ebx+128]; TNewGauge.MinValue:Integer
 0045C9EE    inc        eax
 0045C9EF    mov        dword ptr [ebp-10],eax
 0045C9F2    mov        byte ptr [ebp-0C],0
 0045C9F6    mov        dword ptr [ebp-8],7FFFFFFF
 0045C9FD    mov        byte ptr [ebp-4],0
 0045CA01    lea        eax,[ebp-10]
 0045CA04    push       eax
 0045CA05    push       1
 0045CA07    lea        edx,[ebp-14]
 0045CA0A    mov        eax,[0046BF74]; ^SOutOfRange:TResStringRec
 0045CA0F    call       LoadResString
 0045CA14    mov        ecx,dword ptr [ebp-14]
 0045CA17    mov        dl,1
 0045CA19    mov        eax,[0040EB9C]; EInvalidOperation
 0045CA1E    call       Exception.CreateFmt; EInvalidOperation.Create
 0045CA23    call       @RaiseExcept
 0045CA28    mov        dword ptr [ebx+12C],edx; TNewGauge.MaxValue:Integer
 0045CA2E    cmp        edx,dword ptr [ebx+130]; TNewGauge.Progress:Integer
>0045CA34    jge        0045CA3C
 0045CA36    mov        dword ptr [ebx+130],edx; TNewGauge.Progress:Integer
 0045CA3C    mov        eax,ebx
 0045CA3E    mov        edx,dword ptr [eax]
 0045CA40    call       dword ptr [edx+74]; TControl.Invalidate
 0045CA43    xor        eax,eax
 0045CA45    pop        edx
 0045CA46    pop        ecx
 0045CA47    pop        ecx
 0045CA48    mov        dword ptr fs:[eax],edx
 0045CA4B    push       45CA60
 0045CA50    lea        eax,[ebp-14]
 0045CA53    call       @LStrClr
 0045CA58    ret
<0045CA59    jmp        @HandleFinally
<0045CA5E    jmp        0045CA50
 0045CA60    pop        ebx
 0045CA61    mov        esp,ebp
 0045CA63    pop        ebp
 0045CA64    ret
*}
//end;

//0045CA68
//procedure TNewGauge.SetProgress(Self:TNewGauge; ?:Integer);
//begin
{*
 0045CA68    push       ebp
 0045CA69    mov        ebp,esp
 0045CA6B    mov        ecx,dword ptr [eax+128]; TNewGauge.MinValue:Integer
 0045CA71    cmp        edx,ecx
>0045CA73    jge        0045CA79
 0045CA75    mov        edx,ecx
>0045CA77    jmp        0045CA85
 0045CA79    mov        ecx,dword ptr [eax+12C]; TNewGauge.MaxValue:Integer
 0045CA7F    cmp        edx,ecx
>0045CA81    jle        0045CA85
 0045CA83    mov        edx,ecx
 0045CA85    cmp        edx,dword ptr [eax+130]; TNewGauge.Progress:Integer
>0045CA8B    je         0045CA98
 0045CA8D    mov        dword ptr [eax+130],edx; TNewGauge.Progress:Integer
 0045CA93    mov        edx,dword ptr [eax]
 0045CA95    call       dword ptr [edx+74]; TControl.Invalidate
 0045CA98    pop        ebp
 0045CA99    ret
*}
//end;

end.