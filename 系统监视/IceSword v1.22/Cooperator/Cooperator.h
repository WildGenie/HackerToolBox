///////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------
//                 Copyright (c) 2004 jfpan20000@sina.com
// 
//                         IceSword协件库 1.06
// 
//                           pjf    USTC
//------------------------------------------------------------------
////////////////////////////////////////////////////////////////////
#ifndef __ICE_COOPERATOR_
#define __ICE_COOPERATOR_

#pragma comment(lib, "IceSword110.lib")

typedef LONG NTSTATUS;

//
////指示IsdOpenKey的RootDirectory为空
//
#define NULL_ROOT_DIR_HANDLE     ((HANDLE)0xF000000F)
//
////历史原因，将其定义为2000，其实只用到255字节
//
#define DATA_BUF_LEN                    2000

//
////IsdCreateFile可以创建与打开目录，但必须为dwFlagsAndAttributes指定FILE_FLAG_DIRECTORY标志
//
#define FILE_FLAG_DIRECTORY             0x00400000

//
////用于IsdFindFile，对应于WIN32_FIND_DATA，有一点区别
//
typedef struct _ISD_WIN32_FIND_DATA {
	DWORD         dwFileAttributes; 
	FILETIME      ftCreationTime; 
	FILETIME      ftLastAccessTime; 
	FILETIME      ftLastWriteTime; 
	LARGE_INTEGER nFileSize; 
	LARGE_INTEGER AllocationSize; 
	TCHAR         cAlternateFileName[ 14 ]; 
	TCHAR         cFileName[ DATA_BUF_LEN ]; 
} ISD_WIN32_FIND_DATA, *PISD_WIN32_FIND_DATA;

//
////用于IsdSetInformationFile/IsdQueryInformationFile
//
typedef enum _FILE_INFORMATION_CLASS {
    FileDirectoryInformation         = 1,
    FileFullDirectoryInformation,   // 2
    FileBothDirectoryInformation,   // 3
    FileBasicInformation,           // 4  wdm
    FileStandardInformation,        // 5  wdm
    FileInternalInformation,        // 6
    FileEaInformation,              // 7
    FileAccessInformation,          // 8
    FileNameInformation,            // 9
    FileRenameInformation,          // 10
    FileLinkInformation,            // 11
    FileNamesInformation,           // 12
    FileDispositionInformation,     // 13
    FilePositionInformation,        // 14 wdm
    FileFullEaInformation,          // 15
    FileModeInformation,            // 16
    FileAlignmentInformation,       // 17
    FileAllInformation,             // 18
    FileAllocationInformation,      // 19
    FileEndOfFileInformation,       // 20 wdm
    FileAlternateNameInformation,   // 21
    FileStreamInformation,          // 22
    FilePipeInformation,            // 23
    FilePipeLocalInformation,       // 24
    FilePipeRemoteInformation,      // 25
    FileMailslotQueryInformation,   // 26
    FileMailslotSetInformation,     // 27
    FileCompressionInformation,     // 28
    FileObjectIdInformation,        // 29
    FileCompletionInformation,      // 30
    FileMoveClusterInformation,     // 31
    FileQuotaInformation,           // 32
    FileReparsePointInformation,    // 33
    FileNetworkOpenInformation,     // 34
    FileAttributeTagInformation,    // 35
    FileTrackingInformation,        // 36
    FileIdBothDirectoryInformation, // 37
    FileIdFullDirectoryInformation, // 38
    FileValidDataLengthInformation, // 39
    FileShortNameInformation,       // 40
    FileMaximumInformation
} FILE_INFORMATION_CLASS, *PFILE_INFORMATION_CLASS;

//
////注册表查询操作结构
//
typedef enum _KEY_INFORMATION_CLASS {
    KeyBasicInformation,
    KeyNodeInformation,
    KeyFullInformation,
    KeyNameInformation,
    KeyCachedInformation,
    KeyFlagsInformation
} KEY_INFORMATION_CLASS;

typedef struct _KEY_BASIC_INFORMATION {
  LARGE_INTEGER LastWriteTime;
  ULONG  TitleIndex;
  ULONG  NameLength;
  WCHAR  Name[1];  //  Variable-length string
} KEY_BASIC_INFORMATION, *PKEY_BASIC_INFORMATION;

typedef enum _KEY_VALUE_INFORMATION_CLASS {
    KeyValueBasicInformation,
    KeyValueFullInformation,
    KeyValuePartialInformation,
    KeyValueFullInformationAlign64,
    KeyValuePartialInformationAlign64
} KEY_VALUE_INFORMATION_CLASS;

