@echo off


if exist example.obj del example.obj
if exist example.dll del example.dll

ml /c /coff example.asm

Link /SUBSYSTEM:WINDOWS example.obj

pause
