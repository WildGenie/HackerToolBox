unit Keygen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ComCtrls,KeygenDLL,Clipbrd;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    chk1: TCheckBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    grp1: TGroupBox;
    lbl6: TLabel;
    edt6: TEdit;
    lbl7: TLabel;
    dtp1: TDateTimePicker;
    lbl8: TLabel;
    grp2: TGroupBox;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edt7: TEdit;
    dtp2: TDateTimePicker;
    grp3: TGroupBox;
    lbl12: TLabel;
    lbl14: TLabel;
    grp4: TGroupBox;
    lbl15: TLabel;
    edt9: TEdit;
    lbl18: TLabel;
    edt10: TEdit;
    lbl19: TLabel;
    lbl20: TLabel;
    edt11: TEdit;
    lbl21: TLabel;
    cbb1: TComboBox;
    cbb2: TComboBox;
    cbb3: TComboBox;
    lbl13: TLabel;
    lbl16: TLabel;
    edt8: TEdit;
    lbl17: TLabel;
    edt12: TEdit;
    lbl22: TLabel;
    edt13: TEdit;
    lbl23: TLabel;
    edt14: TEdit;
    lbl24: TLabel;
    edt15: TEdit;
    Button1: TButton;
    Button2: TButton;
    mmo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    dlgSave1: TSaveDialog;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  pSerial:PChar;
  pYear1:Word;
  pMonth1:Word;
  pDay1:Word;
  pYear2:Word;
  pMonth2:Word;
  pDay2:Word;
begin
  if edt1.Text = '' then
  begin
    ShowMessage('Master key must exist.');
    Exit;
  end;
  DecodeDate(dtp1.DateTime,pYear1,pMonth1,pDay1);
  DecodeDate(dtp2.DateTime,pYear2,pMonth2,pDay2);
  {$IFDEF UNICODE}
    pSerial := ZP_GenKeyStringW(
  {$ELSE}
    pSerial := ZP_GenKeyStringA(
  {$ENDIF}
                            PChar(edt1.text),
                            PChar(edt2.Text),
                            PChar(edt3.Text),
                            PChar(edt4.Text),
                            StrToInt(edt6.Text),
                            pYear1,
                            pMonth1,
                            pDay1,
                            StrToInt(edt7.Text),
                            StrToInt(edt10.Text),
                            pYear2,
                            pMonth2,
                            pDay2,
                            StrToInt(edt11.Text),
                            StrToInt(edt13.Text),
                            StrToInt(edt14.Text),
                            StrToInt(edt15.Text),
                            PChar(edt9.text),
                            PChar(edt8.text),
                            PChar(edt12.text),
                            Boolean(cbb1.ItemIndex),
                            Boolean(cbb2.ItemIndex),
                            Boolean(cbb3.ItemIndex)
                            );
  mmo1.Text := pSerial;
  ZP_KeygenFree(pSerial);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edt4.Text := edt3.Text;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Clipboard.SetTextBuf(PChar(mmo1.Text));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  pReturn:Integer;
  pYear1:Word;
  pMonth1:Word;
  pDay1:Word;
  pYear2:Word;
  pMonth2:Word;
  pDay2:Word;
begin
  if edt1.Text = '' then
  begin
    ShowMessage('Master key must exist.');
    Exit;
  end;
  if dlgSave1.Execute() = True then
  begin
    DecodeDate(dtp1.DateTime,pYear1,pMonth1,pDay1);
    DecodeDate(dtp2.DateTime,pYear2,pMonth2,pDay2);
    {$IFDEF UNICODE}
    pReturn := ZP_BuildToFileW(
  {$ELSE}
    pReturn := ZP_BuildToFileA(
  {$ENDIF}
                              PChar(dlgSave1.FileName),
                              PChar(edt1.text),
                              PChar(edt2.Text),
                              PChar(edt3.Text),
                              PChar(edt4.Text),
                              StrToInt(edt6.Text),
                              pYear1,
                              pMonth1,
                              pDay1,
                              StrToInt(edt7.Text),
                              StrToInt(edt10.Text),
                              pYear2,
                              pMonth2,
                              pDay2,
                              StrToInt(edt11.Text),
                              StrToInt(edt13.Text),
                              StrToInt(edt14.Text),
                              StrToInt(edt15.Text),
                              PChar(edt9.text),
                              PChar(edt8.text),
                              PChar(edt12.text),
                              Boolean(cbb1.ItemIndex),
                              Boolean(cbb2.ItemIndex),
                              Boolean(cbb3.ItemIndex)
                              );
    if pReturn <> 0 then
    begin
      ShowMessage('Failed to generate keyfile!');
    end
    else
      ShowMessage('Keyfile is saved as: '+dlgsave1.FileName);
  end;
end;

procedure TForm1.chk1Click(Sender: TObject);
begin
  if not chk1.Checked then
  begin
    edt1.PasswordChar := '*';
  end
  else
    edt1.PasswordChar := #0;
end;

end.
