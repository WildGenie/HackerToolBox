#include "stdafx.h"
#include "ShareI.h"

//the macro only is used in the example ,
//you do not need to modify code , only to mark the macro is ok during developing
#ifdef OutputDebugString
#undef OutputDebugString
#define  OutputDebugString  DebugStringOutPut
#endif


void Test_GetRegisterHandle()
{
    OutputDebugString("=====================> GetRegisterHandle ");
    GetRegisterHandle();   
}
void Test_GetRegisterInfo()
{
    OutputDebugString("=====================> GetRegisterInfo ");
    char *pTemp = NULL;
    for(int i = 0 ; i < MAX_REGISTER_INFO_NUMBER ;i ++)
    {
        pTemp = GetRegisterInfo(i);
        OutputDebugString("Info :");
        OutputDebugString(pTemp);
    }
}
void Test_GetRegisterUser()
{
    OutputDebugString("=====================> GetRegisterUser ");
    OutputDebugString("INFO");
    OutputDebugString(GetRegisterUser());
}
 
void Test_ShowRegisterForm()
{
    OutputDebugString("=====================> ShowRegisterForm ");
    ShowRegisterForm();
}
void Test_KillProcess()
{
    OutputDebugString("=====================> KillProcess "); 
    /*
    char szFileName[MAX_PATH];
    GetModuleFileName (NULL,szFileName,MAX_PATH);
    char szDrive[16];
    char szPath[MAX_PATH];
    char szFile[64];
    char szExt[16];
    _splitpath(szFileName,szDrive,szPath,szFile,szExt);
    */
    //lang wang tell me that the function can not kill itself
    OutputDebugString("INFO : To Kill Process is : notepad");
    KillProcess("notepad");
}
void Test_NotKillProcess()
{
    OutputDebugString("=====================> NotKillProcess "); 
    OutputDebugString("INFO : Do Not To Kill Process is : notepad");
    NotKillProcess("notepad");
}
void Test_SetRegisterInfo()
{
    OutputDebugString("=====================> SetRegisterInfo "); 
    BOOL bRet = SetRegisterInfo("vingo","vingo@zch");
    OutputDebugString("INFO : reture value is :");
    char *pTemp = NULL;
    if(bRet)
        pTemp = "TRUE" ;
    else
        pTemp = "FALSE";
    OutputDebugString(pTemp);
    ShowRegisterForm();
    
}
void Test_SetLanguage()
{
    OutputDebugString("=====================> SetLanguage "); 
    struct  Set_Language {
        char FontCharset ;
        char FontSize ;
        char *pInfo[15];
    };
    struct Set_Language SetLang =
    {
        1,                  //FontCharset
        18                 //FontSize
        , "宋体"   //字体名称
        ,"警告a"   //警告信息
        ,"未知错误a" // 未知错误提示信息
        ,"提示a"   //提示信息
        ,"调试程序冲突" 
        ,"正在退出系统的信息" 
        ,"注册" 
        ,"未注册" 
        ,"注册" 
        ,"已过期" 
        ,"本机信息" 
        ,"注册用户" 
        ,"注册信息" 
        ,"确定" 
        ,"取消" 
    };
    char szSetLang[256];
    memset(szSetLang,0x00,sizeof(szSetLang) );
    szSetLang[0] = SetLang.FontCharset ;
    szSetLang[1] ; SetLang.FontSize;
    int nIndex = 2;
    for(int i =0 ; i < 15 ; i ++)
    {
        strcat(&szSetLang[nIndex] , SetLang.pInfo[i]);
        nIndex = strlen(szSetLang) + 1;
    }
    if(SetLanguage(szSetLang) == TRUE)
    {
        OutputDebugString("INFO : Set Language Success... ...");
        ShowRegisterForm();
    }
    else
    {
        OutputDebugString("INFO : Set Language Failed... ...");
    }
}
void Test_SetRegisterHint()
{
    OutputDebugString("=====================> SetRegisterHint "); 
#define  HIT_INFO_NUMBER  4
    struct Set_Hint {
        char *szHint[HIT_INFO_NUMBER];
    };

    struct Set_Hint  SetHit =
    {
        "0000FF"
        ,"请注册本软件"
        ,"http://www.server.com"
        ,"mailto:someone@server.com"
    };

    char szHitInfo[256]; 
    int nIndex = 0;
    memset(szHitInfo,0x00,sizeof(szHitInfo));
    for(int i =0 ; i < HIT_INFO_NUMBER ; i ++)
    {
        strcat(&szHitInfo[nIndex] , SetHit.szHint[i]);
        nIndex = strlen(szHitInfo) + 1;
    }
    
    if(SetRegisterHint(szHitInfo) == TRUE)
    {
        OutputDebugString("INFO : Set SetRegisterHint Success... ...");
        ShowRegisterForm();
    }
    else
    {
        OutputDebugString("INFO : Set SetRegisterHint Failed... ...");
    }
}

