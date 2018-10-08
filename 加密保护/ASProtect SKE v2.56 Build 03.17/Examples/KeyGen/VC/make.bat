@ECHO OFF
@CLS
ECHO.

brcc32 keygen.rc

cl /nologo /ML /TP /c keygen.cpp
link /nologo /subsystem:windows /release keygen.obj user32.lib advapi32.lib shell32.lib keygen.res

del *.obj
del *.res
