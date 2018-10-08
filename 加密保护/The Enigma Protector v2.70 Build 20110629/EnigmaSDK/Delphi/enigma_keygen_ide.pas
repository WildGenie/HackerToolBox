unit enigma_keygen_ide;

interface

Uses Windows;

{$A4+}

const
  NUMBER_OF_CRYPTED_SECTIONS = 16;

  // Key generation/verification results
  EP_NO_ERROR                      = 0;
  EP_ERROR_UNKNOWN                 = 1;
  EP_ERROR_KEYBUFFEREMPTY          = 2;
  EP_ERROR_KEYBUFFERISLESS         = 3;
  EP_ERROR_REGINFOEMPTY            = 4;
  EP_ERROR_REGINFOTOOLARGE         = 5;
  EP_ERROR_PRIVATEKEYISNOTSET      = 6;
  EP_ERROR_PUBLICKEYISNOTSET       = 7;
  EP_ERROR_PRIVATEKEYISINVALID     = 8;
  EP_ERROR_PUBLICKEYISINVALID      = 9;
  EP_ERROR_KEYMODEISINVALID        = 10;
  EP_ERROR_KEYBASEISINVALID        = 11;
  EP_ERROR_CURRENTDATEISINVALID    = 12;
  EP_ERROR_EXPIRATIONDATEISINVALID = 13;
  EP_ERROR_KEYISINVALID            = 14;
  EP_ERROR_HARDWAREID              = 15;
  EP_ERROR_HARDWAREBUFFEREMPTY     = 16;
  EP_ERROR_HARDWAREIDINVALIDFORKEY = 17;
  EP_ERROR_PROJECTFILENOTFOUND     = 18;
  EP_ERROR_INVALIDPROJECTFILE      = 19;
  EP_ERROR_EXECUTIONSNUMBERINVALID = 20;
  EP_ERROR_DAYSNUMBERINVALID       = 21;
  EP_ERROR_COUNTRYCODEINVALID      = 22;
  EP_ERROR_RUNTIMEINVALID          = 23;
  EP_ERROR_GLOBALTIMEINVALID       = 24;
  EP_ERROR_INSTALLBEFOREINVALID    = 25;
  EP_ERROR_INSTALLAFTERINVALID     = 26;



  // Registartion mode types
  RM_512  = 0;
  RM_768  = 1;
  RM_1024 = 2;
  RM_2048 = 3;
  RM_3072 = 4;
  RM_4096 = 5;

  // Registration Base types
  RB_2  = 0;
  RB_8  = 1;
  RB_16 = 2;
  RB_32 = 3;
  RB_64 = 4;

  // Counties code
  CN_AFGHANISTAN = 114;
  CN_ALBANIA = 1;
  CN_ALGERIA = 2;
  CN_ARGENTINA = 3;
  CN_ARMENIA = 4;
  CN_AUSTRALIA = 5;
  CN_AUSTRIA = 6;
  CN_AZERBAIJAN = 7;
  CN_BAHRAIN = 8;
  CN_BANGLADESH = 115;
  CN_BELARUS = 9;
  CN_BELGIUM = 10;
  CN_BELIZE = 11;
  CN_BOLIVIA = 116;
  CN_BOSNIA = 117;
  CN_BRAZIL = 13;
  CN_BRUNEI = 14;
  CN_BULGARIA = 15;
  CN_CAMBODIA = 16;
  CN_CANADA = 17;
  CN_CARRIBEAN = 118;
  CN_CHILE = 20;
  CN_CHINA = 21;
  CN_COLOMBIA = 22;
  CN_COSTARICA = 23;
  CN_CROATIA = 24;
  CN_CZECH = 25;
  CN_DENMARK = 26;
  CN_DOMINICAN = 27;
  CN_ECUADOR = 28;
  CN_EGYPT = 29;
  CN_ELSALVADOR = 30;
  CN_ESTONIA = 31;
  CN_ETHIOPIA = 119;
  CN_FAROE = 32;
  CN_FINLAND = 33;
  CN_FRANCE = 34;
  CN_GEORGIA = 35;
  CN_GERMANY = 36;
  CN_GREECE = 37;
  CN_GREENLAND = 120;
  CN_GUATEMALA = 38;
  CN_HONDURAS = 39;
  CN_HONGKONG = 40;
  CN_HUNGARU = 41;
  CN_ICELAND = 42;
  CN_INDIA = 43;
  CN_INDONESIA = 44;
  CN_IRAN = 45;
  CN_IRAQ = 46;
  CN_IRELAND = 47;
  CN_ISRAEL = 48;
  CN_ITALY = 49;
  CN_JAMAICA = 50;
  CN_JAPAN = 51;
  CN_JORDAN = 52;
  CN_KAZAKHSTAN = 53;
  CN_KENYA = 54;
  CN_KOREA = 56;
  CN_KUWAIT = 57;
  CN_KYRGYZSTAN = 58;
  CN_LAOS = 121;
  CN_LATVIA = 59;
  CN_LEBANON = 60;
  CN_LIBYAN = 122;
  CN_LIECHTENSTEIN = 62;
  CN_LITHUANIA = 63;
  CN_LUXEMBOURG = 64;
  CN_MACAO = 65;
  CN_MACEDONIA = 66;
  CN_MALAYSIA = 67;
  CN_MALDIVES = 123;
  CN_MALTA = 124;
  CN_MEXOCI = 68;
  CN_MONACO = 70;
  CN_MONGOLIA = 71;
  CN_MONTENEGRO = 125;
  CN_MOROCCO = 72;
  CN_NEPAL = 126;
  CN_NETHERLANDS = 73;
  CN_NEWZEALAND = 74;
  CN_NICARAGUA = 75;
  CN_NIGERIA = 127;
  CN_NORWAY = 76;
  CN_OMAN = 77;
  CN_PAKISTAN = 78;
  CN_PANAMA = 79;
  CN_PARAGUAY = 80;
  CN_PERY = 81;
  CN_PHILIPPINES = 82;
  CN_POLAND = 83;
  CN_PORTUGAL = 84;
  CN_PUERTORICO = 85;
  CN_QATAR = 86;
  CN_ROMANIA = 87;
  CN_RUSSIA = 88;
  CN_RWANDA = 128;
  CN_SAUDIARABIA = 89;
  CN_SENEGAL = 129;
  CN_SERBIA = 130;
  CN_SERBIAMONTENEGRO = 90;
  CN_SINGAROPE = 91;
  CN_SLOVAKIA = 92;
  CN_SLOVENIA = 93;
  CN_SOUTHAFRICA = 94;
  CN_SPAIN = 95;
  CN_SRILANKA = 131;
  CN_SWEDEN = 96;
  CN_SWITZERLAND = 97;
  CN_SYRIAN = 132;
  CN_TAIWAN = 98;
  CN_TAJIKISTAN = 99;
  CN_THAILAND = 100;
  CN_TRINIDADTOBAGO = 101;
  CN_TUNISIA = 102;
  CN_TURKEY = 103;
  CN_TURKMENISTAN = 133;
  CN_UKRAINE = 104;
  CN_UAE = 105;
  CN_UNITEDKINGDOM = 106;
  CN_USA = 107;
  CN_URUGUAY = 108;
  CN_UZBEKISTAN = 109;
  CN_VENEZUELA = 110;
  CN_VIETNAM = 111;
  CN_YEMEN = 112;
  CN_ZIMBABWE = 113;

