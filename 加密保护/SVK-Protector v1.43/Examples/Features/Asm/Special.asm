;This example shows a way how protect some parts of code with features

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
capture db "Features example.",0
message db "Now I will try run some features!",0

capture_feature1 db "Feature 1",0
message_feature1 db "Feature 1 is not enabled in license!",0

special_capture2 db "Message for unregistered users!",0
special_message2 db "You can buy our product at www....",0

feature1_unlocked_flag db 0

.code
assume          fs      :flat
Start:
;int 3                                          ;only for debug version
        push 0
        push offset capture
        push offset message
        push 0
        iWin32 MessageBoxA


SVKP_ENCRYPTED_FEATURE1_START                   ;start of feature 1
;this code will encrypted and it will decrypted only if user have correct
;registration key with this feature unlocked
        push 0
        push offset special_capture1
        push offset special_message1
        push 0
        iWin32 MessageBoxA                      ;display message box for registered users

        jmp  skip_text
special_capture1 db "Message for registered users!",0
special_message1 db "Feature 1 is unlocked in license!",0

skip_text:
        mov  [feature1_unlocked_flag], 1        ;set flag, because feature is
                                                ;unlocked in license
SVKP_ENCRYPTED_FEATURE1_END                     ;end of feature 1

        cmp  [feature1_unlocked_flag], 1
        jz   skip_unregistered_feature1

;display text for users with feature 1 not unlocked
        push 0
        push offset capture_feature1
        push offset message_feature1
        push 0
        iWin32 MessageBoxA

skip_unregistered_feature1:


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

;action for users with Feature 2 activated
SVKP_ENCRYPTED_FEATURE2_START
        push 0
        push offset special_capture3
        push offset special_message3
        push 0
        iWin32 MessageBoxA                      ;display message box for registered users

        jmp  skip_text2
special_capture3 db "Message for registered users!",0
special_message3 db "Feature 2 is unlocked in license!",0

skip_text2:
SVKP_ENCRYPTED_FEATURE2_END

;is possible select more than one part of code for one feature
SVKP_ENCRYPTED_FEATURE1_START
        push 0
        push offset special_capture4
        push offset special_message4
        push 0
        iWin32 MessageBoxA                      ;display message box for registered users

        jmp  skip_text3
special_capture4 db "Message for registered users!",0
special_message4 db "Feature 1 second part of code!",0

skip_text3:
SVKP_ENCRYPTED_FEATURE1_END

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