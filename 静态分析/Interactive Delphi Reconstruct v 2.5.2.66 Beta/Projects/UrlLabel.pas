{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit UrlLabel;

interface

uses
  Classes, Windows, Graphics, StdCtrls, Menus, Messages;

type
  TUrlLabel = class(TLabel)
  public
    f138:String;//f138
    f13C:TColor;//f13C
    ActiveColor:TColor;//f140
    f144:TPopupMenu;//f144
    f148:TMenuItem;//f148
    destructor Destroy; virtual;
    constructor Create(AOwner:TComponent); virtual;
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;
    procedure Click; dynamic;
  end;

implementation

{$R *.DFM}

//0045B420
constructor TUrlLabel.Create(AOwner:TComponent);
begin
{*
 0045B420    push       ebp
 0045B421    mov        ebp,esp
 0045B423    push       ecx
 0045B424    push       ebx
 0045B425    push       esi
 0045B426    push       edi
 0045B427    test       dl,dl
>0045B429    je         0045B433
 0045B42B    add        esp,0FFFFFFF0
 0045B42E    call       @ClassCreate
 0045B433    mov        byte ptr [ebp-1],dl
 0045B436    mov        ebx,eax
 0045B438    xor        edx,edx
 0045B43A    mov        eax,ebx
 0045B43C    call       TCustomLabel.Create
 0045B441    push       45B520; 'HAND'
 0045B446    mov        eax,[0046D4DC]; HInstance:HINST
 0045B44B    push       eax
 0045B44C    call       user32.LoadCursorA
 0045B451    mov        ecx,eax
 0045B453    mov        eax,[0046C190]; ^Screen:TScreen
 0045B458    mov        eax,dword ptr [eax]
 0045B45A    mov        edx,5
 0045B45F    call       TScreen.SetCursors
 0045B464    mov        dx,5
 0045B468    mov        eax,ebx
 0045B46A    call       TControl.SetCursor
 0045B46F    mov        dword ptr [ebx+140],800080; TUrlLabel.ActiveColor:TColor
 0045B479    mov        esi,dword ptr [ebx+58]; TUrlLabel.FFont:TFont
 0045B47C    mov        edx,0FF0000
 0045B481    mov        eax,esi
 0045B483    call       TFont.SetColor
 0045B488    mov        dl,byte ptr ds:[45B528]; 0x4
 0045B48E    mov        eax,esi
 0045B490    call       TFont.SetStyle
 0045B495    mov        ecx,ebx
 0045B497    mov        dl,1
 0045B499    mov        eax,[004384A0]; TPopupMenu
 0045B49E    call       TPopupMenu.Create; TPopupMenu.Create
 0045B4A3    mov        esi,eax
 0045B4A5    mov        dword ptr [ebx+144],esi; TUrlLabel.?f144:TPopupMenu
 0045B4AB    mov        ecx,esi
 0045B4AD    mov        dl,1
 0045B4AF    mov        eax,[00437CD8]; TMenuItem
 0045B4B4    call       TMenuItem.Create; TMenuItem.Create
 0045B4B9    mov        edi,eax
 0045B4BB    mov        dword ptr [ebx+148],edi; TUrlLabel.?f148:TMenuItem
 0045B4C1    mov        esi,edi
 0045B4C3    mov        edx,45B534; 'Copy'
 0045B4C8    mov        eax,esi
 0045B4CA    call       TMenuItem.SetCaption
 0045B4CF    mov        dword ptr [esi+84],ebx; TMenuItem.?f84:TUrlLabel
 0045B4D5    mov        dword ptr [esi+80],45B670; TMenuItem.OnClick:TNotifyEvent sub_0045B670
 0045B4DF    mov        eax,dword ptr [ebx+144]; TUrlLabel.?f144:TPopupMenu
 0045B4E5    mov        eax,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 0045B4E8    mov        edx,dword ptr [ebx+148]; TUrlLabel.?f148:TMenuItem
 0045B4EE    call       TMenuItem.Add
 0045B4F3    mov        edx,dword ptr [ebx+144]; TUrlLabel.?f144:TPopupMenu
 0045B4F9    mov        eax,ebx
 0045B4FB    call       TControl.SetPopupMenu
 0045B500    mov        eax,ebx
 0045B502    cmp        byte ptr [ebp-1],0
>0045B506    je         0045B517
 0045B508    call       @AfterConstruction
 0045B50D    pop        dword ptr fs:[0]
 0045B514    add        esp,0C
 0045B517    mov        eax,ebx
 0045B519    pop        edi
 0045B51A    pop        esi
 0045B51B    pop        ebx
 0045B51C    pop        ecx
 0045B51D    pop        ebp
 0045B51E    ret
*}
end;

//0045B53C
procedure TUrlLabel.Click;
begin
{*
 0045B53C    push       ebp
 0045B53D    mov        ebp,esp
 0045B53F    push       0
 0045B541    push       0
 0045B543    push       0
 0045B545    push       ebx
 0045B546    mov        ebx,eax
 0045B548    xor        eax,eax
 0045B54A    push       ebp
 0045B54B    push       45B5D6
 0045B550    push       dword ptr fs:[eax]
 0045B553    mov        dword ptr fs:[eax],esp
 0045B556    mov        eax,ebx
 0045B558    call       TControl.Click
 0045B55D    lea        edx,[ebp-8]
 0045B560    mov        eax,dword ptr [ebx+138]; TUrlLabel.?f138:String
 0045B566    call       Trim
 0045B56B    cmp        dword ptr [ebp-8],0
>0045B56F    jne        0045B57D
 0045B571    lea        edx,[ebp-4]
 0045B574    mov        eax,ebx
 0045B576    call       TControl.GetText
>0045B57B    jmp        0045B58B
 0045B57D    lea        eax,[ebp-4]
 0045B580    mov        edx,dword ptr [ebx+138]; TUrlLabel.?f138:String
 0045B586    call       @LStrLAsg
 0045B58B    lea        edx,[ebp-0C]
 0045B58E    mov        eax,dword ptr [ebp-4]
 0045B591    call       Trim
 0045B596    cmp        dword ptr [ebp-0C],0
>0045B59A    je         0045B5BB
 0045B59C    push       1
 0045B59E    push       0
 0045B5A0    push       0
 0045B5A2    mov        eax,dword ptr [ebp-4]
 0045B5A5    call       @LStrToPChar
 0045B5AA    push       eax
 0045B5AB    push       45B5E4
 0045B5B0    call       user32.GetDesktopWindow
 0045B5B5    push       eax
 0045B5B6    call       shell32.ShellExecuteA
 0045B5BB    xor        eax,eax
 0045B5BD    pop        edx
 0045B5BE    pop        ecx
 0045B5BF    pop        ecx
 0045B5C0    mov        dword ptr fs:[eax],edx
 0045B5C3    push       45B5DD
 0045B5C8    lea        eax,[ebp-0C]
 0045B5CB    mov        edx,3
 0045B5D0    call       @LStrArrayClr
 0045B5D5    ret
<0045B5D6    jmp        @HandleFinally
<0045B5DB    jmp        0045B5C8
 0045B5DD    pop        ebx
 0045B5DE    mov        esp,ebp
 0045B5E0    pop        ebp
 0045B5E1    ret
*}
end;

//0045B5EC
procedure TUrlLabel.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0045B5EC    push       ebp
 0045B5ED    mov        ebp,esp
 0045B5EF    push       ecx
 0045B5F0    push       ebx
 0045B5F1    push       esi
 0045B5F2    mov        byte ptr [ebp-1],cl
 0045B5F5    mov        ebx,edx
 0045B5F7    mov        esi,eax
 0045B5F9    test       bl,bl
>0045B5FB    jne        0045B617
 0045B5FD    mov        eax,dword ptr [esi+58]; TUrlLabel.FFont:TFont
 0045B600    mov        eax,dword ptr [eax+18]; TFont.Color:TColor
 0045B603    mov        dword ptr [esi+13C],eax; TUrlLabel.?f13C:TColor
 0045B609    mov        edx,dword ptr [esi+140]; TUrlLabel.ActiveColor:TColor
 0045B60F    mov        eax,dword ptr [esi+58]; TUrlLabel.FFont:TFont
 0045B612    call       TFont.SetColor
 0045B617    mov        eax,dword ptr [ebp+0C]
 0045B61A    push       eax
 0045B61B    mov        eax,dword ptr [ebp+8]
 0045B61E    push       eax
 0045B61F    mov        cl,byte ptr [ebp-1]
 0045B622    mov        edx,ebx
 0045B624    mov        eax,esi
 0045B626    call       TControl.MouseDown
 0045B62B    pop        esi
 0045B62C    pop        ebx
 0045B62D    pop        ecx
 0045B62E    pop        ebp
 0045B62F    ret        8
*}
end;

