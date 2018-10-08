;This example shows a way how protect some parts of code with encryption

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
capture db "Encryption blocks example.",0
message db "Now I will try run encrypted block!",0

special_capture2 db "Message for unregistered users!",0
special_message2 db "You can buy our product at www....",0

.code
assume          fs      :flat
Start:
;int 3                                          ;only for debug version

;this code will decrypted before using and after use removed
;tip: This type of blocks is very good use in initialize part of program
;(load DLL(s), initialize data, fill some special variables and etc.)
SVKP_ENCRYPTED_BLOCK_TYPE2_START
        push 0
        push offset capture
        push offset message
        push 0
        iWin32 MessageBoxA
SVKP_ENCRYPTED_BLOCK_TYPE2_END

SVKP_ENCRYPTED_BLOCK_START                      ;start of encrypted block RSA
;this code will encrypted and it will decrypted only if user have correct
;registration key
        push 0
        push offset special_capture
        push offset special_message
        push 0
        iWin32 MessageBoxA                      ;display message box for registered users

        jmp  skip_text
special_capture db "Message for registered users!",0
special_message db "This message box will show only if you have registered version!",0

skip_text:

SVKP_ENCRYPTED_BLOCK_END                        ;end of encrypted block

;This code will decrypted before using and encrypted again after use
SVKP_ENCRYPTED_BLOCK_TYPE1_START
;now we will read registration information
        iWin32 SVKP_GetRegistrationInformation, offset registration_information
        test eax, eax
        jnz  skip_unregistered_part             ;if there is registration key, jump

;if you want to do special action for unregistered version, You can do it there.
        push 0
        push offset special_capture2
        push offset special_message2
        push 0
        iWin32 MessageBoxA

;end of part for non registered users
skip_unregistered_part:
SVKP_ENCRYPTED_BLOCK_TYPE1_END


        push -1
        iWin32 ExitProcess

end Start


;Note1:
;Never use encrypted blocks like this:


;SVKP_ENCRYPTED_BLOCK_START              ;start of encrypted block

;        call save_file

;SVKP_ENCRYPTED_BLOCK_END                ;end of encrypted block

;Because You will encrypt only jump to function and function's code will not
;encrypted. Then is possible for cracker find function and corrected jump.

;Note2:
;Never use something like this:

;SVKP_ENCRYPTED_BLOCK_START              ;start of encrypted block

;        call save_file
;        jmp  skip_unregistered_part
;SVKP_ENCRYPTED_BLOCK_END                ;end of encrypted block

;       ...there is code for unregistered users
;skip_unregistered_part:
;       ...code

;Because You will skip end of encrypted block.