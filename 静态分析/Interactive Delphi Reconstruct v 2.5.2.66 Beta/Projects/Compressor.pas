{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit Compressor;

interface

uses
  Classes, Windows, Graphics, ExeImage, _Unit73, _Unit74;

type
  TCompressor = class(TExeImage)
  public
    f54:byte;//f54
    f55:Boolean;//f55
    f56:byte;//f56
    f57:byte;//f57
    f58:byte;//f58
    f5C:dword;//f5C
    f60:Boolean;//f60
    f61:byte;//f61
    f64:Pointer;//f64
    f68:String;//f68
    f70:dword;//f70
    f74:Boolean;//f74
    f78:TResPatch;//f78
    f7C:String;//f7C
    f80:Boolean;//f80
    f84:dword;//f84
    f88:dword;//f88
    f8C:dword;//f8C
    f90:dword;//f90
    f94:byte;//f94
    f98:Pointer;//f98
    f9C:String;//f9C
    fA0:dword;//fA0
    fA4:dword;//fA4
    fA8:dword;//fA8
    fAC:TList;//fAC
    fB0:Pointer;//fB0
    fB4:dword;//fB4
    fB8:dword;//fB8
    //fBC:?;//fBC
    fC4:dword;//fC4
    fC8:dword;//fC8
    fCC:dword;//fCC
    fD0:dword;//fD0
    //fE4:?;//fE4
    fEC:dword;//fEC
    f10C:Longword;//f10C
    //f110:?;//f110
    f114:dword;//f114
    f118:Integer;//f118
    f11C:dword;//f11C
    f120:dword;//f120
    f124:dword;//f124
    f128:Pointer;//f128
    f12C:dword;//f12C
    f130:dword;//f130
    f134:byte;//f134
    f138:Pointer;//f138
    f13C:Pointer;//f13C
    f140:Pointer;//f140
    f144:dword;//f144
    f148:dword;//f148
    f14C:dword;//f14C
    f150:dword;//f150
    f154:dword;//f154
    f158:dword;//f158
    //f15C:?;//f15C
    f25C:Integer;//f25C
    f260:dword;//f260
    f264:dword;//f264
    f268:dword;//f268
    f280:Pointer;//f280
    f284:dword;//f284
    f288:dword;//f288
    f28C:TLZB;//f28C
    f290:String;//f290
    f294:String;//f294
    f2A0:dword;//f2A0
    destructor Destroy; virtual;
    procedure sub_00463F08(); virtual;
    procedure sub_00463F10(); virtual;
    procedure sub_00463F0C(); virtual;
    //function sub_00463F14(?:?; ?:?):?; virtual;
    procedure sub_00463F18(); virtual;
    procedure sub_00463F1C(); virtual;
    procedure sub_00463F20(); virtual;
    procedure sub_00463F24(); virtual;
    procedure sub_00463F28(); virtual;
    procedure sub_00463F34(); virtual;
    procedure sub_00463F40(); virtual;
    procedure sub_00463F4C(); virtual;
    procedure sub_00463F58(); virtual;
    procedure sub_00463F64(); virtual;
    procedure sub_00463F70(); virtual;
    procedure sub_00463F7C(); virtual;
    procedure sub_00463F88(); virtual;
    procedure sub_00463F94(); virtual;
    procedure sub_00463FA0(); virtual;
    procedure sub_00463FAC(); virtual;
    procedure sub_00463FB8(); virtual;
    procedure sub_00463FBC(); virtual;
    procedure sub_00463FC0(); virtual;
    procedure sub_00463FC4(); virtual;
    procedure sub_00463FD0(); virtual;
    procedure sub_00463FDC(); virtual;
    procedure sub_00463FE8(); virtual;
    procedure sub_00463FF4(); virtual;
    procedure sub_00464000(); virtual;
    procedure sub_0046400C(); virtual;
    procedure sub_00464018(); virtual;
    procedure sub_00464024(); virtual;
    procedure sub_00464030(); virtual;
    procedure sub_00464034(); virtual;
    procedure sub_00464038(); virtual;
    procedure sub_00464044(); virtual;
    procedure sub_00464050(); virtual;
    procedure sub_0046405C(); virtual;
    constructor Create; virtual;
    procedure sub_0046181C; virtual;
  end;

implementation

{$R *.DFM}

//00461198
//function sub_00461198(?:TCompressor; ?:dword):?;
//begin
{*
 00461198    push       esi
 00461199    push       edi
 0046119A    xor        ecx,ecx
 0046119C    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 0046119F    mov        eax,dword ptr [eax+80]
 004611A5    mov        edi,dword ptr [edx+0C]
 004611A8    cmp        eax,edi
>004611AA    jb         004611B3
 004611AC    add        edi,dword ptr [edx+8]
 004611AF    cmp        eax,edi
>004611B1    jb         004611C1
 004611B3    mov        esi,dword ptr [edx+0C]
 004611B6    cmp        eax,esi
>004611B8    jb         004611C9
 004611BA    add        esi,dword ptr [edx+10]
 004611BD    cmp        eax,esi
>004611BF    jae        004611C9
 004611C1    cmp        dword ptr [edx+0C],0
>004611C5    je         004611C9
 004611C7    mov        cl,1
 004611C9    mov        eax,ecx
 004611CB    pop        edi
 004611CC    pop        esi
 004611CD    ret
*}
//end;

//004611D0
procedure sub_004611D0;
begin
{*
 004611D0    ret
*}
end;

//004611D4
//function sub_004611D4(?:TCompressor; ?:dword):?;
//begin
{*
 004611D4    push       ebp
 004611D5    mov        ebp,esp
 004611D7    add        esp,0FFFFFFF8
 004611DA    push       ebx
 004611DB    push       esi
 004611DC    xor        ecx,ecx
 004611DE    mov        dword ptr [ebp-8],ecx
 004611E1    mov        ebx,edx
 004611E3    xor        edx,edx
 004611E5    push       ebp
 004611E6    push       46125F
 004611EB    push       dword ptr fs:[edx]
 004611EE    mov        dword ptr fs:[edx],esp
 004611F1    mov        byte ptr [ebp-1],0
 004611F5    mov        ecx,dword ptr [eax+38]; TCompressor.?f38:dword
 004611F8    mov        edx,dword ptr [ecx+78]
 004611FB    test       byte ptr [ecx+17],20
>004611FF    je         00461227
 00461201    mov        eax,dword ptr [ebx+0C]
 00461204    cmp        edx,eax
>00461206    jb         0046120F
 00461208    add        eax,dword ptr [ebx+8]
 0046120B    cmp        edx,eax
>0046120D    jb         0046121D
 0046120F    mov        esi,dword ptr [ebx+0C]
 00461212    cmp        edx,esi
>00461214    jb         00461227
 00461216    add        esi,dword ptr [ebx+10]
 00461219    cmp        edx,esi
>0046121B    jae        00461227
 0046121D    cmp        dword ptr [ebx+0C],0
>00461221    je         00461227
 00461223    mov        byte ptr [ebp-1],1
 00461227    lea        eax,[ebp-8]
 0046122A    mov        edx,ebx
 0046122C    mov        ecx,8
 00461231    call       @LStrFromArray
 00461236    mov        eax,dword ptr [ebp-8]
 00461239    mov        edx,461278; '.edata'
 0046123E    call       @LStrCmp
>00461243    jne        00461249
 00461245    mov        byte ptr [ebp-1],1
 00461249    xor        eax,eax
 0046124B    pop        edx
 0046124C    pop        ecx
 0046124D    pop        ecx
 0046124E    mov        dword ptr fs:[eax],edx
 00461251    push       461266
 00461256    lea        eax,[ebp-8]
 00461259    call       @LStrClr
 0046125E    ret
<0046125F    jmp        @HandleFinally
<00461264    jmp        00461256
 00461266    mov        al,byte ptr [ebp-1]
 00461269    pop        esi
 0046126A    pop        ebx
 0046126B    pop        ecx
 0046126C    pop        ecx
 0046126D    pop        ebp
 0046126E    ret
*}
//end;

//00461280
//function sub_00461280(?:TCompressor; ?:dword):Boolean;
//begin
{*
 00461280    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461283    mov        eax,dword ptr [eax+0C0]
 00461289    cmp        eax,dword ptr [edx+0C]
 0046128C    sete       al
 0046128F    ret
*}
//end;

//00461290
//function sub_00461290(?:TCompressor; ?:dword):Boolean;
//begin
{*
 00461290    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461293    mov        eax,dword ptr [eax+88]
 00461299    cmp        eax,dword ptr [edx+0C]
 0046129C    sete       al
 0046129F    ret
*}
//end;

//004612A0
//function sub_004612A0(?:TCompressor; ?:dword):?;
//begin
{*
 004612A0    push       ebp
 004612A1    mov        ebp,esp
 004612A3    push       0
 004612A5    push       ebx
 004612A6    push       esi
 004612A7    mov        esi,edx
 004612A9    mov        ebx,eax
 004612AB    xor        eax,eax
 004612AD    push       ebp
 004612AE    push       46134C
 004612B3    push       dword ptr fs:[eax]
 004612B6    mov        dword ptr fs:[eax],esp
 004612B9    mov        edx,esi
 004612BB    mov        eax,ebx
 004612BD    call       00461290
 004612C2    test       al,al
>004612C4    jne        0046130A
 004612C6    mov        edx,esi
 004612C8    mov        eax,ebx
 004612CA    call       00461280
 004612CF    test       al,al
>004612D1    jne        0046130A
 004612D3    mov        edx,esi
 004612D5    mov        eax,ebx
 004612D7    call       004611D4
 004612DC    test       al,al
>004612DE    jne        0046130A
 004612E0    lea        eax,[ebp-4]
 004612E3    mov        edx,esi
 004612E5    mov        ecx,8
 004612EA    call       @LStrFromArray
 004612EF    mov        eax,dword ptr [ebp-4]
 004612F2    mov        edx,461364; '.tls'
 004612F7    call       @LStrCmp
>004612FC    je         0046130A
 004612FE    cmp        dword ptr [esi+10],0
>00461302    jbe        0046130A
 00461304    cmp        dword ptr [esi+14],0
>00461308    ja         00461330
 0046130A    mov        edx,esi
 0046130C    mov        eax,ebx
 0046130E    call       00461290
 00461313    test       al,al
>00461315    je         0046131D
 00461317    cmp        byte ptr [ebx+60],0; TCompressor.?f60:Boolean
>0046131B    jne        00461330
 0046131D    mov        edx,esi
 0046131F    mov        eax,ebx
 00461321    call       004611D4
 00461326    test       al,al
>00461328    je         00461334
 0046132A    cmp        byte ptr [ebx+61],0; TCompressor.?f61:byte
>0046132E    je         00461334
 00461330    mov        bl,1
>00461332    jmp        00461336
 00461334    xor        ebx,ebx
 00461336    xor        eax,eax
 00461338    pop        edx
 00461339    pop        ecx
 0046133A    pop        ecx
 0046133B    mov        dword ptr fs:[eax],edx
 0046133E    push       461353
 00461343    lea        eax,[ebp-4]
 00461346    call       @LStrClr
 0046134B    ret
<0046134C    jmp        @HandleFinally
<00461351    jmp        00461343
 00461353    mov        eax,ebx
 00461355    pop        esi
 00461356    pop        ebx
 00461357    pop        ecx
 00461358    pop        ebp
 00461359    ret
*}
//end;

//0046136C
//function sub_0046136C(?:TCompressor; ?:?):?;
//begin
{*
 0046136C    push       ebx
 0046136D    push       esi
 0046136E    push       edi
 0046136F    push       ebp
 00461370    xor        esi,esi
 00461372    mov        ebx,dword ptr [eax+38]; TCompressor.?f38:dword
 00461375    mov        ecx,ebx
 00461377    add        ecx,0F8
 0046137D    mov        edi,dword ptr [eax+64]; TCompressor.?f64:Pointer
 00461380    add        edi,ecx
 00461382    sub        edi,dword ptr [eax+30]
 00461385    mov        ecx,edi
 00461387    movzx      eax,word ptr [ebx+6]
 0046138B    test       eax,eax
>0046138D    jbe        004613C1
 0046138F    mov        edi,dword ptr [ecx+0C]
 00461392    cmp        edx,edi
>00461394    jb         0046139D
 00461396    add        edi,dword ptr [ecx+8]
 00461399    cmp        edx,edi
>0046139B    jb         004613AB
 0046139D    mov        ebp,dword ptr [ecx+0C]
 004613A0    cmp        edx,ebp
>004613A2    jb         004613BB
 004613A4    add        ebp,dword ptr [ecx+10]
 004613A7    cmp        edx,ebp
>004613A9    jae        004613BB
 004613AB    cmp        dword ptr [ecx+0C],0
>004613AF    je         004613BB
 004613B1    mov        esi,dword ptr [ecx+14]
 004613B4    add        esi,edx
 004613B6    sub        esi,dword ptr [ecx+0C]
>004613B9    jmp        004613C1
 004613BB    add        ecx,28
 004613BE    dec        eax
<004613BF    jne        0046138F
 004613C1    mov        eax,esi
 004613C3    pop        ebp
 004613C4    pop        edi
 004613C5    pop        esi
 004613C6    pop        ebx
 004613C7    ret
*}
//end;

//004613C8
//function sub_004613C8(?:TCompressor):?;
//begin
{*
 004613C8    push       ebx
 004613C9    mov        edx,dword ptr [eax+64]; TCompressor.?f64:Pointer
 004613CC    mov        ecx,dword ptr [eax+34]; TCompressor.?f34:dword
 004613CF    add        edx,dword ptr [ecx+3C]
 004613D2    mov        ecx,edx
 004613D4    add        ecx,0F8
 004613DA    movzx      edx,word ptr [edx+6]
 004613DE    dec        edx
 004613DF    test       edx,edx
>004613E1    jbe        004613E9
 004613E3    add        ecx,28
 004613E6    dec        edx
<004613E7    jne        004613E3
 004613E9    mov        edx,dword ptr [eax+50]; TCompressor.?f50:dword
 004613EC    mov        ebx,dword ptr [ecx+10]
 004613EF    add        ebx,dword ptr [ecx+14]
 004613F2    sub        edx,ebx
 004613F4    mov        dword ptr [eax+5C],edx; TCompressor.?f5C:dword
 004613F7    mov        eax,edx
 004613F9    pop        ebx
 004613FA    ret
*}
//end;

//004613FC
//procedure sub_004613FC(?:TCompressor);
//begin
{*
 004613FC    push       ebp
 004613FD    mov        ebp,esp
 004613FF    xor        ecx,ecx
 00461401    push       ecx
 00461402    push       ecx
 00461403    push       ecx
 00461404    push       ecx
 00461405    push       ebx
 00461406    push       esi
 00461407    push       edi
 00461408    mov        ebx,eax
 0046140A    xor        eax,eax
 0046140C    push       ebp
 0046140D    push       461566
 00461412    push       dword ptr fs:[eax]
 00461415    mov        dword ptr fs:[eax],esp
 00461418    mov        eax,dword ptr [ebx+38]; TCompressor.?f38:dword
 0046141B    mov        esi,eax
 0046141D    add        esi,0F8
 00461423    movzx      edi,word ptr [eax+6]
 00461427    test       edi,edi
>00461429    jbe        0046145B
 0046142B    lea        eax,[ebp-0C]
 0046142E    mov        edx,esi
 00461430    mov        ecx,8
 00461435    call       @LStrFromArray
 0046143A    mov        edx,dword ptr [ebp-0C]
 0046143D    mov        eax,46157C; 'shrink'
 00461442    call       @LStrPos
 00461447    test       eax,eax
>00461449    je         00461455
 0046144B    mov        eax,46158C; '03'
 00461450    call       00449E58
 00461455    add        esi,28
 00461458    dec        edi
<00461459    jne        0046142B
 0046145B    mov        eax,dword ptr [ebx+38]; TCompressor.?f38:dword
 0046145E    cmp        dword ptr [eax+34],300000
>00461465    jae        00461475
 00461467    test       byte ptr [eax+17],20
>0046146B    jne        00461475
 0046146D    mov        eax,dword ptr [ebx+30]; TCompressor.?f30:dword
 00461470    call       00460F20
 00461475    mov        eax,dword ptr [ebx+38]; TCompressor.?f38:dword
 00461478    cmp        dword ptr [eax+34],300000
>0046147F    jae        00461491
 00461481    test       byte ptr [eax+17],20
>00461485    jne        00461491
 00461487    mov        eax,461598; '02'
 0046148C    call       00449E58
 00461491    mov        eax,dword ptr [ebx+38]; TCompressor.?f38:dword
 00461494    cmp        dword ptr [eax+0E8],0
>0046149B    je         00461543
 004614A1    cmp        dword ptr [eax+0EC],0
>004614A8    je         00461543
 004614AE    mov        byte ptr [ebp-5],0
 004614B2    mov        esi,dword ptr [eax+80]
 004614B8    test       esi,esi
>004614BA    je         00461533
 004614BC    xor        eax,eax
 004614BE    push       ebp
 004614BF    push       461525
 004614C4    push       dword ptr fs:[eax]
 004614C7    mov        dword ptr fs:[eax],esp
 004614CA    mov        edi,dword ptr [ebx+30]; TCompressor.?f30:dword
 004614CD    mov        eax,edi
 004614CF    add        eax,esi
 004614D1    add        eax,0C
 004614D4    mov        edx,dword ptr [eax]
 004614D6    mov        eax,ebx
 004614D8    call       0046136C
 004614DD    add        eax,edi
 004614DF    mov        edi,eax
 004614E1    lea        edx,[ebp-10]
 004614E4    mov        eax,edi
 004614E6    call       StrPas
 004614EB    mov        eax,dword ptr [ebp-10]
 004614EE    lea        edx,[ebp-4]
 004614F1    call       LowerCase
 004614F6    mov        eax,dword ptr [ebp-4]
 004614F9    mov        edx,4615A4; 'mscoree.dll'
 004614FE    call       @LStrCmp
>00461503    jne        0046150B
 00461505    mov        byte ptr [ebp-5],1
>00461509    jmp        0046151B
 0046150B    add        esi,14
 0046150E    mov        eax,dword ptr [ebx+30]; TCompressor.?f30:dword
 00461511    add        eax,esi
 00461513    add        eax,0C
 00461516    cmp        dword ptr [eax],0
<00461519    jne        004614CA
 0046151B    xor        eax,eax
 0046151D    pop        edx
 0046151E    pop        ecx
 0046151F    pop        ecx
 00461520    mov        dword ptr fs:[eax],edx
>00461523    jmp        00461533
<00461525    jmp        @HandleAnyException
 0046152A    mov        byte ptr [ebp-5],1
 0046152E    call       @DoneExcept
 00461533    cmp        byte ptr [ebp-5],0
>00461537    je         00461543
 00461539    mov        eax,4615B8; '15'
 0046153E    call       00449E58
 00461543    xor        eax,eax
 00461545    pop        edx
 00461546    pop        ecx
 00461547    pop        ecx
 00461548    mov        dword ptr fs:[eax],edx
 0046154B    push       46156D
 00461550    lea        eax,[ebp-10]
 00461553    mov        edx,2
 00461558    call       @LStrArrayClr
 0046155D    lea        eax,[ebp-4]
 00461560    call       @LStrClr
 00461565    ret
<00461566    jmp        @HandleFinally
<0046156B    jmp        00461550
 0046156D    pop        edi
 0046156E    pop        esi
 0046156F    pop        ebx
 00461570    mov        esp,ebp
 00461572    pop        ebp
 00461573    ret
*}
//end;

//004615BC
//function sub_004615BC(?:TCompressor):?;
//begin
{*
 004615BC    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 004615BF    add        eax,0F4
 004615C4    test       byte ptr [eax+2],10
>004615C8    je         004615CD
 004615CA    mov        al,1
 004615CC    ret
 004615CD    xor        eax,eax
 004615CF    ret
*}
//end;

//004615D0
constructor TCompressor.Create;
begin
{*
 004615D0    push       ebp
 004615D1    mov        ebp,esp
 004615D3    add        esp,0FFFFFFF8
 004615D6    push       ebx
 004615D7    push       esi
 004615D8    push       edi
 004615D9    test       dl,dl
>004615DB    je         004615E5
 004615DD    add        esp,0FFFFFFF0
 004615E0    call       @ClassCreate
 004615E5    mov        dword ptr [ebp-8],ecx
 004615E8    mov        byte ptr [ebp-1],dl
 004615EB    mov        ebx,eax
 004615ED    mov        eax,dword ptr [ebp-8]
 004615F0    call       @LStrAddRef
 004615F5    xor        eax,eax
 004615F7    push       ebp
 004615F8    push       461710
 004615FD    push       dword ptr fs:[eax]
 00461600    mov        dword ptr fs:[eax],esp
 00461603    mov        eax,dword ptr [ebp-8]
 00461606    push       eax
 00461607    xor        ecx,ecx
 00461609    xor        edx,edx
 0046160B    mov        eax,ebx
 0046160D    call       00449E74
 00461612    lea        eax,[ebx+290]; TCompressor.?f290:String
 00461618    mov        edx,dword ptr [ebp-8]
 0046161B    call       @LStrAsg
 00461620    xor        eax,eax
 00461622    mov        dword ptr [ebx+12C],eax; TCompressor.?f12C:dword
 00461628    xor        eax,eax
 0046162A    mov        dword ptr [ebx+84],eax; TCompressor.?f84:dword
 00461630    mov        byte ptr [ebx+56],0; TCompressor.?f56:byte
 00461634    mov        byte ptr [ebx+57],0; TCompressor.?f57:byte
 00461638    mov        byte ptr [ebx+61],0; TCompressor.?f61:byte
 0046163C    mov        byte ptr [ebx+134],1; TCompressor.?f134:byte
 00461643    xor        eax,eax
 00461645    mov        dword ptr [ebx+154],eax; TCompressor.?f154:dword
 0046164B    xor        eax,eax
 0046164D    mov        dword ptr [ebx+0A0],eax; TCompressor.?fA0:dword
 00461653    xor        eax,eax
 00461655    mov        dword ptr [ebx+14C],eax; TCompressor.?f14C:dword
 0046165B    xor        eax,eax
 0046165D    mov        dword ptr [ebx+8C],eax; TCompressor.?f8C:dword
 00461663    xor        eax,eax
 00461665    mov        dword ptr [ebx+148],eax; TCompressor.?f148:dword
 0046166B    call       Randomize
 00461670    mov        eax,3
 00461675    call       @RandInt
 0046167A    mov        byte ptr [ebx+25C],al; TCompressor.?f25C:Integer
 00461680    mov        eax,ebx
 00461682    mov        edx,dword ptr [eax]
 00461684    call       dword ptr [edx+58]; TCompressor.sub_00463F40
 00461687    push       eax
 00461688    mov        eax,ebx
 0046168A    mov        edx,dword ptr [eax]
 0046168C    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 0046168F    pop        edx
 00461690    xchg       eax,edx
 00461691    sub        eax,edx
 00461693    call       @GetMem
 00461698    mov        dword ptr [ebx+98],eax; TCompressor.?f98:Pointer
 0046169E    mov        eax,ebx
 004616A0    mov        edx,dword ptr [eax]
 004616A2    call       dword ptr [edx+58]; TCompressor.sub_00463F40
 004616A5    mov        esi,eax
 004616A7    mov        eax,ebx
 004616A9    mov        edx,dword ptr [eax]
 004616AB    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 004616AE    sub        esi,eax
 004616B0    push       esi
 004616B1    mov        eax,ebx
 004616B3    mov        edx,dword ptr [eax]
 004616B5    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 004616B8    mov        edx,dword ptr [ebx+98]; TCompressor.?f98:Pointer
 004616BE    pop        ecx
 004616BF    call       Move
 004616C4    mov        dl,1
 004616C6    mov        eax,[0045E110]; TResPatch
 004616CB    call       TResPatch.Create; TResPatch.Create
 004616D0    mov        dword ptr [ebx+78],eax; TCompressor.?f78:TResPatch
 004616D3    mov        byte ptr [ebx+54],1; TCompressor.?f54:byte
 004616D7    mov        esi,dword ptr [ebx+38]; TCompressor.?f38:dword
 004616DA    add        esi,0F8
 004616E0    mov        eax,dword ptr [esi+14]
 004616E3    call       @GetMem
 004616E8    mov        edi,eax
 004616EA    mov        dword ptr [ebx+64],edi; TCompressor.?f64:Pointer
 004616ED    mov        edx,edi
 004616EF    mov        eax,dword ptr [ebx+30]; TCompressor.?f30:dword
 004616F2    mov        ecx,dword ptr [esi+14]
 004616F5    call       Move
 004616FA    xor        eax,eax
 004616FC    pop        edx
 004616FD    pop        ecx
 004616FE    pop        ecx
 004616FF    mov        dword ptr fs:[eax],edx
 00461702    push       461717
 00461707    lea        eax,[ebp-8]
 0046170A    call       @LStrClr
 0046170F    ret
<00461710    jmp        @HandleFinally
<00461715    jmp        00461707
 00461717    mov        eax,ebx
 00461719    cmp        byte ptr [ebp-1],0
>0046171D    je         0046172E
 0046171F    call       @AfterConstruction
 00461724    pop        dword ptr fs:[0]
 0046172B    add        esp,0C
 0046172E    mov        eax,ebx
 00461730    pop        edi
 00461731    pop        esi
 00461732    pop        ebx
 00461733    pop        ecx
 00461734    pop        ecx
 00461735    pop        ebp
 00461736    ret
*}
end;

//00461738
destructor TCompressor.Destroy;
begin
{*
 00461738    push       ebp
 00461739    mov        ebp,esp
 0046173B    push       ebx
 0046173C    push       esi
 0046173D    call       @BeforeDestruction
 00461742    mov        ebx,edx
 00461744    mov        esi,eax
 00461746    mov        eax,dword ptr [esi+64]; TCompressor.?f64:Pointer
 00461749    call       @FreeMem
 0046174E    mov        eax,dword ptr [esi+78]; TCompressor.?f78:TResPatch
 00461751    call       TObject.Free
 00461756    mov        edx,ebx
 00461758    and        dl,0FC
 0046175B    mov        eax,esi
 0046175D    call       TExeImage.Destroy
 00461762    test       bl,bl
>00461764    jle        0046176D
 00461766    mov        eax,esi
 00461768    call       @ClassDestroy
 0046176D    pop        esi
 0046176E    pop        ebx
 0046176F    pop        ebp
 00461770    ret
*}
end;

//00461774
//function sub_00461774(?:String):?;
//begin
{*
 00461774    push       ebp
 00461775    mov        ebp,esp
 00461777    add        esp,0FFFFFEA4
 0046177D    push       ebx
 0046177E    xor        edx,edx
 00461780    mov        dword ptr [ebp-15C],edx
 00461786    mov        ebx,eax
 00461788    lea        eax,[ebp-158]
 0046178E    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 00461794    call       @InitializeRecord
 00461799    xor        eax,eax
 0046179B    push       ebp
 0046179C    push       46180E
 004617A1    push       dword ptr fs:[eax]
 004617A4    mov        dword ptr fs:[eax],esp
 004617A7    lea        edx,[ebp-15C]
 004617AD    mov        eax,ebx
 004617AF    call       ExpandFileName
 004617B4    mov        eax,dword ptr [ebp-15C]
 004617BA    lea        ecx,[ebp-158]
 004617C0    mov        edx,3F
 004617C5    call       FindFirst
 004617CA    test       eax,eax
>004617CC    jne        004617D6
 004617CE    mov        ebx,dword ptr [ebp-154]
>004617D4    jmp        004617D9
 004617D6    or         ebx,0FFFFFFFF
 004617D9    lea        eax,[ebp-158]
 004617DF    call       FindClose
 004617E4    xor        eax,eax
 004617E6    pop        edx
 004617E7    pop        ecx
 004617E8    pop        ecx
 004617E9    mov        dword ptr fs:[eax],edx
 004617EC    push       461815
 004617F1    lea        eax,[ebp-15C]
 004617F7    call       @LStrClr
 004617FC    lea        eax,[ebp-158]
 00461802    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 00461808    call       @FinalizeRecord
 0046180D    ret
<0046180E    jmp        @HandleFinally
<00461813    jmp        004617F1
 00461815    mov        eax,ebx
 00461817    pop        ebx
 00461818    mov        esp,ebp
 0046181A    pop        ebp
 0046181B    ret
*}
//end;

//0046181C
procedure sub_0046181C;
begin
{*
 0046181C    push       ebp
 0046181D    mov        ebp,esp
 0046181F    mov        ecx,0A
 00461824    push       0
 00461826    push       0
 00461828    dec        ecx
<00461829    jne        00461824
 0046182B    push       ecx
 0046182C    push       ebx
 0046182D    push       esi
 0046182E    push       edi
 0046182F    mov        dword ptr [ebp-4],eax
 00461832    xor        eax,eax
 00461834    push       ebp
 00461835    push       463587
 0046183A    push       dword ptr fs:[eax]
 0046183D    mov        dword ptr fs:[eax],esp
 00461840    push       0
 00461842    call       kernel32.SetLastError
 00461847    push       ebp
 00461848    push       463565
 0046184D    push       dword ptr fs:[0]
 00461854    mov        dword ptr fs:[0],esp
 0046185B    mov        eax,dword ptr [ebp-4]
 0046185E    call       004613FC
 00461863    mov        eax,dword ptr [ebp-4]
 00461866    mov        edx,80
 0046186B    mov        dword ptr [eax+158],edx; TCompressor.?f158:dword
 00461871    mov        eax,dword ptr [ebp-4]
 00461874    mov        eax,dword ptr [eax+158]; TCompressor.?f158:dword
 0046187A    push       eax
 0046187B    mov        eax,dword ptr [ebp-4]
 0046187E    mov        eax,dword ptr [eax+290]; TCompressor.?f290:String
 00461884    call       @LStrToPChar
 00461889    push       eax
 0046188A    call       kernel32.SetFileAttributesA
 0046188F    lea        edx,[ebp-20]
 00461892    mov        eax,dword ptr [ebp-4]
 00461895    mov        eax,dword ptr [eax+290]; TCompressor.?f290:String
 0046189B    call       ExtractFilePath
 004618A0    lea        eax,[ebp-20]
 004618A3    mov        edx,4635A0; '*.tmp'
 004618A8    call       @LStrCat
 004618AD    mov        eax,dword ptr [ebp-20]
 004618B0    call       DeleteFile
 004618B5    mov        eax,dword ptr [ebp-4]
 004618B8    add        eax,15C; TCompressor.?f15C:?
 004618BD    push       eax
 004618BE    push       0
 004618C0    push       4635A8
 004618C5    lea        edx,[ebp-24]
 004618C8    mov        eax,dword ptr [ebp-4]
 004618CB    mov        eax,dword ptr [eax+290]; TCompressor.?f290:String
 004618D1    call       ExtractFilePath
 004618D6    mov        eax,dword ptr [ebp-24]
 004618D9    call       @LStrToPChar
 004618DE    push       eax
 004618DF    call       kernel32.GetTempFileNameA
 004618E4    mov        eax,dword ptr [ebp-4]
 004618E7    add        eax,294; TCompressor.?f294:String
 004618EC    mov        edx,dword ptr [ebp-4]
 004618EF    add        edx,15C; TCompressor.?f15C:?
 004618F5    mov        ecx,100
 004618FA    call       @LStrFromArray
 004618FF    push       0
 00461901    push       0
 00461903    push       2
 00461905    push       0
 00461907    push       3
 00461909    push       0C0000000
 0046190E    mov        eax,dword ptr [ebp-4]
 00461911    mov        eax,dword ptr [eax+294]; TCompressor.?f294:String
 00461917    call       @LStrToPChar
 0046191C    push       eax
 0046191D    call       kernel32.CreateFileA
 00461922    mov        edx,dword ptr [ebp-4]
 00461925    mov        dword ptr [edx+10C],eax; TCompressor.?f10C:Longword
 0046192B    mov        eax,dword ptr [ebp-4]
 0046192E    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461931    mov        edx,dword ptr [ebp-4]
 00461934    mov        dword ptr [edx+0B8],eax; TCompressor.?fB8:dword
 0046193A    mov        eax,dword ptr [ebp-4]
 0046193D    add        dword ptr [eax+0B8],0F8; TCompressor.?fB8:dword
 00461947    mov        eax,dword ptr [ebp-4]
 0046194A    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461950    mov        edx,dword ptr [ebp-4]
 00461953    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461956    movzx      edx,word ptr [edx+6]
 0046195A    add        edx,2
 0046195D    shl        edx,3
 00461960    lea        edx,[edx+edx*4]
 00461963    add        eax,edx
 00461965    mov        dword ptr [ebp-8],eax
 00461968    mov        eax,dword ptr [ebp-4]
 0046196B    mov        edx,dword ptr [ebp-8]
 0046196E    sub        edx,dword ptr [eax+30]
 00461971    mov        eax,dword ptr [ebp-4]
 00461974    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 0046197A    cmp        edx,dword ptr [eax+14]
>0046197D    jbe        004619A8
 0046197F    mov        eax,dword ptr [ebp-4]
 00461982    mov        edx,dword ptr [ebp-8]
 00461985    sub        edx,dword ptr [eax+30]
 00461988    mov        eax,dword ptr [ebp-4]
 0046198B    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461991    sub        edx,dword ptr [eax+14]
 00461994    shr        edx,9
 00461997    inc        edx
 00461998    mov        eax,edx
 0046199A    shl        eax,9
 0046199D    mov        edx,dword ptr [ebp-4]
 004619A0    mov        dword ptr [edx+2A0],eax; TCompressor.?f2A0:dword
>004619A6    jmp        004619FA
 004619A8    mov        eax,dword ptr [ebp-4]
 004619AB    mov        edx,dword ptr [ebp-8]
 004619AE    sub        edx,dword ptr [eax+30]
 004619B1    mov        eax,dword ptr [ebp-4]
 004619B4    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004619BA    mov        eax,dword ptr [eax+14]
 004619BD    sub        eax,edx
 004619BF    cmp        eax,200
>004619C4    jbe        004619EF
 004619C6    mov        eax,dword ptr [ebp-4]
 004619C9    mov        edx,dword ptr [ebp-8]
 004619CC    sub        edx,dword ptr [eax+30]
 004619CF    mov        eax,dword ptr [ebp-4]
 004619D2    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004619D8    sub        edx,dword ptr [eax+14]
 004619DB    shr        edx,9
 004619DE    inc        edx
 004619DF    mov        eax,edx
 004619E1    shl        eax,9
 004619E4    mov        edx,dword ptr [ebp-4]
 004619E7    mov        dword ptr [edx+2A0],eax; TCompressor.?f2A0:dword
>004619ED    jmp        004619FA
 004619EF    mov        eax,dword ptr [ebp-4]
 004619F2    xor        edx,edx
 004619F4    mov        dword ptr [eax+2A0],edx; TCompressor.?f2A0:dword
 004619FA    mov        eax,dword ptr [ebp-4]
 004619FD    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461A00    mov        dword ptr [eax+3C],200
 00461A07    mov        eax,dword ptr [ebp-4]
 00461A0A    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461A0D    mov        eax,dword ptr [eax+54]
 00461A10    mov        edx,dword ptr [ebp-4]
 00461A13    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00461A19    cmp        eax,dword ptr [edx+14]
>00461A1C    je         00461A33
 00461A1E    mov        eax,dword ptr [ebp-4]
 00461A21    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461A27    mov        eax,dword ptr [eax+0C]
 00461A2A    mov        edx,dword ptr [ebp-4]
 00461A2D    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461A30    mov        dword ptr [edx+54],eax
 00461A33    mov        eax,dword ptr [ebp-4]
 00461A36    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461A3C    cmp        dword ptr [eax+14],400
>00461A43    jae        00461A7A
 00461A45    mov        eax,dword ptr [ebp-4]
 00461A48    mov        dword ptr [eax+70],400; TCompressor.?f70:dword
 00461A4F    mov        eax,dword ptr [ebp-4]
 00461A52    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461A58    mov        edx,dword ptr [eax+14]
 00461A5B    sub        edx,400
 00461A61    mov        eax,dword ptr [ebp-4]
 00461A64    call       00463628
 00461A69    mov        eax,dword ptr [ebp-4]
 00461A6C    mov        eax,dword ptr [eax+70]; TCompressor.?f70:dword
 00461A6F    mov        edx,dword ptr [ebp-4]
 00461A72    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461A75    mov        dword ptr [edx+54],eax
>00461A78    jmp        00461A8C
 00461A7A    mov        eax,dword ptr [ebp-4]
 00461A7D    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461A83    mov        eax,dword ptr [eax+14]
 00461A86    mov        edx,dword ptr [ebp-4]
 00461A89    mov        dword ptr [edx+70],eax; TCompressor.?f70:dword
 00461A8C    mov        eax,dword ptr [ebp-4]
 00461A8F    cmp        dword ptr [eax+2A0],0; TCompressor.?f2A0:dword
>00461A96    jge        00461ACB
 00461A98    push       0
 00461A9A    mov        eax,dword ptr [ebp-4]
 00461A9D    add        eax,110; TCompressor.?f110:?
 00461AA2    push       eax
 00461AA3    mov        eax,dword ptr [ebp-4]
 00461AA6    mov        eax,dword ptr [eax+70]; TCompressor.?f70:dword
 00461AA9    mov        edx,dword ptr [ebp-4]
 00461AAC    add        eax,dword ptr [edx+2A0]; TCompressor.?f2A0:dword
 00461AB2    push       eax
 00461AB3    mov        eax,dword ptr [ebp-4]
 00461AB6    mov        eax,dword ptr [eax+30]; TCompressor.?f30:dword
 00461AB9    push       eax
 00461ABA    mov        eax,dword ptr [ebp-4]
 00461ABD    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00461AC3    push       eax
 00461AC4    call       kernel32.WriteFile
>00461AC9    jmp        00461B04
 00461ACB    push       0
 00461ACD    mov        eax,dword ptr [ebp-4]
 00461AD0    add        eax,110; TCompressor.?f110:?
 00461AD5    push       eax
 00461AD6    mov        eax,dword ptr [ebp-4]
 00461AD9    mov        eax,dword ptr [eax+70]; TCompressor.?f70:dword
 00461ADC    push       eax
 00461ADD    mov        eax,dword ptr [ebp-4]
 00461AE0    mov        eax,dword ptr [eax+30]; TCompressor.?f30:dword
 00461AE3    push       eax
 00461AE4    mov        eax,dword ptr [ebp-4]
 00461AE7    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00461AED    push       eax
 00461AEE    call       kernel32.WriteFile
 00461AF3    mov        eax,dword ptr [ebp-4]
 00461AF6    mov        edx,dword ptr [eax+2A0]; TCompressor.?f2A0:dword
 00461AFC    mov        eax,dword ptr [ebp-4]
 00461AFF    call       00463628
 00461B04    mov        eax,dword ptr [ebp-4]
 00461B07    mov        eax,dword ptr [eax+2A0]; TCompressor.?f2A0:dword
 00461B0D    mov        edx,dword ptr [ebp-4]
 00461B10    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461B13    add        dword ptr [edx+54],eax
 00461B16    mov        eax,dword ptr [ebp-4]
 00461B19    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461B1F    cmp        dword ptr [eax+0C],1000
>00461B26    jbe        00461B3D
 00461B28    mov        eax,dword ptr [ebp-4]
 00461B2B    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461B31    mov        eax,dword ptr [eax+0C]
 00461B34    mov        edx,dword ptr [ebp-4]
 00461B37    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461B3A    mov        dword ptr [edx+54],eax
 00461B3D    mov        eax,dword ptr [ebp-4]
 00461B40    mov        eax,dword ptr [eax+70]; TCompressor.?f70:dword
 00461B43    mov        edx,dword ptr [ebp-4]
 00461B46    add        dword ptr [edx+84],eax; TCompressor.?f84:dword
 00461B4C    mov        eax,dword ptr [ebp-4]
 00461B4F    mov        edx,dword ptr [eax]
 00461B51    call       dword ptr [edx+5C]; TCompressor.sub_00463F4C
 00461B54    mov        edx,dword ptr [ebp-4]
 00461B57    mov        dword ptr [edx+120],eax; TCompressor.?f120:dword
 00461B5D    mov        eax,dword ptr [ebp-4]
 00461B60    mov        edx,dword ptr [eax]
 00461B62    call       dword ptr [edx+58]; TCompressor.sub_00463F40
 00461B65    mov        ebx,eax
 00461B67    mov        eax,dword ptr [ebp-4]
 00461B6A    mov        edx,dword ptr [eax]
 00461B6C    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00461B6F    sub        ebx,eax
 00461B71    push       ebx
 00461B72    mov        eax,dword ptr [ebp-4]
 00461B75    mov        edx,dword ptr [eax]
 00461B77    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00461B7A    mov        edx,eax
 00461B7C    mov        eax,dword ptr [ebp-4]
 00461B7F    mov        eax,dword ptr [eax+98]; TCompressor.?f98:Pointer
 00461B85    pop        ecx
 00461B86    call       Move
 00461B8B    mov        eax,dword ptr [ebp-4]
 00461B8E    mov        edx,dword ptr [eax]
 00461B90    call       dword ptr [edx+60]; TCompressor.sub_00463F58
 00461B93    mov        edx,dword ptr [ebp-4]
 00461B96    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461B99    mov        edx,dword ptr [edx+28]
 00461B9C    mov        dword ptr [eax],edx
 00461B9E    mov        eax,dword ptr [ebp-4]
 00461BA1    xor        edx,edx
 00461BA3    mov        dword ptr [eax+150],edx; TCompressor.?f150:dword
 00461BA9    mov        eax,dword ptr [ebp-4]
 00461BAC    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461BAF    cmp        dword ptr [eax+0C0],0
>00461BB6    je         00461C92
 00461BBC    mov        eax,dword ptr [ebp-4]
 00461BBF    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461BC2    test       byte ptr [eax+17],20
>00461BC6    jne        00461C92
 00461BCC    mov        eax,dword ptr [ebp-4]
 00461BCF    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461BD2    mov        edx,dword ptr [ebp-4]
 00461BD5    mov        dword ptr [edx+0B8],eax; TCompressor.?fB8:dword
 00461BDB    mov        eax,dword ptr [ebp-4]
 00461BDE    add        dword ptr [eax+0B8],0F8; TCompressor.?fB8:dword
 00461BE8    mov        eax,dword ptr [ebp-4]
 00461BEB    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461BEE    movzx      esi,word ptr [eax+6]
 00461BF2    test       esi,esi
>00461BF4    jbe        00461C92
 00461BFA    mov        eax,dword ptr [ebp-4]
 00461BFD    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461C00    mov        eax,dword ptr [eax+0C0]
 00461C06    mov        edx,dword ptr [ebp-4]
 00461C09    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00461C0F    cmp        eax,dword ptr [edx+0C]
>00461C12    jb         00461C81
 00461C14    mov        ecx,dword ptr [ebp-4]
 00461C17    mov        ecx,dword ptr [ecx+0B8]
 00461C1D    mov        ecx,dword ptr [ecx+0C]
 00461C20    add        ecx,dword ptr [edx+8]
 00461C23    cmp        eax,ecx
>00461C25    jae        00461C81
 00461C27    mov        ecx,dword ptr [ebp-4]
 00461C2A    mov        ecx,dword ptr [ecx+30]
 00461C2D    add        ecx,dword ptr [edx+14]
 00461C30    mov        edx,dword ptr [ebp-4]
 00461C33    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00461C39    sub        eax,dword ptr [edx+0C]
 00461C3C    add        ecx,eax
 00461C3E    mov        eax,dword ptr [ebp-4]
 00461C41    mov        dword ptr [eax+154],ecx; TCompressor.?f154:dword
 00461C47    mov        eax,dword ptr [ebp-4]
 00461C4A    mov        eax,dword ptr [eax+30]; TCompressor.?f30:dword
 00461C4D    mov        edx,dword ptr [ebp-4]
 00461C50    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00461C56    add        eax,dword ptr [edx+14]
 00461C59    mov        edx,dword ptr [ebp-4]
 00461C5C    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461C5F    mov        edx,dword ptr [edx+0C0]
 00461C65    mov        ecx,dword ptr [ebp-4]
 00461C68    mov        ecx,dword ptr [ecx+0B8]
 00461C6E    sub        edx,dword ptr [ecx+0C]
 00461C71    add        eax,edx
 00461C73    add        eax,8
 00461C76    mov        eax,dword ptr [eax]
 00461C78    mov        edx,dword ptr [ebp-4]
 00461C7B    mov        dword ptr [edx+150],eax; TCompressor.?f150:dword
 00461C81    mov        eax,dword ptr [ebp-4]
 00461C84    add        dword ptr [eax+0B8],28; TCompressor.?fB8:dword
 00461C8B    dec        esi
<00461C8C    jne        00461BFA
 00461C92    mov        eax,dword ptr [ebp-4]
 00461C95    cmp        byte ptr [eax+74],0; TCompressor.?f74:Boolean
>00461C99    je         00461CE5
 00461C9B    lea        edx,[ebp-2C]
 00461C9E    mov        eax,dword ptr [ebp-4]
 00461CA1    mov        eax,dword ptr [eax+290]; TCompressor.?f290:String
 00461CA7    call       ExtractFileName
 00461CAC    mov        eax,dword ptr [ebp-2C]
 00461CAF    lea        edx,[ebp-28]
 00461CB2    call       UpperCase
 00461CB7    mov        eax,dword ptr [ebp-28]
 00461CBA    mov        edx,4635B4; 'WINWORD.EXE'
 00461CBF    call       @LStrCmp
>00461CC4    je         00461CE5
 00461CC6    mov        eax,dword ptr [ebp-4]
 00461CC9    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461CCC    mov        edx,dword ptr [eax+80]
 00461CD2    mov        eax,dword ptr [ebp-4]
 00461CD5    call       0046136C
 00461CDA    mov        edx,dword ptr [ebp-4]
 00461CDD    mov        dword ptr [edx+268],eax; TCompressor.?f268:dword
>00461CE3    jmp        00461CF0
 00461CE5    mov        eax,dword ptr [ebp-4]
 00461CE8    xor        edx,edx
 00461CEA    mov        dword ptr [eax+268],edx; TCompressor.?f268:dword
 00461CF0    mov        eax,dword ptr [ebp-4]
 00461CF3    call       00463E70
 00461CF8    mov        edx,dword ptr [ebp-4]
 00461CFB    mov        dword ptr [edx+0A8],eax; TCompressor.?fA8:dword
 00461D01    mov        eax,dword ptr [ebp-4]
 00461D04    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461D07    mov        edx,dword ptr [ebp-4]
 00461D0A    mov        dword ptr [edx+0B8],eax; TCompressor.?fB8:dword
 00461D10    mov        eax,dword ptr [ebp-4]
 00461D13    add        dword ptr [eax+0B8],0F8; TCompressor.?fB8:dword
 00461D1D    mov        eax,dword ptr [ebp-4]
 00461D20    mov        eax,dword ptr [eax+70]; TCompressor.?f70:dword
 00461D23    mov        edx,dword ptr [ebp-4]
 00461D26    add        eax,dword ptr [edx+2A0]; TCompressor.?f2A0:dword
 00461D2C    mov        edx,dword ptr [ebp-4]
 00461D2F    mov        dword ptr [edx+124],eax; TCompressor.?f124:dword
 00461D35    mov        eax,dword ptr [ebp-4]
 00461D38    mov        eax,dword ptr [eax+50]; TCompressor.?f50:dword
 00461D3B    mov        edx,dword ptr [ebp-4]
 00461D3E    mov        dword ptr [edx+88],eax; TCompressor.?f88:dword
 00461D44    mov        eax,dword ptr [ebp-4]
 00461D47    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00461D4A    movzx      esi,word ptr [eax+6]
 00461D4E    test       esi,esi
>00461D50    jbe        00462852
 00461D56    mov        ebx,1
 00461D5B    mov        eax,dword ptr [ebp-4]
 00461D5E    mov        ecx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461D64    cmp        dword ptr [ecx+8],0
>00461D68    jne        00461DA1
 00461D6A    mov        edi,dword ptr [ecx+10]
 00461D6D    mov        dword ptr [ecx+8],edi
 00461D70    mov        eax,edi
 00461D72    mov        edx,dword ptr [ebp-4]
 00461D75    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461D78    push       ecx
 00461D79    mov        ecx,dword ptr [edx+38]
 00461D7C    xor        edx,edx
 00461D7E    div        eax,ecx
 00461D80    pop        ecx
 00461D81    test       edx,edx
>00461D83    jbe        00461DA1
 00461D85    mov        eax,edi
 00461D87    mov        edx,dword ptr [ebp-4]
 00461D8A    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461D8D    mov        edi,dword ptr [edx+38]
 00461D90    xor        edx,edx
 00461D92    div        eax,edi
 00461D94    inc        eax
 00461D95    mov        edx,dword ptr [ebp-4]
 00461D98    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00461D9B    imul       dword ptr [edx+38]
 00461D9E    mov        dword ptr [ecx+8],eax
 00461DA1    mov        eax,dword ptr [ebp-4]
 00461DA4    mov        edx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461DAA    mov        eax,dword ptr [ebp-4]
 00461DAD    call       00461198
 00461DB2    test       al,al
>00461DB4    je         00461DCA
 00461DB6    mov        eax,dword ptr [ebp-4]
 00461DB9    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461DBF    mov        edx,dword ptr [eax+10]
 00461DC2    mov        eax,dword ptr [ebp-4]
 00461DC5    call       004611D0
 00461DCA    mov        eax,dword ptr [ebp-4]
 00461DCD    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461DD3    mov        edx,dword ptr [eax+24]
 00461DD6    mov        dword ptr [ebp-0C],edx
 00461DD9    or         dword ptr [eax+24],0C0000040
 00461DE0    lea        eax,[ebp-34]
 00461DE3    mov        edx,dword ptr [ebp-4]
 00461DE6    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00461DEC    mov        ecx,8
 00461DF1    call       @LStrFromArray
 00461DF6    mov        eax,dword ptr [ebp-34]
 00461DF9    lea        edx,[ebp-30]
 00461DFC    call       Trim
 00461E01    mov        eax,dword ptr [ebp-30]
 00461E04    mov        edx,4635C8; '.reloc'
 00461E09    call       @LStrCmp
>00461E0E    je         00461E40
 00461E10    lea        eax,[ebp-3C]
 00461E13    mov        edx,dword ptr [ebp-4]
 00461E16    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00461E1C    mov        ecx,8
 00461E21    call       @LStrFromArray
 00461E26    mov        eax,dword ptr [ebp-3C]
 00461E29    lea        edx,[ebp-38]
 00461E2C    call       Trim
 00461E31    mov        eax,dword ptr [ebp-38]
 00461E34    mov        edx,4635D8; '.rsrc'
 00461E39    call       @LStrCmp
>00461E3E    jne        00461E50
 00461E40    mov        eax,dword ptr [ebp-4]
 00461E43    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461E49    and        dword ptr [eax+24],0EFFFFFFF
 00461E50    mov        eax,dword ptr [ebp-4]
 00461E53    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461E59    mov        eax,dword ptr [eax+0C]
 00461E5C    mov        edx,dword ptr [ebp-4]
 00461E5F    mov        edx,dword ptr [edx+120]; TCompressor.?f120:dword
 00461E65    mov        dword ptr [edx],eax
 00461E67    mov        eax,dword ptr [ebp-4]
 00461E6A    mov        eax,dword ptr [eax+120]; TCompressor.?f120:dword
 00461E70    add        eax,4
 00461E73    mov        dword ptr [eax],0FFFFFEF2
 00461E79    mov        eax,dword ptr [ebp-4]
 00461E7C    mov        eax,dword ptr [eax+120]; TCompressor.?f120:dword
 00461E82    add        eax,8
 00461E85    mov        edx,dword ptr [ebp-0C]
 00461E88    mov        dword ptr [eax],edx
 00461E8A    mov        eax,dword ptr [ebp-4]
 00461E8D    mov        edx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461E93    mov        eax,dword ptr [ebp-4]
 00461E96    call       004612A0
 00461E9B    test       al,al
>00461E9D    je         004626B5
 00461EA3    mov        dl,1
 00461EA5    mov        eax,[0045E56C]; TLZB
 00461EAA    call       TLZB.Create; TLZB.Create
 00461EAF    mov        edi,eax
 00461EB1    mov        eax,dword ptr [ebp-4]
 00461EB4    mov        dword ptr [eax+28C],edi; TCompressor.?f28C:TLZB
 00461EBA    mov        dword ptr [ebp-18],edi
 00461EBD    mov        eax,dword ptr [ebp-4]
 00461EC0    cmp        byte ptr [eax+58],0; TCompressor.?f58:byte
>00461EC4    je         00461ECA
 00461EC6    mov        byte ptr [edi+25],1; TLZB.?f25:byte
 00461ECA    mov        eax,dword ptr [ebp-4]
 00461ECD    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461ED3    mov        eax,dword ptr [eax+10]
 00461ED6    call       @GetMem
 00461EDB    mov        edi,eax
 00461EDD    mov        eax,dword ptr [ebp-4]
 00461EE0    mov        dword ptr [eax+128],edi; TCompressor.?f128:Pointer
 00461EE6    test       edi,edi
>00461EE8    jne        00461EF4
 00461EEA    mov        eax,4635E8; '12'
 00461EEF    call       00449E58
 00461EF4    mov        eax,dword ptr [ebp-4]
 00461EF7    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461EFD    mov        eax,dword ptr [eax+10]
 00461F00    mov        edx,dword ptr [ebp-4]
 00461F03    mov        dword ptr [edx+130],eax; TCompressor.?f130:dword
 00461F09    mov        edx,dword ptr [ebp-4]
 00461F0C    mov        edx,dword ptr [edx+30]; TCompressor.?f30:dword
 00461F0F    mov        eax,dword ptr [ebp-4]
 00461F12    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461F18    add        edx,dword ptr [eax+14]
 00461F1B    mov        ecx,dword ptr [eax+10]
 00461F1E    mov        eax,dword ptr [ebp-4]
 00461F21    mov        eax,dword ptr [eax+128]; TCompressor.?f128:Pointer
 00461F27    xchg       eax,edx
 00461F28    call       Move
 00461F2D    mov        eax,dword ptr [ebp-4]
 00461F30    cmp        byte ptr [eax+134],0; TCompressor.?f134:byte
>00461F37    je         00461FB7
 00461F39    mov        eax,dword ptr [ebp-4]
 00461F3C    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461F42    mov        ecx,dword ptr [eax+10]
 00461F45    mov        eax,dword ptr [ebp-4]
 00461F48    mov        edx,dword ptr [eax+128]; TCompressor.?f128:Pointer
 00461F4E    mov        eax,dword ptr [ebp-4]
 00461F51    mov        edi,dword ptr [eax]
 00461F53    call       dword ptr [edi+30]; TCompressor.sub_00463F08
 00461F56    mov        eax,dword ptr [ebp-4]
 00461F59    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461F5F    mov        ecx,dword ptr [eax+10]
 00461F62    mov        eax,dword ptr [ebp-4]
 00461F65    mov        edx,dword ptr [eax+128]; TCompressor.?f128:Pointer
 00461F6B    mov        eax,dword ptr [ebp-4]
 00461F6E    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 00461F74    call       0045E68C
 00461F79    mov        eax,dword ptr [ebp-4]
 00461F7C    mov        edx,dword ptr [eax]
 00461F7E    call       dword ptr [edx+0C4]; TCompressor.sub_0046405C
 00461F84    push       eax
 00461F85    mov        eax,dword ptr [ebp-4]
 00461F88    mov        edx,dword ptr [eax]
 00461F8A    call       dword ptr [edx+0C0]; TCompressor.sub_00464050
 00461F90    push       eax
 00461F91    mov        eax,dword ptr [ebp-4]
 00461F94    mov        edx,dword ptr [eax]
 00461F96    call       dword ptr [edx+0BC]; TCompressor.sub_00464044
 00461F9C    mov        edx,eax
 00461F9E    mov        eax,dword ptr [ebp-4]
 00461FA1    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 00461FA7    pop        ecx
 00461FA8    call       0045E760
 00461FAD    mov        eax,dword ptr [ebp-4]
 00461FB0    mov        byte ptr [eax+134],0; TCompressor.?f134:byte
 00461FB7    mov        eax,dword ptr [ebp-4]
 00461FBA    mov        edx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00461FC0    mov        eax,dword ptr [ebp-4]
 00461FC3    call       00461290
 00461FC8    test       al,al
>00461FCA    je         00462089
 00461FD0    xor        eax,eax
 00461FD2    push       ebp
 00461FD3    push       46202F
 00461FD8    push       dword ptr fs:[eax]
 00461FDB    mov        dword ptr fs:[eax],esp
 00461FDE    mov        eax,dword ptr [ebp-4]
 00461FE1    call       00463884
 00461FE6    mov        eax,dword ptr [ebp-4]
 00461FE9    cmp        byte ptr [eax+57],0; TCompressor.?f57:byte
>00461FED    je         00462014
 00461FEF    mov        eax,dword ptr [ebp-4]
 00461FF2    mov        edx,dword ptr [eax+30]; TCompressor.?f30:dword
 00461FF5    mov        eax,dword ptr [ebp-4]
 00461FF8    mov        eax,dword ptr [eax+78]; TCompressor.?f78:TResPatch
 00461FFB    call       0045E32C
 00462000    mov        eax,dword ptr [ebp-4]
 00462003    mov        edx,dword ptr [eax+128]; TCompressor.?f128:Pointer
 00462009    mov        eax,dword ptr [ebp-4]
 0046200C    mov        eax,dword ptr [eax+78]; TCompressor.?f78:TResPatch
 0046200F    call       0045E510
 00462014    mov        eax,dword ptr [ebp-4]
 00462017    mov        edx,dword ptr [eax+128]; TCompressor.?f128:Pointer
 0046201D    mov        eax,dword ptr [ebp-4]
 00462020    call       00463948
 00462025    xor        eax,eax
 00462027    pop        edx
 00462028    pop        ecx
 00462029    pop        ecx
 0046202A    mov        dword ptr fs:[eax],edx
>0046202D    jmp        00462052
<0046202F    jmp        @HandleAnyException
 00462034    mov        eax,4635F4; '04'
 00462039    call       00449E58
 0046203E    call       @DoneExcept
 00462043    call       @TryFinallyExit
>00462048    jmp        0046356C
 0046204D    call       @DoneExcept
 00462052    mov        eax,dword ptr [ebp-4]
 00462055    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 0046205B    mov        edx,dword ptr [eax+10]
 0046205E    mov        eax,dword ptr [ebp-4]
 00462061    sub        edx,dword ptr [eax+0A0]
 00462067    mov        eax,dword ptr [ebp-18]
 0046206A    call       0045E7B4
 0046206F    mov        eax,dword ptr [ebp-4]
 00462072    mov        eax,dword ptr [eax+128]; TCompressor.?f128:Pointer
 00462078    mov        edx,dword ptr [ebp-4]
 0046207B    add        eax,dword ptr [edx+0A0]; TCompressor.?fA0:dword
 00462081    mov        edx,dword ptr [ebp-18]
 00462084    mov        dword ptr [edx+28],eax; TLZB.?f28:Pointer
>00462087    jmp        004620AC
 00462089    mov        eax,dword ptr [ebp-4]
 0046208C    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462092    mov        edx,dword ptr [eax+10]
 00462095    mov        eax,dword ptr [ebp-18]
 00462098    call       0045E7B4
 0046209D    mov        eax,dword ptr [ebp-4]
 004620A0    mov        eax,dword ptr [eax+128]; TCompressor.?f128:Pointer
 004620A6    mov        edx,dword ptr [ebp-18]
 004620A9    mov        dword ptr [edx+28],eax; TLZB.?f28:Pointer
 004620AC    mov        eax,dword ptr [ebp-18]
 004620AF    mov        eax,dword ptr [eax+1C]; TLZB.?f1C:dword
 004620B2    call       @GetMem
 004620B7    mov        edi,eax
 004620B9    mov        eax,dword ptr [ebp-4]
 004620BC    mov        dword ptr [eax+280],edi; TCompressor.?f280:Pointer
 004620C2    test       edi,edi
>004620C4    jne        004620D0
 004620C6    mov        eax,4635E8; '12'
 004620CB    call       00449E58
 004620D0    mov        eax,dword ptr [ebp-4]
 004620D3    mov        eax,dword ptr [eax+280]; TCompressor.?f280:Pointer
 004620D9    mov        edx,dword ptr [ebp-18]
 004620DC    mov        dword ptr [edx+2C],eax; TLZB.?f2C:Pointer
 004620DF    mov        eax,dword ptr [ebp-4]
 004620E2    mov        eax,dword ptr [eax+284]; TCompressor.?f284:dword
 004620E8    mov        edx,dword ptr [ebp-18]
 004620EB    mov        dword ptr [edx+4],eax; TLZB.?f4:dword
 004620EE    mov        eax,dword ptr [ebp-18]
 004620F1    call       0045E7C4
 004620F6    mov        eax,dword ptr [ebp-4]
 004620F9    cmp        byte ptr [eax+94],0; TCompressor.?f94:byte
>00462100    je         0046210C
 00462102    mov        eax,463600; '05'
 00462107    call       00449E58
 0046210C    mov        eax,dword ptr [ebp-4]
 0046210F    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 00462115    mov        eax,dword ptr [eax+10]; TLZB.?f10:dword
 00462118    mov        edx,dword ptr [ebp-4]
 0046211B    mov        dword ptr [edx+114],eax; TCompressor.?f114:dword
 00462121    mov        eax,dword ptr [ebp-4]
 00462124    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 0046212A    mov        ecx,dword ptr [eax+10]; TLZB.?f10:dword
 0046212D    mov        edx,dword ptr [eax+2C]; TLZB.?f2C:Pointer
 00462130    mov        eax,dword ptr [ebp-4]
 00462133    mov        edi,dword ptr [eax]
 00462135    call       dword ptr [edi+34]; TCompressor.sub_00463F10
 00462138    mov        eax,dword ptr [ebp-4]
 0046213B    mov        eax,dword ptr [eax+114]; TCompressor.?f114:dword
 00462141    mov        edx,dword ptr [ebp-4]
 00462144    mov        edi,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 0046214A    cmp        eax,dword ptr [edi+8]
>0046214D    ja         0046252E
 00462153    mov        edx,edi
 00462155    mov        eax,dword ptr [ebp-4]
 00462158    call       00461290
 0046215D    test       al,al
>0046215F    je         00462173
 00462161    mov        eax,dword ptr [ebp-4]
 00462164    mov        eax,dword ptr [eax+0A0]; TCompressor.?fA0:dword
 0046216A    mov        edx,dword ptr [ebp-4]
 0046216D    add        dword ptr [edx+114],eax; TCompressor.?f114:dword
 00462173    mov        eax,dword ptr [ebp-4]
 00462176    mov        eax,dword ptr [eax+114]; TCompressor.?f114:dword
 0046217C    mov        edx,dword ptr [ebp-4]
 0046217F    mov        dword ptr [edx+118],eax; TCompressor.?f118:Integer
 00462185    mov        eax,dword ptr [ebp-4]
 00462188    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 0046218E    mov        eax,dword ptr [eax+10]
 00462191    mov        edx,dword ptr [ebp-4]
 00462194    sub        eax,dword ptr [edx+118]
 0046219A    mov        edx,dword ptr [ebp-4]
 0046219D    add        dword ptr [edx+8C],eax; TCompressor.?f8C:dword
 004621A3    lea        eax,[ebp-44]
 004621A6    mov        edx,dword ptr [ebp-4]
 004621A9    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 004621AF    mov        ecx,8
 004621B4    call       @LStrFromArray
 004621B9    mov        eax,dword ptr [ebp-44]
 004621BC    lea        edx,[ebp-40]
 004621BF    call       Trim
 004621C4    mov        eax,dword ptr [ebp-40]
 004621C7    mov        edx,4635C8; '.reloc'
 004621CC    call       @LStrCmp
>004621D1    jne        00462215
 004621D3    mov        eax,dword ptr [ebp-4]
 004621D6    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 004621D9    test       byte ptr [eax+17],20
>004621DD    jne        00462215
 004621DF    mov        eax,dword ptr [ebp-4]
 004621E2    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 004621E5    test       byte ptr [eax+5E],40
>004621E9    jne        00462215
 004621EB    mov        eax,dword ptr [ebp-4]
 004621EE    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 004621F1    cmp        dword ptr [eax+34],400000
>004621F8    jne        00462215
 004621FA    mov        eax,dword ptr [ebp-4]
 004621FD    xor        edx,edx
 004621FF    mov        dword ptr [eax+114],edx; TCompressor.?f114:dword
 00462205    mov        eax,dword ptr [ebp-4]
 00462208    xor        edx,edx
 0046220A    mov        dword ptr [eax+118],edx; TCompressor.?f118:Integer
>00462210    jmp        00462309
 00462215    mov        eax,dword ptr [ebp-4]
 00462218    mov        eax,dword ptr [eax+118]; TCompressor.?f118:Integer
 0046221E    mov        edx,dword ptr [ebp-4]
 00462221    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462224    mov        ecx,dword ptr [edx+3C]
 00462227    xor        edx,edx
 00462229    div        eax,ecx
 0046222B    test       edx,edx
>0046222D    jbe        00462258
 0046222F    mov        eax,dword ptr [ebp-4]
 00462232    mov        eax,dword ptr [eax+118]; TCompressor.?f118:Integer
 00462238    mov        edx,dword ptr [ebp-4]
 0046223B    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046223E    mov        ecx,dword ptr [edx+3C]
 00462241    xor        edx,edx
 00462243    div        eax,ecx
 00462245    inc        eax
 00462246    mov        edx,dword ptr [ebp-4]
 00462249    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046224C    imul       dword ptr [edx+3C]
 0046224F    mov        edx,dword ptr [ebp-4]
 00462252    mov        dword ptr [edx+118],eax; TCompressor.?f118:Integer
 00462258    mov        eax,dword ptr [ebp-4]
 0046225B    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462261    mov        eax,dword ptr [eax+0C]
 00462264    mov        edx,dword ptr [ebp-4]
 00462267    mov        edx,dword ptr [edx+120]; TCompressor.?f120:dword
 0046226D    mov        dword ptr [edx],eax
 0046226F    mov        eax,dword ptr [ebp-4]
 00462272    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462278    mov        eax,dword ptr [eax+10]
 0046227B    mov        edx,dword ptr [ebp-4]
 0046227E    mov        edx,dword ptr [edx+120]; TCompressor.?f120:dword
 00462284    add        edx,4
 00462287    mov        dword ptr [edx],eax
 00462289    mov        eax,dword ptr [ebp-4]
 0046228C    mov        eax,dword ptr [eax+120]; TCompressor.?f120:dword
 00462292    add        eax,8
 00462295    mov        edx,dword ptr [ebp-0C]
 00462298    mov        dword ptr [eax],edx
 0046229A    mov        eax,dword ptr [ebp-4]
 0046229D    mov        edx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004622A3    mov        eax,dword ptr [ebp-4]
 004622A6    call       00461290
 004622AB    test       al,al
>004622AD    je         004622EC
 004622AF    mov        eax,dword ptr [ebp-4]
 004622B2    mov        eax,dword ptr [eax+124]; TCompressor.?f124:dword
 004622B8    mov        edx,dword ptr [ebp-4]
 004622BB    mov        dword ptr [edx+12C],eax; TCompressor.?f12C:dword
 004622C1    mov        eax,dword ptr [ebp-4]
 004622C4    mov        eax,dword ptr [eax+0A0]; TCompressor.?fA0:dword
 004622CA    mov        edx,dword ptr [ebp-4]
 004622CD    mov        edx,dword ptr [edx+120]; TCompressor.?f120:dword
 004622D3    add        dword ptr [edx],eax
 004622D5    mov        eax,dword ptr [ebp-4]
 004622D8    mov        eax,dword ptr [eax+0A0]; TCompressor.?fA0:dword
 004622DE    mov        edx,dword ptr [ebp-4]
 004622E1    mov        edx,dword ptr [edx+120]; TCompressor.?f120:dword
 004622E7    add        edx,4
 004622EA    sub        dword ptr [edx],eax
 004622EC    mov        eax,dword ptr [ebp-4]
 004622EF    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 004622F5    mov        ecx,dword ptr [eax+10]; TLZB.?f10:dword
 004622F8    mov        eax,dword ptr [ebp-4]
 004622FB    lea        edx,[eax+120]; TCompressor.?f120:dword
 00462301    mov        eax,dword ptr [ebp-4]
 00462304    mov        edi,dword ptr [eax]
 00462306    call       dword ptr [edi+38]; TCompressor.sub_00463F0C
 00462309    mov        eax,dword ptr [ebp-4]
 0046230C    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462312    mov        eax,dword ptr [eax+0C]
 00462315    mov        edx,dword ptr [ebp-4]
 00462318    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046231B    add        eax,dword ptr [edx+34]
 0046231E    mov        edx,dword ptr [ebp-4]
 00462321    cmp        eax,dword ptr [edx+150]; TCompressor.?f150:dword
>00462327    ja         004623B6
 0046232D    mov        eax,dword ptr [ebp-4]
 00462330    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462336    mov        eax,dword ptr [eax+0C]
 00462339    mov        edx,dword ptr [ebp-4]
 0046233C    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046233F    add        eax,dword ptr [edx+34]
 00462342    mov        edx,dword ptr [ebp-4]
 00462345    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 0046234B    add        eax,dword ptr [edx+10]
 0046234E    mov        edx,dword ptr [ebp-4]
 00462351    cmp        eax,dword ptr [edx+150]; TCompressor.?f150:dword
>00462357    jb         004623B6
 00462359    mov        eax,dword ptr [ebp-4]
 0046235C    cmp        dword ptr [eax+150],0; TCompressor.?f150:dword
>00462363    je         004623B6
 00462365    mov        eax,dword ptr [ebp-4]
 00462368    mov        edx,dword ptr [eax]
 0046236A    call       dword ptr [edx+0A0]; TCompressor.sub_00464000
 00462370    mov        edx,dword ptr [ebp-4]
 00462373    mov        edx,dword ptr [edx+150]; TCompressor.?f150:dword
 00462379    mov        dword ptr [eax],edx
 0046237B    mov        eax,dword ptr [ebp-4]
 0046237E    mov        edx,dword ptr [eax]
 00462380    call       dword ptr [edx+0A4]; TCompressor.sub_0046400C
 00462386    mov        edx,dword ptr [ebp-4]
 00462389    mov        edx,dword ptr [edx+28C]; TCompressor.?f28C:TLZB
 0046238F    mov        edx,dword ptr [edx+2C]; TLZB.?f2C:Pointer
 00462392    mov        ecx,dword ptr [ebp-4]
 00462395    add        edx,dword ptr [ecx+150]
 0046239B    mov        ecx,dword ptr [ebp-4]
 0046239E    mov        ecx,dword ptr [ecx+0B8]
 004623A4    mov        ecx,dword ptr [ecx+0C]
 004623A7    mov        edi,dword ptr [ebp-4]
 004623AA    mov        edi,dword ptr [edi+38]; TCompressor.?f38:dword
 004623AD    add        ecx,dword ptr [edi+34]
 004623B0    sub        edx,ecx
 004623B2    mov        edx,dword ptr [edx]
 004623B4    mov        dword ptr [eax],edx
 004623B6    mov        eax,dword ptr [ebp-4]
 004623B9    mov        eax,dword ptr [eax+118]; TCompressor.?f118:Integer
 004623BF    mov        edx,dword ptr [ebp-4]
 004623C2    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 004623C8    mov        dword ptr [edx+10],eax
 004623CB    mov        eax,dword ptr [ebp-4]
 004623CE    mov        eax,dword ptr [eax+124]; TCompressor.?f124:dword
 004623D4    mov        edx,dword ptr [ebp-4]
 004623D7    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 004623DD    mov        dword ptr [edx+14],eax
 004623E0    mov        eax,dword ptr [ebp-4]
 004623E3    mov        eax,dword ptr [eax+130]; TCompressor.?f130:dword
 004623E9    mov        edx,dword ptr [ebp-4]
 004623EC    add        dword ptr [edx+84],eax; TCompressor.?f84:dword
 004623F2    mov        eax,dword ptr [ebp-4]
 004623F5    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004623FB    mov        eax,dword ptr [eax+8]
 004623FE    mov        edx,dword ptr [ebp-4]
 00462401    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462404    mov        ecx,dword ptr [edx+38]
 00462407    xor        edx,edx
 00462409    div        eax,ecx
 0046240B    test       edx,edx
>0046240D    jbe        0046243E
 0046240F    mov        eax,dword ptr [ebp-4]
 00462412    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462418    mov        eax,dword ptr [eax+8]
 0046241B    mov        edx,dword ptr [ebp-4]
 0046241E    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462421    mov        ecx,dword ptr [edx+38]
 00462424    xor        edx,edx
 00462426    div        eax,ecx
 00462428    inc        eax
 00462429    mov        edx,dword ptr [ebp-4]
 0046242C    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046242F    imul       dword ptr [edx+38]
 00462432    mov        edx,dword ptr [ebp-4]
 00462435    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 0046243B    mov        dword ptr [edx+8],eax
 0046243E    mov        eax,dword ptr [ebp-4]
 00462441    mov        edx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462447    mov        eax,dword ptr [ebp-4]
 0046244A    call       00461290
 0046244F    test       al,al
>00462451    je         004624DE
 00462457    push       0
 00462459    mov        eax,dword ptr [ebp-4]
 0046245C    add        eax,110; TCompressor.?f110:?
 00462461    push       eax
 00462462    mov        eax,dword ptr [ebp-4]
 00462465    mov        eax,dword ptr [eax+0A0]; TCompressor.?fA0:dword
 0046246B    push       eax
 0046246C    mov        eax,dword ptr [ebp-4]
 0046246F    mov        eax,dword ptr [eax+128]; TCompressor.?f128:Pointer
 00462475    push       eax
 00462476    mov        eax,dword ptr [ebp-4]
 00462479    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 0046247F    push       eax
 00462480    call       kernel32.WriteFile
 00462485    push       0
 00462487    mov        eax,dword ptr [ebp-4]
 0046248A    add        eax,110; TCompressor.?f110:?
 0046248F    push       eax
 00462490    mov        eax,dword ptr [ebp-4]
 00462493    mov        eax,dword ptr [eax+114]; TCompressor.?f114:dword
 00462499    mov        edx,dword ptr [ebp-4]
 0046249C    sub        eax,dword ptr [edx+0A0]
 004624A2    push       eax
 004624A3    mov        eax,dword ptr [ebp-4]
 004624A6    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 004624AC    mov        eax,dword ptr [eax+2C]; TLZB.?f2C:Pointer
 004624AF    push       eax
 004624B0    mov        eax,dword ptr [ebp-4]
 004624B3    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 004624B9    push       eax
 004624BA    call       kernel32.WriteFile
 004624BF    mov        eax,dword ptr [ebp-4]
 004624C2    mov        edx,dword ptr [eax+118]; TCompressor.?f118:Integer
 004624C8    mov        eax,dword ptr [ebp-4]
 004624CB    sub        edx,dword ptr [eax+114]
 004624D1    mov        eax,dword ptr [ebp-4]
 004624D4    call       00463628
>004624D9    jmp        00462671
 004624DE    push       0
 004624E0    mov        eax,dword ptr [ebp-4]
 004624E3    add        eax,110; TCompressor.?f110:?
 004624E8    push       eax
 004624E9    mov        eax,dword ptr [ebp-4]
 004624EC    mov        eax,dword ptr [eax+114]; TCompressor.?f114:dword
 004624F2    push       eax
 004624F3    mov        eax,dword ptr [ebp-4]
 004624F6    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 004624FC    mov        eax,dword ptr [eax+2C]; TLZB.?f2C:Pointer
 004624FF    push       eax
 00462500    mov        eax,dword ptr [ebp-4]
 00462503    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00462509    push       eax
 0046250A    call       kernel32.WriteFile
 0046250F    mov        eax,dword ptr [ebp-4]
 00462512    mov        edx,dword ptr [eax+118]; TCompressor.?f118:Integer
 00462518    mov        eax,dword ptr [ebp-4]
 0046251B    sub        edx,dword ptr [eax+114]
 00462521    mov        eax,dword ptr [ebp-4]
 00462524    call       00463628
>00462529    jmp        00462671
 0046252E    push       0
 00462530    mov        eax,dword ptr [ebp-4]
 00462533    add        eax,110; TCompressor.?f110:?
 00462538    push       eax
 00462539    mov        eax,dword ptr [edi+10]
 0046253C    push       eax
 0046253D    mov        eax,dword ptr [ebp-4]
 00462540    mov        eax,dword ptr [eax+30]; TCompressor.?f30:dword
 00462543    add        eax,dword ptr [edi+14]
 00462546    push       eax
 00462547    mov        eax,dword ptr [ebp-4]
 0046254A    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00462550    push       eax
 00462551    call       kernel32.WriteFile
 00462556    mov        eax,dword ptr [ebp-4]
 00462559    xor        edx,edx
 0046255B    mov        dword ptr [eax+118],edx; TCompressor.?f118:Integer
 00462561    mov        eax,dword ptr [ebp-4]
 00462564    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 0046256A    mov        eax,dword ptr [eax+10]
 0046256D    mov        edx,dword ptr [ebp-4]
 00462570    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462573    mov        ecx,dword ptr [edx+3C]
 00462576    xor        edx,edx
 00462578    div        eax,ecx
 0046257A    test       edx,edx
>0046257C    jbe        004625C7
 0046257E    mov        eax,dword ptr [ebp-4]
 00462581    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462587    mov        eax,dword ptr [eax+10]
 0046258A    mov        edx,dword ptr [ebp-4]
 0046258D    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462590    mov        ecx,dword ptr [edx+3C]
 00462593    xor        edx,edx
 00462595    div        eax,ecx
 00462597    inc        eax
 00462598    mov        edx,dword ptr [ebp-4]
 0046259B    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046259E    imul       dword ptr [edx+3C]
 004625A1    mov        edx,dword ptr [ebp-4]
 004625A4    mov        dword ptr [edx+118],eax; TCompressor.?f118:Integer
 004625AA    mov        eax,dword ptr [ebp-4]
 004625AD    mov        edx,dword ptr [eax+118]; TCompressor.?f118:Integer
 004625B3    mov        eax,dword ptr [ebp-4]
 004625B6    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004625BC    sub        edx,dword ptr [eax+10]
 004625BF    mov        eax,dword ptr [ebp-4]
 004625C2    call       00463628
 004625C7    mov        eax,dword ptr [ebp-4]
 004625CA    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004625D0    mov        eax,dword ptr [eax+8]
 004625D3    mov        edx,dword ptr [ebp-4]
 004625D6    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 004625D9    mov        ecx,dword ptr [edx+38]
 004625DC    xor        edx,edx
 004625DE    div        eax,ecx
 004625E0    test       edx,edx
>004625E2    jbe        00462613
 004625E4    mov        eax,dword ptr [ebp-4]
 004625E7    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004625ED    mov        eax,dword ptr [eax+8]
 004625F0    mov        edx,dword ptr [ebp-4]
 004625F3    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 004625F6    mov        ecx,dword ptr [edx+38]
 004625F9    xor        edx,edx
 004625FB    div        eax,ecx
 004625FD    inc        eax
 004625FE    mov        edx,dword ptr [ebp-4]
 00462601    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462604    imul       dword ptr [edx+38]
 00462607    mov        edx,dword ptr [ebp-4]
 0046260A    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00462610    mov        dword ptr [edx+8],eax
 00462613    mov        eax,dword ptr [ebp-4]
 00462616    mov        eax,dword ptr [eax+124]; TCompressor.?f124:dword
 0046261C    mov        edx,dword ptr [ebp-4]
 0046261F    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00462625    mov        dword ptr [edx+14],eax
 00462628    mov        eax,dword ptr [ebp-4]
 0046262B    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462631    mov        eax,dword ptr [eax+10]
 00462634    mov        edx,dword ptr [ebp-4]
 00462637    add        dword ptr [edx+84],eax; TCompressor.?f84:dword
 0046263D    mov        eax,dword ptr [ebp-4]
 00462640    cmp        dword ptr [eax+118],0; TCompressor.?f118:Integer
>00462647    je         0046265E
 00462649    mov        eax,dword ptr [ebp-4]
 0046264C    mov        eax,dword ptr [eax+118]; TCompressor.?f118:Integer
 00462652    mov        edx,dword ptr [ebp-4]
 00462655    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 0046265B    mov        dword ptr [edx+10],eax
 0046265E    cmp        ebx,1
>00462661    jne        00462671
 00462663    mov        eax,dword ptr [ebp-4]
 00462666    mov        edx,dword ptr [eax]
 00462668    call       dword ptr [edx+0AC]; TCompressor.sub_00464024
 0046266E    mov        byte ptr [eax],1
 00462671    mov        eax,dword ptr [ebp-4]
 00462674    mov        edx,dword ptr [eax+130]; TCompressor.?f130:dword
 0046267A    mov        eax,dword ptr [ebp-4]
 0046267D    mov        eax,dword ptr [eax+128]; TCompressor.?f128:Pointer
 00462683    call       @FreeMem
 00462688    mov        eax,dword ptr [ebp-4]
 0046268B    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 00462691    mov        edx,dword ptr [eax+1C]; TLZB.?f1C:dword
 00462694    mov        eax,dword ptr [ebp-4]
 00462697    mov        eax,dword ptr [eax+280]; TCompressor.?f280:Pointer
 0046269D    call       @FreeMem
 004626A2    mov        eax,dword ptr [ebp-4]
 004626A5    mov        eax,dword ptr [eax+28C]; TCompressor.?f28C:TLZB
 004626AB    call       TObject.Free
>004626B0    jmp        0046280A
 004626B5    mov        eax,dword ptr [ebp-4]
 004626B8    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004626BE    cmp        dword ptr [eax+14],0
>004626C2    je         0046280A
 004626C8    push       0
 004626CA    mov        eax,dword ptr [ebp-4]
 004626CD    add        eax,110; TCompressor.?f110:?
 004626D2    push       eax
 004626D3    mov        eax,dword ptr [ebp-4]
 004626D6    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004626DC    mov        eax,dword ptr [eax+10]
 004626DF    push       eax
 004626E0    mov        eax,dword ptr [ebp-4]
 004626E3    mov        eax,dword ptr [eax+30]; TCompressor.?f30:dword
 004626E6    mov        edx,dword ptr [ebp-4]
 004626E9    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 004626EF    add        eax,dword ptr [edx+14]
 004626F2    push       eax
 004626F3    mov        eax,dword ptr [ebp-4]
 004626F6    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 004626FC    push       eax
 004626FD    call       kernel32.WriteFile
 00462702    mov        eax,dword ptr [ebp-4]
 00462705    xor        edx,edx
 00462707    mov        dword ptr [eax+118],edx; TCompressor.?f118:Integer
 0046270D    mov        eax,dword ptr [ebp-4]
 00462710    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462716    mov        eax,dword ptr [eax+10]
 00462719    mov        edx,dword ptr [ebp-4]
 0046271C    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046271F    mov        ecx,dword ptr [edx+3C]
 00462722    xor        edx,edx
 00462724    div        eax,ecx
 00462726    test       edx,edx
>00462728    jbe        00462773
 0046272A    mov        eax,dword ptr [ebp-4]
 0046272D    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462733    mov        eax,dword ptr [eax+10]
 00462736    mov        edx,dword ptr [ebp-4]
 00462739    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046273C    mov        ecx,dword ptr [edx+3C]
 0046273F    xor        edx,edx
 00462741    div        eax,ecx
 00462743    inc        eax
 00462744    mov        edx,dword ptr [ebp-4]
 00462747    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046274A    imul       dword ptr [edx+3C]
 0046274D    mov        edx,dword ptr [ebp-4]
 00462750    mov        dword ptr [edx+118],eax; TCompressor.?f118:Integer
 00462756    mov        eax,dword ptr [ebp-4]
 00462759    mov        edx,dword ptr [eax+118]; TCompressor.?f118:Integer
 0046275F    mov        eax,dword ptr [ebp-4]
 00462762    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462768    sub        edx,dword ptr [eax+10]
 0046276B    mov        eax,dword ptr [ebp-4]
 0046276E    call       00463628
 00462773    mov        eax,dword ptr [ebp-4]
 00462776    cmp        dword ptr [eax+118],0; TCompressor.?f118:Integer
>0046277D    je         00462794
 0046277F    mov        eax,dword ptr [ebp-4]
 00462782    mov        eax,dword ptr [eax+118]; TCompressor.?f118:Integer
 00462788    mov        edx,dword ptr [ebp-4]
 0046278B    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 00462791    mov        dword ptr [edx+10],eax
 00462794    mov        eax,dword ptr [ebp-4]
 00462797    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 0046279D    mov        eax,dword ptr [eax+8]
 004627A0    mov        edx,dword ptr [ebp-4]
 004627A3    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 004627A6    mov        ecx,dword ptr [edx+38]
 004627A9    xor        edx,edx
 004627AB    div        eax,ecx
 004627AD    test       edx,edx
>004627AF    jbe        004627E0
 004627B1    mov        eax,dword ptr [ebp-4]
 004627B4    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004627BA    mov        eax,dword ptr [eax+8]
 004627BD    mov        edx,dword ptr [ebp-4]
 004627C0    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 004627C3    mov        ecx,dword ptr [edx+38]
 004627C6    xor        edx,edx
 004627C8    div        eax,ecx
 004627CA    inc        eax
 004627CB    mov        edx,dword ptr [ebp-4]
 004627CE    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 004627D1    imul       dword ptr [edx+38]
 004627D4    mov        edx,dword ptr [ebp-4]
 004627D7    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 004627DD    mov        dword ptr [edx+8],eax
 004627E0    mov        eax,dword ptr [ebp-4]
 004627E3    mov        eax,dword ptr [eax+124]; TCompressor.?f124:dword
 004627E9    mov        edx,dword ptr [ebp-4]
 004627EC    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 004627F2    mov        dword ptr [edx+14],eax
 004627F5    mov        eax,dword ptr [ebp-4]
 004627F8    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004627FE    mov        eax,dword ptr [eax+10]
 00462801    mov        edx,dword ptr [ebp-4]
 00462804    add        dword ptr [edx+84],eax; TCompressor.?f84:dword
 0046280A    mov        eax,dword ptr [ebp-4]
 0046280D    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462813    cmp        dword ptr [eax+14],0
>00462817    je         00462825
 00462819    mov        eax,dword ptr [eax+10]
 0046281C    mov        edx,dword ptr [ebp-4]
 0046281F    add        dword ptr [edx+124],eax; TCompressor.?f124:dword
 00462825    mov        eax,dword ptr [ebp-4]
 00462828    mov        edx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 0046282E    mov        eax,dword ptr [ebp-4]
 00462831    mov        ecx,dword ptr [eax]
 00462833    call       dword ptr [ecx+4C]; TCompressor.sub_00463F24
 00462836    mov        eax,dword ptr [ebp-4]
 00462839    add        dword ptr [eax+120],0C; TCompressor.?f120:dword
 00462840    mov        eax,dword ptr [ebp-4]
 00462843    add        dword ptr [eax+0B8],28; TCompressor.?fB8:dword
 0046284A    inc        ebx
 0046284B    dec        esi
<0046284C    jne        00461D5B
 00462852    mov        eax,dword ptr [ebp-4]
 00462855    sub        dword ptr [eax+0B8],28
 0046285C    mov        eax,dword ptr [ebp-4]
 0046285F    add        eax,0BC; TCompressor.?fBC:?
 00462864    mov        dword ptr [ebp-1C],eax
 00462867    mov        eax,dword ptr [ebp-1C]
 0046286A    xor        edx,edx
 0046286C    mov        dword ptr [eax+18],edx
 0046286F    mov        eax,dword ptr [ebp-1C]
 00462872    xor        edx,edx
 00462874    mov        dword ptr [eax+1C],edx
 00462877    mov        eax,dword ptr [ebp-1C]
 0046287A    mov        word ptr [eax+20],0
 00462880    mov        eax,dword ptr [ebp-1C]
 00462883    mov        word ptr [eax+22],0
 00462889    mov        eax,dword ptr [ebp-4]
 0046288C    mov        eax,dword ptr [eax+7C]; TCompressor.?f7C:String
 0046288F    call       @LStrLen
 00462894    mov        esi,eax
 00462896    dec        esi
 00462897    test       esi,esi
>00462899    jb         004628B1
 0046289B    inc        esi
 0046289C    xor        ebx,ebx
 0046289E    mov        eax,dword ptr [ebp-4]
 004628A1    mov        eax,dword ptr [eax+7C]; TCompressor.?f7C:String
 004628A4    mov        al,byte ptr [eax+ebx]
 004628A7    mov        edx,dword ptr [ebp-1C]
 004628AA    mov        byte ptr [edx+ebx],al
 004628AD    inc        ebx
 004628AE    dec        esi
<004628AF    jne        0046289E
 004628B1    mov        eax,dword ptr [ebp-4]
 004628B4    mov        eax,dword ptr [eax+7C]; TCompressor.?f7C:String
 004628B7    call       @LStrLen
 004628BC    mov        edx,dword ptr [ebp-1C]
 004628BF    mov        byte ptr [edx+eax],0
 004628C3    mov        eax,dword ptr [ebp-1C]
 004628C6    mov        dword ptr [eax+24],0E0000060
 004628CD    mov        eax,dword ptr [ebp-4]
 004628D0    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 004628D6    mov        eax,dword ptr [eax+0C]
 004628D9    mov        edx,dword ptr [ebp-4]
 004628DC    mov        edx,dword ptr [edx+0B8]; TCompressor.?fB8:dword
 004628E2    add        eax,dword ptr [edx+8]
 004628E5    mov        edx,dword ptr [ebp-1C]
 004628E8    mov        dword ptr [edx+0C],eax
 004628EB    mov        eax,dword ptr [ebp-1C]
 004628EE    mov        eax,dword ptr [eax+0C]
 004628F1    mov        edx,dword ptr [ebp-4]
 004628F4    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 004628F7    mov        ecx,dword ptr [edx+38]
 004628FA    xor        edx,edx
 004628FC    div        eax,ecx
 004628FE    test       edx,edx
>00462900    jbe        00462925
 00462902    mov        eax,dword ptr [ebp-1C]
 00462905    mov        eax,dword ptr [eax+0C]
 00462908    mov        edx,dword ptr [ebp-4]
 0046290B    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046290E    mov        ecx,dword ptr [edx+38]
 00462911    xor        edx,edx
 00462913    div        eax,ecx
 00462915    inc        eax
 00462916    mov        edx,dword ptr [ebp-4]
 00462919    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 0046291C    imul       dword ptr [edx+38]
 0046291F    mov        edx,dword ptr [ebp-1C]
 00462922    mov        dword ptr [edx+0C],eax
 00462925    mov        eax,dword ptr [ebp-4]
 00462928    mov        eax,dword ptr [eax+124]; TCompressor.?f124:dword
 0046292E    mov        edx,dword ptr [ebp-1C]
 00462931    mov        dword ptr [edx+14],eax
 00462934    mov        eax,dword ptr [ebp-4]
 00462937    mov        edx,dword ptr [eax]
 00462939    call       dword ptr [edx+58]; TCompressor.sub_00463F40
 0046293C    mov        ebx,eax
 0046293E    mov        eax,dword ptr [ebp-4]
 00462941    mov        edx,dword ptr [eax]
 00462943    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00462946    sub        ebx,eax
 00462948    mov        eax,dword ptr [ebp-1C]
 0046294B    mov        dword ptr [eax+10],ebx
 0046294E    mov        eax,dword ptr [ebp-4]
 00462951    mov        edx,dword ptr [eax]
 00462953    call       dword ptr [edx+40]; TCompressor.sub_00463F18
 00462956    xor        eax,eax
 00462958    push       ebp
 00462959    push       46299D
 0046295E    push       dword ptr fs:[eax]
 00462961    mov        dword ptr fs:[eax],esp
 00462964    mov        eax,dword ptr [ebp-4]
 00462967    add        eax,264; TCompressor.?f264:dword
 0046296C    push       eax
 0046296D    mov        eax,dword ptr [ebp-1C]
 00462970    mov        ecx,dword ptr [eax+0C]
 00462973    mov        eax,dword ptr [ebp-1C]
 00462976    add        ecx,dword ptr [eax+10]
 00462979    mov        eax,dword ptr [ebp-4]
 0046297C    mov        edx,dword ptr [eax+268]; TCompressor.?f268:dword
 00462982    mov        eax,dword ptr [ebp-4]
 00462985    call       004639C8
 0046298A    mov        edx,dword ptr [ebp-4]
 0046298D    mov        dword ptr [edx+260],eax; TCompressor.?f260:dword
 00462993    xor        eax,eax
 00462995    pop        edx
 00462996    pop        ecx
 00462997    pop        ecx
 00462998    mov        dword ptr fs:[eax],edx
>0046299B    jmp        004629C0
<0046299D    jmp        @HandleAnyException
 004629A2    mov        eax,46360C; '06'
 004629A7    call       00449E58
 004629AC    call       @DoneExcept
 004629B1    call       @TryFinallyExit
>004629B6    jmp        0046356C
 004629BB    call       @DoneExcept
 004629C0    mov        eax,dword ptr [ebp-4]
 004629C3    mov        eax,dword ptr [eax+260]; TCompressor.?f260:dword
 004629C9    mov        edx,dword ptr [ebp-1C]
 004629CC    add        dword ptr [edx+10],eax
 004629CF    mov        eax,dword ptr [ebp-4]
 004629D2    mov        eax,dword ptr [eax+78]; TCompressor.?f78:TResPatch
 004629D5    mov        eax,dword ptr [eax+4]; TResPatch.?f4:Integer
 004629D8    mov        edx,dword ptr [ebp-1C]
 004629DB    add        dword ptr [edx+10],eax
 004629DE    mov        eax,dword ptr [ebp-4]
 004629E1    cmp        dword ptr [eax+0AC],0; TCompressor.?fAC:TList
>004629E8    je         00462A54
 004629EA    mov        eax,dword ptr [ebp-4]
 004629ED    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 004629F3    cmp        dword ptr [eax+8],0; TList.FCount:Integer
>004629F7    jle        00462A54
 004629F9    mov        eax,dword ptr [ebp-4]
 004629FC    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00462A02    mov        esi,dword ptr [eax+8]; TList.FCount:Integer
 00462A05    dec        esi
 00462A06    test       esi,esi
>00462A08    jb         00462A54
 00462A0A    inc        esi
 00462A0B    xor        ebx,ebx
 00462A0D    mov        eax,dword ptr [ebp-4]
 00462A10    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00462A16    mov        edx,ebx
 00462A18    call       TList.Get
 00462A1D    mov        edi,eax
 00462A1F    mov        eax,dword ptr [ebp-4]
 00462A22    mov        dword ptr [eax+0B0],edi; TCompressor.?fB0:Pointer
 00462A28    mov        eax,dword ptr [edi+4]
 00462A2B    mov        eax,dword ptr [eax+4]
 00462A2E    mov        edx,eax
 00462A30    and        edx,3
 00462A33    test       edx,edx
>00462A35    jbe        00462A46
 00462A37    mov        edx,eax
 00462A39    shr        edx,2
 00462A3C    inc        edx
 00462A3D    mov        edi,edx
 00462A3F    shl        edi,2
 00462A42    sub        edi,eax
>00462A44    jmp        00462A48
 00462A46    xor        edi,edi
 00462A48    add        edi,eax
 00462A4A    mov        eax,dword ptr [ebp-1C]
 00462A4D    add        dword ptr [eax+10],edi
 00462A50    inc        ebx
 00462A51    dec        esi
<00462A52    jne        00462A0D
 00462A54    mov        eax,dword ptr [ebp-1C]
 00462A57    mov        ecx,dword ptr [eax+10]
 00462A5A    mov        eax,dword ptr [ebp-1C]
 00462A5D    mov        edx,dword ptr [eax+0C]
 00462A60    mov        eax,dword ptr [ebp-4]
 00462A63    mov        ebx,dword ptr [eax]
 00462A65    call       dword ptr [ebx+3C]; TCompressor.sub_00463F14
 00462A68    mov        edx,dword ptr [ebp-1C]
 00462A6B    mov        dword ptr [edx+10],eax
 00462A6E    mov        eax,dword ptr [ebp-1C]
 00462A71    mov        eax,dword ptr [eax+10]
 00462A74    mov        edx,dword ptr [ebp-4]
 00462A77    mov        dword ptr [edx+114],eax; TCompressor.?f114:dword
 00462A7D    mov        eax,dword ptr [ebp-1C]
 00462A80    mov        eax,dword ptr [eax+10]
 00462A83    mov        edx,dword ptr [ebp-1C]
 00462A86    mov        dword ptr [edx+8],eax
 00462A89    mov        eax,dword ptr [ebp-1C]
 00462A8C    mov        eax,dword ptr [eax+10]
 00462A8F    mov        edx,dword ptr [ebp-4]
 00462A92    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462A95    mov        ecx,dword ptr [edx+3C]
 00462A98    xor        edx,edx
 00462A9A    div        eax,ecx
 00462A9C    test       edx,edx
>00462A9E    jbe        00462AC3
 00462AA0    mov        eax,dword ptr [ebp-1C]
 00462AA3    mov        eax,dword ptr [eax+10]
 00462AA6    mov        edx,dword ptr [ebp-4]
 00462AA9    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462AAC    mov        ecx,dword ptr [edx+3C]
 00462AAF    xor        edx,edx
 00462AB1    div        eax,ecx
 00462AB3    inc        eax
 00462AB4    mov        edx,dword ptr [ebp-4]
 00462AB7    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462ABA    imul       dword ptr [edx+3C]
 00462ABD    mov        edx,dword ptr [ebp-1C]
 00462AC0    mov        dword ptr [edx+10],eax
 00462AC3    mov        eax,dword ptr [ebp-1C]
 00462AC6    mov        eax,dword ptr [eax+8]
 00462AC9    mov        edx,dword ptr [ebp-4]
 00462ACC    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462ACF    mov        ecx,dword ptr [edx+38]
 00462AD2    xor        edx,edx
 00462AD4    div        eax,ecx
 00462AD6    test       edx,edx
>00462AD8    jbe        00462AFD
 00462ADA    mov        eax,dword ptr [ebp-1C]
 00462ADD    mov        eax,dword ptr [eax+8]
 00462AE0    mov        edx,dword ptr [ebp-4]
 00462AE3    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462AE6    mov        ecx,dword ptr [edx+38]
 00462AE9    xor        edx,edx
 00462AEB    div        eax,ecx
 00462AED    inc        eax
 00462AEE    mov        edx,dword ptr [ebp-4]
 00462AF1    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462AF4    imul       dword ptr [edx+38]
 00462AF7    mov        edx,dword ptr [ebp-1C]
 00462AFA    mov        dword ptr [edx+8],eax
 00462AFD    mov        eax,dword ptr [ebp-4]
 00462B00    add        dword ptr [eax+0B8],28; TCompressor.?fB8:dword
 00462B07    mov        eax,dword ptr [ebp-4]
 00462B0A    mov        edx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462B10    mov        eax,dword ptr [ebp-4]
 00462B13    add        eax,0BC; TCompressor.?fBC:?
 00462B18    mov        ecx,28
 00462B1D    call       Move
 00462B22    mov        eax,dword ptr [ebp-4]
 00462B25    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00462B28    inc        word ptr [eax+6]
 00462B2C    mov        eax,dword ptr [ebp-4]
 00462B2F    mov        eax,dword ptr [eax+0C8]; TCompressor.?fC8:dword
 00462B35    mov        edx,dword ptr [ebp-4]
 00462B38    add        eax,dword ptr [edx+0C4]; TCompressor.?fC4:dword
 00462B3E    mov        edx,dword ptr [ebp-4]
 00462B41    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462B44    mov        dword ptr [edx+50],eax
 00462B47    mov        eax,dword ptr [ebp-4]
 00462B4A    add        eax,0E4; TCompressor.?fE4:?
 00462B4F    xor        edx,edx
 00462B51    mov        dword ptr [eax+18],edx
 00462B54    xor        edx,edx
 00462B56    mov        dword ptr [eax+1C],edx
 00462B59    mov        word ptr [eax+20],0
 00462B5F    mov        word ptr [eax+22],0
 00462B65    mov        edx,dword ptr ds:[463610]; 0x6164612E
 00462B6B    mov        dword ptr [eax],edx
 00462B6D    mov        edx,dword ptr ds:[463614]; 0x6174
 00462B73    mov        dword ptr [eax+4],edx
 00462B76    mov        dword ptr [eax+24],0E0000040
 00462B7D    mov        edx,dword ptr [ebp-4]
 00462B80    mov        edx,dword ptr [edx+0C8]; TCompressor.?fC8:dword
 00462B86    mov        ecx,dword ptr [ebp-4]
 00462B89    add        edx,dword ptr [ecx+0C4]
 00462B8F    mov        dword ptr [eax+0C],edx
 00462B92    mov        edx,dword ptr [ebp-4]
 00462B95    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462B98    mov        edx,dword ptr [edx+38]
 00462B9B    mov        dword ptr [eax+8],edx
 00462B9E    mov        edx,dword ptr [ebp-4]
 00462BA1    mov        edx,dword ptr [edx+0D0]; TCompressor.?fD0:dword
 00462BA7    mov        ecx,dword ptr [ebp-4]
 00462BAA    add        edx,dword ptr [ecx+0CC]
 00462BB0    mov        dword ptr [eax+14],edx
 00462BB3    xor        edx,edx
 00462BB5    mov        dword ptr [eax+10],edx
 00462BB8    mov        eax,dword ptr [ebp-4]
 00462BBB    add        dword ptr [eax+0B8],28; TCompressor.?fB8:dword
 00462BC2    mov        eax,dword ptr [ebp-4]
 00462BC5    mov        edx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00462BCB    mov        eax,dword ptr [ebp-4]
 00462BCE    add        eax,0E4; TCompressor.?fE4:?
 00462BD3    mov        ecx,28
 00462BD8    call       Move
 00462BDD    mov        eax,dword ptr [ebp-4]
 00462BE0    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00462BE3    inc        word ptr [eax+6]
 00462BE7    mov        eax,dword ptr [ebp-4]
 00462BEA    mov        eax,dword ptr [eax+0EC]; TCompressor.?fEC:dword
 00462BF0    mov        edx,dword ptr [ebp-4]
 00462BF3    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462BF6    add        dword ptr [edx+50],eax
 00462BF9    mov        eax,dword ptr [ebp-4]
 00462BFC    mov        edx,dword ptr [eax]
 00462BFE    call       dword ptr [edx+64]; TCompressor.sub_00463F64
 00462C01    mov        edx,dword ptr [ebp-4]
 00462C04    mov        edx,dword ptr [edx+0C8]; TCompressor.?fC8:dword
 00462C0A    mov        dword ptr [eax],edx
 00462C0C    mov        eax,dword ptr [ebp-4]
 00462C0F    mov        eax,dword ptr [eax+0C8]; TCompressor.?fC8:dword
 00462C15    mov        edx,dword ptr [ebp-4]
 00462C18    mov        dword ptr [edx+288],eax; TCompressor.?f288:dword
 00462C1E    mov        eax,dword ptr [ebp-4]
 00462C21    mov        eax,dword ptr [eax+0C8]; TCompressor.?fC8:dword
 00462C27    inc        eax
 00462C28    mov        edx,dword ptr [ebp-4]
 00462C2B    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462C2E    mov        dword ptr [edx+28],eax
 00462C31    mov        eax,dword ptr [ebp-4]
 00462C34    mov        edx,dword ptr [eax]
 00462C36    call       dword ptr [edx+68]; TCompressor.sub_00463F70
 00462C39    mov        edx,dword ptr [ebp-4]
 00462C3C    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462C3F    add        edx,80
 00462C45    mov        edx,dword ptr [edx]
 00462C47    mov        dword ptr [eax],edx
 00462C49    mov        eax,dword ptr [ebp-4]
 00462C4C    mov        edx,dword ptr [eax]
 00462C4E    call       dword ptr [edx+6C]; TCompressor.sub_00463F7C
 00462C51    mov        ebx,eax
 00462C53    mov        eax,dword ptr [ebp-4]
 00462C56    mov        edx,dword ptr [eax]
 00462C58    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00462C5B    sub        ebx,eax
 00462C5D    mov        eax,dword ptr [ebp-4]
 00462C60    mov        edx,dword ptr [eax]
 00462C62    call       dword ptr [edx+64]; TCompressor.sub_00463F64
 00462C65    add        ebx,dword ptr [eax]
 00462C67    mov        eax,dword ptr [ebp-4]
 00462C6A    mov        dword ptr [eax+11C],ebx; TCompressor.?f11C:dword
 00462C70    mov        eax,dword ptr [ebp-4]
 00462C73    mov        eax,dword ptr [eax+78]; TCompressor.?f78:TResPatch
 00462C76    cmp        dword ptr [eax+4],0; TResPatch.?f4:Integer
>00462C7A    jbe        00462CB0
 00462C7C    mov        eax,dword ptr [ebp-4]
 00462C7F    mov        edx,dword ptr [eax]
 00462C81    call       dword ptr [edx+58]; TCompressor.sub_00463F40
 00462C84    mov        ebx,eax
 00462C86    mov        eax,dword ptr [ebp-4]
 00462C89    mov        edx,dword ptr [eax]
 00462C8B    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00462C8E    sub        ebx,eax
 00462C90    mov        eax,dword ptr [ebp-4]
 00462C93    mov        edx,dword ptr [eax]
 00462C95    call       dword ptr [edx+64]; TCompressor.sub_00463F64
 00462C98    add        ebx,dword ptr [eax]
 00462C9A    mov        eax,dword ptr [ebp-4]
 00462C9D    add        ebx,dword ptr [eax+260]; TCompressor.?f260:dword
 00462CA3    mov        eax,dword ptr [ebp-4]
 00462CA6    mov        edx,dword ptr [eax]
 00462CA8    call       dword ptr [edx+0B8]; TCompressor.sub_00464038
 00462CAE    mov        dword ptr [eax],ebx
 00462CB0    mov        eax,dword ptr [ebp-4]
 00462CB3    mov        eax,dword ptr [eax+11C]; TCompressor.?f11C:dword
 00462CB9    mov        edx,dword ptr [ebp-4]
 00462CBC    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462CBF    add        edx,80
 00462CC5    mov        dword ptr [edx],eax
 00462CC7    mov        eax,dword ptr [ebp-4]
 00462CCA    mov        edx,dword ptr [eax]
 00462CCC    call       dword ptr [edx+70]; TCompressor.sub_00463F88
 00462CCF    mov        ebx,eax
 00462CD1    mov        eax,dword ptr [ebp-4]
 00462CD4    mov        edx,dword ptr [eax]
 00462CD6    call       dword ptr [edx+6C]; TCompressor.sub_00463F7C
 00462CD9    sub        ebx,eax
 00462CDB    mov        eax,dword ptr [ebp-4]
 00462CDE    add        ebx,dword ptr [eax+260]; TCompressor.?f260:dword
 00462CE4    mov        eax,dword ptr [ebp-4]
 00462CE7    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00462CEA    add        eax,84
 00462CEF    mov        dword ptr [eax],ebx
 00462CF1    mov        eax,dword ptr [ebp-4]
 00462CF4    mov        edx,dword ptr [eax]
 00462CF6    call       dword ptr [edx+78]; TCompressor.sub_00463FA0
 00462CF9    mov        edx,dword ptr [ebp-4]
 00462CFC    mov        edx,dword ptr [edx+11C]; TCompressor.?f11C:dword
 00462D02    add        dword ptr [eax],edx
 00462D04    mov        eax,dword ptr [ebp-4]
 00462D07    mov        edx,dword ptr [eax]
 00462D09    call       dword ptr [edx+7C]; TCompressor.sub_00463FAC
 00462D0C    mov        edx,dword ptr [ebp-4]
 00462D0F    mov        edx,dword ptr [edx+11C]; TCompressor.?f11C:dword
 00462D15    add        dword ptr [eax],edx
 00462D17    mov        eax,dword ptr [ebp-4]
 00462D1A    mov        edx,dword ptr [eax]
 00462D1C    call       dword ptr [edx+8C]; TCompressor.sub_00463FC4
 00462D22    mov        edx,dword ptr [ebp-4]
 00462D25    mov        edx,dword ptr [edx+11C]; TCompressor.?f11C:dword
 00462D2B    add        dword ptr [eax],edx
 00462D2D    mov        eax,dword ptr [ebp-4]
 00462D30    mov        edx,dword ptr [eax]
 00462D32    call       dword ptr [edx+90]; TCompressor.sub_00463FD0
 00462D38    mov        edx,dword ptr [ebp-4]
 00462D3B    mov        edx,dword ptr [edx+11C]; TCompressor.?f11C:dword
 00462D41    add        dword ptr [eax],edx
 00462D43    mov        eax,dword ptr [ebp-4]
 00462D46    mov        edx,dword ptr [eax]
 00462D48    call       dword ptr [edx+94]; TCompressor.sub_00463FDC
 00462D4E    mov        edx,dword ptr [ebp-4]
 00462D51    mov        edx,dword ptr [edx+11C]; TCompressor.?f11C:dword
 00462D57    add        dword ptr [eax],edx
 00462D59    mov        eax,dword ptr [ebp-4]
 00462D5C    mov        edx,dword ptr [eax]
 00462D5E    call       dword ptr [edx+74]; TCompressor.sub_00463F94
 00462D61    mov        edx,dword ptr [ebp-4]
 00462D64    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462D67    add        edx,0A0
 00462D6D    mov        edx,dword ptr [edx]
 00462D6F    mov        dword ptr [eax],edx
 00462D71    mov        eax,dword ptr [ebp-4]
 00462D74    mov        edx,dword ptr [eax]
 00462D76    call       dword ptr [edx+98]; TCompressor.sub_00463FE8
 00462D7C    mov        ebx,eax
 00462D7E    mov        eax,dword ptr [ebp-4]
 00462D81    mov        edx,dword ptr [eax]
 00462D83    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00462D86    sub        ebx,eax
 00462D88    mov        eax,dword ptr [ebp-4]
 00462D8B    mov        edx,dword ptr [eax]
 00462D8D    call       dword ptr [edx+64]; TCompressor.sub_00463F64
 00462D90    add        ebx,dword ptr [eax]
 00462D92    mov        eax,dword ptr [ebp-4]
 00462D95    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00462D98    add        eax,0A0
 00462D9D    mov        dword ptr [eax],ebx
 00462D9F    mov        eax,dword ptr [ebp-4]
 00462DA2    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00462DA5    add        eax,0A4
 00462DAA    mov        dword ptr [eax],8
 00462DB0    mov        eax,dword ptr [ebp-4]
 00462DB3    mov        edx,dword ptr [eax]
 00462DB5    call       dword ptr [edx+9C]; TCompressor.sub_00463FF4
 00462DBB    mov        edx,dword ptr [ebp-4]
 00462DBE    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462DC1    mov        edx,dword ptr [edx+34]
 00462DC4    mov        dword ptr [eax],edx
 00462DC6    mov        eax,dword ptr [ebp-4]
 00462DC9    cmp        dword ptr [eax+154],0; TCompressor.?f154:dword
>00462DD0    je         00462E23
 00462DD2    mov        eax,dword ptr [ebp-4]
 00462DD5    mov        edx,dword ptr [eax]
 00462DD7    call       dword ptr [edx+0A8]; TCompressor.sub_00464018
 00462DDD    mov        edx,dword ptr [ebp-4]
 00462DE0    mov        edx,dword ptr [edx+38]; TCompressor.?f38:dword
 00462DE3    mov        ecx,dword ptr [edx+0C4]
 00462DE9    mov        edx,dword ptr [ebp-4]
 00462DEC    mov        edx,dword ptr [edx+154]; TCompressor.?f154:dword
 00462DF2    call       MoveMemory
 00462DF7    mov        eax,dword ptr [ebp-4]
 00462DFA    mov        edx,dword ptr [eax]
 00462DFC    call       dword ptr [edx+0A8]; TCompressor.sub_00464018
 00462E02    mov        ebx,eax
 00462E04    mov        eax,dword ptr [ebp-4]
 00462E07    mov        edx,dword ptr [eax]
 00462E09    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00462E0C    sub        ebx,eax
 00462E0E    mov        eax,dword ptr [ebp-4]
 00462E11    add        ebx,dword ptr [eax+0C8]; TCompressor.?fC8:dword
 00462E17    mov        eax,dword ptr [ebp-4]
 00462E1A    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00462E1D    mov        dword ptr [eax+0C0],ebx
 00462E23    mov        eax,dword ptr [ebp-4]
 00462E26    mov        edx,dword ptr [eax]
 00462E28    call       dword ptr [edx+50]; TCompressor.sub_00463F28
 00462E2B    push       0
 00462E2D    mov        eax,dword ptr [ebp-4]
 00462E30    add        eax,110; TCompressor.?f110:?
 00462E35    push       eax
 00462E36    mov        eax,dword ptr [ebp-4]
 00462E39    mov        edx,dword ptr [eax]
 00462E3B    call       dword ptr [edx+58]; TCompressor.sub_00463F40
 00462E3E    mov        ebx,eax
 00462E40    mov        eax,dword ptr [ebp-4]
 00462E43    mov        edx,dword ptr [eax]
 00462E45    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00462E48    sub        ebx,eax
 00462E4A    push       ebx
 00462E4B    mov        eax,dword ptr [ebp-4]
 00462E4E    mov        edx,dword ptr [eax]
 00462E50    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00462E53    push       eax
 00462E54    mov        eax,dword ptr [ebp-4]
 00462E57    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00462E5D    push       eax
 00462E5E    call       kernel32.WriteFile
 00462E63    push       0
 00462E65    mov        eax,dword ptr [ebp-4]
 00462E68    add        eax,110; TCompressor.?f110:?
 00462E6D    push       eax
 00462E6E    mov        eax,dword ptr [ebp-4]
 00462E71    mov        eax,dword ptr [eax+260]; TCompressor.?f260:dword
 00462E77    push       eax
 00462E78    mov        eax,dword ptr [ebp-4]
 00462E7B    mov        eax,dword ptr [eax+264]; TCompressor.?f264:dword
 00462E81    push       eax
 00462E82    mov        eax,dword ptr [ebp-4]
 00462E85    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00462E8B    push       eax
 00462E8C    call       kernel32.WriteFile
 00462E91    mov        eax,dword ptr [ebp-4]
 00462E94    mov        edx,dword ptr [eax+260]; TCompressor.?f260:dword
 00462E9A    mov        eax,dword ptr [ebp-4]
 00462E9D    mov        eax,dword ptr [eax+264]; TCompressor.?f264:dword
 00462EA3    call       @FreeMem
 00462EA8    mov        eax,dword ptr [ebp-4]
 00462EAB    mov        eax,dword ptr [eax+78]; TCompressor.?f78:TResPatch
 00462EAE    cmp        dword ptr [eax+4],0; TResPatch.?f4:Integer
>00462EB2    jbe        00462EE2
 00462EB4    push       0
 00462EB6    mov        eax,dword ptr [ebp-4]
 00462EB9    add        eax,110; TCompressor.?f110:?
 00462EBE    push       eax
 00462EBF    mov        eax,dword ptr [ebp-4]
 00462EC2    mov        eax,dword ptr [eax+78]; TCompressor.?f78:TResPatch
 00462EC5    mov        eax,dword ptr [eax+4]; TResPatch.?f4:Integer
 00462EC8    push       eax
 00462EC9    mov        eax,dword ptr [ebp-4]
 00462ECC    mov        eax,dword ptr [eax+78]; TCompressor.?f78:TResPatch
 00462ECF    mov        eax,dword ptr [eax+8]; TResPatch.?f8:Pointer
 00462ED2    push       eax
 00462ED3    mov        eax,dword ptr [ebp-4]
 00462ED6    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00462EDC    push       eax
 00462EDD    call       kernel32.WriteFile
 00462EE2    mov        eax,dword ptr [ebp-4]
 00462EE5    cmp        dword ptr [eax+0AC],0; TCompressor.?fAC:TList
>00462EEC    je         00463003
 00462EF2    mov        eax,dword ptr [ebp-4]
 00462EF5    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00462EFB    cmp        dword ptr [eax+8],0; TList.FCount:Integer
>00462EFF    jle        00463003
 00462F05    mov        eax,dword ptr [ebp-4]
 00462F08    xor        edx,edx
 00462F0A    mov        dword ptr [eax+0B4],edx; TCompressor.?fB4:dword
 00462F10    mov        eax,dword ptr [ebp-4]
 00462F13    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00462F19    mov        ebx,dword ptr [eax+8]; TList.FCount:Integer
 00462F1C    dec        ebx
 00462F1D    cmp        ebx,0
>00462F20    jb         00463003
 00462F26    mov        eax,dword ptr [ebp-4]
 00462F29    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00462F2F    mov        edx,ebx
 00462F31    call       TList.Get
 00462F36    mov        esi,eax
 00462F38    mov        eax,dword ptr [ebp-4]
 00462F3B    mov        dword ptr [eax+0B0],esi; TCompressor.?fB0:Pointer
 00462F41    mov        eax,dword ptr [esi+4]
 00462F44    mov        eax,dword ptr [eax+4]
 00462F47    mov        edx,eax
 00462F49    and        edx,3
 00462F4C    test       edx,edx
>00462F4E    jbe        00462F5F
 00462F50    mov        edx,eax
 00462F52    shr        edx,2
 00462F55    inc        edx
 00462F56    mov        edi,edx
 00462F58    shl        edi,2
 00462F5B    sub        edi,eax
>00462F5D    jmp        00462F61
 00462F5F    xor        edi,edi
 00462F61    push       0
 00462F63    mov        edx,dword ptr [ebp-4]
 00462F66    add        edx,110; TCompressor.?f110:?
 00462F6C    push       edx
 00462F6D    push       eax
 00462F6E    mov        eax,dword ptr [ebp-4]
 00462F71    mov        eax,dword ptr [eax+0B0]; TCompressor.?fB0:Pointer
 00462F77    mov        eax,dword ptr [eax+4]
 00462F7A    mov        eax,dword ptr [eax]
 00462F7C    mov        edx,dword ptr [ebp-4]
 00462F7F    sub        eax,dword ptr [edx+4C]
 00462F82    mov        edx,dword ptr [ebp-4]
 00462F85    add        eax,dword ptr [edx+48]; TCompressor.?f48:dword
 00462F88    push       eax
 00462F89    mov        eax,dword ptr [ebp-4]
 00462F8C    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00462F92    push       eax
 00462F93    call       kernel32.WriteFile
 00462F98    test       edi,edi
>00462F9A    jbe        00462FA6
 00462F9C    mov        edx,edi
 00462F9E    mov        eax,dword ptr [ebp-4]
 00462FA1    call       00463628
 00462FA6    mov        eax,dword ptr [ebp-4]
 00462FA9    mov        edx,dword ptr [eax]
 00462FAB    call       dword ptr [edx+58]; TCompressor.sub_00463F40
 00462FAE    push       eax
 00462FAF    mov        eax,dword ptr [ebp-4]
 00462FB2    mov        edx,dword ptr [eax]
 00462FB4    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00462FB7    pop        edx
 00462FB8    sub        edx,eax
 00462FBA    mov        eax,dword ptr [ebp-4]
 00462FBD    add        edx,dword ptr [eax+288]; TCompressor.?f288:dword
 00462FC3    mov        eax,dword ptr [ebp-4]
 00462FC6    add        edx,dword ptr [eax+260]; TCompressor.?f260:dword
 00462FCC    mov        eax,dword ptr [ebp-4]
 00462FCF    mov        eax,dword ptr [eax+78]; TCompressor.?f78:TResPatch
 00462FD2    add        edx,dword ptr [eax+4]; TResPatch.?f4:Integer
 00462FD5    mov        eax,dword ptr [ebp-4]
 00462FD8    add        edx,dword ptr [eax+0B4]; TCompressor.?fB4:dword
 00462FDE    mov        eax,dword ptr [ebp-4]
 00462FE1    mov        esi,dword ptr [eax+0B0]; TCompressor.?fB0:Pointer
 00462FE7    mov        dword ptr [esi+8],edx
 00462FEA    mov        eax,dword ptr [esi+4]
 00462FED    add        edi,dword ptr [eax+4]
 00462FF0    mov        eax,dword ptr [ebp-4]
 00462FF3    add        dword ptr [eax+0B4],edi; TCompressor.?fB4:dword
 00462FF9    dec        ebx
 00462FFA    cmp        ebx,0FFFFFFFF
<00462FFD    jne        00462F26
 00463003    mov        eax,dword ptr [ebp-4]
 00463006    mov        edx,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 0046300C    mov        eax,dword ptr [ebp-4]
 0046300F    mov        ecx,dword ptr [eax]
 00463011    call       dword ptr [ecx+44]; TCompressor.sub_00463F1C
 00463014    mov        eax,dword ptr [ebp-4]
 00463017    mov        edx,dword ptr [eax+0CC]; TCompressor.?fCC:dword
 0046301D    mov        eax,dword ptr [ebp-4]
 00463020    sub        edx,dword ptr [eax+114]
 00463026    mov        eax,dword ptr [ebp-4]
 00463029    call       00463628
 0046302E    mov        eax,dword ptr [ebp-4]
 00463031    cmp        dword ptr [eax+0AC],0; TCompressor.?fAC:TList
>00463038    je         004630C8
 0046303E    mov        eax,dword ptr [ebp-4]
 00463041    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00463047    cmp        dword ptr [eax+8],0; TList.FCount:Integer
>0046304B    jle        004630C8
 0046304D    mov        eax,dword ptr [ebp-4]
 00463050    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00463056    mov        ebx,dword ptr [eax+8]; TList.FCount:Integer
 00463059    dec        ebx
 0046305A    cmp        ebx,0
>0046305D    jb         004630C8
 0046305F    mov        eax,dword ptr [ebp-4]
 00463062    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00463068    mov        edx,ebx
 0046306A    call       TList.Get
 0046306F    mov        esi,eax
 00463071    mov        eax,dword ptr [ebp-4]
 00463074    mov        dword ptr [eax+0B0],esi; TCompressor.?fB0:Pointer
 0046307A    push       0
 0046307C    push       0
 0046307E    mov        eax,dword ptr [ebp-4]
 00463081    mov        eax,dword ptr [eax+12C]; TCompressor.?f12C:dword
 00463087    add        eax,dword ptr [esi]
 00463089    push       eax
 0046308A    mov        eax,dword ptr [ebp-4]
 0046308D    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00463093    push       eax
 00463094    call       kernel32.SetFilePointer
 00463099    push       0
 0046309B    mov        eax,dword ptr [ebp-4]
 0046309E    add        eax,110; TCompressor.?f110:?
 004630A3    push       eax
 004630A4    push       4
 004630A6    mov        eax,dword ptr [ebp-4]
 004630A9    mov        eax,dword ptr [eax+0B0]; TCompressor.?fB0:Pointer
 004630AF    add        eax,8
 004630B2    push       eax
 004630B3    mov        eax,dword ptr [ebp-4]
 004630B6    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 004630BC    push       eax
 004630BD    call       kernel32.WriteFile
 004630C2    dec        ebx
 004630C3    cmp        ebx,0FFFFFFFF
<004630C6    jne        0046305F
 004630C8    mov        eax,dword ptr [ebp-4]
 004630CB    cmp        byte ptr [eax+55],0; TCompressor.?f55:Boolean
>004630CF    je         00463138
 004630D1    mov        eax,dword ptr [ebp-4]
 004630D4    call       004613C8
 004630D9    test       eax,eax
>004630DB    jbe        00463138
 004630DD    push       2
 004630DF    push       0
 004630E1    push       0
 004630E3    mov        eax,dword ptr [ebp-4]
 004630E6    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 004630EC    push       eax
 004630ED    call       kernel32.SetFilePointer
 004630F2    mov        eax,dword ptr [ebp-4]
 004630F5    mov        eax,dword ptr [eax+50]; TCompressor.?f50:dword
 004630F8    mov        edx,dword ptr [ebp-4]
 004630FB    sub        eax,dword ptr [edx+5C]
 004630FE    mov        edx,dword ptr [ebp-4]
 00463101    add        eax,dword ptr [edx+30]; TCompressor.?f30:dword
 00463104    mov        edx,dword ptr [ebp-4]
 00463107    mov        dword ptr [edx+128],eax; TCompressor.?f128:Pointer
 0046310D    push       0
 0046310F    mov        eax,dword ptr [ebp-4]
 00463112    add        eax,110; TCompressor.?f110:?
 00463117    push       eax
 00463118    mov        eax,dword ptr [ebp-4]
 0046311B    mov        eax,dword ptr [eax+5C]; TCompressor.?f5C:dword
 0046311E    push       eax
 0046311F    mov        eax,dword ptr [ebp-4]
 00463122    mov        eax,dword ptr [eax+128]; TCompressor.?f128:Pointer
 00463128    push       eax
 00463129    mov        eax,dword ptr [ebp-4]
 0046312C    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00463132    push       eax
 00463133    call       kernel32.WriteFile
 00463138    push       0
 0046313A    push       0
 0046313C    push       0
 0046313E    mov        eax,dword ptr [ebp-4]
 00463141    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00463147    push       eax
 00463148    call       kernel32.SetFilePointer
 0046314D    mov        eax,dword ptr [ebp-4]
 00463150    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00463153    add        eax,0F4
 00463158    or         dword ptr [eax],100000
 0046315E    xor        ebx,ebx
 00463160    mov        eax,dword ptr [ebp-4]
 00463163    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00463166    cmp        dword ptr [eax+ebx*8+7C],0
>0046316B    jne        00463173
 0046316D    xor        edx,edx
 0046316F    mov        dword ptr [eax+ebx*8+78],edx
 00463173    cmp        ebx,0A
>00463176    jb         00463190
 00463178    mov        eax,dword ptr [ebp-4]
 0046317B    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 0046317E    xor        edx,edx
 00463180    mov        dword ptr [eax+ebx*8+78],edx
 00463184    mov        eax,dword ptr [ebp-4]
 00463187    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 0046318A    xor        edx,edx
 0046318C    mov        dword ptr [eax+ebx*8+7C],edx
 00463190    inc        ebx
 00463191    cmp        ebx,0F
<00463194    jne        00463160
 00463196    xor        eax,eax
 00463198    push       ebp
 00463199    push       4631EB
 0046319E    push       dword ptr fs:[eax]
 004631A1    mov        dword ptr fs:[eax],esp
 004631A4    mov        eax,dword ptr [ebp-4]
 004631A7    mov        edx,dword ptr [ebp-8]
 004631AA    sub        edx,dword ptr [eax+30]
 004631AD    mov        eax,dword ptr [ebp-4]
 004631B0    mov        dword ptr [eax+144],edx; TCompressor.?f144:dword
 004631B6    push       0
 004631B8    mov        eax,dword ptr [ebp-4]
 004631BB    add        eax,110; TCompressor.?f110:?
 004631C0    push       eax
 004631C1    mov        eax,dword ptr [ebp-4]
 004631C4    mov        eax,dword ptr [eax+144]; TCompressor.?f144:dword
 004631CA    push       eax
 004631CB    mov        eax,dword ptr [ebp-4]
 004631CE    mov        eax,dword ptr [eax+30]; TCompressor.?f30:dword
 004631D1    push       eax
 004631D2    mov        eax,dword ptr [ebp-4]
 004631D5    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 004631DB    push       eax
 004631DC    call       kernel32.WriteFile
 004631E1    xor        eax,eax
 004631E3    pop        edx
 004631E4    pop        ecx
 004631E5    pop        ecx
 004631E6    mov        dword ptr fs:[eax],edx
>004631E9    jmp        004631F5
<004631EB    jmp        @HandleAnyException
 004631F0    call       @DoneExcept
 004631F5    mov        eax,dword ptr [ebp-4]
 004631F8    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 004631FB    cmp        dword ptr [eax+58],0
>004631FF    je         00463272
 00463201    mov        eax,dword ptr [ebp-4]
 00463204    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 00463207    add        eax,58
 0046320A    push       eax
 0046320B    lea        eax,[ebp-14]
 0046320E    push       eax
 0046320F    mov        eax,dword ptr [ebp-4]
 00463212    mov        eax,dword ptr [eax+294]; TCompressor.?f294:String
 00463218    call       @LStrToPChar
 0046321D    push       eax
 0046321E    call       imagehlp.MapFileAndCheckSumA
 00463223    test       eax,eax
>00463225    je         00463232
 00463227    mov        eax,dword ptr [ebp-4]
 0046322A    mov        eax,dword ptr [eax+38]; TCompressor.?f38:dword
 0046322D    xor        edx,edx
 0046322F    mov        dword ptr [eax+58],edx
 00463232    push       0
 00463234    push       0
 00463236    push       0
 00463238    mov        eax,dword ptr [ebp-4]
 0046323B    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 00463241    push       eax
 00463242    call       kernel32.SetFilePointer
 00463247    push       0
 00463249    mov        eax,dword ptr [ebp-4]
 0046324C    add        eax,110; TCompressor.?f110:?
 00463251    push       eax
 00463252    mov        eax,dword ptr [ebp-4]
 00463255    mov        eax,dword ptr [eax+144]; TCompressor.?f144:dword
 0046325B    push       eax
 0046325C    mov        eax,dword ptr [ebp-4]
 0046325F    mov        eax,dword ptr [eax+30]; TCompressor.?f30:dword
 00463262    push       eax
 00463263    mov        eax,dword ptr [ebp-4]
 00463266    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 0046326C    push       eax
 0046326D    call       kernel32.WriteFile
 00463272    mov        eax,8
 00463277    call       @GetMem
 0046327C    mov        edx,dword ptr [ebp-4]
 0046327F    mov        dword ptr [edx+138],eax; TCompressor.?f138:Pointer
 00463285    mov        eax,8
 0046328A    call       @GetMem
 0046328F    mov        edx,dword ptr [ebp-4]
 00463292    mov        dword ptr [edx+13C],eax; TCompressor.?f13C:Pointer
 00463298    mov        eax,8
 0046329D    call       @GetMem
 004632A2    mov        edx,dword ptr [ebp-4]
 004632A5    mov        dword ptr [edx+140],eax; TCompressor.?f140:Pointer
 004632AB    mov        eax,dword ptr [ebp-4]
 004632AE    mov        eax,dword ptr [eax+140]; TCompressor.?f140:Pointer
 004632B4    push       eax
 004632B5    mov        eax,dword ptr [ebp-4]
 004632B8    mov        eax,dword ptr [eax+13C]; TCompressor.?f13C:Pointer
 004632BE    push       eax
 004632BF    mov        eax,dword ptr [ebp-4]
 004632C2    mov        eax,dword ptr [eax+138]; TCompressor.?f138:Pointer
 004632C8    push       eax
 004632C9    mov        eax,dword ptr [ebp-4]
 004632CC    mov        eax,dword ptr [eax+28]; TCompressor.?f28:dword
 004632CF    push       eax
 004632D0    call       kernel32.GetFileTime
 004632D5    mov        eax,dword ptr [ebp-4]
 004632D8    mov        eax,dword ptr [eax+140]; TCompressor.?f140:Pointer
 004632DE    push       eax
 004632DF    mov        eax,dword ptr [ebp-4]
 004632E2    mov        eax,dword ptr [eax+13C]; TCompressor.?f13C:Pointer
 004632E8    push       eax
 004632E9    mov        eax,dword ptr [ebp-4]
 004632EC    mov        eax,dword ptr [eax+138]; TCompressor.?f138:Pointer
 004632F2    push       eax
 004632F3    mov        eax,dword ptr [ebp-4]
 004632F6    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 004632FC    push       eax
 004632FD    call       kernel32.SetFileTime
 00463302    mov        eax,dword ptr [ebp-4]
 00463305    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 0046330B    call       FileClose
 00463310    mov        eax,dword ptr [ebp-4]
 00463313    xor        edx,edx
 00463315    mov        dword ptr [eax+10C],edx; TCompressor.?f10C:Longword
 0046331B    mov        eax,dword ptr [ebp-4]
 0046331E    mov        eax,dword ptr [eax+138]; TCompressor.?f138:Pointer
 00463324    mov        edx,8
 00463329    call       @FreeMem
 0046332E    mov        eax,dword ptr [ebp-4]
 00463331    mov        eax,dword ptr [eax+13C]; TCompressor.?f13C:Pointer
 00463337    mov        edx,8
 0046333C    call       @FreeMem
 00463341    mov        eax,dword ptr [ebp-4]
 00463344    mov        eax,dword ptr [eax+140]; TCompressor.?f140:Pointer
 0046334A    mov        edx,8
 0046334F    call       @FreeMem
 00463354    mov        eax,dword ptr [ebp-4]
 00463357    cmp        byte ptr [eax+80],0; TCompressor.?f80:Boolean
>0046335E    je         00463395
 00463360    push       0
 00463362    mov        eax,dword ptr [ebp-4]
 00463365    mov        edx,dword ptr [eax+290]; TCompressor.?f290:String
 0046336B    lea        eax,[ebp-48]
 0046336E    mov        ecx,463620; '.bak'
 00463373    call       @LStrCat3
 00463378    mov        eax,dword ptr [ebp-48]
 0046337B    call       @LStrToPChar
 00463380    push       eax
 00463381    mov        eax,dword ptr [ebp-4]
 00463384    mov        eax,dword ptr [eax+290]; TCompressor.?f290:String
 0046338A    call       @LStrToPChar
 0046338F    push       eax
 00463390    call       kernel32.CopyFileA
 00463395    mov        eax,dword ptr [ebp-4]
 00463398    mov        eax,dword ptr [eax+28]; TCompressor.?f28:dword
 0046339B    push       eax
 0046339C    call       kernel32.CloseHandle
 004633A1    mov        eax,dword ptr [ebp-4]
 004633A4    xor        edx,edx
 004633A6    mov        dword ptr [eax+28],edx; TCompressor.?f28:dword
 004633A9    mov        eax,dword ptr [ebp-4]
 004633AC    mov        edx,dword ptr [eax]
 004633AE    call       dword ptr [edx+48]; TCompressor.sub_00463F20
 004633B1    mov        eax,dword ptr [ebp-4]
 004633B4    cmp        dword ptr [eax+9C],0; TCompressor.?f9C:String
>004633BB    je         00463433
 004633BD    mov        eax,dword ptr [ebp-4]
 004633C0    mov        eax,dword ptr [eax+9C]; TCompressor.?f9C:String
 004633C6    call       DeleteFile
 004633CB    lea        edx,[ebp-4C]
 004633CE    mov        eax,dword ptr [ebp-4]
 004633D1    mov        eax,dword ptr [eax+9C]; TCompressor.?f9C:String
 004633D7    call       ExtractFileName
 004633DC    cmp        dword ptr [ebp-4C],0
>004633E0    jne        0046341A
 004633E2    lea        edx,[ebp-54]
 004633E5    mov        eax,dword ptr [ebp-4]
 004633E8    mov        eax,dword ptr [eax+290]; TCompressor.?f290:String
 004633EE    call       ExtractFileName
 004633F3    mov        ecx,dword ptr [ebp-54]
 004633F6    mov        eax,dword ptr [ebp-4]
 004633F9    mov        edx,dword ptr [eax+9C]; TCompressor.?f9C:String
 004633FF    lea        eax,[ebp-50]
 00463402    call       @LStrCat3
 00463407    mov        edx,dword ptr [ebp-50]
 0046340A    mov        eax,dword ptr [ebp-4]
 0046340D    mov        eax,dword ptr [eax+294]; TCompressor.?f294:String
 00463413    call       RenameFile
>00463418    jmp        00463458
 0046341A    mov        eax,dword ptr [ebp-4]
 0046341D    mov        edx,dword ptr [eax+9C]; TCompressor.?f9C:String
 00463423    mov        eax,dword ptr [ebp-4]
 00463426    mov        eax,dword ptr [eax+294]; TCompressor.?f294:String
 0046342C    call       RenameFile
>00463431    jmp        00463458
 00463433    mov        eax,dword ptr [ebp-4]
 00463436    mov        eax,dword ptr [eax+290]; TCompressor.?f290:String
 0046343C    call       DeleteFile
 00463441    mov        eax,dword ptr [ebp-4]
 00463444    mov        edx,dword ptr [eax+290]; TCompressor.?f290:String
 0046344A    mov        eax,dword ptr [ebp-4]
 0046344D    mov        eax,dword ptr [eax+294]; TCompressor.?f294:String
 00463453    call       RenameFile
 00463458    mov        eax,dword ptr [ebp-4]
 0046345B    mov        eax,dword ptr [eax+294]; TCompressor.?f294:String
 00463461    call       DeleteFile
 00463466    mov        eax,dword ptr [ebp-4]
 00463469    mov        eax,dword ptr [eax+290]; TCompressor.?f290:String
 0046346F    call       00461774
 00463474    mov        edx,dword ptr [ebp-4]
 00463477    mov        dword ptr [edx+90],eax; TCompressor.?f90:dword
 0046347D    mov        eax,dword ptr [ebp-4]
 00463480    cmp        dword ptr [eax+0AC],0; TCompressor.?fAC:TList
>00463487    je         004634E5
 00463489    mov        eax,dword ptr [ebp-4]
 0046348C    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 00463492    cmp        dword ptr [eax+8],0; TList.FCount:Integer
>00463496    jle        004634E5
 00463498    mov        eax,dword ptr [ebp-4]
 0046349B    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 004634A1    mov        esi,dword ptr [eax+8]; TList.FCount:Integer
 004634A4    dec        esi
 004634A5    test       esi,esi
>004634A7    jb         004634D7
 004634A9    inc        esi
 004634AA    xor        ebx,ebx
 004634AC    mov        eax,dword ptr [ebp-4]
 004634AF    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 004634B5    mov        edx,ebx
 004634B7    call       TList.Get
 004634BC    mov        edi,eax
 004634BE    mov        eax,dword ptr [ebp-4]
 004634C1    mov        dword ptr [eax+0B0],edi; TCompressor.?fB0:Pointer
 004634C7    mov        eax,edi
 004634C9    mov        edx,0C
 004634CE    call       @FreeMem
 004634D3    inc        ebx
 004634D4    dec        esi
<004634D5    jne        004634AC
 004634D7    mov        eax,dword ptr [ebp-4]
 004634DA    mov        eax,dword ptr [eax+0AC]; TCompressor.?fAC:TList
 004634E0    call       TObject.Free
 004634E5    mov        eax,dword ptr [ebp-4]
 004634E8    xor        edx,edx
 004634EA    mov        dword ptr [eax+0AC],edx; TCompressor.?fAC:TList
 004634F0    xor        eax,eax
 004634F2    pop        edx
 004634F3    pop        ecx
 004634F4    pop        ecx
 004634F5    mov        dword ptr fs:[eax],edx
 004634F8    push       46356C
 004634FD    call       kernel32.GetLastError
 00463502    mov        dword ptr [ebp-10],eax
 00463505    mov        eax,dword ptr [ebp-4]
 00463508    cmp        dword ptr [eax+10C],0; TCompressor.?f10C:Longword
>0046350F    je         0046351F
 00463511    mov        eax,dword ptr [ebp-4]
 00463514    mov        eax,dword ptr [eax+10C]; TCompressor.?f10C:Longword
 0046351A    call       FileClose
 0046351F    mov        eax,dword ptr [ebp-4]
 00463522    mov        eax,dword ptr [eax+294]; TCompressor.?f294:String
 00463528    call       DeleteFile
 0046352D    mov        eax,dword ptr [ebp-10]
 00463530    push       eax
 00463531    call       kernel32.SetLastError
 00463536    mov        eax,dword ptr [ebp-4]
 00463539    mov        edx,dword ptr [eax]
 0046353B    call       dword ptr [edx+58]; TCompressor.sub_00463F40
 0046353E    mov        ebx,eax
 00463540    mov        eax,dword ptr [ebp-4]
 00463543    mov        edx,dword ptr [eax]
 00463545    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00463548    sub        ebx,eax
 0046354A    push       ebx
 0046354B    mov        eax,dword ptr [ebp-4]
 0046354E    mov        edx,dword ptr [eax]
 00463550    call       dword ptr [edx+54]; TCompressor.sub_00463F34
 00463553    mov        edx,eax
 00463555    mov        eax,dword ptr [ebp-4]
 00463558    mov        eax,dword ptr [eax+98]; TCompressor.?f98:Pointer
 0046355E    pop        ecx
 0046355F    call       Move
 00463564    ret
<00463565    jmp        @HandleFinally
<0046356A    jmp        004634FD
 0046356C    xor        eax,eax
 0046356E    pop        edx
 0046356F    pop        ecx
 00463570    pop        ecx
 00463571    mov        dword ptr fs:[eax],edx
 00463574    push       46358E
 00463579    lea        eax,[ebp-54]
 0046357C    mov        edx,0E
 00463581    call       @LStrArrayClr
 00463586    ret
<00463587    jmp        @HandleFinally
<0046358C    jmp        00463579
 0046358E    pop        edi
 0046358F    pop        esi
 00463590    pop        ebx
 00463591    mov        esp,ebp
 00463593    pop        ebp
 00463594    ret
*}
end;

//00463628
//function sub_00463628(?:TCompressor; ?:dword):TCompressor;
//begin
{*
 00463628    push       ebp
 00463629    mov        ebp,esp
 0046362B    push       ecx
 0046362C    push       ebx
 0046362D    push       esi
 0046362E    push       edi
 0046362F    mov        ebx,edx
 00463631    mov        edi,eax
 00463633    test       ebx,ebx
>00463635    jbe        00463668
 00463637    mov        eax,ebx
 00463639    call       @GetMem
 0046363E    mov        esi,eax
 00463640    xor        ecx,ecx
 00463642    mov        edx,ebx
 00463644    mov        eax,esi
 00463646    call       FillMemory
 0046364B    push       0
 0046364D    lea        eax,[ebp-4]
 00463650    push       eax
 00463651    push       ebx
 00463652    push       esi
 00463653    mov        eax,dword ptr [edi+10C]; TCompressor.?f10C:Longword
 00463659    push       eax
 0046365A    call       kernel32.WriteFile
 0046365F    mov        edx,ebx
 00463661    mov        eax,esi
 00463663    call       @FreeMem
 00463668    pop        edi
 00463669    pop        esi
 0046366A    pop        ebx
 0046366B    pop        ecx
 0046366C    pop        ebp
 0046366D    ret
*}
//end;

//00463670
//function sub_00463670(?:?; ?:?; ?:?):?;
//begin
{*
 00463670    push       esi
 00463671    push       edi
 00463672    mov        esi,eax
 00463674    mov        edi,edx
 00463676    mov        edx,ecx
 00463678    xor        eax,eax
 0046367A    and        edx,3
 0046367D    shr        ecx,2
 00463680    repe cmps  dword ptr [esi],dword ptr [edi]
>00463682    jne        0046368B
 00463684    mov        ecx,edx
 00463686    repe cmps  byte ptr [esi],byte ptr [edi]
>00463688    jne        0046368B
 0046368A    inc        eax
 0046368B    pop        edi
 0046368C    pop        esi
 0046368D    ret
*}
//end;

//00463690
//procedure sub_00463690(?:dword; ?:?; ?:?; ?:?; ?:?);
//begin
{*
 00463690    push       ebp
 00463691    mov        ebp,esp
 00463693    add        esp,0FFFFFFE4
 00463696    push       ebx
 00463697    push       esi
 00463698    push       edi
 00463699    mov        byte ptr [ebp-5],cl
 0046369C    mov        esi,edx
 0046369E    mov        dword ptr [ebp-4],eax
 004636A1    mov        edi,dword ptr [ebp+0C]
 004636A4    add        edi,0FFFFFFFC
 004636A7    mov        eax,dword ptr [ebp-4]
 004636AA    mov        ebx,eax
 004636AC    add        ebx,10
 004636AF    movzx      edx,word ptr [eax+0C]
 004636B3    movzx      eax,word ptr [eax+0E]
 004636B7    add        edx,eax
 004636B9    mov        eax,edx
 004636BB    mov        dl,byte ptr [ebp-5]
 004636BE    mov        byte ptr [ebp-0D],dl
 004636C1    test       eax,eax
>004636C3    jbe        0046387B
 004636C9    mov        dword ptr [ebp-1C],eax
 004636CC    mov        dword ptr [ebp-0C],1
 004636D3    mov        eax,dword ptr [ebx+4]
 004636D6    test       eax,80000000
>004636DB    je         00463724
 004636DD    cmp        word ptr [ebp+8],1
>004636E2    jne        004636FC
 004636E4    mov        esi,dword ptr [ebx]
 004636E6    mov        edx,dword ptr [ebp-4]
 004636E9    movzx      edx,word ptr [edx+0C]
 004636ED    cmp        edx,dword ptr [ebp-0C]
>004636F0    jae        004636F8
 004636F2    mov        byte ptr [ebp-0D],0
>004636F6    jmp        004636FC
 004636F8    mov        byte ptr [ebp-0D],1
 004636FC    mov        edx,dword ptr [ebp+0C]
 004636FF    push       edx
 00463700    mov        dx,word ptr [ebp+8]
 00463704    inc        edx
 00463705    push       edx
 00463706    mov        edx,dword ptr [edi]
 00463708    mov        edx,dword ptr [edx+48]
 0046370B    and        eax,7FFFFFFF
 00463710    add        edx,eax
 00463712    mov        eax,edx
 00463714    mov        cl,byte ptr [ebp-0D]
 00463717    mov        edx,esi
 00463719    call       00463690
 0046371E    pop        ecx
>0046371F    jmp        0046386C
 00463724    cmp        esi,3
>00463727    jne        0046373C
 00463729    mov        eax,dword ptr [edi]
 0046372B    mov        eax,dword ptr [eax+38]
 0046372E    test       byte ptr [eax+17],20
>00463732    je         0046375E
 00463734    mov        eax,dword ptr [edi]
 00463736    cmp        byte ptr [eax+56],0
>0046373A    jne        0046375E
 0046373C    cmp        esi,0E
>0046373F    jne        00463754
 00463741    mov        eax,dword ptr [edi]
 00463743    mov        eax,dword ptr [eax+38]
 00463746    test       byte ptr [eax+17],20
>0046374A    je         0046375E
 0046374C    mov        eax,dword ptr [edi]
 0046374E    cmp        byte ptr [eax+56],0
>00463752    jne        0046375E
 00463754    cmp        esi,10
>00463757    je         0046375E
 00463759    cmp        esi,18
>0046375C    jne        004637BD
 0046375E    cmp        esi,3
>00463761    jne        0046376A
 00463763    mov        eax,dword ptr [ebp+0C]
 00463766    inc        word ptr [eax-6]
 0046376A    cmp        esi,0E
>0046376D    jne        00463776
 0046376F    mov        eax,dword ptr [ebp+0C]
 00463772    inc        word ptr [eax-8]
 00463776    mov        eax,0C
 0046377B    call       @GetMem
 00463780    mov        edx,dword ptr [edi]
 00463782    mov        dword ptr [edx+0B0],eax
 00463788    mov        eax,dword ptr [edi]
 0046378A    mov        eax,dword ptr [eax+0B0]
 00463790    mov        edx,dword ptr [ebx+4]
 00463793    mov        dword ptr [eax],edx
 00463795    mov        eax,dword ptr [edi]
 00463797    mov        eax,dword ptr [eax+48]
 0046379A    add        eax,dword ptr [ebx+4]
 0046379D    mov        edx,dword ptr [edi]
 0046379F    mov        edx,dword ptr [edx+0B0]
 004637A5    mov        dword ptr [edx+4],eax
 004637A8    mov        eax,dword ptr [edi]
 004637AA    mov        edx,dword ptr [eax+0B0]
 004637B0    mov        eax,dword ptr [edi]
 004637B2    mov        eax,dword ptr [eax+0AC]
 004637B8    call       TList.Add
 004637BD    mov        eax,dword ptr [edi]
 004637BF    mov        eax,dword ptr [eax+0A0]
 004637C5    test       eax,eax
>004637C7    je         004637D5
 004637C9    mov        edx,dword ptr [edi]
 004637CB    mov        edx,dword ptr [edx+48]
 004637CE    add        edx,dword ptr [ebx+4]
 004637D1    cmp        eax,dword ptr [edx]
>004637D3    jbe        004637E7
 004637D5    mov        eax,dword ptr [edi]
 004637D7    mov        eax,dword ptr [eax+48]
 004637DA    add        eax,dword ptr [ebx+4]
 004637DD    mov        eax,dword ptr [eax]
 004637DF    mov        edx,dword ptr [edi]
 004637E1    mov        dword ptr [edx+0A0],eax
 004637E7    cmp        byte ptr [ebp-5],0
>004637EB    je         0046386C
 004637ED    mov        eax,dword ptr [edi]
 004637EF    mov        eax,dword ptr [eax+48]
 004637F2    mov        edx,esi
 004637F4    and        edx,7FFFFFFF
 004637FA    add        eax,edx
 004637FC    mov        edx,eax
 004637FE    add        edx,2
 00463801    mov        dword ptr [ebp-14],edx
 00463804    movzx      eax,word ptr [eax]
 00463807    mov        dword ptr [ebp-18],eax
 0046380A    mov        eax,dword ptr [ebp-18]
 0046380D    add        eax,eax
 0046380F    cmp        eax,10
>00463812    jne        00463828
 00463814    mov        eax,46AD48
 00463819    mov        ecx,dword ptr [ebp-18]
 0046381C    mov        edx,dword ptr [ebp-14]
 0046381F    call       00463670
 00463824    test       al,al
>00463826    jne        00463846
 00463828    mov        eax,dword ptr [ebp-18]
 0046382B    add        eax,eax
 0046382D    cmp        eax,0E
>00463830    jne        0046386C
 00463832    mov        eax,46AD58
 00463837    mov        ecx,dword ptr [ebp-18]
 0046383A    mov        edx,dword ptr [ebp-14]
 0046383D    call       00463670
 00463842    test       al,al
>00463844    je         0046386C
 00463846    mov        eax,dword ptr [edi]
 00463848    mov        eax,dword ptr [eax+48]
 0046384B    add        eax,dword ptr [ebx+4]
 0046384E    mov        edx,dword ptr [eax]
 00463850    mov        ecx,dword ptr [edi]
 00463852    sub        edx,dword ptr [ecx+4C]
 00463855    add        edx,dword ptr [eax+4]
 00463858    mov        eax,edx
 0046385A    mov        edx,dword ptr [edi]
 0046385C    cmp        eax,dword ptr [edx+0A4]
>00463862    jbe        0046386C
 00463864    mov        edx,dword ptr [edi]
 00463866    mov        dword ptr [edx+0A4],eax
 0046386C    add        ebx,8
 0046386F    inc        dword ptr [ebp-0C]
 00463872    dec        dword ptr [ebp-1C]
<00463875    jne        004636D3
 0046387B    pop        edi
 0046387C    pop        esi
 0046387D    pop        ebx
 0046387E    mov        esp,ebp
 00463880    pop        ebp
 00463881    ret        4
*}
//end;

//00463884
//function sub_00463884(?:TCompressor):dword;
//begin
{*
 00463884    push       ebp
 00463885    mov        ebp,esp
 00463887    add        esp,0FFFFFFF8
 0046388A    push       ebx
 0046388B    mov        dword ptr [ebp-4],eax
 0046388E    lea        ebx,[ebp-4]
 00463891    mov        eax,dword ptr [ebx]
 00463893    mov        eax,dword ptr [eax+0A8]; TCompressor.?fA8:dword
 00463899    test       eax,eax
>0046389B    je         00463943
 004638A1    mov        eax,dword ptr [eax+14]
 004638A4    mov        edx,dword ptr [ebx]
 004638A6    add        eax,dword ptr [edx+30]; TCompressor.?f30:dword
 004638A9    mov        edx,dword ptr [ebx]
 004638AB    mov        dword ptr [edx+48],eax; TCompressor.?f48:dword
 004638AE    mov        eax,dword ptr [ebx]
 004638B0    mov        eax,dword ptr [eax+0A8]; TCompressor.?fA8:dword
 004638B6    mov        eax,dword ptr [eax+0C]
 004638B9    mov        edx,dword ptr [ebx]
 004638BB    mov        dword ptr [edx+4C],eax; TCompressor.?f4C:dword
 004638BE    mov        eax,dword ptr [ebx]
 004638C0    cmp        dword ptr [eax+0AC],0; TCompressor.?fAC:TList
>004638C7    jne        004638DD
 004638C9    mov        dl,1
 004638CB    mov        eax,[0040EBFC]; TList
 004638D0    call       TObject.Create; TList.Create
 004638D5    mov        edx,dword ptr [ebx]
 004638D7    mov        dword ptr [edx+0AC],eax; TCompressor.?fAC:TList
 004638DD    mov        eax,dword ptr [ebx]
 004638DF    xor        edx,edx
 004638E1    mov        dword ptr [eax+0A0],edx; TCompressor.?fA0:dword
 004638E7    mov        eax,dword ptr [ebx]
 004638E9    xor        edx,edx
 004638EB    mov        dword ptr [eax+0A4],edx; TCompressor.?fA4:dword
 004638F1    mov        word ptr [ebp-6],0
 004638F7    mov        word ptr [ebp-8],0
 004638FD    push       ebp
 004638FE    push       1
 00463900    mov        eax,dword ptr [ebx]
 00463902    mov        eax,dword ptr [eax+48]; TCompressor.?f48:dword
 00463905    xor        ecx,ecx
 00463907    xor        edx,edx
 00463909    call       00463690
 0046390E    pop        ecx
 0046390F    mov        eax,dword ptr [ebx]
 00463911    mov        eax,dword ptr [eax+0A4]; TCompressor.?fA4:dword
 00463917    test       eax,eax
>00463919    je         00463925
 0046391B    mov        edx,dword ptr [ebx]
 0046391D    mov        dword ptr [edx+0A0],eax; TCompressor.?fA0:dword
>00463923    jmp        00463943
 00463925    mov        eax,dword ptr [ebx]
 00463927    cmp        dword ptr [eax+0A0],0; TCompressor.?fA0:dword
>0046392E    je         00463943
 00463930    mov        eax,dword ptr [ebx]
 00463932    mov        eax,dword ptr [eax+0A8]; TCompressor.?fA8:dword
 00463938    mov        eax,dword ptr [eax+0C]
 0046393B    mov        edx,dword ptr [ebx]
 0046393D    sub        dword ptr [edx+0A0],eax
 00463943    pop        ebx
 00463944    pop        ecx
 00463945    pop        ecx
 00463946    pop        ebp
 00463947    ret
*}
//end;

//00463948
//procedure sub_00463948(?:TCompressor; ?:Pointer);
//begin
{*
 00463948    push       ebp
 00463949    mov        ebp,esp
 0046394B    push       ecx
 0046394C    push       ebx
 0046394D    push       esi
 0046394E    push       edi
 0046394F    mov        dword ptr [ebp-4],edx
 00463952    mov        ebx,eax
 00463954    mov        eax,dword ptr [ebx+0AC]; TCompressor.?fAC:TList
 0046395A    test       eax,eax
>0046395C    je         004639C1
 0046395E    cmp        dword ptr [eax+8],0; TList.FCount:Integer
>00463962    jle        004639C1
 00463964    mov        esi,dword ptr [eax+8]; TList.FCount:Integer
 00463967    dec        esi
 00463968    cmp        esi,0
>0046396B    jb         004639C1
 0046396D    mov        edx,esi
 0046396F    mov        eax,dword ptr [ebx+0AC]; TCompressor.?fAC:TList
 00463975    call       TList.Get
 0046397A    mov        edi,eax
 0046397C    mov        dword ptr [ebx+0B0],edi; TCompressor.?fB0:Pointer
 00463982    mov        eax,dword ptr [edi+4]
 00463985    mov        eax,dword ptr [eax]
 00463987    sub        eax,dword ptr [ebx+4C]
 0046398A    add        eax,dword ptr [ebp-4]
 0046398D    mov        edi,eax
 0046398F    mov        eax,dword ptr [ebx+0B0]; TCompressor.?fB0:Pointer
 00463995    mov        eax,dword ptr [eax+4]
 00463998    mov        eax,dword ptr [eax+4]
 0046399B    push       eax
 0046399C    push       edi
 0046399D    call       kernel32.IsBadWritePtr
 004639A2    test       eax,eax
>004639A4    jne        004639BB
 004639A6    mov        eax,dword ptr [ebx+0B0]; TCompressor.?fB0:Pointer
 004639AC    mov        eax,dword ptr [eax+4]
 004639AF    mov        edx,dword ptr [eax+4]
 004639B2    mov        eax,edi
 004639B4    xor        ecx,ecx
 004639B6    call       @FillChar
 004639BB    dec        esi
 004639BC    cmp        esi,0FFFFFFFF
<004639BF    jne        0046396D
 004639C1    pop        edi
 004639C2    pop        esi
 004639C3    pop        ebx
 004639C4    pop        ecx
 004639C5    pop        ebp
 004639C6    ret
*}
//end;

//004639C8
//function sub_004639C8(?:TCompressor; ?:dword; ?:?; ?:?):?;
//begin
{*
 004639C8    push       ebp
 004639C9    mov        ebp,esp
 004639CB    push       ecx
 004639CC    mov        ecx,10
 004639D1    push       0
 004639D3    push       0
 004639D5    dec        ecx
<004639D6    jne        004639D1
 004639D8    xchg       ecx,dword ptr [ebp-4]
 004639DB    push       ebx
 004639DC    push       esi
 004639DD    push       edi
 004639DE    mov        dword ptr [ebp-4],ecx
 004639E1    mov        ebx,eax
 004639E3    xor        eax,eax
 004639E5    push       ebp
 004639E6    push       463E2C
 004639EB    push       dword ptr fs:[eax]
 004639EE    mov        dword ptr fs:[eax],esp
 004639F1    test       edx,edx
>004639F3    jne        00463A1D
 004639F5    mov        dword ptr [ebp-8],14
 004639FC    mov        eax,dword ptr [ebp-8]
 004639FF    call       @GetMem
 00463A04    mov        edx,dword ptr [ebp+8]
 00463A07    mov        dword ptr [edx],eax
 00463A09    mov        eax,dword ptr [ebp+8]
 00463A0C    mov        eax,dword ptr [eax]
 00463A0E    xor        ecx,ecx
 00463A10    mov        edx,dword ptr [ebp-8]
 00463A13    call       @FillChar
>00463A18    jmp        00463E06
 00463A1D    mov        dword ptr [ebp-0C],edx
 00463A20    mov        dl,1
 00463A22    mov        eax,[0040F078]; TStringList
 00463A27    call       TObject.Create; TStringList.Create
 00463A2C    mov        esi,eax
 00463A2E    mov        dl,1
 00463A30    mov        eax,[0040F078]; TStringList
 00463A35    call       TObject.Create; TStringList.Create
 00463A3A    mov        dword ptr [ebp-14],eax
 00463A3D    mov        edi,dword ptr [ebx+30]; TCompressor.?f30:dword
 00463A40    mov        eax,edi
 00463A42    add        eax,dword ptr [ebp-0C]
 00463A45    add        eax,0C
 00463A48    mov        edx,dword ptr [eax]
 00463A4A    mov        eax,ebx
 00463A4C    call       0046136C
 00463A51    add        eax,edi
 00463A53    mov        edi,eax
 00463A55    lea        edx,[ebp-3C]
 00463A58    mov        eax,edi
 00463A5A    call       StrPas
 00463A5F    mov        eax,dword ptr [ebp-3C]
 00463A62    lea        edx,[ebp-10]
 00463A65    call       LowerCase
 00463A6A    mov        eax,dword ptr [ebp-10]
 00463A6D    mov        edx,463E48; 'kernel32.dll'
 00463A72    call       @LStrCmp
>00463A77    je         00463B16
 00463A7D    mov        edi,dword ptr [ebx+30]; TCompressor.?f30:dword
 00463A80    add        edi,dword ptr [ebp-0C]
 00463A83    cmp        dword ptr [edi],0
>00463A86    je         00463A98
 00463A88    mov        edx,dword ptr [edi]
 00463A8A    mov        eax,ebx
 00463A8C    call       0046136C
 00463A91    add        eax,dword ptr [ebx+30]; TCompressor.?f30:dword
 00463A94    mov        edi,dword ptr [eax]
>00463A96    jmp        00463AA9
 00463A98    add        edi,10
 00463A9B    mov        edx,dword ptr [edi]
 00463A9D    mov        eax,ebx
 00463A9F    call       0046136C
 00463AA4    add        eax,dword ptr [ebx+30]; TCompressor.?f30:dword
 00463AA7    mov        edi,dword ptr [eax]
 00463AA9    test       edi,edi
>00463AAB    je         00463B16
 00463AAD    mov        edx,dword ptr [ebp-10]
 00463AB0    mov        eax,esi
 00463AB2    mov        ecx,dword ptr [eax]
 00463AB4    call       dword ptr [ecx+34]; TStringList.Add
 00463AB7    test       edi,80000000
>00463ABD    je         00463AF4
 00463ABF    mov        eax,edi
 00463AC1    and        eax,7FFFFFFF
 00463AC6    xor        edx,edx
 00463AC8    push       edx
 00463AC9    push       eax
 00463ACA    lea        edx,[ebp-44]
 00463ACD    mov        eax,8
 00463AD2    call       IntToHex
 00463AD7    mov        ecx,dword ptr [ebp-44]
 00463ADA    lea        eax,[ebp-40]
 00463ADD    mov        edx,463E60; ' $'
 00463AE2    call       @LStrCat3
 00463AE7    mov        edx,dword ptr [ebp-40]
 00463AEA    mov        eax,dword ptr [ebp-14]
 00463AED    mov        ecx,dword ptr [eax]
 00463AEF    call       dword ptr [ecx+34]; TStringList.Add
>00463AF2    jmp        00463B16
 00463AF4    lea        edx,[edi+2]
 00463AF7    mov        eax,ebx
 00463AF9    call       0046136C
 00463AFE    mov        edx,eax
 00463B00    add        edx,dword ptr [ebx+30]; TCompressor.?f30:dword
 00463B03    lea        eax,[ebp-48]
 00463B06    call       @LStrFromPChar
 00463B0B    mov        edx,dword ptr [ebp-48]
 00463B0E    mov        eax,dword ptr [ebp-14]
 00463B11    mov        ecx,dword ptr [eax]
 00463B13    call       dword ptr [ecx+34]; TStringList.Add
 00463B16    add        dword ptr [ebp-0C],14
 00463B1A    mov        eax,dword ptr [ebx+30]; TCompressor.?f30:dword
 00463B1D    add        eax,dword ptr [ebp-0C]
 00463B20    add        eax,0C
 00463B23    cmp        dword ptr [eax],0
<00463B26    jne        00463A3D
 00463B2C    mov        eax,esi
 00463B2E    mov        edx,dword ptr [eax]
 00463B30    call       dword ptr [edx+14]; TStringList.GetCount
 00463B33    inc        eax
 00463B34    shl        eax,2
 00463B37    lea        eax,[eax+eax*4]
 00463B3A    mov        dword ptr [ebp-18],eax
 00463B3D    xor        eax,eax
 00463B3F    mov        dword ptr [ebp-1C],eax
 00463B42    mov        eax,esi
 00463B44    mov        edx,dword ptr [eax]
 00463B46    call       dword ptr [edx+14]; TStringList.GetCount
 00463B49    test       eax,eax
>00463B4B    jle        00463B7D
 00463B4D    mov        eax,esi
 00463B4F    mov        edx,dword ptr [eax]
 00463B51    call       dword ptr [edx+14]; TStringList.GetCount
 00463B54    dec        eax
 00463B55    test       eax,eax
>00463B57    jb         00463B7D
 00463B59    inc        eax
 00463B5A    mov        dword ptr [ebp-38],eax
 00463B5D    xor        ebx,ebx
 00463B5F    lea        ecx,[ebp-4C]
 00463B62    mov        edx,ebx
 00463B64    mov        eax,esi
 00463B66    mov        edi,dword ptr [eax]
 00463B68    call       dword ptr [edi+0C]; TStringList.Get
 00463B6B    mov        eax,dword ptr [ebp-4C]
 00463B6E    call       @LStrLen
 00463B73    inc        eax
 00463B74    add        dword ptr [ebp-1C],eax
 00463B77    inc        ebx
 00463B78    dec        dword ptr [ebp-38]
<00463B7B    jne        00463B5F
 00463B7D    mov        eax,esi
 00463B7F    mov        edx,dword ptr [eax]
 00463B81    call       dword ptr [edx+14]; TStringList.GetCount
 00463B84    shl        eax,3
 00463B87    mov        dword ptr [ebp-20],eax
 00463B8A    xor        eax,eax
 00463B8C    mov        dword ptr [ebp-24],eax
 00463B8F    mov        eax,esi
 00463B91    mov        edx,dword ptr [eax]
 00463B93    call       dword ptr [edx+14]; TStringList.GetCount
 00463B96    test       eax,eax
>00463B98    jle        00463C00
 00463B9A    mov        eax,dword ptr [ebp-14]
 00463B9D    mov        edx,dword ptr [eax]
 00463B9F    call       dword ptr [edx+14]; TStringList.GetCount
 00463BA2    dec        eax
 00463BA3    test       eax,eax
>00463BA5    jb         00463C00
 00463BA7    inc        eax
 00463BA8    mov        dword ptr [ebp-38],eax
 00463BAB    xor        ebx,ebx
 00463BAD    lea        eax,[ebp-50]
 00463BB0    push       eax
 00463BB1    lea        ecx,[ebp-54]
 00463BB4    mov        edx,ebx
 00463BB6    mov        eax,dword ptr [ebp-14]
 00463BB9    mov        edi,dword ptr [eax]
 00463BBB    call       dword ptr [edi+0C]; TStringList.Get
 00463BBE    mov        eax,dword ptr [ebp-54]
 00463BC1    mov        ecx,1
 00463BC6    mov        edx,1
 00463BCB    call       @LStrCopy
 00463BD0    mov        eax,dword ptr [ebp-50]
 00463BD3    mov        edx,463E6C; ' '
 00463BD8    call       @LStrCmp
>00463BDD    je         00463BFA
 00463BDF    lea        ecx,[ebp-58]
 00463BE2    mov        edx,ebx
 00463BE4    mov        eax,dword ptr [ebp-14]
 00463BE7    mov        edi,dword ptr [eax]
 00463BE9    call       dword ptr [edi+0C]; TStringList.Get
 00463BEC    mov        eax,dword ptr [ebp-58]
 00463BEF    call       @LStrLen
 00463BF4    add        eax,3
 00463BF7    add        dword ptr [ebp-24],eax
 00463BFA    inc        ebx
 00463BFB    dec        dword ptr [ebp-38]
<00463BFE    jne        00463BAD
 00463C00    mov        eax,dword ptr [ebp-18]
 00463C03    add        eax,dword ptr [ebp-1C]
 00463C06    add        eax,dword ptr [ebp-20]
 00463C09    add        eax,dword ptr [ebp-24]
 00463C0C    mov        dword ptr [ebp-8],eax
 00463C0F    mov        eax,dword ptr [ebp-8]
 00463C12    shr        eax,2
 00463C15    test       eax,eax
>00463C17    je         00463C20
 00463C19    inc        eax
 00463C1A    shl        eax,2
 00463C1D    mov        dword ptr [ebp-8],eax
 00463C20    mov        eax,dword ptr [ebp-8]
 00463C23    call       @GetMem
 00463C28    mov        edx,dword ptr [ebp+8]
 00463C2B    mov        dword ptr [edx],eax
 00463C2D    mov        eax,dword ptr [ebp+8]
 00463C30    mov        eax,dword ptr [eax]
 00463C32    xor        ecx,ecx
 00463C34    mov        edx,dword ptr [ebp-8]
 00463C37    call       @FillChar
 00463C3C    xor        eax,eax
 00463C3E    mov        dword ptr [ebp-28],eax
 00463C41    mov        eax,dword ptr [ebp-18]
 00463C44    mov        dword ptr [ebp-2C],eax
 00463C47    mov        eax,dword ptr [ebp-2C]
 00463C4A    add        eax,dword ptr [ebp-1C]
 00463C4D    mov        dword ptr [ebp-30],eax
 00463C50    mov        eax,dword ptr [ebp-30]
 00463C53    add        eax,dword ptr [ebp-20]
 00463C56    mov        dword ptr [ebp-34],eax
 00463C59    mov        eax,esi
 00463C5B    mov        edx,dword ptr [eax]
 00463C5D    call       dword ptr [edx+14]; TStringList.GetCount
 00463C60    test       eax,eax
>00463C62    jle        00463DF7
 00463C68    mov        eax,esi
 00463C6A    mov        edx,dword ptr [eax]
 00463C6C    call       dword ptr [edx+14]; TStringList.GetCount
 00463C6F    dec        eax
 00463C70    test       eax,eax
>00463C72    jb         00463DF7
 00463C78    inc        eax
 00463C79    mov        dword ptr [ebp-38],eax
 00463C7C    xor        ebx,ebx
 00463C7E    mov        eax,dword ptr [ebp-2C]
 00463C81    add        eax,dword ptr [ebp-4]
 00463C84    mov        edx,dword ptr [ebp+8]
 00463C87    mov        edx,dword ptr [edx]
 00463C89    add        edx,dword ptr [ebp-28]
 00463C8C    add        edx,0C
 00463C8F    mov        dword ptr [edx],eax
 00463C91    mov        eax,dword ptr [ebp-30]
 00463C94    add        eax,dword ptr [ebp-4]
 00463C97    mov        edx,dword ptr [ebp+8]
 00463C9A    mov        edx,dword ptr [edx]
 00463C9C    add        edx,dword ptr [ebp-28]
 00463C9F    add        edx,10
 00463CA2    mov        dword ptr [edx],eax
 00463CA4    lea        ecx,[ebp-5C]
 00463CA7    mov        edx,ebx
 00463CA9    mov        eax,esi
 00463CAB    mov        edi,dword ptr [eax]
 00463CAD    call       dword ptr [edi+0C]; TStringList.Get
 00463CB0    mov        eax,dword ptr [ebp-5C]
 00463CB3    call       @LStrLen
 00463CB8    push       eax
 00463CB9    lea        ecx,[ebp-60]
 00463CBC    mov        edx,ebx
 00463CBE    mov        eax,esi
 00463CC0    mov        edi,dword ptr [eax]
 00463CC2    call       dword ptr [edi+0C]; TStringList.Get
 00463CC5    mov        eax,dword ptr [ebp-60]
 00463CC8    call       @LStrToPChar
 00463CCD    mov        edx,eax
 00463CCF    mov        eax,dword ptr [ebp+8]
 00463CD2    mov        eax,dword ptr [eax]
 00463CD4    add        eax,dword ptr [ebp-2C]
 00463CD7    pop        ecx
 00463CD8    call       MoveMemory
 00463CDD    lea        eax,[ebp-64]
 00463CE0    push       eax
 00463CE1    lea        ecx,[ebp-68]
 00463CE4    mov        edx,ebx
 00463CE6    mov        eax,dword ptr [ebp-14]
 00463CE9    mov        edi,dword ptr [eax]
 00463CEB    call       dword ptr [edi+0C]; TStringList.Get
 00463CEE    mov        eax,dword ptr [ebp-68]
 00463CF1    mov        ecx,1
 00463CF6    mov        edx,1
 00463CFB    call       @LStrCopy
 00463D00    mov        eax,dword ptr [ebp-64]
 00463D03    mov        edx,463E6C; ' '
 00463D08    call       @LStrCmp
>00463D0D    je         00463D7A
 00463D0F    mov        eax,dword ptr [ebp-34]
 00463D12    add        eax,dword ptr [ebp-4]
 00463D15    mov        edx,dword ptr [ebp+8]
 00463D18    mov        edx,dword ptr [edx]
 00463D1A    add        edx,dword ptr [ebp-30]
 00463D1D    mov        dword ptr [edx],eax
 00463D1F    lea        ecx,[ebp-6C]
 00463D22    mov        edx,ebx
 00463D24    mov        eax,dword ptr [ebp-14]
 00463D27    mov        edi,dword ptr [eax]
 00463D29    call       dword ptr [edi+0C]; TStringList.Get
 00463D2C    mov        eax,dword ptr [ebp-6C]
 00463D2F    call       @LStrLen
 00463D34    push       eax
 00463D35    lea        ecx,[ebp-70]
 00463D38    mov        edx,ebx
 00463D3A    mov        eax,dword ptr [ebp-14]
 00463D3D    mov        edi,dword ptr [eax]
 00463D3F    call       dword ptr [edi+0C]; TStringList.Get
 00463D42    mov        eax,dword ptr [ebp-70]
 00463D45    call       @LStrToPChar
 00463D4A    mov        edx,eax
 00463D4C    mov        eax,dword ptr [ebp+8]
 00463D4F    mov        eax,dword ptr [eax]
 00463D51    add        eax,dword ptr [ebp-34]
 00463D54    add        eax,2
 00463D57    pop        ecx
 00463D58    call       MoveMemory
 00463D5D    lea        ecx,[ebp-74]
 00463D60    mov        edx,ebx
 00463D62    mov        eax,dword ptr [ebp-14]
 00463D65    mov        edi,dword ptr [eax]
 00463D67    call       dword ptr [edi+0C]; TStringList.Get
 00463D6A    mov        eax,dword ptr [ebp-74]
 00463D6D    call       @LStrLen
 00463D72    add        eax,3
 00463D75    add        dword ptr [ebp-34],eax
>00463D78    jmp        00463DC7
 00463D7A    lea        eax,[ebp-78]
 00463D7D    push       eax
 00463D7E    lea        ecx,[ebp-7C]
 00463D81    mov        edx,ebx
 00463D83    mov        eax,dword ptr [ebp-14]
 00463D86    mov        edi,dword ptr [eax]
 00463D88    call       dword ptr [edi+0C]; TStringList.Get
 00463D8B    mov        eax,dword ptr [ebp-7C]
 00463D8E    call       @LStrLen
 00463D93    push       eax
 00463D94    lea        ecx,[ebp-80]
 00463D97    mov        edx,ebx
 00463D99    mov        eax,dword ptr [ebp-14]
 00463D9C    mov        edi,dword ptr [eax]
 00463D9E    call       dword ptr [edi+0C]; TStringList.Get
 00463DA1    mov        eax,dword ptr [ebp-80]
 00463DA4    mov        edx,1
 00463DA9    pop        ecx
 00463DAA    call       @LStrCopy
 00463DAF    mov        eax,dword ptr [ebp-78]
 00463DB2    call       StrToInt
 00463DB7    cdq
 00463DB8    or         eax,80000000
 00463DBD    mov        edx,dword ptr [ebp+8]
 00463DC0    mov        edx,dword ptr [edx]
 00463DC2    add        edx,dword ptr [ebp-30]
 00463DC5    mov        dword ptr [edx],eax
 00463DC7    add        dword ptr [ebp-28],14
 00463DCB    lea        ecx,[ebp-84]
 00463DD1    mov        edx,ebx
 00463DD3    mov        eax,esi
 00463DD5    mov        edi,dword ptr [eax]
 00463DD7    call       dword ptr [edi+0C]; TStringList.Get
 00463DDA    mov        eax,dword ptr [ebp-84]
 00463DE0    call       @LStrLen
 00463DE5    inc        eax
 00463DE6    add        dword ptr [ebp-2C],eax
 00463DE9    add        dword ptr [ebp-30],8
 00463DED    inc        ebx
 00463DEE    dec        dword ptr [ebp-38]
<00463DF1    jne        00463C7E
 00463DF7    mov        eax,esi
 00463DF9    call       TObject.Free
 00463DFE    mov        eax,dword ptr [ebp-14]
 00463E01    call       TObject.Free
 00463E06    xor        eax,eax
 00463E08    pop        edx
 00463E09    pop        ecx
 00463E0A    pop        ecx
 00463E0B    mov        dword ptr fs:[eax],edx
 00463E0E    push       463E33
 00463E13    lea        eax,[ebp-84]
 00463E19    mov        edx,13
 00463E1E    call       @LStrArrayClr
 00463E23    lea        eax,[ebp-10]
 00463E26    call       @LStrClr
 00463E2B    ret
<00463E2C    jmp        @HandleFinally
<00463E31    jmp        00463E13
 00463E33    mov        eax,dword ptr [ebp-8]
 00463E36    pop        edi
 00463E37    pop        esi
 00463E38    pop        ebx
 00463E39    mov        esp,ebp
 00463E3B    pop        ebp
 00463E3C    ret        4
*}
//end;

//00463E70
//function sub_00463E70(?:TCompressor):?;
//begin
{*
 00463E70    push       ebx
 00463E71    push       esi
 00463E72    push       edi
 00463E73    push       ecx
 00463E74    xor        edx,edx
 00463E76    mov        dword ptr [esp],edx
 00463E79    mov        edx,dword ptr [eax+38]; TCompressor.?f38:dword
 00463E7C    mov        dword ptr [eax+0B8],edx; TCompressor.?fB8:dword
 00463E82    add        dword ptr [eax+0B8],0F8; TCompressor.?fB8:dword
 00463E8C    mov        ecx,dword ptr [eax+38]; TCompressor.?f38:dword
 00463E8F    mov        edx,dword ptr [ecx+88]
 00463E95    mov        ebx,dword ptr [ecx+8C]
 00463E9B    test       ebx,ebx
>00463E9D    je         00463EFD
 00463E9F    movzx      ecx,word ptr [ecx+6]
 00463EA3    test       ecx,ecx
>00463EA5    jbe        00463EFD
 00463EA7    mov        esi,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00463EAD    mov        edi,dword ptr [esi+0C]
 00463EB0    cmp        edx,edi
>00463EB2    jb         00463EBB
 00463EB4    add        edi,dword ptr [esi+8]
 00463EB7    cmp        edx,edi
>00463EB9    jb         00463EDC
 00463EBB    mov        ebx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00463EC1    cmp        edx,dword ptr [ebx+0C]
>00463EC4    jb         00463EF3
 00463EC6    mov        ebx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00463ECC    mov        ebx,dword ptr [ebx+0C]
 00463ECF    mov        esi,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00463ED5    add        ebx,dword ptr [esi+10]
 00463ED8    cmp        edx,ebx
>00463EDA    jae        00463EF3
 00463EDC    mov        ebx,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00463EE2    cmp        dword ptr [ebx+0C],0
>00463EE6    je         00463EF3
 00463EE8    mov        eax,dword ptr [eax+0B8]; TCompressor.?fB8:dword
 00463EEE    mov        dword ptr [esp],eax
>00463EF1    jmp        00463EFD
 00463EF3    add        dword ptr [eax+0B8],28; TCompressor.?fB8:dword
 00463EFA    dec        ecx
<00463EFB    jne        00463EA7
 00463EFD    mov        eax,dword ptr [esp]
 00463F00    pop        edx
 00463F01    pop        edi
 00463F02    pop        esi
 00463F03    pop        ebx
 00463F04    ret
*}
//end;

//00463F08
procedure sub_00463F08();
begin
{*
 00463F08    ret
*}
end;

//00463F0C
procedure sub_00463F0C();
begin
{*
 00463F0C    ret
*}
end;

//00463F10
procedure sub_00463F10();
begin
{*
 00463F10    ret
*}
end;

//00463F14
//function sub_00463F14(?:?; ?:?):?;
//begin
{*
 00463F14    mov        eax,ecx
 00463F16    ret
*}
//end;

//00463F18
procedure sub_00463F18();
begin
{*
 00463F18    ret
*}
end;

//00463F1C
procedure sub_00463F1C();
begin
{*
 00463F1C    ret
*}
end;

//00463F20
procedure sub_00463F20();
begin
{*
 00463F20    ret
*}
end;

//00463F24
procedure sub_00463F24();
begin
{*
 00463F24    ret
*}
end;

//00463F28
procedure sub_00463F28();
begin
{*
 00463F28    push       ebp
 00463F29    mov        ebp,esp
 00463F2B    call       Randomize
 00463F30    pop        ebp
 00463F31    ret
*}
end;

//00463F34
procedure sub_00463F34();
begin
{*
 00463F34    push       ebp
 00463F35    mov        ebp,esp
 00463F37    call       00464068
 00463F3C    pop        ebp
 00463F3D    ret
*}
end;

//00463F40
procedure sub_00463F40();
begin
{*
 00463F40    push       ebp
 00463F41    mov        ebp,esp
 00463F43    call       0046406E
 00463F48    pop        ebp
 00463F49    ret
*}
end;

//00463F4C
procedure sub_00463F4C();
begin
{*
 00463F4C    push       ebp
 00463F4D    mov        ebp,esp
 00463F4F    call       00464074
 00463F54    pop        ebp
 00463F55    ret
*}
end;

//00463F58
procedure sub_00463F58();
begin
{*
 00463F58    push       ebp
 00463F59    mov        ebp,esp
 00463F5B    call       0046407A
 00463F60    pop        ebp
 00463F61    ret
*}
end;

//00463F64
procedure sub_00463F64();
begin
{*
 00463F64    push       ebp
 00463F65    mov        ebp,esp
 00463F67    call       00464080
 00463F6C    pop        ebp
 00463F6D    ret
*}
end;

//00463F70
procedure sub_00463F70();
begin
{*
 00463F70    push       ebp
 00463F71    mov        ebp,esp
 00463F73    call       00464086
 00463F78    pop        ebp
 00463F79    ret
*}
end;

//00463F7C
procedure sub_00463F7C();
begin
{*
 00463F7C    push       ebp
 00463F7D    mov        ebp,esp
 00463F7F    call       0046408C
 00463F84    pop        ebp
 00463F85    ret
*}
end;

//00463F88
procedure sub_00463F88();
begin
{*
 00463F88    push       ebp
 00463F89    mov        ebp,esp
 00463F8B    call       00464092
 00463F90    pop        ebp
 00463F91    ret
*}
end;

//00463F94
procedure sub_00463F94();
begin
{*
 00463F94    push       ebp
 00463F95    mov        ebp,esp
 00463F97    call       00464098
 00463F9C    pop        ebp
 00463F9D    ret
*}
end;

//00463FA0
procedure sub_00463FA0();
begin
{*
 00463FA0    push       ebp
 00463FA1    mov        ebp,esp
 00463FA3    call       0046409E
 00463FA8    pop        ebp
 00463FA9    ret
*}
end;

//00463FAC
procedure sub_00463FAC();
begin
{*
 00463FAC    push       ebp
 00463FAD    mov        ebp,esp
 00463FAF    call       004640A4
 00463FB4    pop        ebp
 00463FB5    ret
*}
end;

//00463FB8
procedure sub_00463FB8();
begin
{*
 00463FB8    ret
*}
end;

//00463FBC
procedure sub_00463FBC();
begin
{*
 00463FBC    ret
*}
end;

//00463FC0
procedure sub_00463FC0();
begin
{*
 00463FC0    ret
*}
end;

//00463FC4
procedure sub_00463FC4();
begin
{*
 00463FC4    push       ebp
 00463FC5    mov        ebp,esp
 00463FC7    call       004640AA
 00463FCC    pop        ebp
 00463FCD    ret
*}
end;

//00463FD0
procedure sub_00463FD0();
begin
{*
 00463FD0    push       ebp
 00463FD1    mov        ebp,esp
 00463FD3    call       004640B0
 00463FD8    pop        ebp
 00463FD9    ret
*}
end;

//00463FDC
procedure sub_00463FDC();
begin
{*
 00463FDC    push       ebp
 00463FDD    mov        ebp,esp
 00463FDF    call       004640B6
 00463FE4    pop        ebp
 00463FE5    ret
*}
end;

//00463FE8
procedure sub_00463FE8();
begin
{*
 00463FE8    push       ebp
 00463FE9    mov        ebp,esp
 00463FEB    call       004640BC
 00463FF0    pop        ebp
 00463FF1    ret
*}
end;

//00463FF4
procedure sub_00463FF4();
begin
{*
 00463FF4    push       ebp
 00463FF5    mov        ebp,esp
 00463FF7    call       004640C2
 00463FFC    pop        ebp
 00463FFD    ret
*}
end;

//00464000
procedure sub_00464000();
begin
{*
 00464000    push       ebp
 00464001    mov        ebp,esp
 00464003    call       004640C8
 00464008    pop        ebp
 00464009    ret
*}
end;

//0046400C
procedure sub_0046400C();
begin
{*
 0046400C    push       ebp
 0046400D    mov        ebp,esp
 0046400F    call       004640CE
 00464014    pop        ebp
 00464015    ret
*}
end;

//00464018
procedure sub_00464018();
begin
{*
 00464018    push       ebp
 00464019    mov        ebp,esp
 0046401B    call       004640D4
 00464020    pop        ebp
 00464021    ret
*}
end;

//00464024
procedure sub_00464024();
begin
{*
 00464024    push       ebp
 00464025    mov        ebp,esp
 00464027    call       004640DA
 0046402C    pop        ebp
 0046402D    ret
*}
end;

//00464030
procedure sub_00464030();
begin
{*
 00464030    ret
*}
end;

//00464034
procedure sub_00464034();
begin
{*
 00464034    ret
*}
end;

//00464038
procedure sub_00464038();
begin
{*
 00464038    push       ebp
 00464039    mov        ebp,esp
 0046403B    call       004640E0
 00464040    pop        ebp
 00464041    ret
*}
end;

//00464044
procedure sub_00464044();
begin
{*
 00464044    push       ebp
 00464045    mov        ebp,esp
 00464047    call       004640E6
 0046404C    pop        ebp
 0046404D    ret
*}
end;

//00464050
procedure sub_00464050();
begin
{*
 00464050    push       ebp
 00464051    mov        ebp,esp
 00464053    call       004640EC
 00464058    pop        ebp
 00464059    ret
*}
end;

//0046405C
procedure sub_0046405C();
begin
{*
 0046405C    push       ebp
 0046405D    mov        ebp,esp
 0046405F    call       004640F2
 00464064    pop        ebp
 00464065    ret
*}
end;

//00464068
//function sub_00464068:?;
//begin
{*
 00464068    mov        eax,46AD68
 0046406D    ret
*}
//end;

//0046406E
//function sub_0046406E:?;
//begin
{*
 0046406E    mov        eax,46BD84; gvar_0046BD84
 00464073    ret
*}
//end;

//00464074
//function sub_00464074:?;
//begin
{*
 00464074    mov        eax,46B340
 00464079    ret
*}
//end;

//0046407A
//function sub_0046407A:?;
//begin
{*
 0046407A    mov        eax,46B169
 0046407F    ret
*}
//end;

//00464080
//function sub_00464080:?;
//begin
{*
 00464080    mov        eax,46AD86
 00464085    ret
*}
//end;

//00464086
//function sub_00464086:?;
//begin
{*
 00464086    mov        eax,46AFCD
 0046408B    ret
*}
//end;

//0046408C
//function sub_0046408C:?;
//begin
{*
 0046408C    mov        eax,46BD70
 00464091    ret
*}
//end;

//00464092
//function sub_00464092:?;
//begin
{*
 00464092    mov        eax,46BD84; gvar_0046BD84
 00464097    ret
*}
//end;

//00464098
//function sub_00464098:?;
//begin
{*
 00464098    mov        eax,46B318
 0046409D    ret
*}
//end;

//0046409E
//function sub_0046409E:?;
//begin
{*
 0046409E    mov        eax,46BD7C
 004640A3    ret
*}
//end;

//004640A4
//function sub_004640A4:?;
//begin
{*
 004640A4    mov        eax,46BD80
 004640A9    ret
*}
//end;

//004640AA
//function sub_004640AA:?;
//begin
{*
 004640AA    mov        eax,46BD20
 004640AF    ret
*}
//end;

//004640B0
//function sub_004640B0:?;
//begin
{*
 004640B0    mov        eax,46BD24
 004640B5    ret
*}
//end;

//004640B6
//function sub_004640B6:?;
//begin
{*
 004640B6    mov        eax,46BD28
 004640BB    ret
*}
//end;

//004640BC
//function sub_004640BC:?;
//begin
{*
 004640BC    mov        eax,46BD18
 004640C1    ret
*}
//end;

//004640C2
//function sub_004640C2:?;
//begin
{*
 004640C2    mov        eax,46B30C
 004640C7    ret
*}
//end;

//004640C8
//function sub_004640C8:?;
//begin
{*
 004640C8    mov        eax,46B310
 004640CD    ret
*}
//end;

//004640CE
//function sub_004640CE:?;
//begin
{*
 004640CE    mov        eax,46B314
 004640D3    ret
*}
//end;

//004640D4
//function sub_004640D4:?;
//begin
{*
 004640D4    mov        eax,46BD00
 004640D9    ret
*}
//end;

//004640DA
//function sub_004640DA:?;
//begin
{*
 004640DA    mov        eax,46AE6A
 004640DF    ret
*}
//end;

//004640E0
//function sub_004640E0:?;
//begin
{*
 004640E0    mov        eax,46B320
 004640E5    ret
*}
//end;

//004640E6
//function sub_004640E6:?;
//begin
{*
 004640E6    mov        eax,46AE9E
 004640EB    ret
*}
//end;

//004640EC
//function sub_004640EC:?;
//begin
{*
 004640EC    mov        eax,46AE92
 004640F1    ret
*}
//end;

//004640F2
//function sub_004640F2:?;
//begin
{*
 004640F2    mov        eax,46AEA2
 004640F7    ret
*}
//end;

end.