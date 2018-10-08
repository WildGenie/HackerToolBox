// EncryptPE.cpp : Defines the entry point for the application.
//

#include <windows.h>
#include <stdlib.h>
#include <malloc.h>

HWND RegisterHandle = NULL;
char RegisterStrings[4096];
char Result[4096];
char item[1024];
extern HWND hDlg;
typedef struct _UserRecord
{
    int Bz;
    int ValueSize;
    int ValueBuf;
    int PassSize;
    int PassBuf;
}UserRecord, * PUserRecord;

UserRecord UR;
PUserRecord P;


//////////////////////////////////////////////////////////
// 函数原型

// 在调用 SDK 之前需取得与壳通信的窗口句柄，
// 一般在在主程序的初始化完成后调用此函数
void GetRegisterHandle(HINSTANCE hInstance);

// 取得共 15 条注册相关信息，按INDEX值：
// 0 是否注册(Y/N)，
// 1 机器信息，
// 2 注册用户，
// 3 注册信息，
// 4 软件名称（注册窗口标题）
// 5 本次已运行多少分钟，
// 6 每隔多少分钟要求注册，
// 7 每次限制运行多少分钟
// 8 第一次在本机使用软件的日期，格式YYYYMMDD，
// 9 限制试用日期，格式YYYYMMDD
// 10 限制试用天数，
// 11 已运行次数，
// 12 限制试用次数，
// 13 加壳时设置的特征整数值，14为保护密码的EPEHash值，可依此二者判断是否破解版
// 函数返回指定项，同时全部保存在 RegisterStrings 中
char * GetRegisterInfo(UINT Index);

// 取得注册用户名称，未注册则为空，GetRegisterInfo(2)可能未注册也有值
char * GetRegisterUser();

// 显示注册窗口
BOOL ShowRegisterForm();

// 在EncryptPE加密程序运行过程中不允许ProcessName指定的进程（不含.EXE）运行，
// 多个进程则多次调用该函数，或者用逗号隔开多个进程名
BOOL KillProcess(char * ProcessName);

// 取消截杀，见 KillProcess
BOOL NotKillProcess(char *ProcessName);

// 设置加壳进程中不允许加载的模块名，可以以逗号隔开多个模块名
bool KillDLL(char *DLLName);

// 获取指字字串的EPEHash值
char * EPEHash(char *SourceString);
//让壳去执行被加壳程序的某个函数，这个函数必须能独立执行，且无参数无返回值。
//Address是函数真实地址与保护密码的HASH值前八位（不足八位则前补0）转换过来的数以及特征整数两次异或过的
bool RunFunction(DWORD Address);

////////////////////////////////////////////////////////////////////
//以下函数要求个人开发版以上
////////////////////////////////////////////////////////////////////

//获取加壳时设置的数据文件的内容，可以指定从第几个字节开始读取多长内容
void * GetSavedData(unsigned short From, unsigned short Len);

// 写入注册用户名、注册信息，与 GetRegisterInfo 配合可用于设计个性注册窗口
BOOL WINAPI SetRegisterInfo(char *User, char *Info);

// 改变注册窜口的界面语言元素，PLanguage 指向内存（不含逗号和省略号）：
// 一个字节字符集，一个字节字体大小，字体名称＃0，字符串4＃0，字符串5＃0，......，字符串17＃0
// 如一个字符串：#134#9'宋体'#0'警告'#0'出现未知错误'＃0......'取消(&C)'#0
// 方便用户编写多语言程序
BOOL SetLanguage(DWORD PLanguage);

// 改变注册窗口的提示、网站主页、邮件地址等信息，PHint指向内存（不含逗号）:
// 过期后输入框颜色转换成的字符串＃0，提示信息＃0，主页＃0，邮箱地址＃0
// 如一个字符串：'$0000FF'#0'请注册本软件'#0'http://www.server.com'#0'mailto:someone@server.com'#0}
BOOL SetRegisterHint(int PHint);

// 按Index取值0至9分别对应操作如下：
// + - * div mod and or xor shl shr
// 返回值为某一操作的结果值,+可用于个人开发版
int EPECaclResult(int Value1, int Value2, char Index);

