unit gui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmMain = class(TForm)
    btnExit: TButton;
    Panel1: TPanel;
    lblInfo: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    lblKeyExp: TLabel;
    procedure btnExitClick(Sender: TObject);
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


procedure TfrmMain.btnExitClick(Sender: TObject);
begin
frmMain.Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var szUser            : array[0..63]  of Char;
    KeyExpirationDate : TSystemTime;

begin

// code responsible for getting name of registered user should be placed
// between DEMO_START and DEMO_END markers
{$I include\demo_start.inc}

// get registered user name, to do that function WinApi GetWindowText
// is called with parameter HWND set to -1
GetWindowTextA(HWND(-1),szUser,63);

// display registered user name, or leave UNREGISTERED VERSION text
lblInfo.Caption := szUser;

// read key expiration date
if GetWindowTextA(HWND(-5),@KeyExpirationDate,64) = 1 then
begin

lblKeyExp.Caption := Format('%d-%d-%d',[KeyExpirationDate.wDay,KeyExpirationDate.wMonth,KeyExpirationDate.wYear]);

end
else
lblKeyExp.Caption := '---';


{$I include\demo_end.inc}

// check if anything was copied to the buffer
// if not set to default
if length(szUser) = 0 then
begin
  lblInfo.Caption := 'UNREGISTERED VERSION';
  lblKeyExp.Caption := 'n/a';
end;

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
