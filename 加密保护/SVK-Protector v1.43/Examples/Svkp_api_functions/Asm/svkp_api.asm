;This example shows a way how use SVKP's API functions

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
capture db "API functions example.",0
message db "Now I will try some API functions",0
registered db "Registration data from key:",0
unregistered db "Unregistered version!",0
unregistered_user db "Please register to www...",0

.code
assume          fs      :flat
Start:
;int 3                                          ;only for debug version
        push 0
        push offset capture
        push offset message
        push 0
        iWin32 MessageBoxA


;now we will check for debuggers
        iWin32 SVKP_KillDebugger

;then we will lock keyboard
        iWin32 SVKP_LockKeyboard


;now we will read registration information
        iWin32 SVKP_GetRegistrationInformation, offset registration_information
        test eax, eax
        jz   jmp_unregistered_user              ;if there is not registration key, jump

        push 0
        push offset registered
        push offset registration_information
        push 0
        iWin32 MessageBoxA

        jmp  back_to_win


jmp_unregistered_user:
;if you want to do special action for unregistered version, You can do it there.
        push 0
        push offset unregistered
        push offset unregistered_user
        push 0
        iWin32 MessageBoxA
;end of part for non registered users


skip_unregistered_part:
back_to_win:

;now we will unlock keyboard
        iWin32 SVKP_UnLockKeyboard

;end of program
        push -1
        iWin32 ExitProcess

end Start


