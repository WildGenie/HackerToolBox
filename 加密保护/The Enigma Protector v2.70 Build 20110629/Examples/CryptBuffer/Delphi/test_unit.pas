unit test_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    eSource: TEdit;
    Label2: TLabel;
    mEncrypted: TMemo;
    Label3: TLabel;
    eDecrypted: TEdit;
    GroupBox1: TGroupBox;
    ePassword: TEdit;
    procedure eSourceChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses enigma_ide;

{$R *.dfm}

procedure TForm1.eSourceChange(Sender: TObject);
var
  encode_string : PAnsiChar;
  base16 : string;
  str_len : integer;
  i : integer;
begin
  encode_string := PAnsiChar(eSource.Text);
  str_len := strlen(encode_string);
  EP_CryptEncryptBuffer(encode_string, str_len, PAnsiChar(ePassword.Text));
  // Calculate base16 string
  base16 := '';
  for i := 0 to str_len - 1 do
  begin
    base16 := base16 + IntToHex(PByte(encode_string + i)^, 2);
  end;
  mEncrypted.Text := base16;
  // Decrypt string
  EP_CryptDecryptBuffer(encode_string, str_len, PAnsiChar(ePassword.Text));
  eDecrypted.Text := encode_string;
end;

end.
