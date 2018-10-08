unit test_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnRegister: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnClose: TButton;
    Label7: TLabel;
    lbRegInfo: TLabel;
    btnUnregister: TButton;
    procedure btnRegisterClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnUnregisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ProcessRegistrationInfo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses enigma_ide;

{$R *.dfm}

procedure TForm1.ProcessRegistrationInfo;
var
  regName, regKey : PChar;
begin
  // check status if registration
  if EP_RegLoadAndCheckKey then
  begin
    btnUnregister.Enabled := true;
    btnRegister.Enabled := false;
    if EP_RegLoadKey(regName, regKey) then
    begin
      lbRegInfo.Caption := string(regName);
    end;
  end else
  begin
    btnUnregister.Enabled := false;
    btnRegister.Enabled := true;
    lbRegInfo.Caption := 'UNREGISTERED';
  end;
end;

procedure TForm1.btnRegisterClick(Sender: TObject);
begin
  // Show registration dialog
  EP_RegShowDialog;
  //
  ProcessRegistrationInfo;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnUnregisterClick(Sender: TObject);
begin
  if EP_RegDeleteKey then
  begin
    MessageDlg('Registration Information had been successfully deleted!', mtInformation, [mbOK], 0);
  end else
  begin
    MessageDlg('Registration Information was not found!', mtError, [mbOK], 0);
  end;
  ProcessRegistrationInfo;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ProcessRegistrationInfo;
end;

end.
