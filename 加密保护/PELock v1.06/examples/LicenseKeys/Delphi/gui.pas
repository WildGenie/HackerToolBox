unit gui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    lblInfo: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

procedure SaveOptions;
begin
{$I include\demo_start.inc}
// DO1;
// DO2;
// DO3;
{$I include\demo_end.inc}

end;


procedure TfrmMain.Button1Click(Sender: TObject);
begin
frmMain.Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
{$I include\demo_start.inc}

lblInfo.Caption := 'Hello world from registered version';

{$I include\demo_end.inc}

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var iFlag:integer;
begin

iFlag := 0;

{$I include\demo_start.inc}

// do things that arent available without license key, eg. saving
// configuration etc.
if iFlag = 0 then
begin
SaveOptions;
// MakeBackup;
// Do1;
// Do2;
// Do3;

// set registration flag, but keep in mind, that using registration
// flag isnt safe, it can be easily cracked, you should put between
// DEMO_START and DEMO_END markers as much code as you can, so it would
// be impossible to recover it without valid license key
iFlag := 1;
end;
{$I include\demo_end.inc}

// display demo nagscreen
if iFlag = 0 then
begin
MessageDlg('Please register!',mtInformation,[mbOk],0);
end;

end;

end.
