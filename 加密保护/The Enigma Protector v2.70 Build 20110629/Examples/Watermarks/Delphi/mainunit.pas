unit mainunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses enigma_ide;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  i : integer;
  wmc : TWMContent;
begin
  // Reading watermarks
  // function EP_MiscGetWatermark(0, nil) with null parameters
  // returns count of watermarks
  for i := 0 to EP_MiscGetWatermark(0, nil) - 1 do
  begin
    ZeroMemory(@wmc, sizeof(wmc));

    // Get lengths of params
    // when Name and/or Text and/or AFile params are null then EP_MiscGetWatermark
    // returns needed length buffers for these.
    EP_MiscGetWatermark(i, @wmc);

    GetMem(wmc.Name, wmc.NameLen + 1); // get memory +1 byte for null string terminating
    ZeroMemory(wmc.Name, wmc.NameLen + 1);
    GetMem(wmc.Text, wmc.TextLen + 1);
    ZeroMemory(wmc.Text, wmc.TextLen + 1);
    GetMem(wmc.FileName, wmc.FileNameLen + 1);
    ZeroMemory(wmc.FileName, wmc.FileNameLen + 1);
    // File length should be zero due to we do not get file content right now
    wmc.AFileLen := 0;

    // Get watermarks
    EP_MiscGetWatermark(i, @wmc);

    // Add watermarks to the list
    with ListView1.Items.Add do
    begin
      Indent := i;
      Caption := IntToStr(i);
      if wmc.WMType = WM_PUBLIC then
        SubItems.Add('PUBLIC')
      else
        SubItems.Add('PRIVATE');
      if strlen(wmc.Name) > 0 then
        SubItems.Add(wmc.Name)
      else
        SubItems.Add('');
      if strlen(wmc.Text) > 0 then
        SubItems.Add(wmc.Text)
      else
        SubItems.Add('');
      if strlen(wmc.FileName) > 0 then
        SubItems.Add(wmc.FileName)
      else
        SubItems.Add('');
    end;
    FreeMem(wmc.FileName);
    FreeMem(wmc.Text);
    FreeMem(wmc.Name);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  fs : TFileStream;
  wmc : TWMContent;
begin
  if ListView1.Selected = nil then Exit;
  if ListView1.Selected.Indent >= EP_MiscGetWatermark(0, nil) then Exit;

  ZeroMemory(@wmc, sizeof(wmc));

  // Get length of file name string and file
  EP_MiscGetWatermark(ListView1.Selected.Indent, @wmc);

  wmc.NameLen := 0;
  wmc.Text := nil;
  GetMem(wmc.FileName, wmc.FileNameLen + 1);
  ZeroMemory(wmc.FileName, wmc.FileNameLen + 1);
  GetMem(wmc.AFile, wmc.AFileLen);

  // Get file name and it's content
  EP_MiscGetWatermark(ListView1.Selected.Indent, @wmc);

  SaveDialog1.FileName := wmc.FileName;
  SaveDialog1.DefaultExt := ExtractFileExt(wmc.FileName);
  if SaveDialog1.Execute then
  begin
    try
      fs := TFileStream.Create(SaveDialog1.FileName, fmCreate);
      fs.Write(wmc.AFile^, wmc.AFileLen);
    finally
      fs.Free;
    end;
  end;
  FreeMem(wmc.AFile);
  FreeMem(wmc.FileName);
end;

end.
