unit KeyUser;
{
  element 5 AG / ShareIt!
  key generator interface
  version 2.6

  IMPLEMENT YOUR CODE HERE!
}

interface

{ KEYGEN.dll prototypes }
{$I INCLUDE\KEYGEN.INC}

// key generator title
const Title = 'PELock Delphi Binary Key Generator Example';

function GenerateBinKey(var name, mime, bin: string): integer;

implementation

uses
  KeyIntfBin, SysUtils;

// implement your key generator here
function GenerateBinKey(var name, mime, bin: string): integer;
var
  iKeySize    : integer;
  Status      : integer;
  ProjectPath : string;

begin
  name := 'key.lic';                   // default license key file name
  mime := 'application/octet-stream';  // data type

  SetLength(bin,4096);

  // set project directory path
  ProjectPath := PChar(ExtractFilePath(ParamStr(0))+'test.plk');

  // generate key data
  Status := Keygen( PChar(Value('REG_NAME')),  // user name (PChar)
                    0,                         // additional key data (DWORD)
                    Nil,                       // hardware id (PChar)
                    Nil,                       // key expiration date (SYSTEMTIME)
                    PChar(bin),                // buffer for key data (array of byte)
                    @iKeySize,                 // key data size (output) (DWORD)
                    PChar(ProjectPath),        // project file path (PChar)
                    FALSE);                    // update project flag (BOOL)

  // set valid key size
  SetLength(bin,iKeySize);

  case Status of
  // key data successfully generated
  KEYGEN_OK       : result:= ERC_SUCCESS_BIN;

  // initialization error
  KEYGEN_INIT_ERR : result:= ERC_INTERNAL;

  // invalid input data
  KEYGEN_DATA_ERR : result:= ERC_BAD_INPUT;

  else
  // internal error
  result:= ERC_INTERNAL;
  end;


end;

end.