type
  TKeyCountries = record
    Name : string;
    Code : integer;
  end;

const
  KEY_COUNTRIES : array [0..126] of TKeyCountries =
  (
    (Name : 'Afghanistan'               ; Code : CN_AFGHANISTAN      ),
    (Name : 'Albania'                   ; Code : CN_ALBANIA          ),
    (Name : 'Algeria'                   ; Code : CN_ALGERIA          ),
    (Name : 'Argentina'                 ; Code : CN_ARGENTINA        ),
    (Name : 'Armenia'                   ; Code : CN_ARMENIA          ),
    (Name : 'Australia'                 ; Code : CN_AUSTRALIA        ),
    (Name : 'Austria'                   ; Code : CN_AUSTRIA          ),
    (Name : 'Azerbaijan'                ; Code : CN_AZERBAIJAN       ),
    (Name : 'Bahrain'                   ; Code : CN_BAHRAIN          ),
    (Name : 'Bangladesh'                ; Code : CN_BANGLADESH       ),
    (Name : 'Belarus'                   ; Code : CN_BELARUS          ),
    (Name : 'Belgium'                   ; Code : CN_BELGIUM          ),
    (Name : 'Belize'                    ; Code : CN_BELIZE           ),
    (Name : 'Bolivia'                   ; Code : CN_BOLIVIA          ),
    (Name : 'Bosnia and Herzegovina'    ; Code : CN_BOSNIA           ),
    (Name : 'Brazil'                    ; Code : CN_BRAZIL           ),
    (Name : 'Brunei Darussalam'         ; Code : CN_BRUNEI           ),
    (Name : 'Bulgaria'                  ; Code : CN_BULGARIA         ),
    (Name : 'Cambodia'                  ; Code : CN_CAMBODIA         ),
    (Name : 'Canada'                    ; Code : CN_CANADA           ),
    (Name : 'Caribbean'                 ; Code : CN_CARRIBEAN        ),
    (Name : 'Chile'                     ; Code : CN_CHILE            ),
    (Name : 'China'                     ; Code : CN_CHINA            ),
    (Name : 'Colombia'                  ; Code : CN_COLOMBIA         ),
    (Name : 'Costa Rica'                ; Code : CN_COSTARICA        ),
    (Name : 'Croatia'                   ; Code : CN_CROATIA          ),
    (Name : 'Czech Republic'            ; Code : CN_CZECH            ),
    (Name : 'Denmark'                   ; Code : CN_DENMARK          ),
    (Name : 'Dominican Republic'        ; Code : CN_DOMINICAN        ),
    (Name : 'Ecuador'                   ; Code : CN_ECUADOR          ),
    (Name : 'Egypt'                     ; Code : CN_EGYPT            ),
    (Name : 'El Salvador'               ; Code : CN_ELSALVADOR       ),
    (Name : 'Estonia'                   ; Code : CN_ESTONIA          ),
    (Name : 'Ethiopia'                  ; Code : CN_ETHIOPIA         ),
    (Name : 'Faroe Islands'             ; Code : CN_FAROE            ),
    (Name : 'Finland'                   ; Code : CN_FINLAND          ),
    (Name : 'France'                    ; Code : CN_FRANCE           ),
    (Name : 'Georgia'                   ; Code : CN_GEORGIA          ),
    (Name : 'Germany'                   ; Code : CN_GERMANY          ),
    (Name : 'Greece'                    ; Code : CN_GREECE           ),
    (Name : 'Greenland'                 ; Code : CN_GREENLAND        ),
    (Name : 'Guatemala'                 ; Code : CN_GUATEMALA        ),
    (Name : 'Honduras'                  ; Code : CN_HONDURAS         ),
    (Name : 'Hong Kong'                 ; Code : CN_HONGKONG         ),
    (Name : 'Hungary'                   ; Code : CN_HUNGARU          ),
    (Name : 'Iceland'                   ; Code : CN_ICELAND          ),
    (Name : 'India'                     ; Code : CN_INDIA            ),
    (Name : 'Indonesia'                 ; Code : CN_INDONESIA        ),
    (Name : 'Iran'                      ; Code : CN_IRAN             ),
    (Name : 'Iraq'                      ; Code : CN_IRAQ             ),
    (Name : 'Ireland'                   ; Code : CN_IRELAND          ),
    (Name : 'Israel'                    ; Code : CN_ISRAEL           ),
    (Name : 'Italy'                     ; Code : CN_ITALY            ),
    (Name : 'Jamaica'                   ; Code : CN_JAMAICA          ),
    (Name : 'Japan'                     ; Code : CN_JAPAN            ),
    (Name : 'Jordan'                    ; Code : CN_JORDAN           ),
    (Name : 'Kazakhstan'                ; Code : CN_KAZAKHSTAN       ),
    (Name : 'Kenya'                     ; Code : CN_KENYA            ),
    (Name : 'Korea'                     ; Code : CN_KOREA            ),
    (Name : 'Kuwait'                    ; Code : CN_KUWAIT           ),
    (Name : 'Kyrgyzstan'                ; Code : CN_KYRGYZSTAN       ),
    (Name : 'Laos'                      ; Code : CN_LAOS             ),
    (Name : 'Latvia'                    ; Code : CN_LATVIA           ),
    (Name : 'Lebanon'                   ; Code : CN_LEBANON          ),
    (Name : 'Libyan'                    ; Code : CN_LIBYAN           ),
    (Name : 'Liechtenstein'             ; Code : CN_LIECHTENSTEIN    ),
    (Name : 'Lithuania'                 ; Code : CN_LITHUANIA        ),
    (Name : 'Luxembourg'                ; Code : CN_LUXEMBOURG       ),
    (Name : 'Macao'                     ; Code : CN_MACAO            ),
    (Name : 'Macedonia'                 ; Code : CN_MACEDONIA        ),
    (Name : 'Malaysia'                  ; Code : CN_MALAYSIA         ),
    (Name : 'Maldives'                  ; Code : CN_MALDIVES         ),
    (Name : 'Malta'                     ; Code : CN_MALTA            ),
    (Name : 'Mexico'                    ; Code : CN_MEXOCI           ),
    (Name : 'Monaco'                    ; Code : CN_MONACO           ),
    (Name : 'Mongolia'                  ; Code : CN_MONGOLIA         ),
    (Name : 'Montenegro'                ; Code : CN_MONTENEGRO       ),
    (Name : 'Morocco'                   ; Code : CN_MOROCCO          ),
    (Name : 'Nepal'                     ; Code : CN_NEPAL            ),
    (Name : 'Netherlands'               ; Code : CN_NETHERLANDS      ),
    (Name : 'New Zealand'               ; Code : CN_NEWZEALAND       ),
    (Name : 'Nicaragua'                 ; Code : CN_NICARAGUA        ),
    (Name : 'Nigeria'                   ; Code : CN_NIGERIA          ),
    (Name : 'Norway'                    ; Code : CN_NORWAY           ),
    (Name : 'Oman'                      ; Code : CN_OMAN             ),
    (Name : 'Pakistan'                  ; Code : CN_PAKISTAN         ),
    (Name : 'Panama'                    ; Code : CN_PANAMA           ),
    (Name : 'Paraguay'                  ; Code : CN_PARAGUAY         ),
    (Name : 'Peru'                      ; Code : CN_PERY             ),
    (Name : 'Philippines'               ; Code : CN_PHILIPPINES      ),
    (Name : 'Poland'                    ; Code : CN_POLAND           ),
    (Name : 'Portugal'                  ; Code : CN_PORTUGAL         ),
    (Name : 'Puerto Rico'               ; Code : CN_PUERTORICO       ),
    (Name : 'Qatar'                     ; Code : CN_QATAR            ),
    (Name : 'Romania'                   ; Code : CN_ROMANIA          ),
    (Name : 'Russia'                    ; Code : CN_RUSSIA           ),
    (Name : 'Rwanda'                    ; Code : CN_RWANDA           ),
    (Name : 'Saudi Arabia'              ; Code : CN_SAUDIARABIA      ),
    (Name : 'Senegal'                   ; Code : CN_SENEGAL          ),
    (Name : 'Serbia'                    ; Code : CN_SERBIA           ),
    (Name : 'Serbia and Montenegro'     ; Code : CN_SERBIAMONTENEGRO ),
    (Name : 'Singapore'                 ; Code : CN_SINGAROPE        ),
    (Name : 'Slovakia'                  ; Code : CN_SLOVAKIA         ),
    (Name : 'Slovenia'                  ; Code : CN_SLOVENIA         ),
    (Name : 'South Africa'              ; Code : CN_SOUTHAFRICA      ),
    (Name : 'Spain'                     ; Code : CN_SPAIN            ),
    (Name : 'Sri Lanka'                 ; Code : CN_SRILANKA         ),
    (Name : 'Sweden'                    ; Code : CN_SWEDEN           ),
    (Name : 'Switzerland'               ; Code : CN_SWITZERLAND      ),
    (Name : 'Syrian'                    ; Code : CN_SYRIAN           ),
    (Name : 'Taiwan'                    ; Code : CN_TAIWAN           ),
    (Name : 'Tajikistan'                ; Code : CN_TAJIKISTAN       ),
    (Name : 'Thailand'                  ; Code : CN_THAILAND         ),
    (Name : 'Trinidad and Tobago'       ; Code : CN_TRINIDADTOBAGO   ),
    (Name : 'Tunisia'                   ; Code : CN_TUNISIA          ),
    (Name : 'Turkey'                    ; Code : CN_TURKEY           ),
    (Name : 'Turkmenistan'              ; Code : CN_TURKMENISTAN     ),
    (Name : 'Ukraine'                   ; Code : CN_UKRAINE          ),
    (Name : 'United Arab Emirates'      ; Code : CN_UAE              ),
    (Name : 'United Kingdom'            ; Code : CN_UNITEDKINGDOM    ),
    (Name : 'United States'             ; Code : CN_USA              ),
    (Name : 'Uruguay'                   ; Code : CN_URUGUAY          ),
    (Name : 'Uzbekistan'                ; Code : CN_UZBEKISTAN       ),
    (Name : 'Venezuela'                 ; Code : CN_VENEZUELA        ),
    (Name : 'Viet Nam'                  ; Code : CN_VIETNAM          ),
    (Name : 'Yemen'                     ; Code : CN_YEMEN            ),
    (Name : 'Zimbabwe'                  ; Code : CN_ZIMBABWE         )
  );