///////////////////////////////////////////////////
//以下函数要求企业专业版以上
///////////////////////////////////////////////////

// 返回范围在 >=0 且 < Value 的随机整数
int EPERandom(int Value);

// 按Index取值0至9分别返回：
// 系统版本VER_PLATFORM_WIN32S(0) VER_PLATFORM_WIN32_WINDOWS(1) VER_PLATFORM_WIN32_NT(2),
// GetTickCount, GetCurrentProcess, GetCurrentProcessID, GetCurrentThread, GetCurrentThreadID,
// GetActiveWindow, GetFocus, GetForegroundWindow, GetDesktopWindow
WORD EPECustomValue(int Index);


//////////////////////////////////////////////////////
//以下函数要求企业开发版以上
//////////////////////////////////////////////////////

// 按Index取值0至9对窗口句柄aHwnd执行相关WINDOW函数判断结果：
// IsWindow, IsWindowVisible, IsIconic, IsZoomed, 显示窗口, 隐藏窗口,
// 使窗口能与用户交互, 使窗口不能与用户交互, IsWindowEnabled, CloseWindow, DestroyWindow
BOOL EPEWindowFunction(int Index, HWND aHwnd);

// 申请Size大小内存空间
DWORD EPEGetMem(int Size);

// 释放内存
BOOL EPEFreeMem(DWORD Buf);

// 清空一段内存
BOOL EPEZeroMemory(DWORD Buf, int Size);

// 以Fill字节值填充一段内存
BOOL EPEFillMemory(DWORD Buf,int Size,char Fill);

// 内存复制
BOOL EPECopyMemory(DWORD Destination, DWORD Source,int Size);

// 内存移动
BOOL EPEMoveMemory(DWORD Destination, DWORD Source,int Size);

// 按Index取值0至5分别获得：
// GetCurrentDirectory, GetWindowsDirectory, GetSystemDirectory,
// GetTempPath, GetComputerName, GetUserName
char * EPESystemStr(int Index);

// 内存数据压缩
void WINAPI Compress(int InBuf,int InBytes,int OutBuf,int * OutBytes, char * Password);

// 压缩后的数据解压缩
void Decompress(int InBuf,int InBytes,int OutBuf,int * OutBytes,char * Password,int OutEstimate);

// 字符串压缩生成新的字符串
char * StringCompress(char * SourceString,char * Password,BOOL HFlag);

// 将压缩生成的字符串解压缩还原成原字符串
char * StringDecompress(char *SourceString,char * Password,BOOL HFlag);

// 对一段内存数据进行加密
void Encrypt(int InBuf,int InBytes,int OutBuf,int * OutBytes,char * Password);

// 对已加密数据进行解密
void Decrypt(int InBuf,int InBytes,int OutBuf,int * OutBytes,char * Password);

// 对字符串进行加密生成新的字符串
char * StringEncrypt(char *SourceString,char * Password,BOOL HFlag);

// 将加密生成的字符串解密还原成原字符串
char * StringDecrypt(char *SourceString,char * Password,BOOL HFlag);


// 内部使用函数
BOOL IsLibrary(HINSTANCE hInstance);

void GetRegisterHandle(HINSTANCE hInstance)
{
	P = &UR;
	char TempStr[MAX_PATH];
	unsigned int i;
	HANDLE hFileMap;
	HANDLE TempP;
	RegisterHandle = 0;
	GetModuleFileName(hInstance,TempStr,MAX_PATH);
	
	for(i=0;i<strlen(TempStr);i++)
	{
		if(TempStr[i]==92) TempStr[i]=47;
	}
	
	DWORD ccid = GetCurrentProcessId();
	char t[4096];
	wsprintf(t,"%s%s%08X",TempStr, "/" ,ccid);

	hFileMap = OpenFileMapping(FILE_MAP_WRITE, false, t);
	
	if (hFileMap > 0)
	{
		TempP = MapViewOfFile(hFileMap, FILE_MAP_WRITE, 0, 0, 0);

		if (TempP != NULL)
		{
			CopyMemory (&RegisterHandle, TempP, 4);
			UnmapViewOfFile(TempP);
		}
		CloseHandle(hFileMap);
		memset(RegisterStrings,0,4096);
	}
}

