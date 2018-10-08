unit testunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  str : shortstring;
  len : byte;
  arr : array [0..MAX_STRING_SIZE - 1] of char;
  buflen : integer;
  buf : pointer;
begin
  // This method shows how to get protected string with using shortstring type
  len := EP_ProtectedStringByKey('fyi6z02Y', @str[1], sizeof(str));
  if len > 0 then
  begin
    str[0] := char(len);
    Edit1.Text := str;
  end;
  // This method show how to get string with char array
  ZeroMemory(@arr, sizeof(arr));
  if EP_ProtectedStringByID(1, @arr, sizeof(arr)) > 0 then
  begin
    Edit2.Text := arr;
  end;
  // This method gets string length and allocs buffer for the string
  buflen := EP_ProtectedStringByKey('26Lu66Er', nil, 0);
  if buflen > 0 then
  begin
    GetMem(buf, buflen + 1); // one byte is reserved for #0 symbol (like string terminator)
    ZeroMemory(buf, buflen + 1);
    if EP_ProtectedStringByKey('26Lu66Er', buf, buflen) > 0 then
    begin
      Edit3.Text := pchar(buf);
    end;
    FreeMem(buf);
  end;
end;

end.
