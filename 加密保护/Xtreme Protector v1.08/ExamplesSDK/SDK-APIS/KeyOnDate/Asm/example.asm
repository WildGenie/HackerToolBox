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
include SDK_asm.inc

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib XprotSDK.lib


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
DaysLeft        dd      0
InfoKeyDate     SYSTEMTIME <>

;  
;                                Code section
;  

.code

StartExample:

    invoke  IsRegistered

    .if eax
        
        invoke  DateKeyDaysLeft
        mov     DaysLeft, eax 

        invoke  DateKeyExpirationDate, ADDR InfoKeyDate
        movzx   eax, InfoKeyDate.wDay
        movzx   ebx, InfoKeyDate.wMonth
        movzx   ecx, InfoKeyDate.wYear
        invoke  wsprintf, ADDR TempBuffer, SADD("This application Expires on: %i/%i/%i", 10, 13,"Number of Days Left = %i"), eax, ebx, ecx, DaysLeft
        invoke  MessageBox, NULL, ADDR TempBuffer, SADD("XProtector"), MB_OK

    .else
        
         invoke  MessageBox, NULL, SADD("Application not registered"), SADD("XProtector"), MB_OK
       
    .endif

    invoke  ExitProcess, NULL

end StartExample