typedef struct _KEY_VALUE_BASIC_INFORMATION {
    ULONG   TitleIndex;
    ULONG   Type;
    ULONG   NameLength;
    WCHAR   Name[1];            // Variable size
} KEY_VALUE_BASIC_INFORMATION, *PKEY_VALUE_BASIC_INFORMATION;

typedef struct _KEY_VALUE_PARTIAL_INFORMATION {
	ULONG  TitleIndex;
	ULONG  Type;
	ULONG  DataLength;
	UCHAR  Data[1];  //  Variable size
} KEY_VALUE_PARTIAL_INFORMATION, *PKEY_VALUE_PARTIAL_INFORMATION;

typedef struct _KEY_FULL_INFORMATION {
	LARGE_INTEGER  LastWriteTime;
	ULONG  TitleIndex;
	ULONG  ClassOffset;
	ULONG  ClassLength;
	ULONG  SubKeys;
	ULONG  MaxNameLen;
	ULONG  MaxClassLen;
	ULONG  Values;
	ULONG  MaxValueNameLen;
	ULONG  MaxValueDataLen;
	WCHAR  Class[1];
} KEY_FULL_INFORMATION, *PKEY_FULL_INFORMATION;

typedef struct _KEY_VALUE_FULL_INFORMATION {
	ULONG  TitleIndex;
	ULONG  Type;
	ULONG  DataOffset;
	ULONG  DataLength;
	ULONG  NameLength;
	WCHAR  Name[1];  //  Variable size
} KEY_VALUE_FULL_INFORMATION, *PKEY_VALUE_FULL_INFORMATION;

//
////导出函数
//

/////////////////////////////////////////////////////////////////////
////IsdGetVersion
//
//目的：获取运行中的Icesword程序版本
//
//参数：
//  Version 
//    [out] 成功后返回版本号，如1.06版就返回0x106. 
//
//返回值：成功则返回TRUE.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdGetVersion(DWORD *Version);

/////////////////////////////////////////////////////////////////////
////IsdGetIceProcId
//
//目的：获取运行中的Icesword进程PID
//
//参数：无 
//
//返回值：成功则返回PID.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) DWORD IsdGetIceProcId();

/////////////////////////////////////////////////////////////////////
////IsConnectServer
//
//目的：是否已经连接到IceSword进程
//
//参数：无 
//
//返回值：已连接则返回TRUE.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsConnectServer();

/////////////////////////////////////////////////////////////////////
////ConnectAndCall
//
//目的：连接IceSword进程并获取初始参数
//
//参数：无 
//
//返回值：成功则返回TRUE.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL ConnectAndCall();

/////////////////////////////////////////////////////////////////////
////IsdEnumProcesses
//
//目的：枚举进程
//
//参数：
//  lpidProcess
//    [out] 用于保存返回值的缓冲. 
//  cb
//    [in] 缓冲大小.
//  cbNeeded
//    [out] 实际返回缓冲大小.
//
//返回值：成功则返回TRUE.
//
//备注：1、它与系统PSAPI的EnumProcesses几乎一样使用，就不多说了.
//      注意因为0号Idle进程始终不变，返回值就省略了，所以进程总数
//      应该加一.
//      2、它返回的PID包含状态Deleting的进程，请用IsProcessDeleting
//      判断是不是该状态（返回TRUE则是）.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdEnumProcesses(
                                            DWORD *lpidProcess, 
                                            DWORD cb, 
                                            DWORD *cbNeeded);

/////////////////////////////////////////////////////////////////////
////IsProcessDeleting
//
//目的：判断进程状态是否为Deleting
//
//参数：
//  Pid
//    [in] 用于保存返回值的缓冲. 
//
//返回值：是Deleting状态进程则返回TRUE.
//
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsProcessDeleting(DWORD Pid);

/////////////////////////////////////////////////////////////////////
////IsdEnumProcessModules
//
//目的：枚举进程模块
//
//参数：
//  Pid
//    [in] 进程PID
//  lphModule
//    [out] 用于保存返回值的缓冲. 
//  cb
//    [in] 缓冲大小.
//  lpcbNeeded
//    [out] 实际返回缓冲大小.
//
//返回值：成功则返回TRUE.
//
//备注：它与系统PSAPI的EnumProcessModules几乎一样使用，注意第一个参
//      数不同，这里是Pid.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdEnumProcessModules(
                                            DWORD Pid, 
                                            HMODULE *lphModule, 
                                            DWORD cb, 
                                            LPDWORD lpcbNeeded);

