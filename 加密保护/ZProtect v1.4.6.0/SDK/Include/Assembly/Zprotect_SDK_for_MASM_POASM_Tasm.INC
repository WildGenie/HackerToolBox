
; ZProtect SDK for MASM/POASM/Tasm
; by forgot 2k8


Code_Confusion_START              equ     <db      0EBh,008h,053h,054h,05Fh,053h,054h,041h,052h,054h>
Code_Confusion_END                equ     <db      0EBh,008h,053h,054h,05Fh,053h,054h,045h,04Eh,044h>

Code_Elimination_START              equ     <db      0EBh,008h,04Fh,043h,05Fh,053h,054h,041h,052h,054h>
Code_Elimination_END                equ     <db      0EBh,008h,04Fh,043h,05Fh,04Fh,043h,045h,04Eh,044h>

Decode_onExec_START              equ     <db      0EBh,008h,044h,059h,05Fh,053h,054h,041h,052h,054h>
Decode_onExec_END                equ     <db      0EBh,008h,044h,059h,05Fh,044h,059h,045h,04Eh,044h>

Decode_onReg_START              equ     <db      0EBh,008h,052h,044h,05Fh,053h,054h,041h,052h,054h>
Decode_onReg_END                equ     <db      0EBh,008h,052h,044h,05Fh,052h,044h,045h,04Eh,044h>

Decode_Section_A_START              equ     <db      0EBh,008h,052h,031h,05Fh,053h,054h,041h,052h,054h>
Decode_Section_A_END                equ     <db      0EBh,008h,052h,031h,05Fh,052h,044h,045h,04Eh,044h>

Decode_Section_B_START              equ     <db      0EBh,008h,052h,032h,05Fh,053h,054h,041h,052h,054h>
Decode_Section_B_END                equ     <db      0EBh,008h,052h,032h,05Fh,052h,044h,045h,04Eh,044h>

Decode_Section_C_START              equ     <db      0EBh,008h,052h,033h,05Fh,053h,054h,041h,052h,054h>
Decode_Section_C_END                equ     <db      0EBh,008h,052h,033h,05Fh,052h,044h,045h,04Eh,044h>

ZProtect_VM_START              equ     <db      0EBh,008h,056h,04Dh,05Fh,053h,054h,041h,052h,054h>
ZProtect_VM_END                equ     <db      0EBh,008h,056h,04Dh,05Fh,056h,04Dh,045h,04Eh,044h>
