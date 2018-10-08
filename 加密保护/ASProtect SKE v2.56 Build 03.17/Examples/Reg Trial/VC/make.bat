@ECHO OFF
@CLS
ECHO.

brcc32 trial.rc

cl /nologo /ML /TP /c trial.cpp
link /nologo /subsystem:windows /release trial.obj user32.lib advapi32.lib shell32.lib trial.res

del *.obj
del *.res
