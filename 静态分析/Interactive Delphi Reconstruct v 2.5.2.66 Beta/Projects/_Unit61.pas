{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit61;

interface

uses
  Classes, Windows, Graphics;


implementation

//0045662C
//procedure sub_0045662C(?:TComponent; ?:AnsiString);
//begin
{*
 0045662C    push       ebp
 0045662D    mov        ebp,esp
 0045662F    add        esp,0FFFFFEE8
 00456635    push       ebx
 00456636    push       esi
 00456637    push       edi
 00456638    xor        ecx,ecx
 0045663A    mov        dword ptr [ebp-108],ecx
 00456640    mov        dword ptr [ebp-104],ecx
 00456646    mov        esi,edx
 00456648    mov        ebx,eax
 0045664A    xor        eax,eax
 0045664C    push       ebp
 0045664D    push       456796
 00456652    push       dword ptr fs:[eax]
 00456655    mov        dword ptr fs:[eax],esp
 00456658    test       ebx,ebx
>0045665A    je         00456771
 00456660    mov        eax,ebx
 00456662    mov        edx,dword ptr ds:[43EC04]; TCustomForm
 00456668    call       @IsClass
 0045666D    test       al,al
>0045666F    je         00456690
 00456671    lea        edx,[ebp-100]
 00456677    mov        eax,dword ptr [ebx]
 00456679    call       TObject.ClassName
 0045667E    lea        edx,[ebp-100]
 00456684    mov        eax,esi
 00456686    call       @LStrFromString
>0045668B    jmp        00456778
 00456690    mov        eax,esi
 00456692    mov        edx,dword ptr [ebx+8]; TComponent.?f8:TComponentName
 00456695    call       @LStrAsg
 0045669A    mov        eax,ebx
 0045669C    mov        edx,dword ptr ds:[42704C]; TControl
 004566A2    call       @IsClass
 004566A7    test       al,al
>004566A9    je         00456703
 004566AB    mov        eax,ebx
 004566AD    call       GetParentForm
 004566B2    mov        edi,eax
 004566B4    test       edi,edi
>004566B6    je         004566EA
 004566B8    lea        edx,[ebp-100]
 004566BE    mov        eax,dword ptr [edi]
 004566C0    call       TObject.ClassName
 004566C5    lea        edx,[ebp-100]
 004566CB    lea        eax,[ebp-104]
 004566D1    call       @LStrFromString
 004566D6    mov        edx,dword ptr [ebp-104]
 004566DC    mov        ecx,dword ptr [esi]
 004566DE    mov        eax,esi
 004566E0    call       @LStrCat3
>004566E5    jmp        00456778
 004566EA    mov        edi,dword ptr [ebx+24]
 004566ED    test       edi,edi
>004566EF    je         00456778
 004566F5    mov        ecx,dword ptr [esi]
 004566F7    mov        edx,dword ptr [edi+8]
 004566FA    mov        eax,esi
 004566FC    call       @LStrCat3
>00456701    jmp        00456778
 00456703    mov        ebx,dword ptr [ebx+4]; TComponent.FOwner:TComponent
 00456706    mov        eax,ebx
 00456708    mov        edx,dword ptr ds:[43EEE8]; TForm
 0045670E    call       @IsClass
 00456713    test       al,al
>00456715    je         00456778
 00456717    lea        eax,[ebp-108]
 0045671D    push       eax
 0045671E    lea        edx,[ebp-100]
 00456724    mov        eax,dword ptr [ebx]
 00456726    call       TObject.ClassName
 0045672B    lea        eax,[ebp-100]
 00456731    mov        dword ptr [ebp-118],eax
 00456737    mov        byte ptr [ebp-114],4
 0045673E    mov        eax,dword ptr [esi]
 00456740    mov        dword ptr [ebp-110],eax
 00456746    mov        byte ptr [ebp-10C],0B
 0045674D    lea        edx,[ebp-118]
 00456753    mov        ecx,1
 00456758    mov        eax,4567AC; '%s.%s'
 0045675D    call       Format
 00456762    mov        edx,dword ptr [ebp-108]
 00456768    mov        eax,esi
 0045676A    call       @LStrAsg
>0045676F    jmp        00456778
 00456771    mov        eax,esi
 00456773    call       @LStrClr
 00456778    xor        eax,eax
 0045677A    pop        edx
 0045677B    pop        ecx
 0045677C    pop        ecx
 0045677D    mov        dword ptr fs:[eax],edx
 00456780    push       45679D
 00456785    lea        eax,[ebp-108]
 0045678B    mov        edx,2
 00456790    call       @LStrArrayClr
 00456795    ret
<00456796    jmp        @HandleFinally
<0045679B    jmp        00456785
 0045679D    pop        edi
 0045679E    pop        esi
 0045679F    pop        ebx
 004567A0    mov        esp,ebp
 004567A2    pop        ebp
 004567A3    ret
*}
//end;

//004567B4
//procedure sub_004567B4(?:AnsiString);
//begin
{*
 004567B4    push       ebp
 004567B5    mov        ebp,esp
 004567B7    push       0
 004567B9    push       0
 004567BB    push       ebx
 004567BC    mov        ebx,eax
 004567BE    xor        eax,eax
 004567C0    push       ebp
 004567C1    push       456810
 004567C6    push       dword ptr fs:[eax]
 004567C9    mov        dword ptr fs:[eax],esp
 004567CC    lea        edx,[ebp-8]
 004567CF    mov        eax,[0046C05C]; ^Application:TApplication
 004567D4    mov        eax,dword ptr [eax]
 004567D6    call       TApplication.GetExeName
 004567DB    mov        eax,dword ptr [ebp-8]
 004567DE    lea        ecx,[ebp-4]
 004567E1    mov        edx,456824; '.INI'
 004567E6    call       ChangeFileExt
 004567EB    mov        eax,dword ptr [ebp-4]
 004567EE    mov        edx,ebx
 004567F0    call       ExtractFileName
 004567F5    xor        eax,eax
 004567F7    pop        edx
 004567F8    pop        ecx
 004567F9    pop        ecx
 004567FA    mov        dword ptr fs:[eax],edx
 004567FD    push       456817
 00456802    lea        eax,[ebp-8]
 00456805    mov        edx,2
 0045680A    call       @LStrArrayClr
 0045680F    ret
<00456810    jmp        @HandleFinally
<00456815    jmp        00456802
 00456817    pop        ebx
 00456818    pop        ecx
 00456819    pop        ecx
 0045681A    pop        ebp
 0045681B    ret
*}
//end;

//0045682C
//procedure sub_0045682C(?:AnsiString);
//begin
{*
 0045682C    push       ebp
 0045682D    mov        ebp,esp
 0045682F    push       0
 00456831    push       0
 00456833    push       0
 00456835    push       ebx
 00456836    mov        ebx,eax
 00456838    xor        eax,eax
 0045683A    push       ebp
 0045683B    push       4568E5
 00456840    push       dword ptr fs:[eax]
 00456843    mov        dword ptr fs:[eax],esp
 00456846    cmp        byte ptr ds:[46ABEC],0
>0045684D    je         00456874
 0045684F    lea        edx,[ebp-4]
 00456852    mov        eax,[0046C05C]; ^Application:TApplication
 00456857    mov        eax,dword ptr [eax]
 00456859    call       TApplication.GetTitle
 0045685E    cmp        dword ptr [ebp-4],0
>00456862    je         00456874
 00456864    mov        edx,ebx
 00456866    mov        eax,[0046C05C]; ^Application:TApplication
 0045686B    mov        eax,dword ptr [eax]
 0045686D    call       TApplication.GetTitle
>00456872    jmp        0045689A
 00456874    lea        edx,[ebp-0C]
 00456877    mov        eax,[0046C05C]; ^Application:TApplication
 0045687C    mov        eax,dword ptr [eax]
 0045687E    call       TApplication.GetExeName
 00456883    mov        eax,dword ptr [ebp-0C]
 00456886    lea        ecx,[ebp-8]
 00456889    xor        edx,edx
 0045688B    call       ChangeFileExt
 00456890    mov        eax,dword ptr [ebp-8]
 00456893    mov        edx,ebx
 00456895    call       ExtractFileName
 0045689A    cmp        dword ptr ds:[46ABE8],0; gvar_0046ABE8:AnsiString
>004568A1    je         004568BC
 004568A3    push       dword ptr ds:[46ABE8]; gvar_0046ABE8:AnsiString
 004568A9    push       4568FC; '\\'
 004568AE    push       dword ptr [ebx]
 004568B0    mov        eax,ebx
 004568B2    mov        edx,3
 004568B7    call       @LStrCatN
 004568BC    mov        ecx,dword ptr [ebx]
 004568BE    mov        eax,ebx
 004568C0    mov        edx,456908; 'Software\\'
 004568C5    call       @LStrCat3
 004568CA    xor        eax,eax
 004568CC    pop        edx
 004568CD    pop        ecx
 004568CE    pop        ecx
 004568CF    mov        dword ptr fs:[eax],edx
 004568D2    push       4568EC
 004568D7    lea        eax,[ebp-0C]
 004568DA    mov        edx,3
 004568DF    call       @LStrArrayClr
 004568E4    ret
<004568E5    jmp        @HandleFinally
<004568EA    jmp        004568D7
 004568EC    pop        ebx
 004568ED    mov        esp,ebp
 004568EF    pop        ebp
 004568F0    ret
*}
//end;

//00456914
//function sub_00456914(?:dword; ?:AnsiString; ?:AnsiString; ?:?; ?:?):AnsiString;
//begin
{*
 00456914    push       ebp
 00456915    mov        ebp,esp
 00456917    add        esp,0FFFFFFF8
 0045691A    push       ebx
 0045691B    push       esi
 0045691C    mov        dword ptr [ebp-8],ecx
 0045691F    mov        dword ptr [ebp-4],edx
 00456922    mov        ebx,eax
 00456924    mov        esi,dword ptr [ebp+0C]
 00456927    mov        eax,ebx
 00456929    mov        edx,dword ptr ds:[44E70C]; TRegIniFile
 0045692F    call       @IsClass
 00456934    test       al,al
>00456936    je         0045694C
 00456938    push       esi
 00456939    mov        eax,dword ptr [ebp+8]
 0045693C    push       eax
 0045693D    mov        ecx,dword ptr [ebp-8]
 00456940    mov        edx,dword ptr [ebp-4]
 00456943    mov        eax,ebx
 00456945    call       TRegIniFile.ReadString
>0045694A    jmp        0045697A
 0045694C    mov        eax,ebx
 0045694E    mov        edx,dword ptr ds:[44DA94]; TIniFile
 00456954    call       @IsClass
 00456959    test       al,al
>0045695B    je         00456970
 0045695D    push       esi
 0045695E    mov        eax,dword ptr [ebp+8]
 00456961    push       eax
 00456962    mov        ecx,dword ptr [ebp-8]
 00456965    mov        edx,dword ptr [ebp-4]
 00456968    mov        eax,ebx
 0045696A    mov        ebx,dword ptr [eax]
 0045696C    call       dword ptr [ebx]
>0045696E    jmp        0045697A
 00456970    mov        eax,dword ptr [ebp+8]
 00456973    mov        edx,esi
 00456975    call       @LStrAsg
 0045697A    pop        esi
 0045697B    pop        ebx
 0045697C    pop        ecx
 0045697D    pop        ecx
 0045697E    pop        ebp
 0045697F    ret        8
*}
//end;

//00456984
//procedure sub_00456984(?:dword; ?:?; ?:AnsiString; ?:?);
//begin
{*
 00456984    push       ebp
 00456985    mov        ebp,esp
 00456987    add        esp,0FFFFFFF8
 0045698A    push       ebx
 0045698B    push       esi
 0045698C    push       edi
 0045698D    xor        ebx,ebx
 0045698F    mov        dword ptr [ebp-8],ebx
 00456992    mov        dword ptr [ebp-4],ecx
 00456995    mov        edi,edx
 00456997    mov        ebx,eax
 00456999    mov        esi,dword ptr [ebp+8]
 0045699C    xor        eax,eax
 0045699E    push       ebp
 0045699F    push       456A5F
 004569A4    push       dword ptr fs:[eax]
 004569A7    mov        dword ptr fs:[eax],esp
 004569AA    mov        eax,ebx
 004569AC    mov        edx,dword ptr ds:[44E70C]; TRegIniFile
 004569B2    call       @IsClass
 004569B7    test       al,al
>004569B9    je         004569CA
 004569BB    push       esi
 004569BC    mov        ecx,dword ptr [ebp-4]
 004569BF    mov        edx,edi
 004569C1    mov        eax,ebx
 004569C3    call       TRegIniFile.WriteString
>004569C8    jmp        00456A49
 004569CA    lea        eax,[ebp-8]
 004569CD    mov        edx,esi
 004569CF    call       @LStrLAsg
 004569D4    cmp        dword ptr [ebp-8],0
>004569D8    je         00456A28
 004569DA    mov        eax,dword ptr [ebp-8]
 004569DD    cmp        byte ptr [eax],22
>004569E0    jne        004569F4
 004569E2    mov        eax,dword ptr [ebp-8]
 004569E5    call       @LStrLen
 004569EA    mov        edx,dword ptr [ebp-8]
 004569ED    cmp        byte ptr [edx+eax-1],22
>004569F2    je         00456A0E
 004569F4    mov        eax,dword ptr [ebp-8]
 004569F7    cmp        byte ptr [eax],27
>004569FA    jne        00456A28
 004569FC    mov        eax,dword ptr [ebp-8]
 004569FF    call       @LStrLen
 00456A04    mov        edx,dword ptr [ebp-8]
 00456A07    cmp        byte ptr [edx+eax-1],27
>00456A0C    jne        00456A28
 00456A0E    push       456A78; '\"'
 00456A13    push       dword ptr [ebp-8]
 00456A16    push       456A78; '\"'
 00456A1B    lea        eax,[ebp-8]
 00456A1E    mov        edx,3
 00456A23    call       @LStrCatN
 00456A28    mov        eax,ebx
 00456A2A    mov        edx,dword ptr ds:[44DA94]; TIniFile
 00456A30    call       @IsClass
 00456A35    test       al,al
>00456A37    je         00456A49
 00456A39    mov        eax,dword ptr [ebp-8]
 00456A3C    push       eax
 00456A3D    mov        ecx,dword ptr [ebp-4]
 00456A40    mov        edx,edi
 00456A42    mov        eax,ebx
 00456A44    mov        ebx,dword ptr [eax]
 00456A46    call       dword ptr [ebx+4]
 00456A49    xor        eax,eax
 00456A4B    pop        edx
 00456A4C    pop        ecx
 00456A4D    pop        ecx
 00456A4E    mov        dword ptr fs:[eax],edx
 00456A51    push       456A66
 00456A56    lea        eax,[ebp-8]
 00456A59    call       @LStrClr
 00456A5E    ret
<00456A5F    jmp        @HandleFinally
<00456A64    jmp        00456A56
 00456A66    pop        edi
 00456A67    pop        esi
 00456A68    pop        ebx
 00456A69    pop        ecx
 00456A6A    pop        ecx
 00456A6B    pop        ebp
 00456A6C    ret        4
*}
//end;

//00456A7C
//function sub_00456A7C(?:?; ?:?; ?:AnsiString; ?:?):Longint;
//begin
{*
 00456A7C    push       ebp
 00456A7D    mov        ebp,esp
 00456A7F    push       ecx
 00456A80    push       ebx
 00456A81    push       esi
 00456A82    push       edi
 00456A83    mov        dword ptr [ebp-4],ecx
 00456A86    mov        edi,edx
 00456A88    mov        ebx,eax
 00456A8A    mov        esi,dword ptr [ebp+8]
 00456A8D    mov        eax,ebx
 00456A8F    mov        edx,dword ptr ds:[44E70C]; TRegIniFile
 00456A95    call       @IsClass
 00456A9A    test       al,al
>00456A9C    je         00456AAD
 00456A9E    push       esi
 00456A9F    mov        ecx,dword ptr [ebp-4]
 00456AA2    mov        edx,edi
 00456AA4    mov        eax,ebx
 00456AA6    call       TRegIniFile.ReadInteger
>00456AAB    jmp        00456ACF
 00456AAD    mov        eax,ebx
 00456AAF    mov        edx,dword ptr ds:[44DA94]; TIniFile
 00456AB5    call       @IsClass
 00456ABA    test       al,al
>00456ABC    je         00456ACD
 00456ABE    push       esi
 00456ABF    mov        ecx,dword ptr [ebp-4]
 00456AC2    mov        edx,edi
 00456AC4    mov        eax,ebx
 00456AC6    mov        ebx,dword ptr [eax]
 00456AC8    call       dword ptr [ebx+8]
>00456ACB    jmp        00456ACF
 00456ACD    mov        eax,esi
 00456ACF    pop        edi
 00456AD0    pop        esi
 00456AD1    pop        ebx
 00456AD2    pop        ecx
 00456AD3    pop        ebp
 00456AD4    ret        4
*}
//end;

//00456AD8
//procedure sub_00456AD8(?:?; ?:?; ?:AnsiString; ?:?);
//begin
{*
 00456AD8    push       ebp
 00456AD9    mov        ebp,esp
 00456ADB    push       ebx
 00456ADC    push       esi
 00456ADD    push       edi
 00456ADE    mov        edi,ecx
 00456AE0    mov        esi,edx
 00456AE2    mov        ebx,eax
 00456AE4    mov        eax,ebx
 00456AE6    mov        edx,dword ptr ds:[44E70C]; TRegIniFile
 00456AEC    call       @IsClass
 00456AF1    test       al,al
>00456AF3    je         00456B06
 00456AF5    mov        eax,dword ptr [ebp+8]
 00456AF8    push       eax
 00456AF9    mov        ecx,edi
 00456AFB    mov        edx,esi
 00456AFD    mov        eax,ebx
 00456AFF    call       TRegIniFile.WriteInteger
>00456B04    jmp        00456B26
 00456B06    mov        eax,ebx
 00456B08    mov        edx,dword ptr ds:[44DA94]; TIniFile
 00456B0E    call       @IsClass
 00456B13    test       al,al
>00456B15    je         00456B26
 00456B17    mov        eax,dword ptr [ebp+8]
 00456B1A    push       eax
 00456B1B    mov        ecx,edi
 00456B1D    mov        edx,esi
 00456B1F    mov        eax,ebx
 00456B21    mov        ebx,dword ptr [eax]
 00456B23    call       dword ptr [ebx+0C]
 00456B26    pop        edi
 00456B27    pop        esi
 00456B28    pop        ebx
 00456B29    pop        ebp
 00456B2A    ret        4
*}
//end;

//00456B30
//function sub_00456B30(?:AnsiString):Integer;
//begin
{*
 00456B30    push       ebp
 00456B31    mov        ebp,esp
 00456B33    add        esp,0FFFFFFF0
 00456B36    push       ebx
 00456B37    mov        ebx,eax
 00456B39    push       ebx
 00456B3A    push       0
 00456B3C    call       user32.GetSystemMetrics
 00456B41    mov        dword ptr [ebp-10],eax
 00456B44    mov        byte ptr [ebp-0C],0
 00456B48    push       1
 00456B4A    call       user32.GetSystemMetrics
 00456B4F    mov        dword ptr [ebp-8],eax
 00456B52    mov        byte ptr [ebp-4],0
 00456B56    lea        edx,[ebp-10]
 00456B59    mov        ecx,1
 00456B5E    mov        eax,456B78; '(%dx%d)'
 00456B63    call       Format
 00456B68    pop        ebx
 00456B69    mov        esp,ebp
 00456B6B    pop        ebp
 00456B6C    ret
*}
//end;

//00456B80
//procedure sub_00456B80(?:?; ?:?; ?:AnsiString; ?:?);
//begin
{*
 00456B80    push       ebp
 00456B81    mov        ebp,esp
 00456B83    push       0
 00456B85    push       0
 00456B87    push       0
 00456B89    push       ebx
 00456B8A    push       esi
 00456B8B    push       edi
 00456B8C    mov        dword ptr [ebp-4],ecx
 00456B8F    mov        edi,edx
 00456B91    mov        esi,eax
 00456B93    mov        ebx,dword ptr [ebp+8]
 00456B96    xor        eax,eax
 00456B98    push       ebp
 00456B99    push       456BF8
 00456B9E    push       dword ptr fs:[eax]
 00456BA1    mov        dword ptr fs:[eax],esp
 00456BA4    push       0
 00456BA6    push       ebx
 00456BA7    lea        eax,[ebp-0C]
 00456BAA    call       00456B30
 00456BAF    mov        ecx,dword ptr [ebp-0C]
 00456BB2    lea        eax,[ebp-8]
 00456BB5    mov        edx,dword ptr [ebp-4]
 00456BB8    call       @LStrCat3
 00456BBD    mov        ecx,dword ptr [ebp-8]
 00456BC0    mov        edx,edi
 00456BC2    mov        eax,esi
 00456BC4    call       00456914
 00456BC9    cmp        dword ptr [ebx],0
>00456BCC    jne        00456BDD
 00456BCE    push       0
 00456BD0    push       ebx
 00456BD1    mov        ecx,dword ptr [ebp-4]
 00456BD4    mov        edx,edi
 00456BD6    mov        eax,esi
 00456BD8    call       00456914
 00456BDD    xor        eax,eax
 00456BDF    pop        edx
 00456BE0    pop        ecx
 00456BE1    pop        ecx
 00456BE2    mov        dword ptr fs:[eax],edx
 00456BE5    push       456BFF
 00456BEA    lea        eax,[ebp-0C]
 00456BED    mov        edx,2
 00456BF2    call       @LStrArrayClr
 00456BF7    ret
<00456BF8    jmp        @HandleFinally
<00456BFD    jmp        00456BEA
 00456BFF    pop        edi
 00456C00    pop        esi
 00456C01    pop        ebx
 00456C02    mov        esp,ebp
 00456C04    pop        ebp
 00456C05    ret        4
*}
//end;

//00456C08
//procedure sub_00456C08(?:?; ?:?; ?:AnsiString; ?:?);
//begin
{*
 00456C08    push       ebp
 00456C09    mov        ebp,esp
 00456C0B    push       0
 00456C0D    push       0
 00456C0F    push       ebx
 00456C10    push       esi
 00456C11    push       edi
 00456C12    mov        edi,ecx
 00456C14    mov        esi,edx
 00456C16    mov        ebx,eax
 00456C18    xor        eax,eax
 00456C1A    push       ebp
 00456C1B    push       456C75
 00456C20    push       dword ptr fs:[eax]
 00456C23    mov        dword ptr fs:[eax],esp
 00456C26    mov        eax,dword ptr [ebp+8]
 00456C29    push       eax
 00456C2A    lea        eax,[ebp-8]
 00456C2D    call       00456B30
 00456C32    mov        ecx,dword ptr [ebp-8]
 00456C35    lea        eax,[ebp-4]
 00456C38    mov        edx,edi
 00456C3A    call       @LStrCat3
 00456C3F    mov        ecx,dword ptr [ebp-4]
 00456C42    mov        edx,esi
 00456C44    mov        eax,ebx
 00456C46    call       00456984
 00456C4B    mov        eax,dword ptr [ebp+8]
 00456C4E    push       eax
 00456C4F    mov        ecx,edi
 00456C51    mov        edx,esi
 00456C53    mov        eax,ebx
 00456C55    call       00456984
 00456C5A    xor        eax,eax
 00456C5C    pop        edx
 00456C5D    pop        ecx
 00456C5E    pop        ecx
 00456C5F    mov        dword ptr fs:[eax],edx
 00456C62    push       456C7C
 00456C67    lea        eax,[ebp-8]
 00456C6A    mov        edx,2
 00456C6F    call       @LStrArrayClr
 00456C74    ret
<00456C75    jmp        @HandleFinally
<00456C7A    jmp        00456C67
 00456C7C    pop        edi
 00456C7D    pop        esi
 00456C7E    pop        ebx
 00456C7F    pop        ecx
 00456C80    pop        ecx
 00456C81    pop        ebp
 00456C82    ret        4
*}
//end;

//00456C88
//procedure sub_00456C88(?:?; ?:?; ?:?);
//begin
{*
 00456C88    push       ebp
 00456C89    mov        ebp,esp
 00456C8B    add        esp,0FFFFFFAC
 00456C8E    push       ebx
 00456C8F    push       esi
 00456C90    push       edi
 00456C91    xor        ebx,ebx
 00456C93    mov        dword ptr [ebp-54],ebx
 00456C96    mov        dword ptr [ebp-30],ebx
 00456C99    mov        esi,ecx
 00456C9B    mov        ebx,edx
 00456C9D    mov        edi,eax
 00456C9F    xor        eax,eax
 00456CA1    push       ebp
 00456CA2    push       456DFF
 00456CA7    push       dword ptr fs:[eax]
 00456CAA    mov        dword ptr fs:[eax],esp
 00456CAD    mov        dword ptr [ebp-2C],2C
 00456CB4    lea        eax,[ebp-2C]
 00456CB7    push       eax
 00456CB8    mov        eax,edi
 00456CBA    call       TWinControl.GetHandle
 00456CBF    push       eax
 00456CC0    call       user32.GetWindowPlacement
 00456CC5    mov        eax,[0046C05C]; ^Application:TApplication
 00456CCA    mov        eax,dword ptr [eax]
 00456CCC    cmp        edi,dword ptr [eax+38]; TApplication.FMainForm:TForm
>00456CCF    jne        00456CEC
 00456CD1    mov        eax,[0046C05C]; ^Application:TApplication
 00456CD6    mov        eax,dword ptr [eax]
 00456CD8    mov        eax,dword ptr [eax+24]; TApplication.FHandle:HWND
 00456CDB    push       eax
 00456CDC    call       user32.IsIconic
 00456CE1    test       eax,eax
>00456CE3    je         00456CEC
 00456CE5    mov        dword ptr [ebp-24],2
 00456CEC    mov        eax,edi
 00456CEE    cmp        byte ptr [eax+217],1
>00456CF5    jne        00456D04
 00456CF7    cmp        byte ptr [eax+213],1
>00456CFE    jne        00456D04
 00456D00    or         dword ptr [ebp-28],1
 00456D04    mov        eax,dword ptr [ebp-28]
 00456D07    push       eax
 00456D08    mov        ecx,456E18; 'Flags'
 00456D0D    mov        edx,esi
 00456D0F    mov        eax,ebx
 00456D11    call       00456AD8
 00456D16    mov        eax,dword ptr [ebp-24]
 00456D19    push       eax
 00456D1A    mov        ecx,456E28; 'ShowCmd'
 00456D1F    mov        edx,esi
 00456D21    mov        eax,ebx
 00456D23    call       00456AD8
 00456D28    mov        eax,[0046C190]; ^Screen:TScreen
 00456D2D    mov        eax,dword ptr [eax]
 00456D2F    mov        eax,dword ptr [eax+34]; TScreen.FPixelsPerInch:Integer
 00456D32    push       eax
 00456D33    mov        ecx,456E38; 'PixelsPerInch'
 00456D38    mov        edx,esi
 00456D3A    mov        eax,ebx
 00456D3C    call       00456AD8
 00456D41    lea        eax,[ebp-30]
 00456D44    push       eax
 00456D45    mov        eax,dword ptr [ebp-20]
 00456D48    mov        dword ptr [ebp-50],eax
 00456D4B    mov        byte ptr [ebp-4C],0
 00456D4F    mov        eax,dword ptr [ebp-1C]
 00456D52    mov        dword ptr [ebp-48],eax
 00456D55    mov        byte ptr [ebp-44],0
 00456D59    mov        eax,dword ptr [ebp-18]
 00456D5C    mov        dword ptr [ebp-40],eax
 00456D5F    mov        byte ptr [ebp-3C],0
 00456D63    mov        eax,dword ptr [ebp-14]
 00456D66    mov        dword ptr [ebp-38],eax
 00456D69    mov        byte ptr [ebp-34],0
 00456D6D    lea        edx,[ebp-50]
 00456D70    mov        ecx,3
 00456D75    mov        eax,456E50; '%d,%d,%d,%d'
 00456D7A    call       Format
 00456D7F    mov        eax,dword ptr [ebp-30]
 00456D82    push       eax
 00456D83    mov        ecx,456E64; 'MinMaxPos'
 00456D88    mov        edx,esi
 00456D8A    mov        eax,ebx
 00456D8C    call       00456C08
 00456D91    lea        eax,[ebp-54]
 00456D94    push       eax
 00456D95    mov        eax,dword ptr [ebp-10]
 00456D98    mov        dword ptr [ebp-50],eax
 00456D9B    mov        byte ptr [ebp-4C],0
 00456D9F    mov        eax,dword ptr [ebp-0C]
 00456DA2    mov        dword ptr [ebp-48],eax
 00456DA5    mov        byte ptr [ebp-44],0
 00456DA9    mov        eax,dword ptr [ebp-8]
 00456DAC    mov        dword ptr [ebp-40],eax
 00456DAF    mov        byte ptr [ebp-3C],0
 00456DB3    mov        eax,dword ptr [ebp-4]
 00456DB6    mov        dword ptr [ebp-38],eax
 00456DB9    mov        byte ptr [ebp-34],0
 00456DBD    lea        edx,[ebp-50]
 00456DC0    mov        ecx,3
 00456DC5    mov        eax,456E50; '%d,%d,%d,%d'
 00456DCA    call       Format
 00456DCF    mov        eax,dword ptr [ebp-54]
 00456DD2    push       eax
 00456DD3    mov        ecx,456E78; 'NormPos'
 00456DD8    mov        edx,esi
 00456DDA    mov        eax,ebx
 00456DDC    call       00456C08
 00456DE1    xor        eax,eax
 00456DE3    pop        edx
 00456DE4    pop        ecx
 00456DE5    pop        ecx
 00456DE6    mov        dword ptr fs:[eax],edx
 00456DE9    push       456E06
 00456DEE    lea        eax,[ebp-54]
 00456DF1    call       @LStrClr
 00456DF6    lea        eax,[ebp-30]
 00456DF9    call       @LStrClr
 00456DFE    ret
<00456DFF    jmp        @HandleFinally
<00456E04    jmp        00456DEE
 00456E06    pop        edi
 00456E07    pop        esi
 00456E08    pop        ebx
 00456E09    mov        esp,ebp
 00456E0B    pop        ebp
 00456E0C    ret
*}
//end;

//00456E80
procedure sub_00456E80;
begin
{*
 00456E80    push       ebp
 00456E81    mov        ebp,esp
 00456E83    call       00456C88
 00456E88    pop        ebp
 00456E89    ret
*}
end;

//00456E8C
procedure sub_00456E8C;
begin
{*
 00456E8C    push       ebp
 00456E8D    mov        ebp,esp
 00456E8F    call       00456C88
 00456E94    pop        ebp
 00456E95    ret
*}
end;

//00456E98
//procedure sub_00456E98(?:?; ?:?; ?:?; ?:?; ?:?);
//begin
{*
 00456E98    push       ebp
 00456E99    mov        ebp,esp
 00456E9B    add        esp,0FFFFFF94
 00456E9E    push       ebx
 00456E9F    push       esi
 00456EA0    push       edi
 00456EA1    xor        ebx,ebx
 00456EA3    mov        dword ptr [ebp-5C],ebx
 00456EA6    mov        dword ptr [ebp-58],ebx
 00456EA9    mov        dword ptr [ebp-54],ebx
 00456EAC    mov        dword ptr [ebp-50],ebx
 00456EAF    mov        dword ptr [ebp-4C],ebx
 00456EB2    mov        dword ptr [ebp-48],ebx
 00456EB5    mov        dword ptr [ebp-44],ebx
 00456EB8    mov        dword ptr [ebp-40],ebx
 00456EBB    mov        dword ptr [ebp-10],ebx
 00456EBE    mov        dword ptr [ebp-0C],ecx
 00456EC1    mov        dword ptr [ebp-8],edx
 00456EC4    mov        dword ptr [ebp-4],eax
 00456EC7    mov        ebx,dword ptr [ebp+8]
 00456ECA    xor        eax,eax
 00456ECC    push       ebp
 00456ECD    push       45729B
 00456ED2    push       dword ptr fs:[eax]
 00456ED5    mov        dword ptr fs:[eax],esp
 00456ED8    mov        al,byte ptr [ebp+0C]
 00456EDB    or         al,bl
>00456EDD    je         00457278
 00456EE3    mov        dword ptr [ebp-3C],2C
 00456EEA    lea        eax,[ebp-3C]
 00456EED    push       eax
 00456EEE    mov        eax,dword ptr [ebp-4]
 00456EF1    call       TWinControl.GetHandle
 00456EF6    push       eax
 00456EF7    call       user32.GetWindowPlacement
 00456EFC    mov        eax,dword ptr [ebp-4]
 00456EFF    call       TWinControl.GetHandle
 00456F04    push       eax
 00456F05    call       user32.IsWindowVisible
 00456F0A    test       eax,eax
>00456F0C    jne        00456F13
 00456F0E    xor        eax,eax
 00456F10    mov        dword ptr [ebp-34],eax
 00456F13    test       bl,bl
>00456F15    je         00457173
 00456F1B    xor        ebx,ebx
 00456F1D    mov        eax,dword ptr [ebp-38]
 00456F20    push       eax
 00456F21    mov        ecx,4572B4; 'Flags'
 00456F26    mov        edx,dword ptr [ebp-0C]
 00456F29    mov        eax,dword ptr [ebp-8]
 00456F2C    call       00456A7C
 00456F31    mov        dword ptr [ebp-38],eax
 00456F34    lea        eax,[ebp-10]
 00456F37    push       eax
 00456F38    mov        ecx,4572C4; 'MinMaxPos'
 00456F3D    mov        edx,dword ptr [ebp-0C]
 00456F40    mov        eax,dword ptr [ebp-8]
 00456F43    call       00456B80
 00456F48    cmp        dword ptr [ebp-10],0
>00456F4C    je         00456FE0
 00456F52    mov        bl,1
 00456F54    lea        eax,[ebp-40]
 00456F57    push       eax
 00456F58    mov        ecx,4572D0
 00456F5D    mov        edx,dword ptr [ebp-10]
 00456F60    mov        eax,1
 00456F65    call       004504D0
 00456F6A    mov        eax,dword ptr [ebp-40]
 00456F6D    xor        edx,edx
 00456F6F    call       StrToIntDef
 00456F74    mov        dword ptr [ebp-30],eax
 00456F77    lea        eax,[ebp-44]
 00456F7A    push       eax
 00456F7B    mov        ecx,4572D0
 00456F80    mov        edx,dword ptr [ebp-10]
 00456F83    mov        eax,2
 00456F88    call       004504D0
 00456F8D    mov        eax,dword ptr [ebp-44]
 00456F90    xor        edx,edx
 00456F92    call       StrToIntDef
 00456F97    mov        dword ptr [ebp-2C],eax
 00456F9A    lea        eax,[ebp-48]
 00456F9D    push       eax
 00456F9E    mov        ecx,4572D0
 00456FA3    mov        edx,dword ptr [ebp-10]
 00456FA6    mov        eax,3
 00456FAB    call       004504D0
 00456FB0    mov        eax,dword ptr [ebp-48]
 00456FB3    xor        edx,edx
 00456FB5    call       StrToIntDef
 00456FBA    mov        dword ptr [ebp-28],eax
 00456FBD    lea        eax,[ebp-4C]
 00456FC0    push       eax
 00456FC1    mov        ecx,4572D0
 00456FC6    mov        edx,dword ptr [ebp-10]
 00456FC9    mov        eax,4
 00456FCE    call       004504D0
 00456FD3    mov        eax,dword ptr [ebp-4C]
 00456FD6    xor        edx,edx
 00456FD8    call       StrToIntDef
 00456FDD    mov        dword ptr [ebp-24],eax
 00456FE0    lea        eax,[ebp-10]
 00456FE3    push       eax
 00456FE4    mov        ecx,4572F8; 'NormPos'
 00456FE9    mov        edx,dword ptr [ebp-0C]
 00456FEC    mov        eax,dword ptr [ebp-8]
 00456FEF    call       00456B80
 00456FF4    cmp        dword ptr [ebp-10],0
>00456FF8    je         00457099
 00456FFE    mov        bl,1
 00457000    lea        eax,[ebp-50]
 00457003    push       eax
 00457004    mov        ecx,4572D0
 00457009    mov        edx,dword ptr [ebp-10]
 0045700C    mov        eax,1
 00457011    call       004504D0
 00457016    mov        eax,dword ptr [ebp-50]
 00457019    mov        esi,dword ptr [ebp-4]
 0045701C    mov        edx,dword ptr [esi+30]
 0045701F    call       StrToIntDef
 00457024    mov        dword ptr [ebp-20],eax
 00457027    lea        eax,[ebp-54]
 0045702A    push       eax
 0045702B    mov        ecx,4572D0
 00457030    mov        edx,dword ptr [ebp-10]
 00457033    mov        eax,2
 00457038    call       004504D0
 0045703D    mov        eax,dword ptr [ebp-54]
 00457040    mov        edx,dword ptr [esi+34]
 00457043    call       StrToIntDef
 00457048    mov        dword ptr [ebp-1C],eax
 0045704B    lea        eax,[ebp-58]
 0045704E    push       eax
 0045704F    mov        ecx,4572D0
 00457054    mov        edx,dword ptr [ebp-10]
 00457057    mov        eax,3
 0045705C    call       004504D0
 00457061    mov        eax,dword ptr [ebp-58]
 00457064    mov        edx,dword ptr [esi+30]
 00457067    add        edx,dword ptr [esi+38]
 0045706A    call       StrToIntDef
 0045706F    mov        dword ptr [ebp-18],eax
 00457072    lea        eax,[ebp-5C]
 00457075    push       eax
 00457076    mov        ecx,4572D0
 0045707B    mov        edx,dword ptr [ebp-10]
 0045707E    mov        eax,4
 00457083    call       004504D0
 00457088    mov        eax,dword ptr [ebp-5C]
 0045708B    mov        edx,dword ptr [esi+34]
 0045708E    add        edx,dword ptr [esi+3C]
 00457091    call       StrToIntDef
 00457096    mov        dword ptr [ebp-14],eax
 00457099    mov        eax,[0046C190]; ^Screen:TScreen
 0045709E    mov        eax,dword ptr [eax]
 004570A0    mov        esi,dword ptr [eax+34]; TScreen.FPixelsPerInch:Integer
 004570A3    push       esi
 004570A4    mov        ecx,457308; 'PixelsPerInch'
 004570A9    mov        edx,dword ptr [ebp-0C]
 004570AC    mov        eax,dword ptr [ebp-8]
 004570AF    call       00456A7C
 004570B4    mov        edx,dword ptr ds:[46C190]; ^Screen:TScreen
 004570BA    cmp        eax,esi
>004570BC    je         004570C0
 004570BE    xor        ebx,ebx
 004570C0    test       bl,bl
>004570C2    je         00457173
 004570C8    mov        ebx,dword ptr [ebp-4]
 004570CB    mov        al,byte ptr [ebx+211]
 004570D1    sub        al,2
>004570D3    je         00457104
 004570D5    sub        al,3
>004570D7    je         00457104
 004570D9    mov        eax,dword ptr [ebx+3C]
 004570DC    mov        edi,dword ptr [ebp-1C]
 004570DF    add        eax,edi
 004570E1    push       eax
 004570E2    lea        eax,[ebp-6C]
 004570E5    push       eax
 004570E6    mov        ecx,dword ptr [ebx+38]
 004570E9    mov        esi,dword ptr [ebp-20]
 004570EC    add        ecx,esi
 004570EE    mov        edx,edi
 004570F0    mov        eax,esi
 004570F2    call       Rect
 004570F7    lea        esi,[ebp-6C]
 004570FA    lea        edi,[ebp-20]
 004570FD    mov        ecx,4
 00457102    rep movs   dword ptr [edi],dword ptr [esi]
 00457104    mov        eax,dword ptr [ebp-18]
 00457107    cmp        eax,dword ptr [ebp-20]
>0045710A    jle        00457173
 0045710C    mov        ebx,dword ptr [ebp-4]
 0045710F    cmp        byte ptr [ebx+218],4
>00457116    jne        00457161
 00457118    test       byte ptr [ebx+20],10
>0045711C    jne        00457161
 0045711E    mov        cl,1
 00457120    mov        dl,1
 00457122    mov        eax,ebx
 00457124    call       TComponent.SetDesigning
 00457129    xor        eax,eax
 0045712B    push       ebp
 0045712C    push       45715A
 00457131    push       dword ptr fs:[eax]
 00457134    mov        dword ptr fs:[eax],esp
 00457137    xor        edx,edx
 00457139    mov        eax,ebx
 0045713B    call       TCustomForm.SetPosition
 00457140    xor        eax,eax
 00457142    pop        edx
 00457143    pop        ecx
 00457144    pop        ecx
 00457145    mov        dword ptr fs:[eax],edx
 00457148    push       457161
 0045714D    mov        cl,1
 0045714F    xor        edx,edx
 00457151    mov        eax,dword ptr [ebp-4]
 00457154    call       TComponent.SetDesigning
 00457159    ret
<0045715A    jmp        @HandleFinally
<0045715F    jmp        0045714D
 00457161    lea        eax,[ebp-3C]
 00457164    push       eax
 00457165    mov        eax,dword ptr [ebp-4]
 00457168    call       TWinControl.GetHandle
 0045716D    push       eax
 0045716E    call       user32.SetWindowPlacement
 00457173    cmp        byte ptr [ebp+0C],0
>00457177    je         0045726D
 0045717D    xor        ebx,ebx
 0045717F    mov        eax,[0046C05C]; ^Application:TApplication
 00457184    mov        eax,dword ptr [eax]
 00457186    mov        eax,dword ptr [eax+38]; TApplication.FMainForm:TForm
 00457189    cmp        eax,dword ptr [ebp-4]
>0045718C    je         00457198
 0045718E    mov        ecx,dword ptr ds:[46C05C]; ^Application:TApplication
 00457194    test       eax,eax
>00457196    jne        004571BB
 00457198    mov        eax,dword ptr [ebp-4]
 0045719B    cmp        byte ptr [eax+217],2
>004571A2    je         004571B9
 004571A4    mov        edx,dword ptr [ebp-4]
 004571A7    cmp        byte ptr [edx+217],0
>004571AE    jne        004571BB
 004571B0    cmp        byte ptr [edx+218],1
>004571B7    jne        004571BB
 004571B9    mov        bl,2
 004571BB    push       0
 004571BD    mov        ecx,457320; 'ShowCmd'
 004571C2    mov        edx,dword ptr [ebp-0C]
 004571C5    mov        eax,dword ptr [ebp-8]
 004571C8    call       00456A7C
 004571CD    mov        esi,eax
 004571CF    mov        dword ptr [ebp-34],esi
 004571D2    cmp        esi,9
>004571D5    ja         00457209
 004571D7    movzx      esi,byte ptr [esi+4571E5]
 004571DE    jmp        dword ptr [esi*4+4571EF]
 004571DE    db         0
 004571DE    db         1
 004571DE    db         2
 004571DE    db         3
 004571DE    db         0
 004571DE    db         1
 004571DE    db         2
 004571DE    db         2
 004571DE    db         0
 004571DE    db         1
 004571DE    dd         457209
 004571DE    dd         4571FF
 004571DE    dd         457203
 004571DE    dd         457207
 004571FF    xor        ebx,ebx
>00457201    jmp        00457209
 00457203    mov        bl,1
>00457205    jmp        00457209
 00457207    mov        bl,2
 00457209    cmp        bl,1
>0045720C    jne        0045724F
 0045720E    mov        eax,[0046C05C]; ^Application:TApplication
 00457213    mov        eax,dword ptr [eax]
 00457215    mov        eax,dword ptr [eax+38]; TApplication.FMainForm:TForm
 00457218    cmp        eax,dword ptr [ebp-4]
>0045721B    je         00457227
 0045721D    mov        edx,dword ptr ds:[46C05C]; ^Application:TApplication
 00457223    test       eax,eax
>00457225    jne        0045724F
 00457227    mov        eax,dword ptr [ebp-4]
 0045722A    mov        byte ptr [eax+213],0
 00457231    push       0
 00457233    push       0F020
 00457238    push       112
 0045723D    mov        eax,[0046C05C]; ^Application:TApplication
 00457242    mov        eax,dword ptr [eax]
 00457244    mov        eax,dword ptr [eax+24]; TApplication.FHandle:HWND
 00457247    push       eax
 00457248    call       user32.PostMessageA
>0045724D    jmp        00457278
 0045724F    mov        eax,dword ptr [ebp-4]
 00457252    mov        dl,byte ptr [eax+217]
 00457258    dec        edx
 00457259    sub        dl,2
>0045725C    jae        00457266
 0045725E    mov        byte ptr [eax+213],bl
>00457264    jmp        0045726D
 00457266    mov        edx,ebx
 00457268    call       TCustomForm.SetWindowState
 0045726D    mov        eax,dword ptr [ebp-4]
 00457270    mov        edx,dword ptr [eax]
 00457272    call       dword ptr [edx+80]
 00457278    xor        eax,eax
 0045727A    pop        edx
 0045727B    pop        ecx
 0045727C    pop        ecx
 0045727D    mov        dword ptr fs:[eax],edx
 00457280    push       4572A2
 00457285    lea        eax,[ebp-5C]
 00457288    mov        edx,8
 0045728D    call       @LStrArrayClr
 00457292    lea        eax,[ebp-10]
 00457295    call       @LStrClr
 0045729A    ret
<0045729B    jmp        @HandleFinally
<004572A0    jmp        00457285
 004572A2    pop        edi
 004572A3    pop        esi
 004572A4    pop        ebx
 004572A5    mov        esp,ebp
 004572A7    pop        ebp
 004572A8    ret        8
*}
//end;

//00457328
//procedure sub_00457328(?:?; ?:?);
//begin
{*
 00457328    push       ebp
 00457329    mov        ebp,esp
 0045732B    push       ebx
 0045732C    mov        bl,byte ptr [ebp+0C]
 0045732F    push       ebx
 00457330    mov        bl,byte ptr [ebp+8]
 00457333    push       ebx
 00457334    call       00456E98
 00457339    pop        ebx
 0045733A    pop        ebp
 0045733B    ret        8
*}
//end;

//00457340
//procedure sub_00457340(?:?; ?:?);
//begin
{*
 00457340    push       ebp
 00457341    mov        ebp,esp
 00457343    push       ebx
 00457344    mov        bl,byte ptr [ebp+0C]
 00457347    push       ebx
 00457348    mov        bl,byte ptr [ebp+8]
 0045734B    push       ebx
 0045734C    call       00456E98
 00457351    pop        ebx
 00457352    pop        ebp
 00457353    ret        8
*}
//end;

Initialization
Finalization
//00457358
{*
 00457358    push       ebp
 00457359    mov        ebp,esp
 0045735B    xor        eax,eax
 0045735D    push       ebp
 0045735E    push       457389
 00457363    push       dword ptr fs:[eax]
 00457366    mov        dword ptr fs:[eax],esp
 00457369    inc        dword ptr ds:[46D8D0]
>0045736F    jne        0045737B
 00457371    mov        eax,46ABE8; gvar_0046ABE8:AnsiString
 00457376    call       @LStrClr
 0045737B    xor        eax,eax
 0045737D    pop        edx
 0045737E    pop        ecx
 0045737F    pop        ecx
 00457380    mov        dword ptr fs:[eax],edx
 00457383    push       457390
 00457388    ret
<00457389    jmp        @HandleFinally
<0045738E    jmp        00457388
 00457390    pop        ebp
 00457391    ret
*}
end.