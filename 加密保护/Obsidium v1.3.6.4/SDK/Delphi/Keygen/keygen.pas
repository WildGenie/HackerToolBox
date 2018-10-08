unit keygen;

interface

// structure passed to keyfile creation/verification proc

  type
    TKEYFILE_INFO = packed record
      dwSize:        LongWord; // size of this structure
      lpInfo1:       PChar;    // ptr. to license info
      lpInfo2:       PChar;    // ""
      lpInfo3:       PChar;    // ""
      lpExtInfo:     PChar;    // ""
      lpSytemID:     PChar;    // ptr. to system ID string
      lpExpDate:     Pointer;  // pointer to expiration date (FILETIME structure)
      lpBuffer:      Pointer;  // ptr. to input/output buffer
      lpProjectFile: PChar;    // ptr. to project filename
    end;

// structure passed to GenerateShortKey
    TSHORTKEY_INFO = packed record
      dwSize:        LongWord; // size of this structure
      lpInfo:        PChar;    // pointer to license info string
      lpProjectFile: PChar;    // pointer to project filename
      lpSytemID:     PChar;    // pointer to system ID string
      lpExpDate:     Pointer;  // pointer to expiration date (FILETIME structure)
      lpBuffer:      PChar;    // pointer to input/output buffer
      dwFlags:       LongWord; // flags
      dwCustom:      LongWord; // custom value
    end;


function GenerateKeyfile(var lpInfo: TKEYFILE_INFO): Integer; stdcall;
function VerifyKeyfile(var lpInfo: TKEYFILE_INFO): Integer; stdcall;
function ConvertToString(lpKeyfile: Pointer; dwSize: LongWord; lpBuffer: PChar): Boolean; stdcall;
function ConvertToBin(lpString: PChar; lpBuffer: Pointer): LongWord; stdcall;
function GenerateShortKey(var lpInfo: TSHORTKEY_INFO): Integer; stdcall;
function VerifyShortKey(var lpInfo: TSHORTKEY_INFO): Integer; stdcall;
function GetLicenseHash(lpLicense: Pointer; dwType: LongWord; lpHash: Pointer): Boolean; stdcall;


implementation

const
// error codes returned by GenerateKeyfile and GenerateShortKey
  KEYGEN_ERROR                    = 0;          // internal error
  KEYGEN_INVALID_PARAMETER        = -1;         // invalid parameter passed to function
  KEYGEN_OPF_OPEN_ERROR           = -2;         // error opening project file
  KEYGEN_OPF_INVALID              = -3;         // invalid project file
  KEYGEN_OPF_ERROR                = -4;         // no keys found in project file or read error
  KEYGEN_FAIL_ALLOC               = -5;         // memory allocation error

// error codes returned by VerifyKeyfile and VerifyShortKey
  KEYFILE_VER_OK                  = 0;          // keyfile verification successful
  KEYFILE_VER_FAIL                = 2;          // keyfile is invalid
  KEYFILE_VER_INVALID_PARAM       = -1;         // invalid parameter passed to function
  KEYFILE_VER_OPEN_ERROR          = -2;         // error opening project file
  KEYFILE_VER_OPF_INVALID         = -3;         // invalid project file
  KEYFILE_VER_FAIL_ALLOC          = -4;         // memory allocation error

// flags passed to GetLicenseHash
  LICENSE_BIN                     = 0;          // binary key
  LICENSE_TEXT                    = 1;          // text key
  LICENSE_SHORT                   = 2;          // short key

function GenerateKeyfile; external 'keygen.dll';
function VerifyKeyfile; external 'keygen.dll';
function ConvertToString; external 'keygen.dll';
function ConvertToBin; external 'keygen.dll';
function GenerateShortKey; external 'keygen.dll';
function VerifyShortKey; external 'keygen.dll';
function GetLicenseHash; external 'keygen.dll';

end.