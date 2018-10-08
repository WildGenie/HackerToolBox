library plugin;

{$mode objfpc}{$H+}

uses
  Classes
  { you can add units after this };

{$R *.res}

const
  // Constants for AMessageID for Enigma_Plugin_OnShowMessage
  MESSAGEID_REGISTRATION_VALIDKEY = 1;
  MESSAGEID_REGISTRATION_INVALIDKEY = 2;
  MESSAGEID_REGISTRATION_KEYEXPIRATION = 3;
  MESSAGEID_CHECK_ANTIDEBUGGER = 4;
  MESSAGEID_CHECK_CONTROLSUM = 5;
  MESSAGEID_CHECK_STARTUPPASSWORD = 6;
  MESSAGEID_CHECK_FILENAME = 7;
  MESSAGEID_CHECK_DISKDRIVE = 8;
  MESSAGEID_CHECK_EXECUTEDCOPIES = 9;
  MESSAGEID_CHECK_USERLANGUAGE = 10;
  MESSAGEID_CHECK_EXTERNALFILES = 11;
  MESSAGEID_CHECK_EXECUTEDPROCESSES = 12;
  MESSAGEID_CHECK_LOADEDDRIVERS = 13;
  MESSAGEID_CHECK_INSTALLEDSERVICES = 14;
  MESSAGEID_CHECK_WINDOWSVERSION = 15;
  MESSAGEID_CHECK_VIRTUALIZATIONTOOLS = 16;
  MESSAGEID_CHECK_ADMINPRIVILEGES = 17;
  MESSAGEID_TRIAL_EXECUTIONS = 18;
  MESSAGEID_TRIAL_DAYS = 19;
  MESSAGEID_TRIAL_DATE = 20;
  MESSAGEID_TRIAL_DATETILLDATE = 21;
  MESSAGEID_TRIAL_EXECUTIONTIME = 22;
  MESSAGEID_TRIAL_REMINDER = 23;
  MESSAGEID_TRIAL_TIMECONTROL = 24;

function Enigma_Plugin_About : PWideChar;
begin
  // Function returns a wide string that will be shown in about column in Enigma Miscellaneous - Plugins
  Enigma_Plugin_About := 'Plugin short description';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  // Function returns a wide string that will be shown after user clicks on the plugin in Enigma Miscellaneous - Plugins
  // It may contain, for example, usage instructions
  Enigma_Plugin_Description := 'Plugin wide description';
end;

procedure Enigma_Plugin_OnInit;
begin
  // This function is calling when the protected file is being initialized
  // when main program is not initialized yet
end;

procedure Enigma_Plugin_OnFinal;
begin
  // This function is calling when the protected file is initilized,
  // main program encrypted and ready for execution
end;

function Enigma_Plugin_OnSaveKey(ARegName : pointer; ARegNameLen : integer; ARegKey : pointer; ARegKeyLen : integer) : boolean; stdcall;
begin
  // This function is calling when protected file is trying to save registration information.
  // Here you may save registration name and key to own place that is not supported
  // by main feature of Enigma Protector.

  // Note, ARegNameLen and ARegKeyLen contains amount of byte of Name and Key buffer. For handling of WideString
  // and UNICODE registrtation scheme you should divide this value on 2 to get actual length of the string.


  // This function should return FALSE if it is not saved registration information (or it is not
  // needed to save it) and TRUE if function succeeded. Note, standard saving routine will not be called if
  // this function returned TRUE.
  Result := false;
end;

function Enigma_Plugin_OnLoadKey(var ARegName : pointer; var ARegNameLen : integer; var ARegKey : pointer; var ARegKeyLen : integer) : boolean; stdcall;
begin
  // This function is calling when protected file is trying to load registration information.
  // Here you may load registration name and key from own place that is not supported
  // by main feature of Enigma Protector.

  // Note, you have to allocate buffer for ARegName and ARegKey manually (somewhere in global space),
  // and return the pointers to these buffers.
  // ARegNameLen and ARegKeyLen should contain amount of byte of Name and Key strings. For handling of WideString
  // and UNICODE registrtation scheme you should multiply length of the string on 2.


  // This function should return FALSE if it is not loaded registration information (or it is not
  // needed to load it) and TRUE if function succeeded. Note, standard loading routine will not be called if
  // this function returned TRUE.
  Result := false;
end;

// !!! Enigma Protector - Online Solutions ONLY !!!
function Enigma_Plugin_OnShowActivationDialog : boolean;
begin
  // This plugin function is being called all times when Enigma Protector
  // needs to show standard Activation Dialog designed in ONLINE SOLUTIONS -
  // Activation Dialog panel

  // If this function returns FALSE, the standard Activation Dialog will be shown.
  // If function returns TRUE, this means the plugin succeeded, custom activation dialog
  // had been shown and standard Activation Dialog will now be shown.
  Result := false;
end;

function Enigma_Plugin_OnShowRegistrationDialog : boolean;
begin
  // This plugin function is being called all times when Enigma Protector
  // needs to show standard Registration Dialog designed in REGISTRATION FEATURES -
  // Registration Dialog panel

  // If this function returns FALSE, the standard Registration Dialog will be shown.
  // If function returns TRUE, this means the plugin succeeded, custom registration dialog
  // had been shown and standard Registration Dialog will now be shown.
  Result := false;
end;

function Enigma_Plugin_OnShowMessage(AMessageID : integer) : boolean; stdcall;
begin
  // This plugin function is being called all times when Enigma Protector
  // needs to show any information message. See manual for detailed information

  // If this function returns FALSE, the message which is set in Enigma Protector
  // will be shown, otherwise it will be supressed.
  Result := false;
end;

exports
  Enigma_Plugin_About,
  Enigma_Plugin_Description,
  Enigma_Plugin_OnInit,
  Enigma_Plugin_OnFinal,
  Enigma_Plugin_OnSaveKey,
  Enigma_Plugin_OnLoadKey,
  Enigma_Plugin_OnShowActivationDialog,
  Enigma_Plugin_OnShowRegistrationDialog,
  Enigma_Plugin_OnShowMessage;

begin
end.