char * GetRegisterInfo(UINT Index = 0)
{
	memset(Result,0,4096);
	memset(item,0,1024);

	int s=sizeof(P);
	memset(P,0,s);

	char * Re= Result;
	int i, MessageResult;
	char msg[1024];
	wsprintf (msg,"%d",Index);

	if (Index == 0) 
	{
		wsprintf(Result,"%s","N");
	}

	if (Index == 4 && !IsLibrary(NULL)) 
	{
		GetWindowText(GetDlgItem(hDlg, IDD_APP), Result,4096);
	}

	if (!IsWindow(RegisterHandle)) return Result;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 0, 1);
		if (MessageResult != -1 && MessageResult != 0)
		{
			Re = (char *)MessageResult;
			strcpy(RegisterStrings,Re);
			int index2=0,pos=0;
			for(int j=0;j<strlen(RegisterStrings);j++)
			{
				if(RegisterStrings[j]==13 && RegisterStrings[j+1]==10)
				{
					if(index2==Index)
					{
						CopyMemory(&item,&RegisterStrings[pos],j-pos);
						return item;
					}
					else
					{
						index2=index2+1;
						pos = j+2;
					}
				}
			}
		}
	}
	return Re;
}

char * GetRegisterUser()
{
	if (IsWindow(RegisterHandle))
	{
		if (GetRegisterInfo() == "Y") 
		{
			int index2=0,pos=0;
			for(int j=0;j<strlen(RegisterStrings);j++)
			{
				if(RegisterStrings[j]==13 && RegisterStrings[j+1]==10)
				{
					if(index2==2)
					{
						CopyMemory(&item,&RegisterStrings[pos],j-pos);
						return item;
					}
					else
					{
						index2=index2+1;
						pos = j+2;
					}
				}
			}
		}
		else return "";
	}
	return "";
}

BOOL ShowRegisterForm()
{
	int s=sizeof(P);
	memset(P,0,s);

	int i, MessageResult;
	if (!IsWindow(RegisterHandle)) return false;
	
	for (i = 1 ;i<=100;i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 0, 0);
		if (MessageResult == 1) return true;
	}
	return false;
}

BOOL KillProcess(char * ProcessName)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (ProcessName[0] == 0 || !IsWindow(RegisterHandle)) return false;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 88, (long)ProcessName);
		if (MessageResult == 1) return true;
	}
	return false;
}

BOOL NotKillProcess(char *ProcessName)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (ProcessName[0] == 0 || ! IsWindow(RegisterHandle)) return false;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 89, (long)ProcessName);
		if (MessageResult == 1) return true;
	}
	return false;
}

BOOL KillDLL(char *DLLName)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (! IsWindow(RegisterHandle)) return false;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 90, (long)DLLName);
		if (MessageResult == 1) return true;
	}
	return false;
}

char * EPEHash(char* SourceString)
{
    int i ,MessageResult ;
    char *pszReturn = NULL;
    if (::IsWindow(RegisterHandle) == false)
    {
        return pszReturn;
    }
    for(i = 1 ; i <= 100 ; i ++)
    {
        MessageResult = ::SendMessage(RegisterHandle,WM_USER, 99,(LPARAM)(SourceString));
        if ((MessageResult != -1)  && (MessageResult != 0))
        {
            pszReturn = (char *)MessageResult;
            break;
        }
    }
    return pszReturn;
}

bool RunFunction(DWORD Address);
{
    int i ,MessageResult ;
    bool bReturn = false;
    if (::IsWindow(RegisterHandle) == false)
    {
        return bReturn;
    }
    for(i = 1 ; i <= 100 ; i ++)
    {
        MessageResult = ::SendMessage(RegisterHandle,WM_USER, 66,(LPARAM)(Address));
        if (MessageResult == 1)
        {
            bReturn = true;
            break;
        }
    }
    return bReturn;
}

