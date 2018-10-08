{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit main;

interface

uses
  Classes, Windows, Graphics, Forms, ExtCtrls, StdCtrls, Dialogs, ComCtrls, bmp32, Lang, Menus, NewGauge, AnimCtl, UrlLabel, Placemnt, Compressor;

type
  TfrmMain = class(TForm)
    Panel1:TPanel;//f2D0
    Panel2:TPanel;//f2D4
    Bevel1:TBevel;//f2D8
    Image1:TImage;//f2DC
    LabelVersion:TLabel;//f2E0
    LabelShareware:TLabel;//f2E4
    LabelTitle:TLabel;//f2E8
    OD:TOpenDialog;//f2EC
    SB:TStatusBar;//f2F0
    Label3:TLabel;//f2F4
    Label8:TLabel;//f2F8
    LrsBmp1:TLrsBmp;//f2FC
    Bevel6:TBevel;//f300
    LabelTrial:TLabel;//f304
    Lang:TLanguage;//f308
    VersionNumLabel:TLabel;//f30C
    PopMenu:TPopupMenu;//f310
    PageControl:TPageControl;//f314
    TabFileOpen:TTabSheet;//f318
    Bevel2:TBevel;//f31C
    BmpHistory:TLrsBmp;//f320
    LabelHistory:TLabel;//f324
    Panel3:TPanel;//f328
    LabelFileName:TLabel;//f32C
    FileNameLabel:TLabel;//f330
    FileSizeLabel:TLabel;//f334
    LabelFileSizeBefore:TLabel;//f338
    LabelFileSizeAfter:TLabel;//f33C
    LabelCompressionFileSize:TLabel;//f340
    Bevel7:TBevel;//f344
    PanelFileTitle:TPanel;//f348
    BtnOpen:TButton;//f34C
    TabCompress:TTabSheet;//f350
    Bevel3:TBevel;//f354
    LabelCompressFileSize:TLabel;//f358
    LabelProgress:TLabel;//f35C
    PB:TNewGauge;//f360
    PBRatio:TNewGauge;//f364
    BtnErase:TButton;//f368
    BtnTest:TButton;//f36C
    BtnRestore:TButton;//f370
    BtnCancel:TButton;//f374
    BtnGo:TButton;//f378
    AVI:TAnimateControl;//f37C
    TabOptions:TTabSheet;//f380
    Bevel4:TBevel;//f384
    LabelSectionName:TLabel;//f388
    LabelLang:TLabel;//f38C
    LabelUnregistered:TLabel;//f390
    CBResource:TCheckBox;//f394
    CBBackup:TCheckBox;//f398
    CBExit:TCheckBox;//f39C
    EditSection:TEdit;//f3A0
    CBImportLoader:TCheckBox;//f3A4
    CBContextMenu:TCheckBox;//f3A8
    CBAutoRun:TCheckBox;//f3AC
    CBExtraData:TCheckBox;//f3B0
    ComboLang:TComboBox;//f3B4
    TabAbout:TTabSheet;//f3B8
    Bevel5:TBevel;//f3BC
    LrsBmp2:TLrsBmp;//f3C0
    UrlLabelWWW:TUrlLabel;//f3C4
    UrlLabelMail:TUrlLabel;//f3C8
    LabelEMail:TLabel;//f3CC
    LabelWWW:TLabel;//f3D0
    UrlLabelRegistration:TUrlLabel;//f3D4
    Image2:TImage;//f3D8
    Label13:TLabel;//f3DC
    LrsBmp4:TLrsBmp;//f3E0
    LrsBmp5:TLrsBmp;//f3E4
    TabHelp:TTabSheet;//f3E8
    Bevel8:TBevel;//f3EC
    DownloadProgress:TNewGauge;//f3F0
    LabelUpdateStatus:TLabel;//f3F4
    btnCancelUpdate:TButton;//f3F8
    btnStartUpdate:TButton;//f3FC
    btnFAQ:TButton;//f400
    btnHelpContrents:TButton;//f404
    FS:TFormStorage;//f408
    CBAutoOpen:TCheckBox;//f40C
    CBMaxCompression:TCheckBox;//f410
    TabExit:TTabSheet;//f414
    procedure BtnGoClick;
    procedure BtnCancelClick;
    procedure BtnOpenClick;
    //procedure FormCreate(?:?);
    procedure BtnTestClick;
    procedure FormActivate;
    procedure FormDestroy;
    procedure BtnRestoreClick;
    procedure CBContextMenuClick;
    procedure BtnEraseClick;
    //procedure EditSectionExit(?:?);
    procedure ComboLangChange;
    procedure FSRestorePlacement;
    //procedure PageControlChange(?:?);
    //procedure LangTranslate(?:?; ?:?; ?:?);
    //procedure MenuClick(?:?);
    //procedure Label1MouseDown(?:?; ?:?);
    //procedure Label1MouseUp(?:?; ?:?);
    procedure btnHelpContrentsClick;
    procedure btnStartUpdateClick;
    procedure btnCancelUpdateClick;
    //procedure PageControlChanging(?:?);
    procedure btnFAQClick;
    procedure BmpHistoryClick;
  public
    f418:byte;//f418
    f41C:dword;//f41C
    f424:String;//f424
    f428:String;//f428
    f42C:TCompressor;//f42C
    f430:byte;//f430
    f431:byte;//f431
    f432:byte;//f432
    f433:byte;//f433
    f434:byte;//f434
    f435:byte;//f435
    f436:byte;//f436
  end;

implementation

{$R *.DFM}

//00465AC8
//function sub_00465AC8(?:?; ?:?):?;
//begin
{*
 00465AC8    push       ebp
 00465AC9    mov        ebp,esp
 00465ACB    add        esp,0FFFFFFE8
 00465ACE    push       ebx
 00465ACF    push       esi
 00465AD0    push       edi
 00465AD1    xor        eax,eax
 00465AD3    mov        dword ptr [ebp-14],eax
 00465AD6    mov        dword ptr [ebp-18],eax
 00465AD9    mov        esi,dword ptr [ebp+8]
 00465ADC    xor        eax,eax
 00465ADE    push       ebp
 00465ADF    push       465C20
 00465AE4    push       dword ptr fs:[eax]
 00465AE7    mov        dword ptr fs:[eax],esp
 00465AEA    xor        ebx,ebx
 00465AEC    mov        eax,[0046D974]
 00465AF1    cmp        byte ptr [eax+431],0
>00465AF8    je         00465B16
 00465AFA    mov        ebx,2
 00465AFF    mov        eax,[0046D974]
 00465B04    mov        eax,dword ptr [eax+360]
 00465B0A    xor        edx,edx
 00465B0C    call       TNewGauge.SetProgress
>00465B11    jmp        00465C05
 00465B16    mov        eax,[0046D974]
 00465B1B    mov        edi,dword ptr [eax+42C]
 00465B21    mov        eax,dword ptr [edi+84]
 00465B27    add        eax,esi
 00465B29    mov        dword ptr [ebp-8],eax
 00465B2C    xor        eax,eax
 00465B2E    mov        dword ptr [ebp-4],eax
 00465B31    fild       qword ptr [ebp-8]
 00465B34    mov        eax,dword ptr [edi+88]
 00465B3A    mov        dword ptr [ebp-10],eax
 00465B3D    xor        eax,eax
 00465B3F    mov        dword ptr [ebp-0C],eax
 00465B42    fild       qword ptr [ebp-10]
 00465B45    fdivp      st(1),st
 00465B47    fmul       dword ptr ds:[465C30]; 100:Single
 00465B4D    call       @ROUND
 00465B52    mov        edx,eax
 00465B54    mov        eax,[0046D974]
 00465B59    mov        eax,dword ptr [eax+360]
 00465B5F    call       TNewGauge.SetProgress
 00465B64    push       465C3C; 'ASPack - '
 00465B69    lea        edx,[ebp-18]
 00465B6C    mov        eax,[0046D974]
 00465B71    mov        eax,dword ptr [eax+360]
 00465B77    mov        eax,dword ptr [eax+130]
 00465B7D    call       IntToStr
 00465B82    push       dword ptr [ebp-18]
 00465B85    push       465C50; '%'
 00465B8A    lea        eax,[ebp-14]
 00465B8D    mov        edx,3
 00465B92    call       @LStrCatN
 00465B97    mov        edx,dword ptr [ebp-14]
 00465B9A    mov        eax,[0046C05C]; ^Application:TApplication
 00465B9F    mov        eax,dword ptr [eax]
 00465BA1    call       TApplication.SetTitle
 00465BA6    mov        eax,[0046D974]
 00465BAB    mov        edi,dword ptr [eax+42C]
 00465BB1    mov        eax,dword ptr [edi+8C]
 00465BB7    sub        esi,dword ptr [ebp+0C]
 00465BBA    add        eax,esi
 00465BBC    mov        dword ptr [ebp-8],eax
 00465BBF    xor        eax,eax
 00465BC1    mov        dword ptr [ebp-4],eax
 00465BC4    fild       qword ptr [ebp-8]
 00465BC7    mov        eax,dword ptr [edi+50]
 00465BCA    mov        dword ptr [ebp-10],eax
 00465BCD    xor        eax,eax
 00465BCF    mov        dword ptr [ebp-0C],eax
 00465BD2    fild       qword ptr [ebp-10]
 00465BD5    fdivp      st(1),st
 00465BD7    fmul       dword ptr ds:[465C30]; 100:Single
 00465BDD    call       @ROUND
 00465BE2    mov        edx,64
 00465BE7    sub        edx,eax
 00465BE9    mov        eax,[0046D974]
 00465BEE    mov        eax,dword ptr [eax+364]
 00465BF4    call       TNewGauge.SetProgress
 00465BF9    mov        eax,[0046C05C]; ^Application:TApplication
 00465BFE    mov        eax,dword ptr [eax]
 00465C00    call       TApplication.ProcessMessages
 00465C05    xor        eax,eax
 00465C07    pop        edx
 00465C08    pop        ecx
 00465C09    pop        ecx
 00465C0A    mov        dword ptr fs:[eax],edx
 00465C0D    push       465C27
 00465C12    lea        eax,[ebp-18]
 00465C15    mov        edx,2
 00465C1A    call       @LStrArrayClr
 00465C1F    ret
<00465C20    jmp        @HandleFinally
<00465C25    jmp        00465C12
 00465C27    mov        eax,ebx
 00465C29    pop        edi
 00465C2A    pop        esi
 00465C2B    pop        ebx
 00465C2C    mov        esp,ebp
 00465C2E    pop        ebp
 00465C2F    ret
*}
//end;

//00465C54
procedure TfrmMain.BtnGoClick;
begin
{*
 00465C54    push       ebp
 00465C55    mov        ebp,esp
 00465C57    push       ebx
 00465C58    mov        ebx,eax
 00465C5A    cmp        dword ptr [ebx+424],0; TfrmMain.?f424:String
>00465C61    jne        00465C6D
 00465C63    mov        eax,ebx
 00465C65    call       00468AA0
 00465C6A    pop        ebx
 00465C6B    pop        ebp
 00465C6C    ret
 00465C6D    mov        eax,ebx
 00465C6F    call       00467CB0
 00465C74    pop        ebx
 00465C75    pop        ebp
 00465C76    ret
*}
end;

//00465C78
procedure TfrmMain.BtnCancelClick;
begin
{*
 00465C78    mov        byte ptr [eax+431],1; TfrmMain.?f431:byte
 00465C7F    mov        eax,dword ptr [eax+42C]; TfrmMain.?f42C:TCompressor
 00465C85    mov        byte ptr [eax+94],1; TCompressor.?f94:byte
 00465C8C    ret
*}
end;

//00465C90
procedure TfrmMain.BtnOpenClick;
begin
{*
 00465C90    push       ebp
 00465C91    mov        ebp,esp
 00465C93    call       00468AA0
 00465C98    pop        ebp
 00465C99    ret
*}
end;

//00465C9C
function sub_00465C9C:LongBool;
begin
{*
 00465C9C    push       ebp
 00465C9D    mov        ebp,esp
 00465C9F    push       0
 00465CA1    mov        eax,[0046C05C]; ^Application:TApplication
 00465CA6    mov        eax,dword ptr [eax]
 00465CA8    mov        eax,dword ptr [eax+24]; TApplication.FHandle:HWND
 00465CAB    push       eax
 00465CAC    call       user32.ShowWindow
 00465CB1    pop        ebp
 00465CB2    ret
*}
end;

//00465CB4
//procedure TfrmMain.FormCreate(?:?);
//begin
{*
 00465CB4    push       ebp
 00465CB5    mov        ebp,esp
 00465CB7    mov        ecx,11
 00465CBC    push       0
 00465CBE    push       0
 00465CC0    dec        ecx
<00465CC1    jne        00465CBC
 00465CC3    push       ecx
 00465CC4    push       ebx
 00465CC5    push       esi
 00465CC6    push       edi
 00465CC7    mov        dword ptr [ebp-8],edx
 00465CCA    mov        dword ptr [ebp-4],eax
 00465CCD    xor        eax,eax
 00465CCF    push       ebp
 00465CD0    push       4662AB
 00465CD5    push       dword ptr fs:[eax]
 00465CD8    mov        dword ptr fs:[eax],esp
 00465CDB    mov        eax,dword ptr [ebp-4]
 00465CDE    mov        edx,dword ptr [eax+318]; TfrmMain.TabFileOpen:TTabSheet
 00465CE4    mov        eax,dword ptr [ebp-4]
 00465CE7    mov        eax,dword ptr [eax+314]; TfrmMain.PageControl:TPageControl
 00465CED    call       TPageControl.SetActivePage
 00465CF2    mov        eax,46BDF0; ^FlatSB_GetScrollInfo:function(val hWnd:Windows.HWND;val BarFlag:System.Integer;var ScrollInfo:Windows.TScrollInfo):Windows.BOOL stdcall
 00465CF7    sub        eax,64
 00465CFA    push       dword ptr [eax]
 00465CFC    inc        dword ptr [esp]
 00465CFF    pop        eax
 00465D00    or         eax,eax
>00465D02    jne        00465D0E
 00465D04    mov        eax,46D774
 00465D09    add        eax,64
 00465D0C    xor        dword ptr [eax],eax
 00465D0E    lea        edx,[ebp-2C]
 00465D11    mov        eax,dword ptr [ebp-4]
 00465D14    mov        ebx,dword ptr [eax+304]; TfrmMain.LabelTrial:TLabel
 00465D1A    mov        eax,ebx
 00465D1C    call       TControl.GetText
 00465D21    push       dword ptr [ebp-2C]
 00465D24    push       4662C4; '\r\n'
 00465D29    mov        eax,[0046BD8C]
 00465D2E    xor        edx,edx
 00465D30    push       edx
 00465D31    push       eax
 00465D32    lea        eax,[ebp-30]
 00465D35    call       IntToStr
 00465D3A    push       dword ptr [ebp-30]
 00465D3D    push       4662D0; ' days'
 00465D42    lea        eax,[ebp-28]
 00465D45    mov        edx,4
 00465D4A    call       @LStrCatN
 00465D4F    mov        edx,dword ptr [ebp-28]
 00465D52    mov        eax,ebx
 00465D54    call       TControl.SetText
 00465D59    mov        ecx,dword ptr ds:[46D974]
 00465D5F    mov        dl,1
 00465D61    mov        eax,[00464390]; THelpRouter
 00465D66    call       THelpRouter.Create; THelpRouter.Create
 00465D6B    mov        [0046D978],eax; gvar_0046D978:THelpRouter
 00465D70    mov        edx,1
 00465D75    mov        eax,[0046D978]; gvar_0046D978:THelpRouter
 00465D7A    call       THelpRouter.SetHelpType
 00465D7F    lea        edx,[ebp-38]
 00465D82    xor        eax,eax
 00465D84    call       ParamStr
 00465D89    mov        eax,dword ptr [ebp-38]
 00465D8C    lea        edx,[ebp-34]
 00465D8F    call       ExtractFilePath
 00465D94    mov        edx,dword ptr [ebp-34]
 00465D97    mov        eax,[0046C05C]; ^Application:TApplication
 00465D9C    mov        eax,dword ptr [eax]
 00465D9E    add        eax,40; TApplication.?f40:String
 00465DA1    mov        ecx,4662E0; 'Aspack.chm'
 00465DA6    call       @LStrCat3
 00465DAB    mov        eax,[0046C05C]; ^Application:TApplication
 00465DB0    mov        eax,dword ptr [eax]
 00465DB2    mov        dword ptr [eax+64],1388; TApplication.FHintHidePause:Integer
 00465DB9    mov        eax,dword ptr [ebp-4]
 00465DBC    mov        byte ptr [eax+430],0; TfrmMain.?f430:byte
 00465DC3    mov        eax,dword ptr [ebp-4]
 00465DC6    mov        eax,dword ptr [eax+408]; TfrmMain.FS:TFormStorage
 00465DCC    mov        byte ptr [eax+24],0; TFormStorage.Active:Boolean
 00465DD0    mov        eax,dword ptr [ebp-4]
 00465DD3    mov        eax,dword ptr [eax+3A0]; TfrmMain.EditSection:TEdit
 00465DD9    xor        edx,edx
 00465DDB    mov        ecx,dword ptr [eax]
 00465DDD    call       dword ptr [ecx+5C]; TControl.SetEnabled
 00465DE0    lea        edx,[ebp-3C]
 00465DE3    mov        eax,[0046C05C]; ^Application:TApplication
 00465DE8    mov        eax,dword ptr [eax]
 00465DEA    call       TApplication.GetExeName
 00465DEF    mov        ecx,dword ptr [ebp-3C]
 00465DF2    mov        dl,1
 00465DF4    mov        eax,[00464D24]; TVersionInfo
 00465DF9    call       TVersionInfo.Create; TVersionInfo.Create
 00465DFE    mov        ebx,eax
 00465E00    lea        edx,[ebp-40]
 00465E03    mov        eax,dword ptr [ebp-4]
 00465E06    call       TControl.GetText
 00465E0B    lea        eax,[ebp-40]
 00465E0E    push       eax
 00465E0F    lea        edx,[ebp-44]
 00465E12    mov        eax,ebx
 00465E14    call       004650AC
 00465E19    mov        edx,dword ptr [ebp-44]
 00465E1C    pop        eax
 00465E1D    call       @LStrCat
 00465E22    mov        edx,dword ptr [ebp-40]
 00465E25    mov        eax,dword ptr [ebp-4]
 00465E28    call       TControl.SetText
 00465E2D    lea        edx,[ebp-48]
 00465E30    mov        eax,ebx
 00465E32    call       004650AC
 00465E37    mov        edx,dword ptr [ebp-48]
 00465E3A    mov        eax,dword ptr [ebp-4]
 00465E3D    mov        eax,dword ptr [eax+30C]; TfrmMain.VersionNumLabel:TLabel
 00465E43    call       TControl.SetText
 00465E48    mov        eax,ebx
 00465E4A    call       TObject.Free
 00465E4F    mov        dl,1
 00465E51    mov        eax,[0044E6A4]; TRegistry
 00465E56    call       TRegistry.Create; TRegistry.Create
 00465E5B    mov        dword ptr [ebp-1C],eax
 00465E5E    xor        eax,eax
 00465E60    push       ebp
 00465E61    push       465EE2
 00465E66    push       dword ptr fs:[eax]
 00465E69    mov        dword ptr fs:[eax],esp
 00465E6C    mov        cl,1
 00465E6E    mov        edx,4662F4; 'SOFTWARE\\ASPack'
 00465E73    mov        eax,dword ptr [ebp-1C]
 00465E76    call       TRegistry.OpenKey
 00465E7B    lea        ecx,[ebp-4C]
 00465E7E    mov        edx,46630C; 'VersionNum'
 00465E83    mov        eax,dword ptr [ebp-1C]
 00465E86    call       TRegistry.ReadString
 00465E8B    mov        eax,dword ptr [ebp-4C]
 00465E8E    push       eax
 00465E8F    lea        edx,[ebp-50]
 00465E92    mov        eax,dword ptr [ebp-4]
 00465E95    mov        eax,dword ptr [eax+30C]; TfrmMain.VersionNumLabel:TLabel
 00465E9B    call       TControl.GetText
 00465EA0    mov        edx,dword ptr [ebp-50]
 00465EA3    pop        eax
 00465EA4    call       @LStrCmp
>00465EA9    je         00465ECC
 00465EAB    lea        edx,[ebp-54]
 00465EAE    mov        eax,dword ptr [ebp-4]
 00465EB1    mov        eax,dword ptr [eax+30C]; TfrmMain.VersionNumLabel:TLabel
 00465EB7    call       TControl.GetText
 00465EBC    mov        ecx,dword ptr [ebp-54]
 00465EBF    mov        edx,46630C; 'VersionNum'
 00465EC4    mov        eax,dword ptr [ebp-1C]
 00465EC7    call       TRegistry.WriteString
 00465ECC    xor        eax,eax
 00465ECE    pop        edx
 00465ECF    pop        ecx
 00465ED0    pop        ecx
 00465ED1    mov        dword ptr fs:[eax],edx
 00465ED4    push       465EE9
 00465ED9    mov        eax,dword ptr [ebp-1C]
 00465EDC    call       TObject.Free
 00465EE1    ret
<00465EE2    jmp        @HandleFinally
<00465EE7    jmp        00465ED9
 00465EE9    mov        eax,dword ptr [ebp-4]
 00465EEC    mov        byte ptr [eax+432],0; TfrmMain.?f432:byte
 00465EF3    mov        eax,dword ptr [ebp-4]
 00465EF6    mov        byte ptr [eax+433],0; TfrmMain.?f433:byte
 00465EFD    mov        eax,dword ptr [ebp-4]
 00465F00    mov        byte ptr [eax+434],0; TfrmMain.?f434:byte
 00465F07    mov        eax,dword ptr [ebp-4]
 00465F0A    mov        byte ptr [eax+435],0; TfrmMain.?f435:byte
 00465F11    mov        eax,dword ptr [ebp-4]
 00465F14    mov        byte ptr [eax+436],0; TfrmMain.?f436:byte
 00465F1B    mov        eax,dword ptr [ebp-4]
 00465F1E    mov        eax,dword ptr [eax+37C]; TfrmMain.AVI:TAnimateControl
 00465F24    xor        edx,edx
 00465F26    call       TControl.SetVisible
 00465F2B    mov        eax,dword ptr [ebp-4]
 00465F2E    mov        eax,dword ptr [eax+408]; TfrmMain.FS:TFormStorage
 00465F34    mov        byte ptr [eax+24],0; TFormStorage.Active:Boolean
 00465F38    mov        eax,dword ptr [ebp-4]
 00465F3B    mov        eax,dword ptr [eax+3A0]; TfrmMain.EditSection:TEdit
 00465F41    xor        edx,edx
 00465F43    mov        ecx,dword ptr [eax]
 00465F45    call       dword ptr [ecx+5C]; TControl.SetEnabled
 00465F48    nop
 00465F49    nop
 00465F4A    nop
 00465F4B    nop
 00465F4C    nop
 00465F4D    nop
 00465F4E    nop
 00465F4F    nop
 00465F50    nop
 00465F51    nop
 00465F52    nop
 00465F53    nop
 00465F54    mov        eax,dword ptr [ebp-4]
 00465F57    mov        eax,dword ptr [eax+304]; TfrmMain.LabelTrial:TLabel
 00465F5D    mov        eax,dword ptr [eax+58]; TLabel.FFont:TFont
 00465F60    xor        edx,edx
 00465F62    call       TFont.SetColor
 00465F67    lea        edx,[ebp-50]
 00465F6A    mov        eax,[0046C924]; ^gvar_0046CE00:PChar
 00465F6F    call       StrPas
 00465F74    mov        edx,dword ptr [ebp-50]
 00465F77    mov        eax,dword ptr [ebp-4]
 00465F7A    mov        eax,dword ptr [eax+304]; TfrmMain.LabelTrial:TLabel
 00465F80    call       TControl.SetText
 00465F85    mov        eax,dword ptr [ebp-4]
 00465F88    mov        eax,dword ptr [eax+390]; TfrmMain.LabelUnregistered:TLabel
 00465F8E    call       TControl.Hide
 00465F93    mov        dl,1
 00465F95    mov        eax,dword ptr [ebp-4]
 00465F98    mov        eax,dword ptr [eax+3A0]; TfrmMain.EditSection:TEdit
 00465F9E    call       TControl.SetEnabled
 00465FA3    mov        dl,1
 00465FA5    mov        eax,dword ptr [ebp-4]
 00465FA8    mov        eax,dword ptr [eax+39C]; TfrmMain.CBExit:TCheckBox
 00465FAE    call       TControl.SetEnabled
 00465FB3    mov        dl,1
 00465FB5    mov        eax,dword ptr [ebp-4]
 00465FB8    mov        eax,dword ptr [eax+410]; TfrmMain.CBMaxCompression:TCheckBox
 00465FBE    call       TControl.SetEnabled
 00465FC3    mov        eax,dword ptr [ebp-4]
 00465FC6    mov        eax,dword ptr [eax+408]; TfrmMain.FS:TFormStorage
 00465FCC    mov        byte ptr [eax+24],1; TFormStorage.Active:Boolean
 00465FD0    nop
 00465FD1    nop
 00465FD2    nop
 00465FD3    nop
 00465FD4    nop
 00465FD5    nop
 00465FD6    nop
 00465FD7    nop
 00465FD8    nop
 00465FD9    nop
 00465FDA    nop
 00465FDB    nop
 00465FDC    mov        dl,1
 00465FDE    mov        eax,[0044E6A4]; TRegistry
 00465FE3    call       TRegistry.Create; TRegistry.Create
 00465FE8    mov        dword ptr [ebp-20],eax
 00465FEB    xor        eax,eax
 00465FED    push       ebp
 00465FEE    push       466042
 00465FF3    push       dword ptr fs:[eax]
 00465FF6    mov        dword ptr fs:[eax],esp
 00465FF9    mov        cl,1
 00465FFB    mov        edx,466320; 'Software\\ASPack\\Options'
 00466000    mov        eax,dword ptr [ebp-20]
 00466003    call       TRegistry.OpenKey
 00466008    lea        ecx,[ebp-5C]
 0046600B    mov        edx,466340; 'Lang_LanguageFile'
 00466010    mov        eax,dword ptr [ebp-20]
 00466013    call       TRegistry.ReadString
 00466018    mov        edx,dword ptr [ebp-5C]
 0046601B    mov        eax,dword ptr [ebp-4]
 0046601E    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00466024    add        eax,24; TLanguage.?f24:String
 00466027    call       @LStrAsg
 0046602C    xor        eax,eax
 0046602E    pop        edx
 0046602F    pop        ecx
 00466030    pop        ecx
 00466031    mov        dword ptr fs:[eax],edx
 00466034    push       466049
 00466039    mov        eax,dword ptr [ebp-20]
 0046603C    call       TObject.Free
 00466041    ret
<00466042    jmp        @HandleFinally
<00466047    jmp        00466039
 00466049    mov        dword ptr [ebp-0C],0FFFFFFFF
 00466050    mov        ecx,dword ptr ds:[46C05C]; ^Application:TApplication
 00466056    mov        ecx,dword ptr [ecx]
 00466058    mov        dl,1
 0046605A    mov        eax,[0045D7D0]; TFileSearch
 0046605F    call       TFileSearch.Create; TFileSearch.Create
 00466064    mov        dword ptr [ebp-18],eax
 00466067    xor        eax,eax
 00466069    push       ebp
 0046606A    push       466213
 0046606F    push       dword ptr fs:[eax]
 00466072    mov        dword ptr fs:[eax],esp
 00466075    lea        edx,[ebp-64]
 00466078    xor        eax,eax
 0046607A    call       ParamStr
 0046607F    mov        eax,dword ptr [ebp-64]
 00466082    lea        edx,[ebp-60]
 00466085    call       ExtractFilePath
 0046608A    lea        eax,[ebp-60]
 0046608D    mov        edx,46635C; '*.ini'
 00466092    call       @LStrCat
 00466097    mov        edx,dword ptr [ebp-60]
 0046609A    mov        eax,dword ptr [ebp-18]
 0046609D    add        eax,48; TFileSearch.SearchFile:ShortString
 004660A0    mov        ecx,0FF
 004660A5    call       @LStrToString
 004660AA    mov        eax,dword ptr [ebp-4]
 004660AD    mov        al,byte ptr [eax+436]; TfrmMain.?f436:byte
 004660B3    mov        edx,dword ptr [ebp-18]
 004660B6    mov        byte ptr [edx+24],al; TFileSearch.RecurseSubFolders:Boolean
 004660B9    mov        eax,dword ptr [ebp-18]
 004660BC    call       0045DA0C
 004660C1    mov        eax,dword ptr [ebp-18]
 004660C4    mov        eax,dword ptr [eax+28]; TFileSearch.FilesFound:TStringList
 004660C7    mov        edx,dword ptr [eax]
 004660C9    call       dword ptr [edx+14]; TStringList.GetCount
 004660CC    test       eax,eax
>004660CE    jle        004661FD
 004660D4    mov        eax,dword ptr [ebp-18]
 004660D7    mov        eax,dword ptr [eax+28]; TFileSearch.FilesFound:TStringList
 004660DA    mov        edx,dword ptr [eax]
 004660DC    call       dword ptr [edx+14]; TStringList.GetCount
 004660DF    dec        eax
 004660E0    test       ax,ax
>004660E3    jb         004661FD
 004660E9    inc        eax
 004660EA    mov        word ptr [ebp-22],ax
 004660EE    xor        ebx,ebx
 004660F0    lea        eax,[ebp-68]
 004660F3    push       eax
 004660F4    lea        ecx,[ebp-74]
 004660F7    movzx      esi,bx
 004660FA    mov        edx,esi
 004660FC    mov        eax,dword ptr [ebp-18]
 004660FF    mov        eax,dword ptr [eax+28]; TFileSearch.FilesFound:TStringList
 00466102    mov        edi,dword ptr [eax]
 00466104    call       dword ptr [edi+0C]; TStringList.Get
 00466107    mov        eax,dword ptr [ebp-74]
 0046610A    lea        edx,[ebp-70]
 0046610D    call       ExtractFileName
 00466112    mov        eax,dword ptr [ebp-70]
 00466115    lea        edx,[ebp-6C]
 00466118    call       LowerCase
 0046611D    mov        edx,dword ptr [ebp-6C]
 00466120    mov        eax,46636C; '.ini'
 00466125    call       @LStrPos
 0046612A    dec        eax
 0046612B    push       eax
 0046612C    lea        ecx,[ebp-7C]
 0046612F    mov        edx,esi
 00466131    mov        eax,dword ptr [ebp-18]
 00466134    mov        eax,dword ptr [eax+28]; TFileSearch.FilesFound:TStringList
 00466137    mov        edi,dword ptr [eax]
 00466139    call       dword ptr [edi+0C]; TStringList.Get
 0046613C    mov        eax,dword ptr [ebp-7C]
 0046613F    lea        edx,[ebp-78]
 00466142    call       ExtractFileName
 00466147    mov        eax,dword ptr [ebp-78]
 0046614A    mov        edx,1
 0046614F    pop        ecx
 00466150    call       @LStrCopy
 00466155    mov        eax,dword ptr [ebp-68]
 00466158    lea        edx,[ebp-10]
 0046615B    call       LowerCase
 00466160    lea        eax,[ebp-10]
 00466163    call       UniqueString
 00466168    mov        edx,dword ptr [ebp-10]
 0046616B    mov        dl,byte ptr [edx]
 0046616D    sub        dl,20
 00466170    mov        byte ptr [eax],dl
 00466172    mov        eax,dword ptr [ebp-4]
 00466175    mov        eax,dword ptr [eax+3B4]; TfrmMain.ComboLang:TComboBox
 0046617B    mov        eax,dword ptr [eax+1F0]; TComboBox.FItems:TStrings
 00466181    mov        edx,dword ptr [ebp-10]
 00466184    mov        ecx,dword ptr [eax]
 00466186    call       dword ptr [ecx+34]; TStrings.Add
 00466189    lea        ecx,[ebp-80]
 0046618C    mov        edx,esi
 0046618E    mov        eax,dword ptr [ebp-18]
 00466191    mov        eax,dword ptr [eax+28]; TFileSearch.FilesFound:TStringList
 00466194    mov        edi,dword ptr [eax]
 00466196    call       dword ptr [edi+0C]; TStringList.Get
 00466199    mov        eax,dword ptr [ebp-80]
 0046619C    lea        edx,[ebp-14]
 0046619F    call       ExtractFileName
 004661A4    lea        edx,[ebp-84]
 004661AA    mov        eax,dword ptr [ebp-14]
 004661AD    call       UpperCase
 004661B2    mov        eax,dword ptr [ebp-84]
 004661B8    push       eax
 004661B9    lea        edx,[ebp-8C]
 004661BF    mov        eax,dword ptr [ebp-4]
 004661C2    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 004661C8    mov        eax,dword ptr [eax+24]; TLanguage.?f24:String
 004661CB    call       ExtractFileName
 004661D0    mov        eax,dword ptr [ebp-8C]
 004661D6    lea        edx,[ebp-88]
 004661DC    call       UpperCase
 004661E1    mov        edx,dword ptr [ebp-88]
 004661E7    pop        eax
 004661E8    call       @LStrCmp
>004661ED    jne        004661F2
 004661EF    mov        dword ptr [ebp-0C],esi
 004661F2    inc        ebx
 004661F3    dec        word ptr [ebp-22]
<004661F7    jne        004660F0
 004661FD    xor        eax,eax
 004661FF    pop        edx
 00466200    pop        ecx
 00466201    pop        ecx
 00466202    mov        dword ptr fs:[eax],edx
 00466205    push       46621A
 0046620A    mov        eax,dword ptr [ebp-18]
 0046620D    call       TObject.Free
 00466212    ret
<00466213    jmp        @HandleFinally
<00466218    jmp        0046620A
 0046621A    cmp        dword ptr [ebp-0C],0FFFFFFFF
>0046621E    je         00466231
 00466220    mov        eax,dword ptr [ebp-4]
 00466223    mov        eax,dword ptr [eax+3B4]; TfrmMain.ComboLang:TComboBox
 00466229    mov        edx,dword ptr [ebp-0C]
 0046622C    call       TCustomComboBox.SetItemIndex
 00466231    mov        edx,dword ptr [ebp-8]
 00466234    mov        eax,dword ptr [ebp-4]
 00466237    call       TfrmMain.ComboLangChange
 0046623C    mov        eax,dword ptr [ebp-4]
 0046623F    call       004664B8
 00466244    xor        eax,eax
 00466246    pop        edx
 00466247    pop        ecx
 00466248    pop        ecx
 00466249    mov        dword ptr fs:[eax],edx
 0046624C    push       4662B2
 00466251    lea        eax,[ebp-8C]
 00466257    mov        edx,0E
 0046625C    call       @LStrArrayClr
 00466261    lea        eax,[ebp-54]
 00466264    mov        edx,2
 00466269    call       @LStrArrayClr
 0046626E    lea        eax,[ebp-4C]
 00466271    mov        edx,3
 00466276    call       @LStrArrayClr
 0046627B    lea        eax,[ebp-40]
 0046627E    call       @LStrClr
 00466283    lea        eax,[ebp-3C]
 00466286    mov        edx,4
 0046628B    call       @LStrArrayClr
 00466290    lea        eax,[ebp-2C]
 00466293    mov        edx,2
 00466298    call       @LStrArrayClr
 0046629D    lea        eax,[ebp-14]
 004662A0    mov        edx,2
 004662A5    call       @LStrArrayClr
 004662AA    ret
<004662AB    jmp        @HandleFinally
<004662B0    jmp        00466251
 004662B2    pop        edi
 004662B3    pop        esi
 004662B4    pop        ebx
 004662B5    mov        esp,ebp
 004662B7    pop        ebp
 004662B8    ret
*}
//end;

//00466374
procedure TfrmMain.BtnTestClick;
begin
{*
 00466374    push       ebp
 00466375    mov        ebp,esp
 00466377    add        esp,0FFFFFFA8
 0046637A    push       ebx
 0046637B    xor        ecx,ecx
 0046637D    mov        dword ptr [ebp-58],ecx
 00466380    mov        ebx,eax
 00466382    xor        eax,eax
 00466384    push       ebp
 00466385    push       466465
 0046638A    push       dword ptr fs:[eax]
 0046638D    mov        dword ptr fs:[eax],esp
 00466390    lea        eax,[ebp-44]
 00466393    xor        ecx,ecx
 00466395    mov        edx,44
 0046639A    call       @FillChar
 0046639F    mov        dword ptr [ebp-44],44
 004663A6    lea        eax,[ebp-54]
 004663A9    push       eax
 004663AA    lea        eax,[ebp-44]
 004663AD    push       eax
 004663AE    push       0
 004663B0    push       0
 004663B2    push       0
 004663B4    push       0
 004663B6    push       0
 004663B8    push       0
 004663BA    mov        eax,dword ptr [ebx+424]; TfrmMain.?f424:String
 004663C0    call       @LStrToPChar
 004663C5    push       eax
 004663C6    push       0
 004663C8    call       kernel32.CreateProcessA
 004663CD    test       eax,eax
>004663CF    jne        0046640B
 004663D1    push       2030
 004663D6    lea        ecx,[ebp-58]
 004663D9    mov        eax,[0046D974]
 004663DE    mov        eax,dword ptr [eax+308]
 004663E4    mov        edx,46647C; '08'
 004663E9    call       0045D424
 004663EE    mov        eax,dword ptr [ebp-58]
 004663F1    call       @LStrToPChar
 004663F6    mov        edx,eax
 004663F8    mov        ecx,466480; 'Error'
 004663FD    mov        eax,[0046C05C]; ^Application:TApplication
 00466402    mov        eax,dword ptr [eax]
 00466404    call       TApplication.MessageBox
>00466409    jmp        00466428
 0046640B    push       0FF
 0046640D    mov        eax,dword ptr [ebp-54]
 00466410    push       eax
 00466411    call       kernel32.WaitForSingleObject
 00466416    mov        eax,dword ptr [ebp-54]
 00466419    push       eax
 0046641A    call       kernel32.CloseHandle
 0046641F    mov        eax,dword ptr [ebp-50]
 00466422    push       eax
 00466423    call       kernel32.CloseHandle
 00466428    xor        edx,edx
 0046642A    mov        eax,dword ptr [ebx+36C]; TfrmMain.BtnTest:TButton
 00466430    call       TControl.SetVisible
 00466435    mov        dl,1
 00466437    mov        eax,dword ptr [ebx+370]; TfrmMain.BtnRestore:TButton
 0046643D    call       TControl.SetVisible
 00466442    mov        dl,1
 00466444    mov        eax,dword ptr [ebx+368]; TfrmMain.BtnErase:TButton
 0046644A    call       TControl.SetVisible
 0046644F    xor        eax,eax
 00466451    pop        edx
 00466452    pop        ecx
 00466453    pop        ecx
 00466454    mov        dword ptr fs:[eax],edx
 00466457    push       46646C
 0046645C    lea        eax,[ebp-58]
 0046645F    call       @LStrClr
 00466464    ret
<00466465    jmp        @HandleFinally
<0046646A    jmp        0046645C
 0046646C    pop        ebx
 0046646D    mov        esp,ebp
 0046646F    pop        ebp
 00466470    ret
*}
end;

//00466488
procedure TfrmMain.FormActivate;
begin
{*
 00466488    push       ebp
 00466489    mov        ebp,esp
 0046648B    push       ebx
 0046648C    mov        ebx,eax
 0046648E    mov        edx,dword ptr [ebx+318]; TfrmMain.TabFileOpen:TTabSheet
 00466494    mov        eax,dword ptr [ebx+314]; TfrmMain.PageControl:TPageControl
 0046649A    call       TPageControl.SetActivePage
 0046649F    mov        eax,dword ptr [ebx+34C]; TfrmMain.BtnOpen:TButton
 004664A5    mov        edx,dword ptr [eax]
 004664A7    call       dword ptr [edx+0B0]; TWinControl.SetFocus
 004664AD    mov        eax,ebx
 004664AF    call       004683A0
 004664B4    pop        ebx
 004664B5    pop        ebp
 004664B6    ret
*}
end;

//004664B8
//procedure sub_004664B8(?:TfrmMain);
//begin
{*
 004664B8    push       ebp
 004664B9    mov        ebp,esp
 004664BB    xor        ecx,ecx
 004664BD    push       ecx
 004664BE    push       ecx
 004664BF    push       ecx
 004664C0    push       ecx
 004664C1    push       ebx
 004664C2    push       esi
 004664C3    push       edi
 004664C4    mov        esi,eax
 004664C6    xor        eax,eax
 004664C8    push       ebp
 004664C9    push       46658C
 004664CE    push       dword ptr fs:[eax]
 004664D1    mov        dword ptr fs:[eax],esp
 004664D4    mov        ecx,4665A4; 'aspack.ini'
 004664D9    mov        dl,1
 004664DB    mov        eax,[0044DA94]; TIniFile
 004664E0    call       TCustomIniFile.Create; TIniFile.Create
 004664E5    mov        dword ptr [ebp-8],eax
 004664E8    xor        eax,eax
 004664EA    push       ebp
 004664EB    push       466562
 004664F0    push       dword ptr fs:[eax]
 004664F3    mov        dword ptr fs:[eax],esp
 004664F6    xor        ebx,ebx
 004664F8    lea        eax,[ebp-4]
 004664FB    call       @LStrClr
 00466500    push       0
 00466502    lea        eax,[ebp-4]
 00466505    push       eax
 00466506    lea        edx,[ebp-10]
 00466509    mov        eax,ebx
 0046650B    call       IntToStr
 00466510    mov        ecx,dword ptr [ebp-10]
 00466513    lea        eax,[ebp-0C]
 00466516    mov        edx,4665B8; 'Item'
 0046651B    call       @LStrCat3
 00466520    mov        ecx,dword ptr [ebp-0C]
 00466523    mov        edx,4665C8; 'PopMenuHistory'
 00466528    mov        eax,dword ptr [ebp-8]
 0046652B    mov        edi,dword ptr [eax]
 0046652D    call       dword ptr [edi]; TIniFile.ReadString
 0046652F    mov        eax,dword ptr [ebp-4]
 00466532    call       FileExists
 00466537    test       al,al
>00466539    je         00466545
 0046653B    mov        edx,dword ptr [ebp-4]
 0046653E    mov        eax,esi
 00466540    call       00468988
 00466545    inc        ebx
 00466546    cmp        dword ptr [ebp-4],0
<0046654A    jne        00466500
 0046654C    xor        eax,eax
 0046654E    pop        edx
 0046654F    pop        ecx
 00466550    pop        ecx
 00466551    mov        dword ptr fs:[eax],edx
 00466554    push       466569
 00466559    mov        eax,dword ptr [ebp-8]
 0046655C    call       TObject.Free
 00466561    ret
<00466562    jmp        @HandleFinally
<00466567    jmp        00466559
 00466569    xor        eax,eax
 0046656B    pop        edx
 0046656C    pop        ecx
 0046656D    pop        ecx
 0046656E    mov        dword ptr fs:[eax],edx
 00466571    push       466593
 00466576    lea        eax,[ebp-10]
 00466579    mov        edx,2
 0046657E    call       @LStrArrayClr
 00466583    lea        eax,[ebp-4]
 00466586    call       @LStrClr
 0046658B    ret
<0046658C    jmp        @HandleFinally
<00466591    jmp        00466576
 00466593    pop        edi
 00466594    pop        esi
 00466595    pop        ebx
 00466596    mov        esp,ebp
 00466598    pop        ebp
 00466599    ret
*}
//end;

//004665D8
//procedure sub_004665D8(?:TfrmMain);
//begin
{*
 004665D8    push       ebp
 004665D9    mov        ebp,esp
 004665DB    add        esp,0FFFFFFF0
 004665DE    push       ebx
 004665DF    push       esi
 004665E0    push       edi
 004665E1    xor        edx,edx
 004665E3    mov        dword ptr [ebp-0C],edx
 004665E6    mov        dword ptr [ebp-10],edx
 004665E9    mov        dword ptr [ebp-4],eax
 004665EC    xor        eax,eax
 004665EE    push       ebp
 004665EF    push       4666B7
 004665F4    push       dword ptr fs:[eax]
 004665F7    mov        dword ptr fs:[eax],esp
 004665FA    mov        ecx,4666D0; 'aspack.ini'
 004665FF    mov        dl,1
 00466601    mov        eax,[0044DA94]; TIniFile
 00466606    call       TCustomIniFile.Create; TIniFile.Create
 0046660B    mov        dword ptr [ebp-8],eax
 0046660E    xor        eax,eax
 00466610    push       ebp
 00466611    push       466695
 00466616    push       dword ptr fs:[eax]
 00466619    mov        dword ptr fs:[eax],esp
 0046661C    xor        esi,esi
 0046661E    mov        eax,dword ptr [ebp-4]
 00466621    mov        eax,dword ptr [eax+310]; TfrmMain.PopMenu:TPopupMenu
 00466627    mov        eax,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 0046662A    call       TMenuItem.GetCount
 0046662F    mov        ebx,eax
 00466631    dec        ebx
 00466632    cmp        ebx,0
>00466635    jl         0046667F
 00466637    mov        eax,dword ptr [ebp-4]
 0046663A    mov        eax,dword ptr [eax+310]; TfrmMain.PopMenu:TPopupMenu
 00466640    mov        eax,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 00466643    mov        edx,ebx
 00466645    call       TMenuItem.GetItem
 0046664A    mov        eax,dword ptr [eax+24]; TMenuItem.?f24:String
 0046664D    push       eax
 0046664E    lea        edx,[ebp-10]
 00466651    mov        eax,esi
 00466653    call       IntToStr
 00466658    mov        ecx,dword ptr [ebp-10]
 0046665B    lea        eax,[ebp-0C]
 0046665E    mov        edx,4666E4; 'Item'
 00466663    call       @LStrCat3
 00466668    mov        ecx,dword ptr [ebp-0C]
 0046666B    mov        edx,4666F4; 'PopMenuHistory'
 00466670    mov        eax,dword ptr [ebp-8]
 00466673    mov        edi,dword ptr [eax]
 00466675    call       dword ptr [edi+4]; TIniFile.WriteString
 00466678    inc        esi
 00466679    dec        ebx
 0046667A    cmp        ebx,0FFFFFFFF
<0046667D    jne        00466637
 0046667F    xor        eax,eax
 00466681    pop        edx
 00466682    pop        ecx
 00466683    pop        ecx
 00466684    mov        dword ptr fs:[eax],edx
 00466687    push       46669C
 0046668C    mov        eax,dword ptr [ebp-8]
 0046668F    call       TObject.Free
 00466694    ret
<00466695    jmp        @HandleFinally
<0046669A    jmp        0046668C
 0046669C    xor        eax,eax
 0046669E    pop        edx
 0046669F    pop        ecx
 004666A0    pop        ecx
 004666A1    mov        dword ptr fs:[eax],edx
 004666A4    push       4666BE
 004666A9    lea        eax,[ebp-10]
 004666AC    mov        edx,2
 004666B1    call       @LStrArrayClr
 004666B6    ret
<004666B7    jmp        @HandleFinally
<004666BC    jmp        004666A9
 004666BE    pop        edi
 004666BF    pop        esi
 004666C0    pop        ebx
 004666C1    mov        esp,ebp
 004666C3    pop        ebp
 004666C4    ret
*}
//end;

//00466704
procedure TfrmMain.FormDestroy;
begin
{*
 00466704    push       ebp
 00466705    mov        ebp,esp
 00466707    call       004665D8
 0046670C    mov        eax,[0046D978]; gvar_0046D978:THelpRouter
 00466711    call       TObject.Free
 00466716    mov        eax,[0046D970]; gvar_0046D970
 0046671B    call       @Halt
 00466720    pop        ebp
 00466721    ret
*}
end;

//00466724
procedure TfrmMain.BtnRestoreClick;
begin
{*
 00466724    push       ebp
 00466725    mov        ebp,esp
 00466727    xor        ecx,ecx
 00466729    push       ecx
 0046672A    push       ecx
 0046672B    push       ecx
 0046672C    push       ecx
 0046672D    push       ecx
 0046672E    push       ecx
 0046672F    push       ebx
 00466730    push       esi
 00466731    mov        ebx,eax
 00466733    xor        eax,eax
 00466735    push       ebp
 00466736    push       46683E
 0046673B    push       dword ptr fs:[eax]
 0046673E    mov        dword ptr fs:[eax],esp
 00466741    mov        eax,dword ptr [ebx+398]; TfrmMain.CBBackup:TCheckBox
 00466747    mov        edx,dword ptr [eax]
 00466749    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 0046674F    test       al,al
>00466751    jne        0046678B
 00466753    push       2030
 00466758    lea        ecx,[ebp-8]
 0046675B    mov        edx,466854; '10'
 00466760    mov        eax,dword ptr [ebx+308]; TfrmMain.Lang:TLanguage
 00466766    call       0045D424
 0046676B    mov        eax,dword ptr [ebp-8]
 0046676E    call       @LStrToPChar
 00466773    mov        edx,eax
 00466775    mov        ecx,466858; 'Error'
 0046677A    mov        eax,[0046C05C]; ^Application:TApplication
 0046677F    mov        eax,dword ptr [eax]
 00466781    call       TApplication.MessageBox
>00466786    jmp        00466823
 0046678B    lea        eax,[ebp-4]
 0046678E    mov        ecx,466868; '.bak'
 00466793    mov        edx,dword ptr [ebx+424]; TfrmMain.?f424:String
 00466799    call       @LStrCat3
 0046679E    mov        eax,dword ptr [ebx+424]; TfrmMain.?f424:String
 004667A4    call       DeleteFile
 004667A9    lea        eax,[ebp-0C]
 004667AC    push       eax
 004667AD    lea        edx,[ebp-10]
 004667B0    mov        eax,dword ptr [ebp-4]
 004667B3    call       ExtractFileName
 004667B8    mov        eax,dword ptr [ebp-10]
 004667BB    call       @LStrLen
 004667C0    mov        esi,eax
 004667C2    lea        edx,[ebp-14]
 004667C5    mov        eax,dword ptr [ebp-4]
 004667C8    call       ExtractFileExt
 004667CD    mov        eax,dword ptr [ebp-14]
 004667D0    call       @LStrLen
 004667D5    sub        esi,eax
 004667D7    push       esi
 004667D8    lea        edx,[ebp-18]
 004667DB    mov        eax,dword ptr [ebp-4]
 004667DE    call       ExtractFileName
 004667E3    mov        eax,dword ptr [ebp-18]
 004667E6    mov        edx,1
 004667EB    pop        ecx
 004667EC    call       @LStrCopy
 004667F1    mov        edx,dword ptr [ebp-0C]
 004667F4    mov        eax,dword ptr [ebp-4]
 004667F7    call       RenameFile
 004667FC    xor        edx,edx
 004667FE    mov        eax,dword ptr [ebx+36C]; TfrmMain.BtnTest:TButton
 00466804    call       TControl.SetVisible
 00466809    xor        edx,edx
 0046680B    mov        eax,dword ptr [ebx+370]; TfrmMain.BtnRestore:TButton
 00466811    call       TControl.SetVisible
 00466816    xor        edx,edx
 00466818    mov        eax,dword ptr [ebx+368]; TfrmMain.BtnErase:TButton
 0046681E    call       TControl.SetVisible
 00466823    xor        eax,eax
 00466825    pop        edx
 00466826    pop        ecx
 00466827    pop        ecx
 00466828    mov        dword ptr fs:[eax],edx
 0046682B    push       466845
 00466830    lea        eax,[ebp-18]
 00466833    mov        edx,6
 00466838    call       @LStrArrayClr
 0046683D    ret
<0046683E    jmp        @HandleFinally
<00466843    jmp        00466830
 00466845    pop        esi
 00466846    pop        ebx
 00466847    mov        esp,ebp
 00466849    pop        ebp
 0046684A    ret
*}
end;

//00466870
procedure TfrmMain.CBContextMenuClick;
begin
{*
 00466870    push       ebp
 00466871    mov        ebp,esp
 00466873    mov        ecx,0C
 00466878    push       0
 0046687A    push       0
 0046687C    dec        ecx
<0046687D    jne        00466878
 0046687F    push       ecx
 00466880    push       ebx
 00466881    push       esi
 00466882    mov        esi,eax
 00466884    xor        eax,eax
 00466886    push       ebp
 00466887    push       466CAD
 0046688C    push       dword ptr fs:[eax]
 0046688F    mov        dword ptr fs:[eax],esp
 00466892    mov        eax,dword ptr [esi+314]; TfrmMain.PageControl:TPageControl
 00466898    mov        eax,dword ptr [eax+244]; TPageControl.ActivePage:TTabSheet
 0046689E    cmp        eax,dword ptr [esi+380]; TfrmMain.TabOptions:TTabSheet
>004668A4    jne        00466C53
 004668AA    mov        ecx,dword ptr ds:[46C05C]; ^Application:TApplication
 004668B0    mov        ecx,dword ptr [ecx]
 004668B2    mov        dl,1
 004668B4    mov        eax,[0045B064]; TfrmContext
 004668B9    call       TCustomForm.Create; TfrmContext.Create
 004668BE    mov        dword ptr [ebp-4],eax
 004668C1    xor        eax,eax
 004668C3    push       ebp
 004668C4    push       466C4C
 004668C9    push       dword ptr fs:[eax]
 004668CC    mov        dword ptr fs:[eax],esp
 004668CF    mov        eax,dword ptr [esi+308]; TfrmMain.Lang:TLanguage
 004668D5    call       0045D198
 004668DA    mov        eax,dword ptr [esi+3A8]; TfrmMain.CBContextMenu:TCheckBox
 004668E0    mov        edx,dword ptr [eax]
 004668E2    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 004668E8    test       al,al
>004668EA    je         0046690A
 004668EC    mov        eax,dword ptr [ebp-4]
 004668EF    mov        edx,dword ptr [eax]
 004668F1    call       dword ptr [edx+0D8]; TCustomForm.ShowModal
 004668F7    dec        eax
>004668F8    je         0046690A
 004668FA    mov        eax,dword ptr [esi+3A8]; TfrmMain.CBContextMenu:TCheckBox
 00466900    xor        edx,edx
 00466902    mov        ecx,dword ptr [eax]
 00466904    call       dword ptr [ecx+0B8]; TCustomCheckBox.SetChecked
 0046690A    mov        dl,1
 0046690C    mov        eax,[0044E6A4]; TRegistry
 00466911    call       TRegistry.Create; TRegistry.Create
 00466916    mov        ebx,eax
 00466918    mov        eax,dword ptr [esi+3A8]; TfrmMain.CBContextMenu:TCheckBox
 0046691E    mov        edx,dword ptr [eax]
 00466920    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 00466926    test       al,al
>00466928    je         00466BAF
 0046692E    mov        eax,dword ptr [ebp-4]
 00466931    mov        eax,dword ptr [eax+2DC]; TfrmContext.CBEXE:TCheckBox
 00466937    mov        edx,dword ptr [eax]
 00466939    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 0046693F    test       al,al
>00466941    je         004669F1
 00466947    mov        edx,80000000
 0046694C    mov        eax,ebx
 0046694E    call       TRegistry.SetRootKey
 00466953    push       466CC4; 'exefile\\shell\\'
 00466958    lea        edx,[ebp-10]
 0046695B    mov        eax,dword ptr [ebp-4]
 0046695E    mov        eax,dword ptr [eax+2E4]; TfrmContext.LabelCompressText:TEdit
 00466964    call       TControl.GetText
 00466969    mov        eax,dword ptr [ebp-10]
 0046696C    lea        edx,[ebp-0C]
 0046696F    call       Trim
 00466974    push       dword ptr [ebp-0C]
 00466977    push       466CDC; '\\Command'
 0046697C    lea        eax,[ebp-8]
 0046697F    mov        edx,3
 00466984    call       @LStrCatN
 00466989    mov        edx,dword ptr [ebp-8]
 0046698C    mov        cl,1
 0046698E    mov        eax,ebx
 00466990    call       TRegistry.OpenKey
 00466995    test       al,al
>00466997    je         004669EA
 00466999    lea        edx,[ebp-1C]
 0046699C    xor        eax,eax
 0046699E    call       ParamStr
 004669A3    mov        eax,dword ptr [ebp-1C]
 004669A6    lea        edx,[ebp-18]
 004669A9    call       ExtractFilePath
 004669AE    push       dword ptr [ebp-18]
 004669B1    lea        edx,[ebp-24]
 004669B4    xor        eax,eax
 004669B6    call       ParamStr
 004669BB    mov        eax,dword ptr [ebp-24]
 004669BE    lea        edx,[ebp-20]
 004669C1    call       ExtractFileName
 004669C6    push       dword ptr [ebp-20]
 004669C9    push       466CF0; ' \"%1\"'
 004669CE    lea        eax,[ebp-14]
 004669D1    mov        edx,3
 004669D6    call       @LStrCatN
 004669DB    mov        ecx,dword ptr [ebp-14]
 004669DE    mov        edx,466D00; '\0'
 004669E3    mov        eax,ebx
 004669E5    call       TRegistry.WriteString
 004669EA    mov        eax,ebx
 004669EC    call       TRegistry.CloseKey
 004669F1    mov        eax,dword ptr [ebp-4]
 004669F4    mov        eax,dword ptr [eax+2E0]; TfrmContext.CBDLL:TCheckBox
 004669FA    mov        edx,dword ptr [eax]
 004669FC    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 00466A02    test       al,al
>00466A04    je         00466AB4
 00466A0A    mov        edx,80000000
 00466A0F    mov        eax,ebx
 00466A11    call       TRegistry.SetRootKey
 00466A16    push       466D0C; 'dllfile\\shell\\'
 00466A1B    lea        edx,[ebp-30]
 00466A1E    mov        eax,dword ptr [ebp-4]
 00466A21    mov        eax,dword ptr [eax+2E4]; TfrmContext.LabelCompressText:TEdit
 00466A27    call       TControl.GetText
 00466A2C    mov        eax,dword ptr [ebp-30]
 00466A2F    lea        edx,[ebp-2C]
 00466A32    call       Trim
 00466A37    push       dword ptr [ebp-2C]
 00466A3A    push       466CDC; '\\Command'
 00466A3F    lea        eax,[ebp-28]
 00466A42    mov        edx,3
 00466A47    call       @LStrCatN
 00466A4C    mov        edx,dword ptr [ebp-28]
 00466A4F    mov        cl,1
 00466A51    mov        eax,ebx
 00466A53    call       TRegistry.OpenKey
 00466A58    test       al,al
>00466A5A    je         00466AAD
 00466A5C    lea        edx,[ebp-3C]
 00466A5F    xor        eax,eax
 00466A61    call       ParamStr
 00466A66    mov        eax,dword ptr [ebp-3C]
 00466A69    lea        edx,[ebp-38]
 00466A6C    call       ExtractFilePath
 00466A71    push       dword ptr [ebp-38]
 00466A74    lea        edx,[ebp-44]
 00466A77    xor        eax,eax
 00466A79    call       ParamStr
 00466A7E    mov        eax,dword ptr [ebp-44]
 00466A81    lea        edx,[ebp-40]
 00466A84    call       ExtractFileName
 00466A89    push       dword ptr [ebp-40]
 00466A8C    push       466CF0; ' \"%1\"'
 00466A91    lea        eax,[ebp-34]
 00466A94    mov        edx,3
 00466A99    call       @LStrCatN
 00466A9E    mov        ecx,dword ptr [ebp-34]
 00466AA1    mov        edx,466D00; '\0'
 00466AA6    mov        eax,ebx
 00466AA8    call       TRegistry.WriteString
 00466AAD    mov        eax,ebx
 00466AAF    call       TRegistry.CloseKey
 00466AB4    mov        eax,dword ptr [ebp-4]
 00466AB7    mov        eax,dword ptr [eax+2F0]; TfrmContext.CBOCX:TCheckBox
 00466ABD    mov        edx,dword ptr [eax]
 00466ABF    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 00466AC5    test       al,al
>00466AC7    je         00466C2D
 00466ACD    mov        edx,80000000
 00466AD2    mov        eax,ebx
 00466AD4    call       TRegistry.SetRootKey
 00466AD9    mov        cl,1
 00466ADB    mov        edx,466D24; '.ocx'
 00466AE0    mov        eax,ebx
 00466AE2    call       TRegistry.OpenKey
 00466AE7    test       al,al
>00466AE9    je         00466AFC
 00466AEB    mov        ecx,466D34; 'ocxfile'
 00466AF0    mov        edx,466D00; '\0'
 00466AF5    mov        eax,ebx
 00466AF7    call       TRegistry.WriteString
 00466AFC    mov        eax,ebx
 00466AFE    call       TRegistry.CloseKey
 00466B03    mov        edx,80000000
 00466B08    mov        eax,ebx
 00466B0A    call       TRegistry.SetRootKey
 00466B0F    push       466D44; 'ocxfile\\shell\\'
 00466B14    lea        edx,[ebp-50]
 00466B17    mov        eax,dword ptr [ebp-4]
 00466B1A    mov        eax,dword ptr [eax+2E4]; TfrmContext.LabelCompressText:TEdit
 00466B20    call       TControl.GetText
 00466B25    mov        eax,dword ptr [ebp-50]
 00466B28    lea        edx,[ebp-4C]
 00466B2B    call       Trim
 00466B30    push       dword ptr [ebp-4C]
 00466B33    push       466CDC; '\\Command'
 00466B38    lea        eax,[ebp-48]
 00466B3B    mov        edx,3
 00466B40    call       @LStrCatN
 00466B45    mov        edx,dword ptr [ebp-48]
 00466B48    mov        cl,1
 00466B4A    mov        eax,ebx
 00466B4C    call       TRegistry.OpenKey
 00466B51    test       al,al
>00466B53    je         00466BA6
 00466B55    lea        edx,[ebp-5C]
 00466B58    xor        eax,eax
 00466B5A    call       ParamStr
 00466B5F    mov        eax,dword ptr [ebp-5C]
 00466B62    lea        edx,[ebp-58]
 00466B65    call       ExtractFilePath
 00466B6A    push       dword ptr [ebp-58]
 00466B6D    lea        edx,[ebp-64]
 00466B70    xor        eax,eax
 00466B72    call       ParamStr
 00466B77    mov        eax,dword ptr [ebp-64]
 00466B7A    lea        edx,[ebp-60]
 00466B7D    call       ExtractFileName
 00466B82    push       dword ptr [ebp-60]
 00466B85    push       466CF0; ' \"%1\"'
 00466B8A    lea        eax,[ebp-54]
 00466B8D    mov        edx,3
 00466B92    call       @LStrCatN
 00466B97    mov        ecx,dword ptr [ebp-54]
 00466B9A    mov        edx,466D00; '\0'
 00466B9F    mov        eax,ebx
 00466BA1    call       TRegistry.WriteString
 00466BA6    mov        eax,ebx
 00466BA8    call       TRegistry.CloseKey
>00466BAD    jmp        00466C2D
 00466BAF    mov        edx,80000000
 00466BB4    mov        eax,ebx
 00466BB6    call       TRegistry.SetRootKey
 00466BBB    mov        edx,466D5C; 'exefile\\shell'
 00466BC0    mov        eax,ebx
 00466BC2    call       TRegistry.DeleteKey
 00466BC7    mov        edx,80000000
 00466BCC    mov        eax,ebx
 00466BCE    call       TRegistry.SetRootKey
 00466BD3    mov        cl,1
 00466BD5    mov        edx,466D74; 'exefile\\shell\\Open\\Command'
 00466BDA    mov        eax,ebx
 00466BDC    call       TRegistry.OpenKey
 00466BE1    test       al,al
>00466BE3    je         00466BF6
 00466BE5    mov        ecx,466D98; '\"%1\" %*'
 00466BEA    mov        edx,466D00; '\0'
 00466BEF    mov        eax,ebx
 00466BF1    call       TRegistry.WriteString
 00466BF6    mov        eax,ebx
 00466BF8    call       TRegistry.CloseKey
 00466BFD    mov        edx,80000000
 00466C02    mov        eax,ebx
 00466C04    call       TRegistry.SetRootKey
 00466C09    mov        edx,466DA8; 'dllfile\\shell'
 00466C0E    mov        eax,ebx
 00466C10    call       TRegistry.DeleteKey
 00466C15    mov        edx,80000000
 00466C1A    mov        eax,ebx
 00466C1C    call       TRegistry.SetRootKey
 00466C21    mov        edx,466DC0; 'ocxfile\\shell'
 00466C26    mov        eax,ebx
 00466C28    call       TRegistry.DeleteKey
 00466C2D    mov        dl,1
 00466C2F    mov        eax,ebx
 00466C31    mov        ecx,dword ptr [eax]
 00466C33    call       dword ptr [ecx-4]; TRegistry.Destroy
 00466C36    xor        eax,eax
 00466C38    pop        edx
 00466C39    pop        ecx
 00466C3A    pop        ecx
 00466C3B    mov        dword ptr fs:[eax],edx
 00466C3E    push       466C53
 00466C43    mov        eax,dword ptr [ebp-4]
 00466C46    call       TObject.Free
 00466C4B    ret
<00466C4C    jmp        @HandleFinally
<00466C51    jmp        00466C43
 00466C53    xor        eax,eax
 00466C55    pop        edx
 00466C56    pop        ecx
 00466C57    pop        ecx
 00466C58    mov        dword ptr fs:[eax],edx
 00466C5B    push       466CB4
 00466C60    lea        eax,[ebp-64]
 00466C63    mov        edx,5
 00466C68    call       @LStrArrayClr
 00466C6D    lea        eax,[ebp-50]
 00466C70    call       @LStrClr
 00466C75    lea        eax,[ebp-4C]
 00466C78    mov        edx,7
 00466C7D    call       @LStrArrayClr
 00466C82    lea        eax,[ebp-30]
 00466C85    call       @LStrClr
 00466C8A    lea        eax,[ebp-2C]
 00466C8D    mov        edx,7
 00466C92    call       @LStrArrayClr
 00466C97    lea        eax,[ebp-10]
 00466C9A    call       @LStrClr
 00466C9F    lea        eax,[ebp-0C]
 00466CA2    mov        edx,2
 00466CA7    call       @LStrArrayClr
 00466CAC    ret
<00466CAD    jmp        @HandleFinally
<00466CB2    jmp        00466C60
 00466CB4    pop        esi
 00466CB5    pop        ebx
 00466CB6    mov        esp,ebp
 00466CB8    pop        ebp
 00466CB9    ret
*}
end;

//00466DD0
procedure TfrmMain.BtnEraseClick;
begin
{*
 00466DD0    push       ebp
 00466DD1    mov        ebp,esp
 00466DD3    push       0
 00466DD5    push       ebx
 00466DD6    mov        ebx,eax
 00466DD8    xor        eax,eax
 00466DDA    push       ebp
 00466DDB    push       466E3E
 00466DE0    push       dword ptr fs:[eax]
 00466DE3    mov        dword ptr fs:[eax],esp
 00466DE6    lea        eax,[ebp-4]
 00466DE9    mov        ecx,466E54; '.bak'
 00466DEE    mov        edx,dword ptr [ebx+424]; TfrmMain.?f424:String
 00466DF4    call       @LStrCat3
 00466DF9    mov        eax,dword ptr [ebp-4]
 00466DFC    call       DeleteFile
 00466E01    xor        edx,edx
 00466E03    mov        eax,dword ptr [ebx+36C]; TfrmMain.BtnTest:TButton
 00466E09    call       TControl.SetVisible
 00466E0E    xor        edx,edx
 00466E10    mov        eax,dword ptr [ebx+370]; TfrmMain.BtnRestore:TButton
 00466E16    call       TControl.SetVisible
 00466E1B    xor        edx,edx
 00466E1D    mov        eax,dword ptr [ebx+368]; TfrmMain.BtnErase:TButton
 00466E23    call       TControl.SetVisible
 00466E28    xor        eax,eax
 00466E2A    pop        edx
 00466E2B    pop        ecx
 00466E2C    pop        ecx
 00466E2D    mov        dword ptr fs:[eax],edx
 00466E30    push       466E45
 00466E35    lea        eax,[ebp-4]
 00466E38    call       @LStrClr
 00466E3D    ret
<00466E3E    jmp        @HandleFinally
<00466E43    jmp        00466E35
 00466E45    pop        ebx
 00466E46    pop        ecx
 00466E47    pop        ebp
 00466E48    ret
*}
end;

//00466E5C
//procedure TfrmMain.EditSectionExit(?:?);
//begin
{*
 00466E5C    push       ebp
 00466E5D    mov        ebp,esp
 00466E5F    push       0
 00466E61    push       0
 00466E63    push       ebx
 00466E64    push       esi
 00466E65    mov        ebx,edx
 00466E67    xor        eax,eax
 00466E69    push       ebp
 00466E6A    push       466EDC
 00466E6F    push       dword ptr fs:[eax]
 00466E72    mov        dword ptr fs:[eax],esp
 00466E75    mov        eax,ebx
 00466E77    mov        edx,dword ptr ds:[420C5C]; TEdit
 00466E7D    call       @AsClass
 00466E82    mov        esi,eax
 00466E84    mov        eax,esi
 00466E86    lea        edx,[ebp-8]
 00466E89    call       TControl.GetText
 00466E8E    mov        eax,dword ptr [ebp-8]
 00466E91    lea        edx,[ebp-4]
 00466E94    call       Trim
 00466E99    mov        eax,dword ptr [ebp-4]
 00466E9C    call       @LStrLen
 00466EA1    test       eax,eax
>00466EA3    jne        00466EBE
 00466EA5    mov        eax,ebx
 00466EA7    mov        edx,dword ptr ds:[420C5C]; TEdit
 00466EAD    call       @AsClass
 00466EB2    mov        eax,esi
 00466EB4    mov        edx,466EF4; '.data'
 00466EB9    call       TControl.SetText
 00466EBE    xor        eax,eax
 00466EC0    pop        edx
 00466EC1    pop        ecx
 00466EC2    pop        ecx
 00466EC3    mov        dword ptr fs:[eax],edx
 00466EC6    push       466EE3
 00466ECB    lea        eax,[ebp-8]
 00466ECE    call       @LStrClr
 00466ED3    lea        eax,[ebp-4]
 00466ED6    call       @LStrClr
 00466EDB    ret
<00466EDC    jmp        @HandleFinally
<00466EE1    jmp        00466ECB
 00466EE3    pop        esi
 00466EE4    pop        ebx
 00466EE5    pop        ecx
 00466EE6    pop        ecx
 00466EE7    pop        ebp
 00466EE8    ret
*}
//end;

//00466EFC
procedure TfrmMain.ComboLangChange;
begin
{*
 00466EFC    push       ebp
 00466EFD    mov        ebp,esp
 00466EFF    mov        ecx,7
 00466F04    push       0
 00466F06    push       0
 00466F08    dec        ecx
<00466F09    jne        00466F04
 00466F0B    mov        dword ptr [ebp-4],eax
 00466F0E    xor        eax,eax
 00466F10    push       ebp
 00466F11    push       46718C
 00466F16    push       dword ptr fs:[eax]
 00466F19    mov        dword ptr fs:[eax],esp
 00466F1C    lea        edx,[ebp-18]
 00466F1F    mov        eax,dword ptr [ebp-4]
 00466F22    mov        eax,dword ptr [eax+3B4]; TfrmMain.ComboLang:TComboBox
 00466F28    call       TControl.GetText
 00466F2D    mov        eax,dword ptr [ebp-18]
 00466F30    lea        edx,[ebp-14]
 00466F33    call       Trim
 00466F38    cmp        dword ptr [ebp-14],0
>00466F3C    je         00466F8C
 00466F3E    lea        edx,[ebp-20]
 00466F41    mov        eax,[0046C05C]; ^Application:TApplication
 00466F46    mov        eax,dword ptr [eax]
 00466F48    call       TApplication.GetExeName
 00466F4D    mov        eax,dword ptr [ebp-20]
 00466F50    lea        edx,[ebp-1C]
 00466F53    call       ExtractFilePath
 00466F58    push       dword ptr [ebp-1C]
 00466F5B    lea        edx,[ebp-24]
 00466F5E    mov        eax,dword ptr [ebp-4]
 00466F61    mov        eax,dword ptr [eax+3B4]; TfrmMain.ComboLang:TComboBox
 00466F67    call       TControl.GetText
 00466F6C    push       dword ptr [ebp-24]
 00466F6F    push       4671A0; '.ini'
 00466F74    mov        eax,dword ptr [ebp-4]
 00466F77    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00466F7D    add        eax,24; TLanguage.?f24:String
 00466F80    mov        edx,3
 00466F85    call       @LStrCatN
>00466F8A    jmp        00466FBF
 00466F8C    lea        edx,[ebp-2C]
 00466F8F    mov        eax,[0046C05C]; ^Application:TApplication
 00466F94    mov        eax,dword ptr [eax]
 00466F96    call       TApplication.GetExeName
 00466F9B    mov        eax,dword ptr [ebp-2C]
 00466F9E    lea        edx,[ebp-28]
 00466FA1    call       ExtractFilePath
 00466FA6    mov        edx,dword ptr [ebp-28]
 00466FA9    mov        eax,dword ptr [ebp-4]
 00466FAC    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00466FB2    add        eax,24; TLanguage.?f24:String
 00466FB5    mov        ecx,4671B0; 'english.ini'
 00466FBA    call       @LStrCat3
 00466FBF    mov        eax,dword ptr [ebp-4]
 00466FC2    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00466FC8    mov        eax,dword ptr [eax+24]; TLanguage.?f24:String
 00466FCB    call       FileExists
 00466FD0    test       al,al
>00466FD2    jne        0046711C
 00466FD8    mov        ecx,dword ptr ds:[46C05C]; ^Application:TApplication
 00466FDE    mov        ecx,dword ptr [ecx]
 00466FE0    mov        dl,1
 00466FE2    mov        eax,[0044C814]; TOpenDialog
 00466FE7    call       TOpenDialog.Create; TOpenDialog.Create
 00466FEC    mov        dword ptr [ebp-0C],eax
 00466FEF    xor        eax,eax
 00466FF1    push       ebp
 00466FF2    push       4670E9
 00466FF7    push       dword ptr fs:[eax]
 00466FFA    mov        dword ptr fs:[eax],esp
 00466FFD    mov        eax,dword ptr [ebp-0C]
 00467000    add        eax,58; TOpenDialog.?f58:String
 00467003    mov        edx,4671C4; 'Language files|*.ini'
 00467008    call       @LStrAsg
 0046700D    mov        eax,dword ptr [ebp-0C]
 00467010    add        eax,68; TOpenDialog.?f68:String
 00467013    mov        edx,4671E4; 'Please, choose the english.ini or another language file'
 00467018    call       @LStrAsg
 0046701D    lea        edx,[ebp-34]
 00467020    xor        eax,eax
 00467022    call       ParamStr
 00467027    mov        eax,dword ptr [ebp-34]
 0046702A    lea        edx,[ebp-30]
 0046702D    call       ExtractFilePath
 00467032    mov        edx,dword ptr [ebp-30]
 00467035    mov        eax,dword ptr [ebp-0C]
 00467038    call       TOpenDialog.SetInitialDir
 0046703D    mov        eax,dword ptr [ebp-0C]
 00467040    mov        edx,dword ptr [eax]
 00467042    call       dword ptr [edx+3C]; TOpenDialog.Execute
 00467045    mov        byte ptr [ebp-5],al
 00467048    cmp        byte ptr [ebp-5],0
>0046704C    je         004670D3
 00467052    lea        edx,[ebp-38]
 00467055    mov        eax,dword ptr [ebp-0C]
 00467058    call       TOpenDialog.GetFileName
 0046705D    mov        edx,dword ptr [ebp-38]
 00467060    mov        eax,dword ptr [ebp-4]
 00467063    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00467069    add        eax,24; TLanguage.?f24:String
 0046706C    call       @LStrAsg
 00467071    mov        dl,1
 00467073    mov        eax,[0044E6A4]; TRegistry
 00467078    call       TRegistry.Create; TRegistry.Create
 0046707D    mov        dword ptr [ebp-10],eax
 00467080    xor        eax,eax
 00467082    push       ebp
 00467083    push       4670CC
 00467088    push       dword ptr fs:[eax]
 0046708B    mov        dword ptr fs:[eax],esp
 0046708E    mov        cl,1
 00467090    mov        edx,467224; 'Software\\ASPack\\Options'
 00467095    mov        eax,dword ptr [ebp-10]
 00467098    call       TRegistry.OpenKey
 0046709D    mov        eax,dword ptr [ebp-4]
 004670A0    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 004670A6    mov        ecx,dword ptr [eax+24]; TLanguage.?f24:String
 004670A9    mov        edx,467244; 'Lang_LanguageFile'
 004670AE    mov        eax,dword ptr [ebp-10]
 004670B1    call       TRegistry.WriteString
 004670B6    xor        eax,eax
 004670B8    pop        edx
 004670B9    pop        ecx
 004670BA    pop        ecx
 004670BB    mov        dword ptr fs:[eax],edx
 004670BE    push       4670D3
 004670C3    mov        eax,dword ptr [ebp-10]
 004670C6    call       TObject.Free
 004670CB    ret
<004670CC    jmp        @HandleFinally
<004670D1    jmp        004670C3
 004670D3    xor        eax,eax
 004670D5    pop        edx
 004670D6    pop        ecx
 004670D7    pop        ecx
 004670D8    mov        dword ptr fs:[eax],edx
 004670DB    push       4670F0
 004670E0    mov        eax,dword ptr [ebp-0C]
 004670E3    call       TObject.Free
 004670E8    ret
<004670E9    jmp        @HandleFinally
<004670EE    jmp        004670E0
 004670F0    cmp        byte ptr [ebp-5],0
>004670F4    jne        0046711C
 004670F6    push       10
 004670F8    push       467258
 004670FD    push       467260
 00467102    mov        eax,dword ptr [ebp-4]
 00467105    call       TWinControl.GetHandle
 0046710A    push       eax
 0046710B    call       user32.MessageBoxA
 00467110    mov        eax,[0046C05C]; ^Application:TApplication
 00467115    mov        eax,dword ptr [eax]
 00467117    call       TApplication.Terminate
 0046711C    mov        eax,dword ptr [ebp-4]
 0046711F    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00467125    call       0045D198
 0046712A    mov        eax,dword ptr [ebp-4]
 0046712D    mov        eax,dword ptr [eax+3B4]; TfrmMain.ComboLang:TComboBox
 00467133    call       TCustomComboBox.GetItemIndex
 00467138    mov        edx,dword ptr [ebp-4]
 0046713B    mov        edx,dword ptr [edx+308]; TfrmMain.Lang:TLanguage
 00467141    mov        dword ptr [edx+0C],eax; TLanguage.Tag:Integer
 00467144    xor        eax,eax
 00467146    pop        edx
 00467147    pop        ecx
 00467148    pop        ecx
 00467149    mov        dword ptr fs:[eax],edx
 0046714C    push       467193
 00467151    lea        eax,[ebp-38]
 00467154    call       @LStrClr
 00467159    lea        eax,[ebp-34]
 0046715C    mov        edx,4
 00467161    call       @LStrArrayClr
 00467166    lea        eax,[ebp-24]
 00467169    call       @LStrClr
 0046716E    lea        eax,[ebp-20]
 00467171    mov        edx,2
 00467176    call       @LStrArrayClr
 0046717B    lea        eax,[ebp-18]
 0046717E    call       @LStrClr
 00467183    lea        eax,[ebp-14]
 00467186    call       @LStrClr
 0046718B    ret
<0046718C    jmp        @HandleFinally
<00467191    jmp        00467151
 00467193    mov        esp,ebp
 00467195    pop        ebp
 00467196    ret
*}
end;

//00467298
procedure TfrmMain.FSRestorePlacement;
begin
{*
 00467298    push       ebp
 00467299    mov        ebp,esp
 0046729B    mov        edx,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 004672A1    mov        edx,dword ptr [edx+0C]; TLanguage.Tag:Integer
 004672A4    mov        eax,dword ptr [eax+3B4]; TfrmMain.ComboLang:TComboBox
 004672AA    call       TCustomComboBox.SetItemIndex
 004672AF    pop        ebp
 004672B0    ret
*}
end;

//004672B4
//procedure TfrmMain.PageControlChange(?:?);
//begin
{*
 004672B4    push       ebp
 004672B5    mov        ebp,esp
 004672B7    push       ebx
 004672B8    push       esi
 004672B9    push       edi
 004672BA    mov        esi,edx
 004672BC    mov        ebx,eax
 004672BE    mov        eax,esi
 004672C0    mov        edx,dword ptr ds:[451F68]; TPageControl
 004672C6    call       @AsClass
 004672CB    mov        edi,eax
 004672CD    mov        eax,dword ptr [edi+244]; TPageControl.ActivePage:TTabSheet
 004672D3    cmp        eax,dword ptr [ebx+414]; TfrmMain.TabExit:TTabSheet
>004672D9    jne        004672E2
 004672DB    mov        eax,ebx
 004672DD    call       TCustomForm.Close
 004672E2    mov        eax,esi
 004672E4    mov        edx,dword ptr ds:[451F68]; TPageControl
 004672EA    call       @AsClass
 004672EF    mov        eax,dword ptr [edi+244]; TPageControl.ActivePage:TTabSheet
 004672F5    cmp        eax,dword ptr [ebx+3E8]; TfrmMain.TabHelp:TTabSheet
>004672FB    jne        00467320
 004672FD    push       10
 004672FF    call       user32.GetKeyState
 00467304    movsx      eax,ax
 00467307    cmp        eax,0FFFFFF81
>0046730A    jg         00467320
 0046730C    mov        eax,dword ptr [ebx+414]; TfrmMain.TabExit:TTabSheet
 00467312    mov        dl,byte ptr [eax+1F8]; TTabSheet.TabVisible:Boolean
 00467318    xor        dl,1
 0046731B    call       TTabSheet.SetTabVisible
 00467320    pop        edi
 00467321    pop        esi
 00467322    pop        ebx
 00467323    pop        ebp
 00467324    ret
*}
//end;

//00467328
//procedure sub_00467328(?:TfrmMain);
//begin
{*
 00467328    push       ebp
 00467329    mov        ebp,esp
 0046732B    mov        ecx,13
 00467330    push       0
 00467332    push       0
 00467334    dec        ecx
<00467335    jne        00467330
 00467337    push       ebx
 00467338    push       esi
 00467339    mov        ebx,eax
 0046733B    mov        esi,46D974
 00467340    xor        eax,eax
 00467342    push       ebp
 00467343    push       467933
 00467348    push       dword ptr fs:[eax]
 0046734B    mov        dword ptr fs:[eax],esp
 0046734E    mov        byte ptr [ebx+418],0; TfrmMain.?f418:byte
 00467355    mov        byte ptr [ebx+432],0; TfrmMain.?f432:byte
 0046735C    lea        edx,[ebp-10]
 0046735F    mov        eax,1
 00467364    call       ParamStr
 00467369    mov        eax,dword ptr [ebp-10]
 0046736C    lea        edx,[ebp-0C]
 0046736F    call       UpperCase
 00467374    mov        eax,dword ptr [ebp-0C]
 00467377    mov        edx,467948; '/H'
 0046737C    call       @LStrCmp
>00467381    je         004673FC
 00467383    lea        edx,[ebp-18]
 00467386    mov        eax,1
 0046738B    call       ParamStr
 00467390    mov        eax,dword ptr [ebp-18]
 00467393    lea        edx,[ebp-14]
 00467396    call       UpperCase
 0046739B    mov        eax,dword ptr [ebp-14]
 0046739E    mov        edx,467954; '-H'
 004673A3    call       @LStrCmp
>004673A8    je         004673FC
 004673AA    lea        edx,[ebp-20]
 004673AD    mov        eax,1
 004673B2    call       ParamStr
 004673B7    mov        eax,dword ptr [ebp-20]
 004673BA    lea        edx,[ebp-1C]
 004673BD    call       UpperCase
 004673C2    mov        eax,dword ptr [ebp-1C]
 004673C5    mov        edx,467960; '-HELP'
 004673CA    call       @LStrCmp
>004673CF    je         004673FC
 004673D1    lea        edx,[ebp-28]
 004673D4    mov        eax,1
 004673D9    call       ParamStr
 004673DE    mov        eax,dword ptr [ebp-28]
 004673E1    lea        edx,[ebp-24]
 004673E4    call       UpperCase
 004673E9    mov        eax,dword ptr [ebp-24]
 004673EC    mov        edx,467970; '/HELP'
 004673F1    call       @LStrCmp
>004673F6    jne        0046759A
 004673FC    push       40
 004673FE    lea        ecx,[ebp-30]
 00467401    mov        eax,dword ptr [esi]
 00467403    mov        eax,dword ptr [eax+308]
 00467409    mov        edx,467980; 'H01'
 0046740E    call       0045D424
 00467413    push       dword ptr [ebp-30]
 00467416    lea        ecx,[ebp-34]
 00467419    mov        eax,dword ptr [esi]
 0046741B    mov        eax,dword ptr [eax+308]
 00467421    mov        edx,46798C; 'H02'
 00467426    call       0045D424
 0046742B    push       dword ptr [ebp-34]
 0046742E    lea        ecx,[ebp-38]
 00467431    mov        eax,dword ptr [esi]
 00467433    mov        eax,dword ptr [eax+308]
 00467439    mov        edx,467998; 'H03'
 0046743E    call       0045D424
 00467443    push       dword ptr [ebp-38]
 00467446    lea        ecx,[ebp-3C]
 00467449    mov        eax,dword ptr [esi]
 0046744B    mov        eax,dword ptr [eax+308]
 00467451    mov        edx,4679A4; 'H04'
 00467456    call       0045D424
 0046745B    push       dword ptr [ebp-3C]
 0046745E    lea        ecx,[ebp-40]
 00467461    mov        eax,dword ptr [esi]
 00467463    mov        eax,dword ptr [eax+308]
 00467469    mov        edx,4679B0; 'H05'
 0046746E    call       0045D424
 00467473    push       dword ptr [ebp-40]
 00467476    lea        ecx,[ebp-44]
 00467479    mov        eax,dword ptr [esi]
 0046747B    mov        eax,dword ptr [eax+308]
 00467481    mov        edx,4679BC; 'H06'
 00467486    call       0045D424
 0046748B    push       dword ptr [ebp-44]
 0046748E    lea        ecx,[ebp-48]
 00467491    mov        eax,dword ptr [esi]
 00467493    mov        eax,dword ptr [eax+308]
 00467499    mov        edx,4679C8; 'H07'
 0046749E    call       0045D424
 004674A3    push       dword ptr [ebp-48]
 004674A6    lea        ecx,[ebp-4C]
 004674A9    mov        eax,dword ptr [esi]
 004674AB    mov        eax,dword ptr [eax+308]
 004674B1    mov        edx,4679D4; 'H08'
 004674B6    call       0045D424
 004674BB    push       dword ptr [ebp-4C]
 004674BE    lea        ecx,[ebp-50]
 004674C1    mov        eax,dword ptr [esi]
 004674C3    mov        eax,dword ptr [eax+308]
 004674C9    mov        edx,4679E0; 'H09'
 004674CE    call       0045D424
 004674D3    push       dword ptr [ebp-50]
 004674D6    lea        ecx,[ebp-54]
 004674D9    mov        eax,dword ptr [esi]
 004674DB    mov        eax,dword ptr [eax+308]
 004674E1    mov        edx,4679EC; 'H10'
 004674E6    call       0045D424
 004674EB    push       dword ptr [ebp-54]
 004674EE    lea        ecx,[ebp-58]
 004674F1    mov        eax,dword ptr [esi]
 004674F3    mov        eax,dword ptr [eax+308]
 004674F9    mov        edx,4679F8; 'H11'
 004674FE    call       0045D424
 00467503    push       dword ptr [ebp-58]
 00467506    lea        ecx,[ebp-5C]
 00467509    mov        eax,dword ptr [esi]
 0046750B    mov        eax,dword ptr [eax+308]
 00467511    mov        edx,467A04; 'H12'
 00467516    call       0045D424
 0046751B    push       dword ptr [ebp-5C]
 0046751E    lea        ecx,[ebp-60]
 00467521    mov        eax,dword ptr [esi]
 00467523    mov        eax,dword ptr [eax+308]
 00467529    mov        edx,467A10; 'H13'
 0046752E    call       0045D424
 00467533    push       dword ptr [ebp-60]
 00467536    lea        ecx,[ebp-64]
 00467539    mov        eax,dword ptr [esi]
 0046753B    mov        eax,dword ptr [eax+308]
 00467541    mov        edx,467A1C; 'H14'
 00467546    call       0045D424
 0046754B    push       dword ptr [ebp-64]
 0046754E    lea        ecx,[ebp-68]
 00467551    mov        eax,dword ptr [esi]
 00467553    mov        eax,dword ptr [eax+308]
 00467559    mov        edx,467A28; 'H15'
 0046755E    call       0045D424
 00467563    push       dword ptr [ebp-68]
 00467566    lea        eax,[ebp-2C]
 00467569    mov        edx,0F
 0046756E    call       @LStrCatN
 00467573    mov        eax,dword ptr [ebp-2C]
 00467576    call       @LStrToPChar
 0046757B    mov        edx,eax
 0046757D    mov        ecx,467A2C; 'ASPack'
 00467582    mov        eax,[0046C05C]; ^Application:TApplication
 00467587    mov        eax,dword ptr [eax]
 00467589    call       TApplication.MessageBox
 0046758E    mov        eax,[0046C05C]; ^Application:TApplication
 00467593    mov        eax,dword ptr [eax]
 00467595    call       TApplication.Terminate
 0046759A    call       ParamCount
 0046759F    sub        eax,2
>004675A2    jl         0046790D
 004675A8    inc        eax
 004675A9    mov        dword ptr [ebp-8],eax
 004675AC    mov        esi,2
 004675B1    lea        eax,[ebp-6C]
 004675B4    push       eax
 004675B5    lea        edx,[ebp-70]
 004675B8    mov        eax,esi
 004675BA    call       ParamStr
 004675BF    mov        eax,dword ptr [ebp-70]
 004675C2    mov        ecx,2
 004675C7    mov        edx,1
 004675CC    call       @LStrCopy
 004675D1    mov        eax,dword ptr [ebp-6C]
 004675D4    lea        edx,[ebp-4]
 004675D7    call       UpperCase
 004675DC    mov        eax,dword ptr [ebp-4]
 004675DF    mov        edx,467A3C; '-O'
 004675E4    call       @LStrCmp
>004675E9    je         004675FA
 004675EB    mov        eax,dword ptr [ebp-4]
 004675EE    mov        edx,467A48; '/O'
 004675F3    call       @LStrCmp
>004675F8    jne        0046763C
 004675FA    lea        eax,[ebx+428]; TfrmMain.?f428:String
 00467600    push       eax
 00467601    lea        edx,[ebp-74]
 00467604    mov        eax,esi
 00467606    call       ParamStr
 0046760B    mov        eax,dword ptr [ebp-74]
 0046760E    call       @LStrLen
 00467613    push       eax
 00467614    lea        edx,[ebp-78]
 00467617    mov        eax,esi
 00467619    call       ParamStr
 0046761E    mov        eax,dword ptr [ebp-78]
 00467621    mov        edx,3
 00467626    pop        ecx
 00467627    call       @LStrCopy
 0046762C    xor        edx,edx
 0046762E    mov        eax,dword ptr [ebx+398]; TfrmMain.CBBackup:TCheckBox
 00467634    mov        ecx,dword ptr [eax]
 00467636    call       dword ptr [ecx+0B8]; TCustomCheckBox.SetChecked
 0046763C    mov        eax,dword ptr [ebp-4]
 0046763F    mov        edx,467A54; '-R'
 00467644    call       @LStrCmp
>00467649    je         0046765A
 0046764B    mov        eax,dword ptr [ebp-4]
 0046764E    mov        edx,467A60; '/R'
 00467653    call       @LStrCmp
>00467658    jne        00467698
 0046765A    lea        eax,[ebp-7C]
 0046765D    push       eax
 0046765E    lea        edx,[ebp-80]
 00467661    mov        eax,esi
 00467663    call       ParamStr
 00467668    mov        eax,dword ptr [ebp-80]
 0046766B    mov        ecx,1
 00467670    mov        edx,3
 00467675    call       @LStrCopy
 0046767A    mov        eax,dword ptr [ebp-7C]
 0046767D    mov        edx,467A6C; '+'
 00467682    call       @LStrCmp
 00467687    sete       dl
 0046768A    mov        eax,dword ptr [ebx+394]; TfrmMain.CBResource:TCheckBox
 00467690    mov        ecx,dword ptr [eax]
 00467692    call       dword ptr [ecx+0B8]; TCustomCheckBox.SetChecked
 00467698    mov        eax,dword ptr [ebp-4]
 0046769B    mov        edx,467A78; '-B'
 004676A0    call       @LStrCmp
>004676A5    je         004676B6
 004676A7    mov        eax,dword ptr [ebp-4]
 004676AA    mov        edx,467A84; '/B'
 004676AF    call       @LStrCmp
>004676B4    jne        00467709
 004676B6    cmp        dword ptr [ebx+428],0; TfrmMain.?f428:String
>004676BD    jne        00467709
 004676BF    lea        eax,[ebp-84]
 004676C5    push       eax
 004676C6    lea        edx,[ebp-88]
 004676CC    mov        eax,esi
 004676CE    call       ParamStr
 004676D3    mov        eax,dword ptr [ebp-88]
 004676D9    mov        ecx,1
 004676DE    mov        edx,3
 004676E3    call       @LStrCopy
 004676E8    mov        eax,dword ptr [ebp-84]
 004676EE    mov        edx,467A6C; '+'
 004676F3    call       @LStrCmp
 004676F8    sete       dl
 004676FB    mov        eax,dword ptr [ebx+398]; TfrmMain.CBBackup:TCheckBox
 00467701    mov        ecx,dword ptr [eax]
 00467703    call       dword ptr [ecx+0B8]; TCustomCheckBox.SetChecked
 00467709    mov        eax,dword ptr [ebp-4]
 0046770C    mov        edx,467A90; '-D'
 00467711    call       @LStrCmp
>00467716    je         00467727
 00467718    mov        eax,dword ptr [ebp-4]
 0046771B    mov        edx,467A9C; '/D'
 00467720    call       @LStrCmp
>00467725    jne        00467771
 00467727    lea        eax,[ebp-8C]
 0046772D    push       eax
 0046772E    lea        edx,[ebp-90]
 00467734    mov        eax,esi
 00467736    call       ParamStr
 0046773B    mov        eax,dword ptr [ebp-90]
 00467741    mov        ecx,1
 00467746    mov        edx,3
 0046774B    call       @LStrCopy
 00467750    mov        eax,dword ptr [ebp-8C]
 00467756    mov        edx,467A6C; '+'
 0046775B    call       @LStrCmp
 00467760    sete       dl
 00467763    mov        eax,dword ptr [ebx+3A4]; TfrmMain.CBImportLoader:TCheckBox
 00467769    mov        ecx,dword ptr [eax]
 0046776B    call       dword ptr [ecx+0B8]; TCustomCheckBox.SetChecked
 00467771    mov        eax,dword ptr [ebp-4]
 00467774    mov        edx,467AA8; '-E'
 00467779    call       @LStrCmp
>0046777E    je         0046778F
 00467780    mov        eax,dword ptr [ebp-4]
 00467783    mov        edx,467AB4; '/E'
 00467788    call       @LStrCmp
>0046778D    jne        004677D9
 0046778F    lea        eax,[ebp-94]
 00467795    push       eax
 00467796    lea        edx,[ebp-98]
 0046779C    mov        eax,esi
 0046779E    call       ParamStr
 004677A3    mov        eax,dword ptr [ebp-98]
 004677A9    mov        ecx,1
 004677AE    mov        edx,3
 004677B3    call       @LStrCopy
 004677B8    mov        eax,dword ptr [ebp-94]
 004677BE    mov        edx,467A6C; '+'
 004677C3    call       @LStrCmp
 004677C8    sete       dl
 004677CB    mov        eax,dword ptr [ebx+3B0]; TfrmMain.CBExtraData:TCheckBox
 004677D1    mov        ecx,dword ptr [eax]
 004677D3    call       dword ptr [ecx+0B8]; TCustomCheckBox.SetChecked
 004677D9    mov        eax,dword ptr [ebp-4]
 004677DC    mov        edx,467AC0; '-S'
 004677E1    call       @LStrCmp
>004677E6    je         004677F7
 004677E8    mov        eax,dword ptr [ebp-4]
 004677EB    mov        edx,467ACC; '/S'
 004677F0    call       @LStrCmp
>004677F5    jne        00467815
 004677F7    mov        byte ptr [ebx+418],1; TfrmMain.?f418:byte
 004677FE    mov        byte ptr [ebx+430],1; TfrmMain.?f430:byte
 00467805    mov        dl,1
 00467807    mov        eax,dword ptr [ebx+39C]; TfrmMain.CBExit:TCheckBox
 0046780D    mov        ecx,dword ptr [eax]
 0046780F    call       dword ptr [ecx+0B8]; TCustomCheckBox.SetChecked
 00467815    mov        eax,dword ptr [ebp-4]
 00467818    mov        edx,467AD8; '-Q'
 0046781D    call       @LStrCmp
>00467822    je         00467833
 00467824    mov        eax,dword ptr [ebp-4]
 00467827    mov        edx,467AE4; '/Q'
 0046782C    call       @LStrCmp
>00467831    jne        0046784A
 00467833    mov        byte ptr [ebx+430],1; TfrmMain.?f430:byte
 0046783A    mov        dl,1
 0046783C    mov        eax,dword ptr [ebx+39C]; TfrmMain.CBExit:TCheckBox
 00467842    mov        ecx,dword ptr [eax]
 00467844    call       dword ptr [ecx+0B8]; TCustomCheckBox.SetChecked
 0046784A    mov        eax,dword ptr [ebp-4]
 0046784D    mov        edx,467AC0; '-S'
 00467852    call       @LStrCmp
>00467857    je         00467868
 00467859    mov        eax,dword ptr [ebp-4]
 0046785C    mov        edx,467ACC; '/S'
 00467861    call       @LStrCmp
>00467866    jne        0046786F
 00467868    mov        byte ptr [ebx+432],1; TfrmMain.?f432:byte
 0046786F    mov        eax,dword ptr [ebp-4]
 00467872    mov        edx,467AF0; '-X'
 00467877    call       @LStrCmp
>0046787C    je         0046788D
 0046787E    mov        eax,dword ptr [ebp-4]
 00467881    mov        edx,467AFC; '/X'
 00467886    call       @LStrCmp
>0046788B    jne        00467894
 0046788D    mov        byte ptr [ebx+433],1; TfrmMain.?f433:byte
 00467894    mov        eax,dword ptr [ebp-4]
 00467897    mov        edx,467B08; '-P'
 0046789C    call       @LStrCmp
>004678A1    je         004678B2
 004678A3    mov        eax,dword ptr [ebp-4]
 004678A6    mov        edx,467B14; '/P'
 004678AB    call       @LStrCmp
>004678B0    jne        004678B9
 004678B2    mov        byte ptr [ebx+434],1; TfrmMain.?f434:byte
 004678B9    mov        eax,dword ptr [ebp-4]
 004678BC    mov        edx,467B20; '-M'
 004678C1    call       @LStrCmp
>004678C6    je         004678D7
 004678C8    mov        eax,dword ptr [ebp-4]
 004678CB    mov        edx,467B2C; '/M'
 004678D0    call       @LStrCmp
>004678D5    jne        004678DE
 004678D7    mov        byte ptr [ebx+435],1; TfrmMain.?f435:byte
 004678DE    mov        eax,dword ptr [ebp-4]
 004678E1    mov        edx,467B38; '-U'
 004678E6    call       @LStrCmp
>004678EB    je         004678FC
 004678ED    mov        eax,dword ptr [ebp-4]
 004678F0    mov        edx,467B44; '/U'
 004678F5    call       @LStrCmp
>004678FA    jne        00467903
 004678FC    mov        byte ptr [ebx+436],1; TfrmMain.?f436:byte
 00467903    inc        esi
 00467904    dec        dword ptr [ebp-8]
<00467907    jne        004675B1
 0046790D    xor        eax,eax
 0046790F    pop        edx
 00467910    pop        ecx
 00467911    pop        ecx
 00467912    mov        dword ptr fs:[eax],edx
 00467915    push       46793A
 0046791A    lea        eax,[ebp-98]
 00467920    mov        edx,24
 00467925    call       @LStrArrayClr
 0046792A    lea        eax,[ebp-4]
 0046792D    call       @LStrClr
 00467932    ret
<00467933    jmp        @HandleFinally
<00467938    jmp        0046791A
 0046793A    pop        esi
 0046793B    pop        ebx
 0046793C    mov        esp,ebp
 0046793E    pop        ebp
 0046793F    ret
*}
//end;

//00467B48
//procedure sub_00467B48(?:?; ?:AnsiString; ?:AnsiString; ?:?);
//begin
{*
 00467B48    push       ebp
 00467B49    mov        ebp,esp
 00467B4B    push       0
 00467B4D    push       0
 00467B4F    push       0
 00467B51    push       ebx
 00467B52    push       esi
 00467B53    push       edi
 00467B54    mov        dword ptr [ebp-4],ecx
 00467B57    mov        edi,edx
 00467B59    mov        ebx,eax
 00467B5B    mov        esi,dword ptr [ebp+8]
 00467B5E    xor        eax,eax
 00467B60    push       ebp
 00467B61    push       467BFC
 00467B66    push       dword ptr fs:[eax]
 00467B69    mov        dword ptr fs:[eax],esp
 00467B6C    lea        eax,[ebp-8]
 00467B6F    mov        edx,ebx
 00467B71    call       @LStrLAsg
 00467B76    mov        eax,esi
 00467B78    call       @LStrClr
 00467B7D    mov        edx,dword ptr [ebp-8]
 00467B80    mov        eax,edi
 00467B82    call       @LStrPos
 00467B87    mov        ebx,eax
 00467B89    test       ebx,ebx
>00467B8B    jle        00467BD3
 00467B8D    push       dword ptr [esi]
 00467B8F    lea        eax,[ebp-0C]
 00467B92    push       eax
 00467B93    mov        ecx,ebx
 00467B95    dec        ecx
 00467B96    mov        edx,1
 00467B9B    mov        eax,dword ptr [ebp-8]
 00467B9E    call       @LStrCopy
 00467BA3    push       dword ptr [ebp-0C]
 00467BA6    push       dword ptr [ebp-4]
 00467BA9    mov        eax,esi
 00467BAB    mov        edx,3
 00467BB0    call       @LStrCatN
 00467BB5    lea        eax,[ebp-8]
 00467BB8    push       eax
 00467BB9    mov        eax,edi
 00467BBB    call       @LStrLen
 00467BC0    mov        edx,eax
 00467BC2    add        edx,ebx
 00467BC4    mov        ecx,7FFFFFFF
 00467BC9    mov        eax,dword ptr [ebp-8]
 00467BCC    call       @LStrCopy
>00467BD1    jmp        00467BDD
 00467BD3    mov        eax,esi
 00467BD5    mov        edx,dword ptr [ebp-8]
 00467BD8    call       @LStrCat
 00467BDD    test       ebx,ebx
<00467BDF    jg         00467B7D
 00467BE1    xor        eax,eax
 00467BE3    pop        edx
 00467BE4    pop        ecx
 00467BE5    pop        ecx
 00467BE6    mov        dword ptr fs:[eax],edx
 00467BE9    push       467C03
 00467BEE    lea        eax,[ebp-0C]
 00467BF1    mov        edx,2
 00467BF6    call       @LStrArrayClr
 00467BFB    ret
<00467BFC    jmp        @HandleFinally
<00467C01    jmp        00467BEE
 00467C03    pop        edi
 00467C04    pop        esi
 00467C05    pop        ebx
 00467C06    mov        esp,ebp
 00467C08    pop        ebp
 00467C09    ret        4
*}
//end;

//00467C0C
//procedure TfrmMain.LangTranslate(?:?; ?:?; ?:?);
//begin
{*
 00467C0C    push       ebp
 00467C0D    mov        ebp,esp
 00467C0F    push       0
 00467C11    push       0
 00467C13    push       ebx
 00467C14    mov        ebx,dword ptr [ebp+8]
 00467C17    mov        eax,dword ptr [ebp+10]
 00467C1A    call       @LStrAddRef
 00467C1F    mov        eax,dword ptr [ebp+0C]
 00467C22    call       @LStrAddRef
 00467C27    xor        eax,eax
 00467C29    push       ebp
 00467C2A    push       467C87
 00467C2F    push       dword ptr fs:[eax]
 00467C32    mov        dword ptr fs:[eax],esp
 00467C35    lea        eax,[ebp-8]
 00467C38    push       eax
 00467C39    mov        eax,dword ptr [ebx]
 00467C3B    mov        ecx,467CA0; '\r\n'
 00467C40    mov        edx,467CAC; '|'
 00467C45    call       00467B48
 00467C4A    mov        eax,dword ptr [ebp-8]
 00467C4D    lea        edx,[ebp-4]
 00467C50    call       Trim
 00467C55    mov        edx,dword ptr [ebp-4]
 00467C58    mov        eax,ebx
 00467C5A    call       @LStrAsg
 00467C5F    xor        eax,eax
 00467C61    pop        edx
 00467C62    pop        ecx
 00467C63    pop        ecx
 00467C64    mov        dword ptr fs:[eax],edx
 00467C67    push       467C8E
 00467C6C    lea        eax,[ebp-8]
 00467C6F    mov        edx,2
 00467C74    call       @LStrArrayClr
 00467C79    lea        eax,[ebp+0C]
 00467C7C    mov        edx,2
 00467C81    call       @LStrArrayClr
 00467C86    ret
<00467C87    jmp        @HandleFinally
<00467C8C    jmp        00467C6C
 00467C8E    pop        ebx
 00467C8F    pop        ecx
 00467C90    pop        ecx
 00467C91    pop        ebp
 00467C92    ret        0C
*}
//end;

//00467CB0
//procedure sub_00467CB0(?:TfrmMain);
//begin
{*
 00467CB0    push       ebp
 00467CB1    mov        ebp,esp
 00467CB3    mov        ecx,6
 00467CB8    push       0
 00467CBA    push       0
 00467CBC    dec        ecx
<00467CBD    jne        00467CB8
 00467CBF    push       ecx
 00467CC0    push       ebx
 00467CC1    push       esi
 00467CC2    push       edi
 00467CC3    mov        dword ptr [ebp-4],eax
 00467CC6    xor        eax,eax
 00467CC8    push       ebp
 00467CC9    push       4682F4
 00467CCE    push       dword ptr fs:[eax]
 00467CD1    mov        dword ptr fs:[eax],esp
 00467CD4    mov        eax,dword ptr [ebp-4]
 00467CD7    mov        eax,dword ptr [eax+36C]; TfrmMain.BtnTest:TButton
 00467CDD    xor        edx,edx
 00467CDF    call       TControl.SetVisible
 00467CE4    mov        eax,dword ptr [ebp-4]
 00467CE7    mov        eax,dword ptr [eax+370]; TfrmMain.BtnRestore:TButton
 00467CED    xor        edx,edx
 00467CEF    call       TControl.SetVisible
 00467CF4    mov        eax,dword ptr [ebp-4]
 00467CF7    mov        eax,dword ptr [eax+368]; TfrmMain.BtnErase:TButton
 00467CFD    xor        edx,edx
 00467CFF    call       TControl.SetVisible
 00467D04    mov        eax,dword ptr [ebp-4]
 00467D07    mov        byte ptr [eax+431],0; TfrmMain.?f431:byte
 00467D0E    mov        eax,dword ptr [ebp-4]
 00467D11    mov        eax,dword ptr [eax+33C]; TfrmMain.LabelFileSizeAfter:TLabel
 00467D17    xor        edx,edx
 00467D19    call       TControl.SetVisible
 00467D1E    mov        eax,dword ptr [ebp-4]
 00467D21    mov        eax,dword ptr [eax+360]; TfrmMain.PB:TNewGauge
 00467D27    xor        edx,edx
 00467D29    call       TNewGauge.SetProgress
 00467D2E    xor        edx,edx
 00467D30    push       ebp
 00467D31    push       468147
 00467D36    push       dword ptr fs:[edx]
 00467D39    mov        dword ptr fs:[edx],esp
 00467D3C    xor        edx,edx
 00467D3E    push       ebp
 00467D3F    push       467FBF
 00467D44    push       dword ptr fs:[edx]
 00467D47    mov        dword ptr fs:[edx],esp
 00467D4A    push       80
 00467D4F    mov        eax,dword ptr [ebp-4]
 00467D52    mov        eax,dword ptr [eax+424]; TfrmMain.?f424:String
 00467D58    call       @LStrToPChar
 00467D5D    push       eax
 00467D5E    call       kernel32.SetFileAttributesA
 00467D63    mov        eax,dword ptr [ebp-4]
 00467D66    xor        edx,edx
 00467D68    mov        dword ptr [eax+42C],edx; TfrmMain.?f42C:TCompressor
 00467D6E    mov        eax,dword ptr [ebp-4]
 00467D71    mov        ecx,dword ptr [eax+424]; TfrmMain.?f424:String
 00467D77    mov        dl,1
 00467D79    mov        eax,[00461014]; TCompressor
 00467D7E    call       TCompressor.Create; TCompressor.Create
 00467D83    mov        ebx,eax
 00467D85    mov        eax,dword ptr [ebp-4]
 00467D88    mov        dword ptr [eax+42C],ebx; TfrmMain.?f42C:TCompressor
 00467D8E    mov        eax,ebx
 00467D90    call       004615BC
 00467D95    test       al,al
>00467D97    je         00467DFE
 00467D99    mov        eax,dword ptr [ebp-4]
 00467D9C    cmp        byte ptr [eax+430],0; TfrmMain.?f430:byte
>00467DA3    jne        00467DDE
 00467DA5    push       121
 00467DAA    lea        ecx,[ebp-0C]
 00467DAD    mov        eax,dword ptr [ebp-4]
 00467DB0    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00467DB6    mov        edx,46830C; '01'
 00467DBB    call       0045D424
 00467DC0    mov        eax,dword ptr [ebp-0C]
 00467DC3    call       @LStrToPChar
 00467DC8    mov        edx,eax
 00467DCA    mov        ecx,468310; 'Warning'
 00467DCF    mov        eax,[0046C05C]; ^Application:TApplication
 00467DD4    mov        eax,dword ptr [eax]
 00467DD6    call       TApplication.MessageBox
 00467DDB    dec        eax
>00467DDC    je         00467DFE
 00467DDE    mov        eax,dword ptr [ebp-4]
 00467DE1    mov        eax,dword ptr [eax+42C]; TfrmMain.?f42C:TCompressor
 00467DE7    call       TObject.Free
 00467DEC    xor        eax,eax
 00467DEE    pop        edx
 00467DEF    pop        ecx
 00467DF0    pop        ecx
 00467DF1    mov        dword ptr fs:[eax],edx
 00467DF4    call       @TryFinallyExit
>00467DF9    jmp        004682BC
 00467DFE    mov        eax,dword ptr [ebp-4]
 00467E01    mov        eax,dword ptr [eax+378]; TfrmMain.BtnGo:TButton
 00467E07    xor        edx,edx
 00467E09    call       TControl.SetVisible
 00467E0E    mov        eax,[0046C05C]; ^Application:TApplication
 00467E13    mov        eax,dword ptr [eax]
 00467E15    call       TApplication.ProcessMessages
 00467E1A    mov        eax,dword ptr [ebp-4]
 00467E1D    mov        eax,dword ptr [eax+37C]; TfrmMain.AVI:TAnimateControl
 00467E23    mov        dl,1
 00467E25    call       TControl.SetVisible
 00467E2A    mov        eax,dword ptr [ebp-4]
 00467E2D    mov        eax,dword ptr [eax+37C]; TfrmMain.AVI:TAnimateControl
 00467E33    mov        dl,1
 00467E35    call       TAnimateControl.SetActive
 00467E3A    mov        eax,dword ptr [ebp-4]
 00467E3D    mov        eax,dword ptr [eax+364]; TfrmMain.PBRatio:TNewGauge
 00467E43    mov        edx,64
 00467E48    call       TNewGauge.SetMaxValue
 00467E4D    mov        eax,dword ptr [ebp-4]
 00467E50    mov        eax,dword ptr [eax+364]; TfrmMain.PBRatio:TNewGauge
 00467E56    mov        edx,64
 00467E5B    call       TNewGauge.SetProgress
 00467E60    mov        eax,dword ptr [ebp-4]
 00467E63    mov        eax,dword ptr [eax+3A4]; TfrmMain.CBImportLoader:TCheckBox
 00467E69    mov        edx,dword ptr [eax]
 00467E6B    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 00467E71    mov        edx,dword ptr [ebp-4]
 00467E74    mov        edx,dword ptr [edx+42C]; TfrmMain.?f42C:TCompressor
 00467E7A    mov        byte ptr [edx+74],al; TCompressor.?f74:Boolean
 00467E7D    mov        eax,dword ptr [ebp-4]
 00467E80    mov        eax,dword ptr [eax+394]; TfrmMain.CBResource:TCheckBox
 00467E86    mov        edx,dword ptr [eax]
 00467E88    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 00467E8E    mov        edx,dword ptr [ebp-4]
 00467E91    mov        ebx,dword ptr [edx+42C]; TfrmMain.?f42C:TCompressor
 00467E97    mov        byte ptr [ebx+60],al; TCompressor.?f60:Boolean
 00467E9A    mov        eax,dword ptr [ebp-4]
 00467E9D    mov        al,byte ptr [eax+433]; TfrmMain.?f433:byte
 00467EA3    mov        byte ptr [ebx+61],al; TCompressor.?f61:byte
 00467EA6    lea        edx,[ebp-10]
 00467EA9    mov        eax,dword ptr [ebp-4]
 00467EAC    mov        eax,dword ptr [eax+3A0]; TfrmMain.EditSection:TEdit
 00467EB2    call       TControl.GetText
 00467EB7    mov        edx,dword ptr [ebp-10]
 00467EBA    mov        eax,dword ptr [ebp-4]
 00467EBD    mov        eax,dword ptr [eax+42C]; TfrmMain.?f42C:TCompressor
 00467EC3    add        eax,7C; TCompressor.?f7C:String
 00467EC6    call       @LStrAsg
 00467ECB    mov        eax,dword ptr [ebp-4]
 00467ECE    mov        eax,dword ptr [eax+3B0]; TfrmMain.CBExtraData:TCheckBox
 00467ED4    mov        edx,dword ptr [eax]
 00467ED6    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 00467EDC    mov        edx,dword ptr [ebp-4]
 00467EDF    mov        edx,dword ptr [edx+42C]; TfrmMain.?f42C:TCompressor
 00467EE5    mov        byte ptr [edx+55],al; TCompressor.?f55:Boolean
 00467EE8    mov        eax,dword ptr [ebp-4]
 00467EEB    mov        eax,dword ptr [eax+398]; TfrmMain.CBBackup:TCheckBox
 00467EF1    mov        edx,dword ptr [eax]
 00467EF3    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 00467EF9    mov        edx,dword ptr [ebp-4]
 00467EFC    mov        ebx,dword ptr [edx+42C]; TfrmMain.?f42C:TCompressor
 00467F02    mov        byte ptr [ebx+80],al; TCompressor.?f80:Boolean
 00467F08    mov        eax,dword ptr [ebp-4]
 00467F0B    mov        al,byte ptr [eax+432]; TfrmMain.?f432:byte
 00467F11    mov        byte ptr [ebx+56],al; TCompressor.?f56:byte
 00467F14    mov        eax,dword ptr [ebp-4]
 00467F17    mov        al,byte ptr [eax+434]; TfrmMain.?f434:byte
 00467F1D    mov        byte ptr [ebx+57],al; TCompressor.?f57:byte
 00467F20    nop
 00467F21    nop
 00467F22    nop
 00467F23    nop
 00467F24    nop
 00467F25    nop
 00467F26    nop
 00467F27    nop
 00467F28    nop
 00467F29    nop
 00467F2A    nop
 00467F2B    nop
 00467F2C    mov        eax,dword ptr [ebp-4]
 00467F2F    cmp        byte ptr [eax+435],0; TfrmMain.?f435:byte
>00467F36    jne        00467F54
 00467F38    mov        eax,dword ptr [ebp-4]
 00467F3B    mov        eax,dword ptr [eax+410]; TfrmMain.CBMaxCompression:TCheckBox
 00467F41    call       TCustomCheckBox.GetChecked
 00467F46    test       al,al
>00467F48    je         00467F54
 00467F4A    mov        eax,dword ptr [ebp-4]
 00467F4D    mov        byte ptr [eax+435],1; TfrmMain.?f435:byte
 00467F54    mov        eax,dword ptr [ebp-4]
 00467F57    mov        eax,dword ptr [eax+42C]; TfrmMain.?f42C:TCompressor
 00467F5D    mov        edx,dword ptr [ebp-4]
 00467F60    mov        dl,byte ptr [edx+435]; TfrmMain.?f435:byte
 00467F66    mov        byte ptr [eax+58],dl; TCompressor.?f58:byte
 00467F69    nop
 00467F6A    nop
 00467F6B    nop
 00467F6C    nop
 00467F6D    nop
 00467F6E    nop
 00467F6F    nop
 00467F70    nop
 00467F71    nop
 00467F72    nop
 00467F73    nop
 00467F74    nop
 00467F75    nop
 00467F76    nop
 00467F77    nop
 00467F78    mov        eax,dword ptr [ebp-4]
 00467F7B    mov        eax,dword ptr [eax+42C]; TfrmMain.?f42C:TCompressor
 00467F81    add        eax,9C; TCompressor.?f9C:String
 00467F86    mov        edx,dword ptr [ebp-4]
 00467F89    mov        edx,dword ptr [edx+428]; TfrmMain.?f428:String
 00467F8F    call       @LStrAsg
 00467F94    mov        eax,465AC8; sub_00465AC8
 00467F99    mov        edx,dword ptr [ebp-4]
 00467F9C    mov        esi,dword ptr [edx+42C]; TfrmMain.?f42C:TCompressor
 00467FA2    mov        dword ptr [esi+284],eax; TCompressor.?f284:dword
 00467FA8    mov        eax,esi
 00467FAA    mov        edx,dword ptr [eax]
 00467FAC    call       dword ptr [edx+0CC]; TCompressor.sub_0046181C
 00467FB2    xor        eax,eax
 00467FB4    pop        edx
 00467FB5    pop        ecx
 00467FB6    pop        ecx
 00467FB7    mov        dword ptr fs:[eax],edx
>00467FBA    jmp        004680EC
<00467FBF    jmp        @HandleOnException
 00467FC4    dd        2
 00467FC8    dd        449D44;EExeError
 00467FCC    dd        467FD8
 00467FD0    dd        0
 00467FD4    dd        4680CD
 00467FD8    mov        ebx,eax
 00467FDA    cmp        dword ptr [ebx+4],0; EExeError.?f4:String
>00467FDE    je         004680E7
 00467FE4    lea        eax,[ebp-8]
 00467FE7    call       @LStrClr
 00467FEC    call       kernel32.GetLastError
 00467FF1    test       eax,eax
>00467FF3    je         00468002
 00467FF5    call       kernel32.GetLastError
 00467FFA    lea        edx,[ebp-8]
 00467FFD    call       SysErrorMessage
 00468002    cmp        dword ptr [ebp-8],0
>00468006    je         00468022
 00468008    push       468320; '\r\n('
 0046800D    push       dword ptr [ebp-8]
 00468010    push       46832C; ')'
 00468015    lea        eax,[ebp-8]
 00468018    mov        edx,3
 0046801D    call       @LStrCatN
 00468022    lea        ecx,[ebp-14]
 00468025    mov        edx,dword ptr [ebx+4]; EExeError.?f4:String
 00468028    mov        eax,[0046D974]
 0046802D    mov        eax,dword ptr [eax+308]
 00468033    call       0045D424
 00468038    mov        edx,dword ptr [ebp-14]
 0046803B    lea        eax,[ebx+4]; EExeError.?f4:String
 0046803E    mov        ecx,dword ptr [ebp-8]
 00468041    call       @LStrCat3
 00468046    mov        eax,dword ptr [ebp-4]
 00468049    mov        eax,dword ptr [eax+360]; TfrmMain.PB:TNewGauge
 0046804F    xor        edx,edx
 00468051    call       TNewGauge.SetProgress
 00468056    mov        eax,dword ptr [ebp-4]
 00468059    mov        eax,dword ptr [eax+364]; TfrmMain.PBRatio:TNewGauge
 0046805F    xor        edx,edx
 00468061    call       TNewGauge.SetMaxValue
 00468066    mov        eax,dword ptr [ebp-4]
 00468069    mov        eax,dword ptr [eax+364]; TfrmMain.PBRatio:TNewGauge
 0046806F    xor        edx,edx
 00468071    call       TNewGauge.SetProgress
 00468076    mov        eax,[0046C05C]; ^Application:TApplication
 0046807B    mov        eax,dword ptr [eax]
 0046807D    mov        edx,468338; 'ASPack'
 00468082    call       TApplication.SetTitle
 00468087    mov        dword ptr ds:[46D970],0FFFFFFFF; gvar_0046D970
 00468091    mov        eax,dword ptr [ebp-4]
 00468094    mov        eax,dword ptr [eax+42C]; TfrmMain.?f42C:TCompressor
 0046809A    test       eax,eax
>0046809C    je         004680A3
 0046809E    call       TObject.Free
 004680A3    mov        eax,dword ptr [ebp-4]
 004680A6    xor        edx,edx
 004680A8    mov        dword ptr [eax+42C],edx; TfrmMain.?f42C:TCompressor
 004680AE    mov        eax,dword ptr [ebp-4]
 004680B1    cmp        byte ptr [eax+430],0; TfrmMain.?f430:byte
>004680B8    je         004680C6
 004680BA    mov        eax,dword ptr [ebp-4]
 004680BD    cmp        byte ptr [eax+431],0; TfrmMain.?f431:byte
>004680C4    je         004680E7
 004680C6    call       @RaiseAgain
>004680CB    jmp        004680E7
 004680CD    push       10
 004680CF    push       468340
 004680D4    push       468348
 004680D9    mov        eax,dword ptr [ebp-4]
 004680DC    call       TWinControl.GetHandle
 004680E1    push       eax
 004680E2    call       user32.MessageBoxA
 004680E7    call       @DoneExcept
 004680EC    xor        eax,eax
 004680EE    pop        edx
 004680EF    pop        ecx
 004680F0    pop        ecx
 004680F1    mov        dword ptr fs:[eax],edx
 004680F4    push       46814E
 004680F9    mov        eax,dword ptr [ebp-4]
 004680FC    mov        eax,dword ptr [eax+37C]; TfrmMain.AVI:TAnimateControl
 00468102    xor        edx,edx
 00468104    call       TControl.SetVisible
 00468109    mov        eax,dword ptr [ebp-4]
 0046810C    mov        eax,dword ptr [eax+37C]; TfrmMain.AVI:TAnimateControl
 00468112    xor        edx,edx
 00468114    call       TAnimateControl.SetActive
 00468119    mov        eax,dword ptr [ebp-4]
 0046811C    mov        eax,dword ptr [eax+378]; TfrmMain.BtnGo:TButton
 00468122    mov        dl,1
 00468124    call       TControl.SetVisible
 00468129    mov        eax,dword ptr [ebp-4]
 0046812C    mov        eax,dword ptr [eax+2F0]; TfrmMain.SB:TStatusBar
 00468132    mov        eax,dword ptr [eax+1F0]; TStatusBar.Panels:TStatusPanels
 00468138    xor        edx,edx
 0046813A    call       TStatusPanels.GetItem
 0046813F    xor        edx,edx
 00468141    call       TStatusPanel.SetText
 00468146    ret
<00468147    jmp        @HandleFinally
<0046814C    jmp        004680F9
 0046814E    mov        eax,dword ptr [ebp-4]
 00468151    mov        eax,dword ptr [eax+360]; TfrmMain.PB:TNewGauge
 00468157    mov        edx,dword ptr [eax+12C]; TNewGauge.MaxValue:Integer
 0046815D    call       TNewGauge.SetProgress
 00468162    mov        eax,[0046C05C]; ^Application:TApplication
 00468167    mov        eax,dword ptr [eax]
 00468169    mov        edx,468360; 'ASPack - 100%'
 0046816E    call       TApplication.SetTitle
 00468173    mov        eax,dword ptr [ebp-4]
 00468176    mov        eax,dword ptr [eax+36C]; TfrmMain.BtnTest:TButton
 0046817C    mov        dl,1
 0046817E    call       TControl.SetVisible
 00468183    mov        eax,dword ptr [ebp-4]
 00468186    mov        eax,dword ptr [eax+364]; TfrmMain.PBRatio:TNewGauge
 0046818C    mov        edx,64
 00468191    call       TNewGauge.SetMaxValue
 00468196    mov        eax,dword ptr [ebp-4]
 00468199    cmp        dword ptr [eax+42C],0; TfrmMain.?f42C:TCompressor
>004681A0    je         004681FB
 004681A2    mov        eax,dword ptr [ebp-4]
 004681A5    mov        eax,dword ptr [eax+424]; TfrmMain.?f424:String
 004681AB    call       00456590
 004681B0    mov        dword ptr [ebp-1C],eax
 004681B3    mov        dword ptr [ebp-18],edx
 004681B6    fild       qword ptr [ebp-1C]
 004681B9    mov        eax,dword ptr [ebp-4]
 004681BC    mov        eax,dword ptr [eax+42C]; TfrmMain.?f42C:TCompressor
 004681C2    mov        eax,dword ptr [eax+50]; TCompressor.?f50:dword
 004681C5    mov        dword ptr [ebp-24],eax
 004681C8    xor        eax,eax
 004681CA    mov        dword ptr [ebp-20],eax
 004681CD    fild       qword ptr [ebp-24]
 004681D0    fdivp      st(1),st
 004681D2    fmul       dword ptr ds:[468370]; 100:Single
 004681D8    call       @TRUNC
 004681DD    mov        edx,eax
 004681DF    mov        eax,dword ptr [ebp-4]
 004681E2    mov        eax,dword ptr [eax+364]; TfrmMain.PBRatio:TNewGauge
 004681E8    call       TNewGauge.SetProgress
 004681ED    mov        eax,dword ptr [ebp-4]
 004681F0    mov        eax,dword ptr [eax+42C]; TfrmMain.?f42C:TCompressor
 004681F6    call       TObject.Free
 004681FB    mov        eax,dword ptr [ebp-4]
 004681FE    mov        eax,dword ptr [eax+358]; TfrmMain.LabelCompressFileSize:TLabel
 00468204    call       TControl.Show
 00468209    mov        eax,dword ptr [ebp-4]
 0046820C    mov        eax,dword ptr [eax+364]; TfrmMain.PBRatio:TNewGauge
 00468212    call       TControl.Show
 00468217    mov        eax,dword ptr [ebp-4]
 0046821A    mov        eax,dword ptr [eax+338]; TfrmMain.LabelFileSizeBefore:TLabel
 00468220    mov        dl,1
 00468222    call       TControl.SetVisible
 00468227    mov        eax,dword ptr [ebp-4]
 0046822A    mov        eax,dword ptr [eax+33C]; TfrmMain.LabelFileSizeAfter:TLabel
 00468230    mov        dl,1
 00468232    call       TControl.SetVisible
 00468237    mov        eax,dword ptr [ebp-4]
 0046823A    mov        eax,dword ptr [eax+340]; TfrmMain.LabelCompressionFileSize:TLabel
 00468240    mov        dl,1
 00468242    call       TControl.SetVisible
 00468247    mov        eax,dword ptr [ebp-4]
 0046824A    mov        eax,dword ptr [eax+424]; TfrmMain.?f424:String
 00468250    call       00456590
 00468255    mov        dword ptr [ebp-1C],eax
 00468258    mov        dword ptr [ebp-18],edx
 0046825B    fild       qword ptr [ebp-1C]
 0046825E    add        esp,0FFFFFFF4
 00468261    fstp       tbyte ptr [esp]
 00468264    wait
 00468265    lea        edx,[ebp-30]
 00468268    mov        eax,46837C; '### ### ###'
 0046826D    call       FormatFloat
 00468272    mov        eax,dword ptr [ebp-30]
 00468275    lea        edx,[ebp-2C]
 00468278    call       Trim
 0046827D    push       dword ptr [ebp-2C]
 00468280    push       468390; ' '
 00468285    lea        ecx,[ebp-34]
 00468288    mov        eax,dword ptr [ebp-4]
 0046828B    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00468291    mov        edx,46839C; '07'
 00468296    call       0045D424
 0046829B    push       dword ptr [ebp-34]
 0046829E    lea        eax,[ebp-28]
 004682A1    mov        edx,3
 004682A6    call       @LStrCatN
 004682AB    mov        edx,dword ptr [ebp-28]
 004682AE    mov        eax,dword ptr [ebp-4]
 004682B1    mov        eax,dword ptr [eax+340]; TfrmMain.LabelCompressionFileSize:TLabel
 004682B7    call       TControl.SetText
 004682BC    xor        eax,eax
 004682BE    pop        edx
 004682BF    pop        ecx
 004682C0    pop        ecx
 004682C1    mov        dword ptr fs:[eax],edx
 004682C4    push       4682FB
 004682C9    lea        eax,[ebp-34]
 004682CC    mov        edx,4
 004682D1    call       @LStrArrayClr
 004682D6    lea        eax,[ebp-14]
 004682D9    call       @LStrClr
 004682DE    lea        eax,[ebp-10]
 004682E1    call       @LStrClr
 004682E6    lea        eax,[ebp-0C]
 004682E9    mov        edx,2
 004682EE    call       @LStrArrayClr
 004682F3    ret
<004682F4    jmp        @HandleFinally
<004682F9    jmp        004682C9
 004682FB    pop        edi
 004682FC    pop        esi
 004682FD    pop        ebx
 004682FE    mov        esp,ebp
 00468300    pop        ebp
 00468301    ret
*}
//end;

//004683A0
//procedure sub_004683A0(?:TfrmMain);
//begin
{*
 004683A0    push       ebp
 004683A1    mov        ebp,esp
 004683A3    mov        ecx,0C
 004683A8    push       0
 004683AA    push       0
 004683AC    dec        ecx
<004683AD    jne        004683A8
 004683AF    push       ecx
 004683B0    push       ebx
 004683B1    push       esi
 004683B2    push       edi
 004683B3    mov        dword ptr [ebp-4],eax
 004683B6    xor        eax,eax
 004683B8    push       ebp
 004683B9    push       468766
 004683BE    push       dword ptr fs:[eax]
 004683C1    mov        dword ptr fs:[eax],esp
 004683C4    call       ParamCount
 004683C9    test       eax,eax
>004683CB    jle        0046873E
 004683D1    mov        eax,dword ptr [ebp-4]
 004683D4    call       00467328
 004683D9    xor        eax,eax
 004683DB    mov        [0046D970],eax; gvar_0046D970
 004683E0    mov        eax,dword ptr [ebp-4]
 004683E3    cmp        byte ptr [eax+418],0; TfrmMain.?f418:byte
>004683EA    je         00468437
 004683EC    mov        eax,[0046C05C]; ^Application:TApplication
 004683F1    mov        eax,dword ptr [eax]
 004683F3    mov        byte ptr [eax+4B],0; TApplication.FShowMainForm:Boolean
 004683F7    mov        eax,[0046C05C]; ^Application:TApplication
 004683FC    mov        eax,dword ptr [eax]
 004683FE    mov        edx,dword ptr [ebp-4]
 00468401    mov        dword ptr [eax+0F4],edx; TApplication.?fF4:TfrmMain
 00468407    mov        dword ptr [eax+0F0],465C9C; TApplication.FOnMinimize:TNotifyEvent sub_00465C9C
 00468411    mov        eax,[0046C05C]; ^Application:TApplication
 00468416    mov        eax,dword ptr [eax]
 00468418    mov        edx,dword ptr [ebp-4]
 0046841B    mov        dword ptr [eax+0FC],edx; TApplication.?fFC:TfrmMain
 00468421    mov        dword ptr [eax+0F8],465C9C; TApplication.FOnRestore:TNotifyEvent sub_00465C9C
 0046842B    mov        eax,[0046C05C]; ^Application:TApplication
 00468430    mov        eax,dword ptr [eax]
 00468432    call       TApplication.Minimize
 00468437    mov        eax,dword ptr [ebp-4]
 0046843A    mov        edx,dword ptr [eax+350]; TfrmMain.TabCompress:TTabSheet
 00468440    mov        eax,dword ptr [ebp-4]
 00468443    mov        eax,dword ptr [eax+314]; TfrmMain.PageControl:TPageControl
 00468449    call       TPageControl.SetActivePage
 0046844E    mov        ecx,dword ptr ds:[46C05C]; ^Application:TApplication
 00468454    mov        ecx,dword ptr [ecx]
 00468456    mov        dl,1
 00468458    mov        eax,[0045D7D0]; TFileSearch
 0046845D    call       TFileSearch.Create; TFileSearch.Create
 00468462    mov        dword ptr [ebp-8],eax
 00468465    xor        eax,eax
 00468467    push       ebp
 00468468    push       4686FE
 0046846D    push       dword ptr fs:[eax]
 00468470    mov        dword ptr fs:[eax],esp
 00468473    lea        edx,[ebp-10]
 00468476    mov        eax,1
 0046847B    call       ParamStr
 00468480    mov        eax,dword ptr [ebp-10]
 00468483    lea        edx,[ebp-0C]
 00468486    call       ExtractFileName
 0046848B    mov        eax,dword ptr [ebp-0C]
 0046848E    mov        edx,46877C; '*.*'
 00468493    call       @LStrCmp
>00468498    je         004684C7
 0046849A    lea        edx,[ebp-18]
 0046849D    mov        eax,1
 004684A2    call       ParamStr
 004684A7    mov        eax,dword ptr [ebp-18]
 004684AA    lea        edx,[ebp-14]
 004684AD    call       ExtractFileName
 004684B2    mov        edx,dword ptr [ebp-14]
 004684B5    mov        eax,dword ptr [ebp-8]
 004684B8    add        eax,48; TFileSearch.SearchFile:ShortString
 004684BB    mov        ecx,0FF
 004684C0    call       @LStrToString
>004684C5    jmp        004684DB
 004684C7    mov        eax,dword ptr [ebp-8]
 004684CA    lea        edi,[eax+48]; TFileSearch.SearchFile:ShortString
 004684CD    mov        esi,468780
 004684D2    mov        ecx,7
 004684D7    rep movs   dword ptr [edi],dword ptr [esi]
 004684D9    movs       word ptr [edi],word ptr [esi]
 004684DB    lea        edx,[ebp-24]
 004684DE    mov        eax,1
 004684E3    call       ParamStr
 004684E8    mov        eax,dword ptr [ebp-24]
 004684EB    lea        edx,[ebp-20]
 004684EE    call       ExtractFilePath
 004684F3    mov        eax,dword ptr [ebp-20]
 004684F6    lea        edx,[ebp-1C]
 004684F9    call       Trim
 004684FE    cmp        dword ptr [ebp-1C],0
>00468502    jne        00468547
 00468504    lea        eax,[ebp-2C]
 00468507    call       GetCurrentDir
 0046850C    push       dword ptr [ebp-2C]
 0046850F    push       4687A8; '\\'
 00468514    lea        eax,[ebp-30]
 00468517    mov        edx,dword ptr [ebp-8]
 0046851A    add        edx,48; TFileSearch.SearchFile:ShortString
 0046851D    call       @LStrFromString
 00468522    push       dword ptr [ebp-30]
 00468525    lea        eax,[ebp-28]
 00468528    mov        edx,3
 0046852D    call       @LStrCatN
 00468532    mov        edx,dword ptr [ebp-28]
 00468535    mov        eax,dword ptr [ebp-8]
 00468538    add        eax,48; TFileSearch.SearchFile:ShortString
 0046853B    mov        ecx,0FF
 00468540    call       @LStrToString
>00468545    jmp        0046858D
 00468547    lea        edx,[ebp-38]
 0046854A    mov        eax,1
 0046854F    call       ParamStr
 00468554    mov        eax,dword ptr [ebp-38]
 00468557    lea        edx,[ebp-34]
 0046855A    call       ExtractFilePath
 0046855F    lea        eax,[ebp-34]
 00468562    push       eax
 00468563    lea        eax,[ebp-3C]
 00468566    mov        edx,dword ptr [ebp-8]
 00468569    add        edx,48; TFileSearch.SearchFile:ShortString
 0046856C    call       @LStrFromString
 00468571    mov        edx,dword ptr [ebp-3C]
 00468574    pop        eax
 00468575    call       @LStrCat
 0046857A    mov        edx,dword ptr [ebp-34]
 0046857D    mov        eax,dword ptr [ebp-8]
 00468580    add        eax,48; TFileSearch.SearchFile:ShortString
 00468583    mov        ecx,0FF
 00468588    call       @LStrToString
 0046858D    mov        eax,dword ptr [ebp-4]
 00468590    mov        al,byte ptr [eax+436]; TfrmMain.?f436:byte
 00468596    mov        edx,dword ptr [ebp-8]
 00468599    mov        byte ptr [edx+24],al; TFileSearch.RecurseSubFolders:Boolean
 0046859C    mov        eax,dword ptr [ebp-8]
 0046859F    call       0045DA0C
 004685A4    mov        eax,dword ptr [ebp-8]
 004685A7    mov        eax,dword ptr [eax+28]; TFileSearch.FilesFound:TStringList
 004685AA    mov        edx,dword ptr [eax]
 004685AC    call       dword ptr [edx+14]; TStringList.GetCount
 004685AF    mov        ebx,eax
 004685B1    dec        ebx
 004685B2    test       ebx,ebx
>004685B4    jb         004686E8
 004685BA    inc        ebx
 004685BB    xor        esi,esi
 004685BD    lea        ecx,[ebp-40]
 004685C0    mov        eax,dword ptr [ebp-8]
 004685C3    mov        eax,dword ptr [eax+28]; TFileSearch.FilesFound:TStringList
 004685C6    mov        edx,esi
 004685C8    mov        edi,dword ptr [eax]
 004685CA    call       dword ptr [edi+0C]; TStringList.Get
 004685CD    mov        edx,dword ptr [ebp-40]
 004685D0    mov        eax,dword ptr [ebp-4]
 004685D3    add        eax,424; TfrmMain.?f424:String
 004685D8    call       @LStrAsg
 004685DD    lea        edx,[ebp-44]
 004685E0    mov        eax,dword ptr [ebp-4]
 004685E3    mov        eax,dword ptr [eax+424]; TfrmMain.?f424:String
 004685E9    call       ExtractFileName
 004685EE    mov        edx,dword ptr [ebp-44]
 004685F1    mov        eax,dword ptr [ebp-4]
 004685F4    mov        eax,dword ptr [eax+330]; TfrmMain.FileNameLabel:TLabel
 004685FA    call       TControl.SetText
 004685FF    mov        eax,dword ptr [ebp-4]
 00468602    mov        eax,dword ptr [eax+424]; TfrmMain.?f424:String
 00468608    call       00456590
 0046860D    mov        dword ptr [ebp-58],eax
 00468610    mov        dword ptr [ebp-54],edx
 00468613    fild       qword ptr [ebp-58]
 00468616    add        esp,0FFFFFFF4
 00468619    fstp       tbyte ptr [esp]
 0046861C    wait
 0046861D    lea        edx,[ebp-50]
 00468620    mov        eax,4687B4; '### ### ###'
 00468625    call       FormatFloat
 0046862A    mov        eax,dword ptr [ebp-50]
 0046862D    lea        edx,[ebp-4C]
 00468630    call       Trim
 00468635    push       dword ptr [ebp-4C]
 00468638    push       4687C8; ' '
 0046863D    lea        ecx,[ebp-5C]
 00468640    mov        eax,dword ptr [ebp-4]
 00468643    mov        eax,dword ptr [eax+308]; TfrmMain.Lang:TLanguage
 00468649    mov        edx,4687D4; '07'
 0046864E    call       0045D424
 00468653    push       dword ptr [ebp-5C]
 00468656    lea        eax,[ebp-48]
 00468659    mov        edx,3
 0046865E    call       @LStrCatN
 00468663    mov        edx,dword ptr [ebp-48]
 00468666    mov        eax,dword ptr [ebp-4]
 00468669    mov        eax,dword ptr [eax+334]; TfrmMain.FileSizeLabel:TLabel
 0046866F    call       TControl.SetText
 00468674    lea        edx,[ebp-64]
 00468677    mov        eax,dword ptr [ebp-4]
 0046867A    mov        eax,dword ptr [eax+424]; TfrmMain.?f424:String
 00468680    call       ExtractFileName
 00468685    mov        ecx,dword ptr [ebp-64]
 00468688    lea        eax,[ebp-60]
 0046868B    mov        edx,4687E0; '  '
 00468690    call       @LStrCat3
 00468695    mov        eax,dword ptr [ebp-60]
 00468698    push       eax
 00468699    mov        eax,dword ptr [ebp-4]
 0046869C    mov        eax,dword ptr [eax+2F0]; TfrmMain.SB:TStatusBar
 004686A2    mov        eax,dword ptr [eax+1F0]; TStatusBar.Panels:TStatusPanels
 004686A8    mov        edx,1
 004686AD    call       TStatusPanels.GetItem
 004686B2    pop        edx
 004686B3    call       TStatusPanel.SetText
 004686B8    mov        eax,dword ptr [ebp-4]
 004686BB    mov        eax,dword ptr [eax+33C]; TfrmMain.LabelFileSizeAfter:TLabel
 004686C1    xor        edx,edx
 004686C3    call       TControl.SetVisible
 004686C8    mov        eax,dword ptr [ebp-4]
 004686CB    mov        eax,dword ptr [eax+340]; TfrmMain.LabelCompressionFileSize:TLabel
 004686D1    xor        edx,edx
 004686D3    call       TControl.SetText
 004686D8    mov        eax,dword ptr [ebp-4]
 004686DB    call       00467CB0
 004686E0    inc        esi
 004686E1    dec        ebx
<004686E2    jne        004685BD
 004686E8    xor        eax,eax
 004686EA    pop        edx
 004686EB    pop        ecx
 004686EC    pop        ecx
 004686ED    mov        dword ptr fs:[eax],edx
 004686F0    push       468705
 004686F5    mov        eax,dword ptr [ebp-8]
 004686F8    call       TObject.Free
 004686FD    ret
<004686FE    jmp        @HandleFinally
<00468703    jmp        004686F5
 00468705    nop
 00468706    nop
 00468707    nop
 00468708    nop
 00468709    nop
 0046870A    nop
 0046870B    nop
 0046870C    nop
 0046870D    nop
 0046870E    nop
 0046870F    nop
 00468710    nop
 00468711    mov        eax,dword ptr [ebp-4]
 00468714    mov        eax,dword ptr [eax+39C]; TfrmMain.CBExit:TCheckBox
 0046871A    call       TCustomCheckBox.GetChecked
 0046871F    test       al,al
>00468721    je         0046872D
 00468723    mov        eax,[0046C7D8]
 00468728    call       TApplication.Terminate
 0046872D    nop
 0046872E    nop
 0046872F    nop
 00468730    nop
 00468731    nop
 00468732    nop
 00468733    nop
 00468734    nop
 00468735    nop
 00468736    nop
 00468737    nop
 00468738    nop
 00468739    nop
 0046873A    nop
 0046873B    nop
 0046873C    nop
 0046873D    nop
 0046873E    xor        eax,eax
 00468740    pop        edx
 00468741    pop        ecx
 00468742    pop        ecx
 00468743    mov        dword ptr fs:[eax],edx
 00468746    push       46876D
 0046874B    lea        eax,[ebp-64]
 0046874E    mov        edx,3
 00468753    call       @LStrArrayClr
 00468758    lea        eax,[ebp-50]
 0046875B    mov        edx,12
 00468760    call       @LStrArrayClr
 00468765    ret
<00468766    jmp        @HandleFinally
<0046876B    jmp        0046874B
 0046876D    pop        edi
 0046876E    pop        esi
 0046876F    pop        ebx
 00468770    mov        esp,ebp
 00468772    pop        ebp
 00468773    ret
*}
//end;

//004687E4
//procedure TfrmMain.MenuClick(?:?);
//begin
{*
 004687E4    push       ebp
 004687E5    mov        ebp,esp
 004687E7    mov        ecx,4
 004687EC    push       0
 004687EE    push       0
 004687F0    dec        ecx
<004687F1    jne        004687EC
 004687F3    push       ecx
 004687F4    push       ebx
 004687F5    push       esi
 004687F6    mov        esi,edx
 004687F8    mov        ebx,eax
 004687FA    xor        eax,eax
 004687FC    push       ebp
 004687FD    push       468943
 00468802    push       dword ptr fs:[eax]
 00468805    mov        dword ptr fs:[eax],esp
 00468808    mov        eax,esi
 0046880A    mov        edx,dword ptr ds:[437CD8]; TMenuItem
 00468810    call       @AsClass
 00468815    mov        edx,dword ptr [eax+24]; TMenuItem.?f24:String
 00468818    lea        eax,[ebx+424]; TfrmMain.?f424:String
 0046881E    call       @LStrAsg
 00468823    mov        edx,dword ptr [ebx+350]; TfrmMain.TabCompress:TTabSheet
 00468829    mov        eax,dword ptr [ebx+314]; TfrmMain.PageControl:TPageControl
 0046882F    call       TPageControl.SetActivePage
 00468834    lea        edx,[ebp-4]
 00468837    mov        eax,dword ptr [ebx+424]; TfrmMain.?f424:String
 0046883D    call       ExtractFileName
 00468842    mov        edx,dword ptr [ebp-4]
 00468845    mov        eax,dword ptr [ebx+330]; TfrmMain.FileNameLabel:TLabel
 0046884B    call       TControl.SetText
 00468850    mov        eax,dword ptr [ebx+424]; TfrmMain.?f424:String
 00468856    call       00456590
 0046885B    mov        dword ptr [ebp-18],eax
 0046885E    mov        dword ptr [ebp-14],edx
 00468861    fild       qword ptr [ebp-18]
 00468864    add        esp,0FFFFFFF4
 00468867    fstp       tbyte ptr [esp]
 0046886A    wait
 0046886B    lea        edx,[ebp-10]
 0046886E    mov        eax,468958; '### ### ###'
 00468873    call       FormatFloat
 00468878    mov        eax,dword ptr [ebp-10]
 0046887B    lea        edx,[ebp-0C]
 0046887E    call       Trim
 00468883    push       dword ptr [ebp-0C]
 00468886    push       46896C; ' '
 0046888B    lea        ecx,[ebp-1C]
 0046888E    mov        edx,468978; '07'
 00468893    mov        eax,dword ptr [ebx+308]; TfrmMain.Lang:TLanguage
 00468899    call       0045D424
 0046889E    push       dword ptr [ebp-1C]
 004688A1    lea        eax,[ebp-8]
 004688A4    mov        edx,3
 004688A9    call       @LStrCatN
 004688AE    mov        edx,dword ptr [ebp-8]
 004688B1    mov        eax,dword ptr [ebx+334]; TfrmMain.FileSizeLabel:TLabel
 004688B7    call       TControl.SetText
 004688BC    xor        edx,edx
 004688BE    mov        eax,dword ptr [ebx+33C]; TfrmMain.LabelFileSizeAfter:TLabel
 004688C4    call       TControl.SetVisible
 004688C9    xor        edx,edx
 004688CB    mov        eax,dword ptr [ebx+340]; TfrmMain.LabelCompressionFileSize:TLabel
 004688D1    call       TControl.SetText
 004688D6    lea        edx,[ebp-24]
 004688D9    mov        eax,dword ptr [ebx+424]; TfrmMain.?f424:String
 004688DF    call       ExtractFileName
 004688E4    mov        ecx,dword ptr [ebp-24]
 004688E7    lea        eax,[ebp-20]
 004688EA    mov        edx,468984; '  '
 004688EF    call       @LStrCat3
 004688F4    mov        eax,dword ptr [ebp-20]
 004688F7    push       eax
 004688F8    mov        eax,dword ptr [ebx+2F0]; TfrmMain.SB:TStatusBar
 004688FE    mov        eax,dword ptr [eax+1F0]; TStatusBar.Panels:TStatusPanels
 00468904    mov        edx,1
 00468909    call       TStatusPanels.GetItem
 0046890E    pop        edx
 0046890F    call       TStatusPanel.SetText
 00468914    mov        eax,ebx
 00468916    call       00467CB0
 0046891B    xor        eax,eax
 0046891D    pop        edx
 0046891E    pop        ecx
 0046891F    pop        ecx
 00468920    mov        dword ptr fs:[eax],edx
 00468923    push       46894A
 00468928    lea        eax,[ebp-24]
 0046892B    mov        edx,3
 00468930    call       @LStrArrayClr
 00468935    lea        eax,[ebp-10]
 00468938    mov        edx,4
 0046893D    call       @LStrArrayClr
 00468942    ret
<00468943    jmp        @HandleFinally
<00468948    jmp        00468928
 0046894A    pop        esi
 0046894B    pop        ebx
 0046894C    mov        esp,ebp
 0046894E    pop        ebp
 0046894F    ret
*}
//end;

//00468988
//procedure sub_00468988(?:TfrmMain; ?:String);
//begin
{*
 00468988    push       ebp
 00468989    mov        ebp,esp
 0046898B    add        esp,0FFFFFFF8
 0046898E    push       ebx
 0046898F    push       esi
 00468990    push       edi
 00468991    mov        dword ptr [ebp-4],edx
 00468994    mov        edi,eax
 00468996    mov        eax,dword ptr [ebp-4]
 00468999    call       @LStrAddRef
 0046899E    xor        eax,eax
 004689A0    push       ebp
 004689A1    push       468A91
 004689A6    push       dword ptr fs:[eax]
 004689A9    mov        dword ptr fs:[eax],esp
 004689AC    mov        dword ptr [ebp-8],0FFFFFFFF
 004689B3    mov        eax,dword ptr [edi+310]; TfrmMain.PopMenu:TPopupMenu
 004689B9    mov        eax,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 004689BC    call       TMenuItem.GetCount
 004689C1    mov        esi,eax
 004689C3    dec        esi
 004689C4    test       esi,esi
>004689C6    jl         004689F1
 004689C8    inc        esi
 004689C9    xor        ebx,ebx
 004689CB    mov        eax,dword ptr [edi+310]; TfrmMain.PopMenu:TPopupMenu
 004689D1    mov        eax,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 004689D4    mov        edx,ebx
 004689D6    call       TMenuItem.GetItem
 004689DB    mov        eax,dword ptr [eax+24]; TMenuItem.?f24:String
 004689DE    mov        edx,dword ptr [ebp-4]
 004689E1    call       @LStrCmp
>004689E6    jne        004689ED
 004689E8    mov        dword ptr [ebp-8],ebx
>004689EB    jmp        004689F1
 004689ED    inc        ebx
 004689EE    dec        esi
<004689EF    jne        004689CB
 004689F1    cmp        dword ptr [ebp-8],0
>004689F5    je         00468A7B
 004689FB    xor        ecx,ecx
 004689FD    mov        dl,1
 004689FF    mov        eax,[00437CD8]; TMenuItem
 00468A04    call       TMenuItem.Create; TMenuItem.Create
 00468A09    mov        ebx,eax
 00468A0B    mov        edx,dword ptr [ebp-4]
 00468A0E    mov        eax,ebx
 00468A10    call       TMenuItem.SetCaption
 00468A15    mov        dword ptr [ebx+84],edi; TMenuItem.?f84:TUrlLabel
 00468A1B    mov        dword ptr [ebx+80],4687E4; TMenuItem.OnClick:TNotifyEvent TfrmMain.MenuClick
 00468A25    cmp        dword ptr [ebp-8],0FFFFFFFF
>00468A29    je         00468A3C
 00468A2B    mov        eax,dword ptr [edi+310]; TfrmMain.PopMenu:TPopupMenu
 00468A31    mov        eax,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 00468A34    mov        edx,dword ptr [ebp-8]
 00468A37    call       TMenuItem.Delete
 00468A3C    mov        eax,dword ptr [edi+310]; TfrmMain.PopMenu:TPopupMenu
 00468A42    mov        eax,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 00468A45    mov        ecx,ebx
 00468A47    xor        edx,edx
 00468A49    call       TMenuItem.Insert
 00468A4E    mov        eax,dword ptr [edi+310]; TfrmMain.PopMenu:TPopupMenu
 00468A54    mov        eax,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 00468A57    call       TMenuItem.GetCount
 00468A5C    cmp        eax,0A
>00468A5F    jle        00468A7B
 00468A61    mov        eax,dword ptr [edi+310]; TfrmMain.PopMenu:TPopupMenu
 00468A67    mov        ebx,dword ptr [eax+28]; TPopupMenu.Items:TMenuItem
 00468A6A    mov        eax,ebx
 00468A6C    call       TMenuItem.GetCount
 00468A71    mov        edx,eax
 00468A73    dec        edx
 00468A74    mov        eax,ebx
 00468A76    call       TMenuItem.Delete
 00468A7B    xor        eax,eax
 00468A7D    pop        edx
 00468A7E    pop        ecx
 00468A7F    pop        ecx
 00468A80    mov        dword ptr fs:[eax],edx
 00468A83    push       468A98
 00468A88    lea        eax,[ebp-4]
 00468A8B    call       @LStrClr
 00468A90    ret
<00468A91    jmp        @HandleFinally
<00468A96    jmp        00468A88
 00468A98    pop        edi
 00468A99    pop        esi
 00468A9A    pop        ebx
 00468A9B    pop        ecx
 00468A9C    pop        ecx
 00468A9D    pop        ebp
 00468A9E    ret
*}
//end;

//00468AA0
//procedure sub_00468AA0(?:TfrmMain);
//begin
{*
 00468AA0    push       ebp
 00468AA1    mov        ebp,esp
 00468AA3    mov        ecx,7
 00468AA8    push       0
 00468AAA    push       0
 00468AAC    dec        ecx
<00468AAD    jne        00468AA8
 00468AAF    push       ecx
 00468AB0    push       ebx
 00468AB1    push       esi
 00468AB2    push       edi
 00468AB3    mov        ebx,eax
 00468AB5    xor        eax,eax
 00468AB7    push       ebp
 00468AB8    push       468D3C
 00468ABD    push       dword ptr fs:[eax]
 00468AC0    mov        dword ptr fs:[eax],esp
 00468AC3    lea        eax,[ebp-8]
 00468AC6    call       GetCurrentDir
 00468ACB    mov        edx,dword ptr [ebp-8]
 00468ACE    mov        eax,dword ptr [ebx+2EC]; TfrmMain.OD:TOpenDialog
 00468AD4    call       TOpenDialog.SetInitialDir
 00468AD9    lea        edx,[ebp-0C]
 00468ADC    mov        eax,dword ptr [ebx+2EC]; TfrmMain.OD:TOpenDialog
 00468AE2    call       TOpenDialog.GetFileName
 00468AE7    mov        eax,dword ptr [ebp-0C]
 00468AEA    call       FileExists
 00468AEF    test       al,al
>00468AF1    jne        00468B03
 00468AF3    mov        eax,dword ptr [ebx+2EC]; TfrmMain.OD:TOpenDialog
 00468AF9    add        eax,70; TOpenDialog.?f70:TFileName
 00468AFC    call       @LStrClr
>00468B01    jmp        00468B28
 00468B03    lea        edx,[ebp-14]
 00468B06    mov        esi,dword ptr [ebx+2EC]; TfrmMain.OD:TOpenDialog
 00468B0C    mov        eax,esi
 00468B0E    call       TOpenDialog.GetFileName
 00468B13    mov        eax,dword ptr [ebp-14]
 00468B16    lea        edx,[ebp-10]
 00468B19    call       ExtractFilePath
 00468B1E    mov        edx,dword ptr [ebp-10]
 00468B21    mov        eax,esi
 00468B23    call       TOpenDialog.SetInitialDir
 00468B28    mov        eax,dword ptr [ebx+2EC]; TfrmMain.OD:TOpenDialog
 00468B2E    mov        edx,dword ptr [eax]
 00468B30    call       dword ptr [edx+3C]; TOpenDialog.Execute
 00468B33    test       al,al
>00468B35    je         00468CF4
 00468B3B    mov        eax,dword ptr [ebx+2EC]; TfrmMain.OD:TOpenDialog
 00468B41    mov        eax,dword ptr [eax+74]; TOpenDialog.FFiles:TStrings
 00468B44    mov        edx,dword ptr [eax]
 00468B46    call       dword ptr [edx+14]; TStrings.GetCount
 00468B49    mov        esi,eax
 00468B4B    dec        esi
 00468B4C    test       esi,esi
>00468B4E    jl         00468C9F
 00468B54    inc        esi
 00468B55    mov        dword ptr [ebp-4],0
 00468B5C    lea        ecx,[ebp-18]
 00468B5F    mov        eax,dword ptr [ebx+2EC]; TfrmMain.OD:TOpenDialog
 00468B65    mov        eax,dword ptr [eax+74]; TOpenDialog.FFiles:TStrings
 00468B68    mov        edx,dword ptr [ebp-4]
 00468B6B    mov        edi,dword ptr [eax]
 00468B6D    call       dword ptr [edi+0C]; TStrings.Get
 00468B70    mov        edx,dword ptr [ebp-18]
 00468B73    lea        eax,[ebx+424]; TfrmMain.?f424:String
 00468B79    call       @LStrAsg
 00468B7E    lea        edx,[ebp-1C]
 00468B81    mov        eax,dword ptr [ebx+424]; TfrmMain.?f424:String
 00468B87    call       ExtractFileName
 00468B8C    mov        edx,dword ptr [ebp-1C]
 00468B8F    mov        eax,dword ptr [ebx+330]; TfrmMain.FileNameLabel:TLabel
 00468B95    call       TControl.SetText
 00468B9A    mov        eax,dword ptr [ebx+424]; TfrmMain.?f424:String
 00468BA0    call       00456590
 00468BA5    mov        dword ptr [ebp-30],eax
 00468BA8    mov        dword ptr [ebp-2C],edx
 00468BAB    fild       qword ptr [ebp-30]
 00468BAE    add        esp,0FFFFFFF4
 00468BB1    fstp       tbyte ptr [esp]
 00468BB4    wait
 00468BB5    lea        edx,[ebp-28]
 00468BB8    mov        eax,468D54; '### ### ###'
 00468BBD    call       FormatFloat
 00468BC2    mov        eax,dword ptr [ebp-28]
 00468BC5    lea        edx,[ebp-24]
 00468BC8    call       Trim
 00468BCD    push       dword ptr [ebp-24]
 00468BD0    push       468D68; ' '
 00468BD5    lea        ecx,[ebp-34]
 00468BD8    mov        edx,468D74; '07'
 00468BDD    mov        eax,dword ptr [ebx+308]; TfrmMain.Lang:TLanguage
 00468BE3    call       0045D424
 00468BE8    push       dword ptr [ebp-34]
 00468BEB    lea        eax,[ebp-20]
 00468BEE    mov        edx,3
 00468BF3    call       @LStrCatN
 00468BF8    mov        edx,dword ptr [ebp-20]
 00468BFB    mov        eax,dword ptr [ebx+334]; TfrmMain.FileSizeLabel:TLabel
 00468C01    call       TControl.SetText
 00468C06    xor        edx,edx
 00468C08    mov        eax,dword ptr [ebx+33C]; TfrmMain.LabelFileSizeAfter:TLabel
 00468C0E    call       TControl.SetVisible
 00468C13    xor        edx,edx
 00468C15    mov        eax,dword ptr [ebx+340]; TfrmMain.LabelCompressionFileSize:TLabel
 00468C1B    call       TControl.SetText
 00468C20    lea        edx,[ebp-3C]
 00468C23    mov        eax,dword ptr [ebx+424]; TfrmMain.?f424:String
 00468C29    call       ExtractFileName
 00468C2E    mov        ecx,dword ptr [ebp-3C]
 00468C31    lea        eax,[ebp-38]
 00468C34    mov        edx,468D80; '  '
 00468C39    call       @LStrCat3
 00468C3E    mov        eax,dword ptr [ebp-38]
 00468C41    push       eax
 00468C42    mov        eax,dword ptr [ebx+2F0]; TfrmMain.SB:TStatusBar
 00468C48    mov        eax,dword ptr [eax+1F0]; TStatusBar.Panels:TStatusPanels
 00468C4E    mov        edx,1
 00468C53    call       TStatusPanels.GetItem
 00468C58    pop        edx
 00468C59    call       TStatusPanel.SetText
 00468C5E    mov        edx,dword ptr [ebx+424]; TfrmMain.?f424:String
 00468C64    mov        eax,ebx
 00468C66    call       00468988
 00468C6B    mov        eax,dword ptr [ebx+3AC]; TfrmMain.CBAutoRun:TCheckBox
 00468C71    mov        edx,dword ptr [eax]
 00468C73    call       dword ptr [edx+0B4]; TCustomCheckBox.GetChecked
 00468C79    test       al,al
>00468C7B    je         00468C95
 00468C7D    mov        edx,dword ptr [ebx+350]; TfrmMain.TabCompress:TTabSheet
 00468C83    mov        eax,dword ptr [ebx+314]; TfrmMain.PageControl:TPageControl
 00468C89    call       TPageControl.SetActivePage
 00468C8E    mov        eax,ebx
 00468C90    call       00467CB0
 00468C95    inc        dword ptr [ebp-4]
 00468C98    dec        esi
<00468C99    jne        00468B5C
 00468C9F    nop
 00468CA0    nop
 00468CA1    nop
 00468CA2    nop
 00468CA3    nop
 00468CA4    nop
 00468CA5    nop
 00468CA6    nop
 00468CA7    nop
 00468CA8    nop
 00468CA9    nop
 00468CAA    nop
 00468CAB    mov        eax,dword ptr [ebx+2EC]; TfrmMain.OD:TOpenDialog
 00468CB1    mov        eax,dword ptr [eax+50]; TOpenDialog.FHistoryList:TStrings
 00468CB4    mov        edx,dword ptr [eax]
 00468CB6    call       dword ptr [edx+10]; TStrings.GetCapacity
 00468CB9    test       eax,eax
 00468CBB    nop
 00468CBC    nop
 00468CBD    mov        eax,dword ptr [ebx+39C]; TfrmMain.CBExit:TCheckBox
 00468CC3    call       TCustomCheckBox.GetChecked
 00468CC8    test       al,al
>00468CCA    je         00468CE2
 00468CCC    mov        eax,dword ptr [ebx+3AC]; TfrmMain.CBAutoRun:TCheckBox
 00468CD2    call       TCustomCheckBox.GetChecked
 00468CD7    test       al,al
>00468CD9    je         00468CE2
 00468CDB    mov        eax,ebx
 00468CDD    call       TCustomForm.Close
 00468CE2    nop
 00468CE3    nop
 00468CE4    nop
 00468CE5    nop
 00468CE6    nop
 00468CE7    nop
 00468CE8    nop
 00468CE9    nop
 00468CEA    nop
 00468CEB    nop
 00468CEC    nop
 00468CED    nop
 00468CEE    nop
 00468CEF    nop
 00468CF0    nop
 00468CF1    nop
 00468CF2    nop
 00468CF3    nop
 00468CF4    xor        eax,eax
 00468CF6    pop        edx
 00468CF7    pop        ecx
 00468CF8    pop        ecx
 00468CF9    mov        dword ptr fs:[eax],edx
 00468CFC    push       468D43
 00468D01    lea        eax,[ebp-3C]
 00468D04    mov        edx,3
 00468D09    call       @LStrArrayClr
 00468D0E    lea        eax,[ebp-28]
 00468D11    mov        edx,5
 00468D16    call       @LStrArrayClr
 00468D1B    lea        eax,[ebp-14]
 00468D1E    call       @LStrClr
 00468D23    lea        eax,[ebp-10]
 00468D26    call       @LStrClr
 00468D2B    lea        eax,[ebp-0C]
 00468D2E    call       @LStrClr
 00468D33    lea        eax,[ebp-8]
 00468D36    call       @LStrClr
 00468D3B    ret
<00468D3C    jmp        @HandleFinally
<00468D41    jmp        00468D01
 00468D43    pop        edi
 00468D44    pop        esi
 00468D45    pop        ebx
 00468D46    mov        esp,ebp
 00468D48    pop        ebp
 00468D49    ret
*}
//end;

//00468D84
//procedure TfrmMain.Label1MouseDown(?:?; ?:?);
//begin
{*
 00468D84    push       ebp
 00468D85    mov        ebp,esp
 00468D87    push       ebx
 00468D88    mov        ebx,edx
 00468D8A    test       cl,cl
>00468D8C    jne        00468DA8
 00468D8E    mov        eax,ebx
 00468D90    mov        edx,dword ptr ds:[420434]; TLabel
 00468D96    call       @AsClass
 00468D9B    mov        eax,dword ptr [eax+58]; TLabel.FFont:TFont
 00468D9E    mov        edx,0FF0000
 00468DA3    call       TFont.SetColor
 00468DA8    pop        ebx
 00468DA9    pop        ebp
 00468DAA    ret        0C
*}
//end;

//00468DB0
//procedure TfrmMain.Label1MouseUp(?:?; ?:?);
//begin
{*
 00468DB0    push       ebp
 00468DB1    mov        ebp,esp
 00468DB3    push       ebx
 00468DB4    mov        ebx,edx
 00468DB6    test       cl,cl
>00468DB8    jne        00468DD4
 00468DBA    mov        eax,ebx
 00468DBC    mov        edx,dword ptr ds:[420434]; TLabel
 00468DC2    call       @AsClass
 00468DC7    mov        eax,dword ptr [eax+58]; TLabel.FFont:TFont
 00468DCA    mov        edx,800000
 00468DCF    call       TFont.SetColor
 00468DD4    pop        ebx
 00468DD5    pop        ebp
 00468DD6    ret        0C
*}
//end;

//00468DDC
procedure TfrmMain.btnHelpContrentsClick;
begin
{*
 00468DDC    push       ebp
 00468DDD    mov        ebp,esp
 00468DDF    mov        eax,[0046C05C]; ^Application:TApplication
 00468DE4    mov        eax,dword ptr [eax]
 00468DE6    xor        ecx,ecx
 00468DE8    mov        edx,3
 00468DED    call       TApplication.HelpCommand
 00468DF2    pop        ebp
 00468DF3    ret
*}
end;

//00468DF4
procedure TfrmMain.btnStartUpdateClick;
begin
{*
 00468DF4    push       ebp
 00468DF5    mov        ebp,esp
 00468DF7    push       ecx
 00468DF8    mov        dword ptr [ebp-4],eax
 00468DFB    xor        eax,eax
 00468DFD    push       ebp
 00468DFE    push       468E32
 00468E03    push       dword ptr fs:[eax]
 00468E06    mov        dword ptr fs:[eax],esp
 00468E09    push       1
 00468E0B    push       0
 00468E0D    push       0
 00468E0F    push       468E3C
 00468E14    push       468E64
 00468E19    call       user32.GetDesktopWindow
 00468E1E    push       eax
 00468E1F    call       shell32.ShellExecuteA
 00468E24    xor        eax,eax
 00468E26    pop        edx
 00468E27    pop        ecx
 00468E28    pop        ecx
 00468E29    mov        dword ptr fs:[eax],edx
 00468E2C    push       468E39
 00468E31    ret
<00468E32    jmp        @HandleFinally
<00468E37    jmp        00468E31
 00468E39    pop        ecx
 00468E3A    pop        ebp
 00468E3B    ret
*}
end;

//00468E6C
procedure TfrmMain.btnCancelUpdateClick;
begin
{*
 00468E6C    push       ebp
 00468E6D    mov        ebp,esp
 00468E6F    mov        dl,1
 00468E71    mov        eax,dword ptr [eax+41C]; TfrmMain.?f41C:dword
 00468E77    call       004641E4
 00468E7C    pop        ebp
 00468E7D    ret
*}
end;

//00468E80
//procedure TfrmMain.PageControlChanging(?:?);
//begin
{*
 00468E80    push       ebp
 00468E81    mov        ebp,esp
 00468E83    push       ebx
 00468E84    push       esi
 00468E85    push       edi
 00468E86    mov        esi,edx
 00468E88    mov        ebx,eax
 00468E8A    mov        eax,esi
 00468E8C    mov        edx,dword ptr ds:[451F68]; TPageControl
 00468E92    call       @AsClass
 00468E97    mov        edi,eax
 00468E99    mov        eax,dword ptr [edi+244]; TPageControl.ActivePage:TTabSheet
 00468E9F    cmp        eax,dword ptr [ebx+380]; TfrmMain.TabOptions:TTabSheet
>00468EA5    jne        00468EB5
 00468EA7    mov        eax,dword ptr [ebx+394]; TfrmMain.CBResource:TCheckBox
 00468EAD    mov        edx,dword ptr [eax]
 00468EAF    call       dword ptr [edx+0B0]; TWinControl.SetFocus
 00468EB5    mov        eax,esi
 00468EB7    mov        edx,dword ptr ds:[451F68]; TPageControl
 00468EBD    call       @AsClass
 00468EC2    mov        eax,dword ptr [edi+244]; TPageControl.ActivePage:TTabSheet
 00468EC8    cmp        eax,dword ptr [ebx+318]; TfrmMain.TabFileOpen:TTabSheet
>00468ECE    jne        00468EDE
 00468ED0    mov        eax,dword ptr [ebx+34C]; TfrmMain.BtnOpen:TButton
 00468ED6    mov        edx,dword ptr [eax]
 00468ED8    call       dword ptr [edx+0B0]; TWinControl.SetFocus
 00468EDE    pop        edi
 00468EDF    pop        esi
 00468EE0    pop        ebx
 00468EE1    pop        ebp
 00468EE2    ret
*}
//end;

//00468EE4
procedure TfrmMain.btnFAQClick;
begin
{*
 00468EE4    push       ebp
 00468EE5    mov        ebp,esp
 00468EE7    mov        eax,[0046C05C]; ^Application:TApplication
 00468EEC    mov        eax,dword ptr [eax]
 00468EEE    mov        ecx,3C
 00468EF3    mov        edx,1
 00468EF8    call       TApplication.HelpCommand
 00468EFD    pop        ebp
 00468EFE    ret
*}
end;

//00468F10
procedure TfrmMain.BmpHistoryClick;
begin
{*
 00468F10    push       ebp
 00468F11    mov        ebp,esp
 00468F13    add        esp,0FFFFFFF0
 00468F16    push       ebx
 00468F17    push       esi
 00468F18    mov        ebx,eax
 00468F1A    mov        esi,dword ptr [ebx+320]; TfrmMain.BmpHistory:TLrsBmp
 00468F20    mov        eax,dword ptr [esi+30]; TLrsBmp.Left:Integer
 00468F23    add        eax,0A
 00468F26    mov        dword ptr [ebp-8],eax
 00468F29    mov        eax,dword ptr [esi+34]; TLrsBmp.Top:Integer
 00468F2C    sub        eax,28
 00468F2F    mov        dword ptr [ebp-4],eax
 00468F32    lea        ecx,[ebp-10]
 00468F35    lea        edx,[ebp-8]
 00468F38    mov        eax,esi
 00468F3A    call       TControl.ClientToScreen
 00468F3F    mov        eax,dword ptr [ebp-10]
 00468F42    mov        dword ptr [ebp-8],eax
 00468F45    mov        eax,dword ptr [ebp-0C]
 00468F48    mov        dword ptr [ebp-4],eax
 00468F4B    mov        ecx,dword ptr [ebp-4]
 00468F4E    mov        edx,dword ptr [ebp-8]
 00468F51    mov        eax,dword ptr [ebx+310]; TfrmMain.PopMenu:TPopupMenu
 00468F57    mov        ebx,dword ptr [eax]
 00468F59    call       dword ptr [ebx+40]; TPopupMenu.Popup
 00468F5C    pop        esi
 00468F5D    pop        ebx
 00468F5E    mov        esp,ebp
 00468F60    pop        ebp
 00468F61    ret
*}
end;

end.