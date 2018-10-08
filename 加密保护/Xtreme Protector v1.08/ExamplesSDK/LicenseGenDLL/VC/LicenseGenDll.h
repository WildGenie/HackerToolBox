#ifndef __LICGENDLL__
#define __LICGENDLL__

 #ifdef __BORLANDC__

 extern "C" _stdcall __declspec(dllimport) int CreateLicenseKey (char* lpName,\
 				     char* lpOrganization, char *Custom, char* lpHwID, int iNumDays, int iNumExec,
			         char* lpCaption, char* lpDaysBody, char* lpExecBody, void* lpBufferOut);


 #else

 extern "C" int _stdcall CreateLicenseKey (char* lpName,\
 				     char* lpOrganization, char *Custom, char* lpHwID, int iNumDays, int iNumExec,
			         char* lpCaption, char* lpDaysBody, char* lpExecBody, void* lpBufferOut);

 #endif

#endif
