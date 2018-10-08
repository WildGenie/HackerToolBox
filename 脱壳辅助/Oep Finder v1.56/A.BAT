ml /c /Cp /coff /nologo oep.asm
link /SUBSYSTEM:WINDOWS oep.obj oep.res
del *.obj
del *.exp
del *.lib
