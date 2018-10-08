unit testunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmMain = class(TForm)
    lbUserName: TLabel;
    eUserName: TEdit;
    lbKey: TLabel;
    mKey: TMemo;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lbKeyExpiration: TLabel;
    eKeyExpiration: TEdit;
    btnClose: TButton;
    btnRegister: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure OnRegistration(AName, AKey : AnsiString);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses enigma_ide64;

{$R *.lfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.OnRegistration(AName, AKey : AnsiString);
var
  wYear, wMonth, wDay : dword;
begin
  if EP_RegCheckAndSaveKey(PAnsiChar(AName), PAnsiChar(AKey)) then
  begin
    if EP_RegKeyExpirationDate(wYear, wMonth, wDay) then
    begin
      eKeyExpiration.Color := clLime;
      eKeyExpiration.Text := format('%.2d/%.2d/%.2d', [wMonth, wDay, wYear]);
    end else
    begin
      eKeyExpiration.Color := clAqua;
      eKeyExpiration.Text := 'KEY IS NOT TIME LIMITED';
    end;
  end;
end;

procedure TfrmMain.btnRegisterClick(Sender: TObject);
begin
  OnRegistration(AnsiString(eUserName.Text), AnsiString(mKey.Text));
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  pcName, pcKey : PAnsiChar;
begin
  if EP_RegLoadKey(pcName, pcKey) then
  begin
    OnRegistration(AnsiString(pcName), AnsiString(pcKey));
  end;
end;

end.
