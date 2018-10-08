/// Enigma API implementation
using System;
using System.Runtime.InteropServices;

/// <summary>
/// Summary description for Enigma_KeyGen_IDE64
/// </summary>
/// 

public class Enigma_KeyGen_IDE64
{

    public const int NUMBER_OF_CRYPTED_SECTIONS = 16;

    // Key generation/verification results
    public const int EP_NO_ERROR = 0;
    public const int EP_ERROR_UNKNOWN = 1;
    public const int EP_ERROR_KEYBUFFEREMPTY = 2;
    public const int EP_ERROR_KEYBUFFERISLESS = 3;
    public const int EP_ERROR_REGINFOEMPTY = 4;
    public const int EP_ERROR_REGINFOTOOLARGE = 5;
    public const int EP_ERROR_PRIVATEKEYISNOTSET = 6;
    public const int EP_ERROR_PUBLICKEYISNOTSET = 7;
    public const int EP_ERROR_PRIVATEKEYISINVALID = 8;
    public const int EP_ERROR_PUBLICKEYISINVALID = 9;
    public const int EP_ERROR_KEYMODEISINVALID = 10;
    public const int EP_ERROR_KEYBASEISINVALID = 11;
    public const int EP_ERROR_CURRENTDATEISINVALID = 12;
    public const int EP_ERROR_EXPIRATIONDATEISINVALID = 13;
    public const int EP_ERROR_KEYISINVALID = 14;
    public const int EP_ERROR_HARDWAREID = 15;
    public const int EP_ERROR_HARDWAREBUFFEREMPTY = 16;
    public const int EP_ERROR_HARDWAREIDINVALIDFORKEY = 17;
    public const int EP_ERROR_PROJECTFILENOTFOUND = 18;
    public const int EP_ERROR_INVALIDPROJECTFILE = 19;
    public const int EP_ERROR_EXECUTIONSNUMBERINVALID = 20;
    public const int EP_ERROR_DAYSNUMBERINVALID = 21;
    public const int EP_ERROR_COUNTRYCODEINVALID = 22;
    public const int EP_ERROR_RUNTIMEINVALID = 23;
    public const int EP_ERROR_GLOBALTIMEINVALID = 24;
    public const int EP_ERROR_INSTALLBEFOREINVALID = 25;
    public const int EP_ERROR_INSTALLAFTERINVALID = 26;

    // Registartion mode types
    public const int RM_512 = 0;
    public const int RM_768 = 1;
    public const int RM_1024 = 2;
    public const int RM_2048 = 3;
    public const int RM_3072 = 4;
    public const int RM_4096 = 5;

    // Registration Base types
    public const int RB_2 = 0;
    public const int RB_8 = 1;
    public const int RB_16 = 2;
    public const int RB_32 = 3;
    public const int RB_64 = 4;

