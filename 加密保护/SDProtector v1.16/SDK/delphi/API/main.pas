unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,sdprotector;

type
    TDemo = class(TForm)
    btnExit: TButton;
    btnGetExpDate: TButton;
    btnGetDayLeft: TButton;
    btnGetExecsLeft: TButton;
    btnGetKeyExpDate: TButton;
    btnGetRegName: TButton;
    btnIsRegistered: TButton;
    btnSetRegKey: TButton;
    btnGetHardwareID: TButton;
    btnClearRegInfo: TButton;
    btnRegister: TButton;
    btnDetectDebugger: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnRetrieveHardwareID: TButton;

    procedure btnExitClick(Sender: TObject);
    procedure btnGetExpDateClick(Sender: TObject);
    procedure btnGetExecsLeftClick(Sender: TObject);
    procedure btnGetDayLeftClick(Sender: TObject);
    procedure btnIsRegisteredClick(Sender: TObject);
    procedure btnGetRegNameClick(Sender: TObject);
    procedure btnGetKeyExpDateClick(Sender: TObject);
    procedure btnDetectDebuggerClick(Sender: TObject);
    procedure btnGetHardwareIDClick(Sender: TObject);
    procedure btnClearRegInfoClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnRetrieveHardwareIDClick(Sender: TObject);
   { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;
  szVolumeSerial:array[0..35]of char;
  szKey : Pointer;
implementation

{$R *.DFM}
{$I ..\include\keygen.inc}
// IMPORTANT : Don't forget to protect examples before
// test in order to see how these API work!

procedure TDemo.btnExitClick(Sender: TObject);
begin
Close();
end;


procedure TDemo.btnGetExpDateClick(Sender: TObject);
var ExpirationDate:SYSTEMTIME;
    MsgInfo:String;
    iResult:Integer;
begin
   if SDP_IsRegistered() = True then
      ShowMessage('This is a registered version')
   else
      begin
        iResult:=SDP_GetExpirationDate(@ExpirationDate);
        if iResult=1 then        //If succeeded
            begin
            MsgInfo:=format('This program will be expired on %4d,%02d,%02d',
                            [ExpirationDate.wYear,ExpirationDate.wMonth,ExpirationDate.wDay]);
            ShowMessage(MsgInfo);
            end
        else if  iResult=-1 then  //if expired
           ShowMessage('Sorry, you trial period has expired')
        else                     //if failed
           ShowMessage('Error in getting expiration date, you may not set trail option yet.');
      end;
end;

procedure TDemo.btnGetExecsLeftClick(Sender: TObject);
var dNumofExecs:LongWord;
    MsgInfo:String;
    iResult:Integer;
begin
     if SDP_IsRegistered() = True then
      ShowMessage('This is a registered version')
   else
      begin
        iResult:=SDP_GetNumOfExecutionsLeft(@dNumofExecs);
        if iResult=1 then        //If succeeded
            begin
            MsgInfo:=format('you have %d execution(s) left',[dNumofExecs]);
            ShowMessage(MsgInfo);
            end
        else if  iResult=-1 then  //if expired
           ShowMessage('Sorry, you trial period has expired')
        else                     //if failed
           ShowMessage('Error in getting number Of executions left, you may not set trail option yet.');
      end;
end;

procedure TDemo.btnGetDayLeftClick(Sender: TObject);
var dNumofDays:LongWord;
    MsgInfo:String;
    iResult:Integer;
begin
     if SDP_IsRegistered() = True then
      ShowMessage('This is a registered version')
   else
      begin
        iResult:=SDP_GetNumOfDaysLeft(@dNumofDays);
        if iResult=1 then        //If succeeded
            begin
            MsgInfo:=format('you have %d day(s) left',[dNumofDays]);
            ShowMessage(MsgInfo);
            end
        else if  iResult= -1 then  //if expired
           ShowMessage('Sorry, you trial period has expired')
        else                     //if failed
           ShowMessage('Error in getting number Of days left, you may not set trail option yet.');
      end;
end;

procedure TDemo.btnIsRegisteredClick(Sender: TObject);
begin
    if SDP_IsRegistered() = True then
      ShowMessage('This is a registered version')
    else
     ShowMessage('This is an unregistered version')

end;

procedure TDemo.btnGetRegNameClick(Sender: TObject);
var
    UserName : array[0..255] of Char;
    MsgInfo:String;
    iResult:Integer;
begin
     if SDP_IsRegistered() = False then
      ShowMessage('This is an unregistered version')
   else
      begin
        iResult:=SDP_GetRegistrationName(@UserName[0],256);
        if iResult>0 then        //If succeeded
            begin
            MsgInfo:=format('This copy is licensed to : %s ',[UserName]);
            ShowMessage(MsgInfo);
            end;
      end;
end;

procedure TDemo.btnGetKeyExpDateClick(Sender: TObject);
var ExpirationDate:SYSTEMTIME;
    MsgInfo:String;
    iResult:Integer;
begin
   if SDP_IsRegistered() = False then
      ShowMessage('This is an unregistered version')
   else
      begin
        iResult:=SDP_GetKeyExpirationDate(@ExpirationDate);
        if iResult>0 then        //If succeeded
            begin
            MsgInfo:=format('This license will be expired on %4d,%02d,%02d',
                            [ExpirationDate.wYear,ExpirationDate.wMonth,ExpirationDate.wDay]);
            ShowMessage(MsgInfo);
            end;
      end;

end;

procedure TDemo.btnDetectDebuggerClick(Sender: TObject);
begin
       SDP_DetectDebugger();
end;

//  This procedure will be called by SDProtector for
//  setting of hardware key
function   SDP_GetHardwareID:PChar;stdcall;
var
      dummy:DWORD;
      dVolSerialNum : Longword;
      Serial:String;
  begin
       dummy  :=0;
       GetVolumeInformation('c:\', nil, 0, @dVolSerialNum, dummy, dummy, nil, 0);
       Serial:=format('%x%d',[dVolSerialNum,dVolSerialNum]);
       FillChar(szVolumeSerial,36,0);
       CopyMemory(@szVolumeSerial[0], @Serial[1],Length(Serial));
       Result := @szVolumeSerial[0];
  end;
exports
   SDP_GetHardwareID;

procedure TDemo.btnGetHardwareIDClick(Sender: TObject);
begin
     MessageBox(Handle,SDP_GetHardwareID(),'Your hardware ID :',MB_OK);
end;

function  SDP_SetRegistrationKey: PChar;stdcall;
var
  FileName : String;
begin
  Result := '';
  try
    FileName := ExtractFilePath(ParamStr(0))+'key.txt';
    with TFileStream.Create(FileName, fmOpenRead) do
    try
      GetMem(szKey, Size+1);
      FillChar(szKey^, Size+1, 0);
      Read(szKey^,Size);
    finally
      Free;
    end;
    Result := szKey;
  except
  end;
end;
exports SDP_SetRegistrationKey;


procedure TDemo.btnClearRegInfoClick(Sender: TObject);
var
FileName : String;
begin
    FileName := ExtractFilePath(ParamStr(0))+'key.txt';
    DeleteFile(FileName);
end;

procedure TDemo.btnRegisterClick(Sender: TObject);
var
  Params   :  TKeyData;
  KeyString:  array[0..255] of byte;
  FileName :  String;
  UserName :  String;
  OrderID  :  String;
  err      :  String;
  Res      :  Integer;
  ExpirationTime : TSystemTime;
begin
   FillChar(Params,SizeOf(Params),0); // Important! It should be
                                      // initialized to zero;
   UserName:='SDProtector' ;
   OrderID := '000000-123456-0001';
   FillChar(ExpirationTime,SizeOf(ExpirationTime),0);
   GetSystemTime(ExpirationTime);

    ExpirationTime.wMonth:=ExpirationTime.wMonth+1;

 with Params do
   begin
    lpUserName   := @UserName[1];
    lpOrderID    := @OrderID[1];
    lpHardwareID := SDP_GetHardwareID();
    lpExpDate    := @ExpirationTime;

    Res := GenerateTextKey(Params,@KeyString[0],256);
    if Res = 0 then
      begin
        FileName := ExtractFilePath(ParamStr(0))+'key.txt';
        with TFileStream.Create(FileName, fmCreate) do
           try
              Write(KeyString,StrLen(@KeyString[0]));
            finally
           Free;
        end
      end
    else
      begin
        err :=format('Could not generate registration key! Error code : %d',[Res]);
        MessageBox(Handle,@err[1],'Error',0);
      end ;
   end;
end;

procedure TDemo.btnRetrieveHardwareIDClick(Sender: TObject);
var szHardwareID:array[0..41] of char;

begin
     fillchar(szHardwareID,42,#0);

   if SDP_RetrieveHardwareID(@szHardwareID[0],42) <> 0 then
      MessageBox(0,@szHardwareID[0],'Your hardware ID is:', MB_ICONINFORMATION)
   else
      MessageBox(0,'Can not get hardware id', 'Error', MB_ICONINFORMATION);

end;

end.
