unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    E_HardId: TEdit;
    E_UserName: TEdit;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses VP_License_Sdk;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  {$I ..\..\..\SDK\Pascal\Vp_Sdk_Virtualize.inc}  
  if VP_Sdk_IsRegister(VP_SDK_INDEX_ISREGISTER) then
  begin
    ShowMessage('Thx For Your Register');
  end else begin
    ShowMessage('This is A Demo Version'); 
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  PHardId:PAnsiChar;
  HardIdLen:DWORD;
begin
  {$I ..\..\..\SDK\Pascal\Vp_Sdk_Virtualize.inc}  
  GetMem(PHardId,256);
  ZeroMemory(PHardId,256);
  
  HardIdLen:=VP_Sdk_GetHardWareIdA(VP_SDK_INDEX_GETHARDWAREIDA,PHardId); 
  if 0<>HardIdLen then
  begin 
    E_HardId.Text:=PHardId;
  end;
  
  FreeMem(PHardId,256);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  PUserName:PAnsiChar;
  UserNameLen:DWORD;
begin
  {$I ..\..\..\SDK\Pascal\Vp_Sdk_Virtualize.inc}  
  if VP_Sdk_IsRegister then
  begin
    GetMem(PUserName,256);
    ZeroMemory(PUserName,256);
    UserNameLen:=VP_Sdk_GetUserNameA(VP_SDK_INDEX_GETUSERNAMEA,PUserName);
    if 0<>UserNameLen then
    begin
      E_UserName.Text:=PUserName;
    end;
    FreeMem(PUserName,256);
  end else begin
    ShowMessage('This is A Demo Version'); 
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if VP_Sdk_IsRegister(VP_SDK_INDEX_ISREGISTER) then
  begin
    {$I ..\..\..\SDK\Pascal\Vp_Sdk_RegDeCode_Sta.inc}      
    ShowMessage('Reg DeCode Modal A');
    {$I ..\..\..\SDK\Pascal\Vp_Sdk_RegDeCode_End.inc} 
  end else begin
    ShowMessage('Run In Demo Version'); 
  end;

  {$I ..\..\..\SDK\Pascal\Vp_Sdk_RegDeCode_Sta.inc}      
    ShowMessage('Reg DeCode Modal B');
  {$I ..\..\..\SDK\Pascal\Vp_Sdk_RegDeCode_End.inc} 
  
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  {$I ..\..\..\SDK\Pascal\Vp_Sdk_Mutation.inc}   
    ShowMessage('Run In Mutation');
end;

end.
