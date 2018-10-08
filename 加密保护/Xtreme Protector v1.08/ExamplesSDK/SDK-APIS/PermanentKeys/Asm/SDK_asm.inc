;  
; Module: SDK_asm.inc
;
; Description: Macros definitions for Xprotector SDK (asm)
;
; Authors: Xprotector TEAM 
;
; (c) 2003 Xtreme-protector
;  


;  
;                              Functions Prototype
;  

IsRegistered                        PROTO
GetLicenseInfo                      PROTO :DWORD, :DWORD, :DWORD
DemoGetDaysToExpire                 PROTO
DemoGetExecutionsToExpire           PROTO
RegisteredGetDaysToExpire           PROTO
RegisteredGetExecutionsToExpire     PROTO
DemoTotalDays                       PROTO
DemoTotalExecutions                 PROTO
RegisteredTotalDays                 PROTO
RegisteredTotalExecutions           PROTO
GetHardwareID                       PROTO :DWORD
ValidateHardwareID                  PROTO :DWORD
DateKeyDaysLeft                     PROTO
DateKeyExpirationDate               PROTO :DWORD


;  
;                                General Consts
;  

ID_PATCH_START          EQU     0h
ID_PATCH_END            EQU     1h
ID_REGISTERED_START     EQU     2h
ID_REGISTERED_END       EQU     3h
ID_ENCODE_START         EQU     4h
ID_ENCODE_END           EQU     5h
ID_CLEAR_START          EQU     6h
ID_CLEAR_END            EQU     7h


;  
;                                Macros definitions
;  

PATCH_START MACRO 

    jmp     @F

    db      'xpro'
    dd      ID_PATCH_START
    dd      0
    db      'xpro'

    @@:

ENDM    

PATCH_END MACRO 

    jmp     @F

    db      'xpro'
    dd      ID_PATCH_END
    dd      0
    db      'xpro'

    @@:

ENDM    

REGISTERED_START MACRO 

    jmp     @F

    db      'xpro'
    dd      ID_REGISTERED_START
    dd      0
    db      'xpro'

    @@:

ENDM    

REGISTERED_END MACRO 

    jmp     @F

    db      'xpro'
    dd      ID_REGISTERED_END
    dd      0
    db      'xpro'

    @@:

ENDM    

ENCODE_START MACRO 

    jmp     @F

    db      'xpro'
    dd      ID_ENCODE_START
    dd      0
    db      'xpro'

    @@:

ENDM    

ENCODE_END MACRO 

    jmp     @F

    db      'xpro'
    dd      ID_ENCODE_END
    dd      0
    db      'xpro'

    @@:

ENDM    

CLEAR_START MACRO 

    jmp     @F

    db      'xpro'
    dd      ID_CLEAR_START
    dd      0
    db      'xpro'

    @@:

ENDM    

CLEAR_END MACRO 

    jmp     @F

    db      'xpro'
    dd      ID_CLEAR_END
    dd      0
    db      'xpro'
    dd      0
    db      0
    @@:

ENDM    



