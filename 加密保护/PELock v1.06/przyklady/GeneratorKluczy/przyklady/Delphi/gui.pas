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

// ustaw tytul
OpenProject.Title := 'Otworz Plik Projektu';
OpenProject.InitialDir := ExtractFilePath(ParamStr(0));

// odczytaj sciezke do pliku projektu, dla ktorego maja byc
// generowane klucze
if OpenProject.Execute <> true then
frmMain.Close;

end;

procedure TfrmMain.btnGenerateClick(Sender: TObject);

var KeyData           : array[1..4096] of byte;   // bufor na dane klucza
    KeyDataSize       : DWORD;                    // rozmiar danych klucza
    KeyAdditionalData : DWORD;                    // dodatkowe dane klcuza
    KeyExpirationDate : TSystemTime;              // data wygasniecia klucza

    KeyFile           : file of byte;             // uchwyt pliku klucza
    Status            : DWORD;                    // status


begin

    // sprawdz, czy data wygasniecia klucza jest ustawiona
    if chkKeyExpirationDate.Checked then
    begin

    // jesli opcja ustawiona, odczytaj date wygsniecia
    // klucza do struktury SYSTEMTIME
    DateTimeToSystemTime(TimePicker.DateTime,KeyExpirationDate);
    end
    else
    begin

    // w przeciwnym wypadku wypelnij strukture TSystemTime zerami
    FillChar(KeyExpirationDate,sizeof(KeyExpirationDate),0);
    end;

    // dodatkowe dane klucza spakuj do wartosc DWORD
    KeyAdditionalData := ( StrToInt(edtAdditionalKeyData4.Text) shl 24 ) or
                         ( StrToInt(edtAdditionalKeyData3.Text) shl 16 ) or
                         ( StrToInt(edtAdditionalKeyData2.Text) shl 8 )  or
                         ( StrToInt(edtAdditionalKeyData1.Text));

    SaveLicenseKey.InitialDir := ExtractFilePath(ParamStr(0));
    SaveLicenseKey.Title := 'Zapisz klucz licencyjny jako...';

    // ustaw domyslna nazwe dla pliku licencyjnego
    SaveLicenseKey.FileName := 'key.lic';

    // pozwol uzytkownikowi wybrac, gdzie bedzie zapisany klucz licencyjny
    if SaveLicenseKey.Execute then
    begin

    // generuj dane klucza
    Status := Keygen( PChar(Trim(edtUserName.Text)),              // nazwa uzytkownika (PChar)
                      KeyAdditionalData,                          // dodatkowe dane klucza (DWORD)
                      PChar(Trim(edtHardwareId.Text)),            // identyfikator sprzetowy (DWORD)
                      @KeyExpirationDate,                         // data wygasniecia klucza (SYSTEMTIME)
                      @KeyData[1],                                // bufor na dane klucza (array of byte)
                      @KeyDataSize,                               // rozmiar danych klucza (na wyjsciu) (DWORD)
                      PChar(OpenProject.FileName),                // pelna sciezka do pliku projektu (PChar)
                      chkUpdateProject.checked);                  // flaga aktualizacji projektu (BOOL)

    // sprawdz jaka wartosc zwrocila funkcja
    case Status of
    KEYGEN_OK:
    begin
       // utworz nowy plik
       AssignFile(KeyFile,SaveLicenseKey.FileName);
       Rewrite(KeyFile);

       // zapisz dane licencyjne do klucza
       BlockWrite(KeyFile,KeyData,KeyDataSize);

       // zamnij plik
       CloseFile(KeyFile);

       MessageBox(frmMain.Handle ,PChar('Klucz licencyjny zostal wygenerowany!'),PChar('OK'),MB_ICONINFORMATION);
    end;

    KEYGEN_INIT_ERR:
        MessageBox(frmMain.Handle ,PChar('Blad podczas inicjalizacji, sprawdz sciezke do pliku projektu!'),PChar('Blad!'),MB_ICONEXCLAMATION);

    KEYGEN_DATA_ERR:
        MessageBox(frmMain.Handle ,PChar('Blad podczas generowania danych licencyjnych, sprawdz nazwe uzytkownika!'),PChar('Blad!'),MB_ICONEXCLAMATION);

    // wszystkie inne bledy obslugiwane sa tutaj
    else
        MessageBox(frmMain.Handle ,PChar('Wystapil nieokreslony blad podczas generowania klucza!'),PChar('Blad!'),MB_ICONEXCLAMATION);
    end;


    end;

end;

procedure TfrmMain.chkKeyExpirationDateClick(Sender: TObject);
begin

TimePicker.Enabled := chkKeyExpirationDate.Checked;

end;

end.
