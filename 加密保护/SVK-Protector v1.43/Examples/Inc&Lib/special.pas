unit special;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

type
  LPDWORD = ^LongWord;

function SVKP_GetRegistrationInformation (reginfoptr : STRING) : LongWord; stdcall;
function SVKP_LockKeyboard 		 ()			: LongWord; stdcall;
function SVKP_UnLockKeyboard		 ()			: LongWord; stdcall;
function SVKP_KillDebugger		 ()			: LongWord; stdcall;
function SVKP_RebootComputer		 ()			: LongWord; stdcall;
function SVKP_GetHWInfo                  (HWInformation : STRING) : LongWord; stdcall;

implementation

const
  specialDLL = 'SPECIAL.DLL';

function SVKP_GetRegistrationInformation; external specialDLL name 'SVKP_GetRegistrationInformation';
function SVKP_LockKeyboard;		  external specialDLL name 'SVKP_LockKeyboard';	
function SVKP_UnLockKeyboard;		  external specialDLL name 'SVKP_UnLockKeyboard';	
function SVKP_KillDebugger;		  external specialDLL name 'SVKP_KillDebugger';	
function SVKP_RebootComputer;		  external specialDLL name 'SVKP_RebootComputer';
function SVKP_GetHWInfo;                  external specialDLL name 'SVKP_GetHWInfo';

end.