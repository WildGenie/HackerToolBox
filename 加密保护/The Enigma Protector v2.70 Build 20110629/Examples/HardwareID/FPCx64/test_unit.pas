unit test_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMain = class(TForm)
    lbHardware: TLabel;
    eHardware: TEdit;
    btnHardwareCopy: TButton;
    Label1: TLabel;
    eUserInfo: TEdit;
    lbUserName: TLabel;
    lbKey: TLabel;
    mKey: TMemo;
    btnRegister: TButton;
    btnExit: TButton;
    btnDelete: TButton;
    Label2: TLabel;
    lbRegName: TLabel;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure btnHardwareCopyClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses enigma_ide64;

{$R *.lfm}

procedure TfrmMain.FormShow(Sender: TObject);
var
  pcName, pcKey : PAnsiChar;
begin
  eHardware.Text := string(EP_RegHardwareID); // Shows hardware after application start
  if EP_RegLoadAndCheckKey then                  // Is correct key found then will load registration infos
  begin
    EP_RegLoadKey(pcName, pcKey);                // Load registration information
    lbRegName.Caption := string(pcName);   // Set reg. name label caption

    eUserInfo.Text := string(pcName);      // Fill out name and key fields
    mKey.Text := string(pcKey);

    eUserInfo.Enabled := false;            // Disable name and key fields
    mKey.Enabled := false;
  end;
end;

procedure TfrmMain.btnHardwareCopyClick(Sender: TObject);
begin
  eHardware.SelectAll;
  eHardware.CopyToClipboard;
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
begin
  EP_RegDeleteKey;                               // Delete local key
  ShowMessage('Restart application to take effect!'); // Offer to restart application
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnRegisterClick(Sender: TObject);
begin
  if EP_RegCheckAndSaveKey(PAnsiChar(AnsiString(eUserInfo.Text)), PAnsiChar(AnsiString(mKey.Text))) then // Checking and Saving of registration infos
  begin
    ShowMessage('Thanks for registration!');                       // Success
    lbRegName.Caption := eUserInfo.Text;
    eUserInfo.Enabled := false;                                    // Disabling name and key fields
    mKey.Enabled := false;
  end else
  begin
    ShowMessage('Registration information is incorrect!');         // Bad guy...
  end;
end;

end.
