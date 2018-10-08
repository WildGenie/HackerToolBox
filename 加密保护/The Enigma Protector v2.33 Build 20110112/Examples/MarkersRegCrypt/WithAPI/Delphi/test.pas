unit test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Help1: TMenuItem;
    Options1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    Open1: TMenuItem;
    N2: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    RichEdit1: TRichEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OpenFileName : string;
  end;

var
  frmMain: TfrmMain;

implementation

uses enigma_ide, Nag_unit;

{$R *.dfm}

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.About1Click(Sender: TObject);
begin
  ShowMessage('This is just Enigma test application!');
end;

procedure TfrmMain.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    OpenFileName := OpenDialog1.FileName;
    RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TfrmMain.Save1Click(Sender: TObject);
begin
  if OpenFileName <> '' then RichEdit1.Lines.SaveToFile(OpenFileName);
end;

procedure TfrmMain.SaveAs1Click(Sender: TObject);
begin
  SaveDialog1.FileName := OpenFileName;
  if SaveDialog1.Execute then
  begin
    OpenFileName := SaveDialog1.FileName;
    RichEdit1.Lines.SaveToFile(OpenFileName);
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if not LoadAndCheckKey then
  begin
    frmNag.ShowModal;
  end;
end;

end.
