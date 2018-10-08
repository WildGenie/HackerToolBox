#include <windows.h>
#include <stdio.h>
#include "Cooperator.h"

int main(int argc, char *argv[])
{
	printf("IsConnectServer\n");
	if (!IsConnectServer())
	{
		printf("ConnectAndCall\n");
		ConnectAndCall();
	}
	if (!IsConnectServer())
	{
		printf("Error to connect server\n");
		return -1;
	}
	DWORD ret;
	IsdGetVersion(&ret);
	printf("Icesword version : %x\n", ret);

	HANDLE hKey;
	if (IsdOpenKey(&hKey, KEY_ENUMERATE_SUB_KEYS, NULL_ROOT_DIR_HANDLE, L"\\Registry\\Machine\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"))
	{
		ULONG i = 0;
		char buf[2000];
		PKEY_VALUE_BASIC_INFORMATION basic = (PKEY_VALUE_BASIC_INFORMATION)buf;
		while (IsdEnumerateValueKey(hKey, i, KeyValueBasicInformation, basic, 2000, &ret) >= 0)
		{
			basic->Name[basic->NameLength/2] = 0;
			printf("%ws\n", basic->Name);
			i++;
		}
		IsdCloseHandle(hKey);
	}

	return 0;
}
