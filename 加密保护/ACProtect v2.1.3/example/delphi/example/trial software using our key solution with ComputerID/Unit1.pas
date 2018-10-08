unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    lbtrialtime: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbusername: TLabel;
    Ok: TButton;
    Label3: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    procedure OkClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  KeyCorrect: boolean;

  //function to be retrived by ACProtect to get the machineid
function GetMachineID:longint;stdcall;


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
  label1.Caption:='Ur MachineID is :   '+format('%x',[GetMachineID]);
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

//-------------------------Sample GetMachineID export fuction----------
//  This procedure will be called by acprotect for
//  setting of hardware key
//---------------------------------------------------------------------
function GetMachineID:longint;stdcall;
var i:dword;
     buf:array[0..1023]of byte;
begin
  GetVolumeInformation('c:\', nil, 0,PDWord(@Buf[1]){serial number}, I{not used}, I{not used}, nil, 0);
  result:=longint((@buf[1])^)
end;
exports GetMachineID;

end.
