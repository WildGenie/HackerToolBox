
.const
IDC_RBN_VA      equ 1004
IDC_RBN_RVA     equ 1005
IDC_RBN_Offset  equ 1006
IDC_EDT_Address equ 1013
IDC_EDT_Size    equ 1014

.data
    szEditNUll  db '开始地址和大小不为空!',0
    
    
;花指令
;--------------------------------------------------------
szJC1 db 0F9H,72H,01H,0,0
szJC2 db 0F8H,73H,01H,0,0
szJC3 db 0E8H,00H,00H,00H,00H,83H,04H,24H,06H,0C3H,0,0
szJC4 db 0EBH,01H,0,0
szRp  db 90H,90H,90H,90H,90H,90H,90H,90H,90H,90H,90H,90H,90H,90H,0
;--------------------------------------------------------




.data?
   hEjEditAddress dd ?
   hEjEditSize    dd ?
   hMain          dd ?
   lpEjAddress    db 10 dup(?)
   lpEjSize       db 10 dup(?)
   lpEjBuffer     db 256 dup(?)
   lpEjAddrorSize db 256 dup(?)