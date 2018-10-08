@echo off
set file=console
e:\dev\lcc\bin\lcc -O %file%.c
e:\dev\lcc\bin\lcclnk -s -subsystem console %file%.obj
del *.obj
pause
cls