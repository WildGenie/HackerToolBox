How to use CGI keys generator:
1. Place keygen to cgi-bin folder of your web site
2. Enable execution permissions for keygen
3. Create a link for execution of keys generator:

There are 2 kind of links to generate registration keys, one is with GenerateKey action, for this type of keygen you must provide special secure constants from the project file to keys generator, or with GenerateKeyFromProject action, keygen will automatically read all necessary constants from project file.

Keygen with GenerateKey action, link will look like:

<a href="http://yoursite.com/cgi-bin/keygen?Action=GenerateKey&RegName=Vladimir%20Sukhov&KeyMode=512&KeyBase=32&Hyphens=1&Hardware=C69A93-08A25D-D58B73-43CEBD&Expiration=01012030&Sections=1010001001001001&EncryptedConstant=2113444489&PrivateKey=00C98B2SF9UBJA605AJX53GJFXJV8UH4A6PY2L6CV4MAMV7V3ERRVY99Y72V2P77Z2J3KBPGWR3WXKG5GF9Z6CKXJHY5VUMBTQ66H2MRZPCU00DLFJ675JTTTNEK00DLFJ675JTTTNEK&PublicKey=0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5ACP7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQCWCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYHCBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTPSRGDQ742B4742XF4MACRR747YDP5FZZ9D">Click here to generate registration key</a>

There:
Action=GenerateKey - action to keys generator that key should be generated with help of constants from the url string
RegName=Vladimir%20Sukhov - enter here a registration name for the registration key. Please note that this string should be http encoded to avoid appearing of non translated symbols (for example, space symbol should be translated into %20 but not a " ")
KeyMode=512 - defines what type of registration key should be generated. To get this value, open your project file in Enigma and go to REGISTRATION FEATURES-Common panel, take a look at the Registration key safety/length field, for example, if this field is RSA 1024, then you should use KeyMode=1024 (possible values for KeyMode are 512/768/1024/2048/3072/4096)
KeyBase=32 - defines an output format of registration key. To get this value, open your project file in Enigma and go to REGISTRATION FEATURES-Common panel, take a look at the Registration key output base field, for example, if this field is Base 32, then you should use KeyBase=32 (possible values for KeyBase are 2/8/16/32/64)
Hyphens=1 - indicates, if the registration key should be divided my hyphens or no. If yes then enter Hyphens=1 otherwise just skip this parameter
Hardware=C69A93-08A25D-D58B73-43CEBD - if you need hardware locked registration key then enter hardware id here, if you do not need hardware locked keys, just skip this parameter
Expiration=01012030 - if you need time limited registration keys, enter expiration date here. Expiration date has the following format: 2 digits (show expiration day) + 2 digits (show expiration month) + 4 digits (show expiration year). If you do not need time limited keys, just skip this parameter
Sections=1010001001001001 - if the registration key should unlock crypted sections then generate a 16 digits string that shows what section should unlock generated key. If digit = 1 then it unlock section, or 0 if section should not be unlocked. The above example shows that there should be unlcoked sections #1, #3, #7, #10, #13, #16
EncryptedConstant=2113444489 - get this constant from the project file, open project file in notepad and find there EnigmaProject-RegistrationFeatures-Constants-EncryptedConstant branch and get it value
PrivateKey and PublicKey values should be gotten from project file. Open project file in notepad and find EnigmaProject-RegistrationFeatures-Constants branch, then find necessary Mode branch, for example, if you are using KeyMode=1024 then find branch Mode1024 and get inside it PrivateKey and PublicKey values

Keygen with GenerateKeyFromProject action, link will look like:

<a href="http://yoursite.com/cgi-bin/keygen?Action=GenerateKeyFromProject&FileName=default.enigma&RegName=Vladimir%20Sukhov&Hyphens=1&Expiration=01012030&Sections=1010001001001001">Click here to generate registration key from project file</a>

This type of key generator is the same as for GenerateKey but has a few differences:
1. You do not need to provide KeyMode, KeyBase, PrivateKey, PublicKey, EncryptedConstant parameters, because keygen automatically loads this from project file
2. You need to copy project file that will be used for keys generating in the same folder with keygen and set up project file name in the connection url

There:
Action=GenerateKeyFromProject - shows that key should be generated from the project file
FileName=default.enigma - file name of the project that should be used. Please copy project file into the keygen folder before using this feature
Other parameters are the same as for GenerateKey
