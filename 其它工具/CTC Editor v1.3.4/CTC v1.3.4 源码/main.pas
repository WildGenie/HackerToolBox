unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,crea,about,goji,INIFiles, SkinCaption, WinSkinData,
  ExtCtrls, Buttons, Menus;


type
    THookProcedure=procedure; stdcall;
    PKBDLLHOOKSTRUCT = ^KBDLLHOOKSTRUCT;

    KBDLLHOOKSTRUCT = record
    vkCode: DWORD;
    ScanCode: DWORD;
    Flags: DWORD;
    Time: DWORD;
    dwExtraInfo: DWORD;
    end;

  TMain_Form = class(TForm)
    SkinData1: TSkinData;
    SkinCaption1: TSkinCaption;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox6: TGroupBox;
    Label120: TLabel;
    Label110: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    GroupBox5: TGroupBox;
    Label100: TLabel;
    Memo2: TMemo;
    Edit100: TEdit;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    OpenDialog1: TOpenDialog;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit13: TEdit;
    Edit12: TEdit;
    Edit14: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox3: TGroupBox;
    Label200: TLabel;
    Edit200: TEdit;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    SpeedButton2: TSpeedButton;
    Panel7: TPanel;
    SpeedButton4: TSpeedButton;
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit200Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure Edit100Change(Sender: TObject);
    procedure temsave;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
     //取得最大化的消息~
    procedure WMGetMinMaxInfo(var Msg:TWMGetMinMaxInfo);message WM_GETMINMAXINFO;
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;
  MyINIFile:TINIFile;
  filename: string;
  p1heigh,p2heigh:integer;
  modify,saveed:boolean;

  hHk :HHOOK;
  pressHomeed:Integer;//为-1表示已经按下了HOMW,此时窗口为最小化状态
implementation

{$R *.dfm}

//做个键盘钩子
function keyHookProc(nCode: Integer;WParam: WPARAM;LParam: LPARAM): LRESULT;stdcall;
//调用键盘钩子，屏蔽左右win功能键
var
p: PKBDLLHOOKSTRUCT;
y: integer;
//FoundPixel:integer;

begin
if nCode<0 then
  Result:= CallNextHookEx(hHk,nCode,WParam,LParam)
