
.const
IDC_EDT_Exception  equ  1001
IDC_BTN_Application equ 1002
IDC_BTN_Cancel       equ 1003

.data



.data?
dwInitParam               dd ?
hExwnd                    dd ?
msg                       MSG<?>
lpException               db 6000 dup(?)
lpCompart                 dd  ?
lpConfigName              db 256 dup(?)
lphAddr                   db 50  dup(?)
lpExceptionAddress        db 6000 dup(?)