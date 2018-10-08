unit WinlicenseSDK;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows;

const 

wlNoTrialExt             = 0;
wlAppExtended            = 1;
wlInvalidTrialExt        = 2;
wlNoMoreExt              = 3;
wlTrialOk                = 0;
wlTrialDaysExpired       = 1;
wlTrialExecExpired       = 2;
wlTrialDateExpired       = 3;
wlTrialRuntimExpired     = 4;
wlTrialGlobalExpired     = 5;
wlTrailInvalidCountry    = 6;
wlMarkStolenKey          = 0;
wlMarkInvalidKey         = 1;
wlLicenseDaysExpired     = 1;
wlLicenseExecExpired     = 2;
wlLicenseDateExpired     = 3;
wlLicenseGlobalExpired   = 4;
wlLicenseRuntimeExpired  = 5;
wlIsTrial                = 0;
wlIsRegistered           = 1;
wlInvalidLicense         = 2;
wlInvalidHardwareLicense = 3;
wlNoMoreHwdChanges       = 4;
wlLicenseExpired         = 5;
wlInvalidCountryLicense  = 6;
wlLicenseStolen          = 7;
wlWrongLicenseExp        = 8;
wlWrongLicenseHardware   = 9;
wlPermKey                = -1;
wlNoKey                  = -2;
wlNoTrialDate            = -1;
wlInvalidCounter         = -1;

function WLGenTrialExtensionFileKey(TrialHash:PChar; Level:Integer; NumDays:Integer; NumExec:Integer; NewDate:Pointer; NumMinutes:Integer; TimeRuntime:Integer; BufferOut:PChar):Integer; stdcall;
function WLGenTrialExtensionRegistryKey(TrialHash:PChar; Level:Integer; NumDays:Integer; NumExec:Integer; NewDate:Pointer; NumMinutes:Integer; TimeRuntime:Integer; pKeyName:PChar; pKeyValueName:PChar; BufferOut:PChar):Integer; stdcall;
function WLGenPassword(PasswordHash:PChar; Name:PChar; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseFileKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseRegistryKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; KeyName:PChar; KeyValueName:PChar; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseTextKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseSmartKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; BufferOut:PChar):Integer; stdcall;
function WLRegGetStatus(var ExtendedInfo:Integer):Integer; stdcall;
function WLTrialGetStatus(var ExtendedInfo:Integer):Integer; stdcall;
function WLTrialExtGetStatus():Integer; stdcall;
function WLRegGetLicenseInfo(UserName:PChar; Organization:PChar; CustomData:PChar):Boolean; stdcall;
function WLTrialTotalDays():Integer; stdcall;
function WLTrialTotalExecutions():Integer; stdcall;
function WLTrialDaysLeft():Integer; stdcall;
function WLTrialExecutionsLeft():Integer; stdcall;
function WLTrialExpirationDate(pExpDate:Pointer):Integer; stdcall;
function WLTrialGlobalTimeLeft():Integer; stdcall;
function WLTrialRuntimeLeft():Integer; stdcall;
function WLTrialLockedCountry():Integer; stdcall;
function WLRegDaysLeft():Integer; stdcall;
function WLRegExecutionsLeft():Integer; stdcall;
function WLRegExpirationDate(pExpDate:Pointer):Integer; stdcall;
function WLRegTotalExecutions():Integer; stdcall;
function WLRegTotalDays():Integer; stdcall;
function WLHardwareGetID(pHardId:PChar):Boolean; stdcall;
function WLHardwareCheckID(pHardId:PChar):Boolean; stdcall;
function WLRegSmartKeyCheck(UserName:PChar; Organization:PChar; CustomData:PChar; AsciiKey:PChar):Boolean; stdcall;
function WLRegNormalKeyCheck(AsciiKey:PChar):Boolean; stdcall;
function WLRegNormalKeyInstallToFile(AsciiKey:PChar):Boolean; stdcall;
function WLRegNormalKeyInstallToRegistry(AsciiKey:PChar):Boolean; stdcall;
function WLRegSmartKeyInstallToFile(UserName:PChar; Organization:PChar; CustomData:PChar; AsciiKey:PChar):Boolean; stdcall;
function WLRegSmartKeyInstallToRegistry(UserName:PChar; Organization:PChar; CustomData:PChar; AsciiKey:PChar):Boolean; stdcall;
function WLTrialCustomCounterInc(Value:Integer; CounterID:Integer):Integer; stdcall;
function WLTrialCustomCounterDec(Value:Integer; CounterID:Integer):Integer; stdcall;
function WLTrialCustomCounter(CounterID:Integer):Integer; stdcall;
function WLRestartApplication():Boolean; stdcall;
function WLRegLockedCountry():Integer; stdcall;
function WLRegRuntimeLeft():Integer; stdcall;
function WLRegGlobalTimeLeft():Integer; stdcall;
function WLRegRemoveCurrentKey():Boolean; stdcall;
function WLHardwareGetFormattedID(CharBlockSize:Integer; Uppercase:Integer; Buffer:PChar):Boolean; stdcall;
function WLPasswordCheck(UserName:PChar; Password:PChar):Boolean; stdcall;
function WLTrialExpireTrial():Boolean; stdcall;
function WLStringDecrypt(pString:PChar):PChar; stdcall;

