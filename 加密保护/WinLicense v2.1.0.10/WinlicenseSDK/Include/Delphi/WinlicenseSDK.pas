unit WinlicenseSDK;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows;

type  
sLicenseFeatures = record 

     cb: Integer; 
     NumDays: Integer; 
     NumExec: Integer; 
     ExpDate: SYSTEMTIME; 
     CountryId: Integer; 
     Runtime: Integer; 
     GlobalMinutes: Integer; 
     InstallDate: SYSTEMTIME; 
     NetInstances: Integer; 
     EmbedLicenseInfoInKey: Integer; 
     EmbedCreationDate: Integer 

end; 
 

const 

wlNoTrialExt             	= 0;
wlAppExtended            	= 1;
wlInvalidTrialExt        	= 2;
wlNoMoreExt              	= 3;
wlTrialOk                	= 0;
wlTrialDaysExpired       	= 1;
wlTrialExecExpired       	= 2;
wlTrialDateExpired       	= 3;
wlTrialRuntimExpired     	= 4;
wlTrialGlobalExpired     	= 5;
wlTrialInvalidCountry    	= 6;
wlTrialManipulated       	= 7;
wlMarkStolenKey          	= 0;
wlMarkInvalidKey         	= 1;
wlLicenseDaysExpired     	= 1;
wlLicenseExecExpired     	= 2;
wlLicenseDateExpired     	= 3;
wlLicenseGlobalExpired   	= 4;
wlLicenseRuntimeExpired  	= 5;
wlLicenseActivationExpired 	= 6;
wlIsTrial                	= 0;
wlIsRegistered           	= 1;
wlInvalidLicense         	= 2;
wlInvalidHardwareLicense 	= 3;
wlNoMoreHwdChanges       	= 4;
wlLicenseExpired         	= 5;
wlInvalidCountryLicense  	= 6;
wlLicenseStolen          	= 7;
wlWrongLicenseExp        	= 8;
wlWrongLicenseHardware   	= 9;
wlIsRegisteredAndActivated 	= wlIsRegistered;
wlIsRegisteredNotActivated 	= 10;
wlNoMoreInstancesAllowed    = 12;
wlNetworkNoServerRunning 	= 13;
wlInstallLicenseDateExpired	= 14;
wlLicenseDisabledInInstance	= 15;


wlPermKey                = -1;
wlNoKey                  = -2;
wlNoTrialDate            = -1;
wlInvalidCounter         = -1;

