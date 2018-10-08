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
includelib PasswordGenDll.lib


GeneratePassword PROTO UserName:DWORD, BufferOut:DWORD


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

BufferPass  db  50 dup(0)
BuffAux     db  256 dup(0)

;  
;                                Code section
;  

.code

StartExample:

    invoke  GeneratePassword, SADD("Arnold"), ADDR BufferPass 
    invoke  wsprintf, ADDR BuffAux, SADD("Password for Arnold is %s"), ADDR BufferPass
    invoke  MessageBox, NULL, ADDR BuffAux, SADD("Xtreme-Protector"), MB_OK    

    invoke  ExitProcess, NULL


    
end StartExample


