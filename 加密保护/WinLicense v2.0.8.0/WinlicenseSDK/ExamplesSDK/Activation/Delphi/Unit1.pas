unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinlicenseSDK, ComCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    labStatus: TLabel;
    labStatusEx: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    labName: TLabel;
    labDaysExp: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    DateTimePicker1: TDateTimePicker;
    labNoRegistered: TLabel;
    labNoActivated: TLabel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    ActivationCodeEdit: TEdit;
    Button1: TButton;
    Label6: TLabel;
    labCustom1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    labCustom2: TLabel;
    Label12: TLabel;
    labCustom3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

    if WLActCheck(PChar(ActivationCodeEdit.Text)) = false  then

        MessageBox(0, 'Activation code is INVALID', 'Error', MB_OK or MB_ICONERROR)

    else
    begin

      // if activation is valid, insert the registration info in a file
      // So, winlicense will be able to finish the registration process

      WLActInstall(PChar(ActivationCodeEdit.Text));

      MessageBox(0, 'Activation code is correct. Please, restart this application to finish the registration process', 'Success', MB_OK);

    end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
   ExtStatus, Status: Integer;
   ActDate: SYSTEMTIME;
   Name: String;
   Custom1, Custom2, Custom3: Integer;
   
begin

   // Get Application status

   Status := WLRegGetStatus(ExtStatus);

  case Status of
    wlIsTrial: labStatus.Caption := 'wlIsTrial';
    wlIsRegisteredAndActivated: labStatus.Caption := 'wlIsRegisteredAndActivated';
    wlIsRegisteredNotActivated: labStatus.Caption := 'wlIsRegisteredNotActivated';
    wlLicenseExpired: labStatus.Caption := 'wlLicenseExpired';
  end;

  case ExtStatus of
    wlLicenseDaysExpired: labStatusEx.Caption := 'wlLicenseDaysExpired';
    wlLicenseActivationExpired: labStatusEx.Caption := 'wlLicenseActivationExpired';
    wlLicenseExecExpired: labStatusEx.Caption := 'wlLicenseExecExpired';
    wlLicenseDateExpired: labStatusEx.Caption := 'wlLicenseDateExpired';
    wlLicenseGlobalExpired: labStatusEx.Caption := 'wlLicenseGlobalExpired';
    wlLicenseRuntimeExpired: labStatusEx.Caption := 'wlLicenseRuntimeExpired';
    else labStatusEx.Caption := 'OK!';
  end;

  // Get Registration Info

  if (Status <> wlIsRegisteredAndActivated) and (Status <> wlIsRegisteredNotActivated) then
    labNoRegistered.Visible := true
  else
  begin
    SetLength(Name, 255);
    WLRegGetLicenseInfo(PChar(Name), nil, nil);
    labName.Caption := Name;
    labDaysExp.Caption := IntToStr(WLActDaysToActivate);
  end;

  // Get Activation Info

  if Status <> wlIsRegisteredAndActivated then
    labNoActivated.Visible := true
  else
  begin
     FillChar(ActDate, sizeof(SYSTEMTIME), 0);
     WLActExpirationDate(Addr(ActDate));
     DateTimePicker1.Date := SystemTimeToDateTime(ActDate);

     WLActGetInfo(Custom1, Custom2, Custom3);
     labCustom1.Caption := IntToStr(Custom1);
     labCustom2.Caption := IntToStr(Custom2);
     labCustom3.Caption := IntToStr(Custom3);
 end;






end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  WLActUninstall();

  ShowMessage('After restart, your application will go to state' + #10#13 +
              'REGISTERED but NOT activated');

end;

end.
