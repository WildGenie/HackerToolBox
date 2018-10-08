unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    lRegKey: TLabel;
    btnGenerate: TButton;
    btnExit: TButton;
    eRegKey: TEdit;
    lRegName: TLabel;
    eRegName: TEdit;
    procedure btnGenerateClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

{$I include\aspr_KeyGen.inc}


function RegistrationKeyGenerate( var Params : TParams ): DWORD; stdcall; external 'keygen.dll';

  
//------------------------------------------------------------------------------

Function GenerateKey( var KeyStr, NameStr : String; Var Res : DWORD ): Boolean;
var
  Params  : TParams;
  RegData : array[1..100] of Byte;

begin

  FillChar(Params,SizeOf(Params),0);
  With Params do
  begin

    // Registration name

    RegName := PChar(NameStr);

    // Mode number (1..15)

    ModeID  := 2;

    // Expiration date

    ExpirationDate.Day   := 0;
    ExpirationDate.Month := 0;
    ExpirationDate.Year  := 0;

    // Constant for encryption

    EncryptionConst := 699935518;

    // HardwareID

    HardwareID      := '';

    // Signature size in bits

    SignatureBits   := 96;

    // Constants from project file

    C1 := 
     'AC08B45461D28EB';
    C3 := 
     'A93A5FB8C78D04F1';
    C6 := 
     '26D6BB434014649375231C68A655B81D314AEAF3CE32C6DC8BD'+
     'CBCB9EEDC61EBA3C4A2119685E22205B782C88BFAF21FE98D4'+
     '474FBDB1AFA539B05F09EF60DDF5BA8224161942B9582D37DD'+
     'D624A97C373E5BB33BFC2335A674E4839D72253BA62B97F0B3'+
     '6BCA5B4001353FED5D28FED31FA53C343F381BE121E106F669'+
     '5B3CB';
    C7 := 
     '1726DAE1BD153379F1FB0F4F2E00C06D39A733B7715D108EF0C'+
     '518A11DF528394E37F744E1CEE1B4B411FEAFD7DDE0E281042'+
     'A728F85FEDB91C8C2ECECF31873C77D68053D550EB8549FDE2'+
     'C1885F40B68E1F0FF3383B747882AA517EB6F9061E23650222'+
     '85F1B1BEA91F83E2C4CD66BF0C636FC79B81A738D65D6F5BF8'+
     '0234D7';

    RegKey := @RegData[1];          // Buffer for registration key
    RegKeySize := SizeOf(RegData);  // Size of a buffer for reg. key

    // Generating...

    Res := RegistrationKeyGenerate( Params );
    Result := (Res = kgERROR_SUCCESS);
    If Result then SetString( KeyStr, RegKey, RealKeySize );
  end;

end;

//------------------------------------------------------------------------------

procedure TfrmMain.btnGenerateClick(Sender: TObject);
Var
  KeyStr  : String;
  NameStr : String;
  Res     : DWORD;
  ResStr  : String;

begin

  NameStr := eRegName.Text;
  If not GenerateKey( KeyStr, NameStr, Res ) then
  begin

    case Res of
     kgERROR_KG_ERROR            : ResStr := 'Key generator error!';
     kgERROR_MODE_UNKNOWN        : ResStr := 'Unknown mode number!';
     kgERROR_REGNAME_ERROR       : ResStr := 'Incorrect registration name!';
     kgERROR_SIGNATURE_ERROR     : ResStr := 'Unknown mode signature!';
     kgERROR_BUFFER_TOO_SMALL    : ResStr := 'Result buffer too small!';
     kgERROR_CONSTANTS_UNDEFINED : ResStr := 'Incorrect constants!';
     kgERROR_HARDWAREID_ERROR    : ResStr := 'Invalid HardwareID key!';
    else
     ResStr := 'Unknown error!';
    end;

    MessageBox(Handle,PChar(ResStr),'Error',0);
  end else
    eRegKey.Text := KeyStr;

end;

//------------------------------------------------------------------------------

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

end.