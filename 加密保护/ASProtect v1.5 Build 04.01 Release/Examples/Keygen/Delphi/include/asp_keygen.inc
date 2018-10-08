
  type
    TKeyDate = packed record
      Day   : Byte;
      Month : Byte;
      Year  : WORD;
    end;

    TParams = packed record
      RegInfo         : Pointer;  // registration info
      RegInfoLen      : DWORD;

      HardwareID,                 // hardware ID
      A,                          // \
      E,                          // constants from project file (Key section)
      N               : PChar;    // /

      RegKey          : Pointer;  // buffer for registration key
      RegKeySize      : DWORD;    // size of a buffer for registration key
      ExpirationDate  : TKeyDate;
    end;

  function  CheckHardwareID( HardwareID : PChar ) : Boolean;stdcall;external 'keygen.dll';
  function  RegistrationKeyGenerate(var Params : TParams) : DWORD;stdcall;external 'keygen.dll';
  function  RegistrationKeySave(FileName, RegistrySubKey, RegistryKey, RegistrationKey : PChar) : DWORD;stdcall;external 'keygen.dll';
  function  RegistrationKeyGenerateProject(lpProjectFileName, lpRegInfo, lpHardwareID, lpRegKeyFileName: PChar) : DWORD;stdcall;external 'keygen.dll';
