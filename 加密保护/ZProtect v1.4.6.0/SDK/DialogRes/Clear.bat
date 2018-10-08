@echo off
echo Y|Del /s *.aps
echo Y|del /s *.ncb
echo Y|del /s *.pdb
echo Y|del /s *.user
echo Y|del /s *.suo
echo Y|del /s _obj\*.*
rd _obj
@echo on
