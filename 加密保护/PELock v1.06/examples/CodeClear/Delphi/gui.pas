unit gui;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmMain = class(TForm)
    lblInfo: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin

// code between encryption markers is encrypted during process
// of file protection and when protected file is executed,
// code is being decrypted. When decrypted code is finally executed
// it is erased from the memory
// put CLEAR_START and CLEAR_END markers in code fragments that are
// executed only once during program session (eg. FormCreate for Delphi)
{$I INCLUDE\CLEAR_START.INC}

lblInfo.Caption := 'Hello world';

{$I INCLUDE\CLEAR_END.INC}

end;

end.
