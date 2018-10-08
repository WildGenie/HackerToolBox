;This example shows a way how use Alive Checks in your application

;Note:
;I use special macro in code. It is very easy rewrite this example for
;Tasm or MASM. Like: iWin32 == INVOKE (masm) == call (tasm)

        .586
        .MMX
        .model flat,stdcall

include ..\..\Inc&Lib\apimacro.mac
include ..\..\Inc&Lib\windows.inc
INCLUDELIB      ..\..\Inc&Lib\iKERNEL32.lib
INCLUDELIB      ..\..\Inc&Lib\iUSER32.lib

;there are defined include file and library for SVKP's special functions
include         ..\..\Inc&Lib\special.inc
INCLUDELIB      ..\..\Inc&Lib\ispecial.lib

.DATA?
registration_information db 255 dup (?)         ;buffer for registration information

.DATA
capture db "Alive Checks example.",0
message db "Now I will try run some checks!",0

capture2 db "SVKP is alive!",0
message2 db "SVKP protection was not removed!",0


.code
assume          fs      :flat
Start:
;int 3                                          ;only for debug version
        push 0
        push offset capture
        push offset message
        push 0
        iWin32 MessageBoxA


;Don't forget use these checks random or in not very offen used procedures!
SVKP_ALIVE_CHECK_1
SVKP_ALIVE_CHECK_2

        push 0
        push offset capture2
        push offset message2
        push 0
        iWin32 MessageBoxA


        push -1
        iWin32 ExitProcess

end Start


