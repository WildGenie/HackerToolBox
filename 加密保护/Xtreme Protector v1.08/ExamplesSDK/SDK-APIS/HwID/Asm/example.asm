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

GetHardwareID       PROTO :DWORD
ValidateHardwareID  PROTO :DWORD

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

TempBuffer      db      256 dup(0)
HwIDbuff        db      40 dup (0)

;  
;                                Code section
;  

.code

StartExample:
   
    invoke  MessageBox, NULL, SADD("This example shows the use of Xprotector SDK-APIS in asm language"), SADD("Xtreme-Protector"), MB_OK

    invoke  GetHardwareID, ADDR HwIDbuff

    invoke  wsprintf, ADDR TempBuffer, SADD("Hardware ID = %s"), ADDR HwIDbuff
    invoke  MessageBox, NULL, ADDR TempBuffer, SADD("Xtreme-Protector"), MB_OK

    invoke  ValidateHardwareID, ADDR HwIDbuff

    .if eax

        invoke  MessageBox, NULL, SADD("Generated HW ID is valid"), SADD("Xtreme-Protector"), MB_OK

    .else

        invoke  MessageBox, NULL, SADD("Generated HW ID is INVALID"), SADD("Xtreme-Protector"), MB_OK

    .endif

    invoke  ExitProcess, NULL

end StartExample


