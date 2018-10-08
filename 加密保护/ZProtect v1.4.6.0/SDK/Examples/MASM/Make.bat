\masm32\bin\ml /c /coff Example.asm
\masm32\bin\link /subsystem:windows /nologo Example.obj
@Del Example.obj
pause