unit mainunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    eXor32: TEdit;
    Label3: TLabel;
    eMD2: TEdit;
    Label4: TLabel;
    eMD5: TEdit;
    Label5: TLabel;
    eRipeMD160: TEdit;
    eSH1: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    eSHA224: TEdit;
    Label8: TLabel;
    eSHA256: TEdit;
    Label9: TLabel;
    eSHA384: TEdit;
    Label10: TLabel;
    eSHA512: TEdit;
    Button1: TButton;
    Label11: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

Uses enigma_ide64;

{$R *.lfm}

function HashToString(Digest : pointer; DigestSize : dword) : string;
var
  i : integer;
begin
  Result := '';
  for i := 0 to (DigestSize shr 2) - 1 do
  begin
    Result := Result + IntToHex(PDword(dword(Digest) + i shl 2)^, 8);
    if i <> (DigestSize shr 2 - 1) then
      Result := Result + '-';
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  Digest : array [0..63] of byte;
  DigestSize : dword;
begin
  // Get Xor32 hash
  DigestSize := EP_CryptHashStringA(HASH_XOR32, PChar(Edit1.Text), @Digest);
  eXor32.Text := HashToString(@Digest, DigestSize);
  // Get MD2 hash
  DigestSize := EP_CryptHashStringA(HASH_MD2, PChar(Edit1.Text), @Digest);
  eMD2.Text := HashToString(@Digest, DigestSize);
  // Get MD5 hash
  DigestSize := EP_CryptHashStringA(HASH_MD5, PChar(Edit1.Text), @Digest);
  eMD5.Text := HashToString(@Digest, DigestSize);
  // Get RipeMD160 hash
  DigestSize := EP_CryptHashStringA(HASH_RipeMD160, PChar(Edit1.Text), @Digest);
  eRipeMD160.Text := HashToString(@Digest, DigestSize);
  // Get SH1 hash
  DigestSize := EP_CryptHashStringA(HASH_SH1, PChar(Edit1.Text), @Digest);
  eSH1.Text := HashToString(@Digest, DigestSize);
  // Get SHA224 hash
  DigestSize := EP_CryptHashStringA(HASH_SHA224, PChar(Edit1.Text), @Digest);
  eSHA224.Text := HashToString(@Digest, DigestSize);
  // Get SHA256 hash
  DigestSize := EP_CryptHashStringA(HASH_SHA256, PChar(Edit1.Text), @Digest);
  eSHA256.Text := HashToString(@Digest, DigestSize);
  // Get SHA384 hash
  DigestSize := EP_CryptHashStringA(HASH_SHA384, PChar(Edit1.Text), @Digest);
  eSHA384.Text := HashToString(@Digest, DigestSize);
  // Get SHA512 hash
  DigestSize := EP_CryptHashStringA(HASH_SHA512, PChar(Edit1.Text), @Digest);
  eSHA512.Text := HashToString(@Digest, DigestSize);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then Exit;
  Edit2.Text := OpenDialog1.FileName;
end;

procedure TForm1.Edit2Change(Sender: TObject);
var
  Digest : array [0..63] of byte;
  DigestSize : dword;
begin
  // Get Xor32 hash
  DigestSize := EP_CryptHashFileA(HASH_XOR32, PChar(Edit2.Text), @Digest);
  eXor32.Text := HashToString(@Digest, DigestSize);
  // Get MD2 hash
  DigestSize := EP_CryptHashFileA(HASH_MD2, PChar(Edit2.Text), @Digest);
  eMD2.Text := HashToString(@Digest, DigestSize);
  // Get MD5 hash
  DigestSize := EP_CryptHashFileA(HASH_MD5, PChar(Edit2.Text), @Digest);
  eMD5.Text := HashToString(@Digest, DigestSize);
  // Get RipeMD160 hash
  DigestSize := EP_CryptHashFileA(HASH_RipeMD160, PChar(Edit2.Text), @Digest);
  eRipeMD160.Text := HashToString(@Digest, DigestSize);
  // Get SH1 hash
  DigestSize := EP_CryptHashFileA(HASH_SH1, PChar(Edit2.Text), @Digest);
  eSH1.Text := HashToString(@Digest, DigestSize);
  // Get SHA224 hash
  DigestSize := EP_CryptHashFileA(HASH_SHA224, PChar(Edit2.Text), @Digest);
  eSHA224.Text := HashToString(@Digest, DigestSize);
  // Get SHA256 hash
  DigestSize := EP_CryptHashFileA(HASH_SHA256, PChar(Edit2.Text), @Digest);
  eSHA256.Text := HashToString(@Digest, DigestSize);
  // Get SHA384 hash
  DigestSize := EP_CryptHashFileA(HASH_SHA384, PChar(Edit2.Text), @Digest);
  eSHA384.Text := HashToString(@Digest, DigestSize);
  // Get SHA512 hash
  DigestSize := EP_CryptHashFileA(HASH_SHA512, PChar(Edit2.Text), @Digest);
  eSHA512.Text := HashToString(@Digest, DigestSize);
end;

end.
