unit Registration_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmRegistration = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistration: TfrmRegistration;

implementation

uses enigma_ide;

{$R *.dfm}

procedure TfrmRegistration.Button1Click(Sender: TObject);
begin
  // If registration information is correct then will
  // show "Happy" window, otherwise, if registration is
  // unsuccess we will close Registration window without
  // any offer...
  if EP_RegCheckAndSaveKey(PChar(Edit1.Text), PChar(Edit2.Text)) then
  begin
    ShowMessage('You''re good guy!!! Thanks for registration! You must restart application to take effect!')
  end;
  Close;
end;

end.
