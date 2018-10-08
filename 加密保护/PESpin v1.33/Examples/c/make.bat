@echo off
set file=gui
c:\lcc\bin\lcc -O %file%.c
c:\lcc\bin\lcclnk -s -subsystem windows %file%.obj %file%.res
del *.obj
pause
cls