type
  TKeyVerifyParams = record
    RegInfo             : pointer;  // {in} registration info/name
    RegInfoLen          : dword;    // {in} registration info/name size
    KeyMode             : dword;    // {in} key generation mode (~RSA ???)
    KeyBase             : dword;    // {in} key output base (Base ???)
    Key                 : pointer;  // {in} buffer for registration key
    KeyLen              : dword;    // {in} registration key size
    CreationYear        : dword;    // {out} key creation year
    CreationMonth       : dword;    // {out} key creation month
    CreationDay         : dword;    // {out} key creation day
    UseKeyExpiration    : boolean;  // {out} has key expiration date?
    ExpirationYear      : dword;    // {out} key expiration year
    ExpirationMonth     : dword;    // {out} key expiration month
    ExpirationDay       : dword;    // {out} key expiration day
    UseHardwareLocking  : boolean;  // {in/out} hardware locked key
    HardwareID          : PAnsiChar;// {in} pointer to null terminated hardware string
    UseExecutionsLimit  : boolean;  // {out} limit key by executions?
    ExecutionsCount     : dword;    // {out} number of executions
    UseDaysLimit        : boolean;  // {out} limit key by days?
    DaysCount           : dword;    // {out} number of days
    UseRunTimeLimit     : boolean;  // {out} limit key by run time?
    RunTimeMinutes      : dword;    // {out} run time minutes
    UseGlobalTimeLimit  : boolean;  // {out} limit key by global time?
    GlobalTimeMinutes   : dword;    // {out} global time minutes
    UseCountyLimit      : boolean;  // {out} limit key by country?
    CountryCode         : dword;    // {out} country code
    UseRegisterAfter    : boolean;  // {out} register key after date?
    RegisterAfterYear   : dword;    // {out} register after year
    RegisterAfterMonth  : dword;    // {out} register after month
    RegisterAfterDay    : dword;    // {out} register after day
    UseRegisterBefore   : boolean;  // {out} register key before date?
    RegisterBeforeYear  : dword;    // {out} register before year
    RegisterBeforeMonth : dword;    // {out} register before month
    RegisterBeforeDay   : dword;    // {out} register before day
    EncryptedConstant   : dword;    // Encryption Constant - should be extracted from project file
    EncryptedSections   : array [1..NUMBER_OF_CRYPTED_SECTIONS] of boolean; // Crypted sections
    PublicKey           : PAnsiChar;   // Public Key - should be extracted from project file
  end;
  PKeyVerifyParams = ^TKeyVerifyParams;

  TKeyVerifyParamsA = record
    RegInfo             : PAnsiChar;  // {in} registration info/name
    KeyMode             : dword;    // {in} key generation mode (~RSA ???)
    KeyBase             : dword;    // {in} key output base (Base ???)
    Key                 : pointer;  // {in} buffer with ansi string registration key
    KeyLen              : dword;    // {in} registration key size
    CreationYear        : dword;    // {out} key creation year
    CreationMonth       : dword;    // {out} key creation month
    CreationDay         : dword;    // {out} key creation day
    UseKeyExpiration    : boolean;  // {out} has key expiration date?
    ExpirationYear      : dword;    // {out} key expiration year
    ExpirationMonth     : dword;    // {out} key expiration month
    ExpirationDay       : dword;    // {out} key expiration day
    UseHardwareLocking  : boolean;  // {in/out} hardware locked key
    HardwareID          : PAnsiChar;// {in} pointer to null terminated hardware string
    UseExecutionsLimit  : boolean;  // {out} limit key by executions?
    ExecutionsCount     : dword;    // {out} number of executions
    UseDaysLimit        : boolean;  // {out} limit key by days?
    DaysCount           : dword;    // {out} number of days
    UseRunTimeLimit     : boolean;  // {out} limit key by run time?
    RunTimeMinutes      : dword;    // {out} run time minutes
    UseGlobalTimeLimit  : boolean;  // {out} limit key by global time?
    GlobalTimeMinutes   : dword;    // {out} global time minutes
    UseCountyLimit      : boolean;  // {out} limit key by country?
    CountryCode         : dword;    // {out} country code
    UseRegisterAfter    : boolean;  // {out} register key after date?
    RegisterAfterYear   : dword;    // {out} register after year
    RegisterAfterMonth  : dword;    // {out} register after month
    RegisterAfterDay    : dword;    // {out} register after day
    UseRegisterBefore   : boolean;  // {out} register key before date?
    RegisterBeforeYear  : dword;    // {out} register before year
    RegisterBeforeMonth : dword;    // {out} register before month
    RegisterBeforeDay   : dword;    // {out} register before day
    EncryptedConstant   : dword;    // Encryption Constant - should be extracted from project file
    EncryptedSections   : array [1..NUMBER_OF_CRYPTED_SECTIONS] of boolean; // Crypted sections
    PublicKey           : PAnsiChar;   // Public Key - should be extracted from project file
  end;
  PKeyVerifyParamsA = ^TKeyVerifyParamsA;

  TKeyVerifyParamsW = record
    RegInfo             : PWideChar;  // {in} registration info/name
    KeyMode             : dword;    // {in} key generation mode (~RSA ???)
    KeyBase             : dword;    // {in} key output base (Base ???)
    Key                 : pointer;  // {in} buffer with unicode string registration key
    KeyLen              : dword;    // {in} registration key size
    CreationYear        : dword;    // {out} key creation year
    CreationMonth       : dword;    // {out} key creation month
    CreationDay         : dword;    // {out} key creation day
    UseKeyExpiration    : boolean;  // {out} has key expiration date?
    ExpirationYear      : dword;    // {out} key expiration year
    ExpirationMonth     : dword;    // {out} key expiration month
    ExpirationDay       : dword;    // {out} key expiration day
    UseHardwareLocking  : boolean;  // {in/out} hardware locked key
    HardwareID          : PWideChar;// {in} pointer to null terminated hardware string
    UseExecutionsLimit  : boolean;  // {out} limit key by executions?
    ExecutionsCount     : dword;    // {out} number of executions
    UseDaysLimit        : boolean;  // {out} limit key by days?
    DaysCount           : dword;    // {out} number of days
    UseRunTimeLimit     : boolean;  // {out} limit key by run time?
    RunTimeMinutes      : dword;    // {out} run time minutes
    UseGlobalTimeLimit  : boolean;  // {out} limit key by global time?
    GlobalTimeMinutes   : dword;    // {out} global time minutes
    UseCountyLimit      : boolean;  // {out} limit key by country?
    CountryCode         : dword;    // {out} country code
    UseRegisterAfter    : boolean;  // {out} register key after date?
    RegisterAfterYear   : dword;    // {out} register after year
    RegisterAfterMonth  : dword;    // {out} register after month
    RegisterAfterDay    : dword;    // {out} register after day
    UseRegisterBefore   : boolean;  // {out} register key before date?
    RegisterBeforeYear  : dword;    // {out} register before year
    RegisterBeforeMonth : dword;    // {out} register before month
    RegisterBeforeDay   : dword;    // {out} register before day
    EncryptedConstant   : dword;    // Encryption Constant - should be extracted from project file
    EncryptedSections   : array [1..NUMBER_OF_CRYPTED_SECTIONS] of boolean; // Crypted sections
    PublicKey           : PWideChar;   // Public Key - should be extracted from project file
  end;
  PKeyVerifyParamsW = ^TKeyVerifyParamsW;

  TKeyGenParams = record
    KeyMode             : dword;    // {in} key generation mode (~RSA ???)
    KeyBase             : dword;    // {in} key output base (Base ???)
    KeyWithHyphens      : boolean;  // {in} add hyphens to the key?
    Key                 : pointer;  // {in} buffer for registration key
    KeyLen              : dword;    // {in} registration key size
    RegInfo             : pointer;  // {in} registration info/name
    RegInfoLen          : dword;    // {in} registration info/name size
    UseKeyExpiration    : boolean;  // {in} use key expiration?
    ExpirationYear      : dword;    // {in} key expiration year
    ExpirationMonth     : dword;    // {in} key expiration month
    ExpirationDay       : dword;    // {in} key expiration day
    UseHardwareLocking  : boolean;  // {in} is key hardware locked?
    HardwareID          : PAnsiChar;// {in} pointer to null terminated hardware string
    UseExecutionsLimit  : boolean;  // {in} limit key by executions?
    ExecutionsCount     : dword;    // {in} number of executions
    UseDaysLimit        : boolean;  // {in} limit key by days?
    DaysCount           : dword;    // {in} number of days
    UseRunTimeLimit     : boolean;  // {in} limit key by run time?
    RunTimeMinutes      : dword;    // {in} run time minutes
    UseGlobalTimeLimit  : boolean;  // {in} limit key by global time?
    GlobalTimeMinutes   : dword;    // {in} global time minutes
    UseCountyLimit      : boolean;  // {in} limit key by country?
    CountryCode         : dword;    // {in} country code
    UseRegisterAfter    : boolean;  // {in} register key after date?
    RegisterAfterYear   : dword;    // {in} register after year
    RegisterAfterMonth  : dword;    // {in} register after month
    RegisterAfterDay    : dword;    // {in} register after day
    UseRegisterBefore   : boolean;  // {in} register key before date?
    RegisterBeforeYear  : dword;    // {in} register before year
    RegisterBeforeMonth : dword;    // {in} register before month
    RegisterBeforeDay   : dword;    // {in} register before day
    EncryptedConstant   : dword;    // {in} Encryption Constant - should be extracted from project file
    EncryptedSections   : array [1..NUMBER_OF_CRYPTED_SECTIONS] of boolean; // {in} Crypted sections
    PrivateKey          : PAnsiChar;   // {in} Private Key - should be extracted from project file
    PublicKey           : PAnsiChar;   // {in} Public Key - should be extracted from project file
  end;
  PKeyGenParams = ^TKeyGenParams;

  TKeyGenParamsA = record
    KeyMode             : dword;    // {in} key generation mode (~RSA ???)
    KeyBase             : dword;    // {in} key output base (Base ???)
    KeyWithHyphens      : boolean;  // {in} add hyphens to the key?
    Key                 : pointer;  // {in} buffer for ansi string registration key
    KeyLen              : dword;    // {in} registration key size
    RegInfo             : PAnsiChar;  // {in} registration info/name
    UseKeyExpiration    : boolean;  // {in} use key expiration?
    ExpirationYear      : dword;    // {in} key expiration year
    ExpirationMonth     : dword;    // {in} key expiration month
    ExpirationDay       : dword;    // {in} key expiration day
    UseHardwareLocking  : boolean;  // {in} is key hardware locked?
    HardwareID          : PAnsiChar;// {in} pointer to null terminated hardware string
    UseExecutionsLimit  : boolean;  // {in} limit key by executions?
    ExecutionsCount     : dword;    // {in} number of executions
    UseDaysLimit        : boolean;  // {in} limit key by days?
    DaysCount           : dword;    // {in} number of days
    UseRunTimeLimit     : boolean;  // {in} limit key by run time?
    RunTimeMinutes      : dword;    // {in} run time minutes
    UseGlobalTimeLimit  : boolean;  // {in} limit key by global time?
    GlobalTimeMinutes   : dword;    // {in} global time minutes
    UseCountyLimit      : boolean;  // {in} limit key by country?
    CountryCode         : dword;    // {in} country code
    UseRegisterAfter    : boolean;  // {in} register key after date?
    RegisterAfterYear   : dword;    // {in} register after year
    RegisterAfterMonth  : dword;    // {in} register after month
    RegisterAfterDay    : dword;    // {in} register after day
    UseRegisterBefore   : boolean;  // {in} register key before date?
    RegisterBeforeYear  : dword;    // {in} register before year
    RegisterBeforeMonth : dword;    // {in} register before month
    RegisterBeforeDay   : dword;    // {in} register before day
    EncryptedConstant   : dword;    // {in} Encryption Constant - should be extracted from project file
    EncryptedSections   : array [1..NUMBER_OF_CRYPTED_SECTIONS] of boolean; // {in} Crypted sections
    PrivateKey          : PAnsiChar;   // {in} Private Key - should be extracted from project file
    PublicKey           : PAnsiChar;   // {in} Public Key - should be extracted from project file
  end;
  PKeyGenParamsA = ^TKeyGenParamsA;

  TKeyGenParamsW = record
    KeyMode             : dword;    // {in} key generation mode (~RSA ???)
    KeyBase             : dword;    // {in} key output base (Base ???)
    KeyWithHyphens      : boolean;  // {in} add hyphens to the key?
    Key                 : pointer;  // {in} buffer for unicode string registration key
    KeyLen              : dword;    // {in} registration key size
    RegInfo             : PWideChar;  // {in} registration info/name
    UseKeyExpiration    : boolean;  // {in} use key expiration?
    ExpirationYear      : dword;    // {in} key expiration year
    ExpirationMonth     : dword;    // {in} key expiration month
    ExpirationDay       : dword;    // {in} key expiration day
    UseHardwareLocking  : boolean;  // {in} is key hardware locked?
    HardwareID          : PWideChar;// {in} pointer to null terminated hardware string
    UseExecutionsLimit  : boolean;  // {in} limit key by executions?
    ExecutionsCount     : dword;    // {in} number of executions
    UseDaysLimit        : boolean;  // {in} limit key by days?
    DaysCount           : dword;    // {in} number of days
    UseRunTimeLimit     : boolean;  // {in} limit key by run time?
    RunTimeMinutes      : dword;    // {in} run time minutes
    UseGlobalTimeLimit  : boolean;  // {in} limit key by global time?
    GlobalTimeMinutes   : dword;    // {in} global time minutes
    UseCountyLimit      : boolean;  // {in} limit key by country?
    CountryCode         : dword;    // {in} country code
    UseRegisterAfter    : boolean;  // {in} register key after date?
    RegisterAfterYear   : dword;    // {in} register after year
    RegisterAfterMonth  : dword;    // {in} register after month
    RegisterAfterDay    : dword;    // {in} register after day
    UseRegisterBefore   : boolean;  // {in} register key before date?
    RegisterBeforeYear  : dword;    // {in} register before year
    RegisterBeforeMonth : dword;    // {in} register before month
    RegisterBeforeDay   : dword;    // {in} register before day
    EncryptedConstant   : dword;    // {in} Encryption Constant - should be extracted from project file
    EncryptedSections   : array [1..NUMBER_OF_CRYPTED_SECTIONS] of boolean; // {in} Crypted sections
    PrivateKey          : PWideChar;   // {in} Private Key - should be extracted from project file
    PublicKey           : PWideChar;   // {in} Public Key - should be extracted from project file
  end;
  PKeyGenParamsW = ^TKeyGenParamsW;

