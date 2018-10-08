unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ZprotectSDK;

type
  TForm2 = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Button1: TButton;
    Button2: TButton;
    mmo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  edt1.Text := ZP_GetHardwareIDStr();
  edt2.Text := ZP_GetUserName();
  mmo1.Text := ZP_GetKeyBuffer();
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Close();
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  pResult:Integer;
begin
  pResult := ZP_RegByKeyStr(PChar(mmo1.Text),PChar(edt2.Text));
  case pResult of
  KEY_OK:
    begin
      ShowMessage('注册成功，感谢您注册本软件！');
      Close();
    end;
  KEY_INVALID..KEY_BLOCKED:
    begin
      ShowMessage('错误的序列号！');
    end;
  end;
end;

end.
