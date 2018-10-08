
#pragma once

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
// Windows Header Files:
#include <windows.h>
#include <tchar.h>

// prototypes are exports since this is the host dll and not a client
#define PEC2CODEC_HOST_EXPORTS