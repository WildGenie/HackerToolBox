unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eHardwareID: TEdit;
    mRegKey: TMemo;
    btnGenerateTextKey: TButton;
    Button3: TButton;
    SaveDialog: TSaveDialog;
    btnGenerateKeyFile: TButton;
    btnCheckKey: TButton;
    eUserName: TEdit;
    Label4: TLabel;
    eOrderID: TEdit;
    cWrapStrings: TCheckBox;
    cExpirationDate: TCheckBox;
    eExpirationVersion: TEdit;
    dtExpirationDate: TDateTimePicker;
    Label5: TLabel;
    procedure btnGenerateTextKeyClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cExpirationDateClick(Sender: TObject);
    procedure cWrapStringsClick(Sender: TObject);
    procedure btnGenerateKeyFileClick(Sender: TObject);
    procedure btnCheckKeyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

{$I ..\include\keygen.inc}

procedure TfrmMain.btnGenerateTextKeyClick(Sender: TObject);
var
  Params  : TKeyData;
  RegData : String;
  KeyString : array[0..255] of byte;
  Res     : Integer;
  Key     : String;
  sExpTime : SYSTEMTIME;
  err:String;
begin
   if Length(eUserName.Text)= 0 then
     begin
      MessageBox(Handle,'User name is empty!','Error',0);
      exit;
     end;
   if  Length(eOrderID.Text)= 0 then
     begin
      MessageBox(Handle,'Order ID is empty!','Error',0);
      exit;
     end;

  FillChar(Params,SizeOf(Params),0); // Important! It should be
                                     // initialized to zero;
  with Params do
  begin
    lpUserName        := PChar(Trim(eUserName.Text));
    lpOrderID         := PChar(Trim(eOrderID.Text));

    if Length(eHardwareID.Text)        <> 0 then
     lpHardwareID      := PChar(Trim(eHardwareID.Text));
    if Length(eExpirationVersion.Text) <> 0 then
     lpExpVersion :=  PChar(Trim(eExpirationVersion.Text));

    if cExpirationDate.Checked  = True then
       begin
         DateTimeToSystemTime(dtExpirationDate.DateTime,sExpTime);
         lpExpDate:=@sExpTime;
       end;
    Res := GenerateTextKey( Params,@KeyString[0],256);

    if Res = 0 then
     begin
      SetLength(Key,StrLen(@KeyString[0]) );
      CopyMemory(@Key[1],@KeyString[0], StrLen(@KeyString[0]));
      mRegKey.Text := Key;
     end
    else
     begin
      err :=format('Could not generate registration key! Error code : %d',[Res]);
      MessageBox(Handle,@err[1],'Error',0);
     end ;
  end;
end;

procedure TfrmMain.btnGenerateKeyFileClick(Sender: TObject);
var
  Params  : TKeyData;
  RegData : String;
  KeyString : array[0..255] of byte;
  Res     : Integer;
  Key     : String;
  sExpTime : SYSTEMTIME;
  err:String;

begin
   if Length(eUserName.Text)= 0 then
     begin
      MessageBox(Handle,'User name is empty!','Error',0);
      exit;
     end;
   if  Length(eOrderID.Text)= 0 then
     begin
      MessageBox(Handle,'Order ID is empty!','Error',0);
      exit;
     end;

  FillChar(Params,SizeOf(Params),0);   // Important! It should be
                                       // initialized to zero;
  with Params do
  begin
    lpUserName        := PChar(Trim(eUserName.Text));
    lpOrderID         := PChar(Trim(eOrderID.Text));

    if Length(eHardwareID.Text)        <> 0 then
       lpHardwareID := PChar(Trim(eHardwareID.Text));
    if Length(eExpirationVersion.Text) <> 0 then
       lpExpVersion  := PChar(Trim(eExpirationVersion.Text));

    if cExpirationDate.Checked  = True then
       begin
         DateTimeToSystemTime(dtExpirationDate.DateTime,sExpTime);
         lpExpDate:=@sExpTime;
       end;
    SaveDialog.InitialDir := ExtractFilePath(ParamStr(0));
    if SaveDialog.Execute then
     begin
       Res := GenerateKeyFile( Params,PChar(SaveDialog.FileName));
       if Res = 0 then
        begin
          SetLength(Key,StrLen(@KeyString[0]) );
          CopyMemory(@Key[1],@KeyString[0], StrLen(@KeyString[0]));
          mRegKey.Text := Key;
        end
       else
        begin
          err :=format('Could not generate registration key! Error code : %d',[Res]);
          MessageBox(Handle,@err[1],'Error',0);
        end ;
    end;
  end;
end;
procedure TfrmMain.btnCheckKeyClick(Sender: TObject);
var
  Params  : TKeyData;
  RegData : String;
  KeyString : array[0..255] of byte;
  Res     : Integer;
  Key     : String;
  sExpTime : SYSTEMTIME;
  sMessage:String;

begin
   if Length(mRegKey.Text)= 0 then
     begin
      MessageBox(Handle,'Registration code is empty!','Error',0);
      exit;
     end;

  FillChar(Params,SizeOf(Params),0);   // Important! It should be
                                       // initialized to zero;
  with Params do
  begin
    if Length(eUserName.Text)<> 0 then
       lpUserName := PChar(Trim(eUserName.Text));
    if  Length(eOrderID.Text)<> 0 then
       lpOrderID  := PChar(Trim(eOrderID.Text));
    if Length(eHardwareID.Text) <> 0 then
       lpHardwareID := PChar(Trim(eHardwareID.Text));
    Key := mRegKey.Text;
    Res := VerifyTextKey( Params,@Key[1]);
       if Res = 1 then MessageBox(Handle,'Valid Key!','Error',0)
       else
           MessageBox(Handle,'Invalid Key!','Error',0);



  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if cExpirationDate.Checked  = True then dtExpirationDate.Enabled:=True
  else
      dtExpirationDate.Enabled:=False;
   cWrapStrings.Checked:=True;
end;

procedure TfrmMain.cExpirationDateClick(Sender: TObject);
begin
      if cExpirationDate.Checked  = True then dtExpirationDate.Enabled:=True
      else
              dtExpirationDate.Enabled:=False;
end;

procedure TfrmMain.cWrapStringsClick(Sender: TObject);
begin
      if cWrapStrings.Checked  = True then
          mRegKey.WordWrap:=True
      else
          mRegKey.WordWrap:=False;
end;


end.
