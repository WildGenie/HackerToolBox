#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define kgERROR_SUCCESS             0
#define kgERROR_KG_ERROR            2
#define kgERROR_MODE_UNKNOWN        3
#define kgERROR_REGNAME_ERROR       4
#define kgERROR_SIGNATURE_ERROR     5
#define kgERROR_BUFFER_TOO_SMALL    6
#define kgERROR_CONSTANTS_UNDEFINED 7
#define kgERROR_HARDWAREID_ERROR    8

typedef struct _KEYDATE {
	BYTE	Day;
	BYTE	Month;
	WORD	Year;
} KEYDATE, *PKEYDATE;

typedef struct _PARAMS {
        LPSTR   RegName;            // Registration name buffer

        LPSTR   HardwareID;         // HardwareID
        KEYDATE ExpirationDate;     // Expiration date
        DWORD   EncryptionConst;    // Constant for encryption

        BYTE    ModeID;             // Mode number (1..15)
        BYTE    SignatureBits;      // Signature size in bits

	BYTE	Reserved1;
	BYTE	Reserved2;

        LPSTR   C1;                 // Constants from project file
        LPSTR   C3;		    // (Activation Keys section)
        LPSTR   C6;
        LPSTR   C7;

	LPSTR   RegKey;             // Registration key buffer
	DWORD   RegKeySize;         // Key buffer size
	DWORD   RealKeySize;        // Registration key size
} PARAMS, *PPARAMS;
