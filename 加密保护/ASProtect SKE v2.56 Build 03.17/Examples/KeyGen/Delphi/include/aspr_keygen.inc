
const

    kgERROR_SUCCESS             =  0;
    kgERROR_KG_ERROR            =  2;
    kgERROR_MODE_UNKNOWN        =  3;
    kgERROR_REGNAME_ERROR       =  4;
    kgERROR_SIGNATURE_ERROR     =  5;
    kgERROR_BUFFER_TOO_SMALL    =  6;
    kgERROR_CONSTANTS_UNDEFINED =  7;
    kgERROR_HARDWAREID_ERROR    =  8;

type
    TKeyDate = packed record
      Day   : Byte;
      Month : Byte;
      Year  : WORD;
    end;

    TParams = packed record
      RegName         : PChar;     // Registration name

      HardwareID      : PChar;     // HardwareID
      ExpirationDate  : TKeyDate;  // Expiration date
      EncryptionConst : DWORD;     // Constant for encryption

      ModeID          : Byte;      // Mode number (1..15)
      SignatureBits   : Byte;      // Signature size in bits

      Reserved1       : Byte;
      Reserved2       : Byte;

      C1,                          // Constants from project file
      C3,                          // (Activation Keys section)
      C6,
      C7              : PChar;

      RegKey          : PChar;     // Registration key buffer
      RegKeySize      : DWORD;     // Key buffer size
      RealKeySize     : DWORD;     // Registration key size
    end;

