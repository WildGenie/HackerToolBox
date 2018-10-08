//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DemoUnit1.h"
#include "DemoUnit2.h"
#include "ShareI.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------



void __fastcall TForm1::FormCreate(TObject *Sender)
{
  Caption = Application->Title;
  GetRegisterHandle();
  Memo1->Text="    EncryptPE 能将普通软件变成共享软件，增加定时注册提醒、限制试用日期、限制试用次数、限制试用天数、限制每次试用多长时间等功能。";
      Edit60->Text ="飞雪连天射白鹿";
      Edit61->Text ="笑书神侠倚碧鸳";

  Timer1Timer(Timer1);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
       Timer1->Enabled = False;
      Edit14->Text = GetRegisterInfo(0);
      Edit15->Text = GetRegisterInfo(1);
      Edit16->Text = GetRegisterInfo(2);
      Edit17->Text = GetRegisterInfo(3);
      Edit18->Text = GetRegisterInfo(4);
      Edit19->Text = GetRegisterInfo(5);
      Edit20->Text = GetRegisterInfo(6);
      Edit21->Text = GetRegisterInfo(7);
      Edit22->Text = GetRegisterInfo(8);
      Edit23->Text = GetRegisterInfo(9);
      Edit24->Text = GetRegisterInfo(10);
      Edit25->Text = GetRegisterInfo(11);
      Edit26->Text = GetRegisterInfo(12);
      Edit28->Text = GetRegisterInfo(13);
      Edit48->Text= EPECustomValue(0);
      Edit49->Text= EPECustomValue(1);
      Edit50->Text= EPECustomValue(2);
      Edit51->Text= EPECustomValue(3);
      Edit52->Text= EPECustomValue(4);
      Edit53->Text= EPECustomValue(5);
      Edit54->Text= EPECustomValue(6);
      Edit55->Text= EPECustomValue(7);
      Edit56->Text= EPECustomValue(8);
      Edit57->Text= EPECustomValue(9);
      Timer1->Enabled = True;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
   ShowRegisterForm();        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
      SetRegisterInfo(Edit60->Text.c_str(),Edit61->Text.c_str());
      ShowRegisterForm();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
     struct  Set_Language {
        char FontCharset ;
        char FontSize ;
        char *pInfo[15];
    };
    struct Set_Language SetLang =
    {
        1,                  //FontCharset
        12                 //FontSize
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
    szSetLang[1] = SetLang.FontSize;
    int nIndex = 2;
    for(int i =0 ; i < 15 ; i ++)
    {
        strcat(&szSetLang[nIndex] , SetLang.pInfo[i]);
        nIndex = strlen(szSetLang) + 1;
    }
    if(SetLanguage(szSetLang) == TRUE)
    {
        ShowRegisterForm();
    }
        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button4Click(TObject *Sender)
{
     struct Set_Hint {
        char *szHint[4];
    };

    struct Set_Hint  SetHit =
    {
        "0000FF"
        ,"请注册本软件"
        ,"http://www.163.com　"
        ,"mail:163@163.com"
    };

    char szHitInfo[256];
    int nIndex = 0;
    memset(szHitInfo,0x00,sizeof(szHitInfo));
    for(int i =0 ; i < 4 ; i ++)
    {
        strcat(&szHitInfo[nIndex] , SetHit.szHint[i]);
        nIndex = strlen(szHitInfo) + 1;
    }

    if(SetRegisterHint(szHitInfo) == TRUE)
    {
        ShowRegisterForm();
    }
       
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button5Click(TObject *Sender)
{
      Edit29->Text = GetRegisterUser();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button6Click(TObject *Sender)
{
 KillProcess(Edit30->Text.c_str());
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button7Click(TObject *Sender)
{
 NotKillProcess(Edit31->Text.c_str());
}
//---------------------------------------------------------------------------



void __fastcall TForm1::Button8Click(TObject *Sender)
{

 Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()),0);
 Edit33->Text="+";
}

//---------------------------------------------------------------------------

void __fastcall TForm1::Button9Click(TObject *Sender)
{
 Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 1);
 Edit33->Text="-";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button10Click(TObject *Sender)
{
  Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 2);
  Edit33->Text="×";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button11Click(TObject *Sender)
{
  Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 3);
  Edit33->Text="div";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button12Click(TObject *Sender)
{
  Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 4);
  Edit33->Text="mod";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button13Click(TObject *Sender)
{
  Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 5);
  Edit33->Text="and";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button14Click(TObject *Sender)
{
  Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 6);
  Edit33->Text="or";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button15Click(TObject *Sender)
{
  Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 7);
  Edit33->Text="xor";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button16Click(TObject *Sender)
{
  Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 8);
  Edit33->Text="shl";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button17Click(TObject *Sender)
{
  Edit35->Text=EPECaclResult(atoi(Edit32->Text.c_str()),atoi(Edit34->Text.c_str()), 9);
  Edit33->Text="shr";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button18Click(TObject *Sender)
{
Edit36->Text=EPERandom(100);
}
//---------------------------------------------------------------------------



void __fastcall TForm1::Button20Click(TObject *Sender)
{
AnsiString Temp;
Memo2->Lines->Clear();
Temp="GetCurrentDirectory=>";
Memo2->Lines->Add(Temp+EPESystemStr(0));
Temp="GetWindowsDirectory=>";
Memo2->Lines->Add(Temp+EPESystemStr(1));
Temp="GetSystemDirectory=>";
Memo2->Lines->Add(Temp+EPESystemStr(2));
Temp="GetTempPath=>";
Memo2->Lines->Add(Temp+EPESystemStr(3));
Temp="GetComuterName=>";
Memo2->Lines->Add(Temp+EPESystemStr(4));
Temp="GetUserName=>";
Memo2->Lines->Add(Temp+EPESystemStr(5));
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button22Click(TObject *Sender)
{

    char *szSource=Memo1->Lines->GetText();
    char *szPass = "EPE";

    char *pResult = StringEncrypt(szSource,szPass);
    Memo2->Lines->Clear();
    Memo2->Lines->Add("    字符串加密测试：");
    Memo2->Lines->Add("");
    Memo2->Lines->Add(pResult);

    char *pDecrypt = StringDecrypt(pResult,szPass);
    Memo2->Lines->Add("");
    Memo2->Lines->Add("    字符串解密测试：");
    Memo2->Lines->Add("");
    Memo2->Lines->Add(pDecrypt);

    char *pszReture = StringCompress(szSource,szPass);
    Memo2->Lines->Add("");
    Memo2->Lines->Add("    字符串压缩测试：");
    Memo2->Lines->Add("");
    Memo2->Lines->Add(pszReture);

    char *pszDecRet = StringDecompress(pszReture,szPass);
    Memo2->Lines->Add("");
    Memo2->Lines->Add("    字符串解压测试：");
    Memo2->Lines->Add("");
    Memo2->Lines->Add(pszDecRet);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button21Click(TObject *Sender)
{
    char *pvInBuf=Memo1->Lines->GetText();
    char *pvOutBuf,*pvDecRet ;
    int nOutByte = 0 , nDecOutByte = 0;
    char *pOut,*pDecRet;
    char *pszPass ="epe sdk";

    Encrypt(pvInBuf,strlen(pvInBuf),(void **)&pvOutBuf,nOutByte,pszPass);
    Memo2->Lines->Clear();
    Memo2->Lines->Add("    内存数据加密测试：");
    Memo2->Lines->Add(pvOutBuf);

    Decrypt(pvOutBuf,nOutByte,(void **)&pvDecRet, nDecOutByte,pszPass);
    Memo2->Lines->Add("");
    Memo2->Lines->Add("    内存数据解密测试：");
    Memo2->Lines->Add(pvDecRet);

    Compress(pvInBuf,strlen(pvInBuf),(void **)&pOut,nOutByte,pszPass);
    Memo2->Lines->Add("");
    Memo2->Lines->Add("    内存数据压缩测试：");
    Memo2->Lines->Add("");
    Memo2->Lines->Add(pOut);

    Decompress(pOut,nOutByte,(void **)&pDecRet, nDecOutByte,pszPass);
    Memo2->Lines->Add("    内存数据解压测试：");
    Memo2->Lines->Add(pDecRet);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button19Click(TObject *Sender)
{
    char *Temp1,*Temp2;
    char Temp[200];
    memset(Temp,0 ,200);
    Memo2->Lines->Clear();

    Memo2->Lines->Add("================申请二块内存===============");
    Temp1=EPEGetMem(100);
    Temp2=EPEGetMem(100);

    Memo2->Lines->Add("=================清空二块内存==============");
    EPEZeroMemory(Temp1,100);
    EPEZeroMemory(Temp1,100);

    Memo2->Lines->Add("================将第一块内存填充'A'========");
    EPEFillMemory(Temp1,100,65);
    memcpy(Temp,Temp1,100);
    Memo2->Lines->Add(Temp);
    Memo2->Lines->Add("====将第一块内存中的字符拷贝至第二块内存====");
    EPECopyMemory(Temp2,Temp1,100);
    Memo2->Lines->Add("=================内存二：===================");
    memcpy(Temp,Temp2,100);
    Memo2->Lines->Add(Temp);

    Memo2->Lines->Add("============将第二块内存填充'B'=============");
    EPEFillMemory(Temp2,100,66);
    memcpy(Temp,Temp2,100);
    Memo2->Lines->Add(Temp);


    Memo2->Lines->Add("====将第二块内存中的字符移动至第一块内存====");
    EPEMoveMemory(Temp1,Temp2,100);
    Memo2->Lines->Add("=================内存一：===================");
    memcpy(Temp,Temp1,100);
    Memo2->Lines->Add(Temp);

    Memo2->Lines->Add("============释放两块内存，测试结束===========");
    EPEFreeMem(Temp1);
    EPEFreeMem(Temp2);
}
//---------------------------------------------------------------------------


HWND Testwin;
void __fastcall TForm1::Button30Click(TObject *Sender)
{
Button23->Enabled=True;
Button24->Enabled=True;
Button25->Enabled=True;
Button26->Enabled=True;
Button27->Enabled=True;
Button28->Enabled=True;
Button29->Enabled=True;
Form2->Visible=True;
Form2->Memo1->Lines->Clear();
Form2->Memo1->Lines->Add("  这个窗口是专供企业开发版测试SDK");
Testwin=GetWindow(GetForegroundWindow(),GW_CHILD);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button23Click(TObject *Sender)
{
    Memo2->Lines->Clear();
    Memo2->Lines->Add("=========测试子窗口的状态===============");
    Memo2->Lines->Add("测试子窗口是否有效");
    if(EPEWindowFunction(0,Testwin)==TRUE)
       Memo2->Lines->Add("是");
    else
       Memo2->Lines->Add("否");
    Memo2->Lines->Add("测试子窗口是否可见");
    if(EPEWindowFunction(1,Testwin)==TRUE)
       Memo2->Lines->Add("是");
    else
       Memo2->Lines->Add("否");
    Memo2->Lines->Add("测试子窗口是否最小化");
    if(EPEWindowFunction(2,Testwin)==TRUE)
       Memo2->Lines->Add("是");
    else
       Memo2->Lines->Add("否");
    Memo2->Lines->Add("测试子窗口是否最大化");
    if(EPEWindowFunction(3,Testwin)==TRUE)
       Memo2->Lines->Add("是");
    else
       Memo2->Lines->Add("否");
    Memo2->Lines->Add("测试子窗口是否处于活动状态");
    if(EPEWindowFunction(8,Testwin)==TRUE)
       Memo2->Lines->Add("是");
    else
       Memo2->Lines->Add("否");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button24Click(TObject *Sender)
{
EPEWindowFunction(4,Testwin);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button25Click(TObject *Sender)
{
EPEWindowFunction(5,Testwin);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button26Click(TObject *Sender)
{
EPEWindowFunction(9,Testwin);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button27Click(TObject *Sender)
{
EPEWindowFunction(10,Testwin);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button28Click(TObject *Sender)
{
EPEWindowFunction(6,Testwin);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button29Click(TObject *Sender)
{
EPEWindowFunction(7,Testwin);
}
//---------------------------------------------------------------------------

