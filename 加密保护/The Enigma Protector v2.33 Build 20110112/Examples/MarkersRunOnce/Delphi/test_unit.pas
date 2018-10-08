unit test_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btnShowMessage: TButton;
    Label2: TLabel;
    Label3: TLabel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnShowMessageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnShowMessageClick(Sender: TObject);
begin
  {$I ..\..\..\EnigmaSDK\Delphi\run_once_begin.inc}
  // This message will be shown only once per execution
  ShowMessage('This message is under RunOnce marker');
  {$I ..\..\..\EnigmaSDK\Delphi\run_once_end.inc}
end;

end.
