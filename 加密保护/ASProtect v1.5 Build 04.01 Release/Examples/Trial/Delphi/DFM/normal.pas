{$J+}
unit normal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmApp = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btnRegistration: TButton;
    Bevel1: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRegistrationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApp: TfrmApp;

implementation

uses
  Trial;

{$R *.DFM}

procedure TfrmApp.Button1Click(Sender: TObject);
begin
  Close;
end;

const
  UserName       : PChar = '';
  TrialDaysTotal : Integer = -1;
  TrialDaysLeft  : Integer = -1;
//------------------------------------------------------------------------------
procedure GetRegistrationInformation(NewUserName : PChar);stdcall
begin
  UserName := NewUserName;
end;
exports
   GetRegistrationInformation;
//------------------------------------------------------------------------------
procedure GetTrialDays(Total, Left : DWORD);stdcall;
begin
  TrialDaysTotal := Total;
  TrialDaysLeft  := Left;
end;
exports
  GetTrialDays;
//------------------------------------------------------------------------------
procedure TfrmApp.FormCreate(Sender: TObject);
begin
  if StrLen(UserName) > 0 then
  begin
    btnRegistration.Visible := False;
    Label2.Caption := 'Registered user:'#13#10+StrPas(UserName);
  end
  else
    Label2.Caption := 'Unregistered trial version'#13#10#13#10'You have '+IntToStr(TrialDaysLeft)+' day(s) left';
end;

procedure TfrmApp.btnRegistrationClick(Sender: TObject);
begin
  Hide;
  if CallRegForm then Close;
  Show;
end;

end.