void * GetSavedData(unsigned short From, unsigned short Len);
{
    int i ,MessageResult ;
    void * vReturn = NULL;
    if (::IsWindow(RegisterHandle) == false)
    {
        return pszReturn;
    }
    for(i = 1 ; i <= 100 ; i ++)
    {
        MessageResult = ::SendMessage(RegisterHandle,WM_USER, 77,From << 16 + Len);
        if ((MessageResult != -1)  && (MessageResult != 0))
        {
            vReturn = (void *)MessageResult;
            break;
        }
    }
    return vReturn;
}

bool SetLanguage(DWORD PLanguage)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	if (PLanguage==NULL || !IsWindow(RegisterHandle)) return false;
	
	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 1000, (int)PLanguage);
		if (MessageResult == 1) return true;
	}
	return false;
}

BOOL SetRegisterHint(int PHint)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (PHint==NULL || !IsWindow(RegisterHandle)) return FALSE;
	
	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 10000, PHint);
		if (MessageResult == 1) return TRUE;
	}
	return FALSE;
}

int EPECaclResult(int Value1, int Value2, char Index)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (!IsWindow(RegisterHandle))
		return 0;
	P->Bz = Index;
	P->ValueSize = Value1;
	P->PassSize = Value2;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 5, (long)P);
		if (MessageResult == 1) return P->ValueSize;
	}
	return 0;
}

int EPERandom(int Value)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i;
	
	int Result = 0;
	if (!IsWindow(RegisterHandle)) return 0;

	for (i = 1; i <= 100; i++)
	{
		Result = SendMessage(RegisterHandle, WM_USER, 15, Value);
		if (Result != -1) break;
	}
	return Result;
}

WORD EPECustomValue(int Index)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i;
	
	WORD Result = 0;
	if (Index < 0 || Index > 9 || ! IsWindow(RegisterHandle)) return 0;
	
	for (i = 1; i <= 100; i++)
	{
		Result = (WORD) SendMessage(RegisterHandle, WM_USER, 25, Index);
		if (Result != -1) break;
		else if (Index == 2) break;
	}
	return Result;
}

BOOL EPEWindowFunction(int Index, HWND aHwnd)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (Index < 0 || Index > 10 || !IsWindow(aHwnd) || !IsWindow(RegisterHandle)) return false;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, Index * 10 + 35, (WORD)aHwnd);
		if (MessageResult == 1) return true;
	}
	return false;
}

DWORD EPEGetMem(int Size)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (Size <= 0 || !IsWindow(RegisterHandle)) return NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 145, Size);
		if (MessageResult != -1 && MessageResult != 0) return (DWORD)MessageResult;
	}
	return NULL;
}

BOOL EPEFreeMem(DWORD Buf)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if ( Buf==NULL || !IsWindow(RegisterHandle)) return false;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 155, (int)Buf);
		if (MessageResult == 1) return true;
	}
	return false;
}

BOOL EPEZeroMemory(DWORD Buf, int Size)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (Buf==NULL || Size <= 0 || ! IsWindow(RegisterHandle)) return false;

	P->Bz = 0;
	P->ValueSize = Size;
	P->ValueBuf = Buf;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 165, (long)P);
		if (MessageResult == 1) return true;
	}
	return false;
}

BOOL EPEFillMemory(DWORD Buf,int Size,char Fill)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (Buf==NULL || Size <= 0 || !IsWindow(RegisterHandle))
		return false;
	P->Bz = 1;
	P->ValueSize = Size;
	P->ValueBuf = Buf;
	P->PassSize = Fill;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 165, (long)P);
		if (MessageResult == 1) return true;
	}
	return false;
}

BOOL EPECopyMemory(DWORD Destination, DWORD Source,int Size)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (Destination==NULL || Source==NULL || Size <= 0 || !IsWindow(RegisterHandle)) return false;

	P->Bz = 2;
	P->PassBuf = Destination;
	P->ValueBuf = Source;
	P->ValueSize = Size;
	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 165, (long)P);
		if (MessageResult == 1) return true;
	}
	return false;
}

