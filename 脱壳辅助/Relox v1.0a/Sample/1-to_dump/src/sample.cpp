#include <windows.h>
#include <stdio.h>

int main()
{
	char garbage[256];
	HMODULE hmod1 = LoadLibrary("original.dll");
	HMODULE hmod2 = LoadLibrary("copy_of_original.dll");
	sprintf(garbage, "Modules loaded at : %08X and %08X", hmod1, hmod2);
	MessageBox(NULL, garbage, "Ready to be dumped", 0);
	FreeLibrary(hmod2);
	FreeLibrary(hmod1);
	return (0);
}
