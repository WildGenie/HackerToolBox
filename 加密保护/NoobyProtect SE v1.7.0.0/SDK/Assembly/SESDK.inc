; ****************************************************************************
; NoobyProtect SDK
; ****************************************************************************

UNPROTECT_START MACRO 

    jmp     @F

    db      'UPBEGN'

    @@:

ENDM

UNPROTECT_END MACRO 

    jmp     @F

    db      'UPENDP'

    @@:

ENDM

PROTECT_START MACRO 

    jmp     @F

    db      'NPBEGN'

    @@:

ENDM

PROTECT_END MACRO 

    jmp     @F

    db      'NPENDP'

    @@:

ENDM