@echo off

SET PROJECTNAME=AspackDie
SET MASMBINPATH=\MASM32\BIN

%MASMBINPATH%\Cvtres.exe /nologo /machine:ix86 rsrc.res
%MASMBINPATH%\Ml.exe /nologo /Zp1 /c /coff %PROJECTNAME%.asm
%MASMBINPATH%\Link.exe /nologo /SUBSYSTEM:WINDOWS /MERGE:.idata=.text /MERGE:.data=.text /MERGE:.rdata=.text /SECTION:.text,EWR /IGNORE:4078 %PROJECTNAME%.obj rsrc.obj

DEL *.obj

ECHO.
PAUSE
CLS