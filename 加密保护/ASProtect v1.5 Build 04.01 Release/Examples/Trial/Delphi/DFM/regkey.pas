{$J+}
unit regkey;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmRegKey = class(TForm)
    Memo: TMemo;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegKey: TfrmRegKey;

implementation

uses
  ShellAPI;

var
  LocalHardwareID : PChar;

{$R *.DFM}

procedure TfrmRegKey.Button3Click(Sender: TObject);
begin
  Memo.Clear;
  Memo.PasteFromClipboard;
end;

procedure TfrmRegKey.Button4Click(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', PChar('mailto:support@aspack.com?subject=Hardware%20key%20for%20Advanced%20Application%201.0&body=Hardware%20key is%20:%20'+Edit1.Text+
                                                 '%0d%0aName%20for%20registration%20:'), nil, nil, SW_SHOWNORMAL);
end;

procedure GetHardwareID(HardwareID : PChar);stdcall;
begin
  LocalHardwareID := HardwareID;
end;
exports GetHardwareID;

procedure TfrmRegKey.FormCreate(Sender: TObject);
begin
  Edit1.Text := StrPas(LocalHardwareID);
end;

end.
