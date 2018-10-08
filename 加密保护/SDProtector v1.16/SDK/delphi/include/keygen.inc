
  type
    TKeyData = packed record
      lpUserName        : PChar;
      lpOrderID         : PChar;
      lpHardwareID      : PChar;
      lpExpVersion      : PChar;
      lpExpDate         : PSystemTime;
    end;

  function  VerifyTextKey(  var pKeyData : TKeyData; pKeyText:PChar ) : Integer;stdcall; external 'keygen.dll';
  function  GenerateTextKey(var pKeyData : TKeyData; pKeyText:PChar; iMaxLen:Integer) : Integer;stdcall;external 'keygen.dll';
  function  GenerateKeyFile(var pKeyData : TKeyData; pKeyFileName:PChar) : Integer;stdcall;external 'keygen.dll';

{ Keygen returned values }

const
KEYGEN_OK                = $00000000;

{error code returned by function above}
ERR_DLL_INIT_ERROR       = $00000001;
ERR_NO_USERNAME	         = $00000002;
ERR_NO_ORDERID           = $00000003;
ERR_INVALID_EXP_DATE     = $00000004;
ERR_INSUFFICIENT_BUFFER  = $00000005;
ERR_CANNOT_CREATE_FILE   = $00000006;
ERR_WRITEFILE_FAILED     = $00000007;

