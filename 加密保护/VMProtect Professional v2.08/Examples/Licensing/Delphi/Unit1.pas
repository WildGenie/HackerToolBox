unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edSerialNumber: TMemo;
    edInfo: TMemo;
    btTry: TButton;
    btClose: TButton;
    edHWID: TEdit;
    Label2: TLabel;
    procedure btCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSerialNumberChange(Sender: TObject);
    procedure btTryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses VMProtectSDK;

procedure TForm1.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var buf: array [0..127] of AnsiChar;
begin
  FillChar(buf, 0, sizeof(buf));
  VMProtectGetCurrentHWID(buf, sizeof(buf));
  edHWID.Text := buf;
end;

procedure TForm1.edSerialNumberChange(Sender: TObject);
const
  BoolToStr: array [Boolean] of String = ('FALSE', 'TRUE');

var nState, nState2: Integer;
    sd: TVMProtectSerialNumberData;
    res: Boolean;
begin
  edInfo.Lines.BeginUpdate;

  // set the serial number
  nState := VMProtectSetSerialNumber(PAnsiChar(AnsiString(edSerialNumber.Text)));

  // parse serial number state
  edInfo.Lines.Clear;
  edInfo.Lines.Add(Format('VMProtectSetSerialNumber() returned: 0x%.8X', [nState]));
  if nState and SERIAL_STATE_FLAG_CORRUPTED <> 0 then
   edInfo.Lines.Add(#9'SERIAL_STATE_FLAG_CORRUPTED');
  if nState and SERIAL_STATE_FLAG_INVALID <> 0 then
   edInfo.Lines.Add(#9'SERIAL_STATE_FLAG_INVALID');
  if nState and SERIAL_STATE_FLAG_BLACKLISTED <> 0 then
   edInfo.Lines.Add(#9'SERIAL_STATE_FLAG_BLACKLISTED');
  if nState and SERIAL_STATE_FLAG_DATE_EXPIRED <> 0 then
   edInfo.Lines.Add(#9'SERIAL_STATE_FLAG_DATE_EXPIRED');
  if nState and SERIAL_STATE_FLAG_RUNNING_TIME_OVER <> 0 then
   edInfo.Lines.Add(#9'SERIAL_STATE_FLAG_RUNNING_TIME_OVER');
  if nState and SERIAL_STATE_FLAG_BAD_HWID <> 0 then
   edInfo.Lines.Add(#9'SERIAL_STATE_FLAG_BAD_HWID');
  if nState and SERIAL_STATE_FLAG_MAX_BUILD_EXPIRED <> 0 then
   edInfo.Lines.Add(#9'SERIAL_STATE_FLAG_MAX_BUILD_EXPIRED');

  // another way to get a state
  nState2 := VMProtectGetSerialNumberState();
  edInfo.Lines.Add(Format(#13#10'VMProtectGetSerialNumberState() returned: 0x%.8X',[nState2]));

  // try to read serial number data
  FillChar(sd, 0, SizeOf(sd));
  res := VMProtectGetSerialNumberData(@sd, sizeof(sd));
  edInfo.Lines.Add(Format(#13#10'VMProtectGetSerialNumberData() returned: %s',[BoolToStr[res]]));
  if res then
  begin
    edInfo.Lines.Add(Format('State = 0x%.8X', [sd.nState]));
    edInfo.Lines.Add(Format('User Name = %s', [sd.wUserName]));
    edInfo.Lines.Add(Format('E-Mail = %s', [sd.wEMail]));
    edInfo.Lines.Add(Format('Date of expiration = %.4d-%.2d-%.2d', [sd.dtExpire.wYear, sd.dtExpire.bMonth, sd.dtExpire.bDay]));
    edInfo.Lines.Add(Format('Max date of build = %.4d-%.2d-%.2d', [sd.dtMaxBuild.wYear, sd.dtMaxBuild.bMonth, sd.dtMaxBuild.bDay]));
    edInfo.Lines.Add(Format('Running time limit = %d minutes', [sd.bRunningTime]));
    edInfo.Lines.Add(Format('Length of user data = %d bytes', [sd.nUserDataLength]));
  end;

  edInfo.Lines.EndUpdate;
end;

procedure TForm1.btTryClick(Sender: TObject);
begin
  Application.MessageBox('Protected code succesfully executed', PChar(ExtractFileName(Application.ExeName)), MB_OK or MB_ICONINFORMATION);
end;

end.
