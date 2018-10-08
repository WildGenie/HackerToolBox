/*
 *	
 */
#ifndef _SHARE_INTEFACE_H_
#define _SHARE_INTEFACE_H_

#include "windows.h"
#define  MAX_REGISTER_INFO_NUMBER  15

// {在调用SDK之前需取得与壳通信的窗口句柄，本单元initialization部分已经调用该函数}

typedef struct _TUserRecord
{
    int Bz ;
    int ValueSize;
    void * ValueBuf;
    int PassSize;
    void * PassBuf;
}TUserRecord, *PTUserRecord ;

void GetRegisterHandle(HINSTANCE hInstance);
/***********  GetRegisterInfo
 *	取得共15条注册相关信息，按INDEX值：
 *  0是否注册(Y/N)，
 *  1机器信息，
 *  2注册用户，
 *  3注册信息，
 *  4软件名称（注册窗口标题）
 *  5本次已运行多少分钟，
 *  6每隔多少分钟要求注册，
 *  7每次限制运行多少分钟
 *  8第一次在本机使用软件的日期，格式YYYYMMDD，
 *  9限制试用日期，格式YYYYMMDD
 *  10限制试用天数，
 *  11已运行次数，
 *  12限制试用次数，
 *  13加壳时设置的特征整数值，14为保护密码的EPEHash值，可依此二者判断是否破解版
 *  函数返回指定项，同时全部保存在RegisterStrings中
 *****************************************************************************/
char * GetRegisterInfo(unsigned int  Integer = 0);

/*************************** GetRegisterUser
 *  取得注册用户名称，
 *  未注册则为空，
 *  GetRegisterInfo(2)可能未注册也有值
 *****************************************************************************/
char * GetRegisterUser();

/*************************** ShowRegisterForm
 * 显示注册窗口
 ****************************************************************************/
BOOL ShowRegisterForm();

/***************************** KillProcess
 *  在EncryptPE加密程序运行过程中不允许ProcessName指定的进程（不含.EXE）运行，
 *  多  个进程则多次调用该函数，或者用逗号隔开多个进程名
 ***************************************************************************/
BOOL KillProcess(char* pszProcessName) ;

/***************************** NotKillProcess
 *  取消截杀，见KillProcess
 ***************************************************************************/
BOOL NotKillProcess(char *pszProcessName);
/***************************** KillDLL
 *  设置加壳进程中不允许加载的模块名，可以以逗号隔开多个模块名
 ***************************************************************************/
BOOL KillDLL(char *pszDLLName);
/***************************** EPEHash
 *  获取指字字串的EPEHash值
 ***************************************************************************/
char * EPEHash(char *pszSourceString);
//让壳去执行被加壳程序的某个函数，这个函数必须能独立执行，且无参数无返回值。
//Address是函数真实地址与保护密码的HASH值前八位（不足八位则前补0）转换过来的数以及特征整数两次异或过的
bool RunFunction(DWORD Address);



//以下函数要求个人开发版以上


//获取加壳时设置的数据文件的内容，可以指定从第几个字节开始读取多长内容
void * GetSavedData(unsigned short From, unsigned short Len);
/***************************** SetRegisterInfo
 * 写入注册用户名、注册信息，与GetRegisterInfo配合可用于设计个性注册窗口
 ***************************************************************************/
BOOL SetRegisterInfo(char *pszUser,char *pszInfo);

/******************************** SetLanguage
 *	改变注册窗口的界面语言元素，pvLanguage指向内存(不含逗号和省略号)
 *  一个字节字符集，一个字节字体大小，字体名称＃0，字符串4＃0，字符串5＃0，......，字符串17＃0
 *  如一个字符串：#134#9'宋体'#0'警告'#0'出现未知错误'＃0......'取消(&C)'#0
 *  方便用户编写多语言程序
 * pvLuange -------> FontCharset     offset 0    1 byte
 *              ---> FontSize        offset 1    1 byte 
 *              ---> FontName        offset 2    strlen(FontName)
 *              ---> char * pInfo[14];
 *              4=警告          5=出现未知错误 6=提示
 *  7=与某些调试或监视程序冲突!
 *  8=正在退出系统...
 *  9=注册
 *  10=未注册
 *  11=注册
 *  12=已过期
 *  13=本机信息(&T):
 *  14=注册用户(&U):
 *  15=注册信息(&I):
 *  16=确定(&O)
 *  17=取消(&C)
 
 ****************************************************************************/
BOOL SetLanguage(void * pvLanguage);


/********************************* SetRegisterHint
 * 改变注册窗口的提示、网站主页、邮件地址等信息，PHint指向内存（不含逗号）:
 * 过期后输入框颜色转换成的字符串＃0，提示信息＃0，主页＃0，邮箱地址＃0
 * 如一个字符串：'$0000FF'#0'请注册本软件'#0'http://www.server.com'#0'mailto:someone@server.com'#0
 ***************************************************************************************************/
