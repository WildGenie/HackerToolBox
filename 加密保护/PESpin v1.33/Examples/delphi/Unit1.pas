{
*******************************************************************************
  Example in delphi by reywen^htb
*******************************************************************************
}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);   //example crypt
label bad_boy, good_code, bad_code;
var
example, i: integer;
begin
  if length(edit1.text) = 0 then goto bad_boy;

  {$I crypt_start.inc};             //********** crypt start

  i := 0;
  example := 0;

  repeat
    inc(i);
    example := example + ord(edit1.text[i]);
  until i>= length(edit1.text);

  example := example - 67;
  example := example + 16;
  example := example XOR 666;
 
  
  example := example XOR 777;
  example := example shl 2;

  i:=0;

  repeat
    inc(i);
    example := example*(i XOR (i*2));
  until i>=6;

  {$I crypt_end.inc};                 //************ crypt end

  if example = 71928000 then
  goto good_code;

  if example <> 71928000 then
  goto bad_code;

  good_code:
  messageboxa(0, 'Good pass :D', 'Example Markers', MB_OK);
  goto bad_boy;

  bad_code:
  messageboxa(0, 'Bad password. Try: PESpin', 'Example Markers', MB_OK);

  bad_boy:
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  {$I crypt_start.inc};                     //****** crypt start

  MessageBoxA(Handle, 'Example in Delphi by reywen^htb', 'Example Markers...', MB_OK);

  {$I crypt_end.inc};                       //****** crypt end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$I clear_start.inc};                       //****** clear start

Caption := 'PESpin Markers Test';

{$I clear_end.inc};                         //****** clear end
end;

end.

//*** examples by reywen^htb ***