/////////////////////////////////////////////////////////////////////
////IsdQueryProcessFileName
//
//目的：由进程PID获取进程文件路径名
//
//参数：
//  Pid
//    [in] 进程PID
//  FileName
//    [out] 用于保存返回值的缓冲，宽字符串. 
//  len
//    [in] 缓冲大小.
//
//返回值：成功则返回TRUE.
//
//备注：
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdQueryProcessFileName(
                                            DWORD Pid, 
                                            char *FileName, 
                                            int len);

/////////////////////////////////////////////////////////////////////
////IsdGetModuleFileName
//
//目的：获取指定进程的指定模块的文件路径名
//
//参数：
//  Pid
//    [in] 进程PID
//  hModule
//    [in] 模块句柄
//  lpFilename
//    [out] 用于保存返回值的缓冲，宽字符串. 
//  nSize
//    [in] 缓冲大小.
//
//返回值：成功则返回TRUE.
//
//备注：
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdGetModuleFileName(
                                            DWORD Pid, 
                                            HMODULE hModule, 
                                            LPTSTR lpFilename, 
                                            DWORD nSize);

/////////////////////////////////////////////////////////////////////
////IsdCreateFile
//
//目的：创建或打开文件(目录也是特殊的文件)
//
//参数：
//  lpFileName
//    [in] 文件路径全名. 
//  dwDesiredAccess
//    [in] 文件访问权限.
//  dwShareMode
//    [in] 共享模式.
//  lpSecurityAttributes
//    [in] 始终为NULL.
//  dwCreationDisposition
//    [in] 创建打开部署.
//  dwFlagsAndAttributes
//    [in] 标志属性.
//  hTemplateFile
//    [in] 始终为NULL.
//
//返回值：成功则返回打开句柄，否则返回INVALID_HANDLE_VALUE.
//
//备注：它是系统API CreateFile的子集，使用上差不多，需要注意的是：
//    1、lpSecurityAttributes、hTemplateFile不支持，应传入NULL.
//    2、只能用它来创建或打开硬盘文件.
//    3、对它来说文件访问权限dwDesiredAccess其实没有什么意义，默认
//       就有所有的权限，一般传入0就好.
//    4、传回的句柄是由IceSword维护的，并不是windows内核句柄，不能
//       用它来使用系统api.
//    6、IceSword限制了每个协件进程的句柄表大小，文件、注册表仅可打
//       开1000个句柄.
//    5、一定要传入文件路径全名.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) HANDLE IsdCreateFile(
                                            LPCSTR lpFileName,
                                            ULONG dwDesiredAccess,
                                            ULONG dwShareMode,
                                            PVOID lpSecurityAttributes,
                                            ULONG dwCreationDisposition,
                                            ULONG dwFlagsAndAttributes,
                                            HANDLE hTemplateFile);

/////////////////////////////////////////////////////////////////////
////IsdFindFile
//
//目的：枚举目录
//
//参数：
//  hFile
//    [in] 目录句柄，由IsdCreateFile返回. 
//  lpFindFileData
//    [out] ISD_WIN32_FIND_DATA结构指针.
//  ReSet
//    [in] 重置.
//
//返回值：成功则返回TRUE.
//
//备注：它将系统API FindFirstFile、FindNextFile功能集合在一起：
//    1、ReSet为TRUE则从第一个文件从头枚举.
//    2、置ReSet为FALSE重复调用IsdFindFile则可枚举hFile所指目录的所
//       有文件，请看示例.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdFindFile(
                                            HANDLE hFile,
                                            PISD_WIN32_FIND_DATA lpFindFileData,
                                            BOOL ReSet);

/////////////////////////////////////////////////////////////////////
////IsdCloseHandle
//
//目的：关闭句柄
//
//参数：
//  hFile 
//    [in] 文件或目录句柄. 
//
//返回值：成功则返回TRUE.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdCloseHandle(HANDLE hFile);

/////////////////////////////////////////////////////////////////////
////IsdReadFile
//
//目的：读文件
//
//参数：
//  hFile
//    [in] 文件句柄. 
//  lpBuffer
//    [out] 读缓冲.
//  nNumberOfBytesToRead
//    [in] 需要读取的大小.
//  lpNumberOfBytesRead
//    [out] 成功后返回实际读取大小.
//  lpOverlapped
//    [in] 始终为NULL.
//
//返回值：成功则返回TRUE.
//
//备注：它是系统API ReadFile的子集，使用上差不多，需要注意的是：
//    1、lpOverlapped不支持，应传入NULL.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdReadFile(
                                            HANDLE hFile,
                                            PVOID lpBuffer,
                                            ULONG nNumberOfBytesToRead,
                                            PULONG lpNumberOfBytesRead,
                                            LPOVERLAPPED lpOverlapped);

