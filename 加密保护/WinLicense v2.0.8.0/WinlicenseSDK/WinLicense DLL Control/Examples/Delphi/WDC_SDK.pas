unit WDC_SDK;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows;

const 

wdcRegistered             = 0;
wdcTrial                  = 1;


wdcNoError                = 0;
wdcInvalidLicense         = 2;
wdcInvalidHardwareLicense = 3;
wdcNoMoreHwdChanges       = 4;
wdcLicenseExpired         = 5;
wdcInvalidCountryLicense  = 6;
wdcLicenseStolen          = 7;
wdcWrongLicenseExp        = 8;
wdcWrongLicenseHardware   = 9;
wdcTrialExpired           = 10;
wdcTrialManipulated       = 11;


type

  TWLRestartApplication               = function():Boolean; stdcall;
  TWLRegNormalKeyCheck                = function(pTextKey:PChar):Boolean; stdcall;
  TWLRegNormalKeyInstallToFile        = function(pTextKey:PChar):Boolean; stdcall;
  TWLRegNormalKeyInstallToRegistry    = function(pTextKey:PChar):Boolean; stdcall;
  TWLRegSmartKeyCheck                 = function(pUserName:PChar; pOrganization:PChar; pCustomData:PChar; pSmartKey:PChar):Boolean; stdcall;
  TWLRegSmartKeyInstallToFile         = function(pUserName:PChar; pOrganization:PChar; pCustomData:PChar; pSmartKey:PChar):Boolean; stdcall;
  TWLRegSmartKeyInstallToRegistry     = function(pUserName:PChar; pOrganization:PChar; pCustomData:PChar; pSmartKey:PChar):Boolean; stdcall;

  TWDCfunctionsArray = record

    pfWLRestartApplication            : TWLRestartApplication;
    pfWLRegNormalKeyCheck             : TWLRegNormalKeyCheck;
    pfWLRegNormalKeyInstallToFile     : TWLRegNormalKeyInstallToFile;
    pfWLRegNormalKeyInstallToRegistry : TWLRegNormalKeyInstallToRegistry;
    pfWLRegSmartKeyCheck              : TWLRegSmartKeyCheck;
    pfWLRegSmartKeyInstallToFile      : TWLRegSmartKeyInstallToFile;
    pfWLRegSmartKeyInstallToRegistry  : TWLRegSmartKeyInstallToRegistry;
    
  end;

  TTrialExpInfo = record 

    DaysLeft                          : Integer;
    ExecutionsLeft                    : Integer;
    DateExp                           : SYSTEMTIME;
    GlobalTimeLeft                    : Integer;

  end;

  TRegExpInfo = record 

    DaysLeft                          : Integer;
    ExecutionsLeft                    : Integer;
    DateExp                           : SYSTEMTIME;
    GlobalTimeLeft                    : Integer;

  end;

implementation

end.