//0045B634
procedure TUrlLabel.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0045B634    push       ebp
 0045B635    mov        ebp,esp
 0045B637    push       ecx
 0045B638    push       ebx
 0045B639    push       esi
 0045B63A    mov        byte ptr [ebp-1],cl
 0045B63D    mov        ebx,edx
 0045B63F    mov        esi,eax
 0045B641    test       bl,bl
>0045B643    jne        0045B653
 0045B645    mov        edx,dword ptr [esi+13C]; TUrlLabel.?f13C:TColor
 0045B64B    mov        eax,dword ptr [esi+58]; TUrlLabel.FFont:TFont
 0045B64E    call       TFont.SetColor
 0045B653    mov        eax,dword ptr [ebp+0C]
 0045B656    push       eax
 0045B657    mov        eax,dword ptr [ebp+8]
 0045B65A    push       eax
 0045B65B    mov        cl,byte ptr [ebp-1]
 0045B65E    mov        edx,ebx
 0045B660    mov        eax,esi
 0045B662    call       TControl.MouseUp
 0045B667    pop        esi
 0045B668    pop        ebx
 0045B669    pop        ecx
 0045B66A    pop        ebp
 0045B66B    ret        8
*}
end;

//0045B670
//procedure sub_0045B670(?:?);
//begin
{*
 0045B670    push       ebp
 0045B671    mov        ebp,esp
 0045B673    push       0
 0045B675    push       ebx
 0045B676    mov        ebx,eax
 0045B678    xor        eax,eax
 0045B67A    push       ebp
 0045B67B    push       45B6B5
 0045B680    push       dword ptr fs:[eax]
 0045B683    mov        dword ptr fs:[eax],esp
 0045B686    lea        edx,[ebp-4]
 0045B689    mov        eax,ebx
 0045B68B    call       TControl.GetText
 0045B690    mov        eax,dword ptr [ebp-4]
 0045B693    push       eax
 0045B694    call       Clipboard
 0045B699    pop        edx
 0045B69A    call       TClipboard.SetAsText
 0045B69F    xor        eax,eax
 0045B6A1    pop        edx
 0045B6A2    pop        ecx
 0045B6A3    pop        ecx
 0045B6A4    mov        dword ptr fs:[eax],edx
 0045B6A7    push       45B6BC
 0045B6AC    lea        eax,[ebp-4]
 0045B6AF    call       @LStrClr
 0045B6B4    ret
<0045B6B5    jmp        @HandleFinally
<0045B6BA    jmp        0045B6AC
 0045B6BC    pop        ebx
 0045B6BD    pop        ecx
 0045B6BE    pop        ebp
 0045B6BF    ret
*}
//end;

//0045B6C0
destructor TUrlLabel.Destroy;
begin
{*
 0045B6C0    push       ebp
 0045B6C1    mov        ebp,esp
 0045B6C3    push       ebx
 0045B6C4    push       esi
 0045B6C5    call       @BeforeDestruction
 0045B6CA    mov        ebx,edx
 0045B6CC    mov        esi,eax
 0045B6CE    mov        eax,dword ptr [esi+144]; TUrlLabel.?f144:TPopupMenu
 0045B6D4    call       TObject.Free
 0045B6D9    mov        edx,ebx
 0045B6DB    and        dl,0FC
 0045B6DE    mov        eax,esi
 0045B6E0    call       TGraphicControl.Destroy
 0045B6E5    test       bl,bl
>0045B6E7    jle        0045B6F0
 0045B6E9    mov        eax,esi
 0045B6EB    call       @ClassDestroy
 0045B6F0    pop        esi
 0045B6F1    pop        ebx
 0045B6F2    pop        ebp
 0045B6F3    ret
*}
end;

end.