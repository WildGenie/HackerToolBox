#include <windows.h>
#include <stdio.h>
#include "Cooperator.h"

int main()
{
	if (!IsConnectServer())
		ConnectAndCall();
	if (!IsConnectServer())
	{
		printf("Error to connect server\n");
		return -1;
	}
	DWORD pid[1000], ret;
	IsdGetVersion(&ret);
	printf("Icesword version : %x\n", ret);
	if (IsdEnumProcesses(pid, 1000*sizeof(DWORD), &ret))
	{
		for (DWORD i=0; i<ret/sizeof(DWORD); i++)
			printf("%d\n", pid[i]);
		printf("Total:%d\n", i);
	}

	HMODULE mod[1000];
	if (IsdEnumProcessModules(pid[3], mod, 1000*sizeof(HMODULE), &ret))
	{
		for (DWORD j=0; j<ret/sizeof(HMODULE); j++)
			printf("%x\n", mod[j]);
		printf("Total:%d\n", j);
	}
	char name[2000];
	if (IsdQueryProcessFileName(pid[3], name, 4000))
		printf("%s\n", name);

	return 0;
}
