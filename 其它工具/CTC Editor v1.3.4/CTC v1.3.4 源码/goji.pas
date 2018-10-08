unit goji;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,INIFiles;

type
  TGaoji_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    author: TEdit;
    Label2: TLabel;
    Profassion: TEdit;
    Label12: TLabel;
    Copyright: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Email: TEdit;
    Label4: TLabel;
    hpage: TEdit;
    Label5: TLabel;
    qq: TEdit;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure saveini(fname:string);
    procedure readini(fname:string);
    procedure authorChange(Sender: TObject);
    procedure hpageChange(Sender: TObject);
    procedure EmailChange(Sender: TObject);
    procedure qqChange(Sender: TObject);
    procedure ProfassionChange(Sender: TObject);
    procedure CopyrightChange(Sender: TObject);
  private
    { Private declarations }
  public
    //procedure saveini(fname:string);
   // procedure readini(fname:string);
    { Public declarations }
  end;

var
  Gaoji_Form: TGaoji_Form;
  MyINIFile:TINIFile;
  filename: string;
  modify:bool;

implementation

{$R *.dfm}
uses
main;
//////////////////////////////////////////////

procedure TGaoji_Form.saveini(fname:string);

begin
 //保存信息

 try
  MyINIFile:=TINIFile.Create(fname);
  MyINIFile.WriteString('basic','author',author.Text );
  MyINIFile.WriteString('basic','email',email.Text );
  MyINIFile.WriteString('basic','hpage',hpage.Text );
  MyINIFile.WriteString('basic','qq',qq.Text );
  MyINIfile.WriteString('basic','profassion',profassion.Text );
  MyINIfile.WriteString('basic','copyright',copyright.Text );
 finally
  MyINIFile.Destroy ;
 end;
end;

procedure TGaoji_Form.readini(fname:string);

begin
 //读取信息
  try
   MyINIFile:=TINIFile.Create(filename);
   author.Text :=MyINIFile.ReadString('basic','author','gui');
   email.text:=MyINIFile.ReadString('basic','email','gui@yahoo.com');
   hpage.Text:=MyINIFile.ReadString('basic','hpage','');
   qq.Text :=MyINIFile.ReadString('basic','qq','');
   profassion.Text :=MyINIFile.ReadString('basic','profassion','只是感兴趣，没有其他目的。失误之处敬请诸位大侠赐教!');
   copyright.Text :=MyINIFile.ReadString('basic','copyright','本文原创于看雪技术论坛, 转载请注明作者并保持文章的完整, 谢谢!');
   finally
    MyINIFile.Destroy ;
    modify:=false;
   end;
end;



////////////////////////////////////////////
procedure TGaoji_Form.Button1Click(Sender: TObject);

begin
 //保存信息
 filename:=ExtractFilePath(Application.ExeName)+'CTC.ini';
  saveini(filename);
   Gaoji_Form.Close ;
end;



procedure TGaoji_Form.Button2Click(Sender: TObject);
begin
//清空
author.Text :='';
email.text:='';
hpage.Text:='';
qq.Text:='';
profassion.Text :='';
copyright.text:='';



end;

procedure TGaoji_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//在退出时设置主窗体中相映的内容
if modify then
  begin
    Main_form.Edit2.text :=author.Text;
    Main_form.Edit3.text:=email.Text;
    Main_form.Edit4.text:=hpage.Text;
    Main_form.Edit5.text:=qq.Text;
    Main_form.Edit200.text :=profassion.Text;
    Main_form.Edit100.text :=copyright.text;
  end;  
end;

procedure TGaoji_Form.FormShow(Sender: TObject);
begin
   //在显示窗口时，读取保存的信息
   filename:=ExtractFilePath(Application.ExeName)+'CTC.ini';
   if FileExists(filename) then
      readini(filename);
   
end;

procedure TGaoji_Form.authorChange(Sender: TObject);
begin
 modify:=true;
end;

procedure TGaoji_Form.hpageChange(Sender: TObject);
begin
  modify:=true;
end;

procedure TGaoji_Form.EmailChange(Sender: TObject);
begin
modify:=true;
end;

procedure TGaoji_Form.qqChange(Sender: TObject);
begin
modify:=true;
end;

procedure TGaoji_Form.ProfassionChange(Sender: TObject);
begin
modify:=true;
end;

procedure TGaoji_Form.CopyrightChange(Sender: TObject);
begin
modify:=true;
end;

end.
