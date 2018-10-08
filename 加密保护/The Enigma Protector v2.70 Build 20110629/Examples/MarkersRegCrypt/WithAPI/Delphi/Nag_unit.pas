unit Nag_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmNag = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label5: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNag: TfrmNag;

implementation

uses Registration_unit;

{$R *.dfm}

procedure TfrmNag.Button3Click(Sender: TObject);
begin
  // Exit from application
  Application.Terminate;
end;

procedure TfrmNag.Button2Click(Sender: TObject);
begin
  // Just close NAG form and go to Main form
  Close;
end;

procedure TfrmNag.Button1Click(Sender: TObject);
begin
  // Show registration window
  frmRegistration.ShowModal;
end;

end.
