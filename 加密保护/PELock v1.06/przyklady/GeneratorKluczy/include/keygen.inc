
{ PELock keygen api for Borland Delphi}
function Keygen(lpUserName:PChar;iAdditionalKeyData:integer;lpHardwareId:PChar;lpKeyExpirationDate:Pointer;lpKeyData:Pointer; iKeyData:Pointer; lpProjectFileName:PChar;bUpdateProjectFlag:Boolean) : integer;stdcall;external 'keygen.dll';

{ Keygen returned values }

const
{$EXTERNALSYM KEYGEN_OK}
KEYGEN_OK       = $00000001;

{$EXTERNALSYM KEYGEN_DATA_ERR}
KEYGEN_DATA_ERR = $00000002;

{$EXTERNALSYM KEYGEN_INIT_ERR}
KEYGEN_INIT_ERR = $00000003;

