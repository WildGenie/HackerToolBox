/// Enigma API implementation
/// 
using System;
using System.Text;
using System.Runtime.InteropServices;

/// <summary>
/// Summary description for Enigma_IDE
/// </summary>
public class Enigma_IDE
{
    
    public const int WM_PUBLIC = 1;
    public const int WM_PRIVATE = 2;

    public const int MAX_STRING_SIZE = 255;

    // Number of crypted sections
    public const int NUMBER_OF_CRYPTED_SECTIONS = 16;

    // Ctypt hash types, possible hash values for functions:
    // EP_CryptHashBuffer
    // EP_CryptHashStringA
    // EP_CryptHashStringW
    // EP_CryptHashFileA
    // EP_CryptHashFileW
    public const int HASH_XOR32 = 0;
    public const int HASH_MD2 = 1;
    public const int HASH_MD5 = 2;
    public const int HASH_RipeMD160 = 3;
    public const int HASH_SH1 = 4;
    public const int HASH_SHA224 = 5;
    public const int HASH_SHA256 = 6;
    public const int HASH_SHA384 = 7;
    public const int HASH_SHA512 = 8;

    // Return values of EP_RegKeyStatus
    public const int KEY_STATUS_DOESNOTEXIST = 0;
    public const int KEY_STATUS_VALID = 1;
    public const int KEY_STATUS_INVALID = 2;
    public const int KEY_STATUS_STOLEN = 3;
    public const int KEY_STATUS_DATEEXPIRED = 4;
    public const int KEY_STATUS_WITHOUTHARDWARELOCK = 5;
    public const int KEY_STATUS_WITHOUTEXPIRATIONDATE = 6;
    public const int KEY_STATUS_WITHOUTREGISTERAFTERDATE = 7;
    public const int KEY_STATUS_WITHOUTREGISTERBEFOREDATE = 8;
    public const int KEY_STATUS_WITHOUTEXECUTIONSLIMIT = 9;
    public const int KEY_STATUS_WITHOUTDAYSLIMIT = 10;
    public const int KEY_STATUS_WITHOUTRUNTIMELIMIT = 11;
    public const int KEY_STATUS_WITHOUTGLOBALTIMELIMIT = 12;
    public const int KEY_STATUS_WITHOUTCOUNTRYLOCK = 13;
    public const int KEY_STATUS_COUNTRYINVALID = 14;
    public const int KEY_STATUS_REGISTERAFTERFAILED = 15;
    public const int KEY_STATUS_REGISTERBEFOREFAILED = 16;
    public const int KEY_STATUS_EXECUTIONSEXPIRED = 17;
    public const int KEY_STATUS_DAYSEXPIRED = 18;
    public const int KEY_STATUS_RUNTIMEEXPIRED = 19;
    public const int KEY_STATUS_GLOBALTIMEEXPIRED = 20;
    public const int KEY_STATUS_HARDWARECHANGESEXCEEDED_VOLUMESERIAL = 21;
    public const int KEY_STATUS_HARDWARECHANGESEXCEEDED_VOLUMENAME = 22;
    public const int KEY_STATUS_HARDWARECHANGESEXCEEDED_COMPUTERNAME = 23;
    public const int KEY_STATUS_HARDWARECHANGESEXCEEDED_CPU = 24;
    public const int KEY_STATUS_HARDWARECHANGESEXCEEDED_MOTHERBOARD = 25;
    public const int KEY_STATUS_HARDWARECHANGESEXCEEDED_WINDOWSKEY = 26;
    public const int KEY_STATUS_HARDWARECHANGESEXCEEDED_HDDSERIAL = 27;
    public const int KEY_STATUS_HARDWARECHANGESEXCEEDED_USERNAME = 28;

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

    public static TKeyCountries[] KEY_COUNTRIES = new TKeyCountries[127] 
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

    // Type for watermark content for EP_MiscGetWatermark
    public struct TWMContent
    {
        public Int32 WMType;
        public string Name;
        public Int32 NameLen;
        public string Text;
        public Int32 TextLen;
        public string FileName;
        public Int32 FileNameLen;
        public string AFile;
        public Int32 AFileLen;
    }

