unit trial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TTrialForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    btBuy: TButton;
    btEvalution: TButton;
    Bevel1: TBevel;
    procedure btEvalutionClick(Sender: TObject);
    procedure btBuyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrialForm: TTrialForm;

implementation

uses
  ShellAPI;

{$R *.DFM}

procedure TTrialForm.btEvalutionClick(Sender: TObject);
begin
Close;
end;

procedure TTrialForm.btBuyClick(Sender: TObject);
begin
ShellExecute(GetDesktopWindow(),'open',PChar('http://www.sdprotector.com/purchase.htm'), nil, nil, SW_SHOWNORMAL);
end;

end.
