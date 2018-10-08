unit test_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    lbMessages: TListBox;
    eKey: TEdit;
    eName: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    btnRegister: TButton;
    GroupBox1: TGroupBox;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowOurMessage(AMessage : string);
  end;

var
  Form1: TForm1;

implementation

uses enigma_ide;

{$R *.dfm}

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Timer1.Enabled := false;
  Close;
end;

procedure TForm1.ShowOurMessage(AMessage : string);
begin
  lbMessages.Items.Add(format('[%s] %s', [TimeToStr(Now), AMessage]));
  lbMessages.ItemIndex := lbMessages.Items.Count - 1;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Total, Left : Cardinal;
begin
  if EP_RegLoadAndCheckKey then
  begin
    if EP_RegKeyRuntime(Total, Left) then
    begin
      ShowOurMessage(format('Valid license, total runtime minute(s) %d, left %d', [Total, Left]));
    end else
    begin
      ShowOurMessage('License is valid, but not runtime limited!');
    end;
  end else
  begin
    ShowOurMessage('License is invalid!');
  end;
end;

procedure TForm1.btnRegisterClick(Sender: TObject);
begin
  if EP_RegCheckAndSaveKey(PAnsiChar(AnsiString(eName.Text)), PAnsiChar(AnsiString(eKey.Text))) then
  begin
    ShowMessage('New license is valid and installed!');
  end else
  begin
    ShowMessage('License is invalid!');
  end;
end;

end.