    public struct TKeyInformation
    {
        public bool Stolen;               // {out} is key stolen
        public Int32 CreationYear;        // {out} key creation year
        public Int32 CreationMonth;       // {out} key creation month
        public Int32 CreationDay;         // {out} key creation day
        public bool UseKeyExpiration;     // {out} has key expiration date?
        public Int32 ExpirationYear;      // {out} key expiration year
        public Int32 ExpirationMonth;     // {out} key expiration month
        public Int32 ExpirationDay;       // {out} key expiration day
        public bool UseHardwareLocking;   // {out} hardware locked key
        public bool UseExecutionsLimit;   // {out} limit key by executions?
        public Int32 ExecutionsCount;     // {out} number of executions
        public bool UseDaysLimit;         // {out} limit key by days?
        public Int32 DaysCount;           // {out} number of days
        public bool UseRunTimeLimit;      // {out} limit key by run time?
        public Int32 RunTimeMinutes;      // {out} run time minutes
        public bool UseGlobalTimeLimit;   // {out} limit key by global time?
        public Int32 GlobalTimeMinutes;   // {out} global time minutes
        public bool UseCountyLimit;       // {out} limit key by country?
        public Int32 CountryCode;         // {out} country code
        public bool UseRegisterAfter;     // {out} register key after date?
        public Int32 RegisterAfterYear;   // {out} register after year
        public Int32 RegisterAfterMonth;  // {out} register after month
        public Int32 RegisterAfterDay;    // {out} register after day
        public bool UseRegisterBefore;    // {out} register key before date?
        public Int32 RegisterBeforeYear;  // {out} register before year
        public Int32 RegisterBeforeMonth; // {out} register before month
        public Int32 RegisterBeforeDay;   // {out} register before day
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = NUMBER_OF_CRYPTED_SECTIONS)]
        public bool[] EncryptedSections; // {out} Crypted sections     
    }

    // Enigma API for registration
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegSaveKey(string Name, string Key);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegSaveKeyA(string Name, string Key);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegSaveKeyW(string Name, string Key);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegLoadKey(ref string Name, ref string Key);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegLoadKeyA(ref string Name, ref string Key);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegLoadKeyW(ref string Name, ref string Key);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegCheckKey(string Name, string Key);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegCheckKeyA(string Name, string Key);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegCheckKeyW(string Name, string Key);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegDeleteKey();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegLoadAndCheckKey();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegCheckAndSaveKey(string Name, string Key);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegCheckAndSaveKeyA(string Name, string Key);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegCheckAndSaveKeyW(string Name, string Key);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern string EP_RegHardwareID();
    [DllImport("enigma_ide.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
    public static extern string EP_RegHardwareIDA();
    [DllImport("enigma_ide.dll", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    public static extern string EP_RegHardwareIDW();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyCreationDate(ref Int32 Year, ref Int32 Month, ref Int32 Day);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyCreationDateEx();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyExpirationDate(ref Int32 Year, ref Int32 Month, ref Int32 Day);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyExpirationDateEx();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyExecutions(ref Int32 Total, ref Int32 Left);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyExecutionsTotal();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyExecutionsLeft();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyDays(ref Int32 Total, ref Int32 Left);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyDaysTotal();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyDaysLeft();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyRuntime(ref Int32 Total, ref Int32 Left);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyRuntimeTotal();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyRuntimeLeft();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyGlobalTime(ref Int32 Total, ref Int32 Left);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyGlobalTimeTotal();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyGlobalTimeLeft();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyRegisterAfterDate(ref Int32 Year, ref Int32 Month, ref Int32 Day);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyRegisterAfterDateEx();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyRegisterBeforeDate(ref Int32 Year, ref Int32 Month, ref Int32 Day);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyRegisterBeforeDateEx();
    [DllImport("enigma_ide.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyInformation(string AName, string AKey, ref TKeyInformation AKeyInfo);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyInformationA(string AName, string AKey, ref TKeyInformation AKeyInfo);
    [DllImport("enigma_ide.dll", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_RegKeyInformationW(string AName, string AKey, ref TKeyInformation AKeyInfo);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_RegKeyStatus();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern void EP_RegShowDialog();

    // Enigma API for trial
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_TrialExecutions(ref Int32 Total, ref Int32 Left);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialExecutionsTotal();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialExecutionsLeft();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_TrialDays(ref Int32 Total, ref Int32 Left);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialDaysTotal();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialDaysLeft();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_TrialExpirationDate(ref Int32 Year, ref Int32 Month, ref Int32 Day);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialExpirationDateEx();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_TrialDateTillDate(ref Int32 StartYear, ref Int32 StartMonth, ref Int32 StartDay, ref Int32 EndYear, ref Int32 EndMonth, ref Int32 EndDay);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialDateTillDateStartEx();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialDateTillDateEndEx();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_TrialExecutionTime(ref Int32 Total, ref Int32 Left);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialExecutionTimeTotal();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_TrialExecutionTimeLeft();

    // Misc API
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern Int32 EP_MiscGetWatermark(Int32 ID, TWMContent WM);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_MiscCountryCode();

    // Protection API
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern Int32 EP_ProtectedStringByID(Int32 ID, StringBuilder Str, Int32 Len);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern Int32 EP_ProtectedStringByKey(string Key, StringBuilder Str, Int32 Len);

    // Crypt API
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_CryptHashBuffer(int Hash, IntPtr Buffer, int Size, IntPtr Digest);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_CryptHashFileA(int Hash, string FileName, IntPtr Digest);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_CryptHashFileW(int Hash, string FileName, IntPtr Digest);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_CryptHashStringA(int Hash, string Str, IntPtr Digest);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_CryptHashStringW(int Hash, string Str, IntPtr Digest);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern void EP_CryptEncryptBuffer(IntPtr Buffer, int Size, string Key);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern void EP_CryptEncryptBufferEx(IntPtr InBuffer, IntPtr OutBuffer, int Size, IntPtr Key, int KeySize);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern void EP_CryptDecryptBuffer(IntPtr Buffer, int Size, string Key);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern void EP_CryptDecryptBufferEx(IntPtr InBuffer, IntPtr OutBuffer, int Size, IntPtr Key, int KeySize);

    // Checkup API
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_CheckupCopies(ref Int32 Total, ref Int32 Current);
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_CheckupCopiesTotal();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_CheckupCopiesCurrent();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_CheckupIsProtected();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_CheckupIsEnigmaOk();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern bool EP_CheckupVirtualizationTools();
    
    // Enigma API
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_EnigmaVersion();

    // Splash Screen API
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern int EP_SplashScreenShow();
    [DllImport("enigma_ide.dll", CallingConvention = CallingConvention.StdCall)]
    public static extern void EP_SplashScreenHide();
}
