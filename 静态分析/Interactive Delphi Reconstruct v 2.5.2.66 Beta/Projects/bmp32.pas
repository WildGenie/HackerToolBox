{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit bmp32;

interface

uses
  Classes, Windows, Graphics, Controls, Messages;

type
  TLrsBmp = class(TGraphicControl)
  public
    f128:Integer;//f128
    f12C:Integer;//f12C
    BitMap:TBitmap;//f130
    TransparentColor:TColor;//f134
    Stretch:Boolean;//f138
    destructor Destroy; virtual;
    constructor Create(AOwner:TComponent); virtual;
    procedure Paint; virtual;
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;
  end;

implementation

{$R *.DFM}

//0045BE28
constructor TLrsBmp.Create(AOwner:TComponent);
begin
{*
 0045BE28    push       ebp
 0045BE29    mov        ebp,esp
 0045BE2B    push       ebx
 0045BE2C    push       esi
 0045BE2D    test       dl,dl
>0045BE2F    je         0045BE39
 0045BE31    add        esp,0FFFFFFF0
 0045BE34    call       @ClassCreate
 0045BE39    mov        ebx,edx
 0045BE3B    mov        esi,eax
 0045BE3D    xor        edx,edx
 0045BE3F    mov        eax,esi
 0045BE41    call       TGraphicControl.Create
 0045BE46    mov        edx,20
 0045BE4B    mov        eax,esi
 0045BE4D    call       TControl.SetWidth
 0045BE52    mov        edx,20
 0045BE57    mov        eax,esi
 0045BE59    call       TControl.SetHeight
 0045BE5E    mov        dword ptr [esi+128],20; TLrsBmp.?f128:Integer
 0045BE68    mov        dword ptr [esi+12C],20; TLrsBmp.?f12C:Integer
 0045BE72    mov        dl,1
 0045BE74    mov        eax,[00417224]; TBitmap
 0045BE79    call       TBitmap.Create; TBitmap.Create
 0045BE7E    mov        dword ptr [esi+130],eax; TLrsBmp.BitMap:TBitmap
 0045BE84    mov        eax,[0045BEB4]; 0x40
 0045BE89    or         eax,dword ptr [esi+40]; TLrsBmp.FControlStyle:TControlStyle
 0045BE8C    mov        dword ptr [esi+40],eax; TLrsBmp.FControlStyle:TControlStyle
 0045BE8F    mov        dword ptr [esi+134],0FFFFFFFF; TLrsBmp.TransparentColor:TColor
 0045BE99    mov        eax,esi
 0045BE9B    test       bl,bl
>0045BE9D    je         0045BEAE
 0045BE9F    call       @AfterConstruction
 0045BEA4    pop        dword ptr fs:[0]
 0045BEAB    add        esp,0C
 0045BEAE    mov        eax,esi
 0045BEB0    pop        esi
 0045BEB1    pop        ebx
 0045BEB2    pop        ebp
 0045BEB3    ret
*}
end;

//0045BEB8
destructor TLrsBmp.Destroy;
begin
{*
 0045BEB8    push       ebp
 0045BEB9    mov        ebp,esp
 0045BEBB    push       ebx
 0045BEBC    push       esi
 0045BEBD    call       @BeforeDestruction
 0045BEC2    mov        ebx,edx
 0045BEC4    mov        esi,eax
 0045BEC6    mov        eax,dword ptr [esi+130]; TLrsBmp.BitMap:TBitmap
 0045BECC    call       TObject.Free
 0045BED1    mov        edx,ebx
 0045BED3    and        dl,0FC
 0045BED6    mov        eax,esi
 0045BED8    call       TGraphicControl.Destroy
 0045BEDD    test       bl,bl
>0045BEDF    jle        0045BEE8
 0045BEE1    mov        eax,esi
 0045BEE3    call       @ClassDestroy
 0045BEE8    pop        esi
 0045BEE9    pop        ebx
 0045BEEA    pop        ebp
 0045BEEB    ret
*}
end;

//0045BEEC
procedure TLrsBmp.WMPaint(var Message:TWMPaint);
begin
{*
 0045BEEC    push       ebp
 0045BEED    mov        ebp,esp
 0045BEEF    push       ebx
 0045BEF0    mov        ebx,eax
 0045BEF2    mov        eax,ebx
 0045BEF4    call       TGraphicControl.WMPaint
 0045BEF9    mov        eax,dword ptr [ebx+128]; TLrsBmp.?f128:Integer
 0045BEFF    mov        dword ptr [ebx+128],eax; TLrsBmp.?f128:Integer
 0045BF05    mov        eax,dword ptr [ebx+12C]; TLrsBmp.?f12C:Integer
 0045BF0B    mov        dword ptr [ebx+12C],eax; TLrsBmp.?f12C:Integer
 0045BF11    pop        ebx
 0045BF12    pop        ebp
 0045BF13    ret
*}
end;

//0045BF14
//procedure TLrsBmp.SetStretch(Self:TLrsBmp; ?:?);
//begin
{*
 0045BF14    push       ebp
 0045BF15    mov        ebp,esp
 0045BF17    cmp        dl,byte ptr [eax+138]; TLrsBmp.Stretch:Boolean
>0045BF1D    je         0045BF2A
 0045BF1F    mov        byte ptr [eax+138],dl; TLrsBmp.Stretch:Boolean
 0045BF25    mov        edx,dword ptr [eax]
 0045BF27    call       dword ptr [edx+74]; TControl.Invalidate
 0045BF2A    pop        ebp
 0045BF2B    ret
*}
//end;

//0045BF2C
procedure TLrsBmp.SetBitMap(Self:TLrsBmp);
begin
{*
 0045BF2C    push       ebp
 0045BF2D    mov        ebp,esp
 0045BF2F    push       esi
 0045BF30    mov        esi,eax
 0045BF32    mov        eax,dword ptr [esi+130]; TLrsBmp.BitMap:TBitmap
 0045BF38    mov        ecx,dword ptr [eax]
 0045BF3A    call       dword ptr [ecx+8]; TBitmap.Assign
 0045BF3D    mov        eax,dword ptr [esi+130]; TLrsBmp.BitMap:TBitmap
 0045BF43    mov        edx,dword ptr [eax]
 0045BF45    call       dword ptr [edx+20]; TBitmap.GetHeight
 0045BF48    mov        dword ptr [esi+12C],eax; TLrsBmp.?f12C:Integer
 0045BF4E    mov        eax,dword ptr [esi+130]; TLrsBmp.BitMap:TBitmap
 0045BF54    mov        edx,dword ptr [eax]
 0045BF56    call       dword ptr [edx+2C]; TBitmap.GetWidth
 0045BF59    mov        dword ptr [esi+128],eax; TLrsBmp.?f128:Integer
 0045BF5F    mov        edx,dword ptr [esi+12C]; TLrsBmp.?f12C:Integer
 0045BF65    mov        eax,esi
 0045BF67    call       TControl.SetHeight
 0045BF6C    mov        edx,dword ptr [esi+128]; TLrsBmp.?f128:Integer
 0045BF72    mov        eax,esi
 0045BF74    call       TControl.SetWidth
 0045BF79    cmp        dword ptr [esi+3C],0; TLrsBmp.Height:Integer
>0045BF7D    jne        0045BF8B
 0045BF7F    mov        edx,20
 0045BF84    mov        eax,esi
 0045BF86    call       TControl.SetHeight
 0045BF8B    cmp        dword ptr [esi+38],0; TLrsBmp.Width:Integer
>0045BF8F    jne        0045BF9D
 0045BF91    mov        edx,20
 0045BF96    mov        eax,esi
 0045BF98    call       TControl.SetWidth
 0045BF9D    pop        esi
 0045BF9E    pop        ebp
 0045BF9F    ret
*}
end;

//0045BFA0
//procedure TLrsBmp.SetTransparentColor(Self:TLrsBmp; ?:?);
//begin
{*
 0045BFA0    push       ebp
 0045BFA1    mov        ebp,esp
 0045BFA3    cmp        edx,dword ptr [eax+134]; TLrsBmp.TransparentColor:TColor
>0045BFA9    je         0045BFB6
 0045BFAB    mov        dword ptr [eax+134],edx; TLrsBmp.TransparentColor:TColor
 0045BFB1    mov        edx,dword ptr [eax]
 0045BFB3    call       dword ptr [edx+74]; TControl.Invalidate
 0045BFB6    pop        ebp
 0045BFB7    ret
*}
//end;

//0045BFB8
procedure TLrsBmp.Paint;
begin
{*
 0045BFB8    push       ebp
 0045BFB9    mov        ebp,esp
 0045BFBB    add        esp,0FFFFFFD0
 0045BFBE    push       ebx
 0045BFBF    push       esi
 0045BFC0    mov        ebx,eax
 0045BFC2    mov        eax,dword ptr [ebx+3C]; TLrsBmp.Height:Integer
 0045BFC5    push       eax
 0045BFC6    lea        eax,[ebp-10]
 0045BFC9    push       eax
 0045BFCA    mov        ecx,dword ptr [ebx+38]; TLrsBmp.Width:Integer
 0045BFCD    xor        edx,edx
 0045BFCF    xor        eax,eax
 0045BFD1    call       Rect
 0045BFD6    mov        eax,dword ptr [ebx+130]; TLrsBmp.BitMap:TBitmap
 0045BFDC    mov        edx,dword ptr [eax]
 0045BFDE    call       dword ptr [edx+20]; TBitmap.GetHeight
 0045BFE1    test       eax,eax
>0045BFE3    jle        0045C13A
 0045BFE9    cmp        byte ptr [ebx+138],0; TLrsBmp.Stretch:Boolean
>0045BFF0    je         0045BFFE
 0045BFF2    lea        edx,[ebp-20]
 0045BFF5    mov        eax,ebx
 0045BFF7    mov        ecx,dword ptr [eax]
 0045BFF9    call       dword ptr [ecx+40]; TControl.GetClientRect
>0045BFFC    jmp        0045C03A
 0045BFFE    mov        eax,dword ptr [ebx+130]; TLrsBmp.BitMap:TBitmap
 0045C004    mov        edx,dword ptr [eax]
 0045C006    call       dword ptr [edx+2C]; TBitmap.GetWidth
 0045C009    mov        edx,eax
 0045C00B    mov        eax,ebx
 0045C00D    call       TControl.SetWidth
 0045C012    mov        eax,dword ptr [ebx+130]; TLrsBmp.BitMap:TBitmap
 0045C018    mov        edx,dword ptr [eax]
 0045C01A    call       dword ptr [edx+20]; TBitmap.GetHeight
 0045C01D    mov        edx,eax
 0045C01F    mov        eax,ebx
 0045C021    call       TControl.SetHeight
 0045C026    mov        eax,dword ptr [ebx+3C]; TLrsBmp.Height:Integer
 0045C029    push       eax
 0045C02A    lea        eax,[ebp-20]
 0045C02D    push       eax
 0045C02E    mov        ecx,dword ptr [ebx+38]; TLrsBmp.Width:Integer
 0045C031    xor        edx,edx
 0045C033    xor        eax,eax
 0045C035    call       Rect
 0045C03A    mov        eax,dword ptr [ebx+134]; TLrsBmp.TransparentColor:TColor
 0045C040    test       eax,eax
>0045C042    jl         0045C0FA
 0045C048    cmp        eax,7FFFFFFF
>0045C04D    ja         0045C0FA
 0045C053    mov        dl,1
 0045C055    mov        eax,[00417224]; TBitmap
 0045C05A    call       TBitmap.Create; TBitmap.Create
 0045C05F    mov        esi,eax
 0045C061    mov        eax,dword ptr [ebx+130]; TLrsBmp.BitMap:TBitmap
 0045C067    mov        edx,dword ptr [eax]
 0045C069    call       dword ptr [edx+20]; TBitmap.GetHeight
 0045C06C    mov        edx,eax
 0045C06E    mov        eax,esi
 0045C070    mov        ecx,dword ptr [eax]
 0045C072    call       dword ptr [ecx+34]; TBitmap.SetHeight
 0045C075    mov        eax,dword ptr [ebx+130]; TLrsBmp.BitMap:TBitmap
 0045C07B    mov        edx,dword ptr [eax]
 0045C07D    call       dword ptr [edx+2C]; TBitmap.GetWidth
 0045C080    mov        edx,eax
 0045C082    mov        eax,esi
 0045C084    mov        ecx,dword ptr [eax]
 0045C086    call       dword ptr [ecx+40]; TBitmap.SetWidth
 0045C089    mov        eax,esi
 0045C08B    call       TBitmap.GetCanvas
 0045C090    mov        eax,dword ptr [eax+14]; TCanvas.Brush:TBrush
 0045C093    mov        edx,dword ptr [ebx+60]; TLrsBmp.FColor:TColor
 0045C096    call       TBrush.SetColor
 0045C09B    lea        eax,[ebp-20]
 0045C09E    push       eax
 0045C09F    mov        eax,dword ptr [ebx+134]; TLrsBmp.TransparentColor:TColor
 0045C0A5    push       eax
 0045C0A6    mov        eax,esi
 0045C0A8    call       TBitmap.GetCanvas
 0045C0AD    lea        edx,[ebp-10]
 0045C0B0    mov        ecx,dword ptr [ebx+130]; TLrsBmp.BitMap:TBitmap
 0045C0B6    call       TCanvas.BrushCopy
 0045C0BB    cmp        byte ptr [ebx+138],0; TLrsBmp.Stretch:Boolean
>0045C0C2    je         0045C0D6
 0045C0C4    lea        edx,[ebp-20]
 0045C0C7    mov        ecx,esi
 0045C0C9    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C0CF    call       TCanvas.StretchDraw
>0045C0D4    jmp        0045C0F1
 0045C0D6    lea        eax,[ebp-10]
 0045C0D9    push       eax
 0045C0DA    mov        eax,esi
 0045C0DC    call       TBitmap.GetCanvas
 0045C0E1    mov        ecx,eax
 0045C0E3    lea        edx,[ebp-10]
 0045C0E6    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C0EC    call       TCanvas.CopyRect
 0045C0F1    mov        eax,esi
 0045C0F3    call       TObject.Free
>0045C0F8    jmp        0045C165
 0045C0FA    cmp        byte ptr [ebx+138],0; TLrsBmp.Stretch:Boolean
>0045C101    je         0045C119
 0045C103    lea        edx,[ebp-20]
 0045C106    mov        ecx,dword ptr [ebx+130]; TLrsBmp.BitMap:TBitmap
 0045C10C    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C112    call       TCanvas.StretchDraw
>0045C117    jmp        0045C165
 0045C119    lea        eax,[ebp-20]
 0045C11C    push       eax
 0045C11D    mov        eax,dword ptr [ebx+130]; TLrsBmp.BitMap:TBitmap
 0045C123    call       TBitmap.GetCanvas
 0045C128    mov        ecx,eax
 0045C12A    lea        edx,[ebp-10]
 0045C12D    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C133    call       TCanvas.CopyRect
>0045C138    jmp        0045C165
 0045C13A    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C140    mov        eax,dword ptr [eax+14]; TCanvas.Brush:TBrush
 0045C143    mov        edx,0FFFFFF
 0045C148    call       TBrush.SetColor
 0045C14D    lea        edx,[ebp-30]
 0045C150    mov        eax,ebx
 0045C152    call       TControl.GetBoundsRect
 0045C157    lea        edx,[ebp-30]
 0045C15A    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C160    call       TCanvas.FillRect
 0045C165    test       byte ptr [ebx+20],10; TLrsBmp.FComponentState:TComponentState
>0045C169    je         0045C1A2
 0045C16B    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C171    mov        eax,dword ptr [eax+10]; TCanvas.Pen:TPen
 0045C174    mov        dl,1
 0045C176    call       TPen.SetStyle
 0045C17B    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C181    mov        eax,dword ptr [eax+14]; TCanvas.Brush:TBrush
 0045C184    mov        dl,1
 0045C186    call       TBrush.SetStyle
 0045C18B    mov        eax,dword ptr [ebx+38]; TLrsBmp.Width:Integer
 0045C18E    push       eax
 0045C18F    mov        eax,dword ptr [ebx+3C]; TLrsBmp.Height:Integer
 0045C192    push       eax
 0045C193    xor        ecx,ecx
 0045C195    xor        edx,edx
 0045C197    mov        eax,dword ptr [ebx+120]; TLrsBmp.FCanvas:TCanvas
 0045C19D    call       TCanvas.Rectangle
 0045C1A2    pop        esi
 0045C1A3    pop        ebx
 0045C1A4    mov        esp,ebp
 0045C1A6    pop        ebp
 0045C1A7    ret
*}
end;

end.