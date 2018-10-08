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
    Label7: TLabel;
    edA: TEdit;
    Label8: TLabel;
    edB: TEdit;
    Label9: TLabel;
    Button1: TButton;
    Label10: TLabel;
    edD: TEdit;
    Label11: TLabel;
    edE: TEdit;
    Label12: TLabel;
    edF: TEdit;
    Button2: TButton;
    edC: TEdit;
    procedure OkClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  KeyCorrect: boolean;


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

//example of embedded protect,
procedure TForm1.FormCreate(Sender: TObject);
var usrname: array[0..255] of char;
  a: byte;
begin

  //ACProtector will embedded a cryptor(include anti-debug,anti-trace,encrypt,decrypt fucntions etc.)here.
  //The Cryptor encrypt the codes between the embedded lock header and embedded lock tail ,then communicate with the loader;
  //After checking,then decrypt the codes,and run the decrypted code .
  //After the Running ,all the codes (include the embedded cryptor and the crypted code) will de destroyed.
  //So the cracker can not dump the code from memory to analysis.and the cracker can not strip loader away .
  //used to protect init code and password check function etc. ( run only once and very important)
{$I ..\..\include\protect_begin.inc} //the embedded lock header and sapce

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
{$I ..\..\include\protect_end.inc} //the embedded lock tail and sapce
end;

//rsa code protect
procedure TForm1.Button1Click(Sender: TObject);
begin
//example of RSA key lock,this will prevent the cracker to write out the KeyGen of the software
  //the code between the "RSA lock code begin" and "RSA lock code end" will be locked with the RSA1024 keypair,
  //without the correct RSA key Public key,the code locked can not be unlock,so the function is limited to those who have the correct key.dat
  //used to generate the function limit software.

  KeyCorrect := false;
{$I ..\..\include\regonly_begin.inc} //RSA lock code begin
  edC.Text := InttoStr(StrtoInt(edA.Text) + StrtoInt(edB.Text));
  KeyCorrect := true;
{$I ..\..\include\regonly_end.inc} //RSA lock code end
  if keycorrect = false then showmessage('Only licensed user can use this function')
end;

  //dynamic code lock
procedure TForm1.Button2Click(Sender: TObject);
begin

  //the code between the dynamic lock begin and end flag will be crypted,when running,the code will be decrypted first,then run,after the running ,
  //it will be encrypted again to prevent dumpping and static analysis.
{$I ..\..\include\critic_begin.inc} //dynamic lock begin
  edF.Text := InttoStr(StrtoInt(edD.Text) - StrtoInt(edE.Text));
{$I ..\..\include\critic_end.inc} //dynamic lock end
end;


end.
