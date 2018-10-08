#include "stdafx.h"
#include "Example.h"
#include "ExampleDlg.h"
#include "../include/SDProtector.h"
#include "../include/KeyGen.h"
#include "RegDialog.h"
#include "TrialDialog.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CExampleDlg::CExampleDlg(CWnd* pParent /*=NULL*/)
: CDialog(CExampleDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CExampleDlg)
	// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CExampleDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CExampleDlg)
	// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CExampleDlg, CDialog)
//{{AFX_MSG_MAP(CExampleDlg)
ON_WM_PAINT()
ON_WM_QUERYDRAGICON()
ON_BN_CLICKED(ID_IS_REGISTERED, OnIsRegistered)
ON_BN_CLICKED(ID_GET_REGISTRATION_NAME, OnGetRegistrationName)
ON_BN_CLICKED(ID_GET_KEY_EXPIRATION_DATE, OnGetKeyExpirationDate)
ON_BN_CLICKED(ID_GET_EXPIRATION_DATE, OnGetExpirationDate)
ON_BN_CLICKED(ID_GET_NUM_OF_DAYS, OnGetNumOfDays)
ON_BN_CLICKED(ID_GET_NUM_OF_EXECUTIONS, OnGetNumOfExecutions)
ON_BN_CLICKED(ID_DETECT_DEBUGGER, OnDetectDebugger)
ON_BN_CLICKED(ID_SET_REGISTRATION_KEY, OnSetRegistrationKey)
ON_BN_CLICKED(IDC_GET_HARDWARE_ID, OnGetHardwareId)
ON_BN_CLICKED(IDC_REGISTER, OnRegister)
ON_BN_CLICKED(IDC_CLEAR_REGISTRATION_INFO, OnClearRegistrationInfo)
	ON_BN_CLICKED(IDC_RETRIEVE_HARDWAREID, OnRetrieveHardwareid)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

BOOL CExampleDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
    SetIcon(m_hIcon, TRUE);	
	SetIcon(m_hIcon, FALSE);
	SDP_RunApplicationFunction();
	return TRUE;  
}

void CExampleDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this);
		
		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

HCURSOR CExampleDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CExampleDlg::OnIsRegistered() 
{
	
	if(SDP_IsRegistered())
	{
		MessageBox("This is a registered version","registered version",MB_OK);	
	}
	else
	{
        MessageBox("This is a unregistered version","unregistered version",MB_OK);	
	}
}

void CExampleDlg::OnGetRegistrationName() 
{
	if(SDP_IsRegistered())
	{
		char buff[256];
		if(SDP_GetRegistrationName(buff,256))
		{
			MessageBox(buff,"This copy is licensed to :",MB_OK);
		}
	}
	else
	{
        MessageBox("This is a unregistered version","unregistered version",MB_OK);	
	}
}

void CExampleDlg::OnGetKeyExpirationDate() 
{
	if(SDP_IsRegistered())
	{
		SYSTEMTIME ExpirationDate;
		char szInfo[256];
		
		if(SDP_GetKeyExpirationDate(&ExpirationDate))
		{
			//If succeeded
			sprintf(szInfo,"license key will be expired on %4d,%02d,%02d",
				ExpirationDate.wYear,ExpirationDate.wMonth,ExpirationDate.wDay);
			MessageBox(szInfo,"Expiration Info",MB_ICONINFORMATION);     
		} 
	}
	else
	{
        MessageBox("This is a unregistered version","unregistered version",MB_OK);	
	}
}

void CExampleDlg::OnGetExpirationDate() 
{
	
	if(SDP_IsRegistered())
	{
		MessageBox("This is a registered version","Registered Version",MB_OK);	
	}
	else
	{
		SYSTEMTIME ExpirationDate;
		char szInfo[256];
		int iResult;    
		iResult=SDP_GetExpirationDate(&ExpirationDate);   
		if(iResult==1)    
		{      
			//If succeeded       
			sprintf(szInfo,"This program will be expired on %4d,%02d,%02d",
				ExpirationDate.wYear,ExpirationDate.wMonth,ExpirationDate.wDay);
			MessageBox(szInfo,"Expiration Info",MB_ICONINFORMATION);     
			
		}     
		else if(iResult==-1)    
		{       
			//if expired       
			MessageBox("Sorry, you trial period has expired","Error",MB_ICONINFORMATION);     
		}     
		else    
		{    //if failed       
			MessageBox("Error in getting expiration date, you may not set trail option yet.","Error",MB_ICONINFORMATION);
		}
    }
}

