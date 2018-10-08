#ifndef _TEST_CONFIG_
#define _TEST_CONFIG_

//if you want to add some other function to test
//only modify testconfig.h and testconfig.cpp 


struct  TestItem {
    HTREEITEM  item;
    char *pstrFunName ;
    void (*  Func) ();
};


void Test_GetRegisterHandle ();
void Test_GetRegisterInfo();
void Test_GetRegisterUser ();
void Test_ShowRegisterForm();
void Test_KillProcess ();
void Test_NotKillProcess() ;
void Test_SetRegisterInfo ();
void Test_SetLanguage ();
void Test_SetRegisterHint() ;
void Test_EPECaclResult ();
void Test_EPERandom ();
void Test_EPECustomValue ();

void Test_EPEWindowFunction ();
void Test_EPEGetMem ();
void Test_EPEFreeMem ();
void Test_EPEZeroMemory();
void Test_EPEFillMemory();
void Test_EPECopyMemory();
void Test_EPEMoveMemory();
void Test_EPESystemStr();
void Test_Compress();
void Test_Decompress();
void Test_StringCompress();
void Test_StringDecompress();
void Test_Encrypt();
void Test_Decrypt();
void Test_StringEncrypt();
void Test_StringDecrypt();

TestItem   test_item[]  =
{
    {0,"GetRegisterHandle",Test_GetRegisterHandle},
    {0,"GetRegisterInfo",Test_GetRegisterInfo},
    {0,"GetRegisterUser",Test_GetRegisterUser },
    {0,"ShowRegisterForm",Test_ShowRegisterForm },
    {0,"KillProcess",Test_KillProcess    },
    {0,"NotKillProcess",Test_NotKillProcess    },
    {0,"SetRegisterInfo",Test_SetRegisterInfo    },
    {0,"SetLanguage",Test_SetLanguage    },
    {0,"SetRegisterHint",Test_SetRegisterHint    },
    {0,"EPECaclResult", Test_EPECaclResult    },
    {0,"EPERandom", Test_EPERandom    },
    {0,"EPECustomValue", Test_EPECustomValue    },
    {0,"EPEWindowFunction" ,Test_EPEWindowFunction    },
    {0,"EPEGetMem", Test_EPEGetMem    },
    //{0, "EPEFreeMem" ,Test_EPEFreeMem    },
    {0,"EPEZeroMemory", Test_EPEZeroMemory    },
    {0,"EPEFillMemory", Test_EPEFillMemory    },
    {0,"EPECopyMemory", Test_EPECopyMemory    },
    {0 , "EPEMoveMemory", Test_EPEMoveMemory    },
    {0,"EPESystemStr" ,Test_EPESystemStr    },
    //{0,"Compress" , Test_Compress    },
    {0,"Decompress", Test_Decompress    },
    //{0,"StringCompress",Test_StringCompress    },
    {0,"StringDecompress", Test_StringDecompress    },
    //{0,"Encrypt" , Test_Encrypt    },
    {0,"Decrypt",Test_Decrypt    },
    //{0,"StringEncrypt",Test_StringEncrypt    },
    {0,"StringDecrypt",Test_StringDecrypt    },
    
};


#endif