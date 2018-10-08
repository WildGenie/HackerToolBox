unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ZprotectSDK;

type
  TForm1 = class(TForm)
    Button1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
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
procedure ShowInfo();
begin
  if (ZP_GetRegistrationState(0) = False) then
  begin
    Form1.lbl2.Caption := 'Trial Version';
    Exit;
  end;
  form1.lbl2.Caption := 'Personal Edition';
  if (ZP_GetRegistrationState(1) = True) then
  begin
    form1.lbl2.Caption := 'Professional Edition'+'   Licensed to: ['+ ZP_GetUserName()+']';
    Exit;
  end;
  if (ZP_GetRegistrationState(2) = True) then
  begin
    form1.lbl2.Caption := 'Enterprise Edition'+'   Licensed to: ['+ ZP_GetUserName()+']';
    Exit;
  end;
end;

function MyShowRegWndProc():integer;stdcall;
begin
  Form2.ShowModal();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //注册自己的注册提示窗口处理过程
  ZP_RegShowRegWndProc(@MyShowRegWndProc);
  ShowInfo();
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ZP_ShowRegWindow();
  ShowInfo();
end;

end.
