Attribute VB_Name = "enigma_ide"
' Declaration of Enigma API functions
Public Const WM_PUBLIC = 1
Public Const WM_PRIVATE = 2

Public Const MAX_STRING_SIZE = 255

Public Const NUMBER_OF_CRYPTED_SECTIONS = 16

' Ctypt hash types, possible hash values for functions:
' EP_CryptHashBuffer
' EP_CryptHashStringA
' EP_CryptHashStringW
' EP_CryptHashFileA
' EP_CryptHashFileW
Public Const HASH_XOR32 = 0
Public Const HASH_MD2 = 1
Public Const HASH_MD5 = 2
Public Const HASH_RipeMD160 = 3
Public Const HASH_SH1 = 4
Public Const HASH_SHA224 = 5
Public Const HASH_SHA256 = 6
Public Const HASH_SHA384 = 7
Public Const HASH_SHA512 = 8

' Return values of EP_RegKeyStatus
Public Const KEY_STATUS_DOESNOTEXIST = 0
Public Const KEY_STATUS_VALID = 1
Public Const KEY_STATUS_INVALID = 2
Public Const KEY_STATUS_STOLEN = 3
Public Const KEY_STATUS_DATEEXPIRED = 4
Public Const KEY_STATUS_WITHOUTHARDWARELOCK = 5
Public Const KEY_STATUS_WITHOUTEXPIRATIONDATE = 6
Public Const KEY_STATUS_WITHOUTREGISTERAFTERDATE = 7
Public Const KEY_STATUS_WITHOUTREGISTERBEFOREDATE = 8
Public Const KEY_STATUS_WITHOUTEXECUTIONSLIMIT = 9
Public Const KEY_STATUS_WITHOUTDAYSLIMIT = 10
Public Const KEY_STATUS_WITHOUTRUNTIMELIMIT = 11
Public Const KEY_STATUS_WITHOUTGLOBALTIMELIMIT = 12
Public Const KEY_STATUS_WITHOUTCOUNTRYLOCK = 13
Public Const KEY_STATUS_COUNTRYINVALID = 14
Public Const KEY_STATUS_REGISTERAFTERFAILED = 15
Public Const KEY_STATUS_REGISTERBEFOREFAILED = 16
Public Const KEY_STATUS_EXECUTIONSEXPIRED = 17
Public Const KEY_STATUS_DAYSEXPIRED = 18
Public Const KEY_STATUS_RUNTIMEEXPIRED = 19
Public Const KEY_STATUS_GLOBALTIMEEXPIRED = 20
Public Const KEY_STATUS_HARDWARECHANGESEXCEEDED_VOLUMESERIAL = 21
Public Const KEY_STATUS_HARDWARECHANGESEXCEEDED_VOLUMENAME = 22
Public Const KEY_STATUS_HARDWARECHANGESEXCEEDED_COMPUTERNAME = 23
Public Const KEY_STATUS_HARDWARECHANGESEXCEEDED_CPU = 24
Public Const KEY_STATUS_HARDWARECHANGESEXCEEDED_MOTHERBOARD = 25
Public Const KEY_STATUS_HARDWARECHANGESEXCEEDED_WINDOWSKEY = 26
Public Const KEY_STATUS_HARDWARECHANGESEXCEEDED_HDDSERIAL = 27
Public Const KEY_STATUS_HARDWARECHANGESEXCEEDED_USERNAME = 28

