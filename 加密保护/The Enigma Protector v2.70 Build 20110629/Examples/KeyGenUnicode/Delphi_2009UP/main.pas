unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DateUtils;

type
  TfrmMain = class(TForm)
    bClose: TButton;
    lbUserInfo: TLabel;
    eUserInfo: TEdit;
    eHardware: TEdit;
    cbExpirationDate: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    cbHardwareID: TCheckBox;
    gbSections: TGroupBox;
    cbSection1: TCheckBox;
    cbSection2: TCheckBox;
    cbSection3: TCheckBox;
    cbSection4: TCheckBox;
    cbSection5: TCheckBox;
    cbSection6: TCheckBox;
    cbSection7: TCheckBox;
    cbSection8: TCheckBox;
    cbSection9: TCheckBox;
    cbSection10: TCheckBox;
    cbSection11: TCheckBox;
    cbSection12: TCheckBox;
    cbSection13: TCheckBox;
    cbSection14: TCheckBox;
    cbSection15: TCheckBox;
    cbSection16: TCheckBox;
    bGen: TButton;
    bGenFP: TButton;
    mKey: TMemo;
    cbHyphens : TCheckBox;
    cbKeyMode : TComboBox;
    cbKeyBase : TComboBox;
    GroupBox1: TGroupBox;
    btnVerify: TButton;
    btnVerifyP: TButton;
    GroupBox2: TGroupBox;
    cbRegisterAfter: TCheckBox;
    dtpRegisterAfter: TDateTimePicker;
    cbRegisterBefore: TCheckBox;
    dtpRegisterBefore: TDateTimePicker;
    cbExecutions: TCheckBox;
    cbDays: TCheckBox;
    cbRuntime: TCheckBox;
    cbGlobalTime: TCheckBox;
    eExecutions: TEdit;
    udExecutions: TUpDown;
    eDays: TEdit;
    udDays: TUpDown;
    eRuntime: TEdit;
    udRuntime: TUpDown;
    eGlobalTime: TEdit;
    udGlobalTime: TUpDown;
    cbCountry: TCheckBox;
    comCountries: TComboBox;
    procedure bCloseClick(Sender: TObject);
    procedure cbHardwareIDClick(Sender: TObject);
    procedure cbExpirationDateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bGenClick(Sender: TObject);
    procedure bGenFPClick(Sender: TObject);
    procedure btnVerifyClick(Sender: TObject);
    procedure btnVerifyPClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbRegisterAfterClick(Sender: TObject);
    procedure cbRegisterBeforeClick(Sender: TObject);
    procedure cbExecutionsClick(Sender: TObject);
    procedure cbDaysClick(Sender: TObject);
    procedure cbRuntimeClick(Sender: TObject);
    procedure cbGlobalTimeClick(Sender: TObject);
    procedure cbCountryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses enigma_keygen_ide;

{$R *.dfm}

procedure TfrmMain.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.cbHardwareIDClick(Sender: TObject);
begin
  eHardware.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmMain.cbExpirationDateClick(Sender: TObject);
begin
  DateTimePicker1.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  cbHardwareID.OnClick(cbHardwareID);
  cbExpirationDate.OnClick(cbExpirationDate);
  cbRegisterAfter.OnClick(cbRegisterAfter);
  cbRegisterBefore.OnClick(cbRegisterBefore);
  cbCountry.OnClick(cbCountry);
  cbExecutions.OnClick(cbExecutions);
  cbDays.OnClick(cbDays);
  cbRuntime.OnClick(cbRuntime);
  cbGlobalTime.OnClick(cbGlobalTime);
end;

procedure TfrmMain.bGenClick(Sender: TObject);
var
  kg : TKeyGenParamsW;
  KeyBuffer : array [0..2047] of widechar;
  dwResult : dword;
