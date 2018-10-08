unit reg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, sdprotector, ExtCtrls;

type
  TRegForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    HardwareID: TEdit;
    btSend: TButton;
    btBuy: TButton;
    btExit: TButton;
    Image1: TImage;
    procedure btSendClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure btBuyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegForm: TRegForm;

implementation

uses
  ShellAPI;
{$R *.DFM}

procedure TRegForm.btSendClick(Sender: TObject);
var szHardwareID:array[0..41] of char;
var buffer:array[0..1023] of char;
begin
     fillchar(szHardwareID,42,#0);
     fillchar(buffer,1024,#0);
   if SDP_RetrieveHardwareID(@szHardwareID[0],42) <> 0 then
     begin
      StrCopy(buffer,'mailto:support@yourwebsite.com?subject=Hardware%20ID%20for%20Advanced%20Application%201.0&body=Hardware%20ID is%20:%20');
      StrCat(buffer,szHardwareID);
      StrCat(buffer,'%0d%0aName%20for%20registration%20:');
      ShellExecute(GetDesktopWindow(),'open',buffer, nil, nil, SW_SHOWNORMAL);
     end
   else
      MessageBox(0,'Can not get hardware id', 'Error', MB_ICONINFORMATION);

end;

procedure TRegForm.btExitClick(Sender: TObject);
begin
   ExitProcess(0);
end;
procedure TRegForm.FormCreate(Sender: TObject);
var szHardwareID:array[0..41] of char;
begin
       //   MessageBox(0,'Can not get hardware id', 'Error', MB_ICONINFORMATION);

     if SDP_RetrieveHardwareID(@szHardwareID[0],42) <> 0 then
        HardwareID.Text := StrPas(szHardwareID)
      else
        MessageBox(0,'Can not get hardware id', 'Error', MB_ICONINFORMATION);
end;

procedure TRegForm.btBuyClick(Sender: TObject);
begin
ShellExecute(GetDesktopWindow(), 'open', PChar('http://www.sdprotector.com/purchase.htm'), nil, nil, SW_SHOWNORMAL);
end;

end.
