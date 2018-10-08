unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, WinlicenseSDK;

const

LicenseHash = '8AjRb35h5YK28MEj2bTYZWrhI8UxO7mh2ts44krC6Jo332Cgvg061d72I02J15a4IW7NTNmz0Z33KkJUq3qaE7ZXqD5J2JPoU5Cl' +
              '3cU1Uiv78KdEn8NvKc9QIzU7cs2CoR29q54J9POvK2IPGcD3d∆{®êfffbfffb020100028180eceabfc0539f20b2ca23857bb' +
              '5e7b2f427c2350d821625f7de8c78aded53d46a112f76f2532e35fa1b8b87828d68ddaf9a35718de431d248add2796dd98f6' +
              '68050243a5aeeeaf28a968ecb606689a3800838ef769c27200bf7d6891c3704b97db524a0f619afce8135eaf27fab972afe1' +
              '95448be0a47018f95ff5c4be96511b1020301000102818008369b2f2fb6f48b3e36bd09ece47b6fbb712025b7bcccd42b02f' +
              '3ac13ee340ef9498bf61aac1f72ec418a111c95e619905f09f0c15878d1cc34dfc0cf2a0983982ee1fdffab1fe51cde31d42' +
              '8115192dae484820f295cc9a8b2449b97530c5dc1e2be0121c83e2e9ca8c3c5ef334b531ee2cb937a334a120d4ffd951f8f4' +
              '0010240f0136e62d7a8f40ae47c9a2047bf0feee7ffcca432afb673190dfd31bbaf61751965e29606a69d6d9cb2f1e9e20d5' +
              '750bf37a60a90923fb6c55b91d6a53e8d610240fca1adac2f7820b9c01ef57e1a919a4ed1df100d7dd034f99abc3b07c901f' +
              'f9ad56102722066f134a166d3a9487fa079b8fe9c95fabf17c7c1fcb43f80f416510241007658eddab5fb68ca91d646d850e' +
              '60401bec65fe835c05f0da0354032ab160ad2020232cfc8598c53c3a28714c7c5d1dc51572a781ccaabb3fad8682d4aea6a2' +
              '10240c259d77429a8aef477bad97dc40ed3b96377c9afb7649ffc8e6fd4b1ee8f9d068eb56cde43d32e29212a2c178570ba1' +
              '22aa1a5f133d0230948519291703157a10240804e65a0f43df4d57937dc9ba0be0081d7ea3028554e7babe9f2ed32fcb0e02' +
              '7956a5dab3aeafdfee5f607750142a3808501c1d6c8669d822e231c7870b16b26fffefffe02010002820101007fea18da599' +
              '12477667603301fca308dd5523a8954ca75e33b1ab163c9089b194f0c7347db202ffcfca8e6e21f7a6f96ca8ccb4105dda20' +
              '014311eb487e8a36ca9993058b14694fcf001e4677da6db73c78cbb42a91b0cd541d57fa795224bfbc215f6ff3ad1732ce51' +
              '583aea972f951396f1b97e49be38d10f559199c750e51840df803b6fcf605cf1f77165f33baa23ed056048dfa73b92634bf3' +
              'ebef98daccbc4b7d7b669c2ca8999da54e0944f4662635e46a3b1c5e9d00e8581da4b9b230417475af8daac3a3e9cce2cb2a' +
              'ecf028fd7df869440927eb67db396267af6723fdf73042b72e25049d69f537ef873e8c93159b64272c8361eee74dda2b1b84' +
              '90203010001028201000178c79c608fcd3ee38f721b9845a539535c68d3c40bde9f54af645de0d61cc9bf62f9364c45af5d4' +
              '4f5dddb9fdc72b632fc1549ec44a15988a1f18e2d4474eb209557b9bded7141114cccac76de94cd16aa21999061812c524c5' +
              'fdc054c31b3c5e726f260e8cd3288dec1ad80a1e0b5dcd1ca55d04e80c7cc2b87ba7f963ce9e5785114cd9bde693b9f6b61c' +
              'da9be811e026fd86ba278805c2560d997fbcf39029eb57d2acf4c9fe798d7617c5d38c35aa85fc455324af4a8bcb7441bb88' +
              '022430494daa8b7bcba4184e999a060ea4f4c6692528c228a372441a6e16ac2c3cda6beba8b31aab881792416a4c2fc16310' +
              '063262dd6920007dde654428d845e81028180f94b39ee579eb71bc4ea3e30422727ba996557546c95465c79086c51f76c03e' +
              '0e0235b04f9f55d1e3107b4fa24e98730b7e3777d4b87f8336c9f16ba0e250e5234b9419d234761bbda37f3c57a3ab148790' +
              '4c049b80f6b4e4f5817ba5319a99727c699fcbc639c782e05ae037c121ce8c751f1a123fe1bd7d900637fc9859ac90281808' +
              '35afc5f7824b4420849fafa13bb22103c5ec7b48f1ef9c42ba52a93e3d29f4109beb558308bb5576606445fde9b3fcbec074' +
              '17cb1179905ecb0caae2ba9aae60fba682544e2f1f51647a2323319d76e5cd663e6c139537fa62f068b8c4c1a536f5a3a87e' +
              'f6a5540233ae4d1beef46c8f30ff07e4f4dbdf936c819e92eac7181028180975920769f2370af9f4147382d3170614d37c56' +
              '92ff300a0abaa7d78d5e9f200d8931e734afdb7e6d885814e4c92aaccdd177037d55f5b447d31a8ae945fd2edfdac6b35677' +
              '1b2d84587aaabbda55c744f649f092281d9f7d51bfa6bd87fc00250d7b62d4682834043509770ee2660fec1e3f1fa8ecb7b4' +
              '3f42ed43984b3646102818100713669504b77af193e95acc7ff5b89875ed0fde4e479f92197d07a3b0edfc8bcc08e6b34405' +
              'b1987e37a415233c5b11dac27b0ccacc1bef4f94482dbccec264cb57f9f258812e621abfb3f936eb1b618fbd118379990342' +
              '44ff235fcee85e526c65189230239ae92620aef8ecbb6e5566b0ff0e29cad4fb04d03f8391f2e2781028181006570ff642c6' +
              'c22b5dd2a26b22dbb16e95e95365862a49f16c120f1b2728062d7c8cd32a01bc805f62bb6f827a72fea20f1cf0a00d149d62' +
              '008c99a0c0d2b117608da32ed245f616cb5d0efeb88472b70046435e3bd36b723109823c293aa360bba0c93a6d512350f82b' +
              'dc95efd4593989bb4e806146bdc45756ad508c44abd92';


