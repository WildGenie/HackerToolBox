unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,MiniFMOD;
  //MiniFMOD播放xm音乐的模块
type
  TAbout_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About_Form: TAbout_Form;

implementation

{$R *.dfm}
{$R myxm.res}



procedure TAbout_Form.Label3Click(Sender: TObject);
begin
//    if button=mbLeft then
//  begin
    About_Form.Close ;
 // end;
end;

procedure TAbout_Form.Label4Click(Sender: TObject);
begin

    About_Form.Close ;

end;

procedure TAbout_Form.Label2Click(Sender: TObject);
begin
 
    About_Form.Close ;

end;

procedure TAbout_Form.Label1Click(Sender: TObject);
begin
 
    About_Form.Close ;

end;


procedure TAbout_Form.FormClick(Sender: TObject);
begin
About_Form.Close ;
end;

procedure TAbout_Form.GroupBox1Click(Sender: TObject);
begin
  About_Form.Close ;
end;


procedure TAbout_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
XMFree(); //释放资源
end;

procedure TAbout_Form.FormShow(Sender: TObject);
begin
XMPlayFromRes('xm1', 'xmfile'); //播放资源文件中的xm音乐
end;

end.
