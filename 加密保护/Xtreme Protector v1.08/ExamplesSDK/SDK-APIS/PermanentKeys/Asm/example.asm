;  
; Module: Example
; Description: Shows how to call the Xprotector APIs in assembly language
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
includelib XprotSDK.lib

DemoGetDaysToExpire                 PROTO
DemoGetExecutionsToExpire           PROTO
IsRegistered		                PROTO
GetLicenseInfo                      PROTO RegName:DWORD, Organization:DWORD, Custom:DWORD
StrCat                              PROTO str1:DWORD, str2:DWORD
DemoTotalDays                       PROTO
DemoTotalExecutions                 PROTO

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
CustomData      db      1024 dup(0)

;  
;                                Code section
;  

.code

StartExample:

    invoke  MessageBox, NULL, SADD("This example shows the use of Xprotector SDK-APIS in asm language"), SADD("Xtreme-Protector"), MB_OK

    invoke  IsRegistered

    .if eax

        invoke  GetLicenseInfo, ADDR RegName, ADDR RegOrg, ADDR CustomData
        invoke  wsprintf, ADDR TempBuffer, SADD("Application Registered to: %s - %s - %s"), ADDR RegName, ADDR RegOrg, ADDR CustomData
        invoke  MessageBox, NULL, ADDR TempBuffer, SADD("REGISTERED version"), MB_OK

    .else
        
        invoke  DemoGetDaysToExpire
        mov     ebx, eax

        invoke  DemoGetExecutionsToExpire
        mov     ecx, eax

        invoke  DemoTotalDays
        mov     edx, eax

        invoke  DemoTotalExecutions

        invoke  wsprintf, ADDR TempBuffer, SADD("Days left = %i, Executions left = %i", 10, 13, "Total Days %i, Total Executions %i"), ebx, ecx, edx, eax
        invoke  MessageBox, NULL, ADDR TempBuffer, SADD("DEMO version"), MB_OK

    .endif

    invoke  ExitProcess, NULL

end StartExample