' Counties code for EP_MiscCountryCode
Public Const CN_AFGHANISTAN = 114
Public Const CN_ALBANIA = 1
Public Const CN_ALGERIA = 2
Public Const CN_ARGENTINA = 3
Public Const CN_ARMENIA = 4
Public Const CN_AUSTRALIA = 5
Public Const CN_AUSTRIA = 6
Public Const CN_AZERBAIJAN = 7
Public Const CN_BAHRAIN = 8
Public Const CN_BANGLADESH = 115
Public Const CN_BELARUS = 9
Public Const CN_BELGIUM = 10
Public Const CN_BELIZE = 11
Public Const CN_BOLIVIA = 116
Public Const CN_BOSNIA = 117
Public Const CN_BRAZIL = 13
Public Const CN_BRUNEI = 14
Public Const CN_BULGARIA = 15
Public Const CN_CAMBODIA = 16
Public Const CN_CANADA = 17
Public Const CN_CARRIBEAN = 118
Public Const CN_CHILE = 20
Public Const CN_CHINA = 21
Public Const CN_COLOMBIA = 22
Public Const CN_COSTARICA = 23
Public Const CN_CROATIA = 24
Public Const CN_CZECH = 25
Public Const CN_DENMARK = 26
Public Const CN_DOMINICAN = 27
Public Const CN_ECUADOR = 28
Public Const CN_EGYPT = 29
Public Const CN_ELSALVADOR = 30
Public Const CN_ESTONIA = 31
Public Const CN_ETHIOPIA = 119
Public Const CN_FAROE = 32
Public Const CN_FINLAND = 33
Public Const CN_FRANCE = 34
Public Const CN_GEORGIA = 35
Public Const CN_GERMANY = 36
Public Const CN_GREECE = 37
Public Const CN_GREENLAND = 120
Public Const CN_GUATEMALA = 38
Public Const CN_HONDURAS = 39
Public Const CN_HONGKONG = 40
Public Const CN_HUNGARU = 41
Public Const CN_ICELAND = 42
Public Const CN_INDIA = 43
Public Const CN_INDONESIA = 44
Public Const CN_IRAN = 45
Public Const CN_IRAQ = 46
Public Const CN_IRELAND = 47
Public Const CN_ISRAEL = 48
Public Const CN_ITALY = 49
Public Const CN_JAMAICA = 50
Public Const CN_JAPAN = 51
Public Const CN_JORDAN = 52
Public Const CN_KAZAKHSTAN = 53
Public Const CN_KENYA = 54
Public Const CN_KOREA = 56
Public Const CN_KUWAIT = 57
Public Const CN_KYRGYZSTAN = 58
Public Const CN_LAOS = 121
Public Const CN_LATVIA = 59
Public Const CN_LEBANON = 60
Public Const CN_LIBYAN = 122
Public Const CN_LIECHTENSTEIN = 62
Public Const CN_LITHUANIA = 63
Public Const CN_LUXEMBOURG = 64
Public Const CN_MACAO = 65
Public Const CN_MACEDONIA = 66
Public Const CN_MALAYSIA = 67
Public Const CN_MALDIVES = 123
Public Const CN_MALTA = 124
Public Const CN_MEXOCI = 68
Public Const CN_MONACO = 70
Public Const CN_MONGOLIA = 71
Public Const CN_MONTENEGRO = 125
Public Const CN_MOROCCO = 72
Public Const CN_NEPAL = 126
Public Const CN_NETHERLANDS = 73
Public Const CN_NEWZEALAND = 74
Public Const CN_NICARAGUA = 75
Public Const CN_NIGERIA = 127
Public Const CN_NORWAY = 76
Public Const CN_OMAN = 77
Public Const CN_PAKISTAN = 78
Public Const CN_PANAMA = 79
Public Const CN_PARAGUAY = 80
Public Const CN_PERY = 81
Public Const CN_PHILIPPINES = 82
Public Const CN_POLAND = 83
Public Const CN_PORTUGAL = 84
Public Const CN_PUERTORICO = 85
Public Const CN_QATAR = 86
Public Const CN_ROMANIA = 87
Public Const CN_RUSSIA = 88
Public Const CN_RWANDA = 128
Public Const CN_SAUDIARABIA = 89
Public Const CN_SENEGAL = 129
Public Const CN_SERBIA = 130
Public Const CN_SERBIAMONTENEGRO = 90
Public Const CN_SINGAROPE = 91
Public Const CN_SLOVAKIA = 92
Public Const CN_SLOVENIA = 93
Public Const CN_SOUTHAFRICA = 94
Public Const CN_SPAIN = 95
Public Const CN_SRILANKA = 131
Public Const CN_SWEDEN = 96
Public Const CN_SWITZERLAND = 97
Public Const CN_SYRIAN = 132
Public Const CN_TAIWAN = 98
Public Const CN_TAJIKISTAN = 99
Public Const CN_THAILAND = 100
Public Const CN_TRINIDADTOBAGO = 101
Public Const CN_TUNISIA = 102
Public Const CN_TURKEY = 103
Public Const CN_TURKMENISTAN = 133
Public Const CN_UKRAINE = 104
Public Const CN_UAE = 105
Public Const CN_UNITEDKINGDOM = 106
Public Const CN_USA = 107
Public Const CN_URUGUAY = 108
Public Const CN_UZBEKISTAN = 109
Public Const CN_VENEZUELA = 110
Public Const CN_VIETNAM = 111
Public Const CN_YEMEN = 112
Public Const CN_ZIMBABWE = 113

Public Type TKeyCountries
    Name As String
    Code As Long
End Type

Public Type TWMContent
    WMType As Long
    Name As String
    NameLen As Long
    Text As String
    TextLen As Long
    FileName As String
    FileNameLen As Long
    AFile As String
    AFileLen As Long
End Type

