unit DemoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ValEdit;

type
  TDemoForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Button3: TButton;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button4: TButton;
    Button5: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit5: TEdit;
    Panel1: TPanel;
    ValueListEditor1: TValueListEditor;
    Button6: TButton;
    Button7: TButton;
    ValueListEditor2: TValueListEditor;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DemoForm: TDemoForm;

implementation

{$R *.dfm}

uses
  ShareUnit;

procedure TDemoForm.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
  GetRegisterHandle;
  Timer1Timer(Timer1);
end;

procedure TDemoForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if IsWindow(RegisterHandle) then
  begin
    GetRegisterInfo;
    if RegisterStrings.Count >= 5 then
    begin
      Edit1.Text := RegisterStrings[1];
      Edit2.Text := RegisterStrings[2];
      Edit3.Text := RegisterStrings[3];
      Caption := RegisterStrings[4];
      if RegisterStrings[0] = 'Y' then
        Button1.Hint := 'Registered'
      else
        Button1.Hint := 'Unregistered';
      Button2.Hint := '';
      Button1.Enabled := True;
      Button3.Enabled := True;
      Edit4.Enabled := True;
      Edit5.Enabled := True;
      Edit6.Enabled := True;
      Edit7.Enabled := True;
      CheckBox1.Enabled := True;
      CheckBox2.Enabled := CheckBox1.Checked;
      Button4.Enabled := True;
      Button5.Enabled := True;
      Button6.Enabled := True;
      Button7.Enabled := True;
      ValueListEditor1.Enabled := True;
      ValueListEditor2.Enabled := True;
    end;
    Timer1.Enabled := True;
  end;
end;

procedure TDemoForm.Button1Click(Sender: TObject);
begin
  if IsWindow(RegisterHandle) then
  begin
    SetRegisterInfo(Edit2.Text, Edit3.Text);
    Timer1Timer(Timer1);
    Application.MessageBox(PChar(Button1.Hint), '', MB_OK);
  end;
end;

procedure TDemoForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TDemoForm.Button3Click(Sender: TObject);
begin
  ShowRegisterForm;
end;

procedure TDemoForm.CheckBox1Click(Sender: TObject);
begin
  CheckBox2.Enabled := CheckBox1.Checked;
end;

procedure TDemoForm.Button4Click(Sender: TObject);
var
  TempStr: string;
  OutBuf, InBuf: Pointer;
  OutBytes, InBytes: Integer;
begin
  Button4.Enabled := False;
  Button5.Enabled := False;
  TempStr := Edit4.Text;
  Edit6.Text := '';
  Edit7.Text := '';
  if CheckBox1.Checked then
  begin
    Edit6.Text := StringEncrypt(TempStr, Edit5.Text, CheckBox2.Checked);
    Edit7.Text := StringDecrypt(Edit6.Text, Edit5.Text, CheckBox2.Checked);
  end
  else begin
    Encrypt(@TempStr[1], Length(TempStr), OutBuf, OutBytes, Edit5.Text);
    if Assigned(OutBuf) and (OutBytes > 0) then
    begin
      SetLength(TempStr, OutBytes);
      CopyMemory(@TempStr[1], OutBuf, OutBytes);
      Edit6.Text := TempStr;
      Inbuf := OutBuf;
      InBytes := OutBytes;
      Decrypt(InBuf, InBytes, OutBuf, OutBytes, Edit5.Text);
      if Assigned(OutBuf) and (OutBytes > 0) then
      begin
        SetLength(TempStr, OutBytes);
        CopyMemory(@TempStr[1], OutBuf, OutBytes);
        Edit7.Text := TempStr;
        FreeMem(OutBuf, OutBytes);
      end;
      FreeMem(InBuf, InBytes);
    end;
  end;
  Button4.Enabled := True;
  Button5.Enabled := True;
end;

procedure TDemoForm.Button5Click(Sender: TObject);
var
  TempStr: string;
  OutBuf, InBuf: Pointer;
  OutBytes, InBytes: Integer;
begin
  Button4.Enabled := False;
  Button5.Enabled := False;
  TempStr := Edit4.Text;
  Edit6.Text := '';
  Edit7.Text := '';
  if CheckBox1.Checked then
  begin
    Edit6.Text := StringCompress(TempStr, Edit5.Text, CheckBox2.Checked);
    Edit7.Text := StringDecompress(Edit6.Text, Edit5.Text, CheckBox2.Checked);
  end
  else begin
    Compress(@TempStr[1], Length(TempStr), OutBuf, OutBytes, Edit5.Text);
    if Assigned(OutBuf) and (OutBytes > 0) then
    begin
      SetLength(TempStr, OutBytes);
      CopyMemory(@TempStr[1], OutBuf, OutBytes);
      Edit6.Text := TempStr;
      Inbuf := OutBuf;
      InBytes := OutBytes;
      Decompress(InBuf, InBytes, OutBuf, OutBytes, Edit5.Text);
      if Assigned(OutBuf) and (OutBytes > 0) then
      begin
        SetLength(TempStr, OutBytes);
        CopyMemory(@TempStr[1], OutBuf, OutBytes);
        Edit7.Text := TempStr;
        FreeMem(OutBuf, OutBytes);
      end;
      FreeMem(InBuf, InBytes);
    end;
  end;
  Button4.Enabled := True;
  Button5.Enabled := True;
end;

procedure TDemoForm.Button6Click(Sender: TObject);
var
  TempStr: string;
  i: Integer;
begin
  TempStr := '';
  for i := 1 to 4 do
    TempStr := TempStr + ValueListEditor1.Values[ValueListEditor1.Keys[i]] + #0;
  SetRegisterHint(@TempStr[1]);
end;

procedure TDemoForm.Button7Click(Sender: TObject);
var
  FontCharset, FontSize: Byte;
  TempStr: string;
  i: Integer;
begin
  FontCharset := 0;
  try
    FontCharset := Lo(StrToInt(ValueListEditor2.Values[ValueListEditor2.Keys[1]]));
  except
  end;
  FontSize := 0;
  try
    FontSize := Lo(StrToInt(ValueListEditor2.Values[ValueListEditor2.Keys[2]]));
  except
  end;
  TempStr := Chr(FontCharset) + Chr(FontSize);
  for i := 3 to 17 do
    TempStr := TempStr + ValueListEditor2.Values[ValueListEditor2.Keys[i]] + #0;
  SetLanguage(@TempStr[1]);
end;

end.
