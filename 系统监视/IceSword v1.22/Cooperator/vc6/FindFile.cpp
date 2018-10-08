#include <windows.h>
#include <stdio.h>
#include "Cooperator.h"

int main(int argc, char *argv[])
{
	if (argc < 2)
	{
		printf("FindFile dir\n");
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

	HANDLE hFile = IsdCreateFile(argv[1], 0, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL | FILE_FLAG_DIRECTORY, 0);
	ISD_WIN32_FIND_DATA FileData;
	int ii = 0;
	while (hFile != INVALID_HANDLE_VALUE && IsdFindFile(hFile, &FileData, 0))
	{
		ii++;
		float size = (float)FileData.nFileSize.QuadPart/1024;
		printf("FileSize:%.3fk    FileName:%s\n", size, FileData.cFileName);
	}
	printf("%d\n", ii);
	if (hFile != INVALID_HANDLE_VALUE)
		IsdCloseHandle(hFile);

	return 0;
}