' LongBool is using for correct data alignment
Public Type TKeyInformation
    Stolen As Boolean ' {out} is key stolen?
    CreationYear As Long ' {out} key creation year
    CreationMonth As Long ' {out} key creation month
    CreationDay As Long ' {out} key creation day
    UseKeyExpiration As Boolean ' {out} has key expiration date?
    ExpirationYear As Long ' {out} key expiration year
    ExpirationMonth As Long ' {out} key expiration month
    ExpirationDay As Long ' {out} key expiration day
    UseHardwareLocking As Boolean ' {out} hardware locked key
    UseExecutionsLimit As Boolean ' {out} limit key by executions?
    ExecutionsCount As Long ' {out} number of executions
    UseDaysLimit As Boolean ' {out} limit key by days?
    DaysCount As Long ' {out} number of days
    UseRunTimeLimit As Boolean ' {out} limit key by run time?
    RunTimeMinutes As Long ' {out} run time minutes
    UseGlobalTimeLimit As Boolean ' {out} limit key by global time?
    GlobalTimeMinutes As Long ' {out} global time minutes
    UseCountyLimit As Boolean ' {out} limit key by country?
    CountryCode As Long ' {out} country code
    UseRegisterAfter As Boolean ' {out} register key after date?
    RegisterAfterYear As Long ' {out} register after year
    RegisterAfterMonth As Long ' {out} register after month
    RegisterAfterDay As Long ' {out} register after day
    UseRegisterBefore As Boolean ' {out} register key before date?
    RegisterBeforeYear As Long ' {out} register before year
    RegisterBeforeMonth As Long ' {out} register before month
    RegisterBeforeDay As Long ' {out} register before day
    EncryptedSections(NUMBER_OF_CRYPTED_SECTIONS - 1) As Boolean ' {out} Crypted sections
End Type

' Registration API
Public Declare Function EP_RegSaveKey Lib "enigma_ide.dll" (ByVal Name As String, ByVal Key As String) As Byte
Public Declare Function EP_RegLoadKey Lib "enigma_ide.dll" (ByRef Name As String, ByRef Key As String) As Byte
Public Declare Function EP_RegCheckKey Lib "enigma_ide.dll" (ByVal Name As String, ByVal Key As String) As Byte
Public Declare Function EP_RegDeleteKey Lib "enigma_ide.dll" () As Byte
Public Declare Function EP_RegLoadAndCheckKey Lib "enigma_ide.dll" () As Byte
Public Declare Function EP_RegCheckAndSaveKey Lib "enigma_ide.dll" (ByVal Name As String, ByVal Key As String) As Byte
Public Declare Function EP_RegHardwareID Lib "enigma_ide.dll" () As String
Public Declare Function EP_RegKeyCreationDate Lib "enigma_ide.dll" (ByRef Year As Long, ByRef Month As Long, ByRef Day As Long) As Byte
Public Declare Function EP_RegKeyCreationDateEx Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyExpirationDate Lib "enigma_ide.dll" (ByRef Year As Long, ByRef Month As Long, ByRef Day As Long) As Byte
Public Declare Function EP_RegKeyExpirationDateEx Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyExecutions Lib "enigma_ide.dll" (ByRef Total As Long, ByRef Left As Long) As Boolean
Public Declare Function EP_RegKeyExecutionsTotal Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyExecutionsLeft Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyDays Lib "enigma_ide.dll" (ByRef Total As Long, ByRef Left As Long) As Boolean
Public Declare Function EP_RegKeyDaysTotal Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyDaysLeft Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyRuntime Lib "enigma_ide.dll" (ByRef Total As Long, ByRef Left As Long) As Boolean
Public Declare Function EP_RegKeyRuntimeTotal Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyRuntimeLeft Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyGlobalTime Lib "enigma_ide.dll" (ByRef Total As Long, ByRef Left As Long) As Boolean
Public Declare Function EP_RegKeyGlobalTimeTotal Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyGlobalTimeLeft Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyRegisterAfterDate Lib "enigma_ide.dll" (ByRef Year As Long, ByRef Month As Long, ByRef Day As Long) As Boolean
Public Declare Function EP_RegKeyRegisterAfterDateEx Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyRegisterBeforeDate Lib "enigma_ide.dll" (ByRef Year As Long, ByRef Month As Long, ByRef Day As Long) As Boolean
Public Declare Function EP_RegKeyRegisterBeforeDateEx Lib "enigma_ide.dll" () As Long
Public Declare Function EP_RegKeyInformation Lib "enigma_ide.dll" (ByRef AName As String, ByRef AKey As String, ByRef AKeyInfo As TKeyInformation) As Boolean
Public Declare Function EP_RegKeyStatus Lib "enigma_ide.dll" () As Long

