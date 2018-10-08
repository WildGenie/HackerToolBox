#ifndef __XPROTECTOR__
#define __XPROTECTOR__

#define LICENSE_VALID           0
#define LICENSE_NOPRESENT       1
#define LICENSE_INVALID         2
#define LICENSE_BAD_HWID        3
#define LICENSE_MANIPULATED     4

 #ifdef __BORLANDC__

 extern "C" _stdcall __declspec(dllimport) bool IsRegistered();
 extern "C" _stdcall __declspec(dllimport) bool GetLicenseInfo(char* lpName, char* lpOrganization, char* Custom);
 extern "C" _stdcall __declspec(dllimport) int DemoGetDaysToExpire ();
 extern "C" _stdcall __declspec(dllimport) int DemoGetExecutionsToExpire ();
 extern "C" _stdcall __declspec(dllimport) int RegisteredGetDaysToExpire ();
 extern "C" _stdcall __declspec(dllimport) int RegisteredGetExecutionsToExpire  ();
 extern "C" _stdcall __declspec(dllimport) int DemoTotalDays  ();
 extern "C" _stdcall __declspec(dllimport) int DemoTotalExecutions  ();
 extern "C" _stdcall __declspec(dllimport) int RegisteredTotalDays  ();
 extern "C" _stdcall __declspec(dllimport) int RegisteredTotalExecutions  ();
 extern "C" _stdcall __declspec(dllimport) bool GetHardwareID(char* buffer);
 extern "C" _stdcall __declspec(dllimport) bool ValidateHardwareID(char* buffer);
 extern "C" _stdcall __declspec(dllimport) int  DateKeyDaysLeft();
 extern "C" _stdcall __declspec(dllimport) bool DateKeyExpirationDate(SYSTEMTIME* SisTime);
 extern "C" _stdcall __declspec(dllimport) int  CheckLicenseValidation();


 #else

 extern "C" bool _stdcall IsRegistered();
 extern "C" bool _stdcall GetLicenseInfo(char* lpName, char* lpOrganization, char* Custom);
 extern "C" int _stdcall  DemoGetDaysToExpire ();
 extern "C" int _stdcall  DemoGetExecutionsToExpire ();
 extern "C" int _stdcall  RegisteredGetDaysToExpire ();
 extern "C" int _stdcall  RegisteredGetExecutionsToExpire  ();
 extern "C" int _stdcall   DemoTotalDays  ();
 extern "C" int _stdcall   DemoTotalExecutions  ();
 extern "C" int _stdcall   RegisteredTotalDays  ();
 extern "C" int _stdcall   RegisteredTotalExecutions  ();
 extern "C" bool _stdcall  GetHardwareID(char* buffer);
 extern "C" bool _stdcall  ValidateHardwareID(char* buffer);
 extern "C" int  _stdcall  DateKeyDaysLeft();
 extern "C" bool _stdcall  DateKeyExpirationDate(SYSTEMTIME* SysTime);
 extern "C" int  _stdcall  CheckLicenseValidation();


 #endif

#ifndef __XPROT_MACROS__

 #ifdef __BORLANDC__

 #define PATCH_START      __emit__ (0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x00, 0x00, 0x00, 0x00, \
								    0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F);
 #define PATCH_END        __emit__ (0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x01, 0x00, 0x00, 0x00, \
								    0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F);

 #define REGISTERED_START __emit__ (0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x02, 0x00, 0x00, 0x00, \
								    0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F);
 #define REGISTERED_END   __emit__ (0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x03, 0x00, 0x00, 0x00, \
								    0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F);

 #define ENCODE_START     __emit__ (0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x04, 0x00, 0x00, 0x00, \
								    0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F);
 #define ENCODE_END       __emit__ (0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x05, 0x00, 0x00, 0x00, \
								    0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F);

 #define CLEAR_START      __emit__ (0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x06, 0x00, 0x00, 0x00, \
								    0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F);
 #define CLEAR_END        __emit__ (0xEB, 0x15, 0x78, 0x70, 0x72, 0x6F, 0x07, 0x00, 0x00, 0x00, \
								    0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F, 0x00, 0x00, \
								    0x00, 0x00, 0x00);


 #define __XPROT_MACROS__
 #endif

