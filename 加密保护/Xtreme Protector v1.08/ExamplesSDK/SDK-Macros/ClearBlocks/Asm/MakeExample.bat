path \masm32\bin

ml /c /coff Example.asm

link /SUBSYSTEM:WINDOWS  /OUT:Example.exe Example.obj

pause
