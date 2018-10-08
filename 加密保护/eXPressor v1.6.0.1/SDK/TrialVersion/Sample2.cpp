// Sample2.cpp : Defines the entry point for the application.
//
// This sample show how trial API functions are designed
// Follow the MessageBox apparition to see how it works
//
// The functions in this sample will be called if no valid
// registartion key is found
//
// You must protect the sample2.exe using sample2.epf project file
// which is located inside project's dir
/////////////////////////////////////////////////////////////////////
#include "stdafx.h"

// Some Golobal vars to store data passed in from the stub
WORD		g_dwTotalTrialDays;
WORD		g_dwTrialDaysLeft;
WORD		g_dwTotalTrialExec;
WORD		g_dwTrialExecLeft;
MDATE		g_ExpDate;
eXP_FnPtr	g_ResetTrial = NULL;

//declaration due to funct init needings
DLL_CPP_EXP void __stdcall ExecAppHasExpired();
eXP_FnPtr	g_RunAppFn = (eXP_FnPtr)ExecAppHasExpired;

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
 	// TODO: Place code here.
	MessageBox(HWND_DESKTOP, "Application WinMain executed", "Sample2",
		MB_OK|MB_ICONINFORMATION);

	//we have a pointer to a resettrial function?
	if(g_ResetTrial){
		if(IDYES==MessageBox(HWND_DESKTOP, "Do you want to reset trial information?",
			"Sample2 Trial-Reset",MB_YESNO|MB_ICONINFORMATION)){
			g_ResetTrial();
		}
	}
	//Now call expired or normal function passed by stub
	if(g_RunAppFn)
		g_RunAppFn();
	return 0;
}

//---------------------------------------------------------------------
//  This function will be called by Stub (before exe is executed)
//  and eXPressor will get the path where information about expiration
//	will is stored
//	Use your imagination to hide better the key
//	If you don't implement this function expressor will generate it's
//	own registry key path
//  NOTE: you can copy max 254 chars each param&nd ensure last byte is
//  null; else you will produce a buferoverrun!
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall SetExpireRegistryPath(LPTSTR KeyPath, LPTSTR ValueName)
{
	//MAX KeyPath is 255 chars (use your imagination)
	char cKey[] = "CLSID\\{B12AE898-D056-4378-A844-6D393FE37957}\\TypeLib";
	strcpy((char*)KeyPath,cKey);
	//WE WILL STORE THE KEY TO "(Default)" VALUE NAME
	strcpy((char*)ValueName,"test");
	//ALSO YOU CAN SET 	ValueName[0] = '\0';
	char msg[512];
	wsprintf(msg,"We will provide a registry path!\nKey Path : %s \nKey Value: %s",KeyPath,ValueName);
	MessageBox(HWND_DESKTOP,msg , "Sample2 - eXPressor calls to ExpireRegistryPath",
		MB_OK|MB_ICONINFORMATION);
}

//---------------------------------------------------------------------
//  This function will be called by Stub (before exe is executed)
//  and eXPressor will pass total/remaining trial days
//  If both "Run for number of days" and "Expire date" are set here
//  will be returned the minimum number of days till expiration
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall GetTrialDays(WORD wTotal,WORD wLeft)
{
	//STORE DATA FOR LATER USE
	g_dwTotalTrialDays = wTotal;
	g_dwTrialDaysLeft = wLeft;
	char msg[256];
	wsprintf(msg,"We store TrialDays numbers!\nwTotal : %i\nwLeft : %i",wTotal,wLeft);
	MessageBox(HWND_DESKTOP,msg , "Sample2 - eXPressor calls to set Trial Days",
		MB_OK|MB_ICONINFORMATION);
}

//---------------------------------------------------------------------
//  This function will be called by Stub (before exe is executed)
//  and eXPressor will pass total/remaining trial executions
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall GetTrialExecs(WORD wTotal,WORD wLeft)
{
	//STORE DATA FOR LATER USE
	g_dwTotalTrialExec = wTotal;
	g_dwTrialExecLeft = wLeft;
	char msg[256];
	wsprintf(msg,"We store TrialExec numbers!\nwTotal : %i\nwLeft : %i",wTotal,wLeft);
	MessageBox(HWND_DESKTOP,msg , "Sample2 - eXPressor calls to set Trial Executions",
		MB_OK|MB_ICONINFORMATION);
}

//---------------------------------------------------------------------
//  This function will be called by Stub (before exe is executed)
//  and eXPressor will pass Expire Date
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall GetExpireDate(PMDATE pExpDate)
{
	//STORE DATA FOR LATER USE
	memcpy(&g_ExpDate,pExpDate,sizeof(MDATE));
	char msg[256];
	wsprintf(msg,"We store ExpirationDate!!\nProgram is set to expire on : %02i/%02i/%04i",
		g_ExpDate.Day,g_ExpDate.Month,g_ExpDate.Year);
	MessageBox(HWND_DESKTOP, msg, "Sample2 - eXPressor calls to set Expiration Date",
		MB_OK|MB_ICONINFORMATION);
}

//---------------------------------------------------------------------
//  This function will not be called by Stub but a function pointer
//  is delivered by stub to GetRunApp_FNPtr if app has expired
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall ExecAppHasExpired()
{
	MessageBox(HWND_DESKTOP, "Well it seems that the application has expired!",
		"Sample2 - calls this if App has expired", MB_OK|MB_ICONINFORMATION);
}

//---------------------------------------------------------------------
//  This function will not be called by Stub but a function pointer
//  is delivered by stub to GetRunApp_FNPtr if app isn't expired
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall ExecAppNormal()
{
	MessageBox(HWND_DESKTOP, "Application runs normally!",
		"Sample2 - calls this if App doesn't expire or is registered",
		MB_OK|MB_ICONINFORMATION);
}

//---------------------------------------------------------------------
//  This function will be called by Stub (before exe is executed)
//  and g_RunAppFn will be either ExecAppHasExpired or ExecAppNormal
//  You may use it then inside WinMain
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall GetRunApp_FNPtr(eXP_FnPtr RunAppFn)
{
	g_RunAppFn = RunAppFn;
}

//---------------------------------------------------------------------
//  This function will be called by Stub (before exe is executed)
//	You can call g_ResetTrial() after WinMain gets executed to reset
//  trial executions/days if or not program is expired; implement this
//	if you want to reset local imformations when you test your packed exe
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall GetResetTrialInfo_FnPtr(eXP_FnPtr ResetTrial)
{
	g_ResetTrial = ResetTrial;
}