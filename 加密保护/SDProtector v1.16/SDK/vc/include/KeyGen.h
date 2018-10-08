#ifndef SDPROTECTOR_KEYGEN_H
#define SDPROTECTOR_KEYGEN_H  

#define KEYGEN_OK                    0
#define ERR_DLL_INIT_ERROR           1
#define ERR_NO_USERNAME	             2
#define ERR_NO_ORDERID               3
#define ERR_INVALID_EXP_DATE         4
#define ERR_INSUFFICIENT_BUFFER      5
#define ERR_CANNOT_CREATE_FILE       6
#define ERR_WRITEFILE_FAILED         7


typedef struct  
{  
	char           *lpUserName;     // Pointer to user name 
	char           *lpOrderID;      // Pointer to order id 
	char           *lpHardwareID;   // Pointer to hardware id 
	char           *lpExpVersion;   // Pointer to expiration version 
	SYSTEMTIME     *lpExpDate;      // Pointer to expiration date  
} KEY_DATA; 
extern "C" int __declspec(dllimport) __stdcall  VerifyTextKey(KEY_DATA *pKeyData,char *pKeyText);
extern "C" int __declspec(dllimport) __stdcall  GenerateTextKey(KEY_DATA *pKeyData, char *pKeyText, int iMaxLen);
extern "C" int __declspec(dllimport) __stdcall  GenerateKeyFile(KEY_DATA *pKeyData, char *pKeyFileName);
//typedef int  (__stdcall *VerifyTextKey)(KEY_DATA *pKeyData,char *pKeyText);
//typedef int  (__stdcall *GenerateTextKey)(KEY_DATA *pKeyData, char *pKeyText, int iMaxLen);
//typedef int  (__stdcall *GenerateKeyFile)(KEY_DATA *pKeyData, char *pKeyFileName);

#endif