function KG_GenerateRegistrationKey(kg : PKeyGenParams) : dword; stdcall;
function KG_GenerateRegistrationKeyA(kg : PKeyGenParamsA) : dword; stdcall;
function KG_GenerateRegistrationKeyW(kg : PKeyGenParamsW) : dword; stdcall;
function KG_GenerateRegistrationKeyFromProject(ProjectFile : PAnsiChar; kg : PKeyGenParams) : dword; stdcall;
function KG_GenerateRegistrationKeyFromProjectA(ProjectFile : PAnsiChar; kg : PKeyGenParamsA) : dword; stdcall;
function KG_GenerateRegistrationKeyFromProjectW(ProjectFile : PWideChar; kg : PKeyGenParamsW) : dword; stdcall;
function KG_VerifyRegistrationInfo(kv : PKeyVerifyParams) : dword; stdcall;
function KG_VerifyRegistrationInfoA(kv : PKeyVerifyParamsA) : dword; stdcall;
function KG_VerifyRegistrationInfoW(kv : PKeyVerifyParamsW) : dword; stdcall;
function KG_VerifyRegistrationInfoFromProject(ProjectFile : PAnsiChar; kv : PKeyVerifyParams) : dword; stdcall;
function KG_VerifyRegistrationInfoFromProjectA(ProjectFile : PAnsiChar; kv : PKeyVerifyParamsA) : dword; stdcall;
function KG_VerifyRegistrationInfoFromProjectW(ProjectFile : PWideChar; kv : PKeyVerifyParamsW) : dword; stdcall;

