unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

uses 
  VMProtectSDK;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
 VMProtectBegin('Test marker');
 if StrToIntDef(Edit1.Text, 0) mod 17=13 then
  MessageDlg(VMProtectDecryptStringA('Correct password'), mtInformation, [mbOK], 0)
 else
  begin
   MessageDlg(VMProtectDecryptStringA('Incorrect password'), mtError, [mbOK], 0);
   Edit1.SetFocus;
  end;
 VMProtectEnd; 
end;

initialization
  {$I unit1.lrs}

end.