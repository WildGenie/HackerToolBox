unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    mRegInfo: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    eHardwareID: TEdit;
    mRegKey: TMemo;
    Label3: TLabel;
    btnGenerate: TButton;
    btnSaveDialog: TButton;
    Button3: TButton;
    SaveDialog: TSaveDialog;
    lDate: TLabel;
    eExpireDate: TEdit;
    procedure btnGenerateClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnSaveDialogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

{$I include\asp_keygen.inc}

procedure TfrmMain.btnGenerateClick(Sender: TObject);
var
  Params  : TParams;
  RegData : String;
  KeyData : array[1..1024] of byte;
  Res     : DWORD;
  Key     : String;
begin
  RegData := Trim(mRegInfo.Text);
  FillChar(Params,SizeOf(Params),0);
  with Params do
  begin
    RegInfo         := PChar(RegData);
    RegInfoLen      := Length(RegData);

    HardwareID      := PChar(Trim(eHardwareID.Text));

    A               := 'SahqUZft3hfIzx7XhMLr/A==';
    E               := 'iex+hjO8FQcdxCAqVjvW20dKIBeqZDWYgW8sXAKBhxaewHwc3m3e5Wkykzt9yRX1tkK/0V2jy42o2oKULp0unkf31JTfL+TsCQWTIATt9IjrbdK/mJv0HsYAhbdJr+QQh20CVwrwocxP9foUrkUedZijKtRE8/NuOEijp5EXPH0=';
    N               := '7/bjxkM0GGdnj7zMFMbN/PvBhQ5RyTNOxtoApRc3fs4qRA4EUVqbipB3LxzEChBz7CR4UWc9rvCOqsveEM53t4zdMPAGZE/9Uelt96byKlT22azRFXQvbvLF2wbAXJrEkvKoaTS9uib7e5RRRdiEyZeMnrm4vjbbGIE+7562XoE=';

    RegKey          := @KeyData[1];
    RegKeySize      := SizeOf(KeyData);

    if Trim( eExpireDate.Text ) <> '' then
      with ExpirationDate do
      begin
        Day   := StrToInt( Copy( eExpireDate.Text, 1, 2 ));
        Month := StrToInt( Copy( eExpireDate.Text, 4, 2 ));
        Year  := StrToInt( Copy( eExpireDate.Text, 7, 4 ));
      end;

    If (HardwareID <> nil) AND
       (StrLen(HardwareID) > 0) then
    If CheckHardwareID( HardwareID ) = False then
    begin
      MessageBox(Handle,PChar('Invalid HardwareID key!'),'Error',0);
      Exit;
    end;

    Res := RegistrationKeyGenerate( Params );

    if Res > 0 then
    begin
      SetLength(Key, Res);
      CopyMemory(@Key[1], RegKey, Res);
      mRegKey.Text := Key;
    end
    else
      MessageBox(Handle,PChar('Small buffer (need '+IntToStr(RegKeySize)+' bytes)'),'Error',0);

  end;
end;
procedure TfrmMain.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnSaveDialogClick(Sender: TObject);
const
  RegistrySubKey = 'HKEY_LOCAL_MACHINE\Software\Test';
  RegistryKey    = 'Key';
begin
  if Trim(mRegKey.Text) = '' then MessageBox(Handle, 'The registration key is empty! Generate it before.','Error',MB_ICONSTOP)
  else
  begin
    SaveDialog.InitialDir := ExtractFilePath(ParamStr(0));
    if SaveDialog.Execute then
      RegistrationKeySave(PChar(SaveDialog.FileName), RegistrySubKey, RegistryKey, PChar(Trim(mRegKey.Text)));
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  eExpireDate.Text := FormatDateTime( 'DD.MM.YYYY', Now + 30 );
end;

end.