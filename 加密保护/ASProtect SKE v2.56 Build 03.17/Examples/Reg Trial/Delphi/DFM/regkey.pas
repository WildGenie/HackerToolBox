{$J+}
unit regkey;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmRegKey = class(TForm)
    lCode: TLabel;
    btnRegOk: TButton;
    btnRegCancel: TButton;
    btnRegPaste: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    eCode: TEdit;
    lName: TLabel;
    eName: TEdit;
    procedure btnRegPasteClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRegOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegKey: TfrmRegKey;

implementation

uses
  ShellAPI,
  aspr_api;

var
  LocalHardwareID : PChar;

{$R *.DFM}

//------------------------------------------------------------------------------

procedure TfrmRegKey.btnRegPasteClick(Sender: TObject);
begin
  eCode.Clear;
  eCode.PasteFromClipboard;
end;

//------------------------------------------------------------------------------

procedure TfrmRegKey.Button4Click(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', PChar('mailto:support@aspack.com?subject=Hardware%20key%20for%20Advanced%20Application%201.0&body=Hardware%20key is%20:%20'+Edit1.Text+
                                                 '%0d%0aName%20for%20registration%20:'), nil, nil, SW_SHOWNORMAL);
end;

//------------------------------------------------------------------------------

procedure TfrmRegKey.FormCreate(Sender: TObject);
begin
  LocalHardwareID := GetHardwareID;
  Edit1.Text      := StrPas( LocalHardwareID );
end;

//------------------------------------------------------------------------------

procedure TfrmRegKey.btnRegOkClick(Sender: TObject);
begin

  If CheckKeyAndDecrypt( PChar(eCode.Text), PChar(eName.Text), True ) then
  begin
    MessageBox(Handle, 'Thank you for your registration!', 'Registration', MB_ICONINFORMATION);
    Close;
  end else
    MessageBox(Handle, 'Key is not valid, please contact manufacture!','Registration', MB_ICONWARNING);

end;

//------------------------------------------------------------------------------

end.