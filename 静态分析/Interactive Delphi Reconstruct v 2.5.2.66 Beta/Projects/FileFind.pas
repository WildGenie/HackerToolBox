{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit FileFind;

interface

uses
  Classes, Windows, Graphics;

type
  TFindFileEvent = procedure(fullpath:String; info:TSearchRec) of object;
  TChangeFolderEvent = procedure(fullpath:String; info:TSearchRec) of object;
  TFileSearch = class(TComponent)
  public
    RecurseSubFolders:Boolean;//f24
    Stop:Boolean;//f25
    f26:byte;//f26
    FilesFound:TStringList;//f28
    OnFileFind:TFindFileEvent;//f30
    OnChangeFolder:TChangeFolderEvent;//f38
    OnFinish:TNotifyEvent;//f40
    f42:word;//f42
    f44:dword;//f44
    SearchFile:ShortString;//f48
    destructor Destroy; virtual;
    constructor Create(AOwner:TComponent); virtual;
  end;

implementation

{$R *.DFM}

//0045D984
constructor TFileSearch.Create(AOwner:TComponent);
begin
{*
 0045D984    push       ebp
 0045D985    mov        ebp,esp
 0045D987    push       ebx
 0045D988    push       esi
 0045D989    test       dl,dl
>0045D98B    je         0045D995
 0045D98D    add        esp,0FFFFFFF0
 0045D990    call       @ClassCreate
 0045D995    mov        ebx,edx
 0045D997    mov        esi,eax
 0045D999    xor        edx,edx
 0045D99B    mov        eax,esi
 0045D99D    call       TComponent.Create
 0045D9A2    mov        dl,1
 0045D9A4    mov        eax,[0040F078]; TStringList
 0045D9A9    call       TObject.Create; TStringList.Create
 0045D9AE    mov        dword ptr [esi+28],eax; TFileSearch.FilesFound:TStringList
 0045D9B1    mov        byte ptr [esi+24],1; TFileSearch.RecurseSubFolders:Boolean
 0045D9B5    mov        byte ptr [esi+26],0; TFileSearch.?f26:byte
 0045D9B9    mov        byte ptr [esi+25],0; TFileSearch.Stop:Boolean
 0045D9BD    mov        eax,esi
 0045D9BF    test       bl,bl
>0045D9C1    je         0045D9D2
 0045D9C3    call       @AfterConstruction
 0045D9C8    pop        dword ptr fs:[0]
 0045D9CF    add        esp,0C
 0045D9D2    mov        eax,esi
 0045D9D4    pop        esi
 0045D9D5    pop        ebx
 0045D9D6    pop        ebp
 0045D9D7    ret
*}
end;

//0045D9D8
destructor TFileSearch.Destroy;
begin
{*
 0045D9D8    push       ebp
 0045D9D9    mov        ebp,esp
 0045D9DB    push       ebx
 0045D9DC    push       esi
 0045D9DD    call       @BeforeDestruction
 0045D9E2    mov        ebx,edx
 0045D9E4    mov        esi,eax
 0045D9E6    mov        eax,dword ptr [esi+28]; TFileSearch.FilesFound:TStringList
 0045D9E9    call       TObject.Free
 0045D9EE    mov        edx,ebx
 0045D9F0    and        dl,0FC
 0045D9F3    mov        eax,esi
 0045D9F5    call       TComponent.Destroy
 0045D9FA    test       bl,bl
>0045D9FC    jle        0045DA05
 0045D9FE    mov        eax,esi
 0045DA00    call       @ClassDestroy
 0045DA05    pop        esi
 0045DA06    pop        ebx
 0045DA07    pop        ebp
 0045DA08    ret
*}
end;

//0045DA0C
//procedure sub_0045DA0C(?:TFileSearch);
//begin
{*
 0045DA0C    push       ebp
 0045DA0D    mov        ebp,esp
 0045DA0F    add        esp,0FFFFFEE0
 0045DA15    push       ebx
 0045DA16    push       esi
 0045DA17    push       edi
 0045DA18    xor        edx,edx
 0045DA1A    mov        dword ptr [ebp-120],edx
 0045DA20    mov        dword ptr [ebp-11C],edx
 0045DA26    mov        dword ptr [ebp-118],edx
 0045DA2C    mov        dword ptr [ebp-114],edx
 0045DA32    mov        dword ptr [ebp-8],edx
 0045DA35    mov        dword ptr [ebp-0C],edx
 0045DA38    mov        ebx,eax
 0045DA3A    xor        eax,eax
 0045DA3C    push       ebp
 0045DA3D    push       45DC1B
 0045DA42    push       dword ptr fs:[eax]
 0045DA45    mov        dword ptr fs:[eax],esp
 0045DA48    mov        byte ptr [ebx+25],0; TFileSearch.Stop:Boolean
 0045DA4C    mov        byte ptr [ebx+26],1; TFileSearch.?f26:byte
 0045DA50    mov        eax,dword ptr [ebx+28]; TFileSearch.FilesFound:TStringList
 0045DA53    mov        edx,dword ptr [eax]
 0045DA55    call       dword ptr [edx+40]; TStringList.Clear
 0045DA58    lea        edx,[ebx+48]; TFileSearch.SearchFile:ShortString
 0045DA5B    mov        eax,45DC2C; ';'
 0045DA60    call       @Pos
 0045DA65    mov        esi,eax
 0045DA67    test       esi,esi
>0045DA69    jle        0045DBBE
 0045DA6F    lea        eax,[ebp-110]
 0045DA75    push       eax
 0045DA76    mov        ecx,esi
 0045DA78    dec        ecx
 0045DA79    mov        edx,1
 0045DA7E    lea        eax,[ebx+48]; TFileSearch.SearchFile:ShortString
 0045DA81    call       @Copy
 0045DA86    lea        edx,[ebp-110]
 0045DA8C    lea        eax,[ebp-8]
 0045DA8F    call       @LStrFromString
 0045DA94    lea        eax,[ebp-110]
 0045DA9A    push       eax
 0045DA9B    xor        ecx,ecx
 0045DA9D    mov        cl,byte ptr [ebx+48]; TFileSearch.SearchFile:ShortString
 0045DAA0    lea        edx,[esi+1]
 0045DAA3    lea        eax,[ebx+48]; TFileSearch.SearchFile:ShortString
 0045DAA6    call       @Copy
 0045DAAB    lea        edx,[ebp-110]
 0045DAB1    lea        eax,[ebp-0C]
 0045DAB4    call       @LStrFromString
 0045DAB9    mov        dl,1
 0045DABB    mov        eax,[0040F078]; TStringList
 0045DAC0    call       TObject.Create; TStringList.Create
 0045DAC5    mov        dword ptr [ebp-10],eax
 0045DAC8    mov        edx,dword ptr [ebp-8]
 0045DACB    mov        eax,dword ptr [ebp-10]
 0045DACE    mov        ecx,dword ptr [eax]
 0045DAD0    call       dword ptr [ecx+34]; TStringList.Add
>0045DAD3    jmp        0045DB65
 0045DAD8    lea        edx,[ebp-114]
 0045DADE    mov        eax,dword ptr [ebp-8]
 0045DAE1    call       ExtractFilePath
 0045DAE6    mov        edx,dword ptr [ebp-114]
 0045DAEC    lea        eax,[ebp-8]
 0045DAEF    call       @LStrLAsg
 0045DAF4    mov        edx,dword ptr [ebp-0C]
 0045DAF7    mov        eax,45DC38; ';'
 0045DAFC    call       @LStrPos
 0045DB01    mov        esi,eax
 0045DB03    test       esi,esi
>0045DB05    jle        0045DB47
 0045DB07    lea        eax,[ebp-118]
 0045DB0D    push       eax
 0045DB0E    mov        ecx,esi
 0045DB10    dec        ecx
 0045DB11    mov        edx,1
 0045DB16    mov        eax,dword ptr [ebp-0C]
 0045DB19    call       @LStrCopy
 0045DB1E    mov        edx,dword ptr [ebp-118]
 0045DB24    lea        eax,[ebp-8]
 0045DB27    call       @LStrCat
 0045DB2C    lea        eax,[ebp-0C]
 0045DB2F    push       eax
 0045DB30    mov        eax,dword ptr [ebp-0C]
 0045DB33    call       @LStrLen
 0045DB38    mov        ecx,eax
 0045DB3A    lea        edx,[esi+1]
 0045DB3D    mov        eax,dword ptr [ebp-0C]
 0045DB40    call       @LStrCopy
>0045DB45    jmp        0045DB5A
 0045DB47    lea        eax,[ebp-8]
 0045DB4A    mov        edx,dword ptr [ebp-0C]
 0045DB4D    call       @LStrCat
 0045DB52    lea        eax,[ebp-0C]
 0045DB55    call       @LStrClr
 0045DB5A    mov        edx,dword ptr [ebp-8]
 0045DB5D    mov        eax,dword ptr [ebp-10]
 0045DB60    mov        ecx,dword ptr [eax]
 0045DB62    call       dword ptr [ecx+34]; TStringList.Add
 0045DB65    mov        eax,dword ptr [ebp-0C]
 0045DB68    call       @LStrLen
 0045DB6D    test       eax,eax
<0045DB6F    jg         0045DAD8
 0045DB75    mov        eax,dword ptr [ebp-10]
 0045DB78    mov        edx,dword ptr [eax]
 0045DB7A    call       dword ptr [edx+14]; TStringList.GetCount
 0045DB7D    mov        esi,eax
 0045DB7F    dec        esi
 0045DB80    test       esi,esi
>0045DB82    jl         0045DBB4
 0045DB84    inc        esi
 0045DB85    mov        dword ptr [ebp-4],0
 0045DB8C    lea        ecx,[ebp-11C]
 0045DB92    mov        edx,dword ptr [ebp-4]
 0045DB95    mov        eax,dword ptr [ebp-10]
 0045DB98    mov        edi,dword ptr [eax]
 0045DB9A    call       dword ptr [edi+0C]; TStringList.Get
 0045DB9D    mov        edx,dword ptr [ebp-11C]
 0045DBA3    mov        cx,3F
 0045DBA7    mov        eax,ebx
 0045DBA9    call       0045DF9C
 0045DBAE    inc        dword ptr [ebp-4]
 0045DBB1    dec        esi
<0045DBB2    jne        0045DB8C
 0045DBB4    mov        eax,dword ptr [ebp-10]
 0045DBB7    call       TObject.Free
>0045DBBC    jmp        0045DBDD
 0045DBBE    lea        eax,[ebp-120]
 0045DBC4    lea        edx,[ebx+48]; TFileSearch.SearchFile:ShortString
 0045DBC7    call       @LStrFromString
 0045DBCC    mov        edx,dword ptr [ebp-120]
 0045DBD2    mov        cx,3F
 0045DBD6    mov        eax,ebx
 0045DBD8    call       0045DF9C
 0045DBDD    cmp        word ptr [ebx+42],0; TFileSearch.?f42:word
>0045DBE2    je         0045DBEC
 0045DBE4    mov        edx,ebx
 0045DBE6    mov        eax,dword ptr [ebx+44]; TFileSearch.?f44:dword
 0045DBE9    call       dword ptr [ebx+40]; TFileSearch.OnFinish
 0045DBEC    mov        byte ptr [ebx+26],0; TFileSearch.?f26:byte
 0045DBF0    xor        eax,eax
 0045DBF2    pop        edx
 0045DBF3    pop        ecx
 0045DBF4    pop        ecx
 0045DBF5    mov        dword ptr fs:[eax],edx
 0045DBF8    push       45DC22
 0045DBFD    lea        eax,[ebp-120]
 0045DC03    mov        edx,4
 0045DC08    call       @LStrArrayClr
 0045DC0D    lea        eax,[ebp-0C]
 0045DC10    mov        edx,2
 0045DC15    call       @LStrArrayClr
 0045DC1A    ret
<0045DC1B    jmp        @HandleFinally
<0045DC20    jmp        0045DBFD
 0045DC22    pop        edi
 0045DC23    pop        esi
 0045DC24    pop        ebx
 0045DC25    mov        esp,ebp
 0045DC27    pop        ebp
 0045DC28    ret
*}
//end;

//0045DC60
//procedure sub_0045DC60(?:AnsiString; ?:?; ?:?);
//begin
{*
 0045DC60    push       ebp
 0045DC61    mov        ebp,esp
 0045DC63    add        esp,0FFFFFD44
 0045DC69    push       ebx
 0045DC6A    push       esi
 0045DC6B    push       edi
 0045DC6C    xor        ecx,ecx
 0045DC6E    mov        dword ptr [ebp-2BC],ecx
 0045DC74    mov        dword ptr [ebp-2B8],ecx
 0045DC7A    mov        esi,edx
 0045DC7C    lea        edi,[ebp-15C]
 0045DC82    mov        ecx,56
 0045DC87    rep movs   dword ptr [edi],dword ptr [esi]
 0045DC89    mov        dword ptr [ebp-4],eax
 0045DC8C    mov        eax,dword ptr [ebp-4]
 0045DC8F    call       @LStrAddRef
 0045DC94    lea        eax,[ebp-15C]
 0045DC9A    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 0045DCA0    call       00404514
 0045DCA5    lea        eax,[ebp-2B4]
 0045DCAB    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 0045DCB1    call       @InitializeRecord
 0045DCB6    mov        ebx,dword ptr [ebp+8]
 0045DCB9    add        ebx,0FFFFFFFC
 0045DCBC    mov        esi,dword ptr [ebp+8]
 0045DCBF    add        esi,0FFFFFFF0
 0045DCC2    xor        eax,eax
 0045DCC4    push       ebp
 0045DCC5    push       45DDE4
 0045DCCA    push       dword ptr fs:[eax]
 0045DCCD    mov        dword ptr fs:[eax],esp
 0045DCD0    mov        eax,dword ptr [ebx]
 0045DCD2    cmp        word ptr [eax+3A],0
>0045DCD7    je         0045DCEA
 0045DCD9    mov        edi,dword ptr [ebx]
 0045DCDB    lea        ecx,[ebp-15C]
 0045DCE1    mov        edx,dword ptr [ebp-4]
 0045DCE4    mov        eax,dword ptr [edi+3C]
 0045DCE7    call       dword ptr [edi+38]
 0045DCEA    mov        eax,dword ptr [ebp+8]
 0045DCED    mov        ecx,dword ptr [eax-8]
 0045DCF0    lea        eax,[ebp-2B8]
 0045DCF6    mov        edx,dword ptr [ebp-4]
 0045DCF9    call       @LStrCat3
 0045DCFE    mov        eax,dword ptr [ebp-2B8]
 0045DD04    lea        ecx,[ebp-2B4]
 0045DD0A    mov        edx,dword ptr [ebp+8]
 0045DD0D    movzx      edx,word ptr [edx-0A]
 0045DD11    call       FindFirst
 0045DD16    mov        dword ptr [esi],eax
>0045DD18    jmp        0045DD97
 0045DD1A    mov        eax,dword ptr [ebp-2A8]
 0045DD20    mov        edx,dword ptr ds:[46AC44]; ^'.'
 0045DD26    call       @LStrCmp
>0045DD2B    je         0045DD7E
 0045DD2D    mov        eax,dword ptr [ebp-2A8]
 0045DD33    mov        edx,dword ptr ds:[46AC48]; ^'..'
 0045DD39    call       @LStrCmp
>0045DD3E    je         0045DD7E
 0045DD40    mov        eax,dword ptr [ebx]
 0045DD42    cmp        word ptr [eax+32],0
>0045DD47    je         0045DD5A
 0045DD49    mov        edi,dword ptr [ebx]
 0045DD4B    lea        ecx,[ebp-2B4]
 0045DD51    mov        edx,dword ptr [ebp-4]
 0045DD54    mov        eax,dword ptr [edi+34]
 0045DD57    call       dword ptr [edi+30]
 0045DD5A    lea        eax,[ebp-2BC]
 0045DD60    mov        ecx,dword ptr [ebp-2A8]
 0045DD66    mov        edx,dword ptr [ebp-4]
 0045DD69    call       @LStrCat3
 0045DD6E    mov        edx,dword ptr [ebp-2BC]
 0045DD74    mov        eax,dword ptr [ebx]
 0045DD76    mov        eax,dword ptr [eax+28]
 0045DD79    mov        ecx,dword ptr [eax]
 0045DD7B    call       dword ptr [ecx+34]
 0045DD7E    lea        eax,[ebp-2B4]
 0045DD84    call       FindNext
 0045DD89    mov        dword ptr [esi],eax
 0045DD8B    mov        eax,[0046C05C]; ^Application:TApplication
 0045DD90    mov        eax,dword ptr [eax]
 0045DD92    call       TApplication.ProcessMessages
 0045DD97    cmp        dword ptr [esi],0
>0045DD9A    jne        0045DDA8
 0045DD9C    mov        eax,dword ptr [ebx]
 0045DD9E    cmp        byte ptr [eax+25],0
<0045DDA2    je         0045DD1A
 0045DDA8    xor        eax,eax
 0045DDAA    pop        edx
 0045DDAB    pop        ecx
 0045DDAC    pop        ecx
 0045DDAD    mov        dword ptr fs:[eax],edx
 0045DDB0    push       45DDEB
 0045DDB5    lea        eax,[ebp-2BC]
 0045DDBB    mov        edx,2
 0045DDC0    call       @LStrArrayClr
 0045DDC5    lea        eax,[ebp-2B4]
 0045DDCB    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 0045DDD1    mov        ecx,2
 0045DDD6    call       @FinalizeArray
 0045DDDB    lea        eax,[ebp-4]
 0045DDDE    call       @LStrClr
 0045DDE3    ret
<0045DDE4    jmp        @HandleFinally
<0045DDE9    jmp        0045DDB5
 0045DDEB    pop        edi
 0045DDEC    pop        esi
 0045DDED    pop        ebx
 0045DDEE    mov        esp,ebp
 0045DDF0    pop        ebp
 0045DDF1    ret
*}
//end;

//0045DDF4
//procedure sub_0045DDF4(?:AnsiString; ?:TSearchRec; ?:?);
//begin
{*
 0045DDF4    push       ebp
 0045DDF5    mov        ebp,esp
 0045DDF7    add        esp,0FFFFFD44
 0045DDFD    push       ebx
 0045DDFE    push       esi
 0045DDFF    push       edi
 0045DE00    xor        ecx,ecx
 0045DE02    mov        dword ptr [ebp-2BC],ecx
 0045DE08    mov        dword ptr [ebp-2B8],ecx
 0045DE0E    mov        esi,edx
 0045DE10    lea        edi,[ebp-15C]
 0045DE16    mov        ecx,56
 0045DE1B    rep movs   dword ptr [edi],dword ptr [esi]
 0045DE1D    mov        dword ptr [ebp-4],eax
 0045DE20    mov        eax,dword ptr [ebp-4]
 0045DE23    call       @LStrAddRef
 0045DE28    lea        eax,[ebp-15C]
 0045DE2E    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 0045DE34    call       00404514
 0045DE39    lea        eax,[ebp-2B4]
 0045DE3F    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 0045DE45    call       @InitializeRecord
 0045DE4A    mov        ebx,dword ptr [ebp+8]
 0045DE4D    add        ebx,0FFFFFFF0
 0045DE50    mov        esi,dword ptr ds:[46C05C]; ^Application:TApplication
 0045DE56    mov        edi,dword ptr [ebp+8]
 0045DE59    add        edi,0FFFFFFFC
 0045DE5C    xor        eax,eax
 0045DE5E    push       ebp
 0045DE5F    push       45DF81
 0045DE64    push       dword ptr fs:[eax]
 0045DE67    mov        dword ptr fs:[eax],esp
 0045DE6A    mov        eax,dword ptr [ebp+8]
 0045DE6D    push       eax
 0045DE6E    lea        edx,[ebp-15C]
 0045DE74    mov        eax,dword ptr [ebp-4]
 0045DE77    call       0045DC60
 0045DE7C    pop        ecx
 0045DE7D    lea        eax,[ebp-2B8]
 0045DE83    mov        ecx,dword ptr ds:[46AC40]; ^'*.*'
 0045DE89    mov        edx,dword ptr [ebp-4]
 0045DE8C    call       @LStrCat3
 0045DE91    mov        eax,dword ptr [ebp-2B8]
 0045DE97    lea        ecx,[ebp-2B4]
 0045DE9D    mov        edx,3F
 0045DEA2    call       FindFirst
 0045DEA7    mov        dword ptr [ebx],eax
>0045DEA9    jmp        0045DF34
 0045DEAE    mov        eax,dword ptr [esi]
 0045DEB0    call       TApplication.ProcessMessages
 0045DEB5    mov        eax,dword ptr [ebp-2A8]
 0045DEBB    mov        edx,dword ptr ds:[46AC44]; ^'.'
 0045DEC1    call       @LStrCmp
>0045DEC6    je         0045DF20
 0045DEC8    mov        eax,dword ptr [ebp-2A8]
 0045DECE    mov        edx,dword ptr ds:[46AC48]; ^'..'
 0045DED4    call       @LStrCmp
>0045DED9    je         0045DF20
 0045DEDB    test       byte ptr [ebp-2AC],10
>0045DEE2    je         0045DF20
 0045DEE4    mov        eax,dword ptr [edi]
 0045DEE6    cmp        byte ptr [eax+24],0
>0045DEEA    je         0045DF20
 0045DEEC    mov        eax,dword ptr [ebp+8]
 0045DEEF    push       eax
 0045DEF0    push       dword ptr [ebp-4]
 0045DEF3    push       dword ptr [ebp-2A8]
 0045DEF9    push       45DF98; '\\'
 0045DEFE    lea        eax,[ebp-2BC]
 0045DF04    mov        edx,3
 0045DF09    call       @LStrCatN
 0045DF0E    mov        eax,dword ptr [ebp-2BC]
 0045DF14    lea        edx,[ebp-2B4]
 0045DF1A    call       0045DDF4
 0045DF1F    pop        ecx
 0045DF20    lea        eax,[ebp-2B4]
 0045DF26    call       FindNext
 0045DF2B    mov        dword ptr [ebx],eax
 0045DF2D    mov        eax,dword ptr [esi]
 0045DF2F    call       TApplication.ProcessMessages
 0045DF34    cmp        dword ptr [ebx],0
>0045DF37    jne        0045DF45
 0045DF39    mov        eax,dword ptr [edi]
 0045DF3B    cmp        byte ptr [eax+25],0
<0045DF3F    je         0045DEAE
 0045DF45    xor        eax,eax
 0045DF47    pop        edx
 0045DF48    pop        ecx
 0045DF49    pop        ecx
 0045DF4A    mov        dword ptr fs:[eax],edx
 0045DF4D    push       45DF88
 0045DF52    lea        eax,[ebp-2BC]
 0045DF58    mov        edx,2
 0045DF5D    call       @LStrArrayClr
 0045DF62    lea        eax,[ebp-2B4]
 0045DF68    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 0045DF6E    mov        ecx,2
 0045DF73    call       @FinalizeArray
 0045DF78    lea        eax,[ebp-4]
 0045DF7B    call       @LStrClr
 0045DF80    ret
<0045DF81    jmp        @HandleFinally
<0045DF86    jmp        0045DF52
 0045DF88    pop        edi
 0045DF89    pop        esi
 0045DF8A    pop        ebx
 0045DF8B    mov        esp,ebp
 0045DF8D    pop        ebp
 0045DF8E    ret
*}
//end;

//0045DF9C
//procedure sub_0045DF9C(?:TFileSearch; ?:AnsiString; ?:?);
//begin
{*
 0045DF9C    push       ebp
 0045DF9D    mov        ebp,esp
 0045DF9F    add        esp,0FFFFFE8C
 0045DFA5    push       ebx
 0045DFA6    xor        ebx,ebx
 0045DFA8    mov        dword ptr [ebp-18],ebx
 0045DFAB    mov        dword ptr [ebp-8],ebx
 0045DFAE    mov        dword ptr [ebp-1C],ebx
 0045DFB1    mov        word ptr [ebp-0A],cx
 0045DFB5    mov        dword ptr [ebp-14],edx
 0045DFB8    mov        dword ptr [ebp-4],eax
 0045DFBB    mov        eax,dword ptr [ebp-14]
 0045DFBE    call       @LStrAddRef
 0045DFC3    lea        eax,[ebp-174]
 0045DFC9    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 0045DFCF    call       @InitializeRecord
 0045DFD4    xor        eax,eax
 0045DFD6    push       ebp
 0045DFD7    push       45E06B
 0045DFDC    push       dword ptr fs:[eax]
 0045DFDF    mov        dword ptr fs:[eax],esp
 0045DFE2    lea        edx,[ebp-18]
 0045DFE5    mov        eax,dword ptr [ebp-14]
 0045DFE8    call       ExtractFilePath
 0045DFED    lea        edx,[ebp-8]
 0045DFF0    mov        eax,dword ptr [ebp-14]
 0045DFF3    call       ExtractFileName
 0045DFF8    lea        eax,[ebp-1C]
 0045DFFB    push       eax
 0045DFFC    mov        eax,dword ptr [ebp-18]
 0045DFFF    call       @LStrLen
 0045E004    mov        ecx,eax
 0045E006    dec        ecx
 0045E007    mov        edx,1
 0045E00C    mov        eax,dword ptr [ebp-18]
 0045E00F    call       @LStrCopy
 0045E014    lea        ecx,[ebp-174]
 0045E01A    mov        edx,3F
 0045E01F    mov        eax,dword ptr [ebp-1C]
 0045E022    call       FindFirst
 0045E027    push       ebp
 0045E028    lea        edx,[ebp-174]
 0045E02E    mov        eax,dword ptr [ebp-18]
 0045E031    call       0045DDF4
 0045E036    pop        ecx
 0045E037    xor        eax,eax
 0045E039    pop        edx
 0045E03A    pop        ecx
 0045E03B    pop        ecx
 0045E03C    mov        dword ptr fs:[eax],edx
 0045E03F    push       45E072
 0045E044    lea        eax,[ebp-174]
 0045E04A    mov        edx,dword ptr ds:[4074FC]; TSearchRec
 0045E050    call       @FinalizeRecord
 0045E055    lea        eax,[ebp-1C]
 0045E058    mov        edx,3
 0045E05D    call       @LStrArrayClr
 0045E062    lea        eax,[ebp-8]
 0045E065    call       @LStrClr
 0045E06A    ret
<0045E06B    jmp        @HandleFinally
<0045E070    jmp        0045E044
 0045E072    pop        ebx
 0045E073    mov        esp,ebp
 0045E075    pop        ebp
 0045E076    ret
*}
//end;

Initialization
Finalization
//0045E078
{*
 0045E078    push       ebp
 0045E079    mov        ebp,esp
 0045E07B    xor        eax,eax
 0045E07D    push       ebp
 0045E07E    push       45E0BD
 0045E083    push       dword ptr fs:[eax]
 0045E086    mov        dword ptr fs:[eax],esp
 0045E089    inc        dword ptr ds:[46D8F8]
>0045E08F    jne        0045E0AF
 0045E091    mov        eax,46AC48; ^'..'
 0045E096    call       @LStrClr
 0045E09B    mov        eax,46AC44; ^'.'
 0045E0A0    call       @LStrClr
 0045E0A5    mov        eax,46AC40; ^'*.*'
 0045E0AA    call       @LStrClr
 0045E0AF    xor        eax,eax
 0045E0B1    pop        edx
 0045E0B2    pop        ecx
 0045E0B3    pop        ecx
 0045E0B4    mov        dword ptr fs:[eax],edx
 0045E0B7    push       45E0C4
 0045E0BC    ret
<0045E0BD    jmp        @HandleFinally
<0045E0C2    jmp        0045E0BC
 0045E0C4    pop        ebp
 0045E0C5    ret
*}
end.