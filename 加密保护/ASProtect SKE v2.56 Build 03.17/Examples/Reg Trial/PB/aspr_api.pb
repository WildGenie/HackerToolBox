TYPE TModeStatus
    ModeID               AS BYTE
    IsRegistered         AS BYTE
    IsKeyPresent         AS BYTE
    IsWrongHardwareID    AS BYTE
    IsKeyExpired         AS BYTE
    IsModeExpired        AS BYTE
    IsBlackListedKey     AS BYTE
END TYPE

DECLARE FUNCTION apiGetRegistrationKeys LIB "aspr_ide.dll" ALIAS "GetRegistrationKeys" () AS STRING
DECLARE FUNCTION apiGetRegistrationInformation LIB "aspr_ide.dll" ALIAS "GetRegistrationInformation" (BYVAL ModeID AS BYTE, BYREF Key AS STRING, BYREF Name_ AS STRING) AS BYTE
DECLARE FUNCTION apiRemoveKey LIB "aspr_ide.dll" ALIAS "RemoveKey" (BYVAL ModeID AS BYTE) AS BYTE
DECLARE FUNCTION apiCheckKey LIB "aspr_ide.dll" ALIAS "CheckKey" (BYVAL Key AS STRING, BYVAL Name_ AS STRING, BYREF ModeStatus AS TModeStatus) AS BYTE
DECLARE FUNCTION apiCheckKeyAndDecrypt LIB "aspr_ide.dll" ALIAS "CheckKeyAndDecrypt" (BYVAL Key AS STRING, BYVAL Name_ AS STRING, BYVAL SaveKey AS BYTE) AS BYTE
DECLARE FUNCTION apiGetKeyDate LIB "aspr_ide.dll" ALIAS "GetKeyDate" (BYVAL ModeID AS BYTE, BYREF Day AS INTEGER, BYREF Month AS INTEGER, BYREF Year AS INTEGER) AS BYTE
DECLARE FUNCTION apiGetKeyExpirationDate LIB "aspr_ide.dll" ALIAS "GetKeyExpirationDate" (BYVAL ModeID AS BYTE, BYREF Day AS INTEGER, BYREF Month AS INTEGER, BYREF Year AS INTEGER) AS BYTE
DECLARE FUNCTION apiGetTrialDays LIB "aspr_ide.dll" ALIAS "GetTrialDays" (BYVAL ModeID AS BYTE, BYREF Total AS LONG, BYREF Left_ AS LONG) AS BYTE
DECLARE FUNCTION apiGetTrialExecs LIB "aspr_ide.dll" ALIAS "GetTrialExecs" (BYVAL ModeID AS BYTE, BYREF Total AS LONG, BYREF Left_ AS LONG) AS BYTE
DECLARE FUNCTION apiGetExpirationDate LIB "aspr_ide.dll" ALIAS "GetExpirationDate" (BYVAL ModeID AS BYTE, BYREF Day AS INTEGER, BYREF Month AS INTEGER, BYREF Year AS INTEGER) AS BYTE
DECLARE FUNCTION apiGetModeInformation LIB "aspr_ide.dll" ALIAS "GetModeInformation" (BYVAL ModeID AS BYTE, BYREF ModeName AS STRING, BYREF ModeStatus AS TModeStatus) AS BYTE
DECLARE FUNCTION apiGetHardwareID LIB "aspr_ide.dll" ALIAS "GetHardwareID" () AS STRING
DECLARE FUNCTION apiGetHardwareIDEx LIB "aspr_ide.dll" ALIAS "GetHardwareIDEx" (BYVAL ModeID AS BYTE) AS STRING
DECLARE FUNCTION apiSetUserKey LIB "aspr_ide.dll" ALIAS "SetUserKey" (BYVAL Key AS STRING, BYVAL KeySize AS LONG) AS BYTE
