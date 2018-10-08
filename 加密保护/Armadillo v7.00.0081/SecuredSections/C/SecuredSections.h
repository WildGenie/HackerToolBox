
#if defined(__BORLANDC__)
	/* These definitions provided by Dr. Todd Brennan, 04Oct2002 */
	#define SECUREBEGIN     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x00;}
	#define SECUREEND       _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_A   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x01;}
	#define SECUREEND_A     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_B   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x02;}
	#define SECUREEND_B     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_C   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x03;}
	#define SECUREEND_C     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_D   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x04;}
	#define SECUREEND_D     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_E   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x05;}
	#define SECUREEND_E     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_F   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x06;}
	#define SECUREEND_F     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_G   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x07;}
	#define SECUREEND_G     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_H   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x08;}
	#define SECUREEND_H     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_I   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x09;}
	#define SECUREEND_I     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_J   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x0A;}
	#define SECUREEND_J     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define SECUREBEGIN_K   _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0x0B;}
	#define SECUREEND_K     _asm {db 0xEB; db 0x03; db 0xD6; db 0xD6; db 0xFF;}
	#define NANOBEGIN       _asm {db 0xEB; db 0x03; db 0xD6; db 0xD7; db 0x01;}
	#define NANOEND         _asm {db 0xEB; db 0x03; db 0xD6; db 0xD7; db 0x00;}

	/* The former definitions for Borland C++ Builder, if anyone needs them. */
	/*
	#define SECUREBEGIN   __emit__ (0xEB,0x03,0xD6,0xD6,0x00);
	#define SECUREEND     __emit__ (0xEB,0x03,0xD6,0xD6,0xFF);
	#define SECUREBEGIN_A __emit__ (0xEB,0x03,0xD6,0xD6,0x01);
	#define SECUREEND_A   __emit__ (0xEB,0x03,0xD6,0xD6,0xFF);
	#define SECUREBEGIN_B __emit__ (0xEB,0x03,0xD6,0xD6,0x02);
	#define SECUREEND_B   __emit__ (0xEB,0x03,0xD6,0xD6,0xFF);
	#define SECUREBEGIN_C __emit__ (0xEB,0x03,0xD6,0xD6,0x03);
	#define SECUREEND_C   __emit__ (0xEB,0x03,0xD6,0xD6,0xFF);
	#define NANOBEGIN     __emit__ (0xEB,0x03,0xD6,0xD7,0x01);
	#define NANOEND       __emit__ (0xEB,0x03,0xD6,0xD7,0x00);
	*/
#elif defined(__LCC__)
	/* Provided by Rubem Pechansky, 26Feb2003 */
	#define SECUREBEGIN   _asm(".byte 0xEB,0x03,0xD6,0xD6,0x00");
	#define SECUREEND     _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_A _asm(".byte 0xEB,0x03,0xD6,0xD6,0x01");
	#define SECUREEND_A   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_B _asm(".byte 0xEB,0x03,0xD6,0xD6,0x02");
	#define SECUREEND_B   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_C _asm(".byte 0xEB,0x03,0xD6,0xD6,0x03");
	#define SECUREEND_C   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_D _asm(".byte 0xEB,0x03,0xD6,0xD6,0x04");
	#define SECUREEND_D   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_E _asm(".byte 0xEB,0x03,0xD6,0xD6,0x05");
	#define SECUREEND_E   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_F _asm(".byte 0xEB,0x03,0xD6,0xD6,0x06");
	#define SECUREEND_F   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_G _asm(".byte 0xEB,0x03,0xD6,0xD6,0x07");
	#define SECUREEND_G   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_H _asm(".byte 0xEB,0x03,0xD6,0xD6,0x08");
	#define SECUREEND_H   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_I _asm(".byte 0xEB,0x03,0xD6,0xD6,0x09");
	#define SECUREEND_I   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_J _asm(".byte 0xEB,0x03,0xD6,0xD6,0x0A");
	#define SECUREEND_J   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define SECUREBEGIN_K _asm(".byte 0xEB,0x03,0xD6,0xD6,0x0B");
	#define SECUREEND_K   _asm(".byte 0xEB,0x03,0xD6,0xD6,0xFF");
	#define NANOBEGIN     _asm(".byte 0xEB,0x03,0xD6,0xD7,0x01");
	#define NANOEND       _asm(".byte 0xEB,0x03,0xD6,0xD7,0x00");