begin
  mKey.Clear;

  if eUserInfo.Text = '' then
  begin
    ShowMessage('User info field is empty!');
    Exit;
  end;

  ZeroMemory(@kg, SizeOf(kg));
  // Key mode
  kg.KeyMode := cbKeyMode.ItemIndex;
  // Key base
  kg.KeyBase := cbKeyBase.ItemIndex;
  // Hyphens
  kg.KeyWithHyphens := cbHyphens.Checked;
  case kg.KeyMode of
    RM_512:
    begin
      kg.PublicKey  := '0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC' +
                       'P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC' +
                       'WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH' +
                       'CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8' +
                       'HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP' +
                       'SRGDQ742B4742XF4MACRR747YDP5FZZ9D';
      kg.PrivateKey := '00C98B2SF9UBJA605AJX53GJFXJV8UH4A6PY2L6CV4MAMV7V3ERRVY99Y' +
                       '72V2P77Z2J3KBPGWR3WXKG5GF9Z6CKXJHY5VUMBTQ66H2MRZPCU00DLFJ' +
                       '675JTTTNEK00DLFJ675JTTTNEK';
    end;
    RM_768:
    begin
      kg.PublicKey  := '0201B810DA4A1ADD4351378790A9813853309AEHRR66KMK99UEPX8C54WQFDZQ5Y96WUCVZYMXBC32SJV7T5SBPR54E' +
                       '2DBH8UD9RNHTJ9BLJV6NHX52W7PZDDTTJDDGF3YFVL7PJFL8RS8THTFDF' +
                       '4RY7K3QXLTMXMC8DDSRVRWBVMMP3UYKCDDC7KGL9PG509ACPTRQ4MMUKG' +
                       'DAUJFFFGSCBFLYK9X9E74M58PW5FG9B9RTLXJQ4STPVCHJTEH8BP557VZ' +
                       'PQYDBUZJXXJNGVZELFL4UL3LHHE8A645CK593DVWCQBSX4ZCCQ3ST8GCZ' +
                       'LW2729XK3NT7GST3LMQGXSHLDWCXE09AENVX2QTX3VLT6FWB4JND875XZ' +
                       'WQ26GW76TV3KVVHK7U489LLPBQ39HUWKMA65U3HKWBDHKBZEB525PHEH2' +
                       'YQHRZGNJAAYZXMWN8RNZ9T7VMZAJMP2V3S9NXZ9RHL96F7AT3NTMN36V4' +
                       'ACSFEN4DR6TJR95';
      kg.PrivateKey := '019VRB95TKY456YC48LBS9FK34YN080VVPDJPPKU6XA9EPLX7HTVN3VST' +
                       'TNJZFPH4HQAFY58R593KFKSNZ7WEZBA9AZ6PGN735EWEFUAEM3G8XVUFN' +
                       'L2ZFRPXA4V8KVXE4M8GACUJAT7H3TTWZT9ZDE43ZF46HC01AHFR85MVR2' +
                       'UP7K3N53M8MTNWBUP01AHFR85MVR2UP7K3N53M8MTNWBUP';
    end;
    RM_1024:
    begin
      kg.PublicKey  := '0201B810DA4A1ADD4351378790A981385330CDG9YQSEUK2HT546KWW46NHSCHMD2TNCSPVNSKGQC6CHDUSU9CC4LDPL' +
                       'TD3NLRVD3TFV9BU2SYBUBU9TXKLQ3CTKZE5GN9VFG37R9YNK2FE58K7ZY' +
                       'WTUJYFSJTBMDLLGA9GJ2LJXGHSS9CESGC2K69H65YQGAC7CRGF5T3CPLA' +
                       '5BDJZKVCUWPZRNA2DN7L956LZVZBQUDPX6PF30CDBH26Z82VE4QQ8N85L' +
                       'QHYJYYCJ6WQ89H9K9VVQX925SG5FJ79AGVZB6M8TTFKCJ56FAREP8GSTC' +
                       'NKWCXEALDP9Y2ZLS9QKZV8JRNDHG9D8BRDSCTMDQK9NLAPZ9TGYFS9G7U' +
                       'LXHYJF7F9A89HPXGTU2N4FQQJL98WZ5QND2KTEMMUUZFAX953HCGNSWUW' +
                       'U2M7LBEWZSH9GW5SC0CDJDY2HC4HJYUSVTAVXZ7MYVJWF3CU9WC3SVPSL' +
                       '29WF46DVS2SYKSSAMATPPYGJDE3PBFMGS34CXWQSXKCEAE63L2EXTS9NE' +
                       '2G597XASY3S34XMYST5YZF4THUTYT5DY9UKKXU6PH8MLXRPZMPMMR83JU' +
                       'X2WGNEW8ZGL4SKUCUB8CEAB6UZ4FB66WTP3B64VMX7XG75T4Y35479';
      kg.PrivateKey := '020MLJ7XTRVLBDNUVMKGUFHCU8XBGMHHVRA0ADSHPBC7NVSZ82AM867XC' +
                       'BELNKMR7CZ56C4SW8KKRD9WZLE5X992GZVSZXS5J6JG9SLDW3Y696TU4D' +
                       'QZP778LVFKVRKANQD6FUGN2ACWUJM9ZK6ME7WXWDZ88LTWHME52RKUDKX' +
                       'STT7RGWP7HFUJDGWEUG4ZHQ25DCQJ644CLEXRR3G020SAAREJB4WXZ4H2' +
                       'JEH4AB4U8FGFTA4CAF020SAAREJB4WXZ4H2JEH4AB4U8FGFTA4CAF';
    end;
    RM_2048:
    begin
      kg.PublicKey  := '0201B810DA4A1ADD4351378790A98138533199H9KZC4CQ5ZKPEGYDW2EHN5AKZA5G5KP4HU8USWJR8XWW7MCH7244RV' +
                       'PSXFHVU6YQRK4LPUHM497XJYPLLA3DHUZWXK3CB5SUYF75NPYLTNPRUAP' +
                       'CTVDHAKYWTRQ97HES2E59WDN2LJKFYA2K8BGFSBHP4A6BF5FSDTS8NWLL' +
                       'C5NEQ76NJ9BAMWXG55UPFFMRQZTU5KV2G6LSPQUJJWA9U4LJ5SCJ9M9ZQ' +
                       'Z6K7LZA9UAMJ533UQ5J3JPNQAUWJGZFRFCTGAGSBWPWRRF9HRGF9MCX55' +
                       'QRYGPYMRE6DBJ65SJDX34FVPYWWKWQ48MCKXYXPHQ23BJ42U8ZMDD8CG5' +
                       'DPHZQ5XTXUKA277XK6PKSTLJ88ZZ9EBXH62REMRZZRGNPKHYM34RW722S' +
                       'SZHMPFKY7X8UZ19ADGX3UQ7X444XH7MZXEZYW2YLFHR8YL3PTCXVSYX89' +
                       'ZXN7KW2XNBE8XS3TQRGZVF6KA5USH56NEZYH5RNWBBPVE9LD6H42RQWR5' +
                       'YVQMT5EQYQTK6YM9V8DA5BJCLGGZ2UGD6NPA2X3SNUS47F7HJBNBCWHRA' +
                       'YPPCQ5HWCJNPDHUDQMRN2P6PWJFWJ6CLVNK8HXEFLE4ENPXAFN89CRS43' +
                       'RUMVGDJQCSRB535XYCS6BZYLA9Q6HJV425F26XXHRGA7C8R8BVMELAPEH' +
                       '5DSA9KXTCV4H2RNVDFHG3YJSERZVFPWHYA823LUBENBL5U3J4LJX2KQLW' +
                       'L5XGGESPSE2FQWKSQ4NUCDLBEJPQAT2A2477DYS2XEXKLYEAKUN22622C' +
                       'RLBCAHPFNEV2FJ2H8N3JQGXJRGP19AFHGRW6SS2ZSFYK8EZAPVYL4MCP4' +
                       '6UMR64Y9T89FHWEPXBRHKWJCSNNNGPU984J5XW4BWTU6PDWPN24W8RU55' +
                       'A9C3U9H7VHS5PFURASHBT4JAEE5ZKJBSYMCMDVBLU973R72RVPA6U96A2' +
                       'LX8HMASVST9RVJ7W66V4DYWRDZZQ3673W7C7LVF68TWPLNMYEUQ8FDZRN' +
                       'P38D9BX5YA3VENETDUUUMR9U7FFP4NZM7G4Y6J6EASK5SAXXTRMZ8F3AH' +
                       '5FC54E543N739BY5KVZQM7JZWD2P2HPE7BDRMM9JFCGPBWWASTZ7UDNRV' +
                       '6AFHVMBR9AGAERE9M6W6S2ZT8PBTABPDCKBPPPV6QW9DRXZUGAHDDRRSY' +
                       'XM4YXQ2QJX6CL33N7RV8846LK8A3DFLDXWZ2NKF8V';
      kg.PrivateKey := '02DB825DUDFYHA88AG49NMM742HCQEJDKQQGDR6G3GL7MCED16DU9KTVE' +
                       '47XQ3M92FFKX8FU9ZXT7AK7VTGGJSYQERCZBR8J2DE2CFE3VUU4W7JEQJ' +
                       'L49HDUXBW7SNPCV8MHXM7EQHYPQK3GSPQYV5VWESQE4AYWFZHXN2UX7Z3' +
                       'T3CV52XURB3YFKLUCY6CJTRACRVVDD568F6F28U74ABWCZ2ZMC32E83V3' +
                       '4JZZPDBF3KEYQWREETGKQT6NANCMAD4XDEXW5LCYBJ3GMDJBM3E7FNK98' +
                       '7JEUYEV7QNKGKNTDVMRG3G5L8NC9CNHQS8AVDMDBEGCG3DHGJUGPG2244' +
                       '2C9LCD8FJ2LSDMQXLHCGCLP7ZSYQT2UJ4QFGU2CH3BTT3UADZMQSBAV33' +
                       'B3Z2Y8Y8RRD9J754G02DJ372LR8APP7HXKB2GNPHP6T65C3RR48Q8BHGP' +
                       'KEZ6PX2D02DJ372LR8APP7HXKB2GNPHP6T65C3RR48Q8BHGPKEZ6PX2D';
    end;
    RM_3072:
    begin
      kg.PublicKey  := '0201B810DA4A1ADD4351378790A98138533267BJBN6W8SY33Y47RWJHWS385XWRV9TSVSB5EM7ECZYNSJ44ZKSD8KV4' +
                       '6Y9T6TNC6QMDW4V6DBMADU3YUKLP88TCLEUD9FTEUHGXM6T57AQ2EMB59' +
                       'UPQVNSUT7Z4EHAMDQ6N77VK2A6P847MMWJH9E7C5XX6FNF6MHGWERPWQV' +
                       '9ZLVR9Z7X5D5Z2XQL6MBM7BDCT2DEDVRBFNDDBLG6LHZ9APM48LS5TKTJ' +
                       'AGDYFDRVHEGTDH47PCLL8YJ4ZAWCB59F8BN5PZL3NQACP32G3YNBX5E3J' +
                       '7S28XLRGAX55ZML5XE6Q68EUAL38VUBJ2MZ2UGCCHM7CE6S99N44X9RMV' +
                       '7B55HULJ4KHPFYSBDUSPQTCWGS76BEQST2QCZDZ2T4FBA4YUJFF47AACE' +
                       'A4EEFESEYWN48UZCSDZAMGSU5VB9UJKR2XQUSDFS3TNG9QKURQWS7N5Q3' +
                       'VPYT4QAGGQ5GW2MMXHDJYW55FQPHSS255GVJ7WLLP85JHS8K6DVTJWB4W' +
                       '4Y8ZEFF7KP6W74PAA8FVPZVDW4RKGMQ8V56Q6R4V34XFE5HR4FZS8GZ6R' +
                       '36RKW6WN34S2AHR9LCGF8LULB7ZN6NC2AA5RPDZYGWSPPME6267CGLZCP' +
                       'GG98W557RXCDWAETJHDCRPUXX7AD3E8SL9WMGBV9QFHMSV9UFV7H9NTX3' +
                       'QYV95CN9P9DSYQWL35R2BWB4GKW6CTWVB2X6WH3P2WFBE6X55KBLAMDB3' +
                       'SRDSDVY37GKH78MUHY7KDJDC8SJU5FUQRYZ49ULX3YSZL7E284GFVZSGD' +
                       'FTTQNR6VMBM3LLR78SUSVMJW88XT2K4UHEATRU3V9MMR2VGNGCY9S6R7M' +
                       '4ELNPEBBMQP2HVPLY5M5VPA92V7NU8ZZ58YYTW5QK9USZ5LV59UZGB2CF' +
                       'DPZ6HFYU5WB7UU3UYWVNSNKM3W7GBYKJP8TMFW2YN6GNSSE4ZKFVZRLUT' +
                       '8QPZBBEQT5H9H5Z53D7QV4AJTKTX4EMW62TDWXQVK24JZPSG2VXKCMYZL' +
                       'BUASE25R3EEK9KBLJ8VX83ZXGTBL5CCDBY33HJ6FKX8AW3WPRX3XTCS9G' +
                       '2B9SVK2XFFKNSPGFG6FZNS8P2HERFGFL79DKUZZFWHFH4H9UZ7F7F6W3Z' +
                       'WN84JRRA7SU8T89EQMRBEPVYMMGLGSUMFWWMEDLJM5EGP5WEX9LDUAQXS' +
                       '55LKDQVRKX4R8NNBHSYBHSNMFYA2C6KGQQFK3TN267DPSZT3PTKHTLNMU' +
                       'V2YYZZRX3953LPWAKYF8LJUVMEQT3ZC4F9SWMYGUHG6XX66PJFQWSRUW2' +
                       'C79YLGZ6ZAFS7HLXBTH55UD3EGFBZQ5CLNJDZTEJACDVBCM5FQBTX4DKK' +
                       'UDGNSMWWLC5UMQRHW89CTU5636WYDXVZZDAUZ529458LDN2DAR9QADWRZ' +
                       'UTU8MCKN8ACH3R36YKE52DDF67SM5UDUH7PTATHXE65UCGFRCV49UTF29' +
                       'BGDSUWGRMC839HUZYQVAG985YUF5KJCAVGKRD8E4YMPJ38KR6HD2KHDGY' +
                       'PJDMJMN4Y3DTJW5MYX3VUPF32637LMAWFM4QCU7BMP74SCF4N5QXZZVBE' +
                       'LAQMPYMJC2ZWJ9XFV33YXTTPH3SG9KMUABLL83P7L3UBVM763XJPR5UEH' +
                       'DZ73XJUGR9QP6299K5PU46XGVWKWFAKWYMRXUSLCFJ3WQTEC6QJH6E5V8' +
                       'X2RMA5TXGSBEWLGSMNQ2SH6G9MLKK4S486DN4M4QVDTYTM4JQETAJQGP7' +
                       '6NUR4UNDXR4W4JQSNWDTUGX69SEDC3AL8ZF4TJBQQRXSX2A86UUWCDCFH' +
                       'JE94A8EP3Q6A2QTYKEE62MV4VJB2AB';
      kg.PrivateKey := '04DMQBFL5GKK4RXWEZYPEY8QB5GHBBGW3EY766DFF2Q6PLFLR4SSRWXBN' +
                       'W5CFGFC84UJ8PKRDQQYWN9921AH8AGZAQRWJYZ7C3QUJJCJAAGGT5P5GG' +
                       'LY6K5W4JZJDW7Y8EWS6SSYCS2MCR93MY9DG6VXLBRYVZWDX6XNFU286HM' +
                       'AM9E82KJVZNYGC8RXRW43SFFWDLR8C96R58A42F3TGLXPVWLGMNPPAWS4' +
                       'S2SSMNQLUPBAQMP7AUKAGV5CKL342W6UKQY3TUPXKGFXFES725PEX93UX' +
                       'X4K8JRY3MPQ5S94VNPBXQ5N6LDBLWB67LBLDCGNQS3JEKW667UF8LA8Q6' +
                       'B3AF4XGZKYB7BVVHF49DJUHSFJZRD63S4GMMAPQ8Q87HKN9G3J3575JEL' +
                       '5C29NZLWQW6MSYWJ7S3NKLKPWGU75ZJXKEL6Z9V97HAMDYHM6ARCH58EP' +
                       'WRPZUXN8RRWGCDFM6BH6XUTRTFE3VMAAZAUUKHKL6AFC2PCPXFRDWLVYP' +
                       'ZKUGY8QDEZNECK9K5Y5MET9SRWQ36JF77XJ6NUKSMZ6DKUPEH4W43YQAE' +
                       'CV7XVFWJ7ZTRVFQJZFU5BS8AL77YLCXDCR5VPFFZ9NP7EBBQ2AA04DP3S' +
                       '86B3YD8AFXQ3KPPNTPHBTQSM8PUHJHG87RUM4EV63GKPBRGSN3VX63FCS' +
                       '646DLWSH86B542U3F04DP3S86B3YD8AFXQ3KPPNTPHBTQSM8PUHJHG87R' +
                       'UM4EV63GKPBRGSN3VX63FCS646DLWSH86B542U3F';
    end;
    RM_4096:
    begin
      kg.PublicKey  := '0201B810DA4A1ADD4351378790A98138533334BN75EUD4LFWYFVNFGBRCEMKKXG62QRBXL8GMHQ975B68FJVEMNXQQ7' +
                       'RKR7RCZMWDVP86QPB3LR49G9BM7EUUZXNCRZBXRF4PEY3RX6UXT4X286K' +
                       'WMR7AMEE6QNP9AEHGWJT9AVU3F62F37B5GVX2BQF73QWHRFQSQ6XMRP6M' +
                       'ZDRQ8JT89UF3YRK5UL34MM3L8HLDTWAJF5YY7MRWJUFDQRK9JNCJ6C9KJ' +
                       'WRE5ACQSNS24NEAHDYKS3AK75HBCTKP9NR2CSL7Q9PPXM4TF7L37USP77' +
                       'Z7WER6JY67F7YGKTP6MFRMKK9H8XFPZ9XWKK97XCFXK7AW4TB96WGEH4B' +
                       'YPF9QRF2DGC3LCHW8VTD2EMHVRDR6EEBUG8R4XYKJPLBPRCJP445DU2BW' +
                       'JWELKAY45GKDU5HLTTDTWRH2JFKJ7AVAKLPEELN29YHX5JR773P9ERW7N' +
                       'UFMWDKD4UL4YPU5QW2L4A7ZN3E8ZDQVEZUR6ZRDQXRLQRLUNHVB4XGBWD' +
                       'HM79NGJARHDBQJCD8NWZCWPBY26QARP7A5S48DCV29F7MUTHU3YAHYVS7' +
                       'ZPGXJZZA5HBBY4K5BQPUG6MVCBG8H3C7VL8KH9EH58NUVCE6F2CGMSM94' +
                       '4CQDKNVGWWWRNK4DG26UT88Y9ULUPJ25G9KLTQPK3TBXZEK43X8KPMJT8' +
                       'DF6MTQ5RB94XR2BT9H9NYYTXL29GF8KZY9QNHAW4LTT2RDQTD2ELWPSV4' +
                       '4AND9K8G5VKLQ287UBEVHA82CMSMGQQBMNQZVAZ9G8T5TD6G9F7XQHMJT' +
                       'HCL6PFEDUW5MN9JASF2EKPT2H33325A3SFGGM5C3RYKZSYSSQC5FLHNX9' +
                       'VHN4HQVWD66YECY4R97JZHQALRTCHXUWH85LSJCCTQZT8JF52FHG6FV9J' +
                       'UJWEU24K9Z7SKYTYA9NH7GW29FSNKUK3DMFXY48VEYZVDRTTMLFYSJH8B' +
                       'RQXV72REYGSM6SLX89EVQ52CN9N8YDLWHAWCDDNM89YN2FCRTLE8688XN' +
                       'F4MZMFE6GP9JK2JTFJVUKBLES2ZVWSBCJE9N3D7DG9LL9Z3U42QFJJPE2' +
                       'HE5XCRY25UND96R9D7655ZBSCPF796FJZ4GPLY7AMZLGLR77GRP467ELK' +
                       'PXSZ9ZF8MUYFDHV4EFACPZ79CDFTYW56NE9JDWDVUMNLY9EXDSF8ZNABE' +
                       'MDQU6T9RVLTNRMZJJ8EJSUM9TV8YA6MNWF2Y66MD3VQ9L662F5X6VE9ZC' +
                       'PPRTNMEV2DG9BUMFMSL7PUR9H5QG6VVBDBMEU3PLABL57HMSQ5C83E9X8' +
                       'RTPY4QSEH2H7R2QDJHT5LQSFNQJL2NZ24GLNTFXG468WC5UUTDD68G8HM' +
                       '477Z8P4F9ZZHUGZ6VPFF32A2MPWY8LPXNECCKM9EEVLDDPUJ8LXN2AE6K' +
                       'Y2Q42FVBCJM9GQTXNRHBED735KCFD4YGV4U5U3LJD6NJ886W6XQLWH3G7' +
                       '3VZ6T5YDUQP6DA5ZHLKQSGATDJHUWC2ELTE7QJFXH8H9EAQYZPPMW76JG' +
                       'Z48UBND9VXFXZMSGBNWQPNQG7E4TCBDMVKUSA9TTVSNLN3DXEZNXH787R' +
                       'N7XHFBJNZ5W74DUMNBYVHEQDYMZBQCFMS8LGSDUAU6QE9DD5Q334BX62T' +
                       'JP5WQQDS2ZEWW76XW7VMLX3L7V9UVD7RL297VDBVRFPQ5MYA3YFVBVNVA' +
                       'R5TJXMQ4X2U2PW6UWSKBXT58HG3QPZM2RVEX2PDMCVJDFTJMXR9NPLW4C' +
                       '6AE4Q9A8TTAQ68BSN9WWTFFTSX68ECVARFPDBBH5DMP4KYFARTFVCSWNF' +
                       'FGAPBYYGFJA4MGHEDWTNE54MPGER7EPCZEV2ESJRMM6XDMFGABG97HECN' +
                       '3SZFUBRKCNDZ2TE9F6EERULRCDAV5EMY6KVY9NY9MYNPP2FQ5WFWLMRYD' +
                       '4TNYYHE6EDMQ6KK79HH5Q5KBW6DDQYYNUR365W2454CHEZWZAPU82SX4H' +
                       'KHNZXBRVWAT7G9CJBKHNBPSVEL67X8UJHBFHZH8ZD4NSEVFZM4Y768TJ6' +
                       'QP3BGEKLTY4UZUWHG63QMKVWAQW9E7WRFNJCH4XRD97JHNKMFUTRFVH68' +
                       'G5CKSMGC725AZ9CBSL2JX43P4EY44CMF56AJ6BEXVCJP2ZDWCT9G55K4D' +
                       'F24J7TTJMFXTQH95CBNX67CBPNWEKHCWQV6VD73Y9KCZHNBFUFS8TCYNN' +
                       'WXRGFKNVRDFUKWHDWDDTSPEW8YCKLPMX2GUV3N4JFJMUE6TSJR6Z53C9F' +
                       'SKZAY3EN7G66JPBF5E9S6Y7RQHPWZHSRDQ7XH87PHUJFLJFGD7WNE3Q9P' +
                       'EXMW33LVJBFEUXKNUB6SU7ZYCEX96XT8G27FLUV7XPV4JK64DWDJCX9WV' +
                       '4VL8CK23FQJ28UG9JUZTQJ3DRL32BTJVRD4LVQ6MK9LCE7ZZP925JK7ZD' +
                       '92SCV4DDJJ5EXMVBF';
      kg.PrivateKey := '067DN6F8YFBTWF5QH8MHJB39Z7VNN2P56HS8RPBURAWB8KPL8FQWX4HSP' +
                       'RTY4HWFMFXAVX2YUY99G2U2KKK56CBE4BCPZWS3KJ98XRW4PY2CDQ3ALF' +
                       'Y3HGJG42NRY9ZVGZZB59TE29KGC825BYBX3FRFMYBVN2VTHM8YM2KULXM' +
                       'H24XSHNVK4HEQ9L5264844DMBFUUXSBA9PT9LEXT6449TMAMF7RL6KU6C' +
                       'GP6FU9DNMJCNTUREF2U9WUMJBMXMMHWKWDG4VU5JQNFFNNWCP2YE2DGFD' +
                       'N3H27NTNR58GBNTTZBRK66BKWNVMF8H59KALB6K93Y8UWDUWV5HJZGV8X' +
                       '3AS5EG982DYV4W9CQ3GRRFRR8NABQC98FTAG465SXQ3JPN7X7VULQZX4X' +
                       'UK68URBFPGCW2UPBYH6CRG6C7YBRAURM2KMGN5L8XH4AUQN8WM4P454WN' +
                       'NWRE5SQEC78FK3LHHQU5VLXLYYN8F2NXGG7CCQ92EEC63ZE6S7CC7RTML' +
                       'UMM3PAXPL5CJZFL26JNNYPVLAHM75NDL8AS8JR48PFXK49D4A6TY2ZU9Y' +
                       'XX2Y2TLA3J8T56EPY236FEDGZEHTQR73NE2Y7LKL7423FFKGGPWYL8PB5' +
                       'VWD54PG328ACE6V8VLSGVP9VJMMWS2VDVU459C8K5XK869Z5KM4JWHAVE' +
                       'G56ZESC6HHJ423N6SAH2DW2UQZDQHSMKWUCHPUKZZPJXCQXF55Q3BJW6Z' +
                       'QYK4HM4Q8XWU8NT844E8YM96EGHSYEUKAJ3QDXANN2DELSGARH7LR2XH9' +
                       'UQBQNXGPZGB6JTEQP8HAQK5ZZYJE067DWX6C2JJ7L2HE4NGVXZV5XH9RD' +
                       'P9SNG4WZTC9KEMGXDX7JTQX8RPJJRT4YTA83L8GXDNDDHB7C79CN8UWGL' +
                       'U5EMNMBREQN5MYTYHGYK067DWX6C2JJ7L2HE4NGVXZV5XH9RDP9SNG4WZ' +
                       'TC9KEMGXDX7JTQX8RPJJRT4YTA83L8GXDNDDHB7C79CN8UWGLU5EMNMBR' +
                       'EQN5MYTYHGYK';
    end;
  end;

  // Fill key buffer
  ZeroMemory(@KeyBuffer, SizeOf(KeyBuffer));
  kg.Key := @KeyBuffer;
  kg.KeyLen := SizeOf(KeyBuffer);
  // Fill User Info
  kg.RegInfo := PWideChar(eUserInfo.Text);
  // Key expiration info
  kg.UseKeyExpiration := cbExpirationDate.Checked;
  kg.ExpirationYear := YearOf(DateTimePicker1.DateTime);
  kg.ExpirationMonth := MonthOf(DateTimePicker1.DateTime);
  kg.ExpirationDay := DayOf(DateTimePicker1.DateTime);
  // Register After date
  kg.UseRegisterAfter := cbRegisterAfter.Checked;
  if kg.UseRegisterAfter then
  begin
    kg.RegisterAfterYear := YearOf(dtpRegisterAfter.DateTime);
    kg.RegisterAfterMonth := MonthOf(dtpRegisterAfter.DateTime);
    kg.RegisterAfterDay := DayOf(dtpRegisterAfter.DateTime);
  end;
  // Register Before date
  kg.UseRegisterBefore := cbRegisterBefore.Checked;
  if kg.UseRegisterBefore then
  begin
    kg.RegisterBeforeYear := YearOf(dtpRegisterBefore.DateTime);
    kg.RegisterBeforeMonth := MonthOf(dtpRegisterBefore.DateTime);
    kg.RegisterBeforeDay := DayOf(dtpRegisterBefore.DateTime);
  end;
  // Country
  kg.UseCountyLimit := cbCountry.Checked;
  if kg.UseCountyLimit then
  begin
    kg.CountryCode := KEY_COUNTRIES[comCountries.ItemIndex].Code;
  end;
  // Executions
  kg.UseExecutionsLimit := cbExecutions.Checked;
  if kg.UseExecutionsLimit then
  begin
    kg.ExecutionsCount := StrToInt(eExecutions.Text);
  end;
  // Days
  kg.UseDaysLimit := cbDays.Checked;
  if kg.UseDaysLimit then
  begin
    kg.DaysCount := StrToInt(eDays.Text);
  end;
  // Runtime
  kg.UseRunTimeLimit := cbRuntime.Checked;
  if kg.UseRunTimeLimit then
  begin
    kg.RunTimeMinutes := StrToInt(eRuntime.Text);
  end;
  // Global time
  kg.UseGlobalTimeLimit := cbGlobalTime.Checked;
  if kg.UseGlobalTimeLimit then
  begin
    kg.GlobalTimeMinutes := StrToInt(eGlobalTime.Text);
  end;
  // Hardware ID
  kg.UseHardwareLocking := cbHardwareID.Checked;
  kg.HardwareID := PWideChar(eHardware.Text);
  // Crypt Sections
  kg.EncryptedSections[1] := cbSection1.Checked;
  kg.EncryptedSections[2] := cbSection2.Checked;
  kg.EncryptedSections[3] := cbSection3.Checked;
  kg.EncryptedSections[4] := cbSection4.Checked;
  kg.EncryptedSections[5] := cbSection5.Checked;
  kg.EncryptedSections[6] := cbSection6.Checked;
  kg.EncryptedSections[7] := cbSection7.Checked;
  kg.EncryptedSections[8] := cbSection8.Checked;
  kg.EncryptedSections[9] := cbSection9.Checked;
  kg.EncryptedSections[10] := cbSection10.Checked;
  kg.EncryptedSections[11] := cbSection11.Checked;
  kg.EncryptedSections[12] := cbSection12.Checked;
  kg.EncryptedSections[13] := cbSection13.Checked;
  kg.EncryptedSections[14] := cbSection14.Checked;
  kg.EncryptedSections[15] := cbSection15.Checked;
  kg.EncryptedSections[16] := cbSection16.Checked;

  // Secure constant (get it from project file)!
  kg.EncryptedConstant := 2113444489;

  // Generate reg. key
  dwResult := KG_GenerateRegistrationKeyW(@kg);
  if dwResult = EP_NO_ERROR then
  begin
    mKey.Text := String(PWideChar(kg.Key));
  end else
  begin
    case dwResult of
      EP_ERROR_UNKNOWN                 : mKey.Text := 'EP_ERROR_UNKNOWN                ';
      EP_ERROR_KEYBUFFEREMPTY          : mKey.Text := 'EP_ERROR_KEYBUFFEREMPTY         ';
      EP_ERROR_KEYBUFFERISLESS         : mKey.Text := 'EP_ERROR_KEYBUFFERISLESS        ';
      EP_ERROR_REGINFOEMPTY            : mKey.Text := 'EP_ERROR_REGINFOEMPTY           ';
      EP_ERROR_REGINFOTOOLARGE         : mKey.Text := 'EP_ERROR_REGINFOTOOLARGE        ';
      EP_ERROR_PRIVATEKEYISNOTSET      : mKey.Text := 'EP_ERROR_PRIVATEKEYISNOTSET     ';
      EP_ERROR_PUBLICKEYISNOTSET       : mKey.Text := 'EP_ERROR_PUBLICKEYISNOTSET      ';
      EP_ERROR_PRIVATEKEYISINVALID     : mKey.Text := 'EP_ERROR_PRIVATEKEYISINVALID    ';
      EP_ERROR_PUBLICKEYISINVALID      : mKey.Text := 'EP_ERROR_PUBLICKEYISINVALID     ';
      EP_ERROR_KEYMODEISINVALID        : mKey.Text := 'EP_ERROR_KEYMODEISINVALID       ';
      EP_ERROR_KEYBASEISINVALID        : mKey.Text := 'EP_ERROR_KEYBASEISINVALID       ';
      EP_ERROR_CURRENTDATEISINVALID    : mKey.Text := 'EP_ERROR_CURRENTDATEISINVALID   ';
      EP_ERROR_EXPIRATIONDATEISINVALID : mKey.Text := 'EP_ERROR_EXPIRATIONDATEISINVALID';
      EP_ERROR_KEYISINVALID            : mKey.Text := 'EP_ERROR_KEYISINVALID           ';
      EP_ERROR_HARDWAREID              : mKey.Text := 'EP_ERROR_HARDWAREID             ';
      EP_ERROR_HARDWAREBUFFEREMPTY     : mKey.Text := 'EP_ERROR_HARDWAREBUFFEREMPTY    ';
      EP_ERROR_HARDWAREIDINVALIDFORKEY : mKey.Text := 'EP_ERROR_HARDWAREIDINVALIDFORKEY';
      EP_ERROR_PROJECTFILENOTFOUND     : mKey.Text := 'EP_ERROR_PROJECTFILENOTFOUND    ';
      EP_ERROR_INVALIDPROJECTFILE      : mKey.Text := 'EP_ERROR_INVALIDPROJECTFILE     ';
      EP_ERROR_EXECUTIONSNUMBERINVALID : mKey.Text := 'EP_ERROR_EXECUTIONSNUMBERINVALID';
      EP_ERROR_DAYSNUMBERINVALID       : mKey.Text := 'EP_ERROR_DAYSNUMBERINVALID      ';
      EP_ERROR_COUNTRYCODEINVALID      : mKey.Text := 'EP_ERROR_COUNTRYCODEINVALID     ';
      EP_ERROR_RUNTIMEINVALID          : mKey.Text := 'EP_ERROR_RUNTIMEINVALID         ';
      EP_ERROR_GLOBALTIMEINVALID       : mKey.Text := 'EP_ERROR_GLOBALTIMEINVALID      ';
      EP_ERROR_INSTALLBEFOREINVALID    : mKey.Text := 'EP_ERROR_INSTALLBEFOREINVALID   ';
      EP_ERROR_INSTALLAFTERINVALID     : mKey.Text := 'EP_ERROR_INSTALLAFTERINVALID    ';
      else mKey.Text := 'Unknown error';
    end;
  end;