function WLGenTrialExtensionFileKey(TrialHash:PChar; Level:Integer; NumDays:Integer; NumExec:Integer; NewDate:Pointer; NumMinutes:Integer; TimeRuntime:Integer; BufferOut:PChar):Integer; stdcall;
function WLGenTrialExtensionRegistryKey(TrialHash:PChar; Level:Integer; NumDays:Integer; NumExec:Integer; NewDate:Pointer; NumMinutes:Integer; TimeRuntime:Integer; pKeyName:PChar; pKeyValueName:PChar; BufferOut:PChar):Integer; stdcall;
function WLGenPassword(PasswordHash:PChar; Name:PChar; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseFileKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseFileKeyW(LicenseHash:PWideChar; UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; MachineID:PWideChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseFileKeyEx(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; var LicenseFeatures: sLicenseFeatures; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseFileKeyExW(LicenseHash:PWideChar; UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; MachineID:PWideChar; var LicenseFeatures: sLicenseFeatures; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseRegistryKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; KeyName:PChar; KeyValueName:PChar; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseRegistryKeyW(LicenseHash:PWideChar; UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; MachineID:PWideChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; KeyName:PWideChar; KeyValueName:PWideChar; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseRegistryKeyEx(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; var LicenseFeatures: sLicenseFeatures; KeyName:PChar; KeyValueName:PChar; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseRegistryKeyExW(LicenseHash:PWideChar; UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; MachineID:PWideChar; var LicenseFeatures: sLicenseFeatures; KeyName:PWideChar; KeyValueName:PWideChar; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseTextKeyW(LicenseHash:PWideChar; UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; MachineID:PWideChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; BufferOut:PWideChar):Integer; stdcall;
function WLGenLicenseTextKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; CountryId:Integer; Runtime:Integer; GlobalMinutes:Integer; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseTextKeyEx(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; var LicenseFeatures: sLicenseFeatures; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseTextKeyExW(LicenseHash:PWideChar; UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; MachineID:PWideChar; var LicenseFeatures: sLicenseFeatures; BufferOut:PWideChar):Integer; stdcall;
function WLGenLicenseSmartKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseSmartKeyW(LicenseHash:PWideChar; UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; MachineID:PWideChar; NumDays:Integer; NumExec:Integer; NewDate:Pointer; BufferOut:PWideChar):Integer; stdcall;
function WLGenLicenseDynSmartKey(LicenseHash:PChar; UserName:PChar; Organization:PChar; CustomData:PChar; MachineID:PChar; var LicenseFeatures: sLicenseFeatures; BufferOut:PChar):Integer; stdcall;
function WLGenLicenseDynSmartKeyW(LicenseHash:PWideChar; UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; MachineID:PWideChar; var LicenseFeatures: sLicenseFeatures; BufferOut:PWideChar):Integer; stdcall;
function WLRegGetStatus(var ExtendedInfo:Integer):Integer; stdcall;
function WLTrialGetStatus(var ExtendedInfo:Integer):Integer; stdcall;
function WLTrialExtGetStatus():Integer; stdcall;
function WLRegGetLicenseInfo(UserName:PChar; Organization:PChar; CustomData:PChar):Boolean; stdcall;
function WLRegGetLicenseInfoW(UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar):Boolean; stdcall;
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
function WLRegLicenseCreationDate(pCreationDate:Pointer):Boolean; stdcall;
function WLRegTotalExecutions():Integer; stdcall;
function WLRegTotalDays():Integer; stdcall;
function WLHardwareGetID(pHardId:PChar):Boolean; stdcall;
function WLHardwareCheckID(pHardId:PChar):Boolean; stdcall;
function WLRegSmartKeyCheck(UserName:PChar; Organization:PChar; CustomData:PChar; AsciiKey:PChar):Boolean; stdcall;
function WLRegSmartKeyCheckW(UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; AsciiKey:PChar):Boolean; stdcall;
function WLRegNormalKeyCheck(AsciiKey:PChar):Boolean; stdcall;
function WLRegNormalKeyCheckW(UnicodeKey:PWideChar):Boolean; stdcall;
function WLRegNormalKeyInstallToFile(AsciiKey:PChar):Boolean; stdcall;
function WLRegNormalKeyInstallToFileW(UnicodeKey:PWideChar):Boolean; stdcall;
function WLRegNormalKeyInstallToRegistry(AsciiKey:PChar):Boolean; stdcall;
function WLRegNormalKeyInstallToRegistryW(UnicodeKey:PWideChar):Boolean; stdcall;
function WLRegSmartKeyInstallToFile(UserName:PChar; Organization:PChar; CustomData:PChar; AsciiKey:PChar):Boolean; stdcall;
function WLRegSmartKeyInstallToFileW(UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; AsciiKey:PChar):Boolean; stdcall;
function WLRegSmartKeyInstallToRegistry(UserName:PChar; Organization:PChar; CustomData:PChar; AsciiKey:PChar):Boolean; stdcall;
function WLRegSmartKeyInstallToRegistryW(UserName:PWideChar; Organization:PWideChar; CustomData:PWideChar; AsciiKey:PChar):Boolean; stdcall;
function WLTrialCustomCounterInc(Value:Integer; CounterID:Integer):Integer; stdcall;
function WLTrialCustomCounterDec(Value:Integer; CounterID:Integer):Integer; stdcall;
function WLTrialCustomCounterSet(Value:Integer; CounterID:Integer):Integer; stdcall;
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
function WLStringDecryptW(pString:PWideChar):PChar; stdcall;
function GenUniqueLicenseHash(p1:PChar; p2:PChar; p3:PChar; p4:PChar; p5:PChar):Boolean;stdcall;
function ECCGenerateKeys(p1:PChar; p2:PChar; p3: Pchar; p4:PChar):Boolean;stdcall;
procedure WLRegLicenseName(p1:PChar; p2:PChar; p3:PChar);stdcall;
function WLRestartApplicationArgs(pArgs:PChar):Boolean; stdcall;
function WLActGetInfo(var Custom1:Integer; var Custom2:Integer; var Custom3:Integer):Boolean; stdcall;
function WLActCheck(ActivationCode:PChar):Boolean; stdcall;
function WLActInstall(ActivationCode:PChar):Boolean; stdcall;
function WLActExpirationDate(pExpDate:Pointer):Boolean; stdcall;
function WLActDaysToActivate():Integer; stdcall;
function WLActUninstall():Boolean; stdcall;
function WLGetCurrentCountry():Integer; stdcall;
// (CURRENTLY DISABLED) function WLRegGetLicenseHardwareID(pHardId:PChar):Boolean; stdcall;
function WLTrialExtGetLevel():Integer; stdcall;
function WLProtectCheckDebugger():Boolean; stdcall;
function WLTrialExtendExpiration(NumDays:Integer; NumExec:Integer; NewDate:Pointer; NumMinutes:Integer; TimeRuntime:Integer):Boolean; stdcall;
function WLTrialFirstRun():Boolean; stdcall;
function WLRegFirstRun():Boolean; stdcall;
function WLRegCheckMachineLocked():Boolean; stdcall;
function WLRegDisableCurrentKey(DisableFlags:Integer):Boolean; stdcall;
procedure WLSplashHide();stdcall;
procedure WLBufferCrypt(StartBuffer:Pointer; LengthBuffer:Integer; Password:PChar); stdcall;
procedure WLBufferDecrypt(StartBuffer:Pointer; LengthBuffer:Integer; Password:PChar); stdcall;
function WLRegSmartKeyInstallToFileInFolder(UserName:PChar; Organization:PChar; CustomData:PChar; AsciiKey:PChar; FilePath:PChar):Boolean; stdcall;
function WLTrialDateDaysLeft():Integer; stdcall;
function WLRegDateDaysLeft():Integer; stdcall;
function WLRegGetDynSmartKey(SmartKey:Pchar):Boolean; stdcall;
function WLRegDisableKeyCurrentInstance():Boolean;stdcall;
function WLHardwareRuntimeCheckU3():Boolean; stdcall;
procedure WLGetVersion(Buffer:PChar); stdcall;
function WLRegNetInstancesGet():Integer; stdcall;
function WLRegNetInstancesMax():Integer; stdcall;
procedure WLGetProtectionDate(var pProtectionDate:SYSTEMTIME); stdcall;

implementation

const
  WinlicenseDLL = 'WinlicenseSDK.DLL';

function WLStringDecrypt; external WinlicenseDLL name 'WLStringDecrypt';
function WLStringDecryptW; external WinlicenseDLL name 'WLStringDecryptW';
function WLGenTrialExtensionFileKey; external WinlicenseDLL name 'WLGenTrialExtensionFileKey';
function WLGenTrialExtensionRegistryKey; external WinlicenseDLL name 'WLGenTrialExtensionRegistryKey';
function WLGenPassword; external WinlicenseDLL name 'WLGenPassword';
function WLGenLicenseFileKey; external WinlicenseDLL name 'WLGenLicenseFileKey';
function WLGenLicenseFileKeyW; external WinlicenseDLL name 'WLGenLicenseFileKeyW';
function WLGenLicenseFileKeyEx; external WinlicenseDLL name 'WLGenLicenseFileKeyEx';
function WLGenLicenseRegistryKeyEx; external WinlicenseDLL name 'WLGenLicenseRegistryKeyEx';
function WLGenLicenseTextKeyEx; external WinlicenseDLL name 'WLGenLicenseTextKeyEx';
function WLGenLicenseRegistryKey; external WinlicenseDLL name 'WLGenLicenseRegistryKey';
function WLGenLicenseRegistryKeyW; external WinlicenseDLL name 'WLGenLicenseRegistryKeyW';
function WLGenLicenseTextKey; external WinlicenseDLL name 'WLGenLicenseTextKey';
function WLGenLicenseTextKeyW; external WinlicenseDLL name 'WLGenLicenseTextKey';
function WLGenLicenseSmartKey; external WinlicenseDLL name 'WLGenLicenseSmartKey';
function WLGenLicenseSmartKeyW; external WinlicenseDLL name 'WLGenLicenseSmartKeyW';
function WLRegGetStatus; external WinlicenseDLL name 'WLRegGetStatus';
function WLTrialGetStatus; external WinlicenseDLL name 'WLTrialGetStatus';
function WLTrialExtGetStatus; external WinlicenseDLL name 'WLTrialExtGetStatus';
function WLRegGetLicenseInfo; external WinlicenseDLL name 'WLRegGetLicenseInfo';
function WLRegGetLicenseInfoW; external WinlicenseDLL name 'WLRegGetLicenseInfoW';
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
function WLRegLicenseCreationDate; external WinlicenseDLL name 'WLRegLicenseCreationDate';
function WLRegTotalExecutions; external WinlicenseDLL name 'WLRegTotalExecutions';
function WLRegTotalDays; external WinlicenseDLL name 'WLRegTotalDays';
function WLHardwareGetID; external WinlicenseDLL name 'WLHardwareGetID';
function WLHardwareCheckID; external WinlicenseDLL name 'WLHardwareCheckID';
function WLRegSmartKeyCheck; external WinlicenseDLL name 'WLRegSmartKeyCheck';
function WLRegSmartKeyCheckW; external WinlicenseDLL name 'WLRegSmartKeyCheckW';
function WLRegNormalKeyCheck; external WinlicenseDLL name 'WLRegNormalKeyCheck';
function WLRegNormalKeyCheckW; external WinlicenseDLL name 'WLRegNormalKeyCheckW';
function WLRegNormalKeyInstallToFile; external WinlicenseDLL name 'WLRegNormalKeyInstallToFile';
function WLRegNormalKeyInstallToFileW; external WinlicenseDLL name 'WLRegNormalKeyInstallToFileW';
function WLRegNormalKeyInstallToRegistry; external WinlicenseDLL name 'WLRegNormalKeyInstallToRegistry';
function WLRegNormalKeyInstallToRegistryW; external WinlicenseDLL name 'WLRegNormalKeyInstallToRegistryW';
function WLRegSmartKeyInstallToFile; external WinlicenseDLL name 'WLRegSmartKeyInstallToFile';
function WLRegSmartKeyInstallToFileInFolder; external WinlicenseDLL name 'WLRegSmartKeyInstallToFileInFolder';
function WLRegSmartKeyInstallToFileW; external WinlicenseDLL name 'WLRegSmartKeyInstallToFileW';
function WLRegSmartKeyInstallToRegistry; external WinlicenseDLL name 'WLRegSmartKeyInstallToRegistry';
function WLRegSmartKeyInstallToRegistryW; external WinlicenseDLL name 'WLRegSmartKeyInstallToRegistryW';
function WLTrialCustomCounterInc; external WinlicenseDLL name 'WLTrialCustomCounterInc';
function WLTrialCustomCounterDec; external WinlicenseDLL name 'WLTrialCustomCounterDec';
function WLTrialCustomCounterSet; external WinlicenseDLL name 'WLTrialCustomCounterSet';
function WLTrialCustomCounter; external WinlicenseDLL name 'WLTrialCustomCounter';
function WLRestartApplication; external WinlicenseDLL name 'WLRestartApplication';
function WLRegLockedCountry; external WinlicenseDLL name 'WLRegLockedCountry';
function WLRegRuntimeLeft; external WinlicenseDLL name 'WLRegRuntimeLeft';
function WLRegGlobalTimeLeft; external WinlicenseDLL name 'WLRegGlobalTimeLeft';
function WLRegRemoveCurrentKey; external WinlicenseDLL name 'WLRegRemoveCurrentKey';
function WLHardwareGetFormattedID; external WinlicenseDLL name 'WLHardwareGetFormattedID';
function WLPasswordCheck; external WinlicenseDLL name 'WLPasswordCheck';
function WLTrialExpireTrial; external WinlicenseDLL name 'WLTrialExpireTrial';
function GenUniqueLicenseHash; external WinlicenseDLL name 'GenUniqueLicenseHash';
function ECCGenerateKeys; external WinlicenseDLL name 'ECCGenerateKeys';
procedure WLRegLicenseName; external WinlicenseDLL name 'WLRegLicenseName';
function WLRestartApplicationArgs; external WinlicenseDLL name 'WLRestartApplicationArgs';
function WLActGetInfo; external WinlicenseDLL name 'WLActGetInfo';
function WLActCheck; external WinlicenseDLL name 'WLActCheck';
function WLActInstall; external WinlicenseDLL name 'WLActInstall';
function WLActExpirationDate; external WinlicenseDLL name 'WLActExpirationDate';
function WLActDaysToActivate; external WinlicenseDLL name 'WLActDaysToActivate';
function WLActUninstall; external WinlicenseDLL name 'WLActUninstall';
function WLGetCurrentCountry; external WinlicenseDLL name 'WLGetCurrentCountry';
// (CURRENTLY DISABLED) function WLRegGetLicenseHardwareID; external WinlicenseDLL name 'WLRegGetLicenseHardwareID';
function WLTrialExtGetLevel; external WinlicenseDLL name 'WLTrialExtGetLevel';
function WLProtectCheckDebugger; external WinlicenseDLL name 'WLProtectCheckDebugger';
function WLTrialExtendExpiration; external WinlicenseDLL name 'WLTrialExtendExpiration';
function WLTrialFirstRun; external WinlicenseDLL name 'WLTrialFirstRun';
function WLRegFirstRun; external WinlicenseDLL name 'WLRegFirstRun';
function WLRegCheckMachineLocked; external WinlicenseDLL name 'WLRegCheckMachineLocked';
function WLRegDisableCurrentKey; external WinlicenseDLL name 'WLRegDisableCurrentKey';
procedure WLSplashHide; external WinlicenseDLL name 'WLSplashHide';
procedure WLBufferCrypt; external WinlicenseDLL name 'WLBufferCrypt';
procedure WLBufferDecrypt; external WinlicenseDLL name 'WLBufferDecrypt';
function WLTrialDateDaysLeft; external WinlicenseDLL name 'WLTrialDateDaysLeft';
function WLRegDateDaysLeft; external WinlicenseDLL name 'WLRegDateDaysLeft';
function WLGenLicenseFileKeyExW; external WinlicenseDLL name 'WLGenLicenseFileKeyExW';
function WLGenLicenseRegistryKeyExW; external WinlicenseDLL name 'WLGenLicenseRegistryKeyExW';
function WLGenLicenseTextKeyExW; external WinlicenseDLL name 'WLGenLicenseTextKeyExW';
function WLGenLicenseDynSmartKey; external WinlicenseDLL name 'WLGenLicenseDynSmartKey';
function WLGenLicenseDynSmartKeyW; external WinlicenseDLL name 'WLGenLicenseDynSmartKeyW';
function WLRegGetDynSmartKey; external WinlicenseDLL name 'WLRegGetDynSmartKey';
function WLRegDisableKeyCurrentInstance; external WinlicenseDLL name 'WLRegDisableKeyCurrentInstance';
function WLHardwareRuntimeCheckU3; external WinlicenseDLL name 'WLHardwareRuntimeCheckU3';
procedure WLGetVersion; external WinlicenseDLL name 'WLGetVersion';
function WLRegNetInstancesGet; external WinlicenseDLL name 'WLRegNetInstancesGet';
function WLRegNetInstancesMax; external WinlicenseDLL name 'WLRegNetInstancesMax';
procedure WLGetProtectionDate; external WinlicenseDLL name 'WLGetProtectionDate';



end.

