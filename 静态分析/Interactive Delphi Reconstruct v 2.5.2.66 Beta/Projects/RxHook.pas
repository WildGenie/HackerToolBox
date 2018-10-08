{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit RxHook;

interface

uses
  Classes, Windows, Graphics, Placemnt, Messages;

type
  THookMessageEvent = procedure(Sender:TObject; var Msg:TMessage; var Handled:Boolean) of object;
  TRxWindowHook = class(TComponent)
  public
    Active:Boolean;//f24
    f28:dword;//f28
    f2C:TControlHook;//f2C
    BeforeMessage:THookMessageEvent;//f30
    f32:word;//f32
    f34:dword;//f34
    AfterMessage:THookMessageEvent;//f38
    f3A:word;//f3A
    f3C:TFormPlacement;//f3C
    destructor Destroy; virtual;
    procedure DefineProperties(Filer:TFiler); virtual;
    function Notification(AComponent:TComponent; Operation:TOperation):dword; virtual;
    constructor Create(AOwner:TComponent); virtual;
    //procedure sub_0045018C(?:?); dynamic;
    //procedure sub_00450174(?:?); dynamic;
  end;
  TControlHook = class(TObject)
  public
    f4:dword;//f4
    f8:Pointer;//f8
    fC:Longint;//fC
    f10:TList;//f10
    f14:byte;//f14
    destructor Destroy; virtual;
    //constructor Create(?:TControlHook; _Dv__:Boolean);
  end;
  THookList = class(TList)
  public
    f10:HWND;//f10
    destructor Destroy; virtual;
    //constructor Create(?:THookList; _Dv__:Boolean);
  end;

implementation

{$R *.DFM}

//0044F8C8
function sub_0044F8C8:THookList;
begin
{*
 0044F8C8    cmp        dword ptr ds:[46D848],0; gvar_0046D848:THookList
>0044F8CF    jne        0044F8E2
 0044F8D1    mov        dl,1
 0044F8D3    mov        eax,[0044F860]; THookList
 0044F8D8    call       THookList.Create; THookList.Create
 0044F8DD    mov        [0046D848],eax; gvar_0046D848:THookList
 0044F8E2    mov        eax,[0046D848]; gvar_0046D848:THookList
 0044F8E7    ret
*}
end;

//0044F8E8
procedure sub_0044F8E8;
begin
{*
 0044F8E8    mov        eax,[0046D848]; gvar_0046D848:THookList
 0044F8ED    call       TObject.Free
 0044F8F2    xor        eax,eax
 0044F8F4    mov        [0046D848],eax; gvar_0046D848:THookList
 0044F8F9    ret
*}
end;

//0044F8FC
//constructor TControlHook.Create(?:TControlHook; _Dv__:Boolean);
//begin
{*
 0044F8FC    push       ebx
 0044F8FD    push       esi
 0044F8FE    test       dl,dl
>0044F900    je         0044F90A
 0044F902    add        esp,0FFFFFFF0
 0044F905    call       @ClassCreate
 0044F90A    mov        ebx,edx
 0044F90C    mov        esi,eax
 0044F90E    xor        edx,edx
 0044F910    mov        eax,esi
 0044F912    call       TObject.Create
 0044F917    mov        dl,1
 0044F919    mov        eax,[0040EBFC]; TList
 0044F91E    call       TObject.Create; TList.Create
 0044F923    mov        dword ptr [esi+10],eax; TControlHook.?f10:TList
 0044F926    push       esi
 0044F927    push       44FBDC; sub_0044FBDC
 0044F92C    call       MakeObjectInstance
 0044F931    mov        dword ptr [esi+8],eax; TControlHook.?f8:Pointer
 0044F934    xor        eax,eax
 0044F936    mov        dword ptr [esi+0C],eax; TControlHook.?fC:Longint
 0044F939    xor        eax,eax
 0044F93B    mov        dword ptr [esi+4],eax; TControlHook.?f4:dword
 0044F93E    mov        eax,esi
 0044F940    test       bl,bl
>0044F942    je         0044F953
 0044F944    call       @AfterConstruction
 0044F949    pop        dword ptr fs:[0]
 0044F950    add        esp,0C
 0044F953    mov        eax,esi
 0044F955    pop        esi
 0044F956    pop        ebx
 0044F957    ret
*}
//end;

//0044F958
destructor TControlHook.Destroy;
begin
{*
 0044F958    push       ebx
 0044F959    push       esi
 0044F95A    push       edi
 0044F95B    call       @BeforeDestruction
 0044F960    mov        ebx,edx
 0044F962    mov        edi,eax
 0044F964    mov        byte ptr [edi+14],1; TControlHook.?f14:byte
 0044F968    cmp        dword ptr ds:[46D848],0; gvar_0046D848:THookList
>0044F96F    je         0044F99F
 0044F971    mov        edx,edi
 0044F973    mov        eax,[0046D848]; gvar_0046D848:THookList
 0044F978    call       TList.IndexOf
 0044F97D    test       eax,eax
>0044F97F    jl         0044F99F
 0044F981    mov        edx,edi
 0044F983    mov        eax,[0046D848]; gvar_0046D848:THookList
 0044F988    call       TList.Remove
>0044F98D    jmp        0044F99F
 0044F98F    mov        eax,esi
 0044F991    call       TList.Last
 0044F996    mov        edx,eax
 0044F998    mov        eax,edi
 0044F99A    call       0044FA18
 0044F99F    mov        esi,dword ptr [edi+10]; TControlHook.?f10:TList
 0044F9A2    cmp        dword ptr [esi+8],0; TList.FCount:Integer
<0044F9A6    jg         0044F98F
 0044F9A8    xor        eax,eax
 0044F9AA    mov        dword ptr [edi+4],eax; TControlHook.?f4:dword
 0044F9AD    mov        eax,dword ptr [edi+10]; TControlHook.?f10:TList
 0044F9B0    call       TObject.Free
 0044F9B5    mov        eax,dword ptr [edi+8]; TControlHook.?f8:Pointer
 0044F9B8    call       FreeObjectInstance
 0044F9BD    xor        eax,eax
 0044F9BF    mov        dword ptr [edi+8],eax; TControlHook.?f8:Pointer
 0044F9C2    mov        edx,ebx
 0044F9C4    and        dl,0FC
 0044F9C7    mov        eax,edi
 0044F9C9    call       TObject.Destroy
 0044F9CE    test       bl,bl
>0044F9D0    jle        0044F9D9
 0044F9D2    mov        eax,edi
 0044F9D4    call       @ClassDestroy
 0044F9D9    pop        edi
 0044F9DA    pop        esi
 0044F9DB    pop        ebx
 0044F9DC    ret
*}
end;

//0044F9E0
//function sub_0044F9E0(?:TControlHook; ?:TRxWindowHook):TControlHook;
//begin
{*
 0044F9E0    push       ebx
 0044F9E1    push       esi
 0044F9E2    mov        esi,edx
 0044F9E4    mov        ebx,eax
 0044F9E6    mov        edx,esi
 0044F9E8    mov        eax,dword ptr [ebx+10]; TControlHook.?f10:TList
 0044F9EB    call       TList.IndexOf
 0044F9F0    test       eax,eax
>0044F9F2    jge        0044FA0B
 0044F9F4    mov        edx,esi
 0044F9F6    mov        eax,dword ptr [ebx+10]; TControlHook.?f10:TList
 0044F9F9    call       TList.Add
 0044F9FE    mov        dword ptr [esi+2C],ebx; TRxWindowHook.?f2C:TControlHook
 0044FA01    mov        edx,dword ptr [esi+28]; TRxWindowHook.?f28:dword
 0044FA04    mov        eax,ebx
 0044FA06    call       0044FD14
 0044FA0B    mov        eax,ebx
 0044FA0D    call       0044FB38
 0044FA12    pop        esi
 0044FA13    pop        ebx
 0044FA14    ret
*}
//end;

//0044FA18
//function sub_0044FA18(?:TControlHook; ?:Pointer):TList;
//begin
{*
 0044FA18    push       ebx
 0044FA19    mov        ebx,eax
 0044FA1B    xor        eax,eax
 0044FA1D    mov        dword ptr [edx+2C],eax
 0044FA20    mov        eax,dword ptr [ebx+10]; TControlHook.?f10:TList
 0044FA23    call       TList.Remove
 0044FA28    mov        eax,dword ptr [ebx+10]; TControlHook.?f10:TList
 0044FA2B    cmp        dword ptr [eax+8],0; TList.FCount:Integer
>0044FA2F    jne        0044FA38
 0044FA31    mov        eax,ebx
 0044FA33    call       0044FB90
 0044FA38    pop        ebx
 0044FA39    ret
*}
//end;

//0044FA3C
//procedure sub_0044FA3C(?:?; ?:?; ?:?; ?:?);
//begin
{*
 0044FA3C    push       ebp
 0044FA3D    mov        ebp,esp
 0044FA3F    add        esp,0FFFFFFF0
 0044FA42    push       ebx
 0044FA43    push       esi
 0044FA44    push       edi
 0044FA45    mov        dword ptr [ebp-0C],ecx
 0044FA48    mov        dword ptr [ebp-8],edx
 0044FA4B    mov        dword ptr [ebp-4],eax
 0044FA4E    mov        eax,dword ptr [ebp-4]
 0044FA51    mov        eax,dword ptr [eax+10]
 0044FA54    cmp        dword ptr [eax+8],0
>0044FA58    jle        0044FB2C
 0044FA5E    mov        eax,dword ptr [ebp-4]
 0044FA61    cmp        dword ptr [eax+4],0
>0044FA65    je         0044FB2C
 0044FA6B    mov        eax,dword ptr [ebp-4]
 0044FA6E    cmp        byte ptr [eax+14],0
>0044FA72    jne        0044FB2C
 0044FA78    mov        eax,dword ptr [ebp-4]
 0044FA7B    mov        eax,dword ptr [eax+4]
 0044FA7E    test       byte ptr [eax+20],8
>0044FA82    jne        0044FB2C
 0044FA88    mov        eax,dword ptr [ebp-4]
 0044FA8B    mov        eax,dword ptr [eax+10]
 0044FA8E    mov        eax,dword ptr [eax+8]
 0044FA91    dec        eax
 0044FA92    cmp        eax,0
>0044FA95    jl         0044FB2C
 0044FA9B    mov        dword ptr [ebp-10],eax
 0044FA9E    xor        eax,eax
 0044FAA0    push       ebp
 0044FAA1    push       44FAFE
 0044FAA6    push       dword ptr fs:[eax]
 0044FAA9    mov        dword ptr fs:[eax],esp
 0044FAAC    cmp        dword ptr [ebp-8],0
>0044FAB0    jne        0044FAD1
 0044FAB2    mov        eax,dword ptr [ebp-4]
 0044FAB5    mov        eax,dword ptr [eax+10]
 0044FAB8    mov        edx,dword ptr [ebp-10]
 0044FABB    call       TList.Get
 0044FAC0    mov        ecx,dword ptr [ebp+8]
 0044FAC3    mov        edx,dword ptr [ebp-0C]
 0044FAC6    mov        bx,0FFEF
 0044FACA    call       @CallDynaInst
>0044FACF    jmp        0044FAF4
 0044FAD1    cmp        dword ptr [ebp-8],1
>0044FAD5    jne        0044FAF4
 0044FAD7    mov        eax,dword ptr [ebp-4]
 0044FADA    mov        eax,dword ptr [eax+10]
 0044FADD    mov        edx,dword ptr [ebp-10]
 0044FAE0    call       TList.Get
 0044FAE5    mov        ecx,dword ptr [ebp+8]
 0044FAE8    mov        edx,dword ptr [ebp-0C]
 0044FAEB    mov        bx,0FFF0
 0044FAEF    call       @CallDynaInst
 0044FAF4    xor        eax,eax
 0044FAF6    pop        edx
 0044FAF7    pop        ecx
 0044FAF8    pop        ecx
 0044FAF9    mov        dword ptr fs:[eax],edx
>0044FAFC    jmp        0044FB17
<0044FAFE    jmp        @HandleAnyException
 0044FB03    mov        eax,[0046C05C]; ^Application:TApplication
 0044FB08    mov        eax,dword ptr [eax]
 0044FB0A    mov        edx,dword ptr [ebp-4]
 0044FB0D    call       TApplication.HandleException
 0044FB12    call       @DoneExcept
 0044FB17    mov        eax,dword ptr [ebp+8]
 0044FB1A    cmp        byte ptr [eax],0
>0044FB1D    jne        0044FB2C
 0044FB1F    dec        dword ptr [ebp-10]
 0044FB22    cmp        dword ptr [ebp-10],0FFFFFFFF
<0044FB26    jne        0044FA9E
 0044FB2C    pop        edi
 0044FB2D    pop        esi
 0044FB2E    pop        ebx
 0044FB2F    mov        esp,ebp
 0044FB31    pop        ebp
 0044FB32    ret        4
*}
//end;

//0044FB38
//function sub_0044FB38(?:TControlHook):TControlHook;
//begin
{*
 0044FB38    push       ebx
 0044FB39    mov        ebx,eax
 0044FB3B    cmp        dword ptr [ebx+4],0; TControlHook.?f4:dword
>0044FB3F    je         0044FB8D
 0044FB41    mov        eax,dword ptr [ebx+4]; TControlHook.?f4:dword
 0044FB44    test       byte ptr [eax+20],10
>0044FB48    jne        0044FB8D
 0044FB4A    mov        eax,dword ptr [ebx+4]; TControlHook.?f4:dword
 0044FB4D    test       byte ptr [eax+20],8
>0044FB51    jne        0044FB8D
 0044FB53    cmp        byte ptr [ebx+14],0; TControlHook.?f14:byte
>0044FB57    jne        0044FB8D
 0044FB59    mov        eax,dword ptr [ebx+4]; TControlHook.?f4:dword
 0044FB5C    call       TWinControl.HandleNeeded
 0044FB61    push       0FC
 0044FB63    mov        eax,dword ptr [ebx+4]; TControlHook.?f4:dword
 0044FB66    call       TWinControl.GetHandle
 0044FB6B    push       eax
 0044FB6C    call       user32.GetWindowLongA
 0044FB71    cmp        eax,dword ptr [ebx+8]; TControlHook.?f8:Pointer
>0044FB74    je         0044FB8D
 0044FB76    mov        dword ptr [ebx+0C],eax; TControlHook.?fC:Longint
 0044FB79    mov        eax,dword ptr [ebx+8]; TControlHook.?f8:Pointer
 0044FB7C    push       eax
 0044FB7D    push       0FC
 0044FB7F    mov        eax,dword ptr [ebx+4]; TControlHook.?f4:dword
 0044FB82    call       TWinControl.GetHandle
 0044FB87    push       eax
 0044FB88    call       user32.SetWindowLongA
 0044FB8D    pop        ebx
 0044FB8E    ret
*}
//end;

//0044FB90
//procedure sub_0044FB90(?:TControlHook);
//begin
{*
 0044FB90    push       ebx
 0044FB91    mov        ebx,eax
 0044FB93    cmp        dword ptr [ebx+4],0; TControlHook.?f4:dword
>0044FB97    je         0044FBD4
 0044FB99    cmp        dword ptr [ebx+0C],0; TControlHook.?fC:Longint
>0044FB9D    je         0044FBD4
 0044FB9F    mov        eax,dword ptr [ebx+4]; TControlHook.?f4:dword
 0044FBA2    call       TWinControl.HandleAllocated
 0044FBA7    test       al,al
>0044FBA9    je         0044FBD4
 0044FBAB    push       0FC
 0044FBAD    mov        eax,dword ptr [ebx+4]; TControlHook.?f4:dword
 0044FBB0    call       TWinControl.GetHandle
 0044FBB5    push       eax
 0044FBB6    call       user32.GetWindowLongA
 0044FBBB    cmp        eax,dword ptr [ebx+8]; TControlHook.?f8:Pointer
>0044FBBE    jne        0044FBD4
 0044FBC0    mov        eax,dword ptr [ebx+0C]; TControlHook.?fC:Longint
 0044FBC3    push       eax
 0044FBC4    push       0FC
 0044FBC6    mov        eax,dword ptr [ebx+4]; TControlHook.?f4:dword
 0044FBC9    call       TWinControl.GetHandle
 0044FBCE    push       eax
 0044FBCF    call       user32.SetWindowLongA
 0044FBD4    xor        eax,eax
 0044FBD6    mov        dword ptr [ebx+0C],eax; TControlHook.?fC:Longint
 0044FBD9    pop        ebx
 0044FBDA    ret
*}
//end;

//0044FBDC
//procedure sub_0044FBDC(?:?; ?:?);
//begin
{*
 0044FBDC    push       ebp
 0044FBDD    mov        ebp,esp
 0044FBDF    add        esp,0FFFFFFF4
 0044FBE2    push       ebx
 0044FBE3    mov        dword ptr [ebp-8],edx
 0044FBE6    mov        dword ptr [ebp-4],eax
 0044FBE9    mov        byte ptr [ebp-9],0
 0044FBED    mov        eax,dword ptr [ebp-4]
 0044FBF0    cmp        dword ptr [eax+4],0
>0044FBF4    je         0044FD0F
 0044FBFA    mov        eax,dword ptr [ebp-8]
 0044FBFD    cmp        dword ptr [eax],12
>0044FC00    je         0044FC13
 0044FC02    lea        eax,[ebp-9]
 0044FC05    push       eax
 0044FC06    mov        ecx,dword ptr [ebp-8]
 0044FC09    xor        edx,edx
 0044FC0B    mov        eax,dword ptr [ebp-4]
 0044FC0E    call       0044FA3C
 0044FC13    cmp        byte ptr [ebp-9],0
>0044FC17    je         0044FC25
 0044FC19    mov        eax,dword ptr [ebp-8]
 0044FC1C    cmp        dword ptr [eax],2
>0044FC1F    jne        0044FCC8
 0044FC25    xor        eax,eax
 0044FC27    push       ebp
 0044FC28    push       44FCC1
 0044FC2D    push       dword ptr fs:[eax]
 0044FC30    mov        dword ptr fs:[eax],esp
 0044FC33    mov        eax,dword ptr [ebp-4]
 0044FC36    mov        ebx,dword ptr [eax+0C]
 0044FC39    test       ebx,ebx
>0044FC3B    je         0044FC6B
 0044FC3D    mov        eax,dword ptr [ebp-8]
 0044FC40    mov        eax,dword ptr [eax+8]
 0044FC43    push       eax
 0044FC44    mov        eax,dword ptr [ebp-8]
 0044FC47    mov        eax,dword ptr [eax+4]
 0044FC4A    push       eax
 0044FC4B    mov        eax,dword ptr [ebp-8]
 0044FC4E    mov        eax,dword ptr [eax]
 0044FC50    push       eax
 0044FC51    mov        eax,dword ptr [ebp-4]
 0044FC54    mov        eax,dword ptr [eax+4]
 0044FC57    call       TWinControl.GetHandle
 0044FC5C    push       eax
 0044FC5D    push       ebx
 0044FC5E    call       user32.CallWindowProcA
 0044FC63    mov        edx,dword ptr [ebp-8]
 0044FC66    mov        dword ptr [edx+0C],eax
>0044FC69    jmp        0044FC9F
 0044FC6B    mov        eax,dword ptr [ebp-8]
 0044FC6E    mov        eax,dword ptr [eax+8]
 0044FC71    push       eax
 0044FC72    mov        eax,dword ptr [ebp-8]
 0044FC75    mov        eax,dword ptr [eax+4]
 0044FC78    push       eax
 0044FC79    mov        eax,dword ptr [ebp-8]
 0044FC7C    mov        eax,dword ptr [eax]
 0044FC7E    push       eax
 0044FC7F    mov        eax,dword ptr [ebp-4]
 0044FC82    mov        ebx,dword ptr [eax+4]
 0044FC85    mov        eax,ebx
 0044FC87    call       TWinControl.GetHandle
 0044FC8C    push       eax
 0044FC8D    mov        eax,dword ptr [ebx+13C]
 0044FC93    push       eax
 0044FC94    call       user32.CallWindowProcA
 0044FC99    mov        edx,dword ptr [ebp-8]
 0044FC9C    mov        dword ptr [edx+0C],eax
 0044FC9F    xor        eax,eax
 0044FCA1    pop        edx
 0044FCA2    pop        ecx
 0044FCA3    pop        ecx
 0044FCA4    mov        dword ptr fs:[eax],edx
 0044FCA7    push       44FCC8
 0044FCAC    lea        eax,[ebp-9]
 0044FCAF    push       eax
 0044FCB0    mov        ecx,dword ptr [ebp-8]
 0044FCB3    mov        edx,1
 0044FCB8    mov        eax,dword ptr [ebp-4]
 0044FCBB    call       0044FA3C
 0044FCC0    ret
<0044FCC1    jmp        @HandleFinally
<0044FCC6    jmp        0044FCAC
 0044FCC8    mov        eax,dword ptr [ebp-8]
 0044FCCB    cmp        dword ptr [eax],2
>0044FCCE    jne        0044FD0F
 0044FCD0    mov        eax,dword ptr [ebp-4]
 0044FCD3    call       0044FB90
 0044FCD8    cmp        dword ptr ds:[46D848],0; gvar_0046D848:THookList
>0044FCDF    je         0044FD0F
 0044FCE1    mov        eax,dword ptr [ebp-4]
 0044FCE4    cmp        byte ptr [eax+14],0
>0044FCE8    jne        0044FD0F
 0044FCEA    mov        eax,dword ptr [ebp-4]
 0044FCED    mov        eax,dword ptr [eax+4]
 0044FCF0    test       byte ptr [eax+20],8
>0044FCF4    jne        0044FD0F
 0044FCF6    mov        eax,dword ptr [ebp-4]
 0044FCF9    push       eax
 0044FCFA    push       0
 0044FCFC    push       0B052
 0044FD01    mov        eax,[0046D848]; gvar_0046D848:THookList
 0044FD06    mov        eax,dword ptr [eax+10]; THookList.?f10:HWND
 0044FD09    push       eax
 0044FD0A    call       user32.PostMessageA
 0044FD0F    pop        ebx
 0044FD10    mov        esp,ebp
 0044FD12    pop        ebp
 0044FD13    ret
*}
//end;

//0044FD14
//function sub_0044FD14(?:TControlHook; ?:dword):TControlHook;
//begin
{*
 0044FD14    push       ebx
 0044FD15    push       esi
 0044FD16    mov        esi,edx
 0044FD18    mov        ebx,eax
 0044FD1A    cmp        esi,dword ptr [ebx+4]; TControlHook.?f4:dword
>0044FD1D    je         0044FD39
 0044FD1F    mov        eax,ebx
 0044FD21    call       0044FB90
 0044FD26    mov        dword ptr [ebx+4],esi; TControlHook.?f4:dword
 0044FD29    mov        eax,dword ptr [ebx+10]; TControlHook.?f10:TList
 0044FD2C    cmp        dword ptr [eax+8],0; TList.FCount:Integer
>0044FD30    jle        0044FD39
 0044FD32    mov        eax,ebx
 0044FD34    call       0044FB38
 0044FD39    pop        esi
 0044FD3A    pop        ebx
 0044FD3B    ret
*}
//end;

//0044FD3C
//constructor THookList.Create(?:THookList; _Dv__:Boolean);
//begin
{*
 0044FD3C    push       ebx
 0044FD3D    push       esi
 0044FD3E    test       dl,dl
>0044FD40    je         0044FD4A
 0044FD42    add        esp,0FFFFFFF0
 0044FD45    call       @ClassCreate
 0044FD4A    mov        ebx,edx
 0044FD4C    mov        esi,eax
 0044FD4E    xor        edx,edx
 0044FD50    mov        eax,esi
 0044FD52    call       TObject.Create
 0044FD57    push       esi
 0044FD58    push       44FDC4; sub_0044FDC4
 0044FD5D    call       AllocateHWnd
 0044FD62    mov        dword ptr [esi+10],eax; THookList.?f10:HWND
 0044FD65    mov        eax,esi
 0044FD67    test       bl,bl
>0044FD69    je         0044FD7A
 0044FD6B    call       @AfterConstruction
 0044FD70    pop        dword ptr fs:[0]
 0044FD77    add        esp,0C
 0044FD7A    mov        eax,esi
 0044FD7C    pop        esi
 0044FD7D    pop        ebx
 0044FD7E    ret
*}
//end;

//0044FD80
destructor THookList.Destroy;
begin
{*
 0044FD80    push       ebx
 0044FD81    push       esi
 0044FD82    call       @BeforeDestruction
 0044FD87    mov        ebx,edx
 0044FD89    mov        esi,eax
>0044FD8B    jmp        0044FD99
 0044FD8D    mov        eax,esi
 0044FD8F    call       TList.Last
 0044FD94    call       TObject.Free
 0044FD99    cmp        dword ptr [esi+8],0; THookList.FCount:Integer
<0044FD9D    jg         0044FD8D
 0044FD9F    mov        eax,dword ptr [esi+10]; THookList.?f10:HWND
 0044FDA2    call       DeallocateHWnd
 0044FDA7    mov        edx,ebx
 0044FDA9    and        dl,0FC
 0044FDAC    mov        eax,esi
 0044FDAE    call       TList.Destroy
 0044FDB3    test       bl,bl
>0044FDB5    jle        0044FDBE
 0044FDB7    mov        eax,esi
 0044FDB9    call       @ClassDestroy
 0044FDBE    pop        esi
 0044FDBF    pop        ebx
 0044FDC0    ret
*}
end;

//0044FDC4
//procedure sub_0044FDC4(?:?; ?:?);
//begin
{*
 0044FDC4    push       ebp
 0044FDC5    mov        ebp,esp
 0044FDC7    push       ecx
 0044FDC8    push       ebx
 0044FDC9    push       esi
 0044FDCA    push       edi
 0044FDCB    mov        ebx,edx
 0044FDCD    mov        dword ptr [ebp-4],eax
 0044FDD0    xor        eax,eax
 0044FDD2    push       ebp
 0044FDD3    push       44FE57
 0044FDD8    push       dword ptr fs:[eax]
 0044FDDB    mov        dword ptr fs:[eax],esp
 0044FDDE    mov        esi,dword ptr [ebx]
 0044FDE0    cmp        esi,0B052
>0044FDE6    jne        0044FE06
 0044FDE8    mov        ebx,dword ptr [ebx+8]
 0044FDEB    test       ebx,ebx
>0044FDED    je         0044FE4D
 0044FDEF    mov        edx,ebx
 0044FDF1    mov        eax,dword ptr [ebp-4]
 0044FDF4    call       TList.IndexOf
 0044FDF9    test       eax,eax
>0044FDFB    jl         0044FE4D
 0044FDFD    mov        eax,ebx
 0044FDFF    call       0044FB38
>0044FE04    jmp        0044FE4D
 0044FE06    cmp        esi,0B053
>0044FE0C    jne        0044FE35
 0044FE0E    mov        ebx,dword ptr [ebx+8]
 0044FE11    test       ebx,ebx
>0044FE13    je         0044FE4D
 0044FE15    mov        edx,ebx
 0044FE17    mov        eax,dword ptr [ebp-4]
 0044FE1A    call       TList.IndexOf
 0044FE1F    test       eax,eax
>0044FE21    jl         0044FE4D
 0044FE23    mov        eax,dword ptr [ebx+10]
 0044FE26    cmp        dword ptr [eax+8],0
>0044FE2A    jne        0044FE4D
 0044FE2C    mov        eax,ebx
 0044FE2E    call       TObject.Free
>0044FE33    jmp        0044FE4D
 0044FE35    mov        eax,dword ptr [ebx+8]
 0044FE38    push       eax
 0044FE39    mov        eax,dword ptr [ebx+4]
 0044FE3C    push       eax
 0044FE3D    push       esi
 0044FE3E    mov        eax,dword ptr [ebp-4]
 0044FE41    mov        eax,dword ptr [eax+10]
 0044FE44    push       eax
 0044FE45    call       user32.DefWindowProcA
 0044FE4A    mov        dword ptr [ebx+0C],eax
 0044FE4D    xor        eax,eax
 0044FE4F    pop        edx
 0044FE50    pop        ecx
 0044FE51    pop        ecx
 0044FE52    mov        dword ptr fs:[eax],edx
>0044FE55    jmp        0044FE70
<0044FE57    jmp        @HandleAnyException
 0044FE5C    mov        eax,[0046C05C]; ^Application:TApplication
 0044FE61    mov        eax,dword ptr [eax]
 0044FE63    mov        edx,dword ptr [ebp-4]
 0044FE66    call       TApplication.HandleException
 0044FE6B    call       @DoneExcept
 0044FE70    pop        edi
 0044FE71    pop        esi
 0044FE72    pop        ebx
 0044FE73    pop        ecx
 0044FE74    pop        ebp
 0044FE75    ret
*}
//end;

//0044FE78
//function sub_0044FE78(?:THookList; ?:dword):?;
//begin
{*
 0044FE78    push       ebx
 0044FE79    push       esi
 0044FE7A    push       edi
 0044FE7B    push       ebp
 0044FE7C    mov        ebp,edx
 0044FE7E    mov        edi,eax
 0044FE80    test       ebp,ebp
>0044FE82    je         0044FEAC
 0044FE84    mov        esi,dword ptr [edi+8]; THookList.FCount:Integer
 0044FE87    dec        esi
 0044FE88    test       esi,esi
>0044FE8A    jl         0044FEAC
 0044FE8C    inc        esi
 0044FE8D    xor        ebx,ebx
 0044FE8F    mov        edx,ebx
 0044FE91    mov        eax,edi
 0044FE93    call       TList.Get
 0044FE98    cmp        ebp,dword ptr [eax+4]
>0044FE9B    jne        0044FEA8
 0044FE9D    mov        edx,ebx
 0044FE9F    mov        eax,edi
 0044FEA1    call       TList.Get
>0044FEA6    jmp        0044FEAE
 0044FEA8    inc        ebx
 0044FEA9    dec        esi
<0044FEAA    jne        0044FE8F
 0044FEAC    xor        eax,eax
 0044FEAE    pop        ebp
 0044FEAF    pop        edi
 0044FEB0    pop        esi
 0044FEB1    pop        ebx
 0044FEB2    ret
*}
//end;

//0044FEB4
//function sub_0044FEB4(?:THookList; ?:dword):TControlHook;
//begin
{*
 0044FEB4    push       ebp
 0044FEB5    mov        ebp,esp
 0044FEB7    push       ecx
 0044FEB8    push       ebx
 0044FEB9    push       esi
 0044FEBA    push       edi
 0044FEBB    mov        esi,edx
 0044FEBD    mov        ebx,eax
 0044FEBF    mov        edx,esi
 0044FEC1    mov        eax,ebx
 0044FEC3    call       0044FE78
 0044FEC8    mov        dword ptr [ebp-4],eax
 0044FECB    cmp        dword ptr [ebp-4],0
>0044FECF    jne        0044FF23
 0044FED1    mov        dl,1
 0044FED3    mov        eax,[0044F804]; TControlHook
 0044FED8    call       TControlHook.Create; TControlHook.Create
 0044FEDD    mov        dword ptr [ebp-4],eax
 0044FEE0    xor        eax,eax
 0044FEE2    push       ebp
 0044FEE3    push       44FF0C
 0044FEE8    push       dword ptr fs:[eax]
 0044FEEB    mov        dword ptr fs:[eax],esp
 0044FEEE    mov        edx,dword ptr [ebp-4]
 0044FEF1    mov        eax,ebx
 0044FEF3    call       TList.Add
 0044FEF8    mov        edx,esi
 0044FEFA    mov        eax,dword ptr [ebp-4]
 0044FEFD    call       0044FD14
 0044FF02    xor        eax,eax
 0044FF04    pop        edx
 0044FF05    pop        ecx
 0044FF06    pop        ecx
 0044FF07    mov        dword ptr fs:[eax],edx
>0044FF0A    jmp        0044FF23
<0044FF0C    jmp        @HandleAnyException
 0044FF11    mov        eax,dword ptr [ebp-4]
 0044FF14    call       TObject.Free
 0044FF19    call       @RaiseAgain
 0044FF1E    call       @DoneExcept
 0044FF23    mov        eax,dword ptr [ebp-4]
 0044FF26    pop        edi
 0044FF27    pop        esi
 0044FF28    pop        ebx
 0044FF29    pop        ecx
 0044FF2A    pop        ebp
 0044FF2B    ret
*}
//end;

//0044FF2C
constructor TRxWindowHook.Create(AOwner:TComponent);
begin
{*
 0044FF2C    push       ebx
 0044FF2D    push       esi
 0044FF2E    test       dl,dl
>0044FF30    je         0044FF3A
 0044FF32    add        esp,0FFFFFFF0
 0044FF35    call       @ClassCreate
 0044FF3A    mov        ebx,edx
 0044FF3C    mov        esi,eax
 0044FF3E    xor        edx,edx
 0044FF40    mov        eax,esi
 0044FF42    call       TComponent.Create
 0044FF47    mov        byte ptr [esi+24],1; TRxWindowHook.Active:Boolean
 0044FF4B    mov        eax,esi
 0044FF4D    test       bl,bl
>0044FF4F    je         0044FF60
 0044FF51    call       @AfterConstruction
 0044FF56    pop        dword ptr fs:[0]
 0044FF5D    add        esp,0C
 0044FF60    mov        eax,esi
 0044FF62    pop        esi
 0044FF63    pop        ebx
 0044FF64    ret
*}
end;

//0044FF68
destructor TRxWindowHook.Destroy;
begin
{*
 0044FF68    push       ebx
 0044FF69    push       esi
 0044FF6A    call       @BeforeDestruction
 0044FF6F    mov        ebx,edx
 0044FF71    mov        esi,eax
 0044FF73    xor        edx,edx
 0044FF75    mov        eax,esi
 0044FF77    call       TRxWindowHook.SetActive
 0044FF7C    xor        edx,edx
 0044FF7E    mov        eax,esi
 0044FF80    call       TRxWindowHook.SetWinControl
 0044FF85    mov        edx,ebx
 0044FF87    and        dl,0FC
 0044FF8A    mov        eax,esi
 0044FF8C    call       TComponent.Destroy
 0044FF91    test       bl,bl
>0044FF93    jle        0044FF9C
 0044FF95    mov        eax,esi
 0044FF97    call       @ClassDestroy
 0044FF9C    pop        esi
 0044FF9D    pop        ebx
 0044FF9E    ret
*}
end;

//0044FFA0
//function TRxWindowHook.SetActive(Self:TRxWindowHook; ?:?):TControlHook;
//begin
{*
 0044FFA0    cmp        dl,byte ptr [eax+24]; TRxWindowHook.Active:Boolean
>0044FFA3    je         0044FFB5
 0044FFA5    test       dl,dl
>0044FFA7    je         0044FFB0
 0044FFA9    call       0044FFB8
>0044FFAE    jmp        0044FFB5
 0044FFB0    call       00450004
 0044FFB5    ret
*}
//end;

//0044FFB8
//function sub_0044FFB8(?:TRxWindowHook):THookList;
//begin
{*
 0044FFB8    push       ebx
 0044FFB9    mov        ebx,eax
 0044FFBB    cmp        dword ptr [ebx+28],0; TRxWindowHook.?f28:dword
>0044FFBF    je         0044FFDB
 0044FFC1    test       byte ptr [ebx+20],8; TRxWindowHook.FComponentState:TComponentState
>0044FFC5    jne        0044FFDB
 0044FFC7    call       0044F8C8
 0044FFCC    mov        edx,dword ptr [ebx+28]; TRxWindowHook.?f28:dword
 0044FFCF    call       0044FEB4
 0044FFD4    mov        edx,ebx
 0044FFD6    call       0044F9E0
 0044FFDB    mov        byte ptr [ebx+24],1; TRxWindowHook.Active:Boolean
 0044FFDF    pop        ebx
 0044FFE0    ret
*}
//end;

//0044FFE4
//function sub_0044FFE4(?:TRxWindowHook):TControlHook;
//begin
{*
 0044FFE4    push       ebx
 0044FFE5    push       esi
 0044FFE6    mov        ebx,eax
 0044FFE8    mov        esi,dword ptr [ebx+2C]; TRxWindowHook.?f2C:TControlHook
 0044FFEB    test       esi,esi
>0044FFED    je         0044FFF8
 0044FFEF    mov        edx,ebx
 0044FFF1    mov        eax,esi
 0044FFF3    call       0044FA18
 0044FFF8    mov        byte ptr [ebx+24],0; TRxWindowHook.Active:Boolean
 0044FFFC    mov        eax,esi
 0044FFFE    pop        esi
 0044FFFF    pop        ebx
 00450000    ret
*}
//end;

//00450004
//function sub_00450004(?:TRxWindowHook):TControlHook;
//begin
{*
 00450004    push       ebx
 00450005    mov        ebx,eax
 00450007    mov        eax,ebx
 00450009    call       0044FFE4
 0045000E    mov        byte ptr [ebx+24],0; TRxWindowHook.Active:Boolean
 00450012    pop        ebx
 00450013    ret
*}
//end;

//00450014
function TRxWindowHook.IsStoredWinControl(Self:TRxWindowHook):Boolean;
begin
{*
 00450014    push       ebx
 00450015    mov        ebx,eax
 00450017    mov        eax,ebx
 00450019    call       TRxWindowHook.GetWinControl
 0045001E    test       eax,eax
>00450020    je         00450038
 00450022    mov        eax,ebx
 00450024    call       TRxWindowHook.GetWinControl
 00450029    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 0045002F    call       @IsClass
 00450034    test       al,al
>00450036    je         0045003C
 00450038    xor        eax,eax
 0045003A    pop        ebx
 0045003B    ret
 0045003C    mov        al,1
 0045003E    pop        ebx
 0045003F    ret
*}
end;

//00450040
//function sub_00450040(?:?):?;
//begin
{*
 00450040    push       ebx
 00450041    push       esi
 00450042    mov        ebx,eax
 00450044    mov        eax,ebx
 00450046    call       TRxWindowHook.GetWinControl
 0045004B    test       eax,eax
>0045004D    je         0045006E
 0045004F    mov        eax,ebx
 00450051    call       TRxWindowHook.GetWinControl
 00450056    mov        esi,dword ptr [ebx+4]
 00450059    cmp        eax,esi
>0045005B    jne        0045006E
 0045005D    mov        eax,esi
 0045005F    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00450065    call       @IsClass
 0045006A    test       al,al
>0045006C    jne        00450073
 0045006E    xor        eax,eax
 00450070    pop        esi
 00450071    pop        ebx
 00450072    ret
 00450073    mov        al,1
 00450075    pop        esi
 00450076    pop        ebx
 00450077    ret
*}
//end;

//00450078
//function sub_00450078(?:?; ?:?):dword;
//begin
{*
 00450078    push       ebx
 00450079    push       esi
 0045007A    mov        esi,edx
 0045007C    mov        ebx,eax
 0045007E    mov        eax,esi
 00450080    call       TReader.ReadBoolean
 00450085    test       al,al
>00450087    je         004500A6
 00450089    mov        esi,dword ptr [ebx+4]
 0045008C    mov        eax,esi
 0045008E    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00450094    call       @IsClass
 00450099    test       al,al
>0045009B    je         004500A6
 0045009D    mov        edx,esi
 0045009F    mov        eax,ebx
 004500A1    call       TRxWindowHook.SetWinControl
 004500A6    pop        esi
 004500A7    pop        ebx
 004500A8    ret
*}
//end;

//004500AC
//procedure sub_004500AC(?:?; ?:?);
//begin
{*
 004500AC    push       ebx
 004500AD    push       esi
 004500AE    mov        esi,edx
 004500B0    mov        ebx,eax
 004500B2    mov        eax,ebx
 004500B4    call       00450040
 004500B9    mov        edx,eax
 004500BB    mov        eax,esi
 004500BD    call       TWriter.WriteBoolean
 004500C2    pop        esi
 004500C3    pop        ebx
 004500C4    ret
*}
//end;

//004500C8
//function sub_004500C8(?:?):?;
//begin
{*
 004500C8    push       ebp
 004500C9    mov        ebp,esp
 004500CB    push       ebx
 004500CC    mov        eax,dword ptr [ebp+8]
 004500CF    mov        eax,dword ptr [eax-4]
 004500D2    cmp        dword ptr [eax+20],0
>004500D6    je         004500FB
 004500D8    mov        eax,dword ptr [ebp+8]
 004500DB    mov        eax,dword ptr [eax-8]
 004500DE    call       00450040
 004500E3    mov        ebx,eax
 004500E5    mov        eax,dword ptr [ebp+8]
 004500E8    mov        eax,dword ptr [eax-4]
 004500EB    mov        eax,dword ptr [eax+20]
 004500EE    call       00450040
 004500F3    cmp        bl,al
 004500F5    setne      al
 004500F8    pop        ebx
 004500F9    pop        ebp
 004500FA    ret
 004500FB    mov        eax,dword ptr [ebp+8]
 004500FE    mov        eax,dword ptr [eax-8]
 00450101    call       00450040
 00450106    pop        ebx
 00450107    pop        ebp
 00450108    ret
*}
//end;

//0045010C
procedure TRxWindowHook.DefineProperties(Filer:TFiler);
begin
{*
 0045010C    push       ebp
 0045010D    mov        ebp,esp
 0045010F    add        esp,0FFFFFFF8
 00450112    push       ebx
 00450113    mov        dword ptr [ebp-4],edx
 00450116    mov        dword ptr [ebp-8],eax
 00450119    mov        edx,dword ptr [ebp-4]
 0045011C    mov        eax,dword ptr [ebp-8]
 0045011F    call       TComponent.DefineProperties
 00450124    mov        eax,dword ptr [ebp-8]
 00450127    push       eax
 00450128    push       450078; sub_00450078
 0045012D    mov        eax,dword ptr [ebp-8]
 00450130    push       eax
 00450131    push       4500AC; sub_004500AC
 00450136    push       ebp
 00450137    call       004500C8
 0045013C    pop        ecx
 0045013D    mov        ecx,eax
 0045013F    mov        edx,45015C; 'IsForm'
 00450144    mov        eax,dword ptr [ebp-4]
 00450147    mov        ebx,dword ptr [eax]
 00450149    call       dword ptr [ebx+4]; TFiler.DefineProperty
 0045014C    pop        ebx
 0045014D    pop        ecx
 0045014E    pop        ecx
 0045014F    pop        ebp
 00450150    ret
*}
end;

//00450164
function TRxWindowHook.GetWinControl(Self:TRxWindowHook):dword;
begin
{*
 00450164    mov        edx,dword ptr [eax+2C]; TRxWindowHook.?f2C:TControlHook
 00450167    test       edx,edx
>00450169    je         0045016F
 0045016B    mov        eax,dword ptr [edx+4]; TControlHook.?f4:dword
 0045016E    ret
 0045016F    mov        eax,dword ptr [eax+28]; TRxWindowHook.?f28:dword
 00450172    ret
*}
end;

//00450174
//procedure TRxWindowHook.sub_00450174(?:?);
//begin
{*
 00450174    push       ebx
 00450175    cmp        word ptr [eax+3A],0; TRxWindowHook.?f3A:word
>0045017A    je         00450189
 0045017C    push       ecx
 0045017D    mov        ecx,edx
 0045017F    mov        ebx,eax
 00450181    mov        edx,eax
 00450183    mov        eax,dword ptr [ebx+3C]; TRxWindowHook.?f3C:TFormPlacement
 00450186    call       dword ptr [ebx+38]; TRxWindowHook.AfterMessage
 00450189    pop        ebx
 0045018A    ret
*}
//end;

//0045018C
//procedure TRxWindowHook.sub_0045018C(?:?);
//begin
{*
 0045018C    push       ebx
 0045018D    cmp        word ptr [eax+32],0; TRxWindowHook.?f32:word
>00450192    je         004501A1
 00450194    push       ecx
 00450195    mov        ecx,edx
 00450197    mov        ebx,eax
 00450199    mov        edx,eax
 0045019B    mov        eax,dword ptr [ebx+34]; TRxWindowHook.?f34:dword
 0045019E    call       dword ptr [ebx+30]; TRxWindowHook.BeforeMessage
 004501A1    pop        ebx
 004501A2    ret
*}
//end;

//004501A4
function TRxWindowHook.Notification(AComponent:TComponent; Operation:TOperation):dword;
begin
{*
 004501A4    push       ebx
 004501A5    push       esi
 004501A6    push       edi
 004501A7    mov        ebx,ecx
 004501A9    mov        esi,edx
 004501AB    mov        edi,eax
 004501AD    mov        ecx,ebx
 004501AF    mov        edx,esi
 004501B1    mov        eax,edi
 004501B3    call       TComponent.Notification
 004501B8    mov        eax,edi
 004501BA    call       TRxWindowHook.GetWinControl
 004501BF    cmp        esi,eax
>004501C1    jne        004501D3
 004501C3    cmp        bl,1
>004501C6    jne        004501D3
 004501C8    xor        edx,edx
 004501CA    mov        eax,edi
 004501CC    call       TRxWindowHook.SetWinControl
>004501D1    jmp        004501EC
 004501D3    cmp        bl,1
>004501D6    jne        004501EC
 004501D8    mov        eax,dword ptr [edi+4]; TRxWindowHook.FOwner:TComponent
 004501DB    cmp        esi,eax
>004501DD    je         004501E3
 004501DF    test       eax,eax
>004501E1    jne        004501EC
 004501E3    xor        edx,edx
 004501E5    mov        eax,edi
 004501E7    call       TRxWindowHook.SetWinControl
 004501EC    pop        edi
 004501ED    pop        esi
 004501EE    pop        ebx
 004501EF    ret
*}
end;

//004501F0
//function TRxWindowHook.SetWinControl(Self:TRxWindowHook; ?:?):dword;
//begin
{*
 004501F0    push       ebx
 004501F1    push       esi
 004501F2    push       edi
 004501F3    push       ebp
 004501F4    mov        esi,edx
 004501F6    mov        ebp,eax
 004501F8    mov        eax,ebp
 004501FA    call       TRxWindowHook.GetWinControl
 004501FF    cmp        esi,eax
>00450201    je         00450256
 00450203    mov        bl,byte ptr [ebp+24]; TRxWindowHook.Active:Boolean
 00450206    mov        eax,ebp
 00450208    call       0044FFE4
 0045020D    mov        edi,eax
 0045020F    mov        dword ptr [ebp+28],esi; TRxWindowHook.?f28:dword
 00450212    test       esi,esi
>00450214    je         0045021F
 00450216    mov        edx,ebp
 00450218    mov        eax,esi
 0045021A    call       TComponent.FreeNotification
 0045021F    test       edi,edi
>00450221    je         0045024B
 00450223    mov        eax,dword ptr [edi+10]; TControlHook.?f10:TList
 00450226    cmp        dword ptr [eax+8],0; TList.FCount:Integer
>0045022A    jne        0045024B
 0045022C    cmp        dword ptr ds:[46D848],0; gvar_0046D848:THookList
>00450233    je         0045024B
 00450235    push       edi
 00450236    push       0
 00450238    push       0B053
 0045023D    mov        eax,[0046D848]; gvar_0046D848:THookList
 00450242    mov        eax,dword ptr [eax+10]; THookList.?f10:HWND
 00450245    push       eax
 00450246    call       user32.PostMessageA
 0045024B    test       bl,bl
>0045024D    je         00450256
 0045024F    mov        eax,ebp
 00450251    call       0044FFB8
 00450256    pop        ebp
 00450257    pop        edi
 00450258    pop        esi
 00450259    pop        ebx
 0045025A    ret
*}
//end;

Initialization
//00450294
{*
 00450294    sub        dword ptr ds:[46D844],1
>0045029B    jae        004502A4
 0045029D    xor        eax,eax
 0045029F    mov        [0046D848],eax; gvar_0046D848:THookList
 004502A4    ret
*}
Finalization
//0045025C
{*
 0045025C    push       ebp
 0045025D    mov        ebp,esp
 0045025F    xor        eax,eax
 00450261    push       ebp
 00450262    push       450288
 00450267    push       dword ptr fs:[eax]
 0045026A    mov        dword ptr fs:[eax],esp
 0045026D    inc        dword ptr ds:[46D844]
>00450273    jne        0045027A
 00450275    call       0044F8E8
 0045027A    xor        eax,eax
 0045027C    pop        edx
 0045027D    pop        ecx
 0045027E    pop        ecx
 0045027F    mov        dword ptr fs:[eax],edx
 00450282    push       45028F
 00450287    ret
<00450288    jmp        @HandleFinally
<0045028D    jmp        00450287
 0045028F    pop        ebp
 00450290    ret
*}
end.