BOOL EPEMoveMemory(DWORD Destination, DWORD Source,int Size)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (Destination==NULL || Source==NULL || Size <= 0 || !IsWindow(RegisterHandle)) return false;
	P->Bz = 3;
	P->PassBuf = Destination;
	P->ValueBuf = Source;
	P->ValueSize = Size;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 165, (long)P);
		if (MessageResult == 1) return true;
	}
	return false;
}

char * EPESystemStr(int Index)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (Index < 0 || Index > 5 || ! IsWindow(RegisterHandle)) return "";

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 175, Index);
		if (MessageResult != -1 && MessageResult != 0) return (char *)MessageResult;
	}
	return "";
}

BOOL WINAPI SetRegisterInfo(char *User, char *Info)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	if (!IsWindow(RegisterHandle)) return FALSE;

	P->Bz = 0xff;
	P->ValueSize = strlen(User);

	if (P->ValueSize > 0) P->ValueBuf = (int)User;
	else P->ValueBuf = NULL;

	P->PassSize = strlen(Info);

	if (P->PassSize > 0) P->PassBuf = (int)Info;
	else P->PassBuf = NULL;
	
	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 100, (long)P);
		if (MessageResult == 1) return TRUE;
	}
	return FALSE;

}

void WINAPI Compress(int InBuf,int InBytes,int OutBuf,int * OB, char * Password)
{
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	memset(P,0,sizeof(P));
	if ( InBuf==NULL || InBytes <= 0 || ! IsWindow(RegisterHandle)) return ;

	P->Bz = 0;
	P->ValueSize = InBytes;
	P->ValueBuf = (int)InBuf;
	P->PassSize = strlen(Password);
	if (Password!=NULL) P->PassBuf = (int)Password;
	else P->PassBuf = NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, (WPARAM)2147483647, (long)P);
		if (MessageResult == 1)
		{
			try
			{
				CopyMemory((void *)OutBuf, (void *)P->ValueBuf, P->ValueSize);
				*OB = P->ValueSize;
				return ;
			}
			catch(...)
			{
				return ;
			}
		}
	}
}

void Decompress(int InBuf,int InBytes,int OutBuf,int * OutBytes,char * Password,int OutEstimate = 0)
{

	int i, MessageResult;
	memset(P,0,sizeof(P));
	if ( InBuf==NULL || InBytes <= 0 || ! IsWindow(RegisterHandle))
		return;
	P->Bz = 1;
	P->ValueSize = InBytes;
	P->ValueBuf = (int)InBuf;
	P->PassSize = strlen(Password);

	if (Password!=NULL) P->PassBuf = (int)Password;
	else P->PassBuf = NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 2147483647, (long)P);
		if (MessageResult == 1)
		{
			try
			{
				*OutBytes = P->ValueSize;
				CopyMemory((void *)OutBuf, (void *)P->ValueBuf, P->ValueSize);
				return ;
			}
			catch(...)
			{
				return ;
			}
		}
	}
}

char * StringCompress(char *SourceString,char * Password,BOOL HFlag = true)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (SourceString[0] ==0 || ! IsWindow(RegisterHandle)) return "";

	if (HFlag) P->Bz = 10;
	else P->Bz = 20;
	P->ValueSize = strlen(SourceString);
	P->ValueBuf = *SourceString;
	P->PassSize = strlen(Password);
	
	if (Password!=NULL) P->PassBuf = (int)Password;
	else P->PassBuf = NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 2147483647, (long)P);
		if (MessageResult == 1)
		{
			try
			{
				//SetLength(Result, P->ValueSize);
				CopyMemory(&Result, &P->ValueBuf, P->ValueSize);
			}
			catch(...)
			{
				return "";
			}
		}
		return Result;
	}
	return "";
}

char * StringDecompress(char *SourceString,char * Password,BOOL HFlag= true)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (SourceString[0] = 0 || ! IsWindow(RegisterHandle)) return "";

	if (HFlag) P->Bz = 11;
	else P->Bz = 21;
	P->ValueSize = strlen(SourceString);
	P->ValueBuf = (int)SourceString;
	P->PassSize = strlen(Password);

	if (Password!=NULL) P->PassBuf = (int)Password;
	else P->PassBuf = NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 2147483647, (long)P);
		if (MessageResult == 1)
		{
			try
			{
				CopyMemory((void *)Result, &P->ValueBuf, P->ValueSize);
			}
			catch(...)
			{
				return "";
			}
		}
		return Result;
	}
	return "";
}

