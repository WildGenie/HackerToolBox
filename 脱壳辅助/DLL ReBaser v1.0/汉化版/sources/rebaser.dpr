{ +=======================================================================+ }
{ | DLL ReBaser v1.0 sources by Dr.Golova                                 | }
{ +=======================================================================+ }

program peoptim;
{$R rebaser.res}
uses
  Windows, Messages, PE_Files;

{ ########################################################################## }

const       { Dialog's controls ID }
  MAIN_DIALOG                    =    101;
  ABOUT_DIALOG                   =    102;
  MAIN_ICON                      =    201;
  LOGO                           =    301;
  FILE_EDIT                      =    401;
  INFO_EDIT                      =    402;
  ORIG_EDIT                      =    403;
  NEW_EDIT                       =    404;
  FILE_BUTTON                    =    501;
  PROCESS_BUTTON                 =    502;
  ABOUT_BUTTON                   =    503;
  CLOSE_BUTTON                   =    504;
  ABOUT_CLOSE_BUTTON             =    505;
  BACKUP_BOX                     =    601;
  OVERLAY_BOX                    =    602;
  SAVE_BOX                       =    603;

type
  TOpenFileName = packed record
    lStructSize: DWORD;
    hWndOwner: HWND;
    hInstance: HINST;
    lpstrFilter: PAnsiChar;
    lpstrCustomFilter: PAnsiChar;
    nMaxCustFilter: DWORD;
    nFilterIndex: DWORD;
    lpstrFile: PAnsiChar;
    nMaxFile: DWORD;
    lpstrFileTitle: PAnsiChar;
    nMaxFileTitle: DWORD;
    lpstrInitialDir: PAnsiChar;
    lpstrTitle: PAnsiChar;
    Flags: DWORD;
    nFileOffset: Word;
    nFileExtension: Word;
    lpstrDefExt: PAnsiChar;
    lCustData: LPARAM;
    lpfnHook: function(Wnd: HWND; Msg: UINT; wParam: WPARAM;
      lParam: LPARAM): UINT stdcall;
    lpTemplateName: PAnsiChar;
  end;

const
  OFN_LONGNAMES     = $00200000;
  OFN_EXPLORER      = $00080000;
  OFN_FILEMUSTEXIST = $00001000;
  OFN_PATHMUSTEXIST = $00000800;
  OFN_HIDEREADONLY  = $00000004;

function GetOpenFileNameA(var OpenFile: TOpenFileName): Bool; stdcall;
external 'comdlg32.dll' name 'GetOpenFileNameA';

{ ########################################################################## }

var
  Inst, hWnd       : Integer;
  FileName         : array[0..4095] of Char;
  PE               : PE_File = nil;
  Info             : String;

  OriginalBase     : DWord  = 0;
  NewBase          : DWord  = 0;

  DoBackUp         : boolean = true;
  DoOverlay        : boolean = true;
  DoSave           : boolean = false;

const
  Copyright  = 'DLL ReBaser v1.0 by Dr.Golova'   + #13#10 +
               'mailto: dr.golova@reversing.net' + #13#10 +
               'http://www.uinc.ru'              + #13#10 + 
               '汉化 BY RegKiller' + #13#10 +#13#10;

  OptionsKey = 'SOFTWARE\UinC\DllReBaser\';

{ ########################################################################## }

{ First realy stupid string formatting function. }
function IntToHex8(Inp : DWord): String;
const FmtStr : PChar = '%8.8X'#0;
var   OutStr : array[0..9] of Char;
begin
  asm
    push  Inp
    push  FmtStr;
    lea   eax, OutStr[0]
    push  eax
    call  wsprintfA
    add   esp, 4*3
  end;
  Result := String(OutStr);
end;

{ Second realy stupid string formatting function. }
function Hex8ToInt(Hex8 : String): DWord;
var Code : Integer;
begin
  if Hex8[1] = '$' then Delete(Hex8, 1, 1);
  while Hex8[1] = '0' do Delete(Hex8, 1, 1);
  Val('$' + Hex8, Result, Code);
  if Code <> 0 then Result := 0;
end;

{ +----------------------------------------------+ }
{ | Set value to Original/New ImageBase EditBox. | }
{ +----------------------------------------------+ }
procedure SetBase(EditID: DWord; Base : DWord);
begin
  SetDlgItemText(hWnd, EditID, PChar(IntToHex8(Base)));
end;

{ +----------------------------------------------+ }
{ | Get value of Original/New ImageBase EditBox. | }
{ +----------------------------------------------+ }
function GetBase(EditID: DWord): DWord;
var TmpStr : array[0..1023] of Char;
begin
  GetDlgItemText(hWnd, EditID, PChar(@TmpStr[0]), 1024);
  Result := Hex8ToInt(String(PChar(@TmpStr[0])));
end;

{ +------------------------------------+ }
{ | Add string to INFO_EDIT.           | }
{ +------------------------------------+ }
procedure AddInfo(Info: String);
var
  OldInfo : array[0..65534] of Char;
begin
  GetDlgItemText(hWnd, INFO_EDIT, PChar(@OldInfo), 65535);
  SetDlgItemText(hWnd, INFO_EDIT, PChar(String(OldInfo) + Info));
end;

{ +--------------------------------+ }
{ | Create backup copy of file.    | }
{ +--------------------------------+ }
function MakeBackUp : boolean;
var
  FindData : _WIN32_FIND_DATAA;
begin
  Result := false;
  if (DoBackUp = false) or (String(FileName) = '') then Exit;

  if FindFirstFile(PChar(String(FileName) + '.bak'), FindData) <>
     INVALID_HANDLE_VALUE then
  begin
    if MessageBox(hWnd, PChar('备份文件已存在 ' + String(FileName)+'.bak'+
                  ' ?!?!?!'),'警告...',MB_OKCANCEL or MB_ICONWARNING)= IDOK
    then begin
      CopyFile(FileName, PChar(String(FileName) + '.bak'), false);
      Result := true;
    end;
  end else begin
    CopyFile(FileName, PChar(String(FileName) + '.bak'), false);
    Result := true;
  end;
end;

{ +--------------------------------------------+ }
{ | Restore backup file to its original name.  | }
{ +--------------------------------------------+ }
procedure RestoreBackUp;
begin
  MoveFileEx(PChar(String(FileName) + '.bak'), FileName,
    MOVEFILE_REPLACE_EXISTING);
end;

{ +---------------------------------+ }
{ | Read options from checkboxes.   | }
{ +---------------------------------+ }
procedure GetOptions;
begin
  if SendDlgItemMessage(hWnd, BACKUP_BOX, BM_GETCHECK, 0, 0) = 1 then
    DoBackUp := true else DoBackUp := false;
  if SendDlgItemMessage(hWnd, OVERLAY_BOX, BM_GETCHECK, 0, 0) = 1 then
    DoOverlay := true else DoOverlay := false;
  if SendDlgItemMessage(hWnd, SAVE_BOX, BM_GETCHECK, 0, 0) = 1 then
    DoSave := true else DoSave := false;
end;

{ +---------------------------------+ }
{ | Apply options to checkboxes.    | }
{ +---------------------------------+ }
procedure SetOptions;
begin
  SendDlgItemMessage(hWnd, BACKUP_BOX, BM_SETCHECK, DWord(DoBackUp), 0);
  SendDlgItemMessage(hWnd, OVERLAY_BOX, BM_SETCHECK, DWord(DoOverlay), 0);
  SendDlgItemMessage(hWnd, SAVE_BOX, BM_SETCHECK, DWord(DoSave), 0);
end;

{ +------------------------------------+ }
{ | Save options to registry.          | }
{ +------------------------------------+ }
procedure SaveOptions;
var
  Key     : HKEY;
  Res     : DWord;
  Options : array[1..2] of boolean;
begin
  GetOptions;
  RegCreateKeyEx(HKEY_LOCAL_MACHINE, OptionsKey, 0, nil,
    REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, nil, Key, @Res);
  Options[1] := DoBackUp;
  Options[2] := DoOverlay;
  RegSetValueEx(Key, '', 0, REG_BINARY, @Options, SizeOf(Options));
  RegCloseKey(Key);
end;

{ +------------------------------------+ }
{ | Load options from registry.        | }
{ +------------------------------------+ }
procedure LoadOptions;
var
  Key     : HKEY;
  Res1    : DWord;
  Res2    : DWord;
  Options : array[1..2] of boolean;
begin
  RegCreateKeyEx(HKEY_LOCAL_MACHINE, OptionsKey, 0, nil,
    REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, nil, Key, @Res1);
  if Res1 = REG_CREATED_NEW_KEY then Exit;
  if (RegQueryValueEx(Key, '', nil, @Res1, @Options, @Res2) <> ERROR_SUCCESS)or
     (Res1 <> REG_BINARY) then Exit;
  RegCloseKey(Key);
  DoBackUp   := Options[1];
  DoOverlay  := Options[2];
  SetOptions;
end;

procedure DoWork;
begin
  SetDlgItemText(hWnd, INFO_EDIT, '');
  AddInfo(Copyright);
  if String(FileName) = '' then begin
    AddInfo('请先选择文件...' + #13#10);
    Exit;
  end;

  AddInfo('映射输入文件... ');
  PE.LoadFromFile(String(FileName));
  case PE.LastError of
    E_OK             : Info := '完成.';
    E_FILE_NOT_FOUND : Info := '失败.' + #13#10#13#10 + '文件没找到 !';
    E_CANT_OPEN_FILE : Info := '失败.' + #13#10#13#10 + '无法打开文件 ! 共享违规 ?';
    E_ERROR_READING  : Info := '失败.' + #13#10#13#10 + '读文件错误 ! 文件被破坏 ?';
    E_NOT_ENOUGHT_MEMORY : Info := '失败.' + #13#10#13#10 +
      '内存不足 !';
    E_INVALID_PE_FILE : Info := '失败.' + #13#10#13#10 +
      '无效的 PE 结构或不是 Win32 PE 文件 !';
  end;
  AddInfo(Info + #13#10#13#10);

  if PE.LastError <> E_OK then Exit;

  SetBase(ORIG_EDIT, PE.PE_Header.Image_Base);
  SetBase(New_EDIT,  PE.PE_Header.Image_Base);
end;

{ +---------------------------------------+ }
{ | Show dialog for input file selecting. | }
{ +---------------------------------------+ }
procedure SelectFile;
const
  Filter = 'Any PE File (*.exe,*.scr,*.dll,*.ocx)'#0'*.exe;*.scr;*.dll;*.ocx'#0+
           'Any File (*.*)'#0'*.*'#0#0;
  Title  = '打开或优化 PE 文件...';
var
  OpenFile : TOpenFileName;
begin
  FillChar(OpenFile, SizeOf(TOpenFileName), 0);

  with OpenFile do begin
    lStructSize  := SizeOf(TOpenFileName);
    hInstance    := Inst;
    hWndOwner    := hWnd;
    lpstrFilter  := Filter;
    nFilterIndex := 3;
    nMaxFile     := SizeOf(FileName);
    lpstrFile    := FileName;
    lpstrTitle   := Title;
    Flags        := OFN_LONGNAMES or OFN_EXPLORER or OFN_FILEMUSTEXIST or
                    OFN_PATHMUSTEXIST or OFN_HIDEREADONLY;

    if GetOpenFileNameA(OpenFile) <> true then Exit;

    SetDlgItemText(hWnd, FILE_EDIT, lpstrFile);
    GetDlgItemText(hWnd, FILE_EDIT, FileName, 4096);
  end;

  DoWork;
end;

{ +------------------------------------+ }
{ | Process file.                      | }
{ +------------------------------------+ }
procedure ProcessFile;
var BackUpCreated : boolean;
begin
  BackUpCreated := false;
  GetOptions;
  PE.PreserveOverlay := DoOverlay;
  Info := '';
  SetDlgItemText(hWnd, INFO_EDIT, '');
  AddInfo(Copyright);
  try
    if FileName[0] = #00 then begin
      AddInfo('请先选择文件 !' + #13#10);
      Exit;
    end;

    PE.LoadFromFile(String(FileName));
    if PE.LastError <> E_OK then begin
      AddInfo('错误的文件格式或不是 Win32 PE 镜像 !' + #13#10);
      Exit;
    end;

    if (PE.PE_Header.Fix_Up_Table_RVA = 0)or(PE.PE_Header.Fix_Up_Data_Size = 0)
    then begin
      AddInfo('无法处理文件, 当前镜像中没有重定位 !' + #13#10);
      Exit;
    end;

    OriginalBase := GetBase(ORIG_EDIT);
    NewBase      := GetBase(NEW_EDIT);
    if OriginalBase = NewBase then begin
      AddInfo('未处理,原始的镜像基址与新的镜像基址相同 !' + #13#10);
      Exit;
    end;
    if NewBase = 0 then begin
      AddInfo('新的镜像大小值错误 !' + #13#10);
      Exit;
    end;

    AddInfo('重建镜像基址 ' + String(FileName) + #13#10 +
            '====================' + #13#10);

    AddInfo('创建备份文件... ');
    BackUpCreated := MakeBackUp;
    if BackUpCreated = true then Info := '完成' else Info := '跳过';
    AddInfo(Info + #13#10);

    AddInfo('重建镜像基址... ');
    PE.ReBasePEFile(NewBase);
    if PE.LastError = E_OK then Info := '完成' else Info := '失败';
    AddInfo(Info + #13#10);
    if PE.LastError <> E_OK then begin
      AddInfo(#13#10 + '无法处理文件或破坏了修正的数据 !' + #13#10);
      Exit;
    end;

    AddInfo('清除文件效验和... 完成' + #13#10);
    PE.FlushFileCheckSum;

    AddInfo('保存文件... ');
    PE.SaveToFile(String(FileName));
    case PE.LastError of
      E_OK             : Info := '完成';
      E_CANT_OPEN_FILE : Info := '失败.'+#13#10#13#10+'无法打开文件 ! 共享违规 ?';
      E_ERROR_WRITING  : Info := '失败.' + #13#10 + String(FileName) +' 文件不可写 !';
    end;
    AddInfo(Info + #13#10);
    if (PE.LastError <> E_OK) then begin
      if BackUpCreated then RestoreBackUp;
      Exit;
    end;

    AddInfo('====================' + #13#10 + '重建镜像基址完成.' + #13#10 +
            '重建镜像基址 0x' + IntToHex8(OriginalBase) + ' 为 0x' +
            IntToHex8(NewBase) + #13#10);

    SetBase(ORIG_EDIT, NewBase);
  except
    AddInfo(#13#10#13#10'致命的未知内部错误 !'#13#10);
    if BackUpCreated then RestoreBackUp;
  end;
end;

procedure MainDlgInit;
var
  hIcon, hFont, I : Integer;
  TmpStr          : String;
begin
  hIcon := LoadIcon(Inst, PChar(MAIN_ICON));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, hIcon);
  SendMessage(hWnd, WM_SETICON, ICON_BIG,   hIcon);

  hFont :=CreateFont(12,0, 0, 0, FW_NORMAL, 0, 0, 0,
              ANSI_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,
              DEFAULT_QUALITY,DEFAULT_PITCH,'宋体');




  if hFont <> 0 then SendDlgItemMessage(hWnd, INFO_EDIT, WM_SETFONT, hFont, 0);

  LoadOptions;
  SetOptions;
  SetBase(ORIG_EDIT, 0);
  SetBase(NEW_EDIT, 0);

  if ParamCount > 0 then begin
    TmpStr := ParamStr(1);
    for I:= 1 to Length(TmpStr) do FileName[I-1]:=TmpStr[I];
    FileName[Length(TmpStr)] := #00;
    SetDlgItemText(hWnd, FILE_EDIT, FileName);
    DoWork;
  end;

end;

{ ######################## Dialog Functions. ############################### }

procedure EndWork;
begin
  EndDialog(hWnd, 0);
  PE.Free;
  GetOptions;
  if DoSave = true then SaveOptions;
  ExitProcess(0);
end;

function AboutDlgProc(hWin, uMsg, wParam, lParam : Integer) : Integer; stdcall;
begin
  Result := 0;
  if (uMsg = WM_DESTROY) or  (uMsg   = WM_CLOSE) or
    ((uMsg = WM_COMMAND) and (wParam = ABOUT_CLOSE_BUTTON))
  then EndDialog(hWin,0);
end;

function MainDlgProc(hWin, uMsg, wParam, lParam : Integer) : Integer; stdcall;
begin
  Result := 0;
  case uMsg of
    WM_COMMAND    : begin
                      if wParam = CLOSE_BUTTON then EndWork;
                      if wParam = PROCESS_BUTTON then ProcessFile;
                      if wParam = FILE_BUTTON then SelectFile;
                      if wParam = ABOUT_BUTTON then
                        DialogBoxParam(Inst, PChar(ABOUT_DIALOG), hWin,
                                       @AboutDlgProc, 0);

                    end;
    WM_INITDIALOG : begin
                      hWnd := hWin;
                      MainDlgInit;
                    end;
    WM_DESTROY,
    WM_CLOSE      : EndWork;
  end;
end;

{ ########################################################################## }

begin
  Inst := hInstance;
  PE := PE_File.Create;
  PE.ShowDebugMessages := false;
  FileName[0] := #00;
  DialogBoxParam(Inst, PChar(MAIN_DIALOG), 0, @MainDlgProc, 0);
end.


