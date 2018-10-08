unit gui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    lblInfo: TLabel;
    Label1: TLabel;
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
var szUser:array[0..63]  of Char;
    lpTemp:array[0..512] of Char;
begin

// przykladowo wykorzystany bedzie klucz znajdujacy sie w katalogu Windows
GetWindowsDirectory(lpTemp,512);

// ustaw katalog klucza licencyjnego w razie jego braku w glownym
// katalogu z zabezpieczona aplikacja, do ustawiania klucza wykorzystana
// jest funkcja WinApi GetWindowTextA wywolywna z parametrem HWND
// ustawionym na -2
GetWindowTextA(HWND(-2),strcat(lpTemp,'\key.lic'),0);


// pobieranie nazwy uzytkownika nalezy umieszczac pomiedzy markerami
// DEMO_START i DEMO_END
{$I include\demo_start.inc}

// pobierz nazwe zarejestrowanego uzytkownika, do tego celu wykorzystana jest
// funkcja WinApi GetWindowText wywolywana z parametrem HWND ustawionym na -1
GetWindowTextA(HWND(-1),szUser,63);


// ustaw nazwe zarejestrowanego uzytkownika, inaczej pozostaw
// UNREGISTERED VERSION
lblInfo.Caption := szUser;



{$I include\demo_end.inc}

// sprawdz czy cos zostalo skopiowane do bufora, jesli nie ustaw domyslny
// tekst
if length(szUser) = 0 then
lblInfo.Caption := 'UNREGISTERED VERSION';

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