implementation

const
  keygen_api_dll_name  = 'keygen.dll';

function KG_GenerateRegistrationKey(kg : PKeyGenParams) : dword; external keygen_api_dll_name name 'KG_GenerateRegistrationKey';
function KG_GenerateRegistrationKeyA(kg : PKeyGenParamsA) : dword; external keygen_api_dll_name name 'KG_GenerateRegistrationKeyA';
function KG_GenerateRegistrationKeyW(kg : PKeyGenParamsW) : dword; external keygen_api_dll_name name 'KG_GenerateRegistrationKeyW';
function KG_GenerateRegistrationKeyFromProject(ProjectFile : PAnsiChar; kg : PKeyGenParams) : dword; external keygen_api_dll_name name 'KG_GenerateRegistrationKeyFromProject';
function KG_GenerateRegistrationKeyFromProjectA(ProjectFile : PAnsiChar; kg : PKeyGenParamsA) : dword; external keygen_api_dll_name name 'KG_GenerateRegistrationKeyFromProjectA';
function KG_GenerateRegistrationKeyFromProjectW(ProjectFile : PWideChar; kg : PKeyGenParamsW) : dword; external keygen_api_dll_name name 'KG_GenerateRegistrationKeyFromProjectW';
function KG_VerifyRegistrationInfo(kv : PKeyVerifyParams) : dword; external keygen_api_dll_name name 'KG_VerifyRegistrationInfo';
function KG_VerifyRegistrationInfoA(kv : PKeyVerifyParamsA) : dword; external keygen_api_dll_name name 'KG_VerifyRegistrationInfoA';
function KG_VerifyRegistrationInfoW(kv : PKeyVerifyParamsW) : dword; external keygen_api_dll_name name 'KG_VerifyRegistrationInfoW';
function KG_VerifyRegistrationInfoFromProject(ProjectFile : PAnsiChar; kv : PKeyVerifyParams) : dword; external keygen_api_dll_name name 'KG_VerifyRegistrationInfoFromProject';
function KG_VerifyRegistrationInfoFromProjectA(ProjectFile : PAnsiChar; kv : PKeyVerifyParamsA) : dword; external keygen_api_dll_name name 'KG_VerifyRegistrationInfoFromProjectA';
function KG_VerifyRegistrationInfoFromProjectW(ProjectFile : PWideChar; kv : PKeyVerifyParamsW) : dword; external keygen_api_dll_name name 'KG_VerifyRegistrationInfoFromProjectW';

end.