#endif

#ifndef __XPROT_MACROS__

 #ifdef __ICL

 #define PATCH_START \
 __asm __emit 0xEB \
 __asm __emit 0x10 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F 

 #define PATCH_END \
 __asm __emit 0xEB \
 __asm __emit 0x10 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x01 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F 

 #define REGISTERED_START \
 __asm __emit 0xEB \
 __asm __emit 0x10 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x02 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F 

 #define REGISTERED_END \
 __asm __emit 0xEB \
 __asm __emit 0x10 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x03 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F 


 #define ENCODE_START \
 __asm __emit 0xEB \
 __asm __emit 0x10 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x04 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F 


 #define ENCODE_END \
 __asm __emit 0xEB \
 __asm __emit 0x10 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x05 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F 


 #define CLEAR_START \
 __asm __emit 0xEB \
 __asm __emit 0x10 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x06 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F 


 #define CLEAR_END \
 __asm __emit 0xEB \
 __asm __emit 0x15 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x07 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x78 \
 __asm __emit 0x70 \
 __asm __emit 0x72 \
 __asm __emit 0x6F \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 \
 __asm __emit 0x00 


 #define __XPROT_MACROS__

 #endif
#endif


#ifndef __XPROT_MACROS__

 #ifdef __LCC__

 #define PATCH_START     __asm__ (" .byte\t0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x00, 0x00, 0x00, 0x00, \
								            0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F");
 #define PATCH_END       __asm__ (" .byte\t0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x01, 0x00, 0x00, 0x00, \
								           0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F");

 #define REGISTERED_START __asm__(" .byte\t0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x02, 0x00, 0x00, 0x00, \
								           0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F");
 #define REGISTERED_END   __asm__(" .byte\t0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x03, 0x00, 0x00, 0x00, \
								           0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F");

 #define ENCODE_START     __asm__(" .byte\t0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x04, 0x00, 0x00, 0x00, \
								           0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F");
 #define ENCODE_END       __asm__(" .byte\t0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x05, 0x00, 0x00, 0x00, \
								           0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F");

 #define CLEAR_START      __asm__(" .byte\t0xEB, 0x10, 0x78, 0x70, 0x72, 0x6F, 0x06, 0x00, 0x00, 0x00, \
								           0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F");

 #define CLEAR_END        __asm__(" .byte\t0xEB, 0x15, 0x78, 0x70, 0x72, 0x6F, 0x07, 0x00, 0x00, 0x00, \
								           0x00, 0x00, 0x00, 0x00, 0x78, 0x70, 0x72, 0x6F, 0x00, 0x00, \
								           0x00, 0x00, 0x00");

 #define __XPROT_MACROS__
 #endif

#endif


#ifndef __XPROT_MACROS__

 #define PATCH_START \
 __asm _emit 0xEB \
 __asm _emit 0x10 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F 

 #define PATCH_END \
 __asm _emit 0xEB \
 __asm _emit 0x10 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x01 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F 

 #define REGISTERED_START \
 __asm _emit 0xEB \
 __asm _emit 0x10 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x02 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F 

#define REGISTERED_END \
 __asm _emit 0xEB \
 __asm _emit 0x10 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x03 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F 

 #define ENCODE_START \
 __asm _emit 0xEB \
 __asm _emit 0x10 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x04 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F 

 #define ENCODE_END \
 __asm _emit 0xEB \
 __asm _emit 0x10 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x05 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F 

 #define CLEAR_START \
 __asm _emit 0xEB \
 __asm _emit 0x10 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x06 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F 

 #define CLEAR_END \
 __asm _emit 0xEB \
 __asm _emit 0x15 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x07 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x78 \
 __asm _emit 0x70 \
 __asm _emit 0x72 \
 __asm _emit 0x6F \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 \
 __asm _emit 0x00 

#endif

#endif
