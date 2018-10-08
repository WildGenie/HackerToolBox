unit gui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    lblInfo: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

procedure SaveOptions;
begin
{$I include\demo_start.inc}
// DO1;
// DO2;
// DO3;
{$I include\demo_end.inc}

end;


procedure TfrmMain.Button1Click(Sender: TObject);
begin
frmMain.Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
{$I include\crypt_start.inc}

lblInfo.Caption := 'Hello world from encrypted code';

{$I include\crypt_end.inc}

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var iFlag:integer;
begin

iFlag := 0;

{$I include\demo_start.inc}

// przed zakonczeniem aplikacji w wersji zarejestrowanej zapisz
// konfiguracje, wykonaj czynnosci, ktore nie beda dostepne
// bez klucza licencyjnego
if iFlag = 0 then
begin
SaveOptions;
// MakeBackup;
// Do1;
// Do2;
// Do3;

// dodatkowo ustaw flage oznaczajaca, ze mamy pelna wersje, ale uzycie
// markerow szyfrujacych nie powinno sie ograniczac jedynie do ustawiania
// flagi rejestracji, gdyz takie zabezpiecznie jest bardzo proste do
// usuniecia, pomiedzy markerami powinno znalezc sie jak najwiecej kodu
iFlag := 1;
end;
{$I include\demo_end.inc}

// wyswietl informacje, tylko wtedy gdy flaga rejestracji jest rowna 0
if iFlag = 0 then
begin
MessageDlg('Please register!',mtInformation,[mbOk],0);
end;

end;

end.
