unit gui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmMain = class(TForm)
    btnExit: TButton;
    Panel1: TPanel;
    lblInfo: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    lblKeyExp: TLabel;
    procedure btnExitClick(Sender: TObject);
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


procedure TfrmMain.btnExitClick(Sender: TObject);
begin
frmMain.Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var szUser            : array[0..63] of Char;
    KeyExpirationDate : TSystemTime;

begin

// kod odpowiedzialny za odczyt nazwy zarejestrowanego uzytkownika
// nalezy umiescic pomiedzy markerami DEMO_START i DEMO_END
//
// aby mozna bylo odczytac date wygasniecia klucza, nalezy w kodzie
// umiescic przynajmniej 1 marker

{$I include\demo_start.inc}

// odczytaj nazwe zarejestrowanego usera, do tego celu nalezy
// skorzystac z funkcji WinApi GetWindowText wywolana z parametrem
// HWND ustawionym na -1
GetWindowTextA(HWND(-1),szUser,63);

// wyswietl nazwe zarejestrowanego uzytkownika
lblInfo.Caption := szUser;

// odczytaj date wygasniecia klucza do struktury SYSTEMTIME
if GetWindowTextA(HWND(-5),@KeyExpirationDate,64) = 1 then
begin

lblKeyExp.Caption := Format('%d-%d-%d',[KeyExpirationDate.wDay,KeyExpirationDate.wMonth,KeyExpirationDate.wYear]);

end
else
lblKeyExp.Caption := '---';


{$I include\demo_end.inc}

// sprawdz czy odczytanie nazwy zarejestrowanego uzytkownika powiodlo sie
// jesli nie, ustaw domyslny tekst
if length(szUser) = 0 then
begin
  lblInfo.Caption := 'WERSJA NIEZAREJESTROWANA';
  lblKeyExp.Caption := 'n/a';
end;

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var iFlag:integer;
begin

iFlag := 0;

{$I include\demo_start.inc}

// wykonaj operacje, ktore nie sa dostepne bez klucza licencyjnego
// np. zapis konfiguracji
if iFlag = 0 then
begin
SaveOptions;
// MakeBackup;
// Do1;
// Do2;
// Do3;

iFlag := 1;
end;
{$I include\demo_end.inc}

// w wersji niezarejestrowanej wyswietl nagscreen
if iFlag = 0 then
begin
MessageDlg('Prosze zarejestrowac program!',mtInformation,[mbOk],0);
end;

end;

end.