/////////////////////////////////////////////////////////////////////
////IsdWriteFile
//
//目的：读文件
//
//参数：
//  hFile
//    [in] 文件句柄. 
//  lpBuffer
//    [out] 写缓冲.
//  nNumberOfBytesToWrite
//    [in] 需要写入的大小.
//  lpNumberOfBytesWritten
//    [out] 成功后返回实际写入大小.
//  lpOverlapped
//    [in] 始终为NULL.
//
//返回值：成功则返回TRUE.
//
//备注：它是系统API WriteFile的子集，使用上差不多，需要注意的是：
//    1、lpOverlapped不支持，应传入NULL.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdWriteFile(
                                            HANDLE hFile,
                                            PVOID lpBuffer,
                                            ULONG nNumberOfBytesToWrite,
                                            PULONG lpNumberOfBytesWritten,
                                            LPOVERLAPPED lpOverlapped);

/////////////////////////////////////////////////////////////////////
////IsdSetFilePointerEx
//
//目的：设置打开文件的指针位置
//
//备注：它与系统API SetFilePointerEx用法相同，不赘述.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdSetFilePointerEx(
                                            HANDLE hFile,
                                            LARGE_INTEGER liDistanceToMove,
                                            PLARGE_INTEGER lpNewFilePointer,
                                            ULONG dwMoveMethod);

/////////////////////////////////////////////////////////////////////
////IsdGetFileSizeEx
//
//目的：设置打开文件的指针位置
//
//备注：它与系统API GetFileSizeEx用法相同，不赘述.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdGetFileSizeEx(
                                            HANDLE hFile,
                                            PLARGE_INTEGER lpFileSize);

/////////////////////////////////////////////////////////////////////
////IsdGetFileTime
//
//目的：设置打开文件的指针位置
//
//备注：它与系统API GetFileTime用法相同，不赘述.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdGetFileTime(
                                            HANDLE hFile,
                                            LPFILETIME lpCreationTime,
                                            LPFILETIME lpLastAccessTime,
                                            LPFILETIME lpLastWriteTime);

/////////////////////////////////////////////////////////////////////
////IsdSetFileTime
//
//目的：设置打开文件的指针位置
//
//备注：它与系统API SetFileTime用法相同，不赘述，但注意这个函数3个指
//      针都不能为空.
/////////////////////////////////////////////////////////////////////
extern "C" __declspec(dllimport) BOOL IsdSetFileTime(
                                            HANDLE hFile,
                                            const FILETIME *lpCreationTime,
                                            const FILETIME *lpLastAccessTime,
                                            const FILETIME *lpLastWriteTime);

extern "C" __declspec(dllimport) LONG IsdSetInformationFile(
                                            HANDLE hFile,
                                            PVOID  FileInformation,
                                            ULONG  Length,
                                            FILE_INFORMATION_CLASS  FileInformationClass);

extern "C" __declspec(dllimport) LONG IsdQueryInformationFile(
                                            HANDLE hFile,
                                            PVOID  FileInformation,
                                            ULONG  Length,
                                            FILE_INFORMATION_CLASS  FileInformationClass);

extern "C" __declspec(dllimport) INT IsdReadProcessMemory(
                                            DWORD pid, 
                                            PVOID BaseAddress, 
                                            PVOID Buf, 
                                            UINT Len);

extern "C" __declspec(dllimport) INT IsdWriteProcessMemory(
                                            DWORD pid, 
                                            PVOID BaseAddress, 
                                            PVOID Buf, 
                                            UINT Len);

//
////使用IsdOpenKey打开的句柄也应使用IsdCloseHandle关闭。对注册表 协件dll中暂时只导出这几个，见谅:)
////使用上比较麻烦，参考例子
//
extern "C" __declspec(dllimport) BOOL IsdOpenKey(
                                            OUT PHANDLE KeyHandle,
                                            IN ACCESS_MASK DesiredAccess,
                                            IN HANDLE RootDirectory,
                                            IN PWCHAR KeyName);

extern "C" __declspec(dllimport) NTSTATUS IsdEnumerateKey(
                                            IN HANDLE KeyHandle,
                                            IN ULONG Index,
                                            IN KEY_INFORMATION_CLASS KeyInformationClass,
                                            OUT PVOID KeyInformation,
                                            IN ULONG Length,
                                            IN PULONG ResultLength);

extern "C" __declspec(dllimport) NTSTATUS IsdEnumerateValueKey(
                                            IN HANDLE KeyHandle,
                                            IN ULONG Index,
                                            IN KEY_VALUE_INFORMATION_CLASS KeyInformationClass,
                                            OUT PVOID KeyInformation,
                                            IN ULONG Length,
                                            IN PULONG ResultLength);

#endif
