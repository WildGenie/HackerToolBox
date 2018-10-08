CODEC_0_SIGNATURE equ 'COD0'

CODEC_0_HEADER STRUCT
	dwSignature dd ?
	dwDecodedSize dd ?
CODEC_0_HEADER ENDS

PEC2_DECODE_EXTRA STRUCT
   pLoadLibraryA dd ?
   pGetProcAddress dd ?
PEC2_DECODE_EXTRA ENDS

;
; a handy macro to calculate delta offset via call/pop/sub compiled offset
;
GET_DELTA MACRO reg
        LOCAL   delta_call
        call    delta_call
 delta_call:
        pop     reg
        sub     reg,offset delta_call
ENDM
