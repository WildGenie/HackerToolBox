\MinGW\bin\windres Resource.rc Resource.o
\MinGW\bin\g++ -mwindows Project1.cpp Resource.o VMProtectSDK32.lib -o Project1.exe -Os