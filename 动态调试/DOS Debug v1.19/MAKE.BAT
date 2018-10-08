@echo off
echo creating debug.com
jwasm -nologo -D?PM=0 -bin -Fo DEBUG.COM -Fl debug.asm
echo creating debugx.com
jwasm -c -nologo -D?PM=1 -bin -Fo DEBUGX.COM -Fl=DEBUGX.LST debug.asm
