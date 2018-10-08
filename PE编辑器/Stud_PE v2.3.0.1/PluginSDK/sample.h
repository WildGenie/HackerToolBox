//sample.h
#ifndef __SamplePlugin_h__
#define __SamplePlugin_h__

#ifdef NDEBUG
#pragma optimize("gsy",on)
#pragma comment(linker,"/IGNORE:4078 /IGNORE:4089")
#pragma comment(linker,"/RELEASE")
#pragma comment(linker,"/merge:.rdata=.data")
#pragma comment(linker,"/merge:.text=.data")
#if _MSC_VER >= 1000
#pragma comment(linker,"/FILEALIGN:0x200")
#endif
#endif

//with this we cut crt startup code
//so if you need some functions you may want to comment this line
//and disable "Ignore default lib" from project settings
#pragma comment ( linker, "/entry:\"DllMain\"" )

#endif //__SamplePlugin_h__