    // Counties code
    public const int CN_AFGHANISTAN = 114;
    public const int CN_ALBANIA = 1;
    public const int CN_ALGERIA = 2;
    public const int CN_ARGENTINA = 3;
    public const int CN_ARMENIA = 4;
    public const int CN_AUSTRALIA = 5;
    public const int CN_AUSTRIA = 6;
    public const int CN_AZERBAIJAN = 7;
    public const int CN_BAHRAIN = 8;
    public const int CN_BANGLADESH = 115;
    public const int CN_BELARUS = 9;
    public const int CN_BELGIUM = 10;
    public const int CN_BELIZE = 11;
    public const int CN_BOLIVIA = 116;
    public const int CN_BOSNIA = 117;
    public const int CN_BRAZIL = 13;
    public const int CN_BRUNEI = 14;
    public const int CN_BULGARIA = 15;
    public const int CN_CAMBODIA = 16;
    public const int CN_CANADA = 17;
    public const int CN_CARRIBEAN = 118;
    public const int CN_CHILE = 20;
    public const int CN_CHINA = 21;
    public const int CN_COLOMBIA = 22;
    public const int CN_COSTARICA = 23;
    public const int CN_CROATIA = 24;
    public const int CN_CZECH = 25;
    public const int CN_DENMARK = 26;
    public const int CN_DOMINICAN = 27;
    public const int CN_ECUADOR = 28;
    public const int CN_EGYPT = 29;
    public const int CN_ELSALVADOR = 30;
    public const int CN_ESTONIA = 31;
    public const int CN_ETHIOPIA = 119;
    public const int CN_FAROE = 32;
    public const int CN_FINLAND = 33;
    public const int CN_FRANCE = 34;
    public const int CN_GEORGIA = 35;
    public const int CN_GERMANY = 36;
    public const int CN_GREECE = 37;
    public const int CN_GREENLAND = 120;
    public const int CN_GUATEMALA = 38;
    public const int CN_HONDURAS = 39;
    public const int CN_HONGKONG = 40;
    public const int CN_HUNGARU = 41;
    public const int CN_ICELAND = 42;
    public const int CN_INDIA = 43;
    public const int CN_INDONESIA = 44;
    public const int CN_IRAN = 45;
    public const int CN_IRAQ = 46;
    public const int CN_IRELAND = 47;
    public const int CN_ISRAEL = 48;
    public const int CN_ITALY = 49;
    public const int CN_JAMAICA = 50;
    public const int CN_JAPAN = 51;
    public const int CN_JORDAN = 52;
    public const int CN_KAZAKHSTAN = 53;
    public const int CN_KENYA = 54;
    public const int CN_KOREA = 56;
    public const int CN_KUWAIT = 57;
    public const int CN_KYRGYZSTAN = 58;
    public const int CN_LAOS = 121;
    public const int CN_LATVIA = 59;
    public const int CN_LEBANON = 60;
    public const int CN_LIBYAN = 122;
    public const int CN_LIECHTENSTEIN = 62;
    public const int CN_LITHUANIA = 63;
    public const int CN_LUXEMBOURG = 64;
    public const int CN_MACAO = 65;
    public const int CN_MACEDONIA = 66;
    public const int CN_MALAYSIA = 67;
    public const int CN_MALDIVES = 123;
    public const int CN_MALTA = 124;
    public const int CN_MEXOCI = 68;
    public const int CN_MONACO = 70;
    public const int CN_MONGOLIA = 71;
    public const int CN_MONTENEGRO = 125;
    public const int CN_MOROCCO = 72;
    public const int CN_NEPAL = 126;
    public const int CN_NETHERLANDS = 73;
    public const int CN_NEWZEALAND = 74;
    public const int CN_NICARAGUA = 75;
    public const int CN_NIGERIA = 127;
    public const int CN_NORWAY = 76;
    public const int CN_OMAN = 77;
    public const int CN_PAKISTAN = 78;
    public const int CN_PANAMA = 79;
    public const int CN_PARAGUAY = 80;
    public const int CN_PERY = 81;
    public const int CN_PHILIPPINES = 82;
    public const int CN_POLAND = 83;
    public const int CN_PORTUGAL = 84;
    public const int CN_PUERTORICO = 85;
    public const int CN_QATAR = 86;
    public const int CN_ROMANIA = 87;
    public const int CN_RUSSIA = 88;
    public const int CN_RWANDA = 128;
    public const int CN_SAUDIARABIA = 89;
    public const int CN_SENEGAL = 129;
    public const int CN_SERBIA = 130;
    public const int CN_SERBIAMONTENEGRO = 90;
    public const int CN_SINGAROPE = 91;
    public const int CN_SLOVAKIA = 92;
    public const int CN_SLOVENIA = 93;
    public const int CN_SOUTHAFRICA = 94;
    public const int CN_SPAIN = 95;
    public const int CN_SRILANKA = 131;
    public const int CN_SWEDEN = 96;
    public const int CN_SWITZERLAND = 97;
    public const int CN_SYRIAN = 132;
    public const int CN_TAIWAN = 98;
    public const int CN_TAJIKISTAN = 99;
    public const int CN_THAILAND = 100;
    public const int CN_TRINIDADTOBAGO = 101;
    public const int CN_TUNISIA = 102;
    public const int CN_TURKEY = 103;
    public const int CN_TURKMENISTAN = 133;
    public const int CN_UKRAINE = 104;
    public const int CN_UAE = 105;
    public const int CN_UNITEDKINGDOM = 106;
    public const int CN_USA = 107;
    public const int CN_URUGUAY = 108;
    public const int CN_UZBEKISTAN = 109;
    public const int CN_VENEZUELA = 110;
    public const int CN_VIETNAM = 111;
    public const int CN_YEMEN = 112;
    public const int CN_ZIMBABWE = 113;

    public struct TKeyCountries
    {
        public string Name;
        public int Code;
        public TKeyCountries(string _Name, int _Code)
        {
            Name = _Name;
            Code = _Code;
        }
    }

