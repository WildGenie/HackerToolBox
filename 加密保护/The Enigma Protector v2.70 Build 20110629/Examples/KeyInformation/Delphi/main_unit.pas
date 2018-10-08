unit main_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    eName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    mKey: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses enigma_ide, DateUtils;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  ki : TKeyInformation;
  res : string;
  i : integer;
begin
  if EP_RegKeyInformation(PAnsiChar(eName.Text), PAnsiChar(mKey.Text), ki) then
  begin
    res := format(#13#10'Creation date: %s', [DateToStr(EncodeDate(ki.CreationYear, ki.CreationMonth, ki.CreationDay))]);
    if ki.UseKeyExpiration then
    begin
      res := res + format(#13#10'Expiration date: %s', [DateToStr(EncodeDate(ki.ExpirationYear, ki.ExpirationMonth, ki.ExpirationDay))]);
    end;
    if ki.UseHardwareLocking then
    begin
      res := res + #13#10'Key is Hardware Locked';
    end;
    if ki.UseExecutionsLimit then
    begin
      res := res + format(#13#10'Executions number: %d', [ki.ExecutionsCount]);
    end;
    if ki.UseDaysLimit then
    begin
      res := res + format(#13#10'Days number: %d', [ki.DaysCount]);
    end;
    if ki.UseRunTimeLimit then
    begin
      res := res + format(#13#10'Run-time minutes: %d', [ki.RunTimeMinutes]);
    end;
    if ki.UseGlobalTimeLimit then
    begin
      res := res + format(#13#10'Global time minutes: %d', [ki.GlobalTimeMinutes]);
    end;
    if ki.UseCountyLimit then
    begin
      for i := 0 to length(KEY_COUNTRIES) - 1 do
      begin
        if KEY_COUNTRIES[i].Code = ki.CountryCode then
        begin
          res := res + format(#13#10'Country lock: %s', [KEY_COUNTRIES[i].Name]);
          break;
        end;
      end;
    end;
    if ki.UseRegisterAfter then
    begin
      res := res + format(#13#10'Register After date: %s', [DateToStr(EncodeDate(ki.RegisterAfterYear, ki.RegisterAfterMonth, ki.RegisterAfterDay))]);
    end;
    if ki.UseRegisterBefore then
    begin
      res := res + format(#13#10'Register Before date: %s', [DateToStr(EncodeDate(ki.RegisterBeforeYear, ki.RegisterBeforeMonth, ki.RegisterBeforeDay))]);
    end;
    for i := 1 to length(ki.EncryptedSections) do
    begin
      if ki.EncryptedSections[i] then
      begin
        res := res + format(#13#10'Decrypts section #%d', [i]);
      end;
    end;
    MessageDlg('Registration Information is valid and contains the following information:' + res, mtInformation, [mbOK], 0);
  end else
    MessageDlg('Registration Information is invalid', mtError, [mbOK], 0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
