VMProtectBegin MACRO
    jmp     @F
    db      'VMProtect begin',0
    @@:
ENDM

VMProtectEnd MACRO
    jmp     @F
    db      'VMProtect end',0
    @@:
ENDM

VMProtectMutationBegin MACRO
    VMProtectBegin
    lea     eax,[eax]
ENDM


VMProtectUltraBegin MACRO
    VMProtectBegin
    lea     ebx,[ebx]
ENDM