/************************ EPECaclResult
 * 按Index取值0至9分别对应操作如下：
 * '+ - * div mod and or xor shl shr'
 * 返   回 值为某一操作的结果值,+可用于个人开发版
 ************************************************************/
int EPECaclResult(int nValue1,int nValue2, BYTE Index);

void Test_EPECaclResult()
{
    OutputDebugString("=====================> EPECaclResult"); 
    char *szInfo[] =
    {
        "+",
        "-" ,
        "*" ,
        "div",
        "mod",
        "and",
        "or",
        "xor",
        "shl",
        "shr"
    };
    char szTemp[64];
    int  a1 = 88 , a2 = 2;
    for(BYTE i =0 ; i < 10 ;i ++)
    {
        sprintf(szTemp,"%d  %s  %d ==  %d",a1,szInfo[i],a2,EPECaclResult(a1,a2,(BYTE)i));
        //OutputDebugString("INFO :");
        OutputDebugString(szTemp);
    }
    
}

void Test_EPERandom()
{
    OutputDebugString("=====================> EPERandom");
    int nMax = 100 ;
    char szTemp[64];
    sprintf(szTemp,"Max Number is %d , and EPERandom return is = %d",nMax,EPERandom(nMax));
    OutputDebugString("INFO :");
    OutputDebugString(szTemp);    
}

void Test_EPECustomValue()
{
    OutputDebugString("=====================> EPECustomValue");
    char szTemp[64];
    for(int i = 0 ; i <= 9 ; i++)
    {
        sprintf(szTemp,"Index Number is %d , and EPECustomValue return is = 0x%0.8x",i,(unsigned int)EPECustomValue(i));
        //OutputDebugString("INFO :");
        OutputDebugString(szTemp);  
    }
}

