;This example shows a way how protect some parts of code with encryption
;and lock them for one computer

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

HWInformation    dd 4 dup (?)

.DATA
special_message2 db "You can buy our product at www....",0dh,0dh
                 db "Please send us your Hardware ID:", 0dh, 0dh
hardware_key     db 32 dup (?)
hardware_key_end db 0dh,0dh,0dh
                 db "Your Hardware ID was copied to clipboard, please paste it to e-mail!",0dh
                 db "Now try to create registration key for this project and Hardware ID in SVKP.",0

capture db "Encryption blocks example.",0
message db "Now I will try run encrypted block!",0

special_capture2 db "Message for unregistered users!",0

allocated_memory dd 0
locked_mem       dd 0

.code
assume          fs      :flat
Start:
;int 3                                          ;only for debug version
        push 0
        push offset capture
        push offset message
        push 0
        iWin32 MessageBoxA


SVKP_ENCRYPTED_BLOCK_START                      ;start of encrypted block
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

;now we will read registration information
        iWin32 SVKP_GetRegistrationInformation, offset registration_information
        test eax, eax
        jnz  skip_unregistered_part             ;if there is registration key, jump

;if you want to do special action for unregistered version, You can do it there.
        lea  esi, HWInformation
        iWin32 SVKP_GetHWInfo, esi

;        mov  esi, edi
        lea  edi, hardware_key
        lodsd
        call HexWrite32

        lodsd
        call HexWrite32

        lodsd
        call HexWrite32

        lodsd
        call HexWrite32


        push 0
        push offset special_capture2
        push offset special_message2
        push 0
        iWin32 MessageBoxA

        mov  byte ptr [hardware_key_end], 0

        iWin32 GlobalAlloc, 2002h, 32h
        mov  [allocated_memory], eax

        iWin32 GlobalLock, eax
        mov  [locked_mem], eax

        iWin32 lstrcpy, eax, offset hardware_key

        iWin32 GlobalUnlock, dword ptr [allocated_memory]

        iWin32 OpenClipboard, NULL

        iWin32 EmptyClipboard

        iWin32 SetClipboardData, 1, dword ptr [allocated_memory]

        iWin32 CloseClipboard
;end of part for non registered users

skip_unregistered_part:

        push -1
        iWin32 ExitProcess


HexWrite8  proc
        mov  ah, al
        and  al, 0fh
        shr  ah, 4
        or   ax, 3030h
        xchg al, ah
        cmp  ah, 39h
        ja   @@4
@@1:
        cmp  al, 39h
        ja   @@3
@@2:
        stosw
        ret
@@3:
        sub  al, 30h
        add  al,'A' - 10
        jmp  @@2
@@4:
        sub  ah, 30h
        add  ah, 'A' - 10
        jmp  @@1

HexWrite8      endp

HexWrite16  proc
        push ax
        xchg al, ah
        call HexWrite8
        pop  ax
        call HexWrite8
        ret
HexWrite16  endp

HexWrite32  proc
        push eax
        shr  eax, 16
        call HexWrite16
        pop  eax
        call HexWrite16
        ret
HexWrite32  endp



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