unit test_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnClose: TButton;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    trDaysAll: TLabel;
    trDaysLeft: TLabel;
    trExecAll: TLabel;
    trExecLeft: TLabel;
    trDate: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
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
  Application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  Total, Left : DWord;
  Day, Month, Year : DWord;
begin
  if EP_TrialDays(Total, Left) then
  begin
    trDaysAll.Caption := IntToStr(Total);
    trDaysLeft.Caption := IntToStr(Left);
  end;
  if EP_TrialExecutions(Total, Left) then
  begin
    trExecAll.Caption := IntToStr(Total);
    trExecLeft.Caption := IntToStr(Left);
  end;
  if EP_TrialExpirationDate(Year, Month, Day) then
  begin
    trDate.Caption := Format('%d-%d-%d', [Day, Month, Year]);
  end;
end;

end.
 