    public TKeyCountries[] KEY_COUNTRIES = new TKeyCountries[127] 
    { 
        new TKeyCountries("Afghanistan"               , CN_AFGHANISTAN      ),
        new TKeyCountries("Albania"                   , CN_ALBANIA          ),
        new TKeyCountries("Algeria"                   , CN_ALGERIA          ),
        new TKeyCountries("Argentina"                 , CN_ARGENTINA        ),
        new TKeyCountries("Armenia"                   , CN_ARMENIA          ),
        new TKeyCountries("Australia"                 , CN_AUSTRALIA        ),
        new TKeyCountries("Austria"                   , CN_AUSTRIA          ),
        new TKeyCountries("Azerbaijan"                , CN_AZERBAIJAN       ),
        new TKeyCountries("Bahrain"                   , CN_BAHRAIN          ),
        new TKeyCountries("Bangladesh"                , CN_BANGLADESH       ),
        new TKeyCountries("Belarus"                   , CN_BELARUS          ),
        new TKeyCountries("Belgium"                   , CN_BELGIUM          ),
        new TKeyCountries("Belize"                    , CN_BELIZE           ),
        new TKeyCountries("Bolivia"                   , CN_BOLIVIA          ),
        new TKeyCountries("Bosnia and Herzegovina"    , CN_BOSNIA           ),
        new TKeyCountries("Brazil"                    , CN_BRAZIL           ),
        new TKeyCountries("Brunei Darussalam"         , CN_BRUNEI           ),
        new TKeyCountries("Bulgaria"                  , CN_BULGARIA         ),
        new TKeyCountries("Cambodia"                  , CN_CAMBODIA         ),
        new TKeyCountries("Canada"                    , CN_CANADA           ),
        new TKeyCountries("Caribbean"                 , CN_CARRIBEAN        ),
        new TKeyCountries("Chile"                     , CN_CHILE            ),
        new TKeyCountries("China"                     , CN_CHINA            ),
        new TKeyCountries("Colombia"                  , CN_COLOMBIA         ),
        new TKeyCountries("Costa Rica"                , CN_COSTARICA        ),
        new TKeyCountries("Croatia"                   , CN_CROATIA          ),
        new TKeyCountries("Czech Republic"            , CN_CZECH            ),
        new TKeyCountries("Denmark"                   , CN_DENMARK          ),
        new TKeyCountries("Dominican Republic"        , CN_DOMINICAN        ),
        new TKeyCountries("Ecuador"                   , CN_ECUADOR          ),
        new TKeyCountries("Egypt"                     , CN_EGYPT            ),
        new TKeyCountries("El Salvador"               , CN_ELSALVADOR       ),
        new TKeyCountries("Estonia"                   , CN_ESTONIA          ),
        new TKeyCountries("Ethiopia"                  , CN_ETHIOPIA         ),
        new TKeyCountries("Faroe Islands"             , CN_FAROE            ),
        new TKeyCountries("Finland"                   , CN_FINLAND          ),
        new TKeyCountries("France"                    , CN_FRANCE           ),
        new TKeyCountries("Georgia"                   , CN_GEORGIA          ),
        new TKeyCountries("Germany"                   , CN_GERMANY          ),
        new TKeyCountries("Greece"                    , CN_GREECE           ),
        new TKeyCountries("Greenland"                 , CN_GREENLAND        ),
        new TKeyCountries("Guatemala"                 , CN_GUATEMALA        ),
        new TKeyCountries("Honduras"                  , CN_HONDURAS         ),
        new TKeyCountries("Hong Kong"                 , CN_HONGKONG         ),
        new TKeyCountries("Hungary"                   , CN_HUNGARU          ),
        new TKeyCountries("Iceland"                   , CN_ICELAND          ),
        new TKeyCountries("India"                     , CN_INDIA            ),
        new TKeyCountries("Indonesia"                 , CN_INDONESIA        ),
        new TKeyCountries("Iran"                      , CN_IRAN             ),
        new TKeyCountries("Iraq"                      , CN_IRAQ             ),
        new TKeyCountries("Ireland"                   , CN_IRELAND          ),
        new TKeyCountries("Israel"                    , CN_ISRAEL           ),
        new TKeyCountries("Italy"                     , CN_ITALY            ),
        new TKeyCountries("Jamaica"                   , CN_JAMAICA          ),
        new TKeyCountries("Japan"                     , CN_JAPAN            ),
        new TKeyCountries("Jordan"                    , CN_JORDAN           ),
        new TKeyCountries("Kazakhstan"                , CN_KAZAKHSTAN       ),
        new TKeyCountries("Kenya"                     , CN_KENYA            ),
        new TKeyCountries("Korea"                     , CN_KOREA            ),
        new TKeyCountries("Kuwait"                    , CN_KUWAIT           ),
        new TKeyCountries("Kyrgyzstan"                , CN_KYRGYZSTAN       ),
        new TKeyCountries("Laos"                      , CN_LAOS             ),
        new TKeyCountries("Latvia"                    , CN_LATVIA           ),
        new TKeyCountries("Lebanon"                   , CN_LEBANON          ),
        new TKeyCountries("Libyan"                    , CN_LIBYAN           ),
        new TKeyCountries("Liechtenstein"             , CN_LIECHTENSTEIN    ),
        new TKeyCountries("Lithuania"                 , CN_LITHUANIA        ),
        new TKeyCountries("Luxembourg"                , CN_LUXEMBOURG       ),
        new TKeyCountries("Macao"                     , CN_MACAO            ),
        new TKeyCountries("Macedonia"                 , CN_MACEDONIA        ),
        new TKeyCountries("Malaysia"                  , CN_MALAYSIA         ),
        new TKeyCountries("Maldives"                  , CN_MALDIVES         ),
        new TKeyCountries("Malta"                     , CN_MALTA            ),
        new TKeyCountries("Mexico"                    , CN_MEXOCI           ),
        new TKeyCountries("Monaco"                    , CN_MONACO           ),
        new TKeyCountries("Mongolia"                  , CN_MONGOLIA         ),
        new TKeyCountries("Montenegro"                , CN_MONTENEGRO       ),
        new TKeyCountries("Morocco"                   , CN_MOROCCO          ),
        new TKeyCountries("Nepal"                     , CN_NEPAL            ),
        new TKeyCountries("Netherlands"               , CN_NETHERLANDS      ),
        new TKeyCountries("New Zealand"               , CN_NEWZEALAND       ),
        new TKeyCountries("Nicaragua"                 , CN_NICARAGUA        ),
        new TKeyCountries("Nigeria"                   , CN_NIGERIA          ),
        new TKeyCountries("Norway"                    , CN_NORWAY           ),
        new TKeyCountries("Oman"                      , CN_OMAN             ),
        new TKeyCountries("Pakistan"                  , CN_PAKISTAN         ),
        new TKeyCountries("Panama"                    , CN_PANAMA           ),
        new TKeyCountries("Paraguay"                  , CN_PARAGUAY         ),
        new TKeyCountries("Peru"                      , CN_PERY             ),
        new TKeyCountries("Philippines"               , CN_PHILIPPINES      ),
        new TKeyCountries("Poland"                    , CN_POLAND           ),
        new TKeyCountries("Portugal"                  , CN_PORTUGAL         ),
        new TKeyCountries("Puerto Rico"               , CN_PUERTORICO       ),
        new TKeyCountries("Qatar"                     , CN_QATAR            ),
        new TKeyCountries("Romania"                   , CN_ROMANIA          ),
        new TKeyCountries("Russia"                    , CN_RUSSIA           ),
        new TKeyCountries("Rwanda"                    , CN_RWANDA           ),
        new TKeyCountries("Saudi Arabia"              , CN_SAUDIARABIA      ),
        new TKeyCountries("Senegal"                   , CN_SENEGAL          ),
        new TKeyCountries("Serbia"                    , CN_SERBIA           ),
        new TKeyCountries("Serbia and Montenegro"     , CN_SERBIAMONTENEGRO ),
        new TKeyCountries("Singapore"                 , CN_SINGAROPE        ),
        new TKeyCountries("Slovakia"                  , CN_SLOVAKIA         ),
        new TKeyCountries("Slovenia"                  , CN_SLOVENIA         ),
        new TKeyCountries("South Africa"              , CN_SOUTHAFRICA      ),
        new TKeyCountries("Spain"                     , CN_SPAIN            ),
        new TKeyCountries("Sri Lanka"                 , CN_SRILANKA         ),
        new TKeyCountries("Sweden"                    , CN_SWEDEN           ),
        new TKeyCountries("Switzerland"               , CN_SWITZERLAND      ),
        new TKeyCountries("Syrian"                    , CN_SYRIAN           ),
        new TKeyCountries("Taiwan"                    , CN_TAIWAN           ),
        new TKeyCountries("Tajikistan"                , CN_TAJIKISTAN       ),
        new TKeyCountries("Thailand"                  , CN_THAILAND         ),
        new TKeyCountries("Trinidad and Tobago"       , CN_TRINIDADTOBAGO   ),
        new TKeyCountries("Tunisia"                   , CN_TUNISIA          ),
        new TKeyCountries("Turkey"                    , CN_TURKEY           ),
        new TKeyCountries("Turkmenistan"              , CN_TURKMENISTAN     ),
        new TKeyCountries("Ukraine"                   , CN_UKRAINE          ),
        new TKeyCountries("United Arab Emirates"      , CN_UAE              ),
        new TKeyCountries("United Kingdom"            , CN_UNITEDKINGDOM    ),
        new TKeyCountries("United States"             , CN_USA              ),
        new TKeyCountries("Uruguay"                   , CN_URUGUAY          ),
        new TKeyCountries("Uzbekistan"                , CN_UZBEKISTAN       ),
        new TKeyCountries("Venezuela"                 , CN_VENEZUELA        ),
        new TKeyCountries("Viet Nam"                  , CN_VIETNAM          ),
        new TKeyCountries("Yemen"                     , CN_YEMEN            ),
        new TKeyCountries("Zimbabwe"                  , CN_ZIMBABWE         )
    };


