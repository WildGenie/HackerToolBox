{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit Lang;

interface

uses
  Classes, Windows, Graphics;

type
  TLanguageNotifyEvent = procedure(Sender:TObject; AComponent:TComponent; PropertyName:String; OldValue:String; var NewValue:String) of object;
  TLanguage = class(TComponent)
  public
    f24:String;//f24
    f28:TStringList;//f28
    f2C:String;//f2C
    OnBeforeTranslation:TNotifyEvent;//f30
    f32:word;//f32
    f34:dword;//f34
    OnAfterTranslation:TNotifyEvent;//f38
    f3A:word;//f3A
    f3C:dword;//f3C
    OnTranslate:TLanguageNotifyEvent;//f40
    f42:word;//f42
    f44:dword;//f44
    destructor Destroy; virtual;
    constructor Create(AOwner:TComponent); virtual;
  end;

implementation

{$R *.DFM}

//0045CD04
constructor TLanguage.Create(AOwner:TComponent);
begin
{*
 0045CD04    push       ebp
 0045CD05    mov        ebp,esp
 0045CD07    push       ebx
 0045CD08    push       esi
 0045CD09    test       dl,dl
>0045CD0B    je         0045CD15
 0045CD0D    add        esp,0FFFFFFF0
 0045CD10    call       @ClassCreate
 0045CD15    mov        ebx,edx
 0045CD17    mov        esi,eax
 0045CD19    xor        edx,edx
 0045CD1B    mov        eax,esi
 0045CD1D    call       TComponent.Create
 0045CD22    mov        dl,1
 0045CD24    mov        eax,[0040F078]; TStringList
 0045CD29    call       TObject.Create; TStringList.Create
 0045CD2E    mov        dword ptr [esi+28],eax; TLanguage.?f28:TStringList
 0045CD31    mov        eax,esi
 0045CD33    test       bl,bl
>0045CD35    je         0045CD46
 0045CD37    call       @AfterConstruction
 0045CD3C    pop        dword ptr fs:[0]
 0045CD43    add        esp,0C
 0045CD46    mov        eax,esi
 0045CD48    pop        esi
 0045CD49    pop        ebx
 0045CD4A    pop        ebp
 0045CD4B    ret
*}
end;

//0045CD4C
destructor TLanguage.Destroy;
begin
{*
 0045CD4C    push       ebp
 0045CD4D    mov        ebp,esp
 0045CD4F    push       ebx
 0045CD50    push       esi
 0045CD51    call       @BeforeDestruction
 0045CD56    mov        ebx,edx
 0045CD58    mov        esi,eax
 0045CD5A    mov        eax,dword ptr [esi+28]; TLanguage.?f28:TStringList
 0045CD5D    call       TObject.Free
 0045CD62    mov        edx,ebx
 0045CD64    and        dl,0FC
 0045CD67    mov        eax,esi
 0045CD69    call       TComponent.Destroy
 0045CD6E    test       bl,bl
>0045CD70    jle        0045CD79
 0045CD72    mov        eax,esi
 0045CD74    call       @ClassDestroy
 0045CD79    pop        esi
 0045CD7A    pop        ebx
 0045CD7B    pop        ebp
 0045CD7C    ret
*}
end;

//0045CD80
//procedure sub_0045CD80(?:TLanguage; ?:AnsiString; ?:AnsiString);
//begin
{*
 0045CD80    push       ebp
 0045CD81    mov        ebp,esp
 0045CD83    push       0
 0045CD85    push       0
 0045CD87    push       ebx
 0045CD88    push       esi
 0045CD89    mov        esi,ecx
 0045CD8B    mov        ebx,edx
 0045CD8D    xor        eax,eax
 0045CD8F    push       ebp
 0045CD90    push       45CE36
 0045CD95    push       dword ptr fs:[eax]
 0045CD98    mov        dword ptr fs:[eax],esp
 0045CD9B    mov        edx,dword ptr [ebx]
 0045CD9D    mov        eax,45CE4C; '.'
 0045CDA2    call       @LStrPos
 0045CDA7    test       eax,eax
>0045CDA9    jle        0045CDE3
 0045CDAB    push       esi
 0045CDAC    mov        edx,dword ptr [ebx]
 0045CDAE    mov        eax,45CE4C; '.'
 0045CDB3    call       @LStrPos
 0045CDB8    mov        ecx,eax
 0045CDBA    dec        ecx
 0045CDBB    mov        eax,dword ptr [ebx]
 0045CDBD    mov        edx,1
 0045CDC2    call       @LStrCopy
 0045CDC7    mov        edx,dword ptr [ebx]
 0045CDC9    mov        eax,45CE4C; '.'
 0045CDCE    call       @LStrPos
 0045CDD3    mov        ecx,eax
 0045CDD5    mov        eax,ebx
 0045CDD7    mov        edx,1
 0045CDDC    call       @LStrDelete
>0045CDE1    jmp        0045CDF3
 0045CDE3    mov        eax,esi
 0045CDE5    mov        edx,dword ptr [ebx]
 0045CDE7    call       @LStrAsg
 0045CDEC    mov        eax,ebx
 0045CDEE    call       @LStrClr
 0045CDF3    lea        edx,[ebp-4]
 0045CDF6    mov        eax,dword ptr [ebx]
 0045CDF8    call       Trim
 0045CDFD    mov        edx,dword ptr [ebp-4]
 0045CE00    mov        eax,ebx
 0045CE02    call       @LStrAsg
 0045CE07    lea        edx,[ebp-8]
 0045CE0A    mov        eax,dword ptr [esi]
 0045CE0C    call       Trim
 0045CE11    mov        edx,dword ptr [ebp-8]
 0045CE14    mov        eax,esi
 0045CE16    call       @LStrAsg
 0045CE1B    xor        eax,eax
 0045CE1D    pop        edx
 0045CE1E    pop        ecx
 0045CE1F    pop        ecx
 0045CE20    mov        dword ptr fs:[eax],edx
 0045CE23    push       45CE3D
 0045CE28    lea        eax,[ebp-8]
 0045CE2B    mov        edx,2
 0045CE30    call       @LStrArrayClr
 0045CE35    ret
<0045CE36    jmp        @HandleFinally
<0045CE3B    jmp        0045CE28
 0045CE3D    pop        esi
 0045CE3E    pop        ebx
 0045CE3F    pop        ecx
 0045CE40    pop        ecx
 0045CE41    pop        ebp
 0045CE42    ret
*}
//end;

//0045CE50
//function sub_0045CE50(?:TLanguage; ?:AnsiString):?;
//begin
{*
 0045CE50    push       ebp
 0045CE51    mov        ebp,esp
 0045CE53    push       ecx
 0045CE54    push       ebx
 0045CE55    mov        dword ptr [ebp-4],edx
 0045CE58    mov        eax,dword ptr [ebp-4]
 0045CE5B    call       @LStrAddRef
 0045CE60    xor        eax,eax
 0045CE62    push       ebp
 0045CE63    push       45CE96
 0045CE68    push       dword ptr fs:[eax]
 0045CE6B    mov        dword ptr fs:[eax],esp
 0045CE6E    mov        edx,dword ptr [ebp-4]
 0045CE71    mov        eax,45CEAC; '.'
 0045CE76    call       @LStrPos
 0045CE7B    test       eax,eax
 0045CE7D    sete       bl
 0045CE80    xor        eax,eax
 0045CE82    pop        edx
 0045CE83    pop        ecx
 0045CE84    pop        ecx
 0045CE85    mov        dword ptr fs:[eax],edx
 0045CE88    push       45CE9D
 0045CE8D    lea        eax,[ebp-4]
 0045CE90    call       @LStrClr
 0045CE95    ret
<0045CE96    jmp        @HandleFinally
<0045CE9B    jmp        0045CE8D
 0045CE9D    mov        eax,ebx
 0045CE9F    pop        ebx
 0045CEA0    pop        ecx
 0045CEA1    pop        ebp
 0045CEA2    ret
*}
//end;

//0045CEB0
//function sub_0045CEB0(?:TLanguage; ?:TApplication; ?:AnsiString):TComponent;
//begin
{*
 0045CEB0    push       ebp
 0045CEB1    mov        ebp,esp
 0045CEB3    add        esp,0FFFFFFF0
 0045CEB6    push       ebx
 0045CEB7    push       esi
 0045CEB8    push       edi
 0045CEB9    xor        ebx,ebx
 0045CEBB    mov        dword ptr [ebp-0C],ebx
 0045CEBE    mov        dword ptr [ebp-10],ebx
 0045CEC1    mov        dword ptr [ebp-4],ecx
 0045CEC4    mov        edi,edx
 0045CEC6    mov        eax,dword ptr [ebp-4]
 0045CEC9    call       @LStrAddRef
 0045CECE    xor        eax,eax
 0045CED0    push       ebp
 0045CED1    push       45CF59
 0045CED6    push       dword ptr fs:[eax]
 0045CED9    mov        dword ptr fs:[eax],esp
 0045CEDC    xor        eax,eax
 0045CEDE    mov        dword ptr [ebp-8],eax
 0045CEE1    test       edi,edi
>0045CEE3    je         0045CF36
 0045CEE5    mov        eax,edi
 0045CEE7    call       TComponent.GetComponentCount
 0045CEEC    mov        esi,eax
 0045CEEE    dec        esi
 0045CEEF    test       esi,esi
>0045CEF1    jl         0045CF36
 0045CEF3    inc        esi
 0045CEF4    xor        ebx,ebx
 0045CEF6    mov        edx,ebx
 0045CEF8    mov        eax,edi
 0045CEFA    call       TComponent.GetComponent
 0045CEFF    mov        eax,dword ptr [eax+8]; TComponent.?f8:TComponentName
 0045CF02    lea        edx,[ebp-0C]
 0045CF05    call       UpperCase
 0045CF0A    mov        eax,dword ptr [ebp-0C]
 0045CF0D    push       eax
 0045CF0E    lea        edx,[ebp-10]
 0045CF11    mov        eax,dword ptr [ebp-4]
 0045CF14    call       UpperCase
 0045CF19    mov        edx,dword ptr [ebp-10]
 0045CF1C    pop        eax
 0045CF1D    call       @LStrCmp
>0045CF22    jne        0045CF32
 0045CF24    mov        edx,ebx
 0045CF26    mov        eax,edi
 0045CF28    call       TComponent.GetComponent
 0045CF2D    mov        dword ptr [ebp-8],eax
>0045CF30    jmp        0045CF36
 0045CF32    inc        ebx
 0045CF33    dec        esi
<0045CF34    jne        0045CEF6
 0045CF36    xor        eax,eax
 0045CF38    pop        edx
 0045CF39    pop        ecx
 0045CF3A    pop        ecx
 0045CF3B    mov        dword ptr fs:[eax],edx
 0045CF3E    push       45CF60
 0045CF43    lea        eax,[ebp-10]
 0045CF46    mov        edx,2
 0045CF4B    call       @LStrArrayClr
 0045CF50    lea        eax,[ebp-4]
 0045CF53    call       @LStrClr
 0045CF58    ret
<0045CF59    jmp        @HandleFinally
<0045CF5E    jmp        0045CF43
 0045CF60    mov        eax,dword ptr [ebp-8]
 0045CF63    pop        edi
 0045CF64    pop        esi
 0045CF65    pop        ebx
 0045CF66    mov        esp,ebp
 0045CF68    pop        ebp
 0045CF69    ret
*}
//end;

//0045CF6C
//procedure sub_0045CF6C(?:TLanguage; ?:TApplication; ?:AnsiString; ?:?);
//begin
{*
 0045CF6C    push       ebp
 0045CF6D    mov        ebp,esp
 0045CF6F    push       ecx
 0045CF70    push       ebx
 0045CF71    push       esi
 0045CF72    push       edi
 0045CF73    mov        dword ptr [ebp-4],ecx
 0045CF76    mov        ebx,edx
 0045CF78    mov        edi,eax
 0045CF7A    mov        eax,dword ptr [ebp-4]
 0045CF7D    call       @LStrAddRef
 0045CF82    mov        eax,dword ptr [ebp+8]
 0045CF85    call       @LStrAddRef
 0045CF8A    xor        eax,eax
 0045CF8C    push       ebp
 0045CF8D    push       45D01B
 0045CF92    push       dword ptr fs:[eax]
 0045CF95    mov        dword ptr fs:[eax],esp
 0045CF98    test       ebx,ebx
>0045CF9A    je         0045CFFD
 0045CF9C    mov        eax,dword ptr [ebx]
 0045CF9E    call       TObject.ClassInfo
 0045CFA3    mov        edx,dword ptr [ebp-4]
 0045CFA6    call       GetPropInfo
 0045CFAB    mov        esi,eax
 0045CFAD    test       esi,esi
>0045CFAF    je         0045CFFD
 0045CFB1    mov        eax,dword ptr [edi]
 0045CFB3    mov        edx,esi
 0045CFB5    call       0045D4F0
 0045CFBA    test       al,al
>0045CFBC    je         0045CFCC
 0045CFBE    mov        ecx,dword ptr [ebp+8]
 0045CFC1    mov        edx,esi
 0045CFC3    mov        eax,ebx
 0045CFC5    call       SetStrProp
>0045CFCA    jmp        0045CFFD
 0045CFCC    mov        eax,dword ptr [edi]
 0045CFCE    mov        edx,esi
 0045CFD0    call       0045D540
 0045CFD5    test       al,al
>0045CFD7    je         0045CFEE
 0045CFD9    mov        eax,dword ptr [ebp+8]
 0045CFDC    call       StrToInt
 0045CFE1    mov        ecx,eax
 0045CFE3    mov        edx,esi
 0045CFE5    mov        eax,ebx
 0045CFE7    call       SetOrdProp
>0045CFEC    jmp        0045CFFD
 0045CFEE    mov        eax,dword ptr [ebp+8]
 0045CFF1    push       eax
 0045CFF2    mov        ecx,esi
 0045CFF4    mov        edx,ebx
 0045CFF6    mov        eax,edi
 0045CFF8    call       0045D580
 0045CFFD    xor        eax,eax
 0045CFFF    pop        edx
 0045D000    pop        ecx
 0045D001    pop        ecx
 0045D002    mov        dword ptr fs:[eax],edx
 0045D005    push       45D022
 0045D00A    lea        eax,[ebp-4]
 0045D00D    call       @LStrClr
 0045D012    lea        eax,[ebp+8]
 0045D015    call       @LStrClr
 0045D01A    ret
<0045D01B    jmp        @HandleFinally
<0045D020    jmp        0045D00A
 0045D022    pop        edi
 0045D023    pop        esi
 0045D024    pop        ebx
 0045D025    pop        ecx
 0045D026    pop        ebp
 0045D027    ret        4
*}
//end;

//0045D02C
//procedure sub_0045D02C(?:TLanguage; ?:TApplication; ?:?; ?:?);
//begin
{*
 0045D02C    push       ebp
 0045D02D    mov        ebp,esp
 0045D02F    push       ecx
 0045D030    push       ebx
 0045D031    push       esi
 0045D032    mov        dword ptr [ebp-4],ecx
 0045D035    mov        esi,edx
 0045D037    mov        eax,dword ptr [ebp-4]
 0045D03A    call       @LStrAddRef
 0045D03F    xor        eax,eax
 0045D041    push       ebp
 0045D042    push       45D084
 0045D047    push       dword ptr fs:[eax]
 0045D04A    mov        dword ptr fs:[eax],esp
 0045D04D    mov        eax,dword ptr [esi]
 0045D04F    call       TObject.ClassInfo
 0045D054    mov        edx,dword ptr [ebp-4]
 0045D057    call       GetPropInfo
 0045D05C    mov        ebx,eax
 0045D05E    test       ebx,ebx
>0045D060    je         0045D06E
 0045D062    mov        ecx,dword ptr [ebp+8]
 0045D065    mov        edx,ebx
 0045D067    mov        eax,esi
 0045D069    call       GetStrProp
 0045D06E    xor        eax,eax
 0045D070    pop        edx
 0045D071    pop        ecx
 0045D072    pop        ecx
 0045D073    mov        dword ptr fs:[eax],edx
 0045D076    push       45D08B
 0045D07B    lea        eax,[ebp-4]
 0045D07E    call       @LStrClr
 0045D083    ret
<0045D084    jmp        @HandleFinally
<0045D089    jmp        0045D07B
 0045D08B    pop        esi
 0045D08C    pop        ebx
 0045D08D    pop        ecx
 0045D08E    pop        ebp
 0045D08F    ret        4
*}
//end;

//0045D094
//procedure sub_0045D094(?:TLanguage; ?:AnsiString; ?:?);
//begin
{*
 0045D094    push       ebp
 0045D095    mov        ebp,esp
 0045D097    push       0
 0045D099    push       0
 0045D09B    push       0
 0045D09D    push       0
 0045D09F    push       0
 0045D0A1    push       0
 0045D0A3    push       ebx
 0045D0A4    push       esi
 0045D0A5    mov        dword ptr [ebp-8],ecx
 0045D0A8    mov        dword ptr [ebp-4],edx
 0045D0AB    mov        ebx,eax
 0045D0AD    mov        eax,dword ptr [ebp-4]
 0045D0B0    call       @LStrAddRef
 0045D0B5    mov        eax,dword ptr [ebp-8]
 0045D0B8    call       @LStrAddRef
 0045D0BD    xor        eax,eax
 0045D0BF    push       ebp
 0045D0C0    push       45D189
 0045D0C5    push       dword ptr fs:[eax]
 0045D0C8    mov        dword ptr fs:[eax],esp
 0045D0CB    lea        edx,[ebp-0C]
 0045D0CE    mov        eax,dword ptr [ebp-4]
 0045D0D1    call       Trim
 0045D0D6    mov        edx,dword ptr [ebp-0C]
 0045D0D9    lea        eax,[ebp-4]
 0045D0DC    call       @LStrLAsg
 0045D0E1    mov        esi,dword ptr ds:[46C05C]; ^Application:TApplication
 0045D0E7    mov        esi,dword ptr [esi]
 0045D0E9    cmp        dword ptr [ebp-4],0
>0045D0ED    je         0045D16E
>0045D0EF    jmp        0045D10C
 0045D0F1    lea        ecx,[ebp-10]
 0045D0F4    lea        edx,[ebp-4]
 0045D0F7    mov        eax,ebx
 0045D0F9    call       0045CD80
 0045D0FE    mov        ecx,dword ptr [ebp-10]
 0045D101    mov        edx,esi
 0045D103    mov        eax,ebx
 0045D105    call       0045CEB0
 0045D10A    mov        esi,eax
 0045D10C    mov        edx,dword ptr [ebp-4]
 0045D10F    mov        eax,ebx
 0045D111    call       0045CE50
 0045D116    test       al,al
<0045D118    je         0045D0F1
 0045D11A    test       esi,esi
>0045D11C    je         0045D16E
 0045D11E    cmp        dword ptr [ebp-8],0
>0045D122    je         0045D16E
 0045D124    cmp        word ptr [ebx+42],0; TLanguage.?f42:word
>0045D129    je         0045D151
 0045D12B    mov        eax,dword ptr [ebp-4]
 0045D12E    push       eax
 0045D12F    lea        eax,[ebp-14]
 0045D132    push       eax
 0045D133    mov        ecx,dword ptr [ebp-4]
 0045D136    mov        edx,esi
 0045D138    mov        eax,ebx
 0045D13A    call       0045D02C
 0045D13F    mov        eax,dword ptr [ebp-14]
 0045D142    push       eax
 0045D143    lea        eax,[ebp-8]
 0045D146    push       eax
 0045D147    mov        ecx,esi
 0045D149    mov        edx,ebx
 0045D14B    mov        eax,dword ptr [ebx+44]; TLanguage.?f44:dword
 0045D14E    call       dword ptr [ebx+40]; TLanguage.OnTranslate
 0045D151    mov        eax,dword ptr [ebp-8]
 0045D154    push       eax
 0045D155    lea        ecx,[ebp-18]
 0045D158    lea        edx,[ebp-4]
 0045D15B    mov        eax,ebx
 0045D15D    call       0045CD80
 0045D162    mov        ecx,dword ptr [ebp-18]
 0045D165    mov        edx,esi
 0045D167    mov        eax,ebx
 0045D169    call       0045CF6C
 0045D16E    xor        eax,eax
 0045D170    pop        edx
 0045D171    pop        ecx
 0045D172    pop        ecx
 0045D173    mov        dword ptr fs:[eax],edx
 0045D176    push       45D190
 0045D17B    lea        eax,[ebp-18]
 0045D17E    mov        edx,6
 0045D183    call       @LStrArrayClr
 0045D188    ret
<0045D189    jmp        @HandleFinally
<0045D18E    jmp        0045D17B
 0045D190    pop        esi
 0045D191    pop        ebx
 0045D192    mov        esp,ebp
 0045D194    pop        ebp
 0045D195    ret
*}
//end;

//0045D198
//procedure sub_0045D198(?:TLanguage);
//begin
{*
 0045D198    push       ebp
 0045D199    mov        ebp,esp
 0045D19B    mov        ecx,4
 0045D1A0    push       0
 0045D1A2    push       0
 0045D1A4    dec        ecx
<0045D1A5    jne        0045D1A0
 0045D1A7    push       ecx
 0045D1A8    push       ebx
 0045D1A9    push       esi
 0045D1AA    push       edi
 0045D1AB    mov        dword ptr [ebp-4],eax
 0045D1AE    xor        eax,eax
 0045D1B0    push       ebp
 0045D1B1    push       45D313
 0045D1B6    push       dword ptr fs:[eax]
 0045D1B9    mov        dword ptr fs:[eax],esp
 0045D1BC    mov        eax,dword ptr [ebp-4]
 0045D1BF    cmp        word ptr [eax+32],0; TLanguage.?f32:word
>0045D1C4    je         0045D1D2
 0045D1C6    mov        ebx,dword ptr [ebp-4]
 0045D1C9    mov        edx,dword ptr [ebp-4]
 0045D1CC    mov        eax,dword ptr [ebx+34]; TLanguage.?f34:dword
 0045D1CF    call       dword ptr [ebx+30]; TLanguage.OnBeforeTranslation
 0045D1D2    mov        eax,dword ptr [ebp-4]
 0045D1D5    mov        ecx,dword ptr [eax+24]; TLanguage.?f24:String
 0045D1D8    mov        dl,1
 0045D1DA    mov        eax,[0044DA94]; TIniFile
 0045D1DF    call       TCustomIniFile.Create; TIniFile.Create
 0045D1E4    mov        dword ptr [ebp-8],eax
 0045D1E7    xor        eax,eax
 0045D1E9    push       ebp
 0045D1EA    push       45D2DB
 0045D1EF    push       dword ptr fs:[eax]
 0045D1F2    mov        dword ptr fs:[eax],esp
 0045D1F5    mov        eax,dword ptr [ebp-4]
 0045D1F8    mov        eax,dword ptr [eax+28]; TLanguage.?f28:TStringList
 0045D1FB    mov        edx,dword ptr [eax]
 0045D1FD    call       dword ptr [edx+40]; TStringList.Clear
 0045D200    mov        eax,dword ptr [ebp-4]
 0045D203    mov        ecx,dword ptr [eax+28]; TLanguage.?f28:TStringList
 0045D206    mov        edx,45D32C; 'Translations'
 0045D20B    mov        eax,dword ptr [ebp-8]
 0045D20E    mov        ebx,dword ptr [eax]
 0045D210    call       dword ptr [ebx+40]; TIniFile.ReadSectionValues
 0045D213    mov        eax,dword ptr [ebp-4]
 0045D216    mov        eax,dword ptr [eax+28]; TLanguage.?f28:TStringList
 0045D219    mov        edx,dword ptr [eax]
 0045D21B    call       dword ptr [edx+14]; TStringList.GetCount
 0045D21E    dec        eax
 0045D21F    test       eax,eax
>0045D221    jl         0045D2C5
 0045D227    inc        eax
 0045D228    mov        dword ptr [ebp-0C],eax
 0045D22B    xor        ebx,ebx
 0045D22D    lea        ecx,[ebp-10]
 0045D230    mov        eax,dword ptr [ebp-4]
 0045D233    mov        eax,dword ptr [eax+28]; TLanguage.?f28:TStringList
 0045D236    mov        edx,ebx
 0045D238    mov        esi,dword ptr [eax]
 0045D23A    call       dword ptr [esi+0C]; TStringList.Get
 0045D23D    mov        edx,dword ptr [ebp-10]
 0045D240    mov        eax,45D344; '='
 0045D245    call       @LStrPos
 0045D24A    mov        esi,eax
 0045D24C    lea        eax,[ebp-14]
 0045D24F    push       eax
 0045D250    lea        ecx,[ebp-18]
 0045D253    mov        eax,dword ptr [ebp-4]
 0045D256    mov        eax,dword ptr [eax+28]; TLanguage.?f28:TStringList
 0045D259    mov        edx,ebx
 0045D25B    mov        edi,dword ptr [eax]
 0045D25D    call       dword ptr [edi+0C]; TStringList.Get
 0045D260    mov        eax,dword ptr [ebp-18]
 0045D263    call       @LStrLen
 0045D268    sub        eax,esi
 0045D26A    push       eax
 0045D26B    lea        ecx,[ebp-1C]
 0045D26E    mov        eax,dword ptr [ebp-4]
 0045D271    mov        eax,dword ptr [eax+28]; TLanguage.?f28:TStringList
 0045D274    mov        edx,ebx
 0045D276    mov        edi,dword ptr [eax]
 0045D278    call       dword ptr [edi+0C]; TStringList.Get
 0045D27B    mov        eax,dword ptr [ebp-1C]
 0045D27E    lea        edx,[esi+1]
 0045D281    pop        ecx
 0045D282    call       @LStrCopy
 0045D287    mov        eax,dword ptr [ebp-14]
 0045D28A    push       eax
 0045D28B    lea        eax,[ebp-20]
 0045D28E    push       eax
 0045D28F    lea        ecx,[ebp-24]
 0045D292    mov        eax,dword ptr [ebp-4]
 0045D295    mov        eax,dword ptr [eax+28]; TLanguage.?f28:TStringList
 0045D298    mov        edx,ebx
 0045D29A    mov        edi,dword ptr [eax]
 0045D29C    call       dword ptr [edi+0C]; TStringList.Get
 0045D29F    mov        eax,dword ptr [ebp-24]
 0045D2A2    mov        ecx,esi
 0045D2A4    dec        ecx
 0045D2A5    mov        edx,1
 0045D2AA    call       @LStrCopy
 0045D2AF    mov        edx,dword ptr [ebp-20]
 0045D2B2    mov        eax,dword ptr [ebp-4]
 0045D2B5    pop        ecx
 0045D2B6    call       0045D094
 0045D2BB    inc        ebx
 0045D2BC    dec        dword ptr [ebp-0C]
<0045D2BF    jne        0045D22D
 0045D2C5    xor        eax,eax
 0045D2C7    pop        edx
 0045D2C8    pop        ecx
 0045D2C9    pop        ecx
 0045D2CA    mov        dword ptr fs:[eax],edx
 0045D2CD    push       45D2E2
 0045D2D2    mov        eax,dword ptr [ebp-8]
 0045D2D5    call       TObject.Free
 0045D2DA    ret
<0045D2DB    jmp        @HandleFinally
<0045D2E0    jmp        0045D2D2
 0045D2E2    mov        eax,dword ptr [ebp-4]
 0045D2E5    cmp        word ptr [eax+3A],0; TLanguage.?f3A:word
>0045D2EA    je         0045D2F8
 0045D2EC    mov        ebx,dword ptr [ebp-4]
 0045D2EF    mov        edx,dword ptr [ebp-4]
 0045D2F2    mov        eax,dword ptr [ebx+3C]; TLanguage.?f3C:dword
 0045D2F5    call       dword ptr [ebx+38]; TLanguage.OnAfterTranslation
 0045D2F8    xor        eax,eax
 0045D2FA    pop        edx
 0045D2FB    pop        ecx
 0045D2FC    pop        ecx
 0045D2FD    mov        dword ptr fs:[eax],edx
 0045D300    push       45D31A
 0045D305    lea        eax,[ebp-24]
 0045D308    mov        edx,6
 0045D30D    call       @LStrArrayClr
 0045D312    ret
<0045D313    jmp        @HandleFinally
<0045D318    jmp        0045D305
 0045D31A    pop        edi
 0045D31B    pop        esi
 0045D31C    pop        ebx
 0045D31D    mov        esp,ebp
 0045D31F    pop        ebp
 0045D320    ret
*}
//end;

//0045D348
procedure TLanguage.SetProperties(Self:TLanguage);
begin
{*
 0045D348    push       ebp
 0045D349    mov        ebp,esp
 0045D34B    push       esi
 0045D34C    mov        esi,eax
 0045D34E    mov        eax,dword ptr [esi+28]; TLanguage.?f28:TStringList
 0045D351    mov        ecx,dword ptr [eax]
 0045D353    call       dword ptr [ecx+8]; TStrings.Assign
 0045D356    pop        esi
 0045D357    pop        ebp
 0045D358    ret
*}
end;

//0045D35C
function TLanguage.GetProperties(Self:TLanguage):TStringList;
begin
{*
 0045D35C    mov        eax,dword ptr [eax+28]; TLanguage.?f28:TStringList
 0045D35F    ret
*}
end;

//0045D360
//procedure sub_0045D360(?:AnsiString; ?:AnsiString; ?:AnsiString; ?:?);
//begin
{*
 0045D360    push       ebp
 0045D361    mov        ebp,esp
 0045D363    push       0
 0045D365    push       0
 0045D367    push       0
 0045D369    push       ebx
 0045D36A    push       esi
 0045D36B    push       edi
 0045D36C    mov        dword ptr [ebp-4],ecx
 0045D36F    mov        edi,edx
 0045D371    mov        ebx,eax
 0045D373    mov        esi,dword ptr [ebp+8]
 0045D376    xor        eax,eax
 0045D378    push       ebp
 0045D379    push       45D414
 0045D37E    push       dword ptr fs:[eax]
 0045D381    mov        dword ptr fs:[eax],esp
 0045D384    lea        eax,[ebp-8]
 0045D387    mov        edx,ebx
 0045D389    call       @LStrLAsg
 0045D38E    mov        eax,esi
 0045D390    call       @LStrClr
 0045D395    mov        edx,dword ptr [ebp-8]
 0045D398    mov        eax,edi
 0045D39A    call       @LStrPos
 0045D39F    mov        ebx,eax
 0045D3A1    test       ebx,ebx
>0045D3A3    jle        0045D3EB
 0045D3A5    push       dword ptr [esi]
 0045D3A7    lea        eax,[ebp-0C]
 0045D3AA    push       eax
 0045D3AB    mov        ecx,ebx
 0045D3AD    dec        ecx
 0045D3AE    mov        edx,1
 0045D3B3    mov        eax,dword ptr [ebp-8]
 0045D3B6    call       @LStrCopy
 0045D3BB    push       dword ptr [ebp-0C]
 0045D3BE    push       dword ptr [ebp-4]
 0045D3C1    mov        eax,esi
 0045D3C3    mov        edx,3
 0045D3C8    call       @LStrCatN
 0045D3CD    lea        eax,[ebp-8]
 0045D3D0    push       eax
 0045D3D1    mov        eax,edi
 0045D3D3    call       @LStrLen
 0045D3D8    mov        edx,eax
 0045D3DA    add        edx,ebx
 0045D3DC    mov        ecx,7FFFFFFF
 0045D3E1    mov        eax,dword ptr [ebp-8]
 0045D3E4    call       @LStrCopy
>0045D3E9    jmp        0045D3F5
 0045D3EB    mov        eax,esi
 0045D3ED    mov        edx,dword ptr [ebp-8]
 0045D3F0    call       @LStrCat
 0045D3F5    test       ebx,ebx
<0045D3F7    jg         0045D395
 0045D3F9    xor        eax,eax
 0045D3FB    pop        edx
 0045D3FC    pop        ecx
 0045D3FD    pop        ecx
 0045D3FE    mov        dword ptr fs:[eax],edx
 0045D401    push       45D41B
 0045D406    lea        eax,[ebp-0C]
 0045D409    mov        edx,2
 0045D40E    call       @LStrArrayClr
 0045D413    ret
<0045D414    jmp        @HandleFinally
<0045D419    jmp        0045D406
 0045D41B    pop        edi
 0045D41C    pop        esi
 0045D41D    pop        ebx
 0045D41E    mov        esp,ebp
 0045D420    pop        ebp
 0045D421    ret        4
*}
//end;

//0045D424
//procedure sub_0045D424(?:TLanguage; ?:AnsiString; ?:AnsiString);
//begin
{*
 0045D424    push       ebp
 0045D425    mov        ebp,esp
 0045D427    add        esp,0FFFFFFF8
 0045D42A    push       ebx
 0045D42B    push       esi
 0045D42C    push       edi
 0045D42D    xor        ebx,ebx
 0045D42F    mov        dword ptr [ebp-8],ebx
 0045D432    mov        ebx,ecx
 0045D434    mov        dword ptr [ebp-4],edx
 0045D437    mov        esi,eax
 0045D439    mov        eax,dword ptr [ebp-4]
 0045D43C    call       @LStrAddRef
 0045D441    xor        eax,eax
 0045D443    push       ebp
 0045D444    push       45D4B4
 0045D449    push       dword ptr fs:[eax]
 0045D44C    mov        dword ptr fs:[eax],esp
 0045D44F    mov        ecx,dword ptr [esi+24]; TLanguage.?f24:String
 0045D452    mov        dl,1
 0045D454    mov        eax,[0044DA94]; TIniFile
 0045D459    call       TCustomIniFile.Create; TIniFile.Create
 0045D45E    mov        esi,eax
 0045D460    mov        eax,dword ptr [ebp-4]
 0045D463    push       eax
 0045D464    push       ebx
 0045D465    mov        ecx,dword ptr [ebp-4]
 0045D468    mov        edx,45D4CC; 'Messages'
 0045D46D    mov        eax,esi
 0045D46F    mov        edi,dword ptr [eax]
 0045D471    call       dword ptr [edi]; TIniFile.ReadString
 0045D473    lea        eax,[ebp-8]
 0045D476    push       eax
 0045D477    mov        eax,dword ptr [ebx]
 0045D479    mov        ecx,45D4E0; '\r\n'
 0045D47E    mov        edx,45D4EC; '|'
 0045D483    call       0045D360
 0045D488    mov        edx,dword ptr [ebp-8]
 0045D48B    mov        eax,ebx
 0045D48D    call       @LStrAsg
 0045D492    mov        eax,esi
 0045D494    call       TObject.Free
 0045D499    xor        eax,eax
 0045D49B    pop        edx
 0045D49C    pop        ecx
 0045D49D    pop        ecx
 0045D49E    mov        dword ptr fs:[eax],edx
 0045D4A1    push       45D4BB
 0045D4A6    lea        eax,[ebp-8]
 0045D4A9    mov        edx,2
 0045D4AE    call       @LStrArrayClr
 0045D4B3    ret
<0045D4B4    jmp        @HandleFinally
<0045D4B9    jmp        0045D4A6
 0045D4BB    pop        edi
 0045D4BC    pop        esi
 0045D4BD    pop        ebx
 0045D4BE    pop        ecx
 0045D4BF    pop        ecx
 0045D4C0    pop        ebp
 0045D4C1    ret
*}
//end;

//0045D4F0
//function sub_0045D4F0(?:?; ?:PPropInfo):?;
//begin
{*
 0045D4F0    push       esi
 0045D4F1    push       edi
 0045D4F2    add        esp,0FFFFFDE4
 0045D4F8    mov        esi,edx
 0045D4FA    mov        edi,esp
 0045D4FC    mov        ecx,46
 0045D501    rep movs   dword ptr [edi],dword ptr [esi]
 0045D503    movs       word ptr [edi],word ptr [esi]
 0045D505    mov        eax,dword ptr [esp]
 0045D508    mov        eax,dword ptr [eax]
 0045D50A    mov        esi,eax
 0045D50C    lea        edi,[esp+11A]
 0045D513    mov        ecx,40
 0045D518    rep movs   dword ptr [edi],dword ptr [esi]
 0045D51A    movs       byte ptr [edi],byte ptr [esi]
 0045D51B    mov        al,byte ptr [esp+11A]
 0045D522    cmp        al,5
>0045D524    je         0045D52E
 0045D526    cmp        al,0A
>0045D528    je         0045D52E
 0045D52A    cmp        al,0B
>0045D52C    jne        0045D532
 0045D52E    mov        al,1
>0045D530    jmp        0045D534
 0045D532    xor        eax,eax
 0045D534    add        esp,21C
 0045D53A    pop        edi
 0045D53B    pop        esi
 0045D53C    ret
*}
//end;

//0045D540
//function sub_0045D540(?:?; ?:PPropInfo):?;
//begin
{*
 0045D540    push       esi
 0045D541    push       edi
 0045D542    add        esp,0FFFFFDE4
 0045D548    mov        esi,edx
 0045D54A    mov        edi,esp
 0045D54C    mov        ecx,46
 0045D551    rep movs   dword ptr [edi],dword ptr [esi]
 0045D553    movs       word ptr [edi],word ptr [esi]
 0045D555    mov        eax,dword ptr [esp]
 0045D558    mov        eax,dword ptr [eax]
 0045D55A    mov        esi,eax
 0045D55C    lea        edi,[esp+11A]
 0045D563    mov        ecx,40
 0045D568    rep movs   dword ptr [edi],dword ptr [esi]
 0045D56A    movs       byte ptr [edi],byte ptr [esi]
 0045D56B    cmp        byte ptr [esp+11A],1
 0045D573    sete       al
 0045D576    add        esp,21C
 0045D57C    pop        edi
 0045D57D    pop        esi
 0045D57E    ret
*}
//end;

//0045D580
//procedure sub_0045D580(?:?; ?:TApplication; ?:PPropInfo; ?:?);
//begin
{*
 0045D580    push       ebp
 0045D581    mov        ebp,esp
 0045D583    push       0
 0045D585    push       0
 0045D587    push       0
 0045D589    push       0
 0045D58B    push       0
 0045D58D    push       ebx
 0045D58E    push       esi
 0045D58F    push       edi
 0045D590    mov        dword ptr [ebp-4],ecx
 0045D593    mov        edi,edx
 0045D595    mov        ebx,eax
 0045D597    mov        eax,dword ptr [ebp+8]
 0045D59A    call       @LStrAddRef
 0045D59F    xor        eax,eax
 0045D5A1    push       ebp
 0045D5A2    push       45D687
 0045D5A7    push       dword ptr fs:[eax]
 0045D5AA    mov        dword ptr fs:[eax],esp
 0045D5AD    mov        dl,1
 0045D5AF    mov        eax,[0040F078]; TStringList
 0045D5B4    call       TObject.Create; TStringList.Create
 0045D5B9    mov        esi,eax
>0045D5BB    jmp        0045D616
 0045D5BD    lea        eax,[ebp-8]
 0045D5C0    push       eax
 0045D5C1    mov        edx,dword ptr [ebp+8]
 0045D5C4    mov        eax,dword ptr [ebx+2C]
 0045D5C7    call       @LStrPos
 0045D5CC    mov        ecx,eax
 0045D5CE    dec        ecx
 0045D5CF    mov        edx,1
 0045D5D4    mov        eax,dword ptr [ebp+8]
 0045D5D7    call       @LStrCopy
 0045D5DC    mov        edx,dword ptr [ebp+8]
 0045D5DF    mov        eax,dword ptr [ebx+2C]
 0045D5E2    call       @LStrPos
 0045D5E7    dec        eax
 0045D5E8    push       eax
 0045D5E9    mov        eax,dword ptr [ebx+2C]
 0045D5EC    call       @LStrLen
 0045D5F1    pop        ecx
 0045D5F2    add        ecx,eax
 0045D5F4    lea        eax,[ebp+8]
 0045D5F7    mov        edx,1
 0045D5FC    call       @LStrDelete
 0045D601    lea        edx,[ebp-0C]
 0045D604    mov        eax,dword ptr [ebp-8]
 0045D607    call       Trim
 0045D60C    mov        edx,dword ptr [ebp-0C]
 0045D60F    mov        eax,esi
 0045D611    mov        ecx,dword ptr [eax]
 0045D613    call       dword ptr [ecx+34]; TStringList.Add
 0045D616    mov        edx,dword ptr [ebp+8]
 0045D619    mov        eax,dword ptr [ebx+2C]
 0045D61C    call       @LStrPos
 0045D621    test       eax,eax
<0045D623    jg         0045D5BD
 0045D625    lea        edx,[ebp-10]
 0045D628    mov        eax,dword ptr [ebp+8]
 0045D62B    call       Trim
 0045D630    mov        eax,dword ptr [ebp-10]
 0045D633    call       @LStrLen
 0045D638    test       eax,eax
>0045D63A    jle        0045D651
 0045D63C    lea        edx,[ebp-14]
 0045D63F    mov        eax,dword ptr [ebp+8]
 0045D642    call       Trim
 0045D647    mov        edx,dword ptr [ebp-14]
 0045D64A    mov        eax,esi
 0045D64C    mov        ecx,dword ptr [eax]
 0045D64E    call       dword ptr [ecx+34]; TStringList.Add
 0045D651    mov        ecx,esi
 0045D653    mov        edx,dword ptr [ebp-4]
 0045D656    mov        eax,edi
 0045D658    call       SetOrdProp
 0045D65D    mov        eax,esi
 0045D65F    call       TObject.Free
 0045D664    xor        eax,eax
 0045D666    pop        edx
 0045D667    pop        ecx
 0045D668    pop        ecx
 0045D669    mov        dword ptr fs:[eax],edx
 0045D66C    push       45D68E
 0045D671    lea        eax,[ebp-14]
 0045D674    mov        edx,4
 0045D679    call       @LStrArrayClr
 0045D67E    lea        eax,[ebp+8]
 0045D681    call       @LStrClr
 0045D686    ret
<0045D687    jmp        @HandleFinally
<0045D68C    jmp        0045D671
 0045D68E    pop        edi
 0045D68F    pop        esi
 0045D690    pop        ebx
 0045D691    mov        esp,ebp
 0045D693    pop        ebp
 0045D694    ret        4
*}
//end;

//0045D698
//procedure TLanguage.SetSeparator(Self:TLanguage; ?:?);
//begin
{*
 0045D698    push       ebp
 0045D699    mov        ebp,esp
 0045D69B    add        esp,0FFFFFFF8
 0045D69E    push       ebx
 0045D69F    xor        ecx,ecx
 0045D6A1    mov        dword ptr [ebp-8],ecx
 0045D6A4    mov        dword ptr [ebp-4],edx
 0045D6A7    mov        ebx,eax
 0045D6A9    mov        eax,dword ptr [ebp-4]
 0045D6AC    call       @LStrAddRef
 0045D6B1    xor        eax,eax
 0045D6B3    push       ebp
 0045D6B4    push       45D70B
 0045D6B9    push       dword ptr fs:[eax]
 0045D6BC    mov        dword ptr fs:[eax],esp
 0045D6BF    lea        edx,[ebp-8]
 0045D6C2    mov        eax,dword ptr [ebp-4]
 0045D6C5    call       Trim
 0045D6CA    mov        eax,dword ptr [ebp-8]
 0045D6CD    call       @LStrLen
 0045D6D2    test       eax,eax
>0045D6D4    jne        0045D6E5
 0045D6D6    lea        eax,[ebx+2C]; TLanguage.?f2C:String
 0045D6D9    mov        edx,45D720; ','
 0045D6DE    call       @LStrAsg
>0045D6E3    jmp        0045D6F0
 0045D6E5    lea        eax,[ebx+2C]; TLanguage.?f2C:String
 0045D6E8    mov        edx,dword ptr [ebp-4]
 0045D6EB    call       @LStrAsg
 0045D6F0    xor        eax,eax
 0045D6F2    pop        edx
 0045D6F3    pop        ecx
 0045D6F4    pop        ecx
 0045D6F5    mov        dword ptr fs:[eax],edx
 0045D6F8    push       45D712
 0045D6FD    lea        eax,[ebp-8]
 0045D700    mov        edx,2
 0045D705    call       @LStrArrayClr
 0045D70A    ret
<0045D70B    jmp        @HandleFinally
<0045D710    jmp        0045D6FD
 0045D712    pop        ebx
 0045D713    pop        ecx
 0045D714    pop        ecx
 0045D715    pop        ebp
 0045D716    ret
*}
//end;

end.