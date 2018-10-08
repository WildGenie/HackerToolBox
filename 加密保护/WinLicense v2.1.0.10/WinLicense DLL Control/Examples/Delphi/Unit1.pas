unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, WDC_SDK;

type
  TForm1 = class(TForm)
    Button1: TButton;
    labelStatus: TLabel;
    TrialInfoGroup: TGroupBox;
    HardIdGroup: TGroupBox;
    edHardwareId: TEdit;
    RegistrationGroup: TGroupBox;
    Label1: TLabel;
    LabelNameReg: TLabel;
    labelCompany: TLabel;
    labelCustom: TLabel;
    Label2: TLabel;
    labelAppStatus: TLabel;
    Label6: TLabel;
    labelExtStatus: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    labelTrialDaysLeft: TLabel;
    labelExecLeft: TLabel;
    labelTrialMinLeft: TLabel;
    datepickerTrialDate: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    labelRegDaysLeft: TLabel;
    labelRegExecLeft: TLabel;
    labelRegMinLeft: TLabel;
    datepickerRegDate: TDateTimePicker;
    Label16: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

function WDC_ProcessHardwareId(pHardId:PChar):Boolean;cdecl;
function WDC_Initialize():Boolean;cdecl;
function WDC_Finalize():Boolean;cdecl;
procedure WDC_GetApplicationStatus(AppStatus:Integer; ExtendeAppStatus:Integer;
                                   var TrialExpInfo: TTrialExpInfo; var RegExpInfo: TRegExpInfo);cdecl;
function WDC_DoRegistration(var WDCfunctions:TWDCfunctionsArray):Boolean;cdecl;
procedure WDC_GetRegistrationInfo(RegName:PChar; RegCompany:PChar; RegCustom:PChar);cdecl;


exports
  WDC_Initialize,
  WDC_GetApplicationStatus,
  WDC_Finalize,
  WDC_DoRegistration,
  WDC_GetRegistrationInfo,
  WDC_ProcessHardwareId;

implementation

uses Unit2;

{$R *.dfm}

function WDC_Initialize(): Boolean;
begin

  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'WDC_Initialize function called!';
  Form1.labelStatus.Width := Form1.Width;
  Form1.ShowModal;

  Result := True;                // return no error

end;

function WDC_Finalize():Boolean;
begin

  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'WDC_Finalize function called!';
  Form1.labelStatus.Width := Form1.Width;
  Form1.ShowModal;

  Result := True;                // return no error

end;

procedure WDC_GetApplicationStatus(AppStatus:Integer; ExtendeAppStatus:Integer;
                                   var TrialExpInfo: TTrialExpInfo; var RegExpInfo: TRegExpInfo);
begin

  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'WDC_GetApplicationStatus function called!';
  Form1.labelStatus.Width := Form1.Width;
  Form1.TrialInfoGroup.Visible := True;

  // display Application Status

  if AppStatus = wdcRegistered then
    Form1.labelAppStatus.Caption := 'Registered'
  else
    Form1.labelAppStatus.Caption := 'Trial';

  // Display Extended Information

  case ExtendeAppStatus of

    wdcNoError: Form1.labelExtStatus.Caption := 'No Error';

    // license related cases

    wdcInvalidLicense: Form1.labelExtStatus.Caption := 'Invalid License Key';
    wdcInvalidHardwareLicense: Form1.labelExtStatus.Caption := 'Invalid Machine ID';
    wdcNoMoreHwdChanges: Form1.labelExtStatus.Caption := 'No more hardware changes allowed';
    wdcLicenseExpired: Form1.labelExtStatus.Caption := 'License key expired';
    wdcInvalidCountryLicense: Form1.labelExtStatus.Caption := 'License locked to different country';
    wdcLicenseStolen: Form1.labelExtStatus.Caption := 'Stolen license key';
    wdcWrongLicenseExp: Form1.labelExtStatus.Caption := 'License has not expiration info. Only licenses with expiration info allowed';
    wdcWrongLicenseHardware: Form1.labelExtStatus.Caption := 'License not locked to any machine. Only license with hardware locking allowed';

    // trial related cases

    wdcTrialExpired: Form1.labelExtStatus.Caption := 'Trial expired';
    wdcTrialManipulated: Form1.labelExtStatus.Caption := 'Trial Manipulated';

  end;

  // Display information about trial expiration

  Form1.labelTrialDaysLeft.Caption := IntToStr(TrialExpInfo.DaysLeft);
  Form1.labelExecLeft.Caption := IntToStr(TrialExpInfo.ExecutionsLeft);
  Form1.labelTrialMinLeft.Caption := IntToStr(TrialExpInfo.GlobalTimeLeft);

  if TrialExpInfo.DateExp.wYear = 0 then
    Form1.datepickerTrialDate.Visible := False
  else
    Form1.datepickerTrialDate.Date := SystemTimeToDateTime(TrialExpInfo.DateExp);

  // Display information about licensed expiration

  Form1.labelRegDaysLeft.Caption := IntToStr(RegExpInfo.DaysLeft);
  Form1.labelRegExecLeft.Caption := IntToStr(RegExpInfo.ExecutionsLeft);
  Form1.labelRegMinLeft.Caption := IntToStr(RegExpInfo.GlobalTimeLeft);

  if RegExpInfo.DateExp.wYear = 0 then
    Form1.datepickerRegDate.Visible := False
  else
    Form1.datepickerRegDate.Date := SystemTimeToDateTime(RegExpInfo.DateExp);

  Form1.ShowModal;

end;

function WDC_ProcessHardwareId(pHardId:PChar):Boolean;
begin

  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'WDC_ProcessHardwareId function called!';
  Form1.labelStatus.Width := Form1.Width;
  Form1.HardIdGroup.Visible := True;
  Form1.edHardwareId.Text := pHardId;

  Form1.ShowModal;

  // check if we are going to change hardware Id

  if Form1.edHardwareId.Text <> pHardId then
  begin
    StrCopy(pHardId, PChar(Form1.edHardwareId.Text));
    Result := True;
  end  
  else
    Result := False;

end;

function WDC_DoRegistration(var WDCfunctions:TWDCfunctionsArray):Boolean;
begin

  Form2 := TForm2.Create(application);
  Form2.ArrayFunctions := WDCfunctions;
  Form2.ShowModal;
  Result := True;

end;

procedure WDC_GetRegistrationInfo(RegName:PChar; RegCompany:PChar; RegCustom:PChar);
begin

  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'WDC_GetRegistrationInfo function called!';
  Form1.labelStatus.Width := Form1.Width;
  Form1.RegistrationGroup.Visible := True;

  // Set information in user interface

  Form1.LabelNameReg.Caption := RegName;
  Form1.LabelCompany.Caption := RegCompany;
  Form1.LabelCustom.Caption := RegCustom;

  Form1.ShowModal;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  Close;

end;

end.
 