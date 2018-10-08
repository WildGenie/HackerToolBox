#include <windows.h>
#include <stdio.h>
#include "Cooperator.h"

int main(int argc, char *argv[])
{
	if (argc < 3)
	{
		return -1;
	}
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

	HANDLE hFile1 = IsdCreateFile(argv[1], 0, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
	HANDLE hFile2 = IsdCreateFile(argv[2], 0, FILE_SHARE_READ, 0, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);

	LARGE_INTEGER FileSize;
	if (hFile1 != INVALID_HANDLE_VALUE && 
		hFile2 != INVALID_HANDLE_VALUE)
	{
		if (IsdGetFileSizeEx(hFile1, &FileSize))
		{
			char *buf = (char *)malloc(FileSize.LowPart);
			IsdReadFile(hFile1, buf, FileSize.LowPart, &ret, 0);
			IsdWriteFile(hFile2, buf, FileSize.LowPart, &ret, 0);
			free(buf);
		}
	}
	if (hFile1 != INVALID_HANDLE_VALUE)
		IsdCloseHandle(hFile1);
	if (hFile2 != INVALID_HANDLE_VALUE)
		IsdCloseHandle(hFile2);

	return 0;
}
