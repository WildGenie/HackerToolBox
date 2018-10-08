unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SELicenseSDK, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Info: sSELicenseUserInfo;
begin

  {$I PROTECT_START.inc}
   SEGetLicenseUserInfo(@Info);
   ShowMessage(Info.UserID);
  {$I PROTECT_END.inc}
end;

procedure TForm1.Button2Click(Sender: TObject);
var Info: sSELicenseUserInfo;
begin
  {$I PROTECT_START.inc}
   SEGetLicenseUserInfo(@Info);
   ShowMessage(Info.Remarks);
  {$I PROTECT_END.inc}
end;

procedure TForm1.Button3Click(Sender: TObject);
begin                     
  {$I PROTECT_START.inc}
  if SECheckProtection() = SELICENSE_ERR_SUCCESS then
    ShowMessage('Success.')
  else
    ShowMessage('Failed.');
  {$I PROTECT_END.inc}
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ShowMessage(SEDecodeStringA('Ansi String'));
  ShowMessage(SEDecodeStringW('Wide String'));
end;

end.
