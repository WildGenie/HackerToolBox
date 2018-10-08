CC = g++
CCOPT = -s -fPIC

keygen: keygen_lib.cpp keygen_lib.h keygen.o keygen.h
	$(CC) $(CCOPT) -c keygen_lib.cpp
	$(CC) $(CCOPT) -o libkeygen.so.1 -O -shared -Xlinker -x -Xlinker --strip-debug -Xlinker -soname -Xlinker libkeygen.so.1 keygen_lib.o keygen.o

keygen_test: libkeygen_test.cpp keygen
	$(CC) -o libkeygen_test.o libkeygen_test.cpp -ldl
