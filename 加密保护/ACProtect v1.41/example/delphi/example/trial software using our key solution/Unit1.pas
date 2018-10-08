unit Unit1;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi;

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
    procedure OkClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

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
var usrname: array[0..255] of char;
  a: byte;
begin
  fillchar(usrname, 256, #0);
  //Get User name from UltraProtect loader
  MessageBox($FFFFFFFF, @usrname[0], nil, 0);
  if trim(usrname) <> '' then
    lbusername.caption := usrname
  else
  begin
    lbusername.caption := 'unregistered user';
    //Get Trial UsageTime from UltraProtect loader if required
    MessageBox($FFFFFFFF, @a, nil, 1);
    lbtrialtime.caption := inttostr(a);
  end;
end;

end.

