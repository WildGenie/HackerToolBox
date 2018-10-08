{$J+}
unit normal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmApp = class(TForm)
    btnClose: TButton;
    Label1: TLabel;
    lStatus: TLabel;
    btnRegistration: TButton;
    Bevel1: TBevel;
    btnBuy: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnRegistrationClick(Sender: TObject);
    procedure btnBuyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApp  : TfrmApp;

implementation

uses
  regkey,
  ShellAPI,
  aspr_api;

{$R *.DFM}

//------------------------------------------------------------------------------

procedure TfrmApp.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

const
  UserKey        : PChar  = nil;
  UserName       : PChar  = nil;

  ModeName       : PChar  = nil;

  TrialDaysTotal : DWORD  = DWORD(-1);
  TrialDaysLeft  : DWORD  = DWORD(-1);

//------------------------------------------------------------------------------

procedure TfrmApp.btnRegistrationClick(Sender: TObject);
begin
  Hide;

  With TfrmRegKey.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;

  Show;
end;

//------------------------------------------------------------------------------

procedure TfrmApp.btnBuyClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', PChar('http://www.aspack.com/register.htm'), nil, nil, SW_SHOWNORMAL);
end;

//------------------------------------------------------------------------------

procedure TfrmApp.FormShow(Sender: TObject);
Var
  ModeStatus     : TModeStatus;
begin
  lStatus.Caption := 'TRIAL EXPIRED!';

  GetRegistrationInformation( 0, UserKey, UserName );

  if (UserKey <> nil) AND (StrLen(UserKey) > 0) then
  begin

    {$I include\aspr_crypt_begin1.inc}

    GetModeInformation( 0, ModeName, ModeStatus );

    btnBuy.Visible := False;
    lStatus.Caption := 'Registered version:' + #13#10 +
                       'Key:'       + #13#10 + StrPas(UserKey)  + #13#10 +
                       'Name:'      + #13#10 + StrPas(UserName) + #13#10#13#10 +
                       'Mode Name: '+ StrPas(ModeName);

    {$I include\aspr_crypt_end1.inc}

  end else

    If GetTrialDays( 0, TrialDaysTotal, TrialDaysLeft ) then
    begin

      If TrialDaysLeft = 0 then
      begin
        btnBuy.Visible:= True;
        lStatus.Caption := 'TRIAL EXPIRED!';
      end
       else
        lStatus.Caption := 'Unregistered trial version' + #13#10#13#10 +
                           'You have ' + IntToStr(TrialDaysLeft) + ' day(s) left';

    end;

end;

//------------------------------------------------------------------------------

end.