BOOL SetRegisterHint(void * pvPHint);

/************************ EPECaclResult
 * 按Index取值0至9分别对应操作如下：
 * '+ - * div mod and or xor shl shr'
 * 返   回 值为某一操作的结果值,+可用于个人开发版
 ************************************************************/
int EPECaclResult(int nValue1,int nValue2, BYTE Index);


//以下函数要求企业专业版以上

/***************** EPERandom
 *	返回范围在 >=0 且 < Value 的随机整数
 **********************************************/
int EPERandom(int nValue);


DWORD EPECustomValue(int Index);

//以下函数要求企业开发版以上

typedef enum  _WIN_OPERATION_CODE
{
    EPE_WIN_OPERATION_IS_WINDOW = 0,
    EPE_WIN_OPERATION_IS_WINDOW_VISIBLE,
    EPE_WIN_OPERATION_IS_ICONIC,
    EPE_WIN_OPERATION_IS_ZOOM,
    EPE_WIN_OPERATION_SHOW_WINDOW,
    EPE_WIN_OPERATION_HIDE_WINDOW,
    EPE_WIN_OPERATION_DISABLE_WINDOW,
    EPE_WIN_OPERATION_ENABLE_WINDOW,
    EPE_WIN_OPERATION_IS_WINDOW_ENABLE,
    EPE_WIN_OPERATION_CLOSE_WINDOW,
    EPE_WIN_OPERATION_DESTROY_WINDOW     
}WIN_OPERATION_CODE;

BOOL EPEWindowFunction(int Index , HWND aHwnd );


/*************************** EPEGetMem
 *  申请Size大小内存空间	
 **************************************************/
char *  EPEGetMem(int nSize);

/*************************** EPEFreeMem
 *  释放内存
 **************************************************/
BOOL EPEFreeMem(void * pBuf);

/*************************** EPEZeroMemory
 *  清空一段内存
 **************************************************/
BOOL EPEZeroMemory(void * pBuf, int nSize);

/*************************** EPEFillMemory
 *  填充一段内存区域
 **************************************************/
BOOL EPEFillMemory(void * pBuf ,int nSize , BYTE byFill);

/************************************ EPECopyMemory
 *  内存复制
 **************************************************************/
BOOL EPECopyMemory(void * pvDestination, void *pvSource, int nSize);
/************************** EPEMoveMemory
 *	内存移动
 *******************************************************************/
BOOL  EPEMoveMemory(void * pvDestination, void * pvSource , int nSize);
/********************************** EPESystemStr
 * 按Index取值0至5分别获得：
 * GetCurrentDirectory, GetWindowsDirectory, GetSystemDirectory,
 * GetTempPath, GetComputerName, GetUserName}
 **********************************************************/
 char * EPESystemStr(int nIndex);
 
/******************************** Compress
 *	内存数据压缩
 ***********************************************************************/
void  Compress(void *pvInBuf, int nInBytes, void *& pvOutBuf, int&   nOutBytes , char *  pzPassword= NULL);
/******************************* Decompress
 *	压缩后的数据解压缩
 ****************************************************************/
 void  Decompress(void * pvInBuf, int nInBytes, void* &pvOutBuf, 
 int &  nOutBytes, char *pzPassword= NULL, int nOutEstimate = 0);

/******************************* StringCompress
 *	字符串压缩生成新的字符串
 ******************************************************************/
char * StringCompress(char *pszSourceString ,char * pszPassword= NULL, BOOL bHFlag = TRUE);

/********************************* StringDecompress
 *	将压缩生成的字符串解压缩还原成原字符串
 ******************************************************************/

char * StringDecompress(char *pszSourceString, char *pszPassword= NULL, BOOL bHFlag = TRUE);
/******************************************** Encrypt
 *	 对内存中的一段数据进行加密
 ********************************************************************/
void  Encrypt(void * pvInBuf , int nInBytes,void * *pvOutBuf, int & nOutBytes,  char *pszPassword= NULL);

/******************** Decrypt
 * 对已加密数据进行解密	
 *************************************************************************/

void Decrypt(void *pvInBuf , int nInBytes, void* *pvPointer, int& nOutBytes,  char * pszPassword );

/*************************************** StringEncrypt
 *对字符串进行加密生成新的字符串
 **************************************************************************/
char * StringEncrypt(char* pszSourceString,  char *pszPassword= NULL, BOOL bHFlag = TRUE);
/************************************* StringDecrypt
 * 将加密生成的字符串解密还原成原字符串
 ********************************************************************************/
char * StringDecrypt(char* pszSourceString , char * pszPassword= NULL,BOOL bHFlag = TRUE);

#endif