// ***************************************************************
//  KeyGen   version:  1.0   ·					 date: 03/26/2007
//  -------------------------------------------------------------
//  ShareIT example key generator
//  -----------------------------
//	[console application]
//  [based on ShareIT Key Generator SDK Version 3.5 / February 2007]
//
//  This Project uses eXPressor.dll to generate Registration Numbers 
//	independently of eXPressor; usefull	for ShareIT or other sites 
//	which can run server side software to generate automatically
//	Serial Numbers.
//  This .exe file stays behind ShareIt firewall, so no secial security
//  measures are required. 
//	Before proceeding if you want to use this keygen with ShareIt
//	it is strongly recommended to download and read the latest ShareIt
//	SDK; else you could read it and develop your keygen for other use.
//
//  -------------------------------------------------------------
//  Copyright (C) CGSoftLabs 2007 - All Rights Reserved
// ***************************************************************
#include "stdafx.h"
#include "KeyGen.h"
#include "../Include/eXPressorSdk.h"

//CRT - THE EASY WAY
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

//RETURN CODES FROM ShareIT SDK SPEC
enum KeyGenReturnCode
{
	// SUCCESS
	ERC_SUCCESS     = 00,
	ERC_SUCCESS_BIN = 01,
	// FAILURE
	ERC_ERROR       = 10,
	ERC_MEMORY      = 11,
	ERC_FILE_IO     = 12,
	ERC_BAD_ARGS	= 13,
	ERC_BAD_INPUT	= 14,
	ERC_EXPIRED     = 15,
	ERC_INTERNAL	= 16
};

// EXCEPTION CLASS [HANDY CLASS TO GET RID OF THOSE IFs]
class KeyGenException : public CException {
public:
	//ERROR CODE
	KeyGenReturnCode m_ERC;
	//ASSOCIATED MESSAGE
	CString m_szErrMessage;	
public:
	//CTOR
	KeyGenException(CString message, KeyGenReturnCode e){
		m_szErrMessage = message;
		m_ERC = e;
	}
	void ThrowErrorMsg(){
		AfxMessageBox(m_szErrMessage);
	}
};

//FUNCIONS DEFINITION
KeyGenReturnCode	GenerateKey();
BOOL				ReadInputFile(CString szInputFile);
BOOL				WriteOutputFile(CString szFilePath, CString szData);
CString				GetInputValue(CString szValue);

//GLOBAL VARIABLES
CString				g_szInputFile, g_szOutputFile1, g_szOutputFile2;
CStringArray		g_arrLineArray;

