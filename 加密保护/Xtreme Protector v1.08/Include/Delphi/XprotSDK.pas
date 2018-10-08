unit XprotSDK;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

function IsRegistered () : Word; stdcall;
function GetLicenseInfo(lpName: PChar; lpOrganization: PChar; lpCustom: PChar):Boolean; stdcall;
function DemoGetDaysToExpire:DWORD;stdcall;
function DemoGetExecutionsToExpire :DWORD; stdcall;
function RegisteredGetDaysToExpire :DWORD; stdcall;
function RegisteredGetExecutionsToExpire :DWORD; stdcall;
function DemoTotalDays :DWORD; stdcall;
function DemoTotalExecutions :DWORD; stdcall;
function RegisteredTotalDays :DWORD; stdcall;
function RegisteredTotalExecutions :DWORD; stdcall;
function GetHardwareID(lpBuffer: PChar):Boolean; stdcall;
function ValidateHardwareID(lpBuffer: PChar):Boolean; stdcall;
function DateKeyDaysLeft :DWORD; stdcall
function DateKeyExpirationDate(SisTime: SYSTEMTIME):Boolean;
function CheckLicenseValidation() :Word; stdcall
function DemoExpirationDate(SisTime: SYSTEMTIME):Boolean;
function IsDemoDateExpired () : Word; stdcall;


implementation

const
  XprotDLL = 'XprotSDK.DLL';

function IsRegistered; external XprotDLL name 'IsRegistered';
function GetLicenseInfo; external XprotDLL name 'GetLicenseInfo';
function DemoGetDaysToExpire; external XprotDLL name 'DemoGetDaysToExpire';
function DemoGetExecutionsToExpire ; external XprotDLL name 'DemoGetExecutionsToExpire';
function RegisteredGetDaysToExpire; external XprotDLL name 'RegisteredGetDaysToExpire';
function RegisteredGetExecutionsToExpire; external XprotDLL name 'RegisteredGetExecutionsToExpire';
function DemoTotalDays; external XprotDLL name 'DemoTotalDays';
function DemoTotalExecutions; external XprotDLL name 'DemoTotalExecutions';
function RegisteredTotalDays; external XprotDLL name 'RegisteredTotalDays';
function RegisteredTotalExecutions; external XprotDLL name 'RegisteredTotalExecutions';
function GetHardwareID; external XprotDLL name 'GetHardwareID';
function ValidateHardwareID; external XprotDLL name 'ValidateHardwareID';
function DateKeyDaysLeft; external XprotDLL name 'DateKeyDaysLeft';
function DateKeyExpirationDate; external XprotDLL name 'DateKeyExpirationDate';
function CheckLicenseValidation; external XprotDLL name 'CheckLicenseValidation';
function DemoExpirationDate; external XprotDLL name 'DemoExpirationDate';
function IsDemoDateExpired; external XprotDLL name 'IsDemoDateExpired';


end.
