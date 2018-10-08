unit test_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CommCtrl, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    lbTime: TLabel;
    btnClose: TButton;
    tTimer: TTimer;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tTimerTimer(Sender: TObject);
  private
    { Private declarations }
    FProgressHandle : dword;
    FPercent : integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses enigma_ide;

{$R *.dfm}

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  wnd : dword;
begin
  lbTime.Caption := TimeToStr(Now);
  // Show nag
  wnd := EP_SplashScreenShow;
  if wnd <> 0 then
  begin
    // Create progress bar
    FPercent := 0;
    FProgressHandle := CreateWindowEx(0, PROGRESS_CLASS, nil, WS_CHILD or WS_VISIBLE, 20, 350, 490, 30, wnd, 0, 0, nil);
    SendMessage(FProgressHandle, PBM_SETRANGE, 0, MAKELPARAM(0, 100));
    SendMessage(FProgressHandle, PBM_SETSTEP, 1, 0);
    tTimer.Enabled := true;
  end;
end;

procedure TForm1.tTimerTimer(Sender: TObject);
begin
  if FPercent >= 100 then
  begin
    tTimer.Enabled := false;
    DestroyWindow(FProgressHandle);
    EP_SplashScreenHide;
    SetForegroundWindow(Self.Handle);
  end;
  SendMessage(FProgressHandle, PBM_STEPIT, 0, 0);
  inc(FPercent);
end;

end.
