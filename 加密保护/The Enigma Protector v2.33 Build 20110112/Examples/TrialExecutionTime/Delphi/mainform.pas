unit mainform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmMain = class(TForm)
    tmTimer: TTimer;
    lbLabel1: TLabel;
    eGlobalTime: TEdit;
    lbExecutionTime: TLabel;
    eExecutionTime: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eTotalExecutionTime: TEdit;
    eLeftExecutionTime: TEdit;
    btnExit: TButton;
    eStatus: TEdit;
    procedure tmTimerTimer(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  dwExecutionTime : dword = 0;

implementation

uses enigma_ide;

{$R *.dfm}

procedure TfrmMain.tmTimerTimer(Sender: TObject);
var
  lpSystemTime : _SYSTEMTIME;
  dwMinutesTotal : Cardinal;
  dwMinutesLeft : Cardinal;
begin
  // Here we set current time to edit
  GetSystemTime(lpSystemTime);
  eGlobalTime.Text := format('%.2d:%.2d:%.2d', [lpSystemTime.wHour, lpSystemTime.wMinute, lpSystemTime.wSecond]);
  // Set the execution time
  inc(dwExecutionTime, tmTimer.Interval);
  eExecutionTime.Text := format('%.2d:%.2d:%.2d', [(dwExecutionTime div (60*60*1000)) mod 24, (dwExecutionTime div (60*1000)) mod 60, (dwExecutionTime div (1000)) mod 60]);
  // Get total and left minutes of execution
  if EP_TrialExecutionTime(dwMinutesTotal, dwMinutesLeft) then
  begin
    eStatus.Color := clGreen;
    eStatus.Text := 'OK';
    eTotalExecutionTime.Text := IntToStr(dwMinutesTotal);
    eLeftExecutionTime.Text := IntToStr(dwMinutesLeft);
  end else
  begin
    // The trial parameters were not set
    // Shows the red color of trial status
    eStatus.Color := clRed;
    eStatus.Text := 'UNUSED';
  end;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
