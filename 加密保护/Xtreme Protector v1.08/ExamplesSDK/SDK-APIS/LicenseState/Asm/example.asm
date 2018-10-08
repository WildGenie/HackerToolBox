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


;  
;                                Code section
;  

.code

StartExample:

    invoke  MessageBox, NULL, SADD("This example shows the use of Xprotector SDK-APIS in asm language"), SADD("Xtreme-Protector"), MB_OK

    invoke  CheckLicenseValidation

    .if eax == LICENSE_VALID

        invoke  MessageBox, NULL, SADD("Valid license file. Application REGISTERED"), SADD("XProtector"), MB_OK

    .elseif eax == LICENSE_NOPRESENT

        invoke  MessageBox, NULL, SADD("License File not present. Application NOT registered"), SADD("XProtector"), MB_OK

    .elseif eax == LICENSE_INVALID

        invoke  MessageBox, NULL, SADD("Invalid License File. Application NOT registered", 10, 13, "Please, get a valid license file from www.mywebsite.com"), SADD("XProtector"), MB_OK

    .elseif eax == LICENSE_BAD_HWID

        invoke  MessageBox, NULL, SADD("This license key is not valid for the current machine.",10, 13, "Please, get a valid license for your machine"), SADD("XProtector"), MB_OK

    .elseif eax == LICENSE_MANIPULATED

        invoke  MessageBox, NULL, SADD("Trial period MANIPULATED turning the clock back or attack detected",10, 13, "You need to register this program to run it again"), SADD("XProtector"), MB_OK

    .endif
        
    invoke  ExitProcess, NULL

end StartExample


