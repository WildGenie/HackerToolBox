unit gui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    edtUserName: TEdit;
    lblUserName: TLabel;
    edtHardwareId: TEdit;
    lblHardwareId: TLabel;
    edtAdditionalKeyData1: TEdit;
    lblAdditionalKeyData: TLabel;
    TimePicker: TDateTimePicker;
    edtAdditionalKeyData2: TEdit;
    edtAdditionalKeyData3: TEdit;
    edtAdditionalKeyData4: TEdit;
    lblKeyExpiration: TLabel;
    OpenProject: TOpenDialog;
    btnGenerate: TButton;
    SaveLicenseKey: TSaveDialog;
    chkKeyExpirationDate: TCheckBox;
    GroupBox1: TGroupBox;
    chkUpdateProject: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure chkKeyExpirationDateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

{ KEYGEN.dll prototypes }
{$I INCLUDE\KEYGEN.INC}

implementation

{$R *.DFM}


procedure TfrmMain.FormShow(Sender: TObject);
begin

// set title
OpenProject.Title := 'Open Project File';
OpenProject.InitialDir := ExtractFilePath(ParamStr(0));

// read project file path
if OpenProject.Execute <> true then
frmMain.Close;

end;

procedure TfrmMain.btnGenerateClick(Sender: TObject);

var KeyData           : array[1..4096] of byte;   // output buffer for key data
    KeyDataSize       : DWORD;                    // key data size
    KeyAdditionalData : DWORD;                    // additional key data
    KeyExpirationDate : TSystemTime;              // key expiration date

    KeyFile           : file of byte;             // key file handle
    Status            : DWORD;                    // status


begin

    // check if key expiration option is enabled
    if chkKeyExpirationDate.Checked then
    begin

    // read key expiration date
    DateTimeToSystemTime(TimePicker.DateTime,KeyExpirationDate);
    end
    else
    begin

    // fill TSystemTime structure with zeros
    FillChar(KeyExpirationDate,sizeof(KeyExpirationDate),0);
    end;

    // key additional data (format 4 BYTES to DWORD value)
    KeyAdditionalData := ( StrToInt(edtAdditionalKeyData4.Text) shl 24 ) or
                         ( StrToInt(edtAdditionalKeyData3.Text) shl 16 ) or
                         ( StrToInt(edtAdditionalKeyData2.Text) shl 8 )  or
                         ( StrToInt(edtAdditionalKeyData1.Text));

    SaveLicenseKey.InitialDir := ExtractFilePath(ParamStr(0));
    SaveLicenseKey.Title := 'Save license key as...';

    // set default name for key file
    SaveLicenseKey.FileName := 'key.lic';

    // show save dialog
    if SaveLicenseKey.Execute then
    begin

    // generate key data
    Status := Keygen( PChar(Trim(edtUserName.Text)),              // user name (PChar)
                      KeyAdditionalData,                          // additional key data (DWORD)
                      PChar(Trim(edtHardwareId.Text)),            // hardware id (DWORD)
                      @KeyExpirationDate,                         // key expiration date (SYSTEMTIME)
                      @KeyData[1],                                // buffer for key data (array of byte)
                      @KeyDataSize,                               // key data size (output) (DWORD)
                      PChar(OpenProject.FileName),                // project file path (PChar)
                      chkUpdateProject.checked);                  // update project flag (BOOL)

    // check returned value
    case Status of
    KEYGEN_OK:
    begin
       // create new license key file
       AssignFile(KeyFile,SaveLicenseKey.FileName);
       Rewrite(KeyFile);

       // write key data
       BlockWrite(KeyFile,KeyData,KeyDataSize);

       // close file
       CloseFile(KeyFile);

       MessageBox(frmMain.Handle ,PChar('Key file successfully generated!'),PChar('OK'),MB_ICONINFORMATION);
    end;

    // initialization error
    KEYGEN_INIT_ERR:
        MessageBox(frmMain.Handle ,PChar('Error while initialization, please check your project file!'),PChar('Error!'),MB_ICONEXCLAMATION);

    // invalid input data
    KEYGEN_DATA_ERR:
        MessageBox(frmMain.Handle ,PChar('Error while generating license key data!'),PChar('Error!'),MB_ICONEXCLAMATION);

    // other error
    else
        MessageBox(frmMain.Handle ,PChar('Unexpected error while generating license key data!'),PChar('Error!'),MB_ICONEXCLAMATION);
    end;


    end;

end;

procedure TfrmMain.chkKeyExpirationDateClick(Sender: TObject);
begin

TimePicker.Enabled := chkKeyExpirationDate.Checked;

end;

end.
