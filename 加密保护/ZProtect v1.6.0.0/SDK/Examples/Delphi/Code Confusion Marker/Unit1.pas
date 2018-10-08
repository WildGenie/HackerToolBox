unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function StrToBack(s: string): string;    //reverse the string
var i:integer;
begin
    for i:=1 to length(s) do
    begin
    result :=s[i]+result;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     {$I ..\Code_Confusion_START.inc}
  if Edit1.Text=StrToBack('Zprotect') then
     MessageDlg('Correct password', mtInformation, [mbOK], 0)
  else
  begin
   MessageDlg('Incorrect password', mtError, [mbOK], 0);
   Edit1.SetFocus;
  end;
  {$I ..\Code_Confusion_END.inc}
end;

end.
