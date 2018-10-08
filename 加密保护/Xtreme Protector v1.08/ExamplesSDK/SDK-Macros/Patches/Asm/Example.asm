;  
; Module: Example.asm
;
; Description: Example to test the PATCH_START - PATCH_END macro
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

    invoke  MessageBox, NULL, SADD("The next patch will be executed 10 times inside a loop"), SADD("Xprotector"), MB_OK


    mov     ecx, 10

    PATCH_START 

NextLoop: 
    mov     eax, 12345678h
    mov     ebx, 1234h
    add     eax, ebx

    PATCH_END

    loop    NextLoop
    
    invoke  MessageBox, NULL, SADD("The next loop will be executed in a Patch"), SADD("Xprotector"), MB_OK

    PATCH_START 

    mov     ecx, 40

NextLoop2: 
    mov     eax, 12345678h
    mov     ebx, 1234h
    add     eax, ebx
    loop    NextLoop2

    PATCH_END

    invoke  ExitProcess, NULL

end start