end;

procedure TfrmMain.bGenFPClick(Sender: TObject);
var
  kg : TKeyGenParamsW;
  KeyBuffer : array [0..2047] of widechar;
  dwResult : dword;
begin
  mKey.Clear;

  if eUserInfo.Text = '' then
  begin
    ShowMessage('User info field is empty!');
    Exit;
  end;

  ZeroMemory(@kg, SizeOf(kg));
  // Hyphens
  kg.KeyWithHyphens := cbHyphens.Checked;
  // Fill key buffer
  ZeroMemory(@KeyBuffer, SizeOf(KeyBuffer));
  kg.Key := @KeyBuffer;
  kg.KeyLen := SizeOf(KeyBuffer);
  // Fill User Info
  kg.RegInfo := PWideChar(eUserInfo.Text);
  // Key expiration info
  kg.UseKeyExpiration := cbExpirationDate.Checked;
  kg.ExpirationYear := YearOf(DateTimePicker1.DateTime);
  kg.ExpirationMonth := MonthOf(DateTimePicker1.DateTime);
  kg.ExpirationDay := DayOf(DateTimePicker1.DateTime);
  // Register After date
  kg.UseRegisterAfter := cbRegisterAfter.Checked;
  if kg.UseRegisterAfter then
  begin
    kg.RegisterAfterYear := YearOf(dtpRegisterAfter.DateTime);
    kg.RegisterAfterMonth := MonthOf(dtpRegisterAfter.DateTime);
    kg.RegisterAfterDay := DayOf(dtpRegisterAfter.DateTime);
  end;
  // Register Before date
  kg.UseRegisterBefore := cbRegisterBefore.Checked;
  if kg.UseRegisterBefore then
  begin
    kg.RegisterBeforeYear := YearOf(dtpRegisterBefore.DateTime);
    kg.RegisterBeforeMonth := MonthOf(dtpRegisterBefore.DateTime);
    kg.RegisterBeforeDay := DayOf(dtpRegisterBefore.DateTime);
  end;
  // Country
  kg.UseCountyLimit := cbCountry.Checked;
  if kg.UseCountyLimit then
  begin
    kg.CountryCode := KEY_COUNTRIES[comCountries.ItemIndex].Code;
  end;
  // Executions
  kg.UseExecutionsLimit := cbExecutions.Checked;
  if kg.UseExecutionsLimit then
  begin
    kg.ExecutionsCount := StrToInt(eExecutions.Text);
  end;
  // Days
  kg.UseDaysLimit := cbDays.Checked;
  if kg.UseDaysLimit then
  begin
    kg.DaysCount := StrToInt(eDays.Text);
  end;
  // Runtime
  kg.UseRunTimeLimit := cbRuntime.Checked;
  if kg.UseRunTimeLimit then
  begin
    kg.RunTimeMinutes := StrToInt(eRuntime.Text);
  end;
  // Global time
  kg.UseGlobalTimeLimit := cbGlobalTime.Checked;
  if kg.UseGlobalTimeLimit then
  begin
    kg.GlobalTimeMinutes := StrToInt(eGlobalTime.Text);
  end;
  // Hardware ID
  kg.UseHardwareLocking := cbHardwareID.Checked;
  kg.HardwareID := PWideChar(eHardware.Text);
  // Crypt Sections
  kg.EncryptedSections[1] := cbSection1.Checked;
  kg.EncryptedSections[2] := cbSection2.Checked;
  kg.EncryptedSections[3] := cbSection3.Checked;
  kg.EncryptedSections[4] := cbSection4.Checked;
  kg.EncryptedSections[5] := cbSection5.Checked;
  kg.EncryptedSections[6] := cbSection6.Checked;
  kg.EncryptedSections[7] := cbSection7.Checked;
  kg.EncryptedSections[8] := cbSection8.Checked;
  kg.EncryptedSections[9] := cbSection9.Checked;
  kg.EncryptedSections[10] := cbSection10.Checked;
  kg.EncryptedSections[11] := cbSection11.Checked;
  kg.EncryptedSections[12] := cbSection12.Checked;
  kg.EncryptedSections[13] := cbSection13.Checked;
  kg.EncryptedSections[14] := cbSection14.Checked;
  kg.EncryptedSections[15] := cbSection15.Checked;
  kg.EncryptedSections[16] := cbSection16.Checked;
  // Generate reg. key
  dwResult := KG_GenerateRegistrationKeyFromProjectW('default.enigma', @kg);
  if dwResult = EP_NO_ERROR then
  begin
    mKey.Text := String(PWideChar(kg.Key));
  end else
  begin
    case dwResult of
      EP_ERROR_UNKNOWN                 : mKey.Text := 'EP_ERROR_UNKNOWN                ';
      EP_ERROR_KEYBUFFEREMPTY          : mKey.Text := 'EP_ERROR_KEYBUFFEREMPTY         ';
      EP_ERROR_KEYBUFFERISLESS         : mKey.Text := 'EP_ERROR_KEYBUFFERISLESS        ';
      EP_ERROR_REGINFOEMPTY            : mKey.Text := 'EP_ERROR_REGINFOEMPTY           ';
      EP_ERROR_REGINFOTOOLARGE         : mKey.Text := 'EP_ERROR_REGINFOTOOLARGE        ';
      EP_ERROR_PRIVATEKEYISNOTSET      : mKey.Text := 'EP_ERROR_PRIVATEKEYISNOTSET     ';
      EP_ERROR_PUBLICKEYISNOTSET       : mKey.Text := 'EP_ERROR_PUBLICKEYISNOTSET      ';
      EP_ERROR_PRIVATEKEYISINVALID     : mKey.Text := 'EP_ERROR_PRIVATEKEYISINVALID    ';
      EP_ERROR_PUBLICKEYISINVALID      : mKey.Text := 'EP_ERROR_PUBLICKEYISINVALID     ';
      EP_ERROR_KEYMODEISINVALID        : mKey.Text := 'EP_ERROR_KEYMODEISINVALID       ';
      EP_ERROR_KEYBASEISINVALID        : mKey.Text := 'EP_ERROR_KEYBASEISINVALID       ';
      EP_ERROR_CURRENTDATEISINVALID    : mKey.Text := 'EP_ERROR_CURRENTDATEISINVALID   ';
      EP_ERROR_EXPIRATIONDATEISINVALID : mKey.Text := 'EP_ERROR_EXPIRATIONDATEISINVALID';
      EP_ERROR_KEYISINVALID            : mKey.Text := 'EP_ERROR_KEYISINVALID           ';
      EP_ERROR_HARDWAREID              : mKey.Text := 'EP_ERROR_HARDWAREID             ';
      EP_ERROR_HARDWAREBUFFEREMPTY     : mKey.Text := 'EP_ERROR_HARDWAREBUFFEREMPTY    ';
      EP_ERROR_HARDWAREIDINVALIDFORKEY : mKey.Text := 'EP_ERROR_HARDWAREIDINVALIDFORKEY';
      EP_ERROR_PROJECTFILENOTFOUND     : mKey.Text := 'EP_ERROR_PROJECTFILENOTFOUND    ';
      EP_ERROR_INVALIDPROJECTFILE      : mKey.Text := 'EP_ERROR_INVALIDPROJECTFILE     ';
      EP_ERROR_EXECUTIONSNUMBERINVALID : mKey.Text := 'EP_ERROR_EXECUTIONSNUMBERINVALID';
      EP_ERROR_DAYSNUMBERINVALID       : mKey.Text := 'EP_ERROR_DAYSNUMBERINVALID      ';
      EP_ERROR_COUNTRYCODEINVALID      : mKey.Text := 'EP_ERROR_COUNTRYCODEINVALID     ';
      EP_ERROR_RUNTIMEINVALID          : mKey.Text := 'EP_ERROR_RUNTIMEINVALID         ';
      EP_ERROR_GLOBALTIMEINVALID       : mKey.Text := 'EP_ERROR_GLOBALTIMEINVALID      ';
      EP_ERROR_INSTALLBEFOREINVALID    : mKey.Text := 'EP_ERROR_INSTALLBEFOREINVALID   ';
      EP_ERROR_INSTALLAFTERINVALID     : mKey.Text := 'EP_ERROR_INSTALLAFTERINVALID    ';
      else mKey.Text := 'Unknown error';
    end;
  end;
