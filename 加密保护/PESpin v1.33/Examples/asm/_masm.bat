@echo off
set file=markers_test
set res_file=res_file
C:\masm32\bin\ml.exe /c /coff /Cp %file%.asm
C:\masm32\bin\link.exe /SECTION:.text,RWE /SUBSYSTEM:WINDOWS,4.0 %file%.obj %res_file%.res
if errorlevel 1 goto End
   
   del %file%.OBJ

:End
 pause
 cls