#ifndef __PASSGENDLL__
#define __PASSGENDLL__

 #ifdef __BORLANDC__

GeneratePassword proc UserName:DWORD, BufferOut:DWORD

 extern "C" _stdcall __declspec(dllimport) bool GeneratePassword (char* UserName, char* BufferOut);


 #else

 extern "C" bool _stdcall GeneratePassword (char* UserName, char* BufferOut);

 #endif

#endif

