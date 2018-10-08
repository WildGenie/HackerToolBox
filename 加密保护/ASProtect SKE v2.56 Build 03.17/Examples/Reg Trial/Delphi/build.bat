@echo off
@cls

if exist *.~* del *.~*
if exist *.bak del *.bak

if exist test.exe del test.exe
dcc32 -B -GD test.dpr
