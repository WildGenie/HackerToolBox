// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the PEC2HOOKS_FASTIMPORT_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// PEC2HOOKS_FASTIMPORT_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef PEC2HOOKS_FASTIMPORT_EXPORTS
#define PEC2HOOKS_FASTIMPORT_API __declspec(dllexport)
#else
#define PEC2HOOKS_FASTIMPORT_API __declspec(dllimport)
#endif

// This class is exported from the pec2hooks_fastimport.dll
class PEC2HOOKS_FASTIMPORT_API Cpec2hooks_fastimport {
public:
	Cpec2hooks_fastimport(void);
	// TODO: add your methods here.
};

extern PEC2HOOKS_FASTIMPORT_API int npec2hooks_fastimport;

PEC2HOOKS_FASTIMPORT_API int fnpec2hooks_fastimport(void);
