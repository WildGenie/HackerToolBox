////////////////////////////////////////////////////////////////////////////////
// PEHideText 
// (c)2009 Jeremy Collake - Bitsum Technologies
//
// Allows for definition of encrypted strings in executables. After compile, 
// the strings are encrypted using PEHideText. At runtime, the program uses
// the strings via GetDecryptedText.
//
//  i.e.
//  PEHT_DEFINE_ENCRYPTED_TEXT(MyStringName,_T("My encrypted string"))
//  _tprintf(_T("%s"), GetDecryptedText(MyStringName));
//  FreeDecryptedText(MyStringName);
//
// WARNING: Notice we pass the pointer to the ENCRYPTED string to FreeDecryptedText.
//  Do NOT pass the pointer returned by GetDecryptedText.
//
//
#pragma once

#define PEHT_ENCRYPTION_MARKER_A "peh0001apeht9011"
#define PEHT_ENCRYPTION_MARKER_W L"pe0aen93"
#define PEHT_ENCRYPTION_MARKER_LEN (16)		// length in bytes

// method 1 to define an encrypted string
// TCHAR *ptszMyString=PEHT_ENCRYPTION_MARKER _T("My encrypted string");
#if defined(UNICODE) | defined(_UNICODE)
#define PEHT_ENCRYPTION_MARKER PEHT_ENCRYPTION_MARKER_W
#else
#define PEHT_ENCRYPTION_MARKER PEHT_ENCRYPTION_MARKER_A
#endif

// method 2 to define an encrypted string
// PEHT_DEFINE_ENCRYPTED_TEXT(MyStringName,_T("My encrypted string"))
#define PEHT_DEFINE_ENCRYPTED_TEXT_A(name,text) char* name = PEHT_ENCRYPTION_MARKER_A text;
#define PEHT_DEFINE_ENCRYPTED_TEXT_W(name,text) wchar_t * name = PEHT_ENCRYPTION_MARKER_W text;

#if defined(UNICODE) | defined(_UNICODE)
#define PEHT_DEFINE_ENCRYPTED_TEXT(name, text) PEHT_DEFINE_ENCRYPTED_TEXT_W(name, text)
#else
#define PEHT_DEFINE_ENCRYPTED_TEXT(name, text) PEHT_DEFINE_ENCRYPTED_TEXT_A(name, text)
#endif

#pragma warning(push)
#pragma warning(disable:4200)	// temporarily disable warning about zero sized array
// sizeof(ENC_BUFFER) must equal PEHT_ENCRYPTION_MARKER_LEN
typedef struct _ENC_BUFFER
{	
	DWORD dwSize;
	DWORD dwKey;
	DWORD dwNothing0;
	DWORD dwNothing1;
	unsigned char Buffer[0];
} PEHT_ENC_BUFFER,*PPEHT_ENC_BUFFER;
#pragma warning(pop)

////////////////////////////////////////////////////
//
// functions
//
#if defined(UNICODE) | defined(_UNICODE)
#define GetEncryptedText GetEncryptedTextW
#define GetEncryptedTextT GetEncryptedTextW
#define FreeDecryptedText FreeDecryptedTextW
#define FreeDecryptedTextT FreeDecryptedTextW
#else
#define GetEncryptedText GetEncryptedTextA
#define FreeDecryptedText FreeDecryptedTextA
#endif

wchar_t *GetEncryptedTextW(wchar_t *pwszText);
char *GetEncryptedTextA(char *pszText);

void FreeDecryptedTextA(char *pszText);
void FreeDecryptedTextW(wchar_t *pwszText);
void FreeAllDecryptedTexts();

// free all buffers, perform other cleanup
void PEHTCleanup();