#define BINARY_GEN
//FROM ShareIT SDK
#ifdef BINARY_GEN
CString g_KeyMIMEType;		// the MIME type
CString g_KeyFileName;		// the displayed filename
CString	g_KeyData;			// the actual key data
#else
CString g_KeyResult1;		// the key for the user
CString g_KeyResult2;		// the cckey for the publisher
#endif
/////////////////////////////////////////////////////////////////////////////
// The one and only application object
int _tmain(int argc, TCHAR* argv[], TCHAR* envp[])
{
	//IF YOU WANT TO USE IT AS A CGI WRITE CGI HEADER TO CONSOLE
	//cout << _T("Content-type: text/html\r\n\r\n");
	int nRetCode = 0;

	cout << _T("*****************************************************") <<endl;
	cout << _T("* C++ sample KeyGenerator part of eXPressor SDK     *") <<endl;
	cout << _T("* to be used with ShareIt interface                 *") <<endl;
	cout << _T("* v 1.0                               by CGSoftLabs *") <<endl;
	cout << _T("*****************************************************") <<endl <<endl;

	try
	{
		// INIT MFC
		if(!AfxWinInit(::GetModuleHandle(NULL), NULL, ::GetCommandLine(), 0)){
			throw new KeyGenException(_T("Fatal Error: MFC initialization failed"),ERC_INTERNAL);
		}

		// CHECK FOR CORRECT NUMBER OF CML PARAMS
		if(argc!=4){
			throw new KeyGenException(_T("Usage: <input> <output1> <output2>"),ERC_BAD_ARGS);
		}

		// STORE FILE NAMES
		g_szInputFile = argv[1];
		g_szOutputFile1 = argv[2];
		g_szOutputFile2 = argv[3];

		// READ KEYGEN PARAMETERS PROVIDED BY SERVER
		cout << _T("> reading input file: ") <<endl;
		cout << g_szInputFile <<endl;
		if(!ReadInputFile(g_szInputFile)){
			throw new KeyGenException(_T("Error processing input file."),ERC_FILE_IO);
		}

		// GO GENERATE THE KEY
		cout << _T("> processing ... ") <<endl;
		nRetCode = GenerateKey();
		
		// WRITE OUTPUT FILES
		cout << _T("> writing output files... ") <<endl;
#ifdef BINARY_GEN
		// WRITE MIME TYPE AND DISPLAY  TO OUTPUT FILE #1
		if(!WriteOutputFile(g_szOutputFile1, g_KeyMIMEType + ":" + g_KeyFileName))
			throw new KeyGenException(_T("Error writing output file: ") + g_szOutputFile1,ERC_FILE_IO);
		if(!WriteOutputFile(g_szOutputFile2, g_KeyData))
			throw new KeyGenException(_T("Error writing output file: ") + g_szOutputFile2,ERC_FILE_IO);		
		// BINARY KEY GENERATORS MUST RETURN ERC_SUCCESS_BIN ON SUCCESS
		nRetCode = ERC_SUCCESS_BIN;
#else
		if(!WriteOutputFile(g_szOutputFile1, g_KeyResult1))
			throw new KeyGenException(_T("Error writing output file: ") + g_szOutputFile1,ERC_FILE_IO);
		if(!WriteOutputFile(g_szOutputFile2, g_KeyResult2))
			throw new KeyGenException(_T("Error writing output file: ") + g_szOutputFile2,ERC_FILE_IO);
		nRetCode = ERC_SUCCESS;
#endif
	}
	catch (KeyGenException* e)
	{
		// SET RETURN CODE
		nRetCode = e->m_ERC;
		// OUTPUT TO CONSOLE
		cerr << e->m_szErrMessage.LockBuffer() << endl;
		// WRITE THE ERROR TO OUTPUT FILE 1 ACCORDING TO SDK
		WriteOutputFile(g_szOutputFile1, e->m_szErrMessage);
	}
	catch (CException* e)
	{
		// REPORT OTHER ERRORS
		nRetCode = ERC_ERROR;
		TCHAR   szCause[255];
		CString strFormatted;
		e->GetErrorMessage(szCause, 255);
		strFormatted  =_T("General program error: ");
		strFormatted+= szCause;
		// OUTPUT TO CONSOLE
		cerr << strFormatted.LockBuffer() << endl;
		// WRITE THE ERROR TO OUTPUT FILE 1 ACCORDING TO SDK
		WriteOutputFile(g_szOutputFile1, strFormatted);
	}

	return nRetCode;
}

