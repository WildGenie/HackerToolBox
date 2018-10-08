;Define this include file in your ASM project like:
;include special.inc

;this macro is for define start of block for RSA encryption
        SVKP_ENCRYPTED_BLOCK_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  99h, 0aah
        db  7fh-4 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for RSA encryption
        SVKP_ENCRYPTED_BLOCK_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  0bbh, 0cch
        db  7fh-4 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for encryption (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_BLOCK_TYPE1_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  11h, 22h
        db  7fh-4 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for encryption (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_BLOCK_TYPE1_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  33h, 44h
        db  7fh-4 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for encryption (it will decoded before use and removed after use)
        SVKP_ENCRYPTED_BLOCK_TYPE2_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  55h, 66h
        db  7fh-4 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for encryption (it will decoded before use and removed after use)
        SVKP_ENCRYPTED_BLOCK_TYPE2_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  77h, 88h
        db  7fh-4 dup (90h)
        db  0ebh, 7fh
        db  7fh dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE1_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  01                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE1_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  01                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE2_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  02                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE2_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  02                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE3_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  03                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE3_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  03                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE4_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  04                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE4_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  04                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE5_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  05                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE5_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  05                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE6_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  06                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE6_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  06                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE7_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  07                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE7_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  07                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE8_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  08                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE8_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  08                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE9_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  09                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE9_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  09                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE10_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  10                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE10_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  10                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE11_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  11                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE11_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  11                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE12_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  12                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE12_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  12                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE13_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  13                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE13_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  13                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE14_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  14                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE14_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  14                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE15_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  15                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE15_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  15                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE16_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  16                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE16_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  16                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE17_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  17                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE17_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  17                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE18_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  18                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE18_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  18                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE19_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  19                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE19_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  19                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE20_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  20                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE20_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  20                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE21_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  21                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE21_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  21                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE22_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  22                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE22_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  22                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE23_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  23                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE23_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  23                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE24_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  24                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE24_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  24                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE25_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  25                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE25_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  25                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE26_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  26                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE26_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  26                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE27_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  27                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE27_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  27                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE28_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  28                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE28_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  28                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE29_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  29                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE29_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  29                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE30_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  30                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE30_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  30                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE31_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  31                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE31_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  31                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define start of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE32_START macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FEh
        db  32                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define end of block for feature (it will decoded before use and encrypted again after use)
        SVKP_ENCRYPTED_FEATURE32_END macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  01h, 0FFh
        db  32                  ;number of feature
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define CHECK1 block
        SVKP_ALIVE_CHECK_1 macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  03h, 03h
        db  01                  ;number of check
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm

;this macro is for define CHECK2 block
        SVKP_ALIVE_CHECK_2 macro abc
        db  0ebh, 7fh
        db  0ebh, 00
        db  03h, 03h
        db  02                  ;number of check
        db  7fh-5 dup (90h)
        db  0ebh, 7fh
        db  7fh   dup (90h)
        endm
