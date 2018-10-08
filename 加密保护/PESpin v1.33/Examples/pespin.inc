;PESpin v1.1 - v1.3 encryption markers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Define this include file in your ASM project like:
;include pespin.inc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;CLEAR_markers
;this macro is for define start of block for encryption (it will decoded before use and removed after use)
;tip: This type of blocks is very good use in initialize part of program
;(load DLL(s), initialize data, fill some special variables and etc.)

	CLEAR_START	macro
	db	0EBh,24h
	db	20h dup (0FBh)
	dd	0000BD66h      
	endm

        CLEAR_END	macro
	db	0EBh,33h
	db	02Fh  dup (0FAh)
	dd	0000BD66h
        endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;CRYPT_markers
;this macro is for define start of block for encryption (it will decoded before use and encrypted again after use)

        CRYPT_START	macro
       	db	0EBh,08h
       	db	6 dup(0FCh)
       	db	27h,54h
        endm

        CRYPT_END macro
        db	0EBh,08h
        db	6 dup(0FDh)
        db	54h,37h
        endm
        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        