KeyGenReturnCode GenerateKey()
{
	// CHECK FOR INPUT ENCODING
	CString szEncoding = GetInputValue("ENCODING");
	// SINCE WE DON'T SUPPORT UNICODE IN eXPresor ABOUTBOX (FOR THE MOMENT)
	if((!szEncoding.IsEmpty())&&(szEncoding != "ISO-8859-1"))
		throw new KeyGenException("Bad input encoding, expected ISO-8859-1",ERC_BAD_INPUT);

	// CHECK FOR VALID INPUT
	CString szRegName = GetInputValue("REG_NAME");
	if (szRegName.GetLength() < 8) {
		throw new KeyGenException("Registration Name must have at least 8 characters",ERC_BAD_INPUT);
	}
	// IF YOU USE THIS KEYGEN FOR MULTIPLE PRODUCTS
	// YOU CAN CUSTOM CALL DIFFERENT FUNCTIONS TO FILL DLL PARAM FOR EACH PRODUCT AT ShareIt;
	CString szProdID = GetInputValue("PRODUCT_ID");
	if(szProdID.IsEmpty()){
		throw new KeyGenException("Invalid Product_ID",ERC_BAD_INPUT);
	}
	// NOW YOU CAN CHECK IF IT'S YOUR PRODUCT ID
	// if(szProdID==szMySHAREITProductId)

	// THIS USES HARCODED WAY (THE PROJECT PARAMS COMPILED IN THIS FILE)

// 	typedef struct _KEY_PARAMS {
// 		LPBYTE	btUserInfo;         // [IN] address of buffer which holds UserName
// 		WORD    wUserInfoSize;		// [IN] size in bytes of UserName
// 		LPTSTR  szMachineID;		// [IN] MachineID sting
// 		WORD    wMachineIDSize;		// [IN] size in bytes of UserName
// 		WORD	wRsaKeyType;		// [IN] from project file [KeyGeneration] RSAKey=
// 		KEYDATE	ExpirationDate;		// [IN] desired key expiration date
// 		PROGRVER ProgVersion;		// [IN] constant from project file [Protection] FileVersion=
// 		int		ExpVerFlag;			// [IN] key will unlock only max specified versions
// 		DWORD	dwEncryptionKey;	// [IN] from project file [KeyGeneration] EncryptCodeKey=
// 		LPTSTR  P1;                 // [IN] constant from project file [KeyGeneration] P1=
// 		LPTSTR  P2;                 // [IN] constant from project file [KeyGeneration] P2=
// 		LPTSTR  P3;                 // [IN] constant from project file [KeyGeneration] P3=
// 		LPBYTE  btRegKey;           // [OUT] buffer for receiving the registration key
// 		WORD    wRegKeySize;        // [IN][OUT] size in bytes of btRegKey
// 		WORD	wKeyID;				// reserved for later use
// 		DWORD	dwUnlockS;			// reserved for later use
// 	} KEY_PARAMS, *PKEY_PARAMS;	

	KEY_PARAMS dllParams;
	// CLEAR THE STRUCT!!
	ZeroMemory(&dllParams,sizeof(KEY_PARAMS));
	// FILL THE PARAMETERS FOR eXPressor.dll FUNCTION

	// SET THE USER NAME WHICH IS THE MINIMUM REQUIRED
	dllParams.btUserInfo = (LPBYTE)szRegName.LockBuffer();
	dllParams.wUserInfoSize = szRegName.GetLength();

	// WE DON'T USE HARDWARE LOCK SO DON'T HANDLE A MACHINE_ID STRING
	//dllParams.szMachineID = ... 
	// SET "ADDITIONAL1" FIELD, ASK USER TO ENTER MACHINE_ID, 
	// HERE YOU CAN CHECK FOR STRING FORMAT IE. LENGTH

	// NOW OPEN THE PROJECT FILE FOR WHICH YOU MAKE THIS KEYGEN AND READ YOUR CONSTANTS
	// HERE ARE WRITTEN FROM : SDK/Registration/sample1.epf
	//[KeyGeneration] RSAKey=2
	dllParams.wRsaKeyType = 2; //1024bit RSA KEY

	// OUR KEY WON'T EXPIRE. TAKE CARE eXPressor.dll WILL RET ERROR IF YOU USE KEY 
	// EXPIRATION DATES ERLIER THAN TODAY DATE!!
	dllParams.ExpirationDate.Year = 0;
	//dllParams.ExpirationDate.Month = 0;
	//dllParams.ExpirationDate.Day = 0;
	// IF YOU SET dllParams.ExpirationDate.Year = 0xFFFF; THEN EXPIRE DATE WILL BE
	// SET AS FOLLOW: TODAY DATE + dllParams.ExpirationDate.Day; SO ExpirationDate.Day
	// HOLDS AN AMOUNT OF DAYS TO MOVE FORRWARD

	// [Protection] FileVersion=1,0,0,0
	dllParams.ProgVersion.Maj1 = 1;
	dllParams.ProgVersion.Maj2 = 0;
	dllParams.ProgVersion.Min1 = 0;
	dllParams.ProgVersion.Min2 = 0;

	//WE DON'T WANT THE KEY TO EXPIRE SO SET VALUES OTHER THAN 0,1,2
	dllParams.ExpVerFlag = -1;
	//0-work only with this version;
	//1-work only with minor version
	//2-work only with semiminor version

	// [KeyGeneration] EncryptCodeKey=-593108951
	dllParams.dwEncryptionKey = (int)-593108951;

	// [KeyGeneration] P1=...
	dllParams.P1 = "207985BC1DB9CA31F410B5CCB38C98BC2E6291BCA5B62028D8D809BD34807D7F4F4449170FECAD45F333545EA47E2DD85CC17C8419CAD4F3F9BE68C6833159130F8DDEE0D0C9A511E700EC7BF1C7BFE156E092CC0D2ECEE267B5D1919F67CEE89F72D56F49B5ADB43025F3EBE88363D866742042F8DA40F3F2B5A290C9D75695";
	
	// [KeyGeneration] P2=...
	dllParams.P2 = "11";

	// [KeyGeneration] P3=...
	dllParams.P3 = "1E907DDE3A1845D4A97923937BCF9ECF3AB71FC09BF6B4DB2670FA1B7CB52AD22C7C8106A59375E77B7B9AB36DA3EEE9C0B61AD6AEDD04A9638608425D5B9F204AB90EF56F94D6FAD8109FDDDA347E48D209A8001A91160A61FB1A13127B801B1D64730FD23A998AACB9F2A5E0D8F1278B5D81A66DFC25C476C7D50398708DB1";

	// NOW PREPARE OUTPUT BUFFER, BIG ENOUGH (FOR a 2048bit Key = 256bytes*2 = 512bytes buffer is required)
	CString szGeneratedKey;
	dllParams.btRegKey  = (LPBYTE)szGeneratedKey.GetBuffer(512+1);
	dllParams.wRegKeySize = 512+1;

	// LOAD EXPRESSOR.DLL WHICH MUST RESIDE IN THE SAME DIR
	HMODULE hDll = LoadLibrary("eXPressor.dll");
	if(!hDll)
		throw new KeyGenException("eXPressor.dll not found",ERC_FILE_IO);

	// GET ADDRESS OF OUR FUNCTION
	eXP_GenerateRegistrationKey GenKey;
	GenKey = (eXP_GenerateRegistrationKey)GetProcAddress(hDll,"GenerateRegistrationKey");
	if(!GenKey)
		throw new KeyGenException("Imported Function missing from eXPressor.dll",ERC_FILE_IO);

	// CALL FUNCTION TO BUILD OUR SERIAL NUMBER
	DWORD dwRet = GenKey(&dllParams);

	if(dwRet){
		// TRY TO ENLARGE THE BUFFER
		if(dwRet==EXPR_ERROR_KEY_TOO_SMALL){
			
			dllParams.btRegKey  = (LPBYTE)szGeneratedKey.GetBuffer(1024);
			dllParams.wRegKeySize = 1024;
			dwRet = GenKey(&dllParams);
		}
		if(dwRet){
			CString szError;
			szError.Format("Error generating key: %08X",dwRet);
			throw new KeyGenException(szError,ERC_BAD_INPUT);
		}
	}

	// RELEASE BUFFER
	szGeneratedKey.ReleaseBuffer();

#ifdef BINARY_GEN
	// create a binary key
	g_KeyData = szGeneratedKey;
	g_KeyFileName = "key.txt";
	g_KeyMIMEType = "text/plain";//application/octet-stream
	// note: there is no cckey generated for binary key generators since
	// the copy exectly matches the original. it is sent to the publisher
	// via XML order notification mails
	return ERC_SUCCESS_BIN;
#else
	// result 1 - key for the customer
	g_KeyResult1 = szGeneratedKey;
	// result 2 - cckey for the publisher
	g_KeyResult2 = "Registration Name : "+szRegName + "\r\n" +"Registration Key : " + g_KeyResult1;
	return ERC_SUCCESS;
#endif
}

