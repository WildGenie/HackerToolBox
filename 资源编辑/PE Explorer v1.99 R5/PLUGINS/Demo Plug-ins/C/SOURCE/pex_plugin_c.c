//-----------------------------------------------------------------------------
// Demo Plug-In
// (c)2001 by Mike Caetano/Heaventools Software.
// http://www.heaventools.com
//
// C++
//-----------------------------------------------------------------------------
#include <windows.h>

#include "globals.h"

// ---------------------------------------------------------------------------
// PEX MEMORY ALLOCATOR FUNCTION POINTER TYPEDEF
typedef	void * __stdcall (*pfnMemoryAllocator)(DWORD);

// ---------------------------------------------------------------------------
// PEX CALLBACK FUNCTION FUNCTION POINTER TYPEDEF
typedef	void __stdcall (*pfnPGICallBack)(DWORD, DWORD, LPCTSTR);

// ---------------------------------------------------------------------------
// PEX PLUGIN INTERFACE STRUCTURE
typedef struct tagPGIParamsBlock
{
	pfnMemoryAllocator pMemAllocator;	// function pointer to PEX supplied memory allocation
	pfnPGICallBack pCallBack;			// function pointer to PEX callback function
	LPVOID pInBuff;						// pointer to input buffer
	LPVOID pOutBuff;					// pointer to output buffer filled by plugin
	DWORD dwInSize;						// size in bytes of input buffer
	DWORD dwOutSize;					// size in bytes of output buffer set by plugin
	DWORD dwInterface;					// read only interface ID
	DWORD dwIndex;						// read only plugin index
}
PGIParamsBlock, *PPGIParamsBlock;

// ---------------------------------------------------------------------------
// GLOBAL VARIABLES

LPCTSTR szPluginName = SZPLUGINNAME;

DWORD   evID_PostLogInfo = 0;

// ---------------------------------------------------------------------------
// EXPORT FUNCTION PROTOTYPES
void __stdcall PexRegisterPlugIn(LPCTSTR *);
void __stdcall PexAboutPlugIn(void);
BOOL __stdcall PexPreloadImage(PPGIParamsBlock);

// ---------------------------------------------------------------------------
// EXPORT FUNCTION IMPLEMENTATIONS

// ---------------------------------------------------------------------------
// P E X R E G I S T E R P L U G I N

void __stdcall __declspec(dllexport) PexRegisterPlugIn(LPCTSTR *ppPluginName)
{
	*ppPluginName = szPluginName;
}


// ---------------------------------------------------------------------------
// P E X A B O U T P L U G I N

void __stdcall __declspec(dllexport) PexAboutPlugIn(void)
{
	TCHAR szBuffer[MAX_PATH];
	ZeroMemory(szBuffer,MAX_PATH);
	wsprintf(szBuffer, TEXT("%s\r\n%s"), szPluginName, SZVERSION);
	MessageBox(NULL, szBuffer, TEXT("About"), MB_OK|MB_ICONINFORMATION);
}


// ---------------------------------------------------------------------------
// P E X P R E L O A D I M A G E

BOOL __stdcall __declspec(dllexport) PexPreloadImage(PPGIParamsBlock pPGIPB)
{

	// assume the worst :-)
	BOOL result = FALSE;

	// setup messages for PEX log window
	LPCTSTR DemoMessage1 = "Emulating Execution...";
	LPCTSTR DemoMessage2 = "Allocating memory ...";
	LPCTSTR DemoMessage3 = "Copy InBuff to OutBuff...";
	LPCTSTR DemoMessage4 = "Runtime error: PexPreloadImage";

	// assign function pointers to local variables
	pfnMemoryAllocator MA = pPGIPB->pMemAllocator;
	pfnPGICallBack CB = pPGIPB->pCallBack;

	__try
	{

		// announce plugin invocation
		if ( CB != NULL ) {
			CB(pPGIPB->dwInterface, evID_PostLogInfo, DemoMessage1);
		}

		// announce action preparation
		if ( CB != NULL ) {
 		    CB(pPGIPB->dwInterface, evID_PostLogInfo, DemoMessage2);
		}

		// set output buffer size parameter
  		pPGIPB->dwOutSize = pPGIPB->dwInSize;

		// let PEX allocate shared memory for output buffer
		pPGIPB->pOutBuff = MA(pPGIPB->dwInSize);

		// transfer contents to output buffer
		CopyMemory(pPGIPB->pOutBuff, pPGIPB->pInBuff, pPGIPB->dwInSize);

		// announce action success
		if ( CB != NULL ) {
 		    CB(pPGIPB->dwInterface, evID_PostLogInfo, DemoMessage3);
		}

		// all systems go!
		result = TRUE;

	}
	__except ( EXCEPTION_EXECUTE_HANDLER )
	{

		// announce error
		if ( CB != NULL ) {
 		    CB(pPGIPB->dwInterface, evID_PostLogInfo, DemoMessage4);
 		}

	}

	// return status
	return(result);

}

// ---------------------------------------------------------------------------
