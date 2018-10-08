{***************************************}
{Decompiled by IDR v.2.5.2 beta         }
{IDR home page: http://kpnc.org/idr32/en}
{***************************************}
unit _Unit60;

interface

uses
  Classes, Windows, Graphics;


implementation

//00456590
//function sub_00456590(?:String):?;
//begin
{*
 00456590    push       ebp
 00456591    mov        ebp,esp
 00456593    add        esp,0FFFFFEB8
 00456599    push       ebx
 0045659A    mov        ebx,eax
 0045659C    lea        eax,[ebp-148]
 004565A2    push       eax
 004565A3    mov        eax,ebx
 004565A5    call       @LStrToPChar
 004565AA    push       eax
 004565AB    call       kernel32.FindFirstFileA
 004565B0    cmp        eax,0FFFFFFFF
>004565B3    je         004565D8
 004565B5    push       eax
 004565B6    call       kernel32.FindClose
 004565BB    test       byte ptr [ebp-148],10
>004565C2    jne        004565D8
 004565C4    mov        eax,dword ptr [ebp-128]
 004565CA    mov        dword ptr [ebp-8],eax
 004565CD    mov        eax,dword ptr [ebp-12C]
 004565D3    mov        dword ptr [ebp-4],eax
>004565D6    jmp        004565E6
 004565D8    mov        dword ptr [ebp-8],0FFFFFFFF
 004565DF    mov        dword ptr [ebp-4],0FFFFFFFF
 004565E6    mov        eax,dword ptr [ebp-8]
 004565E9    mov        edx,dword ptr [ebp-4]
 004565EC    pop        ebx
 004565ED    mov        esp,ebp
 004565EF    pop        ebp
 004565F0    ret
*}
//end;

end.