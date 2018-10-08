unit enigma_ide64;

interface

const
  WM_PUBLIC         = 1;
  WM_PRIVATE        = 2;

  MAX_STRING_SIZE   = 255;

  NUMBER_OF_CRYPTED_SECTIONS = 16;

  // Ctypt hash types, possible hash values for functions:
  // EP_CryptHashBuffer
  // EP_CryptHashStringA
  // EP_CryptHashStringW
  // EP_CryptHashFileA
  // EP_CryptHashFileW
  HASH_XOR32        = 0;
  HASH_MD2          = 1;
  HASH_MD5          = 2;
  HASH_RipeMD160    = 3;
  HASH_SH1          = 4;
  HASH_SHA224       = 5;
  HASH_SHA256       = 6;
  HASH_SHA384       = 7;
  HASH_SHA512       = 8;

  // Return values of EP_RegKeyStatus
  KEY_STATUS_DOESNOTEXIST                         = 0;
  KEY_STATUS_VALID                                = 1;
  KEY_STATUS_INVALID                              = 2;
  KEY_STATUS_STOLEN                               = 3;
  KEY_STATUS_DATEEXPIRED                          = 4;
  KEY_STATUS_WITHOUTHARDWARELOCK                  = 5;
  KEY_STATUS_WITHOUTEXPIRATIONDATE                = 6;
  KEY_STATUS_WITHOUTREGISTERAFTERDATE             = 7;
  KEY_STATUS_WITHOUTREGISTERBEFOREDATE            = 8;
  KEY_STATUS_WITHOUTEXECUTIONSLIMIT               = 9;
  KEY_STATUS_WITHOUTDAYSLIMIT                     = 10;
  KEY_STATUS_WITHOUTRUNTIMELIMIT                  = 11;
  KEY_STATUS_WITHOUTGLOBALTIMELIMIT               = 12;
  KEY_STATUS_WITHOUTCOUNTRYLOCK                   = 13;
  KEY_STATUS_COUNTRYINVALID                       = 14;
  KEY_STATUS_REGISTERAFTERFAILED                  = 15;
  KEY_STATUS_REGISTERBEFOREFAILED                 = 16;
  KEY_STATUS_EXECUTIONSEXPIRED                    = 17;
  KEY_STATUS_DAYSEXPIRED                          = 18;
  KEY_STATUS_RUNTIMEEXPIRED                       = 19;
  KEY_STATUS_GLOBALTIMEEXPIRED                    = 20;
  KEY_STATUS_HARDWARECHANGESEXCEEDED_VOLUMESERIAL = 21;
  KEY_STATUS_HARDWARECHANGESEXCEEDED_VOLUMENAME   = 22;
  KEY_STATUS_HARDWARECHANGESEXCEEDED_COMPUTERNAME = 23;
  KEY_STATUS_HARDWARECHANGESEXCEEDED_CPU          = 24;
  KEY_STATUS_HARDWARECHANGESEXCEEDED_MOTHERBOARD  = 25;
  KEY_STATUS_HARDWARECHANGESEXCEEDED_WINDOWSKEY   = 26;
  KEY_STATUS_HARDWARECHANGESEXCEEDED_HDDSERIAL    = 27;
  KEY_STATUS_HARDWARECHANGESEXCEEDED_USERNAME     = 28;

  // Counties code for EP_MiscCountryCode
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
  // Array list of full country name and it's code
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
  // Watermark content type for EP_MiscGetWatermark
  TWMContent = record
    WMType      : integer;
    Name        : PAnsiChar;
    NameLen     : integer;
    Text        : PAnsiChar;
    TextLen     : integer;
    FileName    : PAnsiChar;
    FileNameLen : integer;
    AFile       : pointer;
    AFileLen    : integer;
  end;
  PWMContent = ^TWMContent;

  // LongBool is using for correct data alignment
  TKeyInformation = record
    Stolen              : LongBool; // {out} is key stolen?
    CreationYear        : integer;  // {out} key creation year
    CreationMonth       : integer;  // {out} key creation month
    CreationDay         : integer;  // {out} key creation day
    UseKeyExpiration    : LongBool; // {out} has key expiration date?
    ExpirationYear      : integer;  // {out} key expiration year
    ExpirationMonth     : integer;  // {out} key expiration month
    ExpirationDay       : integer;  // {out} key expiration day
    UseHardwareLocking  : LongBool; // {out} hardware locked key
    UseExecutionsLimit  : LongBool; // {out} limit key by executions?
    ExecutionsCount     : integer;  // {out} number of executions
    UseDaysLimit        : LongBool; // {out} limit key by days?
    DaysCount           : integer;  // {out} number of days
    UseRunTimeLimit     : LongBool; // {out} limit key by run time?
    RunTimeMinutes      : integer;  // {out} run time minutes
    UseGlobalTimeLimit  : LongBool; // {out} limit key by global time?
    GlobalTimeMinutes   : integer;  // {out} global time minutes
    UseCountyLimit      : LongBool; // {out} limit key by country?
    CountryCode         : integer;  // {out} country code
    UseRegisterAfter    : LongBool; // {out} register key after date?
    RegisterAfterYear   : integer;  // {out} register after year
    RegisterAfterMonth  : integer;  // {out} register after month
    RegisterAfterDay    : integer;  // {out} register after day
    UseRegisterBefore   : LongBool; // {out} register key before date?
    RegisterBeforeYear  : integer;  // {out} register before year
    RegisterBeforeMonth : integer;  // {out} register before month
    RegisterBeforeDay   : integer;  // {out} register before day
    EncryptedSections   : array [1..NUMBER_OF_CRYPTED_SECTIONS] of LongBool; // {out} Crypted sections
  end;
  PKeyInformation = ^TKeyInformation;

