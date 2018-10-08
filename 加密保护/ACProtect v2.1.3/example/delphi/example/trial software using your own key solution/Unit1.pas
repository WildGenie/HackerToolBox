unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi, Registry;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lbtrialtime: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbusername: TLabel;
    Ok: TButton;
    Label3: TLabel;
    Label6: TLabel;
    Button1: TButton;
    procedure OkClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.OkClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.ultraprotect.com', nil, nil, SW_SHOW);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Username: string;
  reg: TRegistry;
  a: byte;
begin
  a:=0;
  Username := '';
  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  if reg.OpenKey('\Software\Acprotect\', false) then
  begin
    Username := reg.ReadString('UserName');
    reg.CloseKey;
  end;
  reg.Free;

  if Username <> '' then
    lbusername.Caption := Username
  else
  begin
    MessageBox($FFFFFFFF, @a, nil, 1);
    if a > 0 then
    begin
      lbtrialtime.caption := inttostr(a);
    end
    else
    begin
      showmessage('Trial Expired!');
      Application.Terminate;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    Form2.ShowModal;
end;

end.