// SCROLL THROUGH LINE ARRAY AND FIND OUR VALUE
CString GetInputValue(CString szValue)
{
	CString szLine;
	BOOL bFound = 0;
	int iNoValues = g_arrLineArray.GetSize();
	for (int i = 0;i<iNoValues;i++){
		szLine = g_arrLineArray.GetAt(i);
		//TRY TO KEEP COMPAT WITH FUTURE TEXT CASES
		szLine.MakeUpper();
		szLine.TrimLeft();
		szLine.TrimRight();
		szValue.MakeUpper();
		if(szLine.Find(szValue)==0){
			bFound = TRUE;
			break;
		}
	}
	if(bFound){
		szLine = g_arrLineArray.GetAt(i).Mid(szLine.Find("=")+1);
		return szLine;
	}
	return "";
}
// READ ALL LINES INTO AN ARRAY OF LINES
BOOL ReadInputFile(CString szInputFile)
{
	ifstream read(szInputFile);
	if(read.bad())
		return FALSE;
	
	string sline;
	while (getline(read, sline, '\n'))
	{
		CString szLine(sline.c_str());
		g_arrLineArray.Add(szLine);
	}
	read.close();
	
	return TRUE;
}
// WRITE SOME TEXT INTO A FILE [MUST BE NULL TERMINATED]
BOOL WriteOutputFile(CString szFilePath, CString szData)
{
	//SEE IF WE HAVE A FILE
	if(szFilePath.IsEmpty())
		return FALSE;
	ofstream file;
	//OPEN DESTINATION FILE
	file.open(szFilePath);
	if(!file)
		return FALSE;
	//WRITE CR
	szData+="\r\n";
	file << szData.LockBuffer();
	//CLOSE
	file.close();
	return TRUE;
}