#endif

#ifdef _WIN64
	#define ARMACCESS_API __declspec(dllimport) __stdcall
	extern "C" void ARMACCESS_API SECUREBEGIN(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_A(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_B(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_C(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_D(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_E(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_F(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_G(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_H(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_I(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_J(void);
	extern "C" void ARMACCESS_API SECUREBEGIN_K(void);
	extern "C" void ARMACCESS_API SECUREEND(void);
	extern "C" void ARMACCESS_API SECUREEND_A(void);
	extern "C" void ARMACCESS_API SECUREEND_B(void);
	extern "C" void ARMACCESS_API SECUREEND_C(void);
	extern "C" void ARMACCESS_API SECUREEND_D(void);
	extern "C" void ARMACCESS_API SECUREEND_E(void);
	extern "C" void ARMACCESS_API SECUREEND_F(void);
	extern "C" void ARMACCESS_API SECUREEND_G(void);
	extern "C" void ARMACCESS_API SECUREEND_H(void);
	extern "C" void ARMACCESS_API SECUREEND_I(void);
	extern "C" void ARMACCESS_API SECUREEND_J(void);
	extern "C" void ARMACCESS_API SECUREEND_K(void);
	extern "C" void ARMACCESS_API NANOBEGIN(void);
	extern "C" void ARMACCESS_API NANOEND(void);
	
	#define SECUREBEGIN SECUREBEGIN()
	#define SECUREEND SECUREEND()
	#define SECUREBEGIN_A SECUREBEGIN_A()
	#define SECUREEND_A SECUREEND_A()
	#define SECUREBEGIN_B SECUREBEGIN_B()
	#define SECUREEND_B SECUREEND_B()
	#define SECUREBEGIN_C SECUREBEGIN_C()
	#define SECUREEND_C SECUREEND_C()
	#define SECUREBEGIN_D SECUREBEGIN_D()
	#define SECUREEND_D SECUREEND_D()
	#define SECUREBEGIN_E SECUREBEGIN_E()
	#define SECUREEND_E SECUREEND_E()
	#define SECUREBEGIN_F SECUREBEGIN_F()
	#define SECUREEND_F SECUREEND_F()
	#define SECUREBEGIN_G SECUREBEGIN_G()
	#define SECUREEND_G SECUREEND_G()
	#define SECUREBEGIN_H SECUREBEGIN_H()
	#define SECUREEND_H SECUREEND_H()
	#define SECUREBEGIN_I SECUREBEGIN_I()
	#define SECUREEND_I SECUREEND_I()
	#define SECUREBEGIN_J SECUREBEGIN_J()
	#define SECUREEND_J SECUREEND_J()
	#define SECUREBEGIN_K SECUREBEGIN_K()
	#define SECUREEND_K SECUREEND_K()
	#define NANOBEGIN NANOBEGIN()
	#define NANOEND NANOEND()

#else
	#define SECUREBEGIN   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x00
	#define SECUREEND     __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_A __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x01
	#define SECUREEND_A   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_B __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x02
	#define SECUREEND_B   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_C __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x03
	#define SECUREEND_C   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_D __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x04
	#define SECUREEND_D   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_E __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x05
	#define SECUREEND_E   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_F __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x06
	#define SECUREEND_F   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_G __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x07
	#define SECUREEND_G   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_H __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x08
	#define SECUREEND_H   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_I __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x09
	#define SECUREEND_I   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_J __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x0A
	#define SECUREEND_J   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define SECUREBEGIN_K __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0x0B
	#define SECUREEND_K   __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD6 __asm _emit 0xFF
	#define NANOBEGIN     __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD7 __asm _emit 0x01
	#define NANOEND       __asm _emit 0xEB __asm _emit 0x03 __asm _emit 0xD6 __asm _emit 0xD7 __asm _emit 0x00
#endif