else
  begin
   // y := 0;
    case WParam of
    WM_KEYDOWN,WM_SYSKEYDOWN: //按键后判断所按键
      begin
        p:=PKBDLLHOOKSTRUCT(Lparam);
        case p^.vkCode of
         // VK_LWIN: y:=1;
         // VK_RWIN: y:=1;
         // VK_F11:
         //        begin
         //        end;
         // VK_F12:
         //        begin
         //        end;
          VK_HOME:
                begin

                  y:=1;
                  //showMessage('HOME');

                 if pressHomeed=1 then
                    begin
                    //去除置顶显示
                    SetWindowPos(application.Handle, HWND_NOTOPMOST,
                                 0,0,0,0, SWP_NOMOVE   or   SWP_NOSIZE);
                    //最小化窗体
                    SendMessage(application.Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
                    end
                 else
                    begin
                    //恢复最小化的窗口
                    ShowWindow(application.Handle , SW_NORMAL);
                    SetForegroundWindow(application.Handle);
                    //并置顶显示
                    SetWindowPos(application.Handle,HWND_TOPMOST,
                                  0,0,0,0,SWP_NOMOVE   or   SWP_NOSIZE);

                    end;
                pressHomeed:=pressHomeed*-1;   //表示窗口的状态（是最小化还是普通）

                end;

        end;
        //if p^.vkCode = VK_LWIN then
       //   y := 1;
       // if p^.vkCode = VK_UP then
       //   showMessage('up_down');
      //  if p^.vkCode = VK_RWIN then
      //    y := 1;
      end;
    {WM_KEYUP,WM_SYSKEYUP: //松开按键后判断所按键
      begin
        p:=PKBDLLHOOKSTRUCT(Lparam);
        case p^.vkCode of
          VK_LWIN: y:=1;
          VK_RWIN: y:=1;
          
        end;
       // if p^.vkCode = VK_LWIN then
       //  y := 1;
       // if p^.vkCode = VK_RWIN then
       //   y := 1;
      end;   }
    end;
   if y=1 then
      Result:=1 //如果为WIN功能键则屏蔽
   else
      Result:= CallNextHookEx(hHk,nCode,WParam,LParam); //其他键放下一个钩子
  end;
end;
 
function Enablehide:Boolean;stdcall;export; //外部调用
begin
if hHk = 0 then
  begin
    hHk := SetWindowsHookEx(13,@keyHookProc,HInstance,0);
    Result := True;
  end
else
  Result := False;
//ycxsks(true);
end;

function Disablehide:Boolean; stdcall; export; //外部调用
begin
if hHk <> 0 then
  begin
    UnHookWindowsHookEx(hHk);
    hHk := 0;
    Result := True;
  end
else
  Result := False;
//ycxsks(False);
end;



function ReplaceSub(str, sub1, sub2: String): String;
var
   aPos: Integer;
   rslt: String;
  begin
    aPos := Pos(sub1, str);
    //取得子字符串的位置
    rslt := '';
    while (aPos <> 0) do begin
      rslt := rslt + Copy(str, 1, aPos - 1) + sub2;
      Delete(str, 1, aPos + Length(sub1));
      //删除要替换的字符串
      aPos := Pos(sub1, str);
    end;
    Result := rslt + str;
    //添加要字符串
  end;

////////////////////////////////////////////////////////////////
function Savewinow:bool;
begin
MyINIFile:=TINIFile.Create(filename);
    ///////需要用INI直接写入数值，而非字符
     MyINIFile.WriteInteger('window','top',Main_Form.Top );
     MyINIFile.WriteInteger('window','left',Main_Form.left );
     MyINIFile.WriteInteger('window','height',Main_Form.height );
     MyINIFile.WriteInteger('window','width',Main_Form.width );

     MyINIFile.WriteInteger('window','pa1height',main_form.panel1.Height );
     MyINIFile.WriteInteger('window','pa2height',main_form.panel2.Height );

     MyINIFile.WriteInteger ('window','state',Integer(Main_Form.WindowState) );
     MyINIFile.Destroy ;
savewinow:=true;
end;


procedure TMain_Form.temsave;
var
fileini:string;
filemo1,filemo2:string;
begin

 //if edit1.Text <>'' then
// begin
 //临时信息保存到temp.ini中
  fileini:=ExtractFilePath(Application.ExeName)+'tem\'+edit1.Text+'.ini';
 MyINIFile:=TINIFile.Create(fileini);
 MyINIFile.WriteString('basic','title',edit1.Text );
 MyINIFile.WriteString('basic','author',edit2.Text );
 MyINIFile.WriteString('basic','email',edit3.Text );
 MyINIfile.WriteString('basic','hpage',edit4.Text );
 MyINIfile.WriteString('basic','qq',edit5.Text );
 //软件信息
 MyINIfile.WriteString('basic','softname',edit6.Text );
 MyINIfile.WriteString('basic','size',edit7.Text );
 MyINIfile.WriteString('basic','down',edit8.Text );
 MyINIfile.WriteString('basic','pack',edit9.Text );
 MyINIfile.WriteString('basic','limit',edit10.Text );
 MyINIfile.WriteString('basic','langue',edit11.Text );
 MyINIfile.WriteString('basic','tools',edit12.Text );
 MyINIfile.WriteString('basic','os',edit13.Text );
 MyINIfile.WriteString('basic','softabout',edit14.Text );     //软件简介
 //作者声明和版权声明
 MyINIfile.WriteString('basic','profassion',edit200.Text );
 MyINIfile.WriteString('basic','copyright',edit100.Text );
 MyINIFile.Destroy ;
 //临时保存软件简介、详细过程和总结

 filemo1:=ExtractFilePath(Application.ExeName)+'tem\'+edit1.Text+'.da1';     //详细过程和总结
 filemo2:=ExtractFilePath(Application.ExeName)+'tem\'+edit1.Text+'.da2';   //总结

 Memo1.Lines.SaveToFile(filemo1);
 Memo2.Lines.SaveToFile(filemo2);
 //保存文件的标志，置真值
 saveed:=true;

// end
 //else
//   application.MessageBox('请先给文章加个标题吧','还没有标题吧',0);

end;


/////////////////////////////////////////////////???????????????????????????????
procedure TMain_Form.WMGetMinMaxInfo(var Msg:TWMGetMinMaxInfo);
begin
inherited;
with Msg.MinMaxInfo^do
  begin

     ptMinTrackSize.x:=688;//最小宽度

  //if ptMaxTrackSize.x<=Main_Form.width  then
     // ptMaxTrackSize.x:=1000;//最大的宽度
    speedbutton1.Left :=round(Main_Form.Width /2)-22;
    speedbutton2.Left:=speedbutton1.Left;
    speedbutton3.Left:=speedbutton1.Left;
    speedbutton4.Left:=speedbutton1.Left;
    GroupBox2.Width :=Main_Form.Width- GroupBox1.Width-10;
  end;
    Msg.Result := 0; {告诉Windows你改变了 minmaxinfo}
  inherited;
end;

procedure TMain_Form.Button5Click(Sender: TObject);
begin
//显示基本信息配制窗口
Gaoji_form.Show ;
end;
procedure TMain_Form.Button2Click(Sender: TObject);
begin
//显示关于窗口
About_Form.show;
end;

procedure TMain_Form.Button1Click(Sender: TObject);
var
i:integer;
begin


if modify then
   begin
   if not(saveed) then
          begin
          i:=application.MessageBox ('文件已经修改但尚未保存,是否保存后退出？','保存提示',3);
          // showmessage(inttostr(i));
          if i=6 then
               begin
               if edit1.Text <>'' then   //选择了先保存再退出
                     begin
                       Main_Form.temsave;
                       application.Terminate ;
                     end
               else
                   application.MessageBox('请先给文章加个标题吧','保存提示',0);
               end
          else if i=7 then
          //选择了直接退出
           begin
           application.Terminate;
           Savewinow;
           end
          else
          //选择了取消
          end
    else
      begin
      application.Terminate ;   //结束程序
      Savewinow;
      end;
    end
else
  begin
  application.Terminate ;  //结束程序
  Savewinow;
  end;
end;

procedure TMain_Form.Button4Click(Sender: TObject);
begin
if edit1.Text <>'' then
     //显示生成文件窗口
     Crea_Form.Show
   else
     application.MessageBox('请先给文章加个标题吧','保存提示',0);
end;


procedure TMain_Form.FormCreate(Sender: TObject);
var
windowstate,p1hi,p2hi :integer;
begin

   Enablehide; //注册钩子
   pressHomeed :=1;
  //是否有修改
   modify:=false;
   //是否已经保存
   saveed:=false;
   //保存好三个Panel的高度，恢复时用
   p1heigh:=panel1.Height ;
   p2heigh:=panel2.Height ;
   //在启动时，创建存放临时文件的tem目录
   if not DirectoryExists(ExtractFilePath(Application.ExeName)+'tem') then
   if not CreateDir(ExtractFilePath(Application.ExeName)+'tem') then
   raise Exception.Create('Cannot create'+ExtractFilePath(Application.ExeName)+'tem');
   //在启动时，创建存放文本文件的txt目录
   if not DirectoryExists(ExtractFilePath(Application.ExeName)+'txt') then
   if not CreateDir(ExtractFilePath(Application.ExeName)+'txt') then
   raise Exception.Create('Cannot create'+ExtractFilePath(Application.ExeName)+'txt');
   //在启动时，创建存放htm网页文件的htm目录
   if not DirectoryExists(ExtractFilePath(Application.ExeName)+'htm') then
   if not CreateDir(ExtractFilePath(Application.ExeName)+'htm') then
   raise Exception.Create('Cannot create'+ExtractFilePath(Application.ExeName)+'htm');

   //在启动时取出设置的作者的基本信息
   filename:=ExtractFilePath(Application.ExeName)+'CTC.ini';
  // gaoji_form.readini(filename);
   
   if FileExists(filename) then
    begin
    MyINIFile:=TINIFile.Create(filename);

    edit2.Text :=MyINIFile.ReadString('basic','author','');
    edit3.text:=MyINIFile.ReadString('basic','email','');
    edit4.Text:=MyINIFile.ReadString('basic','hpage','');
    edit5.Text :=MyINIFile.ReadString('basic','qq','');

    edit200.Text :=MyINIFile.ReadString('basic','profassion','只是感兴趣，没有其他目的。失误之处敬请诸位大侠赐教!');
    edit100.Text :=MyINIFile.ReadString('basic','copyright','本文原创于看雪技术论坛, 转载请注明作者并保持文章的完整, 谢谢!');

    //设置窗口位置及是否最大化
    windowstate:=MyINIFile.ReadInteger('window','state',Integer(Main_Form.WindowState) );
    if windowstate=2 then
      Main_Form.WindowState :=wsMaximized
    else
      begin
       Main_Form.Height :=MyINIFile.ReadInteger('window','height',Main_Form.height );
       Main_Form.Top:=MyINIFile.ReadInteger ('window','top',Main_Form.Top );
       Main_Form.Left :=MyINIFile.ReadInteger('window','left',Main_Form.left );
       Main_Form.Width :=MyINIFile.ReadInteger('window','width',Main_Form.width );
      end;
    p1hi:=MyINIFile.ReadInteger ('window','pa1height',main_form.panel1.Height );
    p2hi:=MyINIFile.ReadInteger ('window','pa2height',main_form.panel2.Height );
    if p1hi=0 then
       begin
       panel1.Height :=0;
       speedbutton2.Visible :=true;
       end;
    if p2hi=0 then
       begin
       panel2.Height :=0;
       speedbutton3.Visible :=true;
       end;


    MyINIFile.Destroy ;
    modify:=false;

    end
   else
    begin
     Savewinow;
    end;
end;

procedure TMain_Form.Button6Click(Sender: TObject);
var
fileini:string;
filemo1,filemo2:string;
begin

   OpenDialog1.Title :='打开临时保存的文件';
   OpenDialog1.InitialDir :=ExtractFilePath(Application.ExeName)+'tem';
   OpenDialog1.FileName:= Main_form.edit1.text+'.INI';
  // OpenDialog1.Execute ;
 If OpenDialog1.Execute then //打开‘打开对话框’
  begin

  //取出临时信息继续编辑
  fileini:=OpenDialog1.FileName;
  MyINIFile:=TINIFile.Create(fileini);
  edit1.Text:=MyINIFile.ReadString('basic','title','' );
  edit2.Text:=MyINIFile.ReadString('basic','author','' );
  edit3.Text:=MyINIFile.ReadString('basic','email','' );
  edit4.Text:=MyINIfile.ReadString('basic','hpage','' );
  edit5.Text:=MyINIfile.ReadString('basic','qq','' );

  edit6.Text:=MyINIfile.ReadString('basic','softname','' );
  edit7.Text:=MyINIfile.ReadString('basic','size','' );
  edit8.Text:=MyINIfile.ReadString('basic','down','' );
  edit9.Text:=MyINIfile.ReadString('basic','pack','' );
  edit10.Text:=MyINIfile.ReadString('basic','limit','' );
  edit11.Text:=MyINIfile.ReadString('basic','langue','' );
  edit12.Text:=MyINIfile.ReadString('basic','tools','' );
  edit13.Text:=MyINIfile.ReadString('basic','os','' );
  edit14.Text:=MyINIfile.ReadString('basic','softabout','' );   //软件简介

  edit200.Text:=MyINIfile.ReadString('basic','profassion','' );
  edit100.Text:=MyINIfile.ReadString('basic','copyright','' );
  MyINIFile.Destroy ;

   filemo1:=ReplaceSub(OpenDialog1.FileName, '.ini', '.da1');    //详细过程和总结
   filemo2:=ReplaceSub(OpenDialog1.FileName, '.ini', '.da2');    //总结
   //showmessage(filemo1+'::'+filemo2);
   try
   Memo1.Lines.LoadFromFile(filemo1);
   Memo2.Lines.LoadFromFile(filemo2);
   except
   application.MessageBox ('都保存好了吗，我怎么找不到呢？','出错了',0);
   end;
   modify:=false;
  end;
end;


procedure TMain_Form.Button7Click(Sender: TObject);
begin
   if edit1.Text <>'' then
      Main_Form.temsave
   else
     application.MessageBox('请先给文章加个标题吧','保存提示',0);
end;

procedure TMain_Form.Button3Click(Sender: TObject);
begin
//强出下位菜单
  PopupMenu1.Popup(Main_Form.Left +button3.left-10  ,panel1.Height+panel3.Height+panel2.Height+button3.Height);

end;

procedure TMain_Form.SpeedButton1Click(Sender: TObject);
begin
panel1.Height :=0;
speedbutton2.Visible :=true;
end;
 
procedure TMain_Form.SpeedButton2Click(Sender: TObject);
begin
panel1.Height :=p1heigh;
speedbutton1.Visible :=true;
speedbutton2.Visible :=False;
end;

procedure TMain_Form.SpeedButton3Click(Sender: TObject);
begin
panel2.Height :=p2heigh;
speedbutton4.Visible :=true;
speedbutton3.Visible :=False;
end;
procedure TMain_Form.SpeedButton4Click(Sender: TObject);
begin
panel2.Height :=0;
speedbutton3.Visible :=true;
end;

procedure TMain_Form.N1Click(Sender: TObject);
begin
memo1.Text:='';
memo2.Text:='';

edit1.Text :='';
edit2.Text :='';
edit3.Text :='';
edit4.Text :='';
edit5.Text :='';
edit6.Text :='';
edit7.Text :='';
edit8.Text :='';
edit9.Text :='';
edit10.Text :='';
edit11.Text :='';
edit12.Text :='';
edit13.Text :='';
edit14.Text :='';
edit100.Text :='';
edit200.Text :='';
end;

procedure TMain_Form.N2Click(Sender: TObject);
begin

edit6.Text :='';
edit7.Text :='';
edit8.Text :='';
edit9.Text :='';
edit10.Text :='';
edit11.Text :='';
edit12.Text :='';
edit13.Text :='';
edit14.Text :='';

end;

procedure TMain_Form.N3Click(Sender: TObject);
begin
memo1.Text:='';
memo2.Text:='';
end;

procedure TMain_Form.Edit1Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit2Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit3Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit4Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit5Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit6Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit8Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit10Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit12Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit14Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit7Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit9Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit11Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit13Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Edit200Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Memo1Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.Memo2Change(Sender: TObject);
begin
modify:=true;
saveed:=false;

end;

procedure TMain_Form.Edit100Change(Sender: TObject);
begin
modify:=true;
saveed:=false;
end;

procedure TMain_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Savewinow;
      Disablehide;//取消钩子
end;





end.
