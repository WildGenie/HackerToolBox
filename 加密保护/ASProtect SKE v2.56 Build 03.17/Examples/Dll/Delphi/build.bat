@echo off
@cls

if exist loader.exe del loader.exe
if exist test.exe del test.exe

dcc32.exe loader.dpr
dcc32.exe test.dpr
