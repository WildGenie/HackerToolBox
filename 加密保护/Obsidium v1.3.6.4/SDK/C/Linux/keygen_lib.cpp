#include <iostream>
#include <time.h>
#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include "keygen_lib.h"

typedef long long __int64;

#define BREAKPOINT     __asm__ volatile (".byte 0xcc");

// workaround for GCC bug 11137
// static struct Stupid { Stupid() {} ~Stupid() {} } stupid;

extern "C" int GetLicenseHashC(void* lpLicense, unsigned long dwType, char *lpHash)
{
	return GetLicenseHash_wrap(lpLicense, dwType, lpHash);
}
	
extern "C" int ConvertToBinC(char* lpString, void* lpBuffer)
{
    return ConvertToBin_wrap(lpString, lpBuffer);
}

extern "C" int ConvertToStringC(void* lpKeyfile, unsigned long dwSize, char* lpBuffer)
{
    return ConvertToString_wrap(lpKeyfile, dwSize, lpBuffer);
}

extern "C" int GenerateShortKeyC(SHORTKEY_INFO* lpInfo)
{
    return GenerateShortKey_wrap(lpInfo);
}

extern "C" int GenerateKeyfileC(KEYFILE_INFO* lpInfo)
{
    return GenerateKeyfile_wrap(lpInfo);
}

extern "C" int VerifyKeyfileC(KEYFILE_INFO* lpInfo)
{
    return VerifyKeyfile_wrap(lpInfo);
}

extern "C" int VerifyShortKeyC(SHORTKEY_INFO* lpInfo)
{
    return VerifyShortKey_wrap(lpInfo);
}

void __attribute__ ((constructor)) my_init()
{
    srand((unsigned)time(NULL));
    Init();
}

void __attribute__ ((destructor)) my_fini()
{
    Free();
}

extern "C" long getFileSize_wrap(FILE* f)
{
    long oldPos = ftell(f);
    if (oldPos == -1)
        return 0;
    if (fseek(f, 0, SEEK_END) != 0)
        return 0;
    long size = ftell(f);
    if (size == -1)
    {
        fseek(f, oldPos, SEEK_SET);
        return 0;
    }
    if (fseek(f, oldPos, SEEK_SET) != 0)
        return 0;
    return size;
}

extern "C" bool fopen_wrap(char* lpFilename, FILE** lpF)
{
    FILE* f = fopen(lpFilename, "rb");
    *lpF = f;
    return (f != NULL);
}

extern "C" void fclose_wrap(FILE* f)
{
    fclose(f);
}

extern "C" long fread_wrap(FILE *f, void *lpBuffer, long dwSize)
{
    return fread(lpBuffer, 1, dwSize, f);
}

extern "C" void fseek_wrap(FILE *f, long offset)
{
    fseek(f, offset, SEEK_SET);
}


extern "C" void* malloc_wrap(long size)
{
    return malloc(size);
}

extern "C" void free_wrap(void* pv)
{
    free(pv);
}

extern "C" long getRnd_wrap()
{
    FILE *f = fopen("/dev/urandom", "rb");
    if (f == NULL)
        return rand();
    else
    {
        long l;
        if (fread(&l, sizeof(l), 1, f) == 0)
            l = rand();
        fclose(f);
        return l;
    }
}

void UnixTimeToFileTime(time_t t, FILETIME* pft)
{
    __int64 ll = ((__int64)t + 11644473600LL) * 10000000;
    pft->dwLowDateTime = (unsigned long)ll;
    pft->dwHighDateTime = (unsigned long)(ll >> 32);
}

void FileTimeToUnixTime(FILETIME* pft, time_t* t)
{
    __int64 unixTime = ((__int64)pft->dwHighDateTime << 32) + pft->dwLowDateTime - 116444736000000000LL;
    unixTime /= 10000000;
    (*t) = (time_t)unixTime;
}

extern "C" void fileTimeToSystemTime_wrap(FILETIME* ft, SYSTEMTIME& st)
{
    time_t t;
    FileTimeToUnixTime(ft, &t);
    tm* lt = localtime(&t);
    st.wYear = lt->tm_year + 1900;
    st.wMonth = lt->tm_mon + 1;
    st.wDayOfWeek = lt->tm_wday;
    st.wDay = lt->tm_mday;
    st.wHour = lt->tm_hour;
    st.wMinute = lt->tm_min;
    st.wSecond = lt->tm_sec;
    st.wMilliseconds = 0;
}

extern "C" void systemTimeToFileTime_wrap(SYSTEMTIME* st, FILETIME* ft)
{
    tm time;
    time.tm_year = st->wYear - 1900;
    time.tm_mon = st->wMonth - 1;
    time.tm_wday = st->wDayOfWeek;
    time.tm_mday = st->wDay;
    time.tm_hour = st->wHour;
    time.tm_min = st->wMinute;
    time.tm_sec = st->wSecond;
    time_t t = mktime(&time);
    UnixTimeToFileTime(t, ft);
}
