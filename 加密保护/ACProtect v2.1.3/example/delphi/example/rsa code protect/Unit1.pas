unit Unit1;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ShellApi;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  KeyCorrect:boolean;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//example of RSA key lock,this will prevent the cracker to write out the KeyGen of the software
  //the code between the "RSA lock code begin" and "RSA lock code end" will be locked with the RSA1024 keypair,
  //without the correct RSA key Public key,the code locked can not be unlock,so the function is limited to those who have the correct key.dat
  //used to generate the function limit software.
  
  KeyCorrect:=false;
  {$I ..\..\include\regonly_begin.inc}       //RSA lock code begin
      showmessage('RSA KEy Lock Example'+char($0d)+char($0a)+'if you have no the correct key.dat,you can not see me');
      KeyCorrect:=true;
  {$I ..\..\include\regonly_end.inc}         //RSA lock code end
  if keycorrect=true then showmessage('Valid user :-)')
  else showmessage('Invalid user :-<');
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
 ShellExecute(0, 'open', 'http://www.ultraprotect.com', nil, nil, SW_SHOW);
end;

end.
