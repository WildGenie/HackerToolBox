unit test_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    lbLicenseInfo: TLabel;
    Timer1: TTimer;
    lbStart: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    lbTime: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    eName: TEdit;
    eKey: TEdit;
    Button1: TButton;
    lbKeyExpiration: TLabel;
    Label6: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateLicenseInfo;
    procedure UpdateExpirationInfo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses enigma_ide, Math;

{$R *.dfm}

procedure TForm1.UpdateExpirationInfo;
var
  Total, Left : cardinal;
  s : string;
begin
  if EP_RegLoadAndCheckKey then
  begin
    if EP_RegKeyGlobalTime(Total, Left) then
    begin
      DateTimeToString(s, 'ddddd	t', IncMinute(Now, Left));
      lbKeyExpiration.Caption := s;
    end else
    begin
      lbKeyExpiration.Caption := 'Not time limited';
    end;
  end else
  begin
    lbKeyExpiration.Caption := 'Not registered';
  end;
end;

procedure TForm1.UpdateLicenseInfo;
var
  Total, Left : cardinal;
begin
  if EP_RegLoadAndCheckKey then
  begin
    if EP_RegKeyGlobalTime(Total, Left) then
    begin
      lbLicenseInfo.Caption := format('Application is registered, Global Time total: %d, left %d minute(s)!', [Total, Left]);
    end else
    begin
      lbLicenseInfo.Caption := 'Application is registered, but registration key is not global time limited!';
    end;
  end else
  begin
    lbLicenseInfo.Caption := 'Application is unregistered!';
  end;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  lbTime.Caption := TimeToStr(Now);
  UpdateLicenseInfo;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lbStart.Caption := TimeToStr(Now);
  UpdateExpirationInfo;
  UpdateLicenseInfo;
  Timer1.OnTimer(Timer1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if EP_RegCheckAndSaveKey(PAnsiChar(AnsiString(eName.Text)), PAnsiChar(AnsiString(eKey.Text))) then
  begin
    ShowMessage('New key is valid and installed!');
  end else
  begin
    ShowMessage('Invalid registration information!');
  end;
  UpdateExpirationInfo;
  UpdateLicenseInfo;  
end;

end.
