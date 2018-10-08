unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    UpDown1: TUpDown;
    CheckBox2: TCheckBox;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  hLib: Cardinal;
  Fun1: function(MachineID, User, Password, ProductID: PChar; FirstNumber, Count: Integer): LongBool; stdcall;
  Fun2: function(MachineID, User, Password, ProductID: PChar): LongBool; stdcall;
  Fun3: function(SourceFileName, Password: PChar): LongBool; stdcall;

implementation

{$R *.dfm}

procedure DoLoad;
begin
  if hLib = 0 then
  begin
    Fun1 := nil;
    Fun2 := nil;
    Fun3 := nil;
    hLib := LoadLibrary('ProductID.dll');
  end;
  if hLib > 0 then
  begin
    if not Assigned(Fun1) then
      Fun1 := GetProcAddress(hLib, 'GenerateProductID');
    if not Assigned(Fun2) then
      Fun2 := GetProcAddress(hLib, 'VerifyProductID');
    if not Assigned(Fun3) then
      Fun3 := GetProcAddress(hLib, 'GenerateKeyFile');
  end;
end;

procedure DoUnload;
begin
  if hLib > 0 then
  begin
    FreeLibrary(hLib);
    hLib := 0;
    Fun1 := nil;
    Fun2 := nil;
    Fun3 := nil;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ProductID: string;
begin
  DoLoad;
  if Assigned(Fun1) then
  begin
    SetLength(ProductID, 4096);
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
    if Fun1(PChar(Edit1.Text), PChar(Edit2.Text), PChar(Edit3.Text), @ProductID[1], StrToInt(Edit5.Text), 100) then
      Edit4.Text := PChar(ProductID);
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
    ProductID := '';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DoLoad;
  if Assigned(Fun2) then
  begin
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
    CheckBox1.Checked := Fun2(PChar(Edit1.Text), PChar(Edit2.Text), PChar(Edit3.Text), PChar(Edit4.Text));
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DoUnload;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    Edit3.PasswordChar := '*'
  else
    Edit3.PasswordChar := #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit3.Text := ParamStr(1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DoLoad;
  with OpenDialog1 do
  begin
    if Assigned(Fun3) and (Edit4.Text <> '') and Execute then
    begin
      Button1.Enabled := False;
      Button2.Enabled := False;
      Button3.Enabled := False;
      Fun3(PChar(FileName), PChar(Edit4.Text));
      Button1.Enabled := True;
      Button2.Enabled := True;
      Button3.Enabled := True;
    end;
  end;
end;

end.