{API for registration}
function EP_RegSaveKey( Name : PAnsiChar; Key : PAnsiChar) : boolean;
function EP_RegSaveKeyA( Name : PAnsiChar; Key : PAnsiChar) : boolean;
function EP_RegSaveKeyW( Name : PWideChar; Key : PWideChar) : boolean;
function EP_RegLoadKey( var Name : PAnsiChar; var Key : PAnsiChar) : boolean;
function EP_RegLoadKeyA( var Name : PAnsiChar; var Key : PAnsiChar) : boolean;
function EP_RegLoadKeyW( var Name : PWideChar; var Key : PWideChar) : boolean;
function EP_RegDeleteKey : boolean;
function EP_RegCheckKey( Name : PAnsiChar; Key : PAnsiChar) : boolean;
function EP_RegCheckKeyA( Name : PAnsiChar; Key : PAnsiChar) : boolean;
function EP_RegCheckKeyW( Name : PWideChar; Key : PWideChar) : boolean;
function EP_RegLoadAndCheckKey : boolean;
function EP_RegCheckAndSaveKey(  Name : PAnsiChar; Key : PAnsiChar) : boolean;
function EP_RegCheckAndSaveKeyA(  Name : PAnsiChar; Key : PAnsiChar) : boolean;
function EP_RegCheckAndSaveKeyW(  Name : PWideChar; Key : PWideChar) : boolean;
function EP_RegHardwareID : PAnsiChar;
function EP_RegHardwareIDA : PAnsiChar;
function EP_RegHardwareIDW : PWideChar;
function EP_RegKeyCreationDate( var Year, Month, Day : Cardinal) : boolean;
function EP_RegKeyCreationDateEx : Cardinal;
function EP_RegKeyExpirationDate( var Year, Month, Day : Cardinal) : boolean;
function EP_RegKeyExpirationDateEx : Cardinal;
function EP_RegKeyExecutions( var Total, Left : Cardinal) : boolean;
function EP_RegKeyExecutionsTotal : Cardinal;
function EP_RegKeyExecutionsLeft : Cardinal;
function EP_RegKeyDays( var Total, Left : Cardinal) : boolean;
function EP_RegKeyDaysTotal : Cardinal;
function EP_RegKeyDaysLeft : Cardinal;
function EP_RegKeyRuntime( var Total, Left : Cardinal) : boolean;
function EP_RegKeyRuntimeTotal : Cardinal;
function EP_RegKeyRuntimeLeft : Cardinal;
function EP_RegKeyGlobalTime( var Total, Left : Cardinal) : boolean;
function EP_RegKeyGlobalTimeTotal : Cardinal;
function EP_RegKeyGlobalTimeLeft : Cardinal;
function EP_RegKeyRegisterAfterDate( var Year, Month, Day : Cardinal) : boolean;
function EP_RegKeyRegisterAfterDateEx : Cardinal;
function EP_RegKeyRegisterBeforeDate( var Year, Month, Day : Cardinal) : boolean;
function EP_RegKeyRegisterBeforeDateEx : Cardinal;
function EP_RegKeyInformation(AName, AKey : PAnsiChar; var AKeyInfo : TKeyInformation) : boolean;
function EP_RegKeyInformationA(AName, AKey : PAnsiChar; var AKeyInfo : TKeyInformation) : boolean;
function EP_RegKeyInformationW(AName, AKey : PWideChar; var AKeyInfo : TKeyInformation) : boolean;
function EP_RegKeyStatus : Cardinal;
procedure EP_RegShowDialog; 