type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    NameEdit: TEdit;
    OrgEdit: TEdit;
    HardIdEdit: TEdit;
    CustomEdit: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    NumDaysEdit: TEdit;
    NumExecEdit: TEdit;
    ExpDate: TDateTimePicker;
    EnableDateCheck: TCheckBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    FileNameEdit: TEdit;
    GenFileKey: TButton;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RegistryEdit: TEdit;
    Button2: TButton;
    Edit3: TEdit;
    RegValueEdit: TEdit;
    LicRegEdit: TEdit;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    GroupBox6: TGroupBox;
    Button4: TButton;
    SmartEdit: TEdit;
    TextKeyMemo: TMemo;
    procedure GenFileKeyClick(Sender: TObject);
    procedure EnableDateCheckClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
     { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.GenFileKeyClick(Sender: TObject);
var

  ExpDateSysTime: SYSTEMTIME;
  LicenseKeyBuff: ARRAY[0..1000] of char;
  SizeKey, mDays, mExec, i: integer;
  pName: PChar;
  pOrg: PChar;
  pCustom: PChar;
  pHardId: PChar;
  pExpDateSysTime: ^SYSTEMTIME;
  NumDays, NumExec: integer;
  KeyFile: FILE OF char;

begin

  if length(NameEdit.Text) = 0 then
    pName := nil
  else
    pName := PChar(NameEdit.Text);

  if length(OrgEdit.Text) = 0 then
    pOrg := nil
  else
    pOrg := PChar(OrgEdit.Text);

  if length(CustomEdit.Text) = 0 then
    pCustom := nil
  else
    pCustom := PChar(CustomEdit.Text);

  if length(HardIdEdit.Text) = 0 then
    pHardId := nil
  else
    pHardId := PChar(HardIdEdit.Text);

  if length(NumDaysEdit.Text) = 0 then
    NumDays := 0
  else
    NumDays := StrToInt(NumDaysEdit.Text);

  if length(NumExecEdit.Text) = 0 then
    NumExec := 0
  else
    NumExec := StrToInt(NumExecEdit.Text);

  if EnableDateCheck.Checked = False  then
    pExpDateSysTime := nil
  else
  begin
    DateTimeToSystemTime(ExpDate.Date, ExpDateSysTime);
    pExpDateSysTime := addr(ExpDateSysTime)
  end;

  SizeKey := WLGenLicenseFileKey(LicenseHash, pName, pOrg, pCustom, pHardId, NumDays, NumExec, pExpDateSysTime, 0, 0, 0, LicenseKeyBuff) ;

 // save generated key in user file

 AssignFile(KeyFile, FileNameEdit.Text);

 Rewrite(KeyFile);

 for i:= 0 TO SizeKey-1 DO
   Write(KeyFile, LicenseKeyBuff[i]);

 CloseFile(KeyFile);

  MessageBox(0, 'A License key file has been generated', 'License Key Generator SDK', MB_OK);

end;

procedure TForm1.EnableDateCheckClick(Sender: TObject);
begin

 if EnableDateCheck.State =  cbChecked  then
    ExpDate.Enabled := True
 else
    ExpDate.Enabled := False;


end;

procedure TForm1.Button3Click(Sender: TObject);

var

  ExpDateSysTime: SYSTEMTIME;
  LicenseKeyBuff: ARRAY[0..1000] of char;
  SizeKey, mDays, mExec, i: integer;
  pName: PChar;
  pOrg: PChar;
  pCustom: PChar;
  pHardId: PChar;
  pExpDateSysTime: ^SYSTEMTIME;
  NumDays, NumExec: integer;
  KeyFile: FILE OF char;

begin

  if length(NameEdit.Text) = 0 then
    pName := nil
  else
    pName := PChar(NameEdit.Text);

  if length(OrgEdit.Text) = 0 then
    pOrg := nil
  else
    pOrg := PChar(OrgEdit.Text);

  if length(CustomEdit.Text) = 0 then
    pCustom := nil
  else
    pCustom := PChar(CustomEdit.Text);

  if length(HardIdEdit.Text) = 0 then
    pHardId := nil
  else
    pHardId := PChar(HardIdEdit.Text);

  if length(NumDaysEdit.Text) = 0 then
    NumDays := 0
  else
    NumDays := StrToInt(NumDaysEdit.Text);

  if length(NumExecEdit.Text) = 0 then
    NumExec := 0
  else
    NumExec := StrToInt(NumExecEdit.Text);

  if EnableDateCheck.Checked = False  then
    pExpDateSysTime := nil
  else
  begin
    DateTimeToSystemTime(ExpDate.Date, ExpDateSysTime);
    pExpDateSysTime := addr(ExpDateSysTime)
  end;

  SizeKey := WLGenLicenseTextKey(LicenseHash, pName, pOrg, pCustom, pHardId, NumDays, NumExec, pExpDateSysTime, 0, 0, 0, LicenseKeyBuff) ;
  TextKeyMemo.Text := LicenseKeyBuff;

end;

procedure TForm1.Button4Click(Sender: TObject);
var

  ExpDateSysTime: SYSTEMTIME;
  LicenseKeyBuff: ARRAY[0..1000] of char;
  SizeKey, mDays, mExec, i: integer;
  pName: PChar;
  pOrg: PChar;
  pCustom: PChar;
  pHardId: PChar;
  pExpDateSysTime: ^SYSTEMTIME;
  NumDays, NumExec: integer;
  KeyFile: FILE OF char;

begin

  if length(NameEdit.Text) = 0 then
    pName := nil
  else
    pName := PChar(NameEdit.Text);

  if length(OrgEdit.Text) = 0 then
    pOrg := nil
  else
    pOrg := PChar(OrgEdit.Text);

  if length(CustomEdit.Text) = 0 then
    pCustom := nil
  else
    pCustom := PChar(CustomEdit.Text);

  if length(HardIdEdit.Text) = 0 then
    pHardId := nil
  else
    pHardId := PChar(HardIdEdit.Text);

  if length(NumDaysEdit.Text) = 0 then
    NumDays := 0
  else
    NumDays := StrToInt(NumDaysEdit.Text);

  if length(NumExecEdit.Text) = 0 then
    NumExec := 0
  else
    NumExec := StrToInt(NumExecEdit.Text);

  if EnableDateCheck.Checked = False  then
    pExpDateSysTime := nil
  else
  begin
    DateTimeToSystemTime(ExpDate.Date, ExpDateSysTime);
    pExpDateSysTime := addr(ExpDateSysTime)
  end;
                     
  SizeKey := WLGenLicenseSmartKey(LicenseHash, pName, pOrg, pCustom, pHardId, NumDays, NumExec, pExpDateSysTime, LicenseKeyBuff) ;
  SmartEdit.Text := LicenseKeyBuff;

end;

procedure TForm1.Button2Click(Sender: TObject);

var

  ExpDateSysTime: SYSTEMTIME;
  LicenseKeyBuff: ARRAY[0..4000] of char;
  SizeKey, mDays, mExec, i: integer;
  pName: PChar;
  pOrg: PChar;
  pCustom: PChar;
  pHardId: PChar;
  pExpDateSysTime: ^SYSTEMTIME;
  NumDays, NumExec: integer;
  KeyFile: FILE OF char;

begin

  if length(NameEdit.Text) = 0 then
    pName := nil
  else
    pName := PChar(NameEdit.Text);

  if length(OrgEdit.Text) = 0 then
    pOrg := nil
  else
    pOrg := PChar(OrgEdit.Text);

  if length(CustomEdit.Text) = 0 then
    pCustom := nil
  else
    pCustom := PChar(CustomEdit.Text);

  if length(HardIdEdit.Text) = 0 then
    pHardId := nil
  else
    pHardId := PChar(HardIdEdit.Text);

  if length(NumDaysEdit.Text) = 0 then
    NumDays := 0
  else
    NumDays := StrToInt(NumDaysEdit.Text);

  if length(NumExecEdit.Text) = 0 then
    NumExec := 0
  else
    NumExec := StrToInt(NumExecEdit.Text);

  if EnableDateCheck.Checked = False  then
    pExpDateSysTime := nil
  else
  begin
    DateTimeToSystemTime(ExpDate.Date, ExpDateSysTime);
    pExpDateSysTime := addr(ExpDateSysTime)
  end;

  SizeKey := WLGenLicenseRegistryKey(LicenseHash, pName, pOrg, pCustom, pHardId, NumDays, NumExec, pExpDateSysTime, 0, 0, 0, PChar('HKEY_LOCAL_MACHINE\' + RegistryEdit.Text), PChar(RegValueEdit.Text), LicenseKeyBuff) ;

 // save generated key in user file

 AssignFile(KeyFile, LicRegEdit.Text);

 Rewrite(KeyFile);

 for i:= 0 TO SizeKey-1 DO
   Write(KeyFile, LicenseKeyBuff[i]);

 CloseFile(KeyFile);

  MessageBox(0, 'A License key file has been generated', 'License Key Generator SDK', MB_OK);

end;

end.
