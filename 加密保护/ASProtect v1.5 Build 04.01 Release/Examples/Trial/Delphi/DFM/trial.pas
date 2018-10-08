{$J+}
unit trial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmTrial = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrial: TfrmTrial;

  function CallRegForm : Boolean;

implementation

uses
  Registry,
  ShellAPI,
  regkey;

{$R *.DFM}

procedure TfrmTrial.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTrial.Button2Click(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', PChar('http://www.aspack.com/register.htm'), nil, nil, SW_SHOWNORMAL);
end;
//------------------------------------------------------------------------------
function ReplaceStr(const S, Srch, Replace: string): string;
var
  I: Integer;
  Source: string;
begin
  Source := S;
  Result := '';
  repeat
    I := Pos(Srch, Source);
    if I > 0 then begin
      Result := Result + Copy(Source, 1, I - 1) + Replace;
      Source := Copy(Source, I + Length(Srch), MaxInt);
    end
    else Result := Result + Source;
  until I <= 0;
end;
//------------------------------------------------------------------------------
function CallRegForm : Boolean;
begin
  Result := False;
  with TfrmRegKey.Create(Application) do
  try
    if ShowModal = idOK then
    with TRegistry.Create do
    try
      if OpenKey('Software\Test',True) then
        try
          WriteString('Key',ReplaceStr(Memo.Text,' ',''));
          MessageBox(handle,'Thank you for your registration.'#13#10'Please, restart the application.','Registration',MB_ICONINFORMATION);
          Result := True;
        except
          MessageBox(handle,'Write Error!','Registration Error',MB_ICONSTOP);
        end;
    finally
      Free;
    end;
  finally
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmTrial.Button3Click(Sender: TObject);
begin
  Hide;
  if CallRegForm then Close;
  Close;
end;

end.
