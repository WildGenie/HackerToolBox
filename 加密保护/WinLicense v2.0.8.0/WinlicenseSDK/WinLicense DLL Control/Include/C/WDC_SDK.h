#ifndef __WDC_SDK__
#define __WDC_SDK__


// WinLicense DLL Control constants definition

const int wdcRegistered             = 0;
const int wdcTrial                  = 1;

const int wdcNoError                = 0;
const int wdcInvalidLicense         = 2;
const int wdcInvalidHardwareLicense = 3;
const int wdcNoMoreHwdChanges       = 4;
const int wdcLicenseExpired         = 5;
const int wdcInvalidCountryLicense  = 6;
const int wdcLicenseStolen          = 7;
const int wdcWrongLicenseExp        = 8;
const int wdcWrongLicenseHardware   = 9;
const int wdcTrialExpired           = 10;
const int wdcTrialManipulated       = 11;


// definition for TWDCfunctionsArray

typedef bool (*TWLRestartApplication)();
typedef bool (*TWLRegNormalKeyCheck)(char* AsciiKey);
typedef bool (*TWLRegNormalKeyInstallToFile)(char* AsciiKey);
typedef bool (*TWLRegNormalKeyInstallToRegistry)(char* AsciiKey);
typedef bool (*TWLRegSmartKeyCheck)(char* UserName, char* Organization, char* Custom, char* AsciiKey);
typedef bool (*TWLRegSmartKeyInstallToFile)(char* UserName, char* Organization, char* Custom, char* AsciiKey);
typedef bool (*TWLRegSmartKeyInstallToRegistry)(char* UserName, char* Organization, char* Custom, char* AsciiKey);

typedef struct TWDCfunctionsArray {    

	TWLRestartApplication  pfWLRestartApplication;
	TWLRegNormalKeyCheck  pfWLRegNormalKeyCheck;
	TWLRegNormalKeyInstallToFile  pfWLRegNormalKeyInstallToFile;
	TWLRegNormalKeyInstallToRegistry  pfWLRegNormalKeyInstallToRegistry;
	TWLRegSmartKeyCheck  pfWLRegSmartKeyCheck;
	TWLRegSmartKeyInstallToFile  pfWLRegSmartKeyInstallToFile;
	TWLRegSmartKeyInstallToRegistry  pfWLRegSmartKeyInstallToRegistry;
	
} TWDCfunctionsArray, *PTWDCfunctionsArray;


// definition for Trial and Registration expiration information

typedef struct TTrialExpInfo {    

    int  DaysLeft;
	int  ExecutionsLeft;
    SYSTEMTIME  DateExp;
    int GlobalTimeLeft;

} TTrialExpInfo, *PTTrialExpInfo;

typedef struct TRegExpInfo {    

    int  DaysLeft;
	int  ExecutionsLeft;
    SYSTEMTIME  DateExp;
    int GlobalTimeLeft;

} TRegExpInfo, *PTRegExpInfo;


#endif

