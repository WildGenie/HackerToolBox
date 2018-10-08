{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit82;

interface

uses
  Classes, Windows, Graphics;

type
  TVersionInfo = class(TObject)
  public
    f4:PChar;//f4
    f8:LongBool;//f8
    fC:Longword;//fC
    f10:Pointer;//f10
    f14:dword;//f14
    destructor Destroy; virtual;
    //constructor Create(?:TVersionInfo; _Dv__:Boolean);
  end;

implementation

{$R *.DFM}

//00464D80
function sub_00464D80:Pointer;
begin
{*
 00464D80    push       ebp
 00464D81    mov        ebp,esp
 00464D83    call       @GetMem
 00464D88    pop        ebp
 00464D89    ret
*}
end;

//00464D8C
//constructor TVersionInfo.Create(?:TVersionInfo; _Dv__:Boolean);
//begin
{*
 00464D8C    push       ebp
 00464D8D    mov        ebp,esp
 00464D8F    push       ebx
 00464D90    push       esi
 00464D91    push       edi
 00464D92    test       dl,dl
>00464D94    je         00464D9E
 00464D96    add        esp,0FFFFFFF0
 00464D99    call       @ClassCreate
 00464D9E    mov        esi,ecx
 00464DA0    mov        ebx,edx
 00464DA2    mov        edi,eax
 00464DA4    xor        edx,edx
 00464DA6    mov        eax,edi
 00464DA8    call       TObject.Create
 00464DAD    mov        eax,esi
 00464DAF    call       @LStrLen
 00464DB4    inc        eax
 00464DB5    call       StrAlloc
 00464DBA    mov        edx,esi
 00464DBC    call       StrPCopy
 00464DC1    mov        dword ptr [edi+4],eax; TVersionInfo.?f4:PChar
 00464DC4    mov        eax,edi
 00464DC6    call       00464E28
 00464DCB    mov        eax,edi
 00464DCD    test       bl,bl
>00464DCF    je         00464DE0
 00464DD1    call       @AfterConstruction
 00464DD6    pop        dword ptr fs:[0]
 00464DDD    add        esp,0C
 00464DE0    mov        eax,edi
 00464DE2    pop        edi
 00464DE3    pop        esi
 00464DE4    pop        ebx
 00464DE5    pop        ebp
 00464DE6    ret
*}
//end;

//00464DE8
destructor TVersionInfo.Destroy;
begin
{*
 00464DE8    push       ebp
 00464DE9    mov        ebp,esp
 00464DEB    push       ebx
 00464DEC    push       esi
 00464DED    call       @BeforeDestruction
 00464DF2    mov        ebx,edx
 00464DF4    mov        esi,eax
 00464DF6    mov        eax,dword ptr [esi+10]; TVersionInfo.?f10:Pointer
 00464DF9    test       eax,eax
>00464DFB    je         00464E05
 00464DFD    mov        edx,dword ptr [esi+0C]; TVersionInfo.?fC:Longword
 00464E00    call       @FreeMem
 00464E05    mov        eax,dword ptr [esi+4]; TVersionInfo.?f4:PChar
 00464E08    call       StrDispose
 00464E0D    mov        edx,ebx
 00464E0F    and        dl,0FC
 00464E12    mov        eax,esi
 00464E14    call       TObject.Destroy
 00464E19    test       bl,bl
>00464E1B    jle        00464E24
 00464E1D    mov        eax,esi
 00464E1F    call       @ClassDestroy
 00464E24    pop        esi
 00464E25    pop        ebx
 00464E26    pop        ebp
 00464E27    ret
*}
end;

//00464E28
//function sub_00464E28(?:TVersionInfo):TVersionInfo;
//begin
{*
 00464E28    push       ebp
 00464E29    mov        ebp,esp
 00464E2B    push       ecx
 00464E2C    push       ebx
 00464E2D    push       esi
 00464E2E    push       edi
 00464E2F    mov        dword ptr [ebp-4],eax
 00464E32    mov        eax,dword ptr [ebp-4]
 00464E35    mov        byte ptr [eax+8],0; TVersionInfo.?f8:LongBool
 00464E39    mov        eax,dword ptr [ebp-4]
 00464E3C    add        eax,14; TVersionInfo.?f14:dword
 00464E3F    push       eax
 00464E40    mov        eax,dword ptr [ebp-4]
 00464E43    mov        eax,dword ptr [eax+4]; TVersionInfo.?f4:PChar
 00464E46    push       eax
 00464E47    call       version.GetFileVersionInfoSizeA
 00464E4C    mov        ebx,eax
 00464E4E    mov        eax,dword ptr [ebp-4]
 00464E51    mov        dword ptr [eax+0C],ebx; TVersionInfo.?fC:Longword
 00464E54    test       ebx,ebx
>00464E56    jbe        00464EBC
 00464E58    xor        eax,eax
 00464E5A    push       ebp
 00464E5B    push       464EA6
 00464E60    push       dword ptr fs:[eax]
 00464E63    mov        dword ptr fs:[eax],esp
 00464E66    mov        eax,ebx
 00464E68    call       00464D80
 00464E6D    mov        esi,eax
 00464E6F    mov        eax,dword ptr [ebp-4]
 00464E72    mov        dword ptr [eax+10],esi; TVersionInfo.?f10:Pointer
 00464E75    push       esi
 00464E76    mov        eax,dword ptr [ebp-4]
 00464E79    mov        eax,dword ptr [eax+0C]; TVersionInfo.?fC:Longword
 00464E7C    push       eax
 00464E7D    mov        eax,dword ptr [ebp-4]
 00464E80    mov        eax,dword ptr [eax+14]; TVersionInfo.?f14:dword
 00464E83    push       eax
 00464E84    mov        eax,dword ptr [ebp-4]
 00464E87    mov        eax,dword ptr [eax+4]; TVersionInfo.?f4:PChar
 00464E8A    push       eax
 00464E8B    call       version.GetFileVersionInfoA
 00464E90    neg        eax
 00464E92    sbb        eax,eax
 00464E94    neg        eax
 00464E96    mov        edx,dword ptr [ebp-4]
 00464E99    mov        byte ptr [edx+8],al; TVersionInfo.?f8:LongBool
 00464E9C    xor        eax,eax
 00464E9E    pop        edx
 00464E9F    pop        ecx
 00464EA0    pop        ecx
 00464EA1    mov        dword ptr fs:[eax],edx
>00464EA4    jmp        00464EBC
<00464EA6    jmp        @HandleAnyException
 00464EAB    mov        eax,dword ptr [ebp-4]
 00464EAE    mov        byte ptr [eax+8],0; TVersionInfo.?f8:LongBool
 00464EB2    call       @RaiseAgain
 00464EB7    call       @DoneExcept
 00464EBC    pop        edi
 00464EBD    pop        esi
 00464EBE    pop        ebx
 00464EBF    pop        ecx
 00464EC0    pop        ebp
 00464EC1    ret
*}
//end;

//00464EC4
//function sub_00464EC4(?:?):?;
//begin
{*
 00464EC4    push       ebp
 00464EC5    mov        ebp,esp
 00464EC7    add        esp,0FFFFFFF8
 00464ECA    xor        edx,edx
 00464ECC    mov        dword ptr [ebp-4],edx
 00464ECF    cmp        byte ptr [eax+8],0
>00464ED3    je         00464EED
 00464ED5    lea        edx,[ebp-8]
 00464ED8    push       edx
 00464ED9    lea        edx,[ebp-4]
 00464EDC    push       edx
 00464EDD    push       464EFC; '\\VarFileInfo\\Translation'
 00464EE2    mov        eax,dword ptr [eax+10]
 00464EE5    push       eax
 00464EE6    call       version.VerQueryValueA
>00464EEB    jmp        00464EF2
 00464EED    xor        eax,eax
 00464EEF    mov        dword ptr [ebp-4],eax
 00464EF2    mov        eax,dword ptr [ebp-4]
 00464EF5    pop        ecx
 00464EF6    pop        ecx
 00464EF7    pop        ebp
 00464EF8    ret
*}
//end;

//00464F18
//function sub_00464F18(?:TVersionInfo; ?:AnsiString):AnsiString;
//begin
{*
 00464F18    push       ebp
 00464F19    mov        ebp,esp
 00464F1B    push       ebx
 00464F1C    push       esi
 00464F1D    mov        esi,edx
 00464F1F    mov        ebx,eax
 00464F21    mov        eax,esi
 00464F23    call       @LStrClr
 00464F28    mov        eax,ebx
 00464F2A    call       00464EC4
 00464F2F    mov        ebx,eax
 00464F31    test       ebx,ebx
>00464F33    je         00464F50
 00464F35    mov        eax,dword ptr [ebx]
 00464F37    call       HiWord
 00464F3C    mov        dx,word ptr [ebx]
 00464F3F    call       MakeLong
 00464F44    mov        ecx,esi
 00464F46    mov        edx,8
 00464F4B    call       IntToHex
 00464F50    pop        esi
 00464F51    pop        ebx
 00464F52    pop        ebp
 00464F53    ret
*}
//end;

//00464F54
//function sub_00464F54(?:TVersionInfo):?;
//begin
{*
 00464F54    push       ebp
 00464F55    mov        ebp,esp
 00464F57    add        esp,0FFFFFFF8
 00464F5A    xor        edx,edx
 00464F5C    mov        dword ptr [ebp-4],edx
 00464F5F    cmp        byte ptr [eax+8],0
>00464F63    je         00464F7D
 00464F65    lea        edx,[ebp-8]
 00464F68    push       edx
 00464F69    lea        edx,[ebp-4]
 00464F6C    push       edx
 00464F6D    push       464F8C; '\\'
 00464F72    mov        eax,dword ptr [eax+10]
 00464F75    push       eax
 00464F76    call       version.VerQueryValueA
>00464F7B    jmp        00464F82
 00464F7D    xor        eax,eax
 00464F7F    mov        dword ptr [ebp-4],eax
 00464F82    mov        eax,dword ptr [ebp-4]
 00464F85    pop        ecx
 00464F86    pop        ecx
 00464F87    pop        ebp
 00464F88    ret
*}
//end;

//00464F90
//procedure sub_00464F90(?:TVersionInfo; ?:?);
//begin
{*
 00464F90    push       ebp
 00464F91    mov        ebp,esp
 00464F93    push       ebx
 00464F94    push       esi
 00464F95    mov        esi,edx
 00464F97    mov        ebx,eax
 00464F99    mov        eax,ebx
 00464F9B    call       00464F54
 00464FA0    mov        eax,dword ptr [eax+10]
 00464FA3    mov        dword ptr [esi],eax
 00464FA5    mov        eax,ebx
 00464FA7    call       00464F54
 00464FAC    mov        eax,dword ptr [eax+14]
 00464FAF    mov        dword ptr [esi+4],eax
 00464FB2    pop        esi
 00464FB3    pop        ebx
 00464FB4    pop        ebp
 00464FB5    ret
*}
//end;

//00464FB8
//procedure sub_00464FB8(?:TVersionInfo; ?:AnsiString; ?:AnsiString);
//begin
{*
 00464FB8    push       ebp
 00464FB9    mov        ebp,esp
 00464FBB    add        esp,0FFFFFEF0
 00464FC1    push       ebx
 00464FC2    push       esi
 00464FC3    push       edi
 00464FC4    xor        ebx,ebx
 00464FC6    mov        dword ptr [ebp-10C],ebx
 00464FCC    mov        dword ptr [ebp-110],ebx
 00464FD2    mov        esi,ecx
 00464FD4    mov        edi,edx
 00464FD6    mov        ebx,eax
 00464FD8    xor        eax,eax
 00464FDA    push       ebp
 00464FDB    push       465076
 00464FE0    push       dword ptr fs:[eax]
 00464FE3    mov        dword ptr fs:[eax],esp
 00464FE6    mov        eax,esi
 00464FE8    call       @LStrClr
 00464FED    cmp        byte ptr [ebx+8],0; TVersionInfo.?f8:LongBool
>00464FF1    je         00465058
 00464FF3    push       46508C; '\\StringFileInfo\\'
 00464FF8    lea        edx,[ebp-110]
 00464FFE    mov        eax,ebx
 00465000    call       00464F18
 00465005    push       dword ptr [ebp-110]
 0046500B    push       4650A8; '\\'
 00465010    push       edi
 00465011    lea        eax,[ebp-10C]
 00465017    mov        edx,4
 0046501C    call       @LStrCatN
 00465021    mov        edx,dword ptr [ebp-10C]
 00465027    lea        eax,[ebp-108]
 0046502D    call       StrPCopy
 00465032    lea        eax,[ebp-8]
 00465035    push       eax
 00465036    lea        eax,[ebp-4]
 00465039    push       eax
 0046503A    lea        eax,[ebp-108]
 00465040    push       eax
 00465041    mov        eax,dword ptr [ebx+10]; TVersionInfo.?f10:Pointer
 00465044    push       eax
 00465045    call       version.VerQueryValueA
 0046504A    test       eax,eax
>0046504C    je         00465058
 0046504E    mov        edx,esi
 00465050    mov        eax,dword ptr [ebp-4]
 00465053    call       StrPas
 00465058    xor        eax,eax
 0046505A    pop        edx
 0046505B    pop        ecx
 0046505C    pop        ecx
 0046505D    mov        dword ptr fs:[eax],edx
 00465060    push       46507D
 00465065    lea        eax,[ebp-110]
 0046506B    mov        edx,2
 00465070    call       @LStrArrayClr
 00465075    ret
<00465076    jmp        @HandleFinally
<0046507B    jmp        00465065
 0046507D    pop        edi
 0046507E    pop        esi
 0046507F    pop        ebx
 00465080    mov        esp,ebp
 00465082    pop        ebp
 00465083    ret
*}
//end;

//004650AC
//function sub_004650AC(?:TVersionInfo; ?:AnsiString):AnsiString;
//begin
{*
 004650AC    push       ebp
 004650AD    mov        ebp,esp
 004650AF    add        esp,0FFFFFFF8
 004650B2    push       ebx
 004650B3    push       esi
 004650B4    mov        esi,edx
 004650B6    mov        ebx,eax
 004650B8    mov        ecx,esi
 004650BA    mov        edx,4650F4; 'ProductVersion'
 004650BF    mov        eax,ebx
 004650C1    call       00464FB8
 004650C6    cmp        dword ptr [esi],0
>004650C9    jne        004650E5
 004650CB    cmp        byte ptr [ebx+8],0; TVersionInfo.?f8:LongBool
>004650CF    je         004650E5
 004650D1    lea        edx,[ebp-8]
 004650D4    mov        eax,ebx
 004650D6    call       00464F90
 004650DB    lea        eax,[ebp-8]
 004650DE    mov        edx,esi
 004650E0    call       00465104
 004650E5    pop        esi
 004650E6    pop        ebx
 004650E7    pop        ecx
 004650E8    pop        ecx
 004650E9    pop        ebp
 004650EA    ret
*}
//end;

//00465104
//function sub_00465104(?:?; ?:AnsiString):AnsiString;
//begin
{*
 00465104    push       ebp
 00465105    mov        ebp,esp
 00465107    add        esp,0FFFFFFE0
 0046510A    push       ebx
 0046510B    push       esi
 0046510C    mov        esi,edx
 0046510E    mov        ebx,eax
 00465110    push       esi
 00465111    movzx      eax,word ptr [ebx+2]
 00465115    mov        dword ptr [ebp-20],eax
 00465118    mov        byte ptr [ebp-1C],0
 0046511C    movzx      eax,word ptr [ebx]
 0046511F    mov        dword ptr [ebp-18],eax
 00465122    mov        byte ptr [ebp-14],0
 00465126    movzx      eax,word ptr [ebx+6]
 0046512A    mov        dword ptr [ebp-10],eax
 0046512D    mov        byte ptr [ebp-0C],0
 00465131    movzx      eax,word ptr [ebx+4]
 00465135    mov        dword ptr [ebp-8],eax
 00465138    mov        byte ptr [ebp-4],0
 0046513C    lea        edx,[ebp-20]
 0046513F    mov        ecx,3
 00465144    mov        eax,46515C; '%d.%d.%d.%d'
 00465149    call       Format
 0046514E    pop        esi
 0046514F    pop        ebx
 00465150    mov        esp,ebp
 00465152    pop        ebp
 00465153    ret
*}
//end;

end.