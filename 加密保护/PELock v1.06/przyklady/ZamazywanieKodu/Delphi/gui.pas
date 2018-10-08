unit gui;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmMain = class(TForm)
    lblInfo: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin

// kod znajdujacy sie pomiedzy markerami CLEAR_START CLEAR_END podczas
// procesu zabezpieczania pliku jest szyfrowany, po uruchomieniu aplikacji
// kod zostaje automatycznie zdeszyfrowany, a po jego wykonaniu zostaje
// wymazany z pamieci
//
// zalecane jest, aby umieszczac makra CLEAR_START i CLEAR_END we fragmentach
// kodu, ktore wykonywane sa tylko raz (np. FormCreate, inicjalizacja aplikacji w .dpr)
{$I INCLUDE\CLEAR_START.INC}

lblInfo.Caption := 'Hello world';

{$I INCLUDE\CLEAR_END.INC}

end;

end.
