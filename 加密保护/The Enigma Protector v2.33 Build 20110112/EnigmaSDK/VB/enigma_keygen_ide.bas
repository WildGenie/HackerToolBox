Attribute VB_Name = "enigma_keygen_ide"
' Key generation/verification results
Public Const EP_NO_ERROR = 0
Public Const EP_ERROR_UNKNOWN = 1
Public Const EP_ERROR_KEYBUFFEREMPTY = 2
Public Const EP_ERROR_KEYBUFFERISLESS = 3
Public Const EP_ERROR_REGINFOEMPTY = 4
Public Const EP_ERROR_REGINFOTOOLARGE = 5
Public Const EP_ERROR_PRIVATEKEYISNOTSET = 6
Public Const EP_ERROR_PUBLICKEYISNOTSET = 7
Public Const EP_ERROR_PRIVATEKEYISINVALID = 8
Public Const EP_ERROR_PUBLICKEYISINVALID = 9
Public Const EP_ERROR_KEYMODEISINVALID = 10
Public Const EP_ERROR_KEYBASEISINVALID = 11
Public Const EP_ERROR_CURRENTDATEISINVALID = 12
Public Const EP_ERROR_EXPIRATIONDATEISINVALID = 13
Public Const EP_ERROR_KEYISINVALID = 14
Public Const EP_ERROR_HARDWAREID = 15
Public Const EP_ERROR_HARDWAREBUFFEREMPTY = 16
Public Const EP_ERROR_HARDWAREIDINVALIDFORKEY = 17
Public Const EP_ERROR_PROJECTFILENOTFOUND = 18
Public Const EP_ERROR_INVALIDPROJECTFILE = 19
Public Const EP_ERROR_EXECUTIONSNUMBERINVALID = 20
Public Const EP_ERROR_DAYSNUMBERINVALID = 21
Public Const EP_ERROR_COUNTRYCODEINVALID = 22
Public Const EP_ERROR_RUNTIMEINVALID = 23
Public Const EP_ERROR_GLOBALTIMEINVALID = 24
Public Const EP_ERROR_INSTALLBEFOREINVALID = 25
Public Const EP_ERROR_INSTALLAFTERINVALID = 26

' Number of crypted sections
Public Const NUMBER_OF_CRYPTED_SECTIONS = 16

' Registartion mode types
Public Const RM_512 = 0
Public Const RM_768 = 1
Public Const RM_1024 = 2
Public Const RM_2048 = 3
Public Const RM_3072 = 4
Public Const RM_4096 = 5

' Registration Base types
Public Const RB_2 = 0
Public Const RB_8 = 1
Public Const RB_16 = 2
Public Const RB_32 = 3
Public Const RB_64 = 4

' Counties code
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

Public Type TKeyGenParams
    KeyMode As Long ' {in} key generation mode (~RSA ???)
    KeyBase As Long ' {in} key output base (Base ???)
    KeyWithHyphens As Boolean ' {in} add hyphens to the key?
    Key As String ' {in} buffer for registration key
    KeyLen As Long ' {in} registration key size
    RegInfo As String ' {in} registration info/name
    RegInfoLen As Long ' {in} registration info/name size
    UseKeyExpiration As Boolean ' {in} use key expiration?
    ExpirationYear As Long ' {in} key expiration year
    ExpirationMonth As Long ' {in} key expiration month
    ExpirationDay As Long ' {in} key expiration day
    UseHardwareLocking As Boolean ' {in} is key hardware locked?
    HardwareID As String ' {in} pointer to null terminated hardware string
    UseExecutionsLimit As Boolean ' {in} limit key by executions?
    ExecutionsCount As Long ' {in} number of executions
    UseDaysLimit As Boolean ' {in} limit key by days?
    DaysCount As Long ' {in} number of days
    UseRunTimeLimit As Boolean ' {in} limit key by run time?
    RunTimeMinutes As Long ' {in} run time minutes
    UseGlobalTimeLimit As Boolean ' {in} limit key by global time?
    GlobalTimeMinutes As Long ' {in} global time minutes
    UseCountyLimit As Boolean ' {in} limit key by country?
    CountryCode As Long ' {in} country code
    UseRegisterAfter As Boolean ' {in} register key after date?
    RegisterAfterYear As Long ' {in} register after year
    RegisterAfterMonth As Long ' {in} register after month
    RegisterAfterDay As Long ' {in} register after day
    UseRegisterBefore As Boolean ' {in} register key before date?
    RegisterBeforeYear As Long ' {in} register before year
    RegisterBeforeMonth As Long ' {in} register before month
    RegisterBeforeDay As Long ' {in} register before day
    EncryptedConstant As Long ' {in} Encryption Constant - should be extracted from project file
    EncryptedSections(NUMBER_OF_CRYPTED_SECTIONS - 1) As Byte ' {in} Crypted sections
    PrivateKey As String ' {in} Private Key - should be extracted from project file
    PublicKey As String ' {in} Public Key - should be extracted from project file
End Type

Public Type TKeyVerifyParams
    RegInfo As String ' {in} registration info/name
    RegInfoLen As Long ' {in} registration info/name size
    KeyMode As Long ' {in} key generation mode (~RSA ???)
    KeyBase As Long ' {in} key output base (Base ???)
    Key As String ' {in} buffer for registration key
    KeyLen As Long ' {in} registration key size
    CreationYear As Long ' {out} key creation year
    CreationMonth As Long ' {out} key creation month
    CreationDay As Long ' {out} key creation day
    UseKeyExpiration As Boolean ' {out} has key expiration date?
    ExpirationYear As Long ' {out} key expiration year
    ExpirationMonth As Long ' {out} key expiration month
    ExpirationDay As Long ' {out} key expiration day
    UseHardwareLocking As Boolean ' {in} hardware locked key
    HardwareID As String ' {in} pointer to null terminated hardware string
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
    EncryptedConstant As Long ' {in} Encryption Constant - should be extracted from project file
    EncryptedSections(NUMBER_OF_CRYPTED_SECTIONS - 1) As Byte ' {out} Crypted sections
    PublicKey As String ' {in} Public Key - should be extracted from project file
End Type

'Declaration of keygen.dll functions

Public Declare Function KG_GenerateRegistrationKey Lib "keygen.dll" (ByRef kg As TKeyGenParams) As Long
Public Declare Function KG_GenerateRegistrationKeyFromProject Lib "keygen.dll" (ByVal ProjectName As String, ByRef kg As TKeyGenParams) As Long

Public Declare Function KG_VerifyRegistrationInfo Lib "keygen.dll" (ByRef kv As TKeyVerifyParams) As Long
Public Declare Function KG_VerifyRegistrationInfoFromProject Lib "keygen.dll" (ByVal ProjectName As String, ByRef kv As TKeyVerifyParams) As Long
