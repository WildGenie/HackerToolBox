
' VirtualizerSDK.inc

' Power Basic Macro Definitions for Oreans Technlogies Code Vitualizer 
' Converted from C by Mike Trader 2007
                
       
'#COMPILE EXE  "CV.exe" ' Example use
'#INCLUDE "VirtualizerSDK.inc"
'FUNCTION PBMAIN() AS LONG
'  LOCAL i AS LONG
'    VIRTUALIZER_START ' or VIRTUALIZER_MUTATE3_START       
'    i = 22 / 2
'    i = i * 8  
'    VIRTUALIZER_END
'  MSGBOX STR$(i)
'END FUNCTION

             
MACRO VIRTUALIZER_START
  !db &HEB
  !db &H10
  !db &H43
  !db &H56
  !db &H20
  !db &H20
  !db &H0C
  !db &H00
  !db &H00
  !db &H00
  !db &H00
  !db &H00
  !db &H00
  !db &H00
  !db &H43
  !db &H56
  !db &H20
  !db &H20
END MACRO 
    

MACRO VIRTUALIZER_MUTATE1_START 
  !db &HEB 
  !db &H10 
  !db &H43 
  !db &H56
  !db &H20 
  !db &H20 
  !db &H0C 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H01 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H43 
  !db &H56 
  !db &H20 
  !db &H20
END MACRO  
    

MACRO VIRTUALIZER_MUTATE2_START 
  !db &HEB 
  !db &H10 
  !db &H43 
  !db &H56
  !db &H20 
  !db &H20 
  !db &H0C 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H02 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H43 
  !db &H56 
  !db &H20 
  !db &H20
END MACRO  
    

MACRO VIRTUALIZER_MUTATE3_START 
  !db &HEB 
  !db &H10 
  !db &H43 
  !db &H56
  !db &H20 
  !db &H20 
  !db &H0C 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H03 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H43 
  !db &H56 
  !db &H20 
  !db &H20 
END MACRO 
  

MACRO VIRTUALIZER_END 
  !db &HEB 
  !db &H10 
  !db &H43 
  !db &H56 
  !db &H20 
  !db &H20 
  !db &H0D 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H00 
  !db &H43 
  !db &H56 
  !db &H20 
  !db &H20 
END MACRO 