{API for trial}
function EP_TrialExecutions( var Total, Left : Cardinal) : boolean;
function EP_TrialExecutionsTotal : Cardinal;
function EP_TrialExecutionsLeft : Cardinal;
function EP_TrialDays( var Total, Left : Cardinal) : boolean;
function EP_TrialDaysTotal : Cardinal;
function EP_TrialDaysLeft : Cardinal;
function EP_TrialExpirationDate( var Year, Month, Day : Cardinal) : boolean;
function EP_TrialExpirationDateEx : Cardinal;
function EP_TrialDateTillDate( var StartYear, StartMonth, StartDay, EndYear, EndMonth, EndDay : Cardinal) : boolean;
function EP_TrialDateTillDateStartEx : Cardinal;
function EP_TrialDateTillDateEndEx : Cardinal;
function EP_TrialExecutionTime( var Total, Left : Cardinal) : boolean;
function EP_TrialExecutionTimeTotal : Cardinal;
function EP_TrialExecutionTimeLeft : Cardinal;
{API Misc}
function EP_MiscGetWatermark(ID : integer; WM : PWMContent) : integer;
function EP_MiscCountryCode : integer;
function EP_SplashScreenShow : Cardinal;
procedure EP_SplashScreenHide;
{API Protection}
function EP_ProtectedStringByID(ID : integer; Buffer : pointer; Len : integer) : integer;
function EP_ProtectedStringByKey(Key : PAnsiChar; Buffer : pointer; Len : integer) : integer;
{API Crypt}
function EP_CryptHashBuffer(Hash : Cardinal; Buffer : pointer; Size : Cardinal; Digest : pointer) : Cardinal;
function EP_CryptHashFileA(Hash : Cardinal; FileName : PAnsiChar; Digest : pointer) : Cardinal;
function EP_CryptHashFileW(Hash : Cardinal; FileName : PWideChar; Digest : pointer) : Cardinal;
function EP_CryptHashStringA(Hash : Cardinal; Str : PAnsiChar; Digest : pointer) : Cardinal;
function EP_CryptHashStringW(Hash : Cardinal; Str : PWideChar; Digest : pointer) : Cardinal;
procedure EP_CryptEncryptBuffer(Buffer : pointer; Size : Cardinal; Key : PAnsiChar);
procedure EP_CryptEncryptBufferEx(InBuffer, OutBuffer : pointer; Size : Cardinal; Key : pointer; KeySize : Cardinal);
procedure EP_CryptDecryptBuffer(Buffer : pointer; Size : Cardinal; Key : PAnsiChar);
procedure EP_CryptDecryptBufferEx(InBuffer, OutBuffer : pointer; Size : Cardinal; Key : pointer; KeySize : Cardinal);
{API Checkup}
function EP_CheckupCopies( var Total, Current : Cardinal) : boolean;
function EP_CheckupCopiesTotal : Cardinal;
function EP_CheckupCopiesCurrent : Cardinal;
function EP_CheckupIsProtected : boolean;
function EP_CheckupIsEnigmaOk : boolean;
function EP_CheckupFindProcess(FileName, WindowText, WindowClass : PAnsiChar) : boolean;
function EP_CheckupFindProcessA(FileName, WindowText, WindowClass : PAnsiChar) : boolean;
function EP_CheckupFindProcessW(FileName, WindowText, WindowClass : PWideChar) : boolean;
function EP_CheckupVirtualizationTools : boolean;