implementation

const
  WinlicenseDLL = 'WinlicenseSDK.DLL';

function WLStringDecrypt; external WinlicenseDLL name 'WLStringDecrypt';
function WLGenTrialExtensionFileKey; external WinlicenseDLL name 'WLGenTrialExtensionFileKey';
function WLGenTrialExtensionRegistryKey; external WinlicenseDLL name 'WLGenTrialExtensionRegistryKey';
function WLGenPassword; external WinlicenseDLL name 'WLGenPassword';
function WLGenLicenseFileKey; external WinlicenseDLL name 'WLGenLicenseFileKey';
function WLGenLicenseRegistryKey; external WinlicenseDLL name 'WLGenLicenseRegistryKey';
function WLGenLicenseTextKey; external WinlicenseDLL name 'WLGenLicenseTextKey';
function WLGenLicenseSmartKey; external WinlicenseDLL name 'WLGenLicenseSmartKey';
function WLRegGetStatus; external WinlicenseDLL name 'WLRegGetStatus';
function WLTrialGetStatus; external WinlicenseDLL name 'WLTrialGetStatus';
function WLTrialExtGetStatus; external WinlicenseDLL name 'WLTrialExtGetStatus';
function WLRegGetLicenseInfo; external WinlicenseDLL name 'WLRegGetLicenseInfo';
function WLTrialTotalDays; external WinlicenseDLL name 'WLTrialTotalDays';
function WLTrialTotalExecutions; external WinlicenseDLL name 'WLTrialTotalExecutions';
function WLTrialDaysLeft; external WinlicenseDLL name 'WLTrialDaysLeft';
function WLTrialExecutionsLeft; external WinlicenseDLL name 'WLTrialExecutionsLeft';
function WLTrialExpirationDate; external WinlicenseDLL name 'WLTrialExpirationDate';
function WLTrialGlobalTimeLeft; external WinlicenseDLL name 'WLTrialGlobalTimeLeft';
function WLTrialRuntimeLeft; external WinlicenseDLL name 'WLTrialRuntimeLeft';
function WLTrialLockedCountry; external WinlicenseDLL name 'WLTrialLockedCountry';
function WLRegDaysLeft; external WinlicenseDLL name 'WLRegDaysLeft';
function WLRegExecutionsLeft; external WinlicenseDLL name 'WLRegExecutionsLeft';
function WLRegExpirationDate; external WinlicenseDLL name 'WLRegExpirationDate';
function WLRegTotalExecutions; external WinlicenseDLL name 'WLRegTotalExecutions';
function WLRegTotalDays; external WinlicenseDLL name 'WLRegTotalDays';
function WLHardwareGetID; external WinlicenseDLL name 'WLHardwareGetID';
function WLHardwareCheckID; external WinlicenseDLL name 'WLHardwareCheckID';
function WLRegSmartKeyCheck; external WinlicenseDLL name 'WLRegSmartKeyCheck';
function WLRegNormalKeyCheck; external WinlicenseDLL name 'WLRegNormalKeyCheck';
function WLRegNormalKeyInstallToFile; external WinlicenseDLL name 'WLRegNormalKeyInstallToFile';
function WLRegNormalKeyInstallToRegistry; external WinlicenseDLL name 'WLRegNormalKeyInstallToRegistry';
function WLRegSmartKeyInstallToFile; external WinlicenseDLL name 'WLRegSmartKeyInstallToFile';
function WLRegSmartKeyInstallToRegistry; external WinlicenseDLL name 'WLRegSmartKeyInstallToRegistry';
function WLTrialCustomCounterInc; external WinlicenseDLL name 'WLTrialCustomCounterInc';
function WLTrialCustomCounterDec; external WinlicenseDLL name 'WLTrialCustomCounterDec';
function WLTrialCustomCounter; external WinlicenseDLL name 'WLTrialCustomCounter';
function WLRestartApplication; external WinlicenseDLL name 'WLRestartApplication';
function WLRegLockedCountry; external WinlicenseDLL name 'WLRegLockedCountry';
function WLRegRuntimeLeft; external WinlicenseDLL name 'WLRegRuntimeLeft';
function WLRegGlobalTimeLeft; external WinlicenseDLL name 'WLRegGlobalTimeLeft';
function WLRegRemoveCurrentKey; external WinlicenseDLL name 'WLRegRemoveCurrentLicense';
function WLHardwareGetFormattedID; external WinlicenseDLL name 'WLHardwareGetFormattedID';
function WLPasswordCheck; external WinlicenseDLL name 'WLPasswordCheck';
function WLTrialExpireTrial; external WinlicenseDLL name 'WLTrialExpireTrial';

end.