' Trial API
Public Declare Function EP_TrialExecutions Lib "enigma_ide.dll" (ByRef Total As Long, ByRef Left As Long) As Byte
Public Declare Function EP_TrialExecutionsTotal Lib "enigma_ide.dll" () As Long
Public Declare Function EP_TrialExecutionsLeft Lib "enigma_ide.dll" () As Long
Public Declare Function EP_TrialDays Lib "enigma_ide.dll" (ByRef Total As Long, ByRef Left As Long) As Byte
Public Declare Function EP_TrialDaysTotal Lib "enigma_ide.dll" () As Long
Public Declare Function EP_TrialDaysLeft Lib "enigma_ide.dll" () As Long
Public Declare Function EP_TrialExpirationDate Lib "enigma_ide.dll" (ByRef Year As Long, ByRef Month As Long, ByRef Day As Long) As Byte
Public Declare Function EP_TrialExpirationDateEx Lib "enigma_ide.dll" () As Long
Public Declare Function EP_TrialDateTillDate Lib "enigma_ide.dll" (ByRef StartYear As Long, ByRef StartMonth As Long, ByRef StartDay As Long, ByRef EndYear As Long, ByRef EndMonth As Long, ByRef EndDay As Long) As Byte
Public Declare Function EP_TrialDateTillDateStartEx Lib "enigma_ide.dll" () As Long
Public Declare Function EP_TrialDateTillDateEndEx Lib "enigma_ide.dll" () As Long
Public Declare Function EP_TrialExecutionTime Lib "enigma_ide.dll" (ByRef Total As Long, ByRef Left As Long) As Byte
Public Declare Function EP_TrialExecutionTimeTotal Lib "enigma_ide.dll" () As Long
Public Declare Function EP_TrialExecutionTimeLeft Lib "enigma_ide.dll" () As Long

' Misc API
Public Declare Function EP_MiscGetWatermark Lib "enigma_ide.dll" (ByVal ID As Long, ByRef WM As TWMContent) As Long
Public Declare Function EP_MiscCountryCode Lib "enigma_ide.dll" () As Long
Public Declare Function EP_SplashScreenShow Lib "enigma_ide.dll" () As Long
Public Declare Function EP_SplashScreenHide Lib "enigma_ide.dll" ()

' Protection API
Public Declare Function EP_ProtectedStringByID Lib "enigma_ide.dll" (ByVal ID As Long, ByVal Str As String, ByVal Length As Byte) As Byte
Public Declare Function EP_ProtectedStringByKey Lib "enigma_ide.dll" (ByVal Key As String, ByVal Str As String, ByVal Length As Byte) As Byte

' Crypt API TODO
' function EP_CryptHashBuffer(Hash : Cardinal; Buffer : pointer; Size : Cardinal; Digest : pointer) : Cardinal; stdcall;
' function EP_CryptHashFileA(Hash : Cardinal; FileName : PAnsiChar; Digest : pointer) : Cardinal; stdcall;
' function EP_CryptHashFileW(Hash : Cardinal; FileName : PWideChar; Digest : pointer) : Cardinal; stdcall;
' function EP_CryptHashStringA(Hash : Cardinal; Str : PAnsiChar; Digest : pointer) : Cardinal; stdcall;
' function EP_CryptHashStringW(Hash : Cardinal; Str : PWideChar; Digest : pointer) : Cardinal; stdcall;
' procedure EP_CryptEncryptBuffer(Buffer : pointer; Size : Cardinal; Key : PAnsiChar); stdcall;
' procedure EP_CryptEncryptBufferEx(InBuffer, OutBuffer : pointer; Size : Cardinal; Key : pointer; KeySize : Cardinal); stdcall;
' procedure EP_CryptDecryptBuffer(Buffer : pointer; Size : Cardinal; Key : PAnsiChar); stdcall;
' procedure EP_CryptDecryptBufferEx(InBuffer, OutBuffer : pointer; Size : Cardinal; Key : pointer; KeySize : Cardinal); stdcall;

' Checkup API
Public Declare Function EP_CheckupCopies Lib "enigma_ide.dll" (ByRef Total As Long, ByRef Current As Long) As Boolean
Public Declare Function EP_CheckupCopiesTotal Lib "enigma_ide.dll" () As Long
Public Declare Function EP_CheckupCopiesCurrent Lib "enigma_ide.dll" () As Long
Public Declare Function EP_CheckupIsProtected Lib "enigma_ide.dll" () As Boolean
Public Declare Function EP_CheckupIsEnigmaOk Lib "enigma_ide.dll" () As Boolean
Public Declare Function EP_CheckupFindProcess Lib "enigma_ide.dll" (ByVal FileName As String, ByVal WindowText As String, ByVal WindowClass As String) As Boolean

' Enigma API
Public Declare Function EP_EnigmaVersion Lib "enigma_ide.dll" () As Long
