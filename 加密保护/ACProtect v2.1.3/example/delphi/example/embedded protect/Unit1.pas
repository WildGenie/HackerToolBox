unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Forms,
  Dialogs, StdCtrls,ShellApi, Controls, Classes;

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

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//example of embedded protect,

  //ACProtector will embedded a cryptor(include anti-debug,anti-trace,encrypt,decrypt fucntions etc.)here.
  //The Cryptor encrypt the codes between the embedded lock header and embedded lock tail ,then communicate with the loader;
  //After checking,then decrypt the codes,and run the decrypted code .
  //After the Running ,all the codes (include the embedded cryptor and the crypted code) will de destroyed.
  //So the cracker can not dump the code from memory to analysis.and the cracker can not strip loader away .
  //used to protect init code and password check function etc. ( run only once and very important)

  {$I ..\..\include\protect_begin.inc}    //the embedded lock header and sapce
  showmessage('Embed protect example'+char($0d)+char($0a)+'The code can run only once,after run,the code will Keep original encrypted status!');
  {$I ..\..\include\protect_end.inc}      //the embedded lock tail and sapce
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.ultraprotect.com', nil, nil, SW_SHOW);
end;

end.
