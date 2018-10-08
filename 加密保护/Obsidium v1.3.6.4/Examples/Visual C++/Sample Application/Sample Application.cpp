/*
How to compile:

- Use the LIB tool (included with Visual C++) to create the library files:
  lib /def:dummy.def
  or
  lib /def:keygen.def
  and copy the resulting .lib files to the application directory
  The .def files are located in the SDK\C folder
*/

#include "stdafx.h"
#include <windows.h>
#include <stdio.h>
#include <conio.h>
#include "..\..\..\sdk\c\api\obsidium.h"


int main(int argc, char* argv[])
{
	if (isRegistered())
	{
		// the following code can only be executed if a
		// valid license key is present
		PATTERN_REG_START;
		printf("Application is registered\n");
		// display license expiration date if set
		FILETIME expDate;
		getLicenseExpiration(&expDate);
		if (expDate.dwHighDateTime == 0 && expDate.dwLowDateTime == 0)
			printf("License does not expire\n");
		else
		{
			SYSTEMTIME expDateS;
			FileTimeToSystemTime(&expDate, &expDateS);
			printf("License expires on %i/%i/%i\n", expDateS.wYear, expDateS.wMonth, expDateS.wDay);
		}
		// display license information strings
		for (int i = 0; i < 4; i++)
		{
			char regInfo[128];
			getRegInfo(i, regInfo);
			printf("License information %i: %s\n", i, regInfo);
		}
		PATTERN_REG_END;
	}
	else
	{
		// the following code will be decrypted when excuted
		PATTERN_ENC_START;
		printf("Application is not registered\n");
		// display trial information
		printf("Days left in trial period: %i\n", getTrialDays());
		printf("Runs left in trial period: %i\n", getTrialRuns());
		PATTERN_ENC_END;
	}
	printf("Press any key to exit...");
	_getch();
	return 0;
}
