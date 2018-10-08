;  
; Module: Example
; Description: Shows how to generate license keys in asm language
;
; Authors: Xprotector TEAM  
; (c) 2003 Xtreme-protector
;  

.586
.model flat,stdcall
option casemap:none


;  
;                   Libraries used by this module
;  

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib LicenseGenDll.lib

CreateLicenseKey  PROTO lpUserName:DWORD, lpOrganization:DWORD, lpMemo:DWORD, lpHwId:DWORD, \
                        iNumDays:DWORD, iNumExec:DWORD, SysTime:DWORD, lpMessageCaption:DWORD, \
                        lpDaysMessageBody:DWORD, lpExecMessageBody:DWORD, BuffOut:DWORD

CreateLicenseFile PROTO NameDir:DWORD


;  
;                            Exported functions
;  


;  
;                            Constants and macros 
;  

.const

literal MACRO quoted_text:VARARG
  LOCAL local_text
  .data
   local_text db quoted_text,0
  .code
   EXITM <local_text>
ENDM

SADD MACRO quoted_text:VARARG
  EXITM <ADDR literal(quoted_text)>
ENDM    

SIZE_XPROT_KEY      EQU     4096

;  
;                                Global data
;  
  
.data

KeyAux              db      SIZE_XPROT_KEY dup (0)        
CurrentUser         dd      0
CurrentDir          db      1024 dup (0)
NewDir              db      1024 dup (0)
NameKey             db      1024 dup (0)

;  
;                                Code section
;  

.code

StartExample:

    ; create a permanent key. Permanent keys doesn't have Expiration days or executions.
    ; All the messages are related to temporal keys, so they should be NULL too

    invoke  CreateLicenseKey, SADD("Arnold Lee"), SADD("Arnold Corp"), NULL, NULL, NULL, NULL, NULL, \
                              NULL, NULL, NULL, ADDR KeyAux

    invoke  CreateLicenseFile, SADD("Arnold Lee (Permanent Key)")

    ; create a temporal key. With 1 day and 5 executions

    invoke  CreateLicenseKey, SADD("Bruce Biss"), SADD("ATOP corp"), NULL, NULL, 1, 5, NULL\
                              SADD("Expired Key"), SADD("No more days left!"), SADD("No more executions left"), ADDR KeyAux

    invoke  CreateLicenseFile, SADD("Bruce Biss (Temporal Key)")

    

    invoke  ExitProcess, NULL


; *****************************************************************************
; * CreateLicenseFile
; *
; *  Create a license key file for a particular user
; *
; * Inputs
; *  NameDir: Directory where to store the generated key
; * 
; * Outputs
; *  None
; *
; * Returns
; *  None
; ******************************************************************************

CreateLicenseFile proc NameDir:DWORD

    LOCAL   hFileKey:DWORD, NumBytesWritten:DWORD
    
    pushad

    ; create directory where to store the key
    
    invoke  GetCurrentDirectory, 1024, ADDR CurrentDir
    invoke  wsprintf, ADDR NewDir, SADD("%s\%s"), ADDR CurrentDir, NameDir
    invoke  CreateDirectory, ADDR NewDir, NULL

    ; get full path + name of key to generate

    invoke  wsprintf, ADDR NameKey, SADD("%s\%s"), ADDR NewDir, SADD("LicenseKey.key")

    ; create specific key
    
    invoke  CreateFile, ADDR NameKey, GENERIC_READ or GENERIC_WRITE,NULL, \
                        NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_ARCHIVE, NULL

    mov     hFileKey, eax
    
    invoke  WriteFile, hFileKey, ADDR KeyAux, SIZE_XPROT_KEY, ADDR NumBytesWritten, NULL
    invoke  CloseHandle, hFileKey

    popad
    ret

CreateLicenseFile endp
    
end StartExample