void CExampleDlg::OnGetNumOfDays() 
{
	if(SDP_IsRegistered())
	{
		MessageBox("This is a registered version","Registered Version",MB_OK);	
	}
	else
	{
		DWORD dNumofDays;
		char szInfo[256];
		int iResult;    
		iResult=SDP_GetNumOfDaysLeft(&dNumofDays);    
		if(iResult==1)    
		{      
			//If succeeded       
			sprintf(szInfo,"you have %d day(s) left",dNumofDays);        
			MessageBox(szInfo,"Expiration Info",MB_ICONINFORMATION);        
		}     
		else if(iResult==-1)    
		{       
			//if expired       
			MessageBox("Sorry, you trial period has expired yet.","Error",MB_ICONINFORMATION);     
		}     
		else    
		{    //if failed       
			MessageBox("Error in getting number Of days left, you may not set trail option yet.","Error",MB_ICONINFORMATION);
		}
		
    }
}

void CExampleDlg::OnGetNumOfExecutions() 
{
	if(SDP_IsRegistered())
	{
		MessageBox("This is a registered version","Registered Version",MB_OK);	
	}
	else
	{
		DWORD dNumofExecution;
		char szInfo[256];
		int iResult;    
		iResult=SDP_GetNumOfExecutionsLeft(&dNumofExecution);    
		if(iResult==1)    
		{      
			//If succeeded       
			sprintf(szInfo,"you have %d execution(s) left",dNumofExecution);        
			MessageBox(szInfo,"Expiration Info",MB_ICONINFORMATION);        
		}     
		else if(iResult==-1)    
		{       
			//if expired       
			MessageBox("Sorry, you trial period has expired","Error",MB_ICONINFORMATION);     
		}     
		else    
		{    //if failed       
			MessageBox("Error in getting number Of executions left, you may not set trail option","Error",MB_ICONINFORMATION);
		}
    }
	
}

void CExampleDlg::OnDetectDebugger() 
{
	SDP_DetectDebugger();	
}

//----------------------------------------------------------------------
// You can set a registration key to SDProtector!
// SDProtector calls this function before a checking 
// of registration key

//// This function reads the key from key.txt file, which is 
//   located in the application folder.
//----------------------------------------------------------------------

extern "C" LPSTR __declspec(dllexport) SDP_SetRegistrationKey()
{
	
	HANDLE hFile;
	DWORD dFileSize;
	DWORD dReadSize;
	char  *p;
	static char szKey[192];
	char szFileName[MAX_PATH];
	if(!GetModuleFileName(NULL,szFileName,MAX_PATH))    
	{
		return NULL;
    }    
	p=strrchr(szFileName,'\\');
    if(!p)
    {
		return NULL;
    }
    *p='\0';
    strcat(szFileName,"\\key.txt");
    memset(szKey,0,192);
    hFile=CreateFile(szFileName,GENERIC_READ,FILE_SHARE_READ|FILE_SHARE_WRITE
		              ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);       
	if(hFile == INVALID_HANDLE_VALUE)     
	{        
		return NULL;
    }    
	dFileSize=GetFileSize(hFile, NULL);    
	if(dFileSize==-1||dFileSize>=192)    
	{   
		CloseHandle(hFile);
		return NULL;    
	}
    if(!ReadFile(hFile,szKey,dFileSize,&dReadSize,NULL))    
	{   
		CloseHandle(hFile);
		return NULL;     
	}  
	CloseHandle(hFile);
    
	if(dFileSize!=dReadSize)
    {
		return NULL;
    }

	return (LPSTR)szKey;
	
}
void CExampleDlg::OnSetRegistrationKey() 
{
	//The function above is implementation. 
}

//  This procedure will be called by SDProtector for
//  setting of hardware key

extern "C" LPSTR __declspec(dllexport) SDP_GetHardwareID()
{
	
	static char szVolumeSerial[36];
	DWORD dVolSerialNum;
	
	GetVolumeInformation("c:\\",NULL,12,&dVolSerialNum,NULL,NULL,NULL,0);
    sprintf(szVolumeSerial,"%x%d",dVolSerialNum,dVolSerialNum);
	
	return (LPSTR)szVolumeSerial;
	
}

