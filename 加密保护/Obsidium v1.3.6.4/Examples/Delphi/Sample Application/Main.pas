unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Obsidium;

type
  TfrmMain = class(TForm)
    gbRegInfo: TGroupBox;
    lblInfo: TLabel;
    btnSetKey: TButton;
    Label1: TLabel;
    edtLicInfo: TEdit;
    Label2: TLabel;
    edtLicKey: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSetKeyClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
var
    regInfo: array[0..127] of char;
begin
    if isRegistered() then begin
        lblInfo.Caption := 'Registered, but no advanced license key used';
        gbRegInfo.Enabled := false;
        // The following code will only be executed if a valid advanced license key is present
        {$I PATTERN_REG_START.inc}
        getRegInfo(0, @regInfo);
        lblInfo.Caption := 'This application is registered to ' + regInfo;
        {$I PATTERN_REG_END.inc}
    end
    else begin
        {$I PATTERN_ENC_START.inc}
        lblInfo.Caption := 'Unregistered, please enter your registration information below.';
        ShowMessage('This application is currently unregistered!');
        {$I PATTERN_ENC_END.inc}
    end;
end;

procedure TfrmMain.btnSetKeyClick(Sender: TObject);
begin
    if (edtLicInfo.GetTextLen > 0) and (edtLicKey.GetTextLen > 0) then
        if setLicenseShort(PChar(edtLicInfo.Text), PChar(edtLicKey.Text)) then
            ShowMessage('Please restart the application')
        else
            ShowMessage('Invalid registration information!');
end;

end.
