unit Unit2;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry;

type
  TForm2 = class(TForm)
    edUserName: TEdit;
    edSerialNumber: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  reg: TRegistry;
begin
  if edSerialNumber.Text = '123456789' then
  begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Acprotect\', true) then
    begin
      reg.WriteString('UserName', edUserName.Text);
      Reg.CloseKey;
    end;
    reg.Free;
  end
  else
  begin
    showmessage('wrong serial number');
  end;
end;
procedure TForm2.Button2Click(Sender: TObject);
begin
  Close;
end;

end.

