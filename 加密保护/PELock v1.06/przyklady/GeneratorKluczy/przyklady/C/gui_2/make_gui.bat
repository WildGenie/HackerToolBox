@echo off
set file=gui
e:\dev\lcc\bin\lcc -O %file%.c
e:\dev\lcc\bin\lcclnk -s -subsystem windows %file%.obj %file%.res
del *.obj
pause
cls