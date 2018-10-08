Return equ <return>
SetEax equ <Seteax>
CMov   equ <Cmov>
SetDD  equ <Setdd>
SetDD  equ <SetDWORD>
SetDD  equ <Setdword>

Text  macro Text
   local szText
   .data
    szText db Text,0
   .code
   exitm <offset szText>
endm

TextLine macro Text
   local szText
   .data
    szText db Text,0DH,0AH,0
   .code
   exitm <offset szText>
endm

Return macro Parameter
     mov eax,Parameter
     ret
endm


SetEax macro x
      mov eax,x
endm


CMov macro x,y
     push y
     pop x
endm


SetDD macro Dreg,Sreg
      mov Dreg,DWORD ptr [Sreg]
endm