void Test_EPEWindowFunction()
{
    OutputDebugString("=====================> EPEWindowFunction");
    //enum WIN_OPERATION_CODE epeOp ;
    //EPEWindowFunction(epeOp, HWND);
    OutputDebugString("INFO : Do not test this function");
}
void Test_EPEGetMem()
{
    OutputDebugString("=====================> EPEGetMem");
    int nMemSize = 1024 * 1 ;
    char *pTemp = EPEGetMem(nMemSize);
    //if(IsBadStringPtr(pTemp,nMemSize) == FALSE)
    {
    //    OutputDebugString("INFO : Alloc Failed... ...");
    }
    //else
    if(pTemp != NULL)
    {
        OutputDebugString("INFO : Alloc Success... ...");
        OutputDebugString("INFO : Free the Memory ... ...");
        if(EPEFreeMem(pTemp) == TRUE)
        {
            OutputDebugString("INFO : Free the Memory success ... ...");
        }
        else
        {
            OutputDebugString("INFO : Free the Memory failed ... ...");
        }
    }
}
void Test_EPEZeroMemory()
{
    OutputDebugString("=====================> EPEZeroMemory");
    int nMemSize = 1024 * 1024 ;
    char *pTemp = EPEGetMem(nMemSize);
    //if(IsBadStringPtr(pTemp,nMemSize) == FALSE)
    //{
    //    OutputDebugString("INFO : Alloc Failed... ...");
    //}
    //else
    if(pTemp != NULL)
    {
        if(EPEZeroMemory(pTemp, nMemSize) == TRUE)
        {
            OutputDebugString("INFO : EPEZeroMemory Success... ...");
        }
        else
        {
            OutputDebugString("INFO : EPEZeroMemory Failed... ...");
        }
        EPEFreeMem(pTemp);
    }
}
void Test_EPEFillMemory()
{
    OutputDebugString("=====================> EPEFillMemory");
    int nMemSize = 1024 * 1024 ;
    char *pTemp = EPEGetMem(nMemSize);
    //if(IsBadStringPtr(pTemp,nMemSize) == FALSE)
    //{
    //    OutputDebugString("INFO : Alloc Failed... ...");
    //}
    //else
    if(pTemp != NULL)
    {
        if(EPEFillMemory(pTemp, nMemSize,0xff) == TRUE)
        {
            OutputDebugString("INFO : EPEFillMemory Success... ...");
        }
        else
        {
            OutputDebugString("INFO : EPEFillMemory Failed... ...");
        }
        EPEFreeMem(pTemp);
    }
}
void Test_EPECopyMemory()
{
    OutputDebugString("=====================> EPECopyMemory");
    int nMemSize = 1024 * 1024 ;
    char *pSource = "This is vingo@zch";
    char *pTemp = EPEGetMem(nMemSize);
    //if(IsBadStringPtr(pTemp,nMemSize) == FALSE)
    //{
    //    OutputDebugString("INFO : Alloc Failed... ...");
    //}
    //else
    if(pTemp != NULL)
    {
        if(EPECopyMemory(pTemp, pSource,nMemSize) == TRUE)
        {
            OutputDebugString("INFO : EPECopyMemory Success... ...");
        }
        else
        {
            OutputDebugString("INFO : EPECopyMemory Failed... ...");
        }
        EPEFreeMem(pTemp);
    }
}
void Test_EPEMoveMemory()
{
    OutputDebugString("=====================> EPEMoveMemory");
    int nMemSize = 1024 * 1024 ;
    char *pSource = "This is vingo@zch";
    char *pTemp = EPEGetMem(nMemSize);
    //if(IsBadStringPtr(pTemp,nMemSize) == FALSE)
    //{
    //    OutputDebugString("INFO : Alloc Failed... ...");
    //}
    //else
    if(pTemp != NULL)
    {
        if(EPEMoveMemory(pTemp, pSource,nMemSize) == TRUE)
        {
            OutputDebugString("INFO : EPEMoveMemory Success... ...");
        }
        else
        {
            OutputDebugString("INFO : EPEMoveMemory Failed... ...");
        }
        EPEFreeMem(pTemp);
    }
}
void Test_EPESystemStr()
{
    OutputDebugString("=====================> EPESystemStr");
    char szTemp[1024];
    for(int i = 0 ; i <= 5 ; i ++)
    {
        char *pRet = EPESystemStr(i);
        sprintf(szTemp,"Index = %d , and EPESystemStr = %s",i , pRet);
        OutputDebugString(szTemp);
    }

}
void Test_Compress()
{
    OutputDebugString("=====================> Compress");
    char *pIn ="This is vingo@zh";
    void *pOut  ;
    int nOutByte = 0;
    char szTemp[1024];
    
    Compress(pIn,strlen(pIn),pOut,nOutByte,"vingo@zch");
    if ((pOut == NULL) ||  (nOutByte == 0))
    {
        OutputDebugString("INFO : Compress Operation failed... ...");
        return ;
    }
    sprintf(szTemp,"Souce string is : '%s' , Result string is : '%s', and Result Length is : %d",pIn, pOut, nOutByte);
    OutputDebugString(szTemp);
    if(pOut != NULL)
    {
        delete [] pOut ;
        pOut = NULL;
    }
}
void Test_Decompress()
{
    OutputDebugString("=====================> Decompress");
    char *pIn ="This is vingo@zch";
    void *pOut =NULL , *pDecRet = NULL;
    int nOutByte = 0 , nDecOutByte = 0;
    char szTemp[1024];
    //char *pszPass ="vingo@zch";
    char *pszPass = NULL;
    //OutputDebugString("Begin to compress ... ...");
    Compress(pIn,strlen(pIn),pOut,nOutByte,pszPass);
    if((pOut == NULL) ||(nOutByte == 0))
    {
        OutputDebugString("INFO : Compress Operation failed ,and nOutByte == 0 ... ...");
        return ;
    }
    else
    {
        sprintf(szTemp,"INFO : The compress result length is : %d",nOutByte);
        OutputDebugString(szTemp);
    }
    //sprintf(szTemp,"Compress Result Length is : %d",  nOutByte);
    //OutputDebugString(szTemp);
    //OutputDebugString("Begin to decompress ... ...");
    Decompress(pOut,nOutByte,pDecRet, nDecOutByte,pszPass);
    if((unsigned int)nDecOutByte == strlen(pIn))
    {
        OutputDebugString("INFO : Decompress ok");
    }
    else
    {
        sprintf(szTemp,"Decompress OutPut Length is :%d",nDecOutByte);
        OutputDebugString("INFO : Decompress failed , length is not matched");
        OutputDebugString(szTemp);
    }
    
    if((pDecRet == NULL) || (nDecOutByte == 0))
    {
        delete []pOut;
        pOut = NULL;
        //OutputDebugString("INFO : Decompress operation failed... ...");
        return ;
    }
   

    //sprintf(szTemp,"To Decompress string is : '%s' , Result string is : '%s', and Result Length is : %d",
    //    pOut, pDecRet, nDecOutByte);
    //OutputDebugString(szTemp);
    if(pOut != NULL)
    {
        delete [] pOut ;
        pOut = NULL;
    }
    if(pDecRet != NULL)
    {
        delete [] pDecRet;
        pDecRet = NULL;
    }    
}
void Test_StringCompress()
{
    OutputDebugString("=====================> StringCompress");
    char *pszSource = "This is vingo@zch";
    char *pszPass = "epe sdk";
    char *pszReture = StringCompress(pszSource,pszPass);
    char szTemp[1024];
    sprintf(szTemp,"The Souce string is :'%s' and the password is : '%s' and the result is : '%s'",pszSource,pszPass,pszReture);
    OutputDebugString(szTemp);
    if(pszReture != NULL)
    {
        delete [] pszReture;
        pszReture = NULL;
    }
}
void Test_StringDecompress()
{
    OutputDebugString("=====================> StringDecompress");
    char *pszSource = "This is vingo@zch";
    char *pszPass = "epe sdk";
    char *pszReture = StringCompress(pszSource,pszPass);
    char szTemp[1024];
    sprintf(szTemp,"The Souce string is :'%s' and the password is : '%s' and the result is : '%s'",
        pszSource,pszPass,pszReture);
    OutputDebugString(szTemp);
    char *pszDecRet = StringDecompress(pszReture,pszPass);
    sprintf(szTemp,"The Decompress string is :'%s' and the password is : '%s' and the result is : '%s'",
            pszReture,pszPass,pszDecRet);
    OutputDebugString(szTemp);
    if(pszReture != NULL)
    {
        delete [] pszReture;
        pszReture = NULL;
    }
    if(pszDecRet != NULL)
    {
        delete [] pszDecRet;
        pszDecRet = NULL;
    }
}
void Test_Encrypt()
{
    OutputDebugString("=====================> Encrypt");
    char *pvInBuf = "This is vingo@zch";
    char *pvOutBuf ;
    int nOutByte = 0;
    char *pszPass ="epe sdk";
    char szTemp[1024];
    Encrypt(pvInBuf,strlen(pvInBuf),(void **)&pvOutBuf,nOutByte,pszPass);
    sprintf(szTemp,"The Source string is '%s' ,the password is : '%s' , encrypt result is '%s' , the encrypt result lenght is :%d",
        pvInBuf,pszPass,pvOutBuf,nOutByte);
    OutputDebugString(szTemp);
    if(pvOutBuf != NULL)
    {
        delete [] pvOutBuf ;
        pvOutBuf = NULL;
    }

}
void Test_Decrypt()
{
    OutputDebugString("=====================> Decrypt");
    char *pvInBuf = "This is vingo@zch";
    char *pvOutBuf,*pvDecRet ;
    int nOutByte = 0 , nDecOutByte = 0;
    char *pszPass ="epe sdk";
    //char szTemp[1024];
    Encrypt(pvInBuf,strlen(pvInBuf),(void **)&pvOutBuf,nOutByte,pszPass);
    //sprintf(szTemp,"The Source string is '%s' ,the password is : '%s' , encrypt result is '%s' ,the encrypt result length is :%d",
    //    pvInBuf,pszPass,pvOutBuf,nOutByte);
    //OutputDebugString(szTemp);
    Decrypt(pvOutBuf,nOutByte,(void **)&pvDecRet, nDecOutByte,pszPass);

    //sprintf(szTemp,"The Decrypt string is '%s' ,the password is : '%s' , Decrypt result is '%s'",
    //    pvOutBuf,pszPass,pvDecRet);
    //OutputDebugString(szTemp);
    if((unsigned int)nDecOutByte == strlen(pvInBuf))
    {
        OutputDebugString("INFO : Decrypt Success... ...");
    }
    else
    {
        OutputDebugString("INFO : Decrypt Failed... ...");
    }
    if(pvOutBuf != NULL)
    {
        delete [] pvOutBuf ;
        pvOutBuf = NULL;
    }
    if(pvDecRet != NULL)
    {
        delete [] pvDecRet;
        pvDecRet = NULL;
    }
}
void Test_StringEncrypt()
{
    OutputDebugString("=====================> StringEncrypt");
    char *szSource = "This is vingo";
    char *szPass = "EPE";
    char *pResult = StringEncrypt(szSource,szPass);
    char szTemp[216];
    sprintf(szTemp,"To be Encrypt string is : '%s' , password is : '%s' ,the Encrypt result is :'%s'",szSource,szPass,pResult);
    OutputDebugString(szTemp);
    if(pResult != NULL)
    {
        delete [] pResult ;
        pResult = NULL;
    }
}

void Test_StringDecrypt()
{
    OutputDebugString("=====================> StringEncrypt");
    char *szSource = "This is vingo";
    char *szPass = "EPE";
    char *pResult = StringEncrypt(szSource,szPass);
    char *pDecrypt = StringDecrypt(pResult,szPass);
    char szTemp[216];
    sprintf(szTemp,"To be Encrypt string is : '%s' , password is : '%s' ,the  Encrypt result is :'%s' , and decrypt result is : '%s'",
        szSource,szPass,pResult,pDecrypt);
    OutputDebugString(szTemp);    
    if(pResult == NULL)
    {
        delete [] pResult;
        pResult = NULL;
    }
}