unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrm_VP_SDK = class(TForm)
    Btn_GetVersion: TButton;
    LB_Version: TLabel;
    procedure Btn_GetVersionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_VP_SDK: TFrm_VP_SDK;

implementation
uses
  VP_License_Sdk;
{$R *.dfm}

procedure TFrm_VP_SDK.Btn_GetVersionClick(Sender: TObject);
const
  V_Standard_Edition =1;
  V_Ultimate_Edition =2;
var
  VersionLevel:DWORD;
begin
 {$I ..\..\..\SDK\Pascal\Vp_Sdk_Virtualize.inc}
 if VP_Sdk_IsRegister(VP_SDK_INDEX_ISREGISTER) then
 begin
    VersionLevel:= VP_Sdk_GetCustomDword(VP_SDK_INDEX_GETCUSTOMDWORD);
    
    case VersionLevel of
      V_Standard_Edition: 
      begin
        LB_Version.Caption:= 'This is Standard_Edition.';
        Exit;
      end;
      V_Ultimate_Edition: 
      begin
        LB_Version.Caption:= 'This is Ultimate_Edition.';
        Exit;
      end;
    end;    
 end else begin
   LB_Version.Caption:= 'This is Demo Version.';
 end;

end;

end.
