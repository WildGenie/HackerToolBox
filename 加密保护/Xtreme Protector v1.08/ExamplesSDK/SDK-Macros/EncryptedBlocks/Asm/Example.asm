;  
; Module: Example.asm
;
; Description: Example to test the ENCODE_START - ENCODE_END macro
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

    ENCODE_START 

    invoke  MessageBox, NULL, SADD("Example of ENCODE_START - ENCODE_END macros"), SADD("Xprotector"), MB_OK

    mov     eax, 12345678h
    mov     ebx, 1234h
    add     eax, ebx
    mov     ecx, eax

    ENCODE_END    

    invoke  MessageBox, NULL, SADD("All the executed code has been decrypted and encrypted again"), SADD("Xprotector"), MB_OK

    invoke  ExitProcess, NULL

end start

