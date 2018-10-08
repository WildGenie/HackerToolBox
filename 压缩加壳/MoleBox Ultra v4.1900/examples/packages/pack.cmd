@echo off
md Test
..\..\mxbpack.exe -Bl mxbtest.exe -oTest\mxbtest.exe -m "*.dat" -P "123" testfile.htm
..\..\mxbpack.exe ~~ -oTest\test.dat -p "123" testfile1.htm;testfile.htm
rem cd Test
rem echo --
rem echo -- running test
rem echo --
rem mxbtest.exe
