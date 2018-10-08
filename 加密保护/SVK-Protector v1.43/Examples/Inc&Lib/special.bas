'Attribute VB_Name = "IncludeModule"

Public Declare Function SVKP_GetRegistrationInformation Lib "SPECIAL.DLL" _
    Alias "SVKP_GetRegistrationInformation" _
	(ByVal reginfoptr As Long) As Long
   
Public Declare Function SVKP_LockKeyboard Lib "SPECIAL.DLL" _
    Alias "SVKP_LockKeyboard" _
	() As Long

Public Declare Function SVKP_UnLockKeyboard Lib "SPECIAL.DLL" _
    Alias "SVKP_UnLockKeyboard" _
	() As Long

Public Declare Function SVKP_KillDebugger Lib "SPECIAL.DLL" _
    Alias "SVKP_KillDebugger" _
	() As Long

Public Declare Function SVKP_RebootComputer Lib "SPECIAL.DLL" _
    Alias "SVKP_RebootComputer" _
	() As Long

Public Declare Function SVKP_GetHWInfo Lib "SPECIAL.DLL" _
    Alias "SVKP_GetHWInfo" _
	(ByVal HWInformation As Long) As Long