void Encrypt(int InBuf,int InBytes,int OutBuf,int * OutBytes,char * Password)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;

//	if ( InBuf==NULL || InBytes <= 0 || ! IsWindow(RegisterHandle)) return;
	P->Bz = 100;
	P->ValueSize = InBytes;
	P->ValueBuf = (int)InBuf;
	P->PassSize = strlen(Password);

	if (Password!=NULL) P->PassBuf = (int)Password;
	else P->PassBuf = NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, (WPARAM)2147483647, (long)P);
		if (MessageResult == 1)
		{
			try
			{
				//OutBuf = (int)malloc(P->ValueSize);
				CopyMemory((void *)OutBuf, (void *)P->ValueBuf, P->ValueSize);
				*OutBytes = P->ValueSize;
			}
			catch(...)
			{
				//			
			}
		}
		break;
	}
}

void Decrypt(int InBuf,int InBytes,int OutBuf,int * OutBytes,char * Password)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if ( InBuf==NULL || InBytes <= 0 || ! IsWindow(RegisterHandle)) return;

	P->Bz = 101;
	P->ValueSize = InBytes;
	P->ValueBuf = (int)InBuf;
	P->PassSize = strlen(Password);
	
	if (Password!=NULL) P->PassBuf = (int)Password;
	else P->PassBuf = NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, (WPARAM)2147483647, (long)P);
		
		if (MessageResult == 1)
		{
			try
			{
				//OutBuf = (int)malloc(P->ValueSize);
				CopyMemory((void *)OutBuf, (void *)P->ValueBuf, P->ValueSize);
				*OutBytes = P->ValueSize;
			}
			catch(...)
			{
				//
			}
		}
		break;
	}
}

char * StringEncrypt(char *SourceString,char * Password,BOOL HFlag = true)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (SourceString[0] == 0 || ! IsWindow(RegisterHandle)) return "";

	if (HFlag) P->Bz = 110;
	else P->Bz = 120;

	P->ValueSize = strlen(SourceString);
	P->ValueBuf = (int)SourceString;
	P->PassSize = strlen(Password);

	if (Password!=NULL) P->PassBuf = (int)Password;
	else P->PassBuf = NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 2147483647, (long)P);
		if (MessageResult == 1)
		{
			try
			{
				CopyMemory(&Result, &P->ValueBuf, P->ValueSize);
			}
			catch(...)
			{
				return "";
			}
		}
		return Result;
	}
	return "";
}

char * StringDecrypt(char *SourceString,char * Password,BOOL HFlag= true)
{
	
	int s=sizeof(P);
	memset(P,0,s);
	int i, MessageResult;
	
	if (SourceString[0] == 0 || ! IsWindow(RegisterHandle)) return "";

	if (HFlag) P->Bz = 111;
	else P->Bz = 121;
	P->ValueSize = strlen(SourceString);
	P->ValueBuf = (int)SourceString;
	P->PassSize = strlen(Password);

	if (Password!=NULL) P->PassBuf = (int)Password;
	else P->PassBuf = NULL;

	for (i = 1; i <= 100; i++)
	{
		MessageResult = SendMessage(RegisterHandle, WM_USER, 2147483647, (long)P);
		if (MessageResult == 1)
		{
			try
			{
				CopyMemory(&Result, &P->ValueBuf, P->ValueSize);
			}
			catch(...)
			{
				return "";
			}
		}
		return Result;
	}
	return "";
}

BOOL IsLibrary(HINSTANCE hInstance)
{
	char sPath[MAX_PATH];
	char * ss;
	char ext[MAX_PATH];
	
	GetModuleFileName(NULL,sPath,MAX_PATH);	
	ss=_strlwr(sPath);
	_splitpath( ss, NULL, NULL, NULL, ext );
	
    if(strcmp(ext,".dll")==0) return TRUE;
	else return FALSE;
}
