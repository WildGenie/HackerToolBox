unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    RegNameEdit: TEdit;
    Label2: TLabel;
    SNEdit: TEdit;
    Button1: TButton;
    Button2: TButton;
    HWIDEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    LicTypeEdit: TEdit;
    LicTypeUpDown: TUpDown;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label5: TLabel;
    Label6: TLabel;
    UserParamEdit: TEdit;
    UserParamUpDown: TUpDown;
    Label7: TLabel;
    YearEdit: TEdit;
    YearUpDown: TUpDown;
    MonthCombo: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

uses ComObj, EXECryptorKeyGen;

procedure TForm3.FormCreate(Sender: TObject);
var j: integer;
begin
  for j:=1 to 12 do
    MonthCombo.Items.Add(LongMonthNames[j]);
  MonthCombo.ItemIndex:=0;
  RadioButton1Click(nil);
end;

procedure TForm3.RadioButton1Click(Sender: TObject);
begin
  CheckBox1.Enabled:=not RadioButton1.Checked;
  CheckBox2.Enabled:=not RadioButton1.Checked;
  CheckBox3.Enabled:=not RadioButton1.Checked;
  CheckBox4.Enabled:=not RadioButton1.Checked;
  CheckBox5.Enabled:=not RadioButton1.Checked;
  CheckBox6.Enabled:=not RadioButton1.Checked;
  LicTypeEdit.Enabled:=RadioButton3.Checked;
  LicTypeUpDown.Enabled:=RadioButton3.Checked;
  UserParamEdit.Enabled:=RadioButton3.Checked;
  UserParamUpDown.Enabled:=RadioButton3.Checked;
  MonthCombo.Enabled:=RadioButton2.Checked;
  YearEdit.Enabled:=RadioButton2.Checked;
  YearUpDown.Enabled:=RadioButton2.Checked;
end;

procedure TForm3.Button2Click(Sender: TObject);
var V,SerialNumber: Variant;
begin
  V:=CreateOleObject('eckeygen.ExeCryptorKeyGen');
  try
    // path may be relative from eckeygen.dll placement
    if RadioButton1.Checked then
      V.CreateSerialNumber('Example\Delphi\SerialsAPI\SerialsAPIDemo.ep2',
        RegNameEdit.Text,HWIDEdit.Text,SerialNumber)
    else if RadioButton2.Checked then
      V.CreateSerialNumberTimeLimit('Example\Delphi\SerialsAPI\SerialsAPIDemo.ep2',
        RegNameEdit.Text,HWIDEdit.Text,
        CheckBox1.Checked,CheckBox2.Checked,CheckBox3.Checked,
        CheckBox4.Checked,CheckBox5.Checked,CheckBox6.Checked,
        LicTypeUpDown.Position,MonthCombo.ItemIndex+1,YearUpDown.Position,
        SerialNumber)
    else
      V.CreateSerialNumberEx('Example\Delphi\SerialsAPI\SerialsAPIDemo.ep2',
        RegNameEdit.Text,HWIDEdit.Text,
        CheckBox1.Checked,CheckBox2.Checked,CheckBox3.Checked,
        CheckBox4.Checked,CheckBox5.Checked,CheckBox6.Checked,
        LicTypeUpDown.Position,UserParamUpDown.Position,
        SerialNumber);
    SNEdit.Text:=SerialNumber;
  finally
    V:=Unassigned;
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  RegistrationName,HardwareID,SerialNumber: string;
  KeyGen: TKeyGen;
  li: TSerialNumberInfo;
begin
  KeyGen:=TKeyGen.Create('..\..\..\');
  try
    // path may be relative from eckeygen.dll placement
    if RadioButton1.Checked then
      SNEdit.Text:=KeyGen.CreateSerialNumber(
        'Example\Delphi\SerialsAPI\SerialsAPIDemo.ep2',
        RegNameEdit.Text,HWIDEdit.Text)
    else if RadioButton2.Checked then
      SNEdit.Text:=KeyGen.CreateSerialNumberTimeLimited(
        'Example\Delphi\SerialsAPI\SerialsAPIDemo.ep2',
        RegNameEdit.Text,CheckBox1.Checked,CheckBox2.Checked,CheckBox3.Checked,
        CheckBox4.Checked,CheckBox5.Checked,CheckBox6.Checked,
        LicTypeUpDown.Position,MonthCombo.ItemIndex+1,YearUpDown.Position,HWIDEdit.Text)
    else
      SNEdit.Text:=KeyGen.CreateSerialNumberEx(
        'Example\Delphi\SerialsAPI\SerialsAPIDemo.ep2',
        RegNameEdit.Text,CheckBox1.Checked,CheckBox2.Checked,CheckBox3.Checked,
        CheckBox4.Checked,CheckBox5.Checked,CheckBox6.Checked,
        LicTypeUpDown.Position,UserParamUpDown.Position,HWIDEdit.Text);
  finally
    FreeAndNil(KeyGen);
  end;
end;

end.
