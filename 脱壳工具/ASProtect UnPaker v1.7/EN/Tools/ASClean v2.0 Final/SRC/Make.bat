@echo off
@SET MAMSPATH=E:\masm32
@SET PROJECT=ASClean

@if not exist %PROJECT%.exe goto comp
@del %PROJECT%.exe
:comp
@%MAMSPATH%\bin\ml /c /coff /Cp /Fl %PROJECT%.asm
@%MAMSPATH%\bin\rc rsrc.rc
@%MAMSPATH%\bin\link /SUBSYSTEM:WINDOWS /LIBPATH:%MAMSPATH%\lib /MERGE:.text=.%PROJECT% /MERGE:.rdata=.%PROJECT% /MERGE:.data=.%PROJECT% /SECTION:.%PROJECT%,EWR /IGNORE:4078 %PROJECT%.obj rsrc.res
@if not exist %PROJECT%.exe goto end
@del *.lst
@del *.obj
@del *.res
:end
@pause