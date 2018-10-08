;  
; Module: Example
; Description: Shows how to call the Xprotector APIs in assembly language
;
; Authors: Xprotector TEAM  
; (c) 2002 Xtreme-protector
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
includelib XprotSDK.lib

RegisteredGetDaysToExpire           PROTO
RegisteredGetExecutionsToExpire     PROTO
IsRegistered		                PROTO
GetLicenseInfo                      PROTO RegName:DWORD, Organization:DWORD, Memo:DWORD
StrCat                              PROTO str1:DWORD, str2:DWORD


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


;  
;                                Global data
;  
  
.data

TempBuffer      db      256 dup (0)
RegName         db      100 dup (0)
RegOrg          db      100 dup (0)
Memo		db	1000 dup (0)


;  
;                                Code section
;  

.code

StartExample:

    invoke  MessageBox, NULL, SADD("This example shows the use of Xprotector SDK-APIS in asm language"), SADD("Xtreme-Protector"), MB_OK

    invoke  IsRegistered

    .if eax

        invoke  GetLicenseInfo, ADDR RegName, ADDR RegOrg, ADDR Memo

        invoke  RegisteredGetDaysToExpire
        mov     ebx, eax

        invoke  RegisteredGetExecutionsToExpire

        invoke  wsprintf, ADDR TempBuffer, SADD("Application Registered to: %s - %s (Days left = %i, Executions left = %i)"), ADDR RegName, ADDR RegOrg, ebx, eax
        invoke  MessageBox, NULL, ADDR TempBuffer, SADD("Xtreme-Protector"), MB_OK

    .else
        
        invoke  MessageBox, NULL, SADD("This application needs a key to be executed"), SADD("Xtreme-Protector"), MB_OK

    .endif

    invoke  ExitProcess, NULL

end StartExample


