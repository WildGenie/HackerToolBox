;  
; Module: Example.asm
;
; Description: Example to test the REGISTERED_START - REGISTERED_END macro
;
; Authors: Xprotector TEAM  
; (c) 2003 Xtreme-protector
;  

.386
.model flat,stdcall
option casemap:none


;  
;                   Libraries used by this module
;  

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
include SDK_asm.inc


;  
;                            Exported functions
;  


;  
;                       Constants used in this module
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

start:

    xor     eax, eax
    
    REGISTERED_START 

    invoke  MessageBox, NULL, SADD("Application Registered!"), SADD("Xprotector"), MB_OK
    inc     eax

    REGISTERED_END    

    .if !eax
    
        invoke  MessageBox, NULL, SADD("Aplication NOT registered"), SADD("Xprotector"), MB_OK

    .endif
    
    invoke  ExitProcess, NULL

end start