void CExampleDlg::OnGetHardwareId() 
{
	MessageBox(SDP_GetHardwareID(),"Your hardware ID :",MB_OK);
}

void CExampleDlg::OnRegister() 
{
	KEY_DATA sKeyData;
	memset((void *)&sKeyData,0,sizeof(KEY_DATA)); // Important! It should be 
	                                              // initialized to zero;
	char szUserName[36]="SDProtector";
	char szOrderID[24]="000000-123456-0001";

	char szHardwareID[42];
    int  iMaxLen=42;
	char *p;
	
    memset(szHardwareID,0,iMaxLen);
    if(SDP_RetrieveHardwareID(szHardwareID,42))
    {
		sKeyData.lpUserName=szUserName;
		sKeyData.lpOrderID=szOrderID; 
		sKeyData.lpHardwareID=szHardwareID;
		SYSTEMTIME ExpirationTime;
		GetSystemTime(&ExpirationTime);
		ExpirationTime.wMonth+=1;
		sKeyData.lpExpDate=&ExpirationTime;
		
		HANDLE hFile;
		DWORD dFileSize;
		DWORD dWriteSize;
		char szTextKey[256];
		memset(szTextKey,0,256);
		int iRet=GenerateTextKey(&sKeyData,szTextKey,256);
		if (iRet) 
		{
			
			CString szErr;
			szErr.Format("Couldn't generate registration key! \r\n\r\n"
				"Error code : %d",iRet);
			AfxMessageBox(szErr,MB_OK,NULL);
			
		}
		
		char szFileName[MAX_PATH];
		
		if(!GetModuleFileName(NULL,szFileName,MAX_PATH))    
		{
			return ;
		}    
		p=strrchr(szFileName,'\\');
		if(!p)
		{
			return;
		}
		*p='\0';
		strcat(szFileName,"\\key.txt");
		
		hFile=CreateFile(szFileName,GENERIC_READ|GENERIC_WRITE,FILE_SHARE_READ
			,NULL,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);       
		if(hFile == INVALID_HANDLE_VALUE)     
		{        
			return ;
		}    
		dFileSize=strlen(szTextKey)+1;
		if(!WriteFile(hFile,szTextKey,dFileSize,&dWriteSize,NULL))    
		{   
			CloseHandle(hFile);
			return ;     
		}  
		CloseHandle(hFile);
	} 
	else
    {
		::MessageBox(NULL,"Can not get hardware id","Error",MB_ICONINFORMATION); 
    } 


}

void CExampleDlg::OnClearRegistrationInfo() 
{
	char szFileName[MAX_PATH];
	char *p;
	if(!GetModuleFileName(NULL,szFileName,MAX_PATH))    
	{
		return ;
    }    
	p=strrchr(szFileName,'\\');
    if(!p)
    {
		return ;
    }
    *p='\0';
    strcat(szFileName,"\\key.txt");
	DeleteFile(szFileName);
}

void CExampleDlg::OnRetrieveHardwareid() 
{
	char szHardwareID[42];
    int  iMaxLen=42;
	
    memset(szHardwareID,0,iMaxLen);
    if(SDP_RetrieveHardwareID(szHardwareID,42))
    {
	
		::MessageBox(NULL,szHardwareID,"Your hardware ID is:",MB_ICONINFORMATION); 
		
    } 
    else
    {
		::MessageBox(NULL,"Can not get hardware id","Error",MB_ICONINFORMATION); 
    } 
}

extern "C" void __declspec(dllexport) SDP_ExecuteRegistered()
{
	char szUserName[42];
    int  iMaxLen=42;
	
    memset(szUserName,0,iMaxLen);
    if(SDP_GetRegistrationName(szUserName,42))
    {
         
		// you can check whether the user is legal 
		// for simple, we just do nothing here.
    
     
	}
}
extern "C" void __declspec(dllexport) SDP_ExecuteTrialExpired()
{
        CRegDialog reg;
		reg.DoModal();
}
extern "C" void __declspec(dllexport) SDP_ExecuteTrialNotExpired()
{
        CTrialDialog trial;
		trial.DoModal();
}
