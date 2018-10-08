unit testunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    eFileName: TEdit;
    Label3: TLabel;
    eWindowClass: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    eWindowText: TEdit;
    btnFind: TButton;
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses enigma_ide;

{$R *.dfm}

procedure TfrmMain.btnFindClick(Sender: TObject);
begin
  if EP_CheckupFindProcess(PAnsiChar(AnsiString(eFileName.Text)), PAnsiChar(AnsiString(eWindowText.Text)), PAnsiChar(AnsiString(eWindowClass.Text))) then
  begin
    ShowMessage('Process is found!');
  end else
  begin
    ShowMessage('This process is not run on the system!');
  end;
end;

end.