    public struct TKeyVerifyParams
    {
        public string RegInfo;           // {in} registration info/name
        public Int32 RegInfoLen;         // {in} registration info/name size
        public Int32 KeyMode;            // {in} key generation mode (~RSA ???)
        public Int32 KeyBase;            // {in} key output base (Base ???)
        public string Key;               // {in} buffer for registration key
        public Int32 KeyLen;             // {in} registration key size
        public Int32 CreationYear;       // {out} key creation year
        public Int32 CreationMonth;      // {out} key creation month
        public Int32 CreationDay;        // {out} key creation day
        public bool UseKeyExpiration;    // {out} has key expiration date?
        public Int32 ExpirationYear;     // {out} key expiration year
        public Int32 ExpirationMonth;    // {out} key expiration month
        public Int32 ExpirationDay;      // {out} key expiration day
        public bool UseHardwareLocking;  // {in} hardware locked key
        public string HardwareID;        // {in} pointer to null terminated hardware string
        public bool UseExecutionsLimit;  // {out} limit key by executions?
        public Int32 ExecutionsCount;    // {out} number of executions
        public bool UseDaysLimit;        // {out} limit key by days?
        public Int32 DaysCount;          // {out} number of days
        public bool UseRunTimeLimit;     // {out} limit key by run time?
        public Int32 RunTimeMinutes;     // {out} run time minutes
        public bool UseGlobalTimeLimit;  // {out} limit key by global time?
        public Int32 GlobalTimeMinutes;  // {out} global time minutes
        public bool UseCountyLimit;      // {out} limit key by country?
        public Int32 CountryCode;        // {out} country code
        public bool UseRegisterAfter;    // {out} register key after date?
        public Int32 RegisterAfterYear;  // {out} register after year
        public Int32 RegisterAfterMonth; // {out} register after month
        public Int32 RegisterAfterDay;   // {out} register after day
        public bool UseRegisterBefore;   // {out} register key before date?
        public Int32 RegisterBeforeYear; // {out} register before year
        public Int32 RegisterBeforeMonth;// {out} register before month
        public Int32 RegisterBeforeDay;  // {out} register before day
        public Int32 EncryptedConstant;  // {in} Encryption Constant - should be extracted from project file
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = NUMBER_OF_CRYPTED_SECTIONS)]
        public byte[] EncryptedSections; // {out} Crypted sections        
        public string PublicKey;         // {in} Public Key - should be extracted from project file
    }

    public struct TKeyVerifyParamsA
    {
        public string RegInfo;           // {in} registration info/name
        public Int32 KeyMode;            // {in} key generation mode (~RSA ???)
        public Int32 KeyBase;            // {in} key output base (Base ???)
        public string Key;               // {in} buffer for registration key
        public Int32 KeyLen;             // {in} registration key size
        public Int32 CreationYear;       // {out} key creation year
        public Int32 CreationMonth;      // {out} key creation month
        public Int32 CreationDay;        // {out} key creation day
        public bool UseKeyExpiration;    // {out} has key expiration date?
        public Int32 ExpirationYear;     // {out} key expiration year
        public Int32 ExpirationMonth;    // {out} key expiration month
        public Int32 ExpirationDay;      // {out} key expiration day
        public bool UseHardwareLocking;  // {in} hardware locked key
        public string HardwareID;        // {in} pointer to null terminated hardware string
        public bool UseExecutionsLimit;  // {out} limit key by executions?
        public Int32 ExecutionsCount;    // {out} number of executions
        public bool UseDaysLimit;        // {out} limit key by days?
        public Int32 DaysCount;          // {out} number of days
        public bool UseRunTimeLimit;     // {out} limit key by run time?
        public Int32 RunTimeMinutes;     // {out} run time minutes
        public bool UseGlobalTimeLimit;  // {out} limit key by global time?
        public Int32 GlobalTimeMinutes;  // {out} global time minutes
        public bool UseCountyLimit;      // {out} limit key by country?
        public Int32 CountryCode;        // {out} country code
        public bool UseRegisterAfter;    // {out} register key after date?
        public Int32 RegisterAfterYear;  // {out} register after year
        public Int32 RegisterAfterMonth; // {out} register after month
        public Int32 RegisterAfterDay;   // {out} register after day
        public bool UseRegisterBefore;   // {out} register key before date?
        public Int32 RegisterBeforeYear; // {out} register before year
        public Int32 RegisterBeforeMonth;// {out} register before month
        public Int32 RegisterBeforeDay;  // {out} register before day
        public Int32 EncryptedConstant;  // {in} Encryption Constant - should be extracted from project file
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = NUMBER_OF_CRYPTED_SECTIONS)]
        public byte[] EncryptedSections; // {out} Crypted sections        
        public string PublicKey;         // {in} Public Key - should be extracted from project file
    }

    public struct TKeyVerifyParamsW
    {
        [MarshalAs(UnmanagedType.LPWStr)]
        public string RegInfo;           // {in} registration info/name
        public Int32 KeyMode;            // {in} key generation mode (~RSA ???)
        public Int32 KeyBase;            // {in} key output base (Base ???)
        [MarshalAs(UnmanagedType.LPWStr)]
        public string Key;               // {in} buffer for registration key
        public Int32 KeyLen;             // {in} registration key size
        public Int32 CreationYear;       // {out} key creation year
        public Int32 CreationMonth;      // {out} key creation month
        public Int32 CreationDay;        // {out} key creation day
        public bool UseKeyExpiration;    // {out} has key expiration date?
        public Int32 ExpirationYear;     // {out} key expiration year
        public Int32 ExpirationMonth;    // {out} key expiration month
        public Int32 ExpirationDay;      // {out} key expiration day
        public bool UseHardwareLocking;  // {in} hardware locked key
        [MarshalAs(UnmanagedType.LPWStr)]
        public string HardwareID;        // {in} pointer to null terminated hardware string
        public bool UseExecutionsLimit;  // {out} limit key by executions?
        public Int32 ExecutionsCount;    // {out} number of executions
        public bool UseDaysLimit;        // {out} limit key by days?
        public Int32 DaysCount;          // {out} number of days
        public bool UseRunTimeLimit;     // {out} limit key by run time?
        public Int32 RunTimeMinutes;     // {out} run time minutes
        public bool UseGlobalTimeLimit;  // {out} limit key by global time?
        public Int32 GlobalTimeMinutes;  // {out} global time minutes
        public bool UseCountyLimit;      // {out} limit key by country?
        public Int32 CountryCode;        // {out} country code
        public bool UseRegisterAfter;    // {out} register key after date?
        public Int32 RegisterAfterYear;  // {out} register after year
        public Int32 RegisterAfterMonth; // {out} register after month
        public Int32 RegisterAfterDay;   // {out} register after day
        public bool UseRegisterBefore;   // {out} register key before date?
        public Int32 RegisterBeforeYear; // {out} register before year
        public Int32 RegisterBeforeMonth;// {out} register before month
        public Int32 RegisterBeforeDay;  // {out} register before day
        public Int32 EncryptedConstant;  // {in} Encryption Constant - should be extracted from project file
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = NUMBER_OF_CRYPTED_SECTIONS)]
        public byte[] EncryptedSections; // {out} Crypted sections        
        [MarshalAs(UnmanagedType.LPWStr)]
        public string PublicKey;         // {in} Public Key - should be extracted from project file
    }

    public struct TKeyGenParams
    {
        public Int32 KeyMode;            // {in} key generation mode (~RSA ???)
        public Int32 KeyBase;            // {in} key output base (Base ???)
        public bool KeyWithHyphens;      // {in} add hyphens to the key?
        public string Key;               // {in} buffer for registration key
        public Int32 KeyLen;             // {in} registration key buffer size
        public string RegInfo;           // {in} registration info/name
        public Int32 RegInfoLen;         // {in} registration info/name size
        public bool UseKeyExpiration;    // {in} use key expiration?
        public Int32 ExpirationYear;     // {in} key expiration year
        public Int32 ExpirationMonth;    // {in} key expiration month
        public Int32 ExpirationDay;      // {in} key expiration day
        public bool UseHardwareLocking;  // {in} is key hardware locked?
        public string HardwareID;        // {in} pointer to null terminated hardware string
        public bool UseExecutionsLimit;  // {in} limit key by executions?
        public Int32 ExecutionsCount;    // {in} number of executions
        public bool UseDaysLimit;        // {in} limit key by days?
        public Int32 DaysCount;          // {in} number of days
        public bool UseRunTimeLimit;     // {in} limit key by run time?
        public Int32 RunTimeMinutes;     // {in} run time minutes
        public bool UseGlobalTimeLimit;  // {in} limit key by global time?
        public Int32 GlobalTimeMinutes;  // {in} global time minutes
        public bool UseCountyLimit;      // {in} limit key by country?
        public Int32 CountryCode;        // {in} country code
        public bool UseRegisterAfter;    // {in} register key after date?
        public Int32 RegisterAfterYear;  // {in} register after year
        public Int32 RegisterAfterMonth; // {in} register after month
        public Int32 RegisterAfterDay;   // {in} register after day
        public bool UseRegisterBefore;   // {in} register key before date?
        public Int32 RegisterBeforeYear; // {in} register before year
        public Int32 RegisterBeforeMonth;// {in} register before month
        public Int32 RegisterBeforeDay;  // {in} register before day
        public Int32 EncryptedConstant;  // {in} Encryption Constant - should be extracted from project file
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = NUMBER_OF_CRYPTED_SECTIONS)]
        public byte[] EncryptedSections; // {in} Crypted sections
        public string PrivateKey;        // {in} Private Key - should be extracted from project file
        public string PublicKey;         // {in} Public Key - should be extracted from project file
    }
    public struct TKeyGenParamsA
    {
        public Int32 KeyMode;            // {in} key generation mode (~RSA ???)
        public Int32 KeyBase;            // {in} key output base (Base ???)
        public bool KeyWithHyphens;      // {in} add hyphens to the key?
        public string Key;               // {in} buffer for registration key
        public Int32 KeyLen;             // {in} registration key buffer size
        public string RegInfo;           // {in} registration info/name
        public bool UseKeyExpiration;    // {in} use key expiration?
        public Int32 ExpirationYear;     // {in} key expiration year
        public Int32 ExpirationMonth;    // {in} key expiration month
        public Int32 ExpirationDay;      // {in} key expiration day
        public bool UseHardwareLocking;  // {in} is key hardware locked?
        public string HardwareID;        // {in} pointer to null terminated hardware string
        public bool UseExecutionsLimit;  // {in} limit key by executions?
        public Int32 ExecutionsCount;    // {in} number of executions
        public bool UseDaysLimit;        // {in} limit key by days?
        public Int32 DaysCount;          // {in} number of days
        public bool UseRunTimeLimit;     // {in} limit key by run time?
        public Int32 RunTimeMinutes;     // {in} run time minutes
        public bool UseGlobalTimeLimit;  // {in} limit key by global time?
        public Int32 GlobalTimeMinutes;  // {in} global time minutes
        public bool UseCountyLimit;      // {in} limit key by country?
        public Int32 CountryCode;        // {in} country code
        public bool UseRegisterAfter;    // {in} register key after date?
        public Int32 RegisterAfterYear;  // {in} register after year
        public Int32 RegisterAfterMonth; // {in} register after month
        public Int32 RegisterAfterDay;   // {in} register after day
        public bool UseRegisterBefore;   // {in} register key before date?
        public Int32 RegisterBeforeYear; // {in} register before year
        public Int32 RegisterBeforeMonth;// {in} register before month
        public Int32 RegisterBeforeDay;  // {in} register before day
        public Int32 EncryptedConstant;  // {in} Encryption Constant - should be extracted from project file
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = NUMBER_OF_CRYPTED_SECTIONS)]
        public byte[] EncryptedSections; // {in} Crypted sections
        public string PrivateKey;        // {in} Private Key - should be extracted from project file
        public string PublicKey;         // {in} Public Key - should be extracted from project file
    }
    public struct TKeyGenParamsW
    {
        public Int32 KeyMode;            // {in} key generation mode (~RSA ???)
        public Int32 KeyBase;            // {in} key output base (Base ???)
        public bool KeyWithHyphens;      // {in} add hyphens to the key?
        [MarshalAs(UnmanagedType.LPWStr)]
        public string Key;               // {in} buffer for registration key
        public Int32 KeyLen;             // {in} registration key buffer size
        [MarshalAs(UnmanagedType.LPWStr)]
        public string RegInfo;           // {in} registration info/name
        public bool UseKeyExpiration;    // {in} use key expiration?
        public Int32 ExpirationYear;     // {in} key expiration year
        public Int32 ExpirationMonth;    // {in} key expiration month
        public Int32 ExpirationDay;      // {in} key expiration day
        public bool UseHardwareLocking;  // {in} is key hardware locked?
        [MarshalAs(UnmanagedType.LPWStr)]
        public string HardwareID;        // {in} pointer to null terminated hardware string
        public bool UseExecutionsLimit;  // {in} limit key by executions?
        public Int32 ExecutionsCount;    // {in} number of executions
        public bool UseDaysLimit;        // {in} limit key by days?
        public Int32 DaysCount;          // {in} number of days
        public bool UseRunTimeLimit;     // {in} limit key by run time?
        public Int32 RunTimeMinutes;     // {in} run time minutes
        public bool UseGlobalTimeLimit;  // {in} limit key by global time?
        public Int32 GlobalTimeMinutes;  // {in} global time minutes
        public bool UseCountyLimit;      // {in} limit key by country?
        public Int32 CountryCode;        // {in} country code
        public bool UseRegisterAfter;    // {in} register key after date?
        public Int32 RegisterAfterYear;  // {in} register after year
        public Int32 RegisterAfterMonth; // {in} register after month
        public Int32 RegisterAfterDay;   // {in} register after day
        public bool UseRegisterBefore;   // {in} register key before date?
        public Int32 RegisterBeforeYear; // {in} register before year
        public Int32 RegisterBeforeMonth;// {in} register before month
        public Int32 RegisterBeforeDay;  // {in} register before day
        public Int32 EncryptedConstant;  // {in} Encryption Constant - should be extracted from project file
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = NUMBER_OF_CRYPTED_SECTIONS)]
        public byte[] EncryptedSections; // {in} Crypted sections
        [MarshalAs(UnmanagedType.LPWStr)]
        public string PrivateKey;        // {in} Private Key - should be extracted from project file
        [MarshalAs(UnmanagedType.LPWStr)]
        public string PublicKey;         // {in} Public Key - should be extracted from project file
    }

    // Enigma keygen API
    [DllImport("keygen64.dll")]
    public static extern uint KG_GenerateRegistrationKey(ref TKeyGenParams kg);
    [DllImport("keygen64.dll", CharSet = CharSet.Ansi)]
    public static extern uint KG_GenerateRegistrationKeyA(ref TKeyGenParamsA kg);
    [DllImport("keygen64.dll", CharSet = CharSet.Unicode)]
    public static extern uint KG_GenerateRegistrationKeyW(ref TKeyGenParamsW kg);

    [DllImport("keygen64.dll")]
    public static extern uint KG_GenerateRegistrationKeyFromProject(string FileName, ref TKeyGenParams kg);
    [DllImport("keygen64.dll", CharSet = CharSet.Ansi)]
    public static extern uint KG_GenerateRegistrationKeyFromProjectA(string FileName, ref TKeyGenParamsA kg);
    [DllImport("keygen64.dll", CharSet = CharSet.Unicode)]
    public static extern uint KG_GenerateRegistrationKeyFromProjectW(string FileName, ref TKeyGenParamsW kg);

    [DllImport("keygen64.dll")]
    public static extern uint KG_VerifyRegistrationInfo(ref TKeyVerifyParams kv);
    [DllImport("keygen64.dll", CharSet = CharSet.Ansi)]
    public static extern uint KG_VerifyRegistrationInfoA(ref TKeyVerifyParamsA kv);
    [DllImport("keygen64.dll", CharSet = CharSet.Unicode)]
    public static extern uint KG_VerifyRegistrationInfoW(ref TKeyVerifyParamsW kv);

    [DllImport("keygen64.dll")]
    public static extern uint KG_VerifyRegistrationInfoFromProject(string FileName, ref TKeyVerifyParams kv);
    [DllImport("keygen64.dll", CharSet = CharSet.Ansi)]
    public static extern uint KG_VerifyRegistrationInfoFromProjectA(string FileName, ref TKeyVerifyParamsA kv);
    [DllImport("keygen64.dll", CharSet = CharSet.Unicode)]
    public static extern uint KG_VerifyRegistrationInfoFromProjectW(string FileName, ref TKeyVerifyParamsW kv);
}