{API Enigma}
function EP_EnigmaVersion : Cardinal;

implementation

const
  enigma_api_dll_name  = 'enigma_ide64.dll';

function EP_RegSaveKey( Name : PAnsiChar; Key : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_RegSaveKey';
function EP_RegSaveKeyA( Name : PAnsiChar; Key : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_RegSaveKeyA';
function EP_RegSaveKeyW( Name : PWideChar; Key : PWideChar) : boolean; external enigma_api_dll_name name 'EP_RegSaveKeyW';
function EP_RegLoadKey( var Name : PAnsiChar; var Key : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_RegLoadKey';
function EP_RegLoadKeyA( var Name : PAnsiChar; var Key : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_RegLoadKeyA';
function EP_RegLoadKeyW( var Name : PWideChar; var Key : PWideChar) : boolean; external enigma_api_dll_name name 'EP_RegLoadKeyW';
function EP_RegDeleteKey : boolean; external enigma_api_dll_name name 'EP_RegDeleteKey';
function EP_RegCheckKey( Name : PAnsiChar; Key : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_RegCheckKey';
function EP_RegCheckKeyA( Name : PAnsiChar; Key : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_RegCheckKeyA';
function EP_RegCheckKeyW( Name : PWideChar; Key : PWideChar) : boolean; external enigma_api_dll_name name 'EP_RegCheckKeyW';
function EP_RegCheckAndSaveKey(Name : PAnsiChar; Key : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_RegCheckAndSaveKey';
function EP_RegCheckAndSaveKeyA(Name : PAnsiChar; Key : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_RegCheckAndSaveKeyA';
function EP_RegCheckAndSaveKeyW(Name : PWideChar; Key : PWideChar) : boolean; external enigma_api_dll_name name 'EP_RegCheckAndSaveKeyW';
function EP_RegLoadAndCheckKey : boolean; external enigma_api_dll_name name 'EP_RegLoadAndCheckKey';
function EP_RegHardwareID : PAnsiChar; external enigma_api_dll_name name 'EP_RegHardwareID';
function EP_RegHardwareIDA : PAnsiChar; external enigma_api_dll_name name 'EP_RegHardwareIDA';
function EP_RegHardwareIDW : PWideChar; external enigma_api_dll_name name 'EP_RegHardwareIDW';
function EP_RegKeyCreationDate( var Year, Month, Day : Cardinal) : boolean; external enigma_api_dll_name name 'EP_RegKeyCreationDate';
function EP_RegKeyCreationDateEx : Cardinal; external enigma_api_dll_name name 'EP_RegKeyCreationDateEx';
function EP_RegKeyExpirationDate( var Year, Month, Day : Cardinal) : boolean; external enigma_api_dll_name name 'EP_RegKeyExpirationDate';
function EP_RegKeyExpirationDateEx : Cardinal; external enigma_api_dll_name name 'EP_RegKeyExpirationDateEx';
function EP_RegKeyExecutions( var Total, Left : Cardinal) : boolean; external enigma_api_dll_name name 'EP_RegKeyExecutions';
function EP_RegKeyExecutionsTotal : Cardinal; external enigma_api_dll_name name 'EP_RegKeyExecutionsTotal';
function EP_RegKeyExecutionsLeft : Cardinal; external enigma_api_dll_name name 'EP_RegKeyExecutionsLeft';
function EP_RegKeyDays( var Total, Left : Cardinal) : boolean; external enigma_api_dll_name name 'EP_RegKeyDays';
function EP_RegKeyDaysTotal : Cardinal; external enigma_api_dll_name name 'EP_RegKeyDaysTotal';
function EP_RegKeyDaysLeft : Cardinal; external enigma_api_dll_name name 'EP_RegKeyDaysLeft';
function EP_RegKeyRuntime( var Total, Left : Cardinal) : boolean; external enigma_api_dll_name name 'EP_RegKeyRuntime';
function EP_RegKeyRuntimeTotal : Cardinal; external enigma_api_dll_name name 'EP_RegKeyRuntimeTotal';
function EP_RegKeyRuntimeLeft : Cardinal; external enigma_api_dll_name name 'EP_RegKeyRuntimeLeft';
function EP_RegKeyGlobalTime( var Total, Left : Cardinal) : boolean; external enigma_api_dll_name name 'EP_RegKeyGlobalTime';
function EP_RegKeyGlobalTimeTotal : Cardinal; external enigma_api_dll_name name 'EP_RegKeyGlobalTimeTotal';
function EP_RegKeyGlobalTimeLeft : Cardinal; external enigma_api_dll_name name 'EP_RegKeyGlobalTimeLeft';
function EP_RegKeyRegisterAfterDate( var Year, Month, Day : Cardinal) : boolean; external enigma_api_dll_name name 'EP_RegKeyRegisterAfterDate';
function EP_RegKeyRegisterAfterDateEx : Cardinal; external enigma_api_dll_name name 'EP_RegKeyRegisterAfterDateEx';
function EP_RegKeyRegisterBeforeDate( var Year, Month, Day : Cardinal) : boolean; external enigma_api_dll_name name 'EP_RegKeyRegisterBeforeDate';
function EP_RegKeyRegisterBeforeDateEx : Cardinal; external enigma_api_dll_name name 'EP_RegKeyRegisterBeforeDateEx';
function EP_RegKeyInformation(AName, AKey : PAnsiChar; var AKeyInfo : TKeyInformation) : boolean; external enigma_api_dll_name name 'EP_RegKeyInformation';
function EP_RegKeyInformationA(AName, AKey : PAnsiChar; var AKeyInfo : TKeyInformation) : boolean; external enigma_api_dll_name name 'EP_RegKeyInformationA';
function EP_RegKeyInformationW(AName, AKey : PWideChar; var AKeyInfo : TKeyInformation) : boolean; external enigma_api_dll_name name 'EP_RegKeyInformationW';
function EP_RegKeyStatus : Cardinal; external enigma_api_dll_name name 'EP_RegKeyStatus';
procedure EP_RegShowDialog; external enigma_api_dll_name name 'EP_RegShowDialog';

function EP_TrialExecutions( var Total, Left : Cardinal) : boolean; external enigma_api_dll_name name 'EP_TrialExecutions';
function EP_TrialExecutionsTotal : Cardinal; external enigma_api_dll_name name 'EP_TrialExecutionsTotal';
function EP_TrialExecutionsLeft : Cardinal; external enigma_api_dll_name name 'EP_TrialExecutionsLeft';
function EP_TrialDays( var Total, Left : Cardinal) : boolean; external enigma_api_dll_name name 'EP_TrialDays';
function EP_TrialDaysTotal : Cardinal; external enigma_api_dll_name name 'EP_TrialDaysTotal';
function EP_TrialDaysLeft : Cardinal; external enigma_api_dll_name name 'EP_TrialDaysLeft';
function EP_TrialExpirationDate( var Year, Month, Day : Cardinal) : boolean; external enigma_api_dll_name name 'EP_TrialExpirationDate';
function EP_TrialExpirationDateEx : Cardinal; external enigma_api_dll_name name 'EP_TrialExpirationDateEx';
function EP_TrialDateTillDate( var StartYear, StartMonth, StartDay, EndYear, EndMonth, EndDay : Cardinal) : boolean; external enigma_api_dll_name name 'EP_TrialDateTillDate';
function EP_TrialDateTillDateStartEx : Cardinal; external enigma_api_dll_name name 'EP_TrialDateTillDateStartEx';
function EP_TrialDateTillDateEndEx : Cardinal; external enigma_api_dll_name name 'EP_TrialDateTillDateEndEx';
function EP_TrialExecutionTime( var Total, Left : Cardinal) : boolean; external enigma_api_dll_name name 'EP_TrialExecutionTime';
function EP_TrialExecutionTimeTotal : Cardinal; external enigma_api_dll_name name 'EP_TrialExecutionTimeTotal';
function EP_TrialExecutionTimeLeft : Cardinal; external enigma_api_dll_name name 'EP_TrialExecutionTimeLeft';

function EP_MiscGetWatermark(ID : integer; WM : PWMContent) : integer; external enigma_api_dll_name name 'EP_MiscGetWatermark';
function EP_MiscCountryCode : integer; external enigma_api_dll_name name 'EP_MiscCountryCode';

function EP_ProtectedStringByID(ID : integer; Buffer : pointer; Len : integer) : integer; external enigma_api_dll_name name 'EP_ProtectedStringByID';
function EP_ProtectedStringByKey(Key : PAnsiChar; Buffer : pointer; Len : integer) : integer; external enigma_api_dll_name name 'EP_ProtectedStringByKey';

function EP_CryptHashBuffer(Hash : Cardinal; Buffer : pointer; Size : Cardinal; Digest : pointer) : Cardinal; external enigma_api_dll_name name 'EP_CryptHashBuffer';
function EP_CryptHashFileA(Hash : Cardinal; FileName : PAnsiChar; Digest : pointer) : Cardinal; external enigma_api_dll_name name 'EP_CryptHashFileA';
function EP_CryptHashFileW(Hash : Cardinal; FileName : PWideChar; Digest : pointer) : Cardinal; external enigma_api_dll_name name 'EP_CryptHashFileW';
function EP_CryptHashStringA(Hash : Cardinal; Str : PAnsiChar; Digest : pointer) : Cardinal; external enigma_api_dll_name name 'EP_CryptHashStringA';
function EP_CryptHashStringW(Hash : Cardinal; Str : PWideChar; Digest : pointer) : Cardinal; external enigma_api_dll_name name 'EP_CryptHashStringW';
procedure EP_CryptEncryptBuffer(Buffer : pointer; Size : Cardinal; Key : PAnsiChar); external enigma_api_dll_name name 'EP_CryptEncryptBuffer';
procedure EP_CryptEncryptBufferEx(InBuffer, OutBuffer : pointer; Size : Cardinal; Key : pointer; KeySize : Cardinal); external enigma_api_dll_name name 'EP_CryptEncryptBufferEx';
procedure EP_CryptDecryptBuffer(Buffer : pointer; Size : Cardinal; Key : PAnsiChar); external enigma_api_dll_name name 'EP_CryptDecryptBuffer';
procedure EP_CryptDecryptBufferEx(InBuffer, OutBuffer : pointer; Size : Cardinal; Key : pointer; KeySize : Cardinal); external enigma_api_dll_name name 'EP_CryptDecryptBufferEx';

function EP_CheckupCopies( var Total, Current : Cardinal) : boolean; external enigma_api_dll_name name 'EP_CheckupCopies';
function EP_CheckupCopiesTotal : Cardinal; external enigma_api_dll_name name 'EP_CheckupCopiesTotal';
function EP_CheckupCopiesCurrent : Cardinal; external enigma_api_dll_name name 'EP_CheckupCopiesCurrent';
function EP_CheckupIsProtected : boolean; external enigma_api_dll_name name 'EP_CheckupIsProtected';
function EP_CheckupIsEnigmaOk : boolean; external enigma_api_dll_name name 'EP_CheckupIsEnigmaOk';
function EP_CheckupFindProcess(FileName, WindowText, WindowClass : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_CheckupFindProcess';
function EP_CheckupFindProcessA(FileName, WindowText, WindowClass : PAnsiChar) : boolean; external enigma_api_dll_name name 'EP_CheckupFindProcessA';
function EP_CheckupFindProcessW(FileName, WindowText, WindowClass : PWideChar) : boolean; external enigma_api_dll_name name 'EP_CheckupFindProcessW';
function EP_CheckupVirtualizationTools : boolean; external enigma_api_dll_name name 'EP_CheckupVirtualizationTools';

function EP_EnigmaVersion : Cardinal; external enigma_api_dll_name name 'EP_EnigmaVersion';

function EP_SplashScreenShow : Cardinal; external enigma_api_dll_name name 'EP_SplashScreenShow';
procedure EP_SplashScreenHide; external enigma_api_dll_name name 'EP_SplashScreenHide';

end.
