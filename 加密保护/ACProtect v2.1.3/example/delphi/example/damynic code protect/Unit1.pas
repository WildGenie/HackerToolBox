unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Controls, StdCtrls, Classes,forms,dialogs,shellapi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
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
  //example of dynamic code lock
  //the code between the dynamic lock begin and end flag will be crypted,when running,the code will be decrypted first,then run,after the running ,
  //it will be encrypted again to prevent dumpping and static analysis.

  {$I ..\..\include\critic_begin.inc}        //dynamic lock begin
  showmessage('dynamic lock code example:'+char($0d)+char($0a)+'first decrypt this code,then run ,it will be encrypted again after run!');
  {$I ..\..\include\critic_end.inc}          //dynamic lock end
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.ultraprotect.com', nil, nil, SW_SHOW);
end;

end.