end;

procedure TfrmMain.btnVerifyClick(Sender: TObject);
var
  kv : TKeyVerifyParamsW;
  i : integer;
  dwResult : dword;
  stemp : string;
  sresult : string;
begin
  if eUserInfo.Text = '' then
  begin
    ShowMessage('User info field is empty!');
    Exit;
  end;
  if mKey.Text = '' then
  begin
    ShowMessage('Key field is empty!');
    Exit;
  end;

  kv.RegInfo := PWideChar(eUserInfo.Text);
  kv.Key := PWideChar(mKey.Text);
  kv.KeyLen := length(mKey.Text);

    // Key mode
  kv.KeyMode := cbKeyMode.ItemIndex;
  // Key base
  kv.KeyBase := cbKeyBase.ItemIndex;
  case kv.KeyMode of
    RM_512:
    begin
      kv.PublicKey  := '0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC' +
                       'P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC' +
                       'WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH' +
                       'CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8' +
                       'HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP' +
                       'SRGDQ742B4742XF4MACRR747YDP5FZZ9D';
    end;
    RM_768:
    begin
      kv.PublicKey  := '0201B810DA4A1ADD4351378790A9813853309AEHRR66KMK99UEPX8C54WQFDZQ5Y96WUCVZYMXBC32SJV7T5SBPR54E' +
                       '2DBH8UD9RNHTJ9BLJV6NHX52W7PZDDTTJDDGF3YFVL7PJFL8RS8THTFDF' +
                       '4RY7K3QXLTMXMC8DDSRVRWBVMMP3UYKCDDC7KGL9PG509ACPTRQ4MMUKG' +
                       'DAUJFFFGSCBFLYK9X9E74M58PW5FG9B9RTLXJQ4STPVCHJTEH8BP557VZ' +
                       'PQYDBUZJXXJNGVZELFL4UL3LHHE8A645CK593DVWCQBSX4ZCCQ3ST8GCZ' +
                       'LW2729XK3NT7GST3LMQGXSHLDWCXE09AENVX2QTX3VLT6FWB4JND875XZ' +
                       'WQ26GW76TV3KVVHK7U489LLPBQ39HUWKMA65U3HKWBDHKBZEB525PHEH2' +
                       'YQHRZGNJAAYZXMWN8RNZ9T7VMZAJMP2V3S9NXZ9RHL96F7AT3NTMN36V4' +
                       'ACSFEN4DR6TJR95';
    end;
    RM_1024:
    begin
      kv.PublicKey  := '0201B810DA4A1ADD4351378790A981385330CDG9YQSEUK2HT546KWW46NHSCHMD2TNCSPVNSKGQC6CHDUSU9CC4LDPL' +
                       'TD3NLRVD3TFV9BU2SYBUBU9TXKLQ3CTKZE5GN9VFG37R9YNK2FE58K7ZY' +
                       'WTUJYFSJTBMDLLGA9GJ2LJXGHSS9CESGC2K69H65YQGAC7CRGF5T3CPLA' +
                       '5BDJZKVCUWPZRNA2DN7L956LZVZBQUDPX6PF30CDBH26Z82VE4QQ8N85L' +
                       'QHYJYYCJ6WQ89H9K9VVQX925SG5FJ79AGVZB6M8TTFKCJ56FAREP8GSTC' +
                       'NKWCXEALDP9Y2ZLS9QKZV8JRNDHG9D8BRDSCTMDQK9NLAPZ9TGYFS9G7U' +
                       'LXHYJF7F9A89HPXGTU2N4FQQJL98WZ5QND2KTEMMUUZFAX953HCGNSWUW' +
                       'U2M7LBEWZSH9GW5SC0CDJDY2HC4HJYUSVTAVXZ7MYVJWF3CU9WC3SVPSL' +
                       '29WF46DVS2SYKSSAMATPPYGJDE3PBFMGS34CXWQSXKCEAE63L2EXTS9NE' +
                       '2G597XASY3S34XMYST5YZF4THUTYT5DY9UKKXU6PH8MLXRPZMPMMR83JU' +
                       'X2WGNEW8ZGL4SKUCUB8CEAB6UZ4FB66WTP3B64VMX7XG75T4Y35479';
    end;
    RM_2048:
    begin
      kv.PublicKey  := '0201B810DA4A1ADD4351378790A98138533199H9KZC4CQ5ZKPEGYDW2EHN5AKZA5G5KP4HU8USWJR8XWW7MCH7244RV' +
                       'PSXFHVU6YQRK4LPUHM497XJYPLLA3DHUZWXK3CB5SUYF75NPYLTNPRUAP' +
                       'CTVDHAKYWTRQ97HES2E59WDN2LJKFYA2K8BGFSBHP4A6BF5FSDTS8NWLL' +
                       'C5NEQ76NJ9BAMWXG55UPFFMRQZTU5KV2G6LSPQUJJWA9U4LJ5SCJ9M9ZQ' +
                       'Z6K7LZA9UAMJ533UQ5J3JPNQAUWJGZFRFCTGAGSBWPWRRF9HRGF9MCX55' +
                       'QRYGPYMRE6DBJ65SJDX34FVPYWWKWQ48MCKXYXPHQ23BJ42U8ZMDD8CG5' +
                       'DPHZQ5XTXUKA277XK6PKSTLJ88ZZ9EBXH62REMRZZRGNPKHYM34RW722S' +
                       'SZHMPFKY7X8UZ19ADGX3UQ7X444XH7MZXEZYW2YLFHR8YL3PTCXVSYX89' +
                       'ZXN7KW2XNBE8XS3TQRGZVF6KA5USH56NEZYH5RNWBBPVE9LD6H42RQWR5' +
                       'YVQMT5EQYQTK6YM9V8DA5BJCLGGZ2UGD6NPA2X3SNUS47F7HJBNBCWHRA' +
                       'YPPCQ5HWCJNPDHUDQMRN2P6PWJFWJ6CLVNK8HXEFLE4ENPXAFN89CRS43' +
                       'RUMVGDJQCSRB535XYCS6BZYLA9Q6HJV425F26XXHRGA7C8R8BVMELAPEH' +
                       '5DSA9KXTCV4H2RNVDFHG3YJSERZVFPWHYA823LUBENBL5U3J4LJX2KQLW' +
                       'L5XGGESPSE2FQWKSQ4NUCDLBEJPQAT2A2477DYS2XEXKLYEAKUN22622C' +
                       'RLBCAHPFNEV2FJ2H8N3JQGXJRGP19AFHGRW6SS2ZSFYK8EZAPVYL4MCP4' +
                       '6UMR64Y9T89FHWEPXBRHKWJCSNNNGPU984J5XW4BWTU6PDWPN24W8RU55' +
                       'A9C3U9H7VHS5PFURASHBT4JAEE5ZKJBSYMCMDVBLU973R72RVPA6U96A2' +
                       'LX8HMASVST9RVJ7W66V4DYWRDZZQ3673W7C7LVF68TWPLNMYEUQ8FDZRN' +
                       'P38D9BX5YA3VENETDUUUMR9U7FFP4NZM7G4Y6J6EASK5SAXXTRMZ8F3AH' +
                       '5FC54E543N739BY5KVZQM7JZWD2P2HPE7BDRMM9JFCGPBWWASTZ7UDNRV' +
                       '6AFHVMBR9AGAERE9M6W6S2ZT8PBTABPDCKBPPPV6QW9DRXZUGAHDDRRSY' +
                       'XM4YXQ2QJX6CL33N7RV8846LK8A3DFLDXWZ2NKF8V';
    end;
    RM_3072:
    begin
      kv.PublicKey  := '0201B810DA4A1ADD4351378790A98138533267BJBN6W8SY33Y47RWJHWS385XWRV9TSVSB5EM7ECZYNSJ44ZKSD8KV4' +
                       '6Y9T6TNC6QMDW4V6DBMADU3YUKLP88TCLEUD9FTEUHGXM6T57AQ2EMB59' +
                       'UPQVNSUT7Z4EHAMDQ6N77VK2A6P847MMWJH9E7C5XX6FNF6MHGWERPWQV' +
                       '9ZLVR9Z7X5D5Z2XQL6MBM7BDCT2DEDVRBFNDDBLG6LHZ9APM48LS5TKTJ' +
                       'AGDYFDRVHEGTDH47PCLL8YJ4ZAWCB59F8BN5PZL3NQACP32G3YNBX5E3J' +
                       '7S28XLRGAX55ZML5XE6Q68EUAL38VUBJ2MZ2UGCCHM7CE6S99N44X9RMV' +
                       '7B55HULJ4KHPFYSBDUSPQTCWGS76BEQST2QCZDZ2T4FBA4YUJFF47AACE' +
                       'A4EEFESEYWN48UZCSDZAMGSU5VB9UJKR2XQUSDFS3TNG9QKURQWS7N5Q3' +
                       'VPYT4QAGGQ5GW2MMXHDJYW55FQPHSS255GVJ7WLLP85JHS8K6DVTJWB4W' +
                       '4Y8ZEFF7KP6W74PAA8FVPZVDW4RKGMQ8V56Q6R4V34XFE5HR4FZS8GZ6R' +
                       '36RKW6WN34S2AHR9LCGF8LULB7ZN6NC2AA5RPDZYGWSPPME6267CGLZCP' +
                       'GG98W557RXCDWAETJHDCRPUXX7AD3E8SL9WMGBV9QFHMSV9UFV7H9NTX3' +
                       'QYV95CN9P9DSYQWL35R2BWB4GKW6CTWVB2X6WH3P2WFBE6X55KBLAMDB3' +
                       'SRDSDVY37GKH78MUHY7KDJDC8SJU5FUQRYZ49ULX3YSZL7E284GFVZSGD' +
                       'FTTQNR6VMBM3LLR78SUSVMJW88XT2K4UHEATRU3V9MMR2VGNGCY9S6R7M' +
                       '4ELNPEBBMQP2HVPLY5M5VPA92V7NU8ZZ58YYTW5QK9USZ5LV59UZGB2CF' +
                       'DPZ6HFYU5WB7UU3UYWVNSNKM3W7GBYKJP8TMFW2YN6GNSSE4ZKFVZRLUT' +
                       '8QPZBBEQT5H9H5Z53D7QV4AJTKTX4EMW62TDWXQVK24JZPSG2VXKCMYZL' +
                       'BUASE25R3EEK9KBLJ8VX83ZXGTBL5CCDBY33HJ6FKX8AW3WPRX3XTCS9G' +
                       '2B9SVK2XFFKNSPGFG6FZNS8P2HERFGFL79DKUZZFWHFH4H9UZ7F7F6W3Z' +
                       'WN84JRRA7SU8T89EQMRBEPVYMMGLGSUMFWWMEDLJM5EGP5WEX9LDUAQXS' +
                       '55LKDQVRKX4R8NNBHSYBHSNMFYA2C6KGQQFK3TN267DPSZT3PTKHTLNMU' +
                       'V2YYZZRX3953LPWAKYF8LJUVMEQT3ZC4F9SWMYGUHG6XX66PJFQWSRUW2' +
                       'C79YLGZ6ZAFS7HLXBTH55UD3EGFBZQ5CLNJDZTEJACDVBCM5FQBTX4DKK' +
                       'UDGNSMWWLC5UMQRHW89CTU5636WYDXVZZDAUZ529458LDN2DAR9QADWRZ' +
                       'UTU8MCKN8ACH3R36YKE52DDF67SM5UDUH7PTATHXE65UCGFRCV49UTF29' +
                       'BGDSUWGRMC839HUZYQVAG985YUF5KJCAVGKRD8E4YMPJ38KR6HD2KHDGY' +
                       'PJDMJMN4Y3DTJW5MYX3VUPF32637LMAWFM4QCU7BMP74SCF4N5QXZZVBE' +
                       'LAQMPYMJC2ZWJ9XFV33YXTTPH3SG9KMUABLL83P7L3UBVM763XJPR5UEH' +
                       'DZ73XJUGR9QP6299K5PU46XGVWKWFAKWYMRXUSLCFJ3WQTEC6QJH6E5V8' +
                       'X2RMA5TXGSBEWLGSMNQ2SH6G9MLKK4S486DN4M4QVDTYTM4JQETAJQGP7' +
                       '6NUR4UNDXR4W4JQSNWDTUGX69SEDC3AL8ZF4TJBQQRXSX2A86UUWCDCFH' +
                       'JE94A8EP3Q6A2QTYKEE62MV4VJB2AB';
    end;
    RM_4096:
    begin
      kv.PublicKey  := '0201B810DA4A1ADD4351378790A98138533334BN75EUD4LFWYFVNFGBRCEMKKXG62QRBXL8GMHQ975B68FJVEMNXQQ7' +
                       'RKR7RCZMWDVP86QPB3LR49G9BM7EUUZXNCRZBXRF4PEY3RX6UXT4X286K' +
                       'WMR7AMEE6QNP9AEHGWJT9AVU3F62F37B5GVX2BQF73QWHRFQSQ6XMRP6M' +
                       'ZDRQ8JT89UF3YRK5UL34MM3L8HLDTWAJF5YY7MRWJUFDQRK9JNCJ6C9KJ' +
                       'WRE5ACQSNS24NEAHDYKS3AK75HBCTKP9NR2CSL7Q9PPXM4TF7L37USP77' +
                       'Z7WER6JY67F7YGKTP6MFRMKK9H8XFPZ9XWKK97XCFXK7AW4TB96WGEH4B' +
                       'YPF9QRF2DGC3LCHW8VTD2EMHVRDR6EEBUG8R4XYKJPLBPRCJP445DU2BW' +
                       'JWELKAY45GKDU5HLTTDTWRH2JFKJ7AVAKLPEELN29YHX5JR773P9ERW7N' +
                       'UFMWDKD4UL4YPU5QW2L4A7ZN3E8ZDQVEZUR6ZRDQXRLQRLUNHVB4XGBWD' +
                       'HM79NGJARHDBQJCD8NWZCWPBY26QARP7A5S48DCV29F7MUTHU3YAHYVS7' +
                       'ZPGXJZZA5HBBY4K5BQPUG6MVCBG8H3C7VL8KH9EH58NUVCE6F2CGMSM94' +
                       '4CQDKNVGWWWRNK4DG26UT88Y9ULUPJ25G9KLTQPK3TBXZEK43X8KPMJT8' +
                       'DF6MTQ5RB94XR2BT9H9NYYTXL29GF8KZY9QNHAW4LTT2RDQTD2ELWPSV4' +
                       '4AND9K8G5VKLQ287UBEVHA82CMSMGQQBMNQZVAZ9G8T5TD6G9F7XQHMJT' +
                       'HCL6PFEDUW5MN9JASF2EKPT2H33325A3SFGGM5C3RYKZSYSSQC5FLHNX9' +
                       'VHN4HQVWD66YECY4R97JZHQALRTCHXUWH85LSJCCTQZT8JF52FHG6FV9J' +
                       'UJWEU24K9Z7SKYTYA9NH7GW29FSNKUK3DMFXY48VEYZVDRTTMLFYSJH8B' +
                       'RQXV72REYGSM6SLX89EVQ52CN9N8YDLWHAWCDDNM89YN2FCRTLE8688XN' +
                       'F4MZMFE6GP9JK2JTFJVUKBLES2ZVWSBCJE9N3D7DG9LL9Z3U42QFJJPE2' +
                       'HE5XCRY25UND96R9D7655ZBSCPF796FJZ4GPLY7AMZLGLR77GRP467ELK' +
                       'PXSZ9ZF8MUYFDHV4EFACPZ79CDFTYW56NE9JDWDVUMNLY9EXDSF8ZNABE' +
                       'MDQU6T9RVLTNRMZJJ8EJSUM9TV8YA6MNWF2Y66MD3VQ9L662F5X6VE9ZC' +
                       'PPRTNMEV2DG9BUMFMSL7PUR9H5QG6VVBDBMEU3PLABL57HMSQ5C83E9X8' +
                       'RTPY4QSEH2H7R2QDJHT5LQSFNQJL2NZ24GLNTFXG468WC5UUTDD68G8HM' +
                       '477Z8P4F9ZZHUGZ6VPFF32A2MPWY8LPXNECCKM9EEVLDDPUJ8LXN2AE6K' +
                       'Y2Q42FVBCJM9GQTXNRHBED735KCFD4YGV4U5U3LJD6NJ886W6XQLWH3G7' +
                       '3VZ6T5YDUQP6DA5ZHLKQSGATDJHUWC2ELTE7QJFXH8H9EAQYZPPMW76JG' +
                       'Z48UBND9VXFXZMSGBNWQPNQG7E4TCBDMVKUSA9TTVSNLN3DXEZNXH787R' +
                       'N7XHFBJNZ5W74DUMNBYVHEQDYMZBQCFMS8LGSDUAU6QE9DD5Q334BX62T' +
                       'JP5WQQDS2ZEWW76XW7VMLX3L7V9UVD7RL297VDBVRFPQ5MYA3YFVBVNVA' +
                       'R5TJXMQ4X2U2PW6UWSKBXT58HG3QPZM2RVEX2PDMCVJDFTJMXR9NPLW4C' +
                       '6AE4Q9A8TTAQ68BSN9WWTFFTSX68ECVARFPDBBH5DMP4KYFARTFVCSWNF' +
                       'FGAPBYYGFJA4MGHEDWTNE54MPGER7EPCZEV2ESJRMM6XDMFGABG97HECN' +
                       '3SZFUBRKCNDZ2TE9F6EERULRCDAV5EMY6KVY9NY9MYNPP2FQ5WFWLMRYD' +
                       '4TNYYHE6EDMQ6KK79HH5Q5KBW6DDQYYNUR365W2454CHEZWZAPU82SX4H' +
                       'KHNZXBRVWAT7G9CJBKHNBPSVEL67X8UJHBFHZH8ZD4NSEVFZM4Y768TJ6' +
                       'QP3BGEKLTY4UZUWHG63QMKVWAQW9E7WRFNJCH4XRD97JHNKMFUTRFVH68' +
                       'G5CKSMGC725AZ9CBSL2JX43P4EY44CMF56AJ6BEXVCJP2ZDWCT9G55K4D' +
                       'F24J7TTJMFXTQH95CBNX67CBPNWEKHCWQV6VD73Y9KCZHNBFUFS8TCYNN' +
                       'WXRGFKNVRDFUKWHDWDDTSPEW8YCKLPMX2GUV3N4JFJMUE6TSJR6Z53C9F' +
                       'SKZAY3EN7G66JPBF5E9S6Y7RQHPWZHSRDQ7XH87PHUJFLJFGD7WNE3Q9P' +
                       'EXMW33LVJBFEUXKNUB6SU7ZYCEX96XT8G27FLUV7XPV4JK64DWDJCX9WV' +
                       '4VL8CK23FQJ28UG9JUZTQJ3DRL32BTJVRD4LVQ6MK9LCE7ZZP925JK7ZD' +
                       '92SCV4DDJJ5EXMVBF';
    end;
  end;

  // Hardware ID
  kv.UseHardwareLocking := cbHardwareID.Checked;
  if kv.UseHardwareLocking then
  begin
    kv.HardwareID := PWideChar(eHardware.Text);
  end;

  // Secure constant (get it from project file)!
  kv.EncryptedConstant := 2113444489;

  dwResult := KG_VerifyRegistrationInfoW(@kv);

  if dwResult = EP_NO_ERROR then
  begin
    sresult := 'Key is valid!'#13#10;
    sresult := format(sresult + 'Creation Date: %s'#13#10, [DateToStr(EncodeDate(kv.CreationYear, kv.CreationMonth, kv.CreationDay))]);
    if kv.UseKeyExpiration then
    begin
      sresult := format(sresult + 'Expiration Date: %s'#13#10, [DateToStr(EncodeDate(kv.ExpirationYear, kv.ExpirationMonth, kv.ExpirationDay))]);
    end;
    if kv.UseRegisterAfter then
    begin
      sresult := format(sresult + 'Register After Date: %s'#13#10, [DateToStr(EncodeDate(kv.RegisterAfterYear, kv.RegisterAfterMonth, kv.RegisterAfterDay))]);
    end;
    if kv.UseRegisterBefore then
    begin
      sresult := format(sresult + 'Register Before Date: %s'#13#10, [DateToStr(EncodeDate(kv.RegisterBeforeYear, kv.RegisterBeforeMonth, kv.RegisterBeforeDay))]);
    end;
    if kv.UseCountyLimit then
    begin
      for i := 0 to length(KEY_COUNTRIES) - 1 do
      begin
        if kv.CountryCode = KEY_COUNTRIES[i].Code then
        begin
          stemp := KEY_COUNTRIES[i].Name;
          break;
        end;
      end;
      sresult := format(sresult + 'Locked to country: %s'#13#10, [stemp]);
    end;
    if kv.UseExecutionsLimit then
    begin
      sresult := format(sresult + 'Executions limit: %d executions'#13#10, [kv.ExecutionsCount]);
    end;
    if kv.UseDaysLimit then
    begin
      sresult := format(sresult + 'Days limit: %d days'#13#10, [kv.DaysCount]);
    end;
    if kv.UseRunTimeLimit then
    begin
      sresult := format(sresult + 'Run-time limit: %d minutes'#13#10, [kv.RunTimeMinutes]);
    end;
    if kv.UseGlobalTimeLimit then
    begin
      sresult := format(sresult + 'Global Time limit: %d minutes'#13#10, [kv.GlobalTimeMinutes]);
    end;
    for i := 1 to NUMBER_OF_CRYPTED_SECTIONS do
    begin
      if kv.EncryptedSections[i] then
      begin
        sresult := format(sresult + 'Unlocked section #%d'#13#10, [i]);
      end;
    end;
  end else
  begin
    case dwResult of
      EP_ERROR_UNKNOWN                 : sresult := 'EP_ERROR_UNKNOWN                ';
      EP_ERROR_KEYBUFFEREMPTY          : sresult := 'EP_ERROR_KEYBUFFEREMPTY         ';
      EP_ERROR_KEYBUFFERISLESS         : sresult := 'EP_ERROR_KEYBUFFERISLESS        ';
      EP_ERROR_REGINFOEMPTY            : sresult := 'EP_ERROR_REGINFOEMPTY           ';
      EP_ERROR_REGINFOTOOLARGE         : sresult := 'EP_ERROR_REGINFOTOOLARGE        ';
      EP_ERROR_PRIVATEKEYISNOTSET      : sresult := 'EP_ERROR_PRIVATEKEYISNOTSET     ';
      EP_ERROR_PUBLICKEYISNOTSET       : sresult := 'EP_ERROR_PUBLICKEYISNOTSET      ';
      EP_ERROR_PRIVATEKEYISINVALID     : sresult := 'EP_ERROR_PRIVATEKEYISINVALID    ';
      EP_ERROR_PUBLICKEYISINVALID      : sresult := 'EP_ERROR_PUBLICKEYISINVALID     ';
      EP_ERROR_KEYMODEISINVALID        : sresult := 'EP_ERROR_KEYMODEISINVALID       ';
      EP_ERROR_KEYBASEISINVALID        : sresult := 'EP_ERROR_KEYBASEISINVALID       ';
      EP_ERROR_CURRENTDATEISINVALID    : sresult := 'EP_ERROR_CURRENTDATEISINVALID   ';
      EP_ERROR_EXPIRATIONDATEISINVALID : sresult := 'EP_ERROR_EXPIRATIONDATEISINVALID';
      EP_ERROR_KEYISINVALID            : sresult := 'EP_ERROR_KEYISINVALID           ';
      EP_ERROR_HARDWAREID              : sresult := 'EP_ERROR_HARDWAREID             ';
      EP_ERROR_HARDWAREBUFFEREMPTY     : sresult := 'EP_ERROR_HARDWAREBUFFEREMPTY    ';
      EP_ERROR_HARDWAREIDINVALIDFORKEY : sresult := 'EP_ERROR_HARDWAREIDINVALIDFORKEY';
      EP_ERROR_PROJECTFILENOTFOUND     : sresult := 'EP_ERROR_PROJECTFILENOTFOUND    ';
      EP_ERROR_INVALIDPROJECTFILE      : sresult := 'EP_ERROR_INVALIDPROJECTFILE     ';
      EP_ERROR_EXECUTIONSNUMBERINVALID : sresult := 'EP_ERROR_EXECUTIONSNUMBERINVALID';
      EP_ERROR_DAYSNUMBERINVALID       : sresult := 'EP_ERROR_DAYSNUMBERINVALID      ';
      EP_ERROR_COUNTRYCODEINVALID      : sresult := 'EP_ERROR_COUNTRYCODEINVALID     ';
      EP_ERROR_RUNTIMEINVALID          : sresult := 'EP_ERROR_RUNTIMEINVALID         ';
      EP_ERROR_GLOBALTIMEINVALID       : sresult := 'EP_ERROR_GLOBALTIMEINVALID      ';
      EP_ERROR_INSTALLBEFOREINVALID    : sresult := 'EP_ERROR_INSTALLBEFOREINVALID   ';
      EP_ERROR_INSTALLAFTERINVALID     : sresult := 'EP_ERROR_INSTALLAFTERINVALID    ';
      else sresult := 'Unknown error';
    end;
  end;
  ShowMessage(sresult);
end;

procedure TfrmMain.btnVerifyPClick(Sender: TObject);
var
  kv : TKeyVerifyParamsW;
  i : integer;
  dwResult : dword;
  stemp : string;
  sresult : string;
begin
  if eUserInfo.Text = '' then
  begin
    ShowMessage('User info field is empty!');
    Exit;
  end;
  if mKey.Text = '' then
  begin
    ShowMessage('Key field is empty!');
    Exit;
  end;

  kv.RegInfo := PWideChar(eUserInfo.Text);
  kv.Key := PWideChar(mKey.Text);
  kv.KeyLen := length(mKey.Text);
  // Hardware ID
  kv.UseHardwareLocking := cbHardwareID.Checked;
  if kv.UseHardwareLocking then
  begin
    kv.HardwareID := PWideChar(eHardware.Text);
  end;

  dwResult := KG_VerifyRegistrationInfoFromProjectW('default.enigma', @kv);

  if dwResult = EP_NO_ERROR then
  begin
    sresult := 'Key is valid!'#13#10;
    sresult := format(sresult + 'Creation Date: %s'#13#10, [DateToStr(EncodeDate(kv.CreationYear, kv.CreationMonth, kv.CreationDay))]);
    if kv.UseKeyExpiration then
    begin
      sresult := format(sresult + 'Expiration Date: %s'#13#10, [DateToStr(EncodeDate(kv.ExpirationYear, kv.ExpirationMonth, kv.ExpirationDay))]);
    end;
    if kv.UseRegisterAfter then
    begin
      sresult := format(sresult + 'Register After Date: %s'#13#10, [DateToStr(EncodeDate(kv.RegisterAfterYear, kv.RegisterAfterMonth, kv.RegisterAfterDay))]);
    end;
    if kv.UseRegisterBefore then
    begin
      sresult := format(sresult + 'Register Before Date: %s'#13#10, [DateToStr(EncodeDate(kv.RegisterBeforeYear, kv.RegisterBeforeMonth, kv.RegisterBeforeDay))]);
    end;
    if kv.UseCountyLimit then
    begin
      for i := 0 to length(KEY_COUNTRIES) - 1 do
      begin
        if kv.CountryCode = KEY_COUNTRIES[i].Code then
        begin
          stemp := KEY_COUNTRIES[i].Name;
          break;
        end;
      end;
      sresult := format(sresult + 'Locked to country: %s'#13#10, [stemp]);
    end;
    if kv.UseExecutionsLimit then
    begin
      sresult := format(sresult + 'Executions limit: %d executions'#13#10, [kv.ExecutionsCount]);
    end;
    if kv.UseDaysLimit then
    begin
      sresult := format(sresult + 'Days limit: %d days'#13#10, [kv.DaysCount]);
    end;
    if kv.UseRunTimeLimit then
    begin
      sresult := format(sresult + 'Run-time limit: %d minutes'#13#10, [kv.RunTimeMinutes]);
    end;
    if kv.UseGlobalTimeLimit then
    begin
      sresult := format(sresult + 'Global Time limit: %d minutes'#13#10, [kv.GlobalTimeMinutes]);
    end;
    for i := 1 to NUMBER_OF_CRYPTED_SECTIONS do
    begin
      if kv.EncryptedSections[i] then
      begin
        sresult := format(sresult + 'Unlocked section #%d'#13#10, [i]);
      end;
    end;
  end else
  begin
    case dwResult of
      EP_ERROR_UNKNOWN                 : sresult := 'EP_ERROR_UNKNOWN                ';
      EP_ERROR_KEYBUFFEREMPTY          : sresult := 'EP_ERROR_KEYBUFFEREMPTY         ';
      EP_ERROR_KEYBUFFERISLESS         : sresult := 'EP_ERROR_KEYBUFFERISLESS        ';
      EP_ERROR_REGINFOEMPTY            : sresult := 'EP_ERROR_REGINFOEMPTY           ';
      EP_ERROR_REGINFOTOOLARGE         : sresult := 'EP_ERROR_REGINFOTOOLARGE        ';
      EP_ERROR_PRIVATEKEYISNOTSET      : sresult := 'EP_ERROR_PRIVATEKEYISNOTSET     ';
      EP_ERROR_PUBLICKEYISNOTSET       : sresult := 'EP_ERROR_PUBLICKEYISNOTSET      ';
      EP_ERROR_PRIVATEKEYISINVALID     : sresult := 'EP_ERROR_PRIVATEKEYISINVALID    ';
      EP_ERROR_PUBLICKEYISINVALID      : sresult := 'EP_ERROR_PUBLICKEYISINVALID     ';
      EP_ERROR_KEYMODEISINVALID        : sresult := 'EP_ERROR_KEYMODEISINVALID       ';
      EP_ERROR_KEYBASEISINVALID        : sresult := 'EP_ERROR_KEYBASEISINVALID       ';
      EP_ERROR_CURRENTDATEISINVALID    : sresult := 'EP_ERROR_CURRENTDATEISINVALID   ';
      EP_ERROR_EXPIRATIONDATEISINVALID : sresult := 'EP_ERROR_EXPIRATIONDATEISINVALID';
      EP_ERROR_KEYISINVALID            : sresult := 'EP_ERROR_KEYISINVALID           ';
      EP_ERROR_HARDWAREID              : sresult := 'EP_ERROR_HARDWAREID             ';
      EP_ERROR_HARDWAREBUFFEREMPTY     : sresult := 'EP_ERROR_HARDWAREBUFFEREMPTY    ';
      EP_ERROR_HARDWAREIDINVALIDFORKEY : sresult := 'EP_ERROR_HARDWAREIDINVALIDFORKEY';
      EP_ERROR_PROJECTFILENOTFOUND     : sresult := 'EP_ERROR_PROJECTFILENOTFOUND    ';
      EP_ERROR_INVALIDPROJECTFILE      : sresult := 'EP_ERROR_INVALIDPROJECTFILE     ';
      EP_ERROR_EXECUTIONSNUMBERINVALID : sresult := 'EP_ERROR_EXECUTIONSNUMBERINVALID';
      EP_ERROR_DAYSNUMBERINVALID       : sresult := 'EP_ERROR_DAYSNUMBERINVALID      ';
      EP_ERROR_COUNTRYCODEINVALID      : sresult := 'EP_ERROR_COUNTRYCODEINVALID     ';
      EP_ERROR_RUNTIMEINVALID          : sresult := 'EP_ERROR_RUNTIMEINVALID         ';
      EP_ERROR_GLOBALTIMEINVALID       : sresult := 'EP_ERROR_GLOBALTIMEINVALID      ';
      EP_ERROR_INSTALLBEFOREINVALID    : sresult := 'EP_ERROR_INSTALLBEFOREINVALID   ';
      EP_ERROR_INSTALLAFTERINVALID     : sresult := 'EP_ERROR_INSTALLAFTERINVALID    ';      
      else sresult := 'Unknown error';
    end;
  end;
  ShowMessage(sresult);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to length(KEY_COUNTRIES) - 1 do
  begin
    comCountries.Items.Add(KEY_COUNTRIES[i].Name);
  end;
  comCountries.ItemIndex := 0;
end;

procedure TfrmMain.cbRegisterAfterClick(Sender: TObject);
begin
  dtpRegisterAfter.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmMain.cbRegisterBeforeClick(Sender: TObject);
begin
  dtpRegisterBefore.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmMain.cbExecutionsClick(Sender: TObject);
begin
  eExecutions.Enabled := TCheckBox(Sender).Checked;
  udExecutions.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmMain.cbDaysClick(Sender: TObject);
begin
  eDays.Enabled := TCheckBox(Sender).Checked;
  udDays.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmMain.cbRuntimeClick(Sender: TObject);
begin
  eRuntime.Enabled := TCheckBox(Sender).Checked;
  udRuntime.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmMain.cbGlobalTimeClick(Sender: TObject);
begin
  eGlobalTime.Enabled := TCheckBox(Sender).Checked;
  udGlobalTime.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmMain.cbCountryClick(Sender: TObject);
begin
  comCountries.Enabled := TCheckBox(Sender).Checked;
end;

end.
