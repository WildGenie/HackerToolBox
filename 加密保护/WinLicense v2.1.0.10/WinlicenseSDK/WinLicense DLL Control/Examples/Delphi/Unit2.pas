unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WDC_SDK;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btCheckText: TButton;
    btInstallTextToFile: TButton;
    btRestartApplication: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    btCheckSmart: TButton;
    btInstallSmartToFile: TButton;
    btRestartApplication2: TButton;
    edSmartKey: TEdit;
    Button1: TButton;
    edTextKey: TEdit;
    Label3: TLabel;
    edUserName: TEdit;
    edCompany: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edCustom: TEdit;
    procedure btRestartApplicationClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btCheckTextClick(Sender: TObject);
    procedure btInstallTextToFileClick(Sender: TObject);
    procedure btCheckSmartClick(Sender: TObject);
    procedure btInstallSmartToFileClick(Sender: TObject);

  private

    { Private declarations }

  public

    { Public declarations }

    ArrayFunctions: TWDCfunctionsArray;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btRestartApplicationClick(Sender: TObject);
begin

  ArrayFunctions.pfWLRestartApplication();

end;

procedure TForm2.Button1Click(Sender: TObject);
begin

  Close;
  
end;

procedure TForm2.btCheckTextClick(Sender: TObject);
begin

  if ArrayFunctions.pfWLRegNormalKeyCheck(PChar(edTextKey.Text)) then
    ShowMessage('Text key is correct')
  else
    ShowMessage('INVALID text key!');

end;

procedure TForm2.btInstallTextToFileClick(Sender: TObject);
begin

  if ArrayFunctions.pfWLRegNormalKeyInstallToFile(PChar(edTextKey.Text)) then
    ShowMessage('Key successfully installed. You need to restart the application')
  else
    ShowMessage('Error while installing the key');

end;

procedure TForm2.btCheckSmartClick(Sender: TObject);
var
  pName, pCompany, pCustom:PChar;

begin

  // set parameters for WLRegSmartKeyCheck

  if edUserName.Text <> '' then
    pName := PChar(edUserName.Text)
  else
    pName := nil;

  if edCompany.Text <> '' then
    pCompany := PChar(edCompany.Text)
  else
    pCompany := nil;

  if edCustom.Text <> '' then
    pCustom := PChar(edCustom.Text)
  else
    pCustom := nil;

  if ArrayFunctions.pfWLRegSmartKeyCheck(pName, pCompany, pCustom, PChar(edSmartKey.Text)) then
    ShowMessage('SmartKey is correct')
  else
    ShowMessage('INVALID Smart key!');

end;

procedure TForm2.btInstallSmartToFileClick(Sender: TObject);
var
  pName, pCompany, pCustom:PChar;

begin

  // set parameters for WLRegSmartKeyInstallToFile

  if edUserName.Text <> '' then
    pName := PChar(edUserName.Text)
  else
    pName := nil;

  if edCompany.Text <> '' then
    pCompany := PChar(edCompany.Text)
  else
    pCompany := nil;

  if edCustom.Text <> '' then
    pCustom := PChar(edCustom.Text)
  else
    pCustom := nil;

  if ArrayFunctions.pfWLRegSmartKeyInstallToFile(pName, pCompany, pCustom, PChar(edSmartKey.Text)) then
    ShowMessage('Key successfully installed. You need to restart the application')
  else
    ShowMessage('Error while installing the key');

end;

end.
