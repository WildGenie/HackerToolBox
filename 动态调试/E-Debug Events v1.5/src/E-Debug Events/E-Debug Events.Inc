
include windows.inc
include kernel32.inc
include user32.inc
include Comctl32.inc
include shell32.inc

includelib kernel32.lib
includelib user32.lib
includelib Comctl32.lib
includelib shell32.lib

DlgProc			PROTO	:HWND,:UINT,:WPARAM,:LPARAM
SelectFile              PROTO
AppText                 PROTO   :DWORD
Interruptaddress        PROTO   :DWORD
DebugEvent              PROTO
AddressOperations       PROTO   :DWORD
GetLibAddr              PROTO
GetVersionAddr          PROTO
ExceptionFilter         PROTO
.const
;---------------字符串
ErrorFile                       equ 0
VPE                             equ 1
UMemory                          equ 2
ExitP                           equ 3
CP                              equ 4
EEnd                            equ 5
Interrupt                       equ 6
szDll                           equ 7
LibA                            equ 8
libVersion                      equ 9
;---------------
IDD_DIALOG1			equ 101
IDC_EDT_LOG                     equ 1001
IDC_BTN_OPEN                    equ 1002
IDC_RBN_Static                  equ 1004
IDC_RBN_Independent             equ 1005
IDC_RBN_Compile                 equ 1006
IDC_BTN_ClearLog                equ 1007
IDC_BTN_Start                   equ 1008
IDC_BTN_Terminate               equ 1009
IDC_CHK_TopMostWindow           equ 1011
IDC_CHK_InterruptAddress        equ 1012
IDC_EDT_InterruptAddress        equ 1013
;------------------
IDR_MENU   equ 10000
IDM_Exception equ 10002
IDM_JunkCode equ 10003
;-------------------
IDD_JunkCode  equ 102
IDD_Exception equ 103
;#########################################################################
.data
szBinSignature db 0FFH,55H,0FCH,5FH,5EH,89H,5DH,0F4H,89H,45H,0F8H,8BH,55H,0E8H,0
szInterruptaddress db '中断地址: %08X',0
szEventAddress     db '事件发生: %08X',0
szStartAddress     db 'StartAddress: %08X',0
szReadPWholeMemory db '是否采用ReadPWholeMemory方式?',0
szint3      db 0CCH,0
szFF        db 0FFH,0
.data?

hInstance			dd ?
hMainhWin                       dd ?
hEdit                           dd ?
hEditInterrup                   dd ?
hSelectFile                     dd ?
hAddress                        dd ?
hEventAddress                   dd ?
hBreakEventAddress              dd ?
hStartAddress                   dd ?
hParameter                      dd ?
hLib                            dd ?
lpLibEsp                        dd ?
lpStartAddress                  dd ?
lpLib                           dd ?
lplibVersion                    dd ?
hLibEsp                         dd ?
hLibEspDec4                     dd ?
hlibVersion                     dd ?
hContinue                       dd ?
DBEvent DEBUG_EVENT <>
context CONTEXT <> 
;#########################################################################
hMenu                           dd ?