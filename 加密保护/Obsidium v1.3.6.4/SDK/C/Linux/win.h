#ifndef HWINDOWS
#define HWINDOWS

typedef struct
{
    unsigned long dwLowDateTime;
    unsigned long dwHighDateTime;
} FILETIME;


typedef struct 
{
    unsigned short wYear;
    unsigned short wMonth;
    unsigned short wDayOfWeek;
    unsigned short wDay;
    unsigned short wHour;
    unsigned short wMinute;
    unsigned short wSecond;
    unsigned short wMilliseconds;
} SYSTEMTIME;

#endif
