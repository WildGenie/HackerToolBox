unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, keygen;

type
  TfrmMain = class(TForm)
    btnKeyfile: TButton;
    GroupBox1: TGroupBox;
    edtInfo1: TEdit;
    edtInfo2: TEdit;
    edtInfo3: TEdit;
    GroupBox2: TGroupBox;
    edtProjectFile: TEdit;
    btnProjectFile: TButton;
    OpenDialog: TOpenDialog;
    procedure btnKeyfileClick(Sender: TObject);
    procedure btnProjectFileClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnKeyfileClick(Sender: TObject);
var
    ki: TKEYFILE_INFO;
    buffer: array[0..1023] of byte;
    text: array[0..2047] of char;
    kSize: LongWord;
begin
    ki.dwSize := SizeOf(ki);
    if (edtInfo1.Text <> '') then
        ki.lpInfo1 := PChar(edtInfo1.Text)
    else
        ki.lpInfo1 := nil;
    if (edtInfo2.Text <> '') then
        ki.lpInfo2 := PChar(edtInfo2.Text)
    else
        ki.lpInfo2 := nil;
    if (edtInfo3.Text <> '') then
        ki.lpInfo3 := PChar(edtInfo3.Text)
    else
        ki.lpInfo3 := nil;
    ki.lpExtInfo := nil;
    ki.lpSytemID := nil;
    ki.lpExpDate := nil;
    ki.lpBuffer := @buffer;
    ki.lpProjectFile := PChar(edtProjectFile.Text);
    kSize := GenerateKeyfile(ki);
    if kSize > 0 then
    begin
        ConvertToString(@buffer, kSize, text);
        ShowMessage(Text);
    end
    else
        ShowMessage('Cannot create keyfile.');
end;

procedure TfrmMain.btnProjectFileClick(Sender: TObject);
begin
    if OpenDialog.Execute() then
    begin
        edtProjectFile.Text := OpenDialog.FileName;
        btnKeyfile.Enabled := true;
    end;
end;

end.
