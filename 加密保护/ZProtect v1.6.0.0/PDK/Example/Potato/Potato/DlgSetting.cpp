// DlgSetting.cpp : 实现文件
//

#include "stdafx.h"
#include "Potato.h"
#include "DlgSetting.h"


// CDlgSetting 对话框

IMPLEMENT_DYNAMIC(CDlgSetting, CDialog)

CDlgSetting::CDlgSetting(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgSetting::IDD, pParent)
{

}

CDlgSetting::~CDlgSetting()
{
}

void CDlgSetting::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CDlgSetting, CDialog)
END_MESSAGE_MAP()


// CDlgSetting 消息处理程序
