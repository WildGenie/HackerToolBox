// Sample1.cpp
/********************************************************************
	created:	2007/02/10
	created:	10:2:2007   10:35
	file base:	sample1
	author:		CGSoftLabs
	purpose:	Showing how eXPressor SDK works with internal 
				registration scheme	
*********************************************************************/
#include "stdafx.h"

//Define a pointer to a function to be filled by eXPressor
eXP_GetMachineID GetMachineID;
//Stores hardware ID string
char		pHdd_ID[256];
//Stores key expiration date
MDATE		g_KeyExpDate;
WORD		g_dwKeyDaysLeft;
//Store key flags (read SDK for more info about which flags can receive here)
DWORD		g_dwKeyFlags;


int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	//NOTE: IF YOU PROVIDE A eXP_GetDecrypt_FnPtr YOU MUST CALL BY YOURSELF DECRYPTION 
	//FUNCTION PROVIDED, BEFORE EXECUTING ENCRYPTED CODE
	if(g_dwKeyFlags&USER_KEY_OK){//DECRYPT ONLY IF THIS FLAG IS OK, ELSE ERROR!
		CODE_CRYPT_BEGIN1
			MessageBox(HWND_DESKTOP, "Message shown only if regged, because the code is encrypted.", "Sample1",MB_OK|MB_ICONINFORMATION);
		CODE_CRYPT_END1
	}
	MessageBox(HWND_DESKTOP, "Application WinMain executed", "Sample1",MB_OK|MB_ICONINFORMATION);
	return 0;
}

//---------------------------------------------------------------------
//  This function will be called by eXPressor (before exe is executed)
//  and eXPressor will pass the pointer of a stub function which
//	generates the MachineID string
//	Expressor will call this first before calling SetMachineID 
//	When unregistered, put the hardware string in a messagebox from 
//	where the user can pick it up and send it to you in order to 
//	generate a valid key.
//---------------------------------------------------------------------
DLL_CPP_EXP void __stdcall GetMachineID_FnPtr(eXP_GetMachineID Ptr)
{
	GetMachineID = Ptr;
	MessageBox(HWND_DESKTOP, "GetMachineID_FnPtr Called from eXPressor Stub.\nNow we will call eXPressor's Stub function which makes the MachineID String!",
		"Sample1 - eXPressor calls app", MB_OK|MB_ICONINFORMATION);

	if(GetMachineID){
		//alloc a buffer where stub will copy hardware string
		//second param not used in this version
		GetMachineID(pHdd_ID,0);
		if(pHdd_ID){
			char msg[256];
			wsprintf(msg,"Here is the hardware ID string generate by Stub : \"%s\"\nAfter application starts tell user to send this number.",pHdd_ID);
			MessageBox(HWND_DESKTOP,msg , "Sample1 - Returned MachineID String", MB_OK|MB_ICONINFORMATION);	
		}
	}
}
//Note: cmd->"dir bin" will expose under current windows partition, 
//		what is known as serial number

//---------------------------------------------------------------------
//  This function will be called by eXPressor (before exe is executed)
//  when checking for a key, and eXPressor will get the hardware string;
//	It will be called only if the key is made with hardware lock;
//	Here you can use your function to generate a hardware id more complex
//	based on several system informations like CPU,OS,HDD etc.
//---------------------------------------------------------------------
DLL_CPP_EXP BOOL __stdcall SetMachineID(LPSTR MachineID)
{
	MessageBox(HWND_DESKTOP, "Called if the key is built with MachineID!", "Sample1 - eXPressor calls for MachineID", MB_OK|MB_ICONINFORMATION);
	//SEND EXPRESSORs GENERATED KEY BUT WE CAND DEFINE ONE OF OUR TYPE
	strcpy((char*)MachineID, pHdd_ID);
	//IF WE DON'T USE MACHINE LOCKED KEY WHEN PROTECTING WE CAN RET FALSE HERE
	return TRUE;
}

//---------------------------------------------------------------------
//  This function will be called by eXPressor (before exe is executed)
//  and eXPressor will get the user name string
//---------------------------------------------------------------------
DLL_CPP_EXP BOOL __stdcall SetUserName(LPSTR UserName)
{
	//IF YOU DON'T HAVE A USER RET FALSE AND STUB WILL NO MORE TRY TO 
	//CHECK FOR THE KEY
	strcpy(UserName,"test");

	char msg[256];
	wsprintf(msg,"We will send a predefined User Name\nUser Name sent : \"%s\"",UserName);
	MessageBox(HWND_DESKTOP, msg, "Sample1 - eXPressor calls for UserName", MB_OK|MB_ICONINFORMATION);

	return TRUE;
}

//---------------------------------------------------------------------
//  This function will be called by eXPressor (before exe is executed)
//  and eXPressor will get the user key. Here we must provide the user
//  key string.
//---------------------------------------------------------------------
DLL_CPP_EXP BOOL __stdcall SetUserKey(LPBYTE UserKey, PDWORD dwKeyLen)
{
	//ASK IF NO TO SEE RANDOM MESSAGE BOX USED IN THIS PROJECT
	UINT nREt = MessageBox(HWND_DESKTOP, "Should we send the build in key?", "Sample1 - eXPressor calls for UserKey", MB_YESNO|MB_ICONQUESTION);
	if(nREt==IDNO)
		return 0;
	//READ IT FROM REGISTRY OR SOME .KEY FILES
	//IF YOU DON'T HAVE A KEY SIMPLY RETURN FALSE
	//THIS KEY IS GENERATED FOR USER "test", MACHINE INDEPENDENT
	char cUser[] = "10D88AEE647C9FBFAF9A4BE25ED38C2ED9237D2F548F6B2AB370768CF325781065DB33760C5908042603C6761E82302040CB1F0D6F0ECC70183D34F79279D7956AB1E4EB904203DE42E1E3426987966DA7AAF816F4C57E35D15B4D5D8C0243B1C2DEBAC663DCFDE9AF38A9F2228DB71FC3D366D41A3E11A1030CCF8109C0BF5C";
	//THIS KEY IS FOR TESTING A STOLEN KEY (IT WAS MADE FOR USER "Stolen key" MARKED AS STOLEN IN THE PROJECT FILE)
	//char cUser[] = "1BB54531A524EACF31F9644B8DA4D160A6EA7A8A047374EEB2000530C2531F5B0A3BE438E202DE6415463D898177196F363D44A18E2FAB11F40565020C0E1EF2A30842CB301E37C80698495757822E8EDF937CD26FCB955525F51A31192CD8089F76CDE71E7A060D8999A5126C771F218600B01A187DCA935443C3B6017BE0A3";
	strcpy((char*)UserKey,cUser);
	//THE SIZE MUST BE EXACTLY THE NUMBER OF CHARACTERS IN THE STRING
	//WITHOUT LAST NULL
	*dwKeyLen = sizeof(cUser)-1;

	char msg[512];
	wsprintf(msg,"We will send it a valid builtin key... \n%s",cUser);	
	MessageBox(HWND_DESKTOP, msg, "Sample1 - eXPressor calls for UserKey", MB_OK|MB_ICONINFORMATION);

	return TRUE;
}

//---------------------------------------------------------------------
//  This function will be called by eXPressor (before exe is executed)
//  if key has expiration date flag, and eXPressor will pass here the
//  expiration date, and the number of days left
//---------------------------------------------------------------------
DLL_CPP_EXP VOID __stdcall GetKeyExpireDate(PMDATE pExpDate, WORD wLeft)
{
	//STORE DATA FOR LATER USE
	memcpy(&g_KeyExpDate,pExpDate,sizeof(MDATE));
	g_dwKeyDaysLeft = wLeft;
	
	char msg[256];
	wsprintf(msg,"We store key Expiration Date!\nProgram's Key is set to expire on : %02i/%02i/%04i\nDays Left : %i",g_KeyExpDate.Day,g_KeyExpDate.Month,g_KeyExpDate.Year,g_dwKeyDaysLeft);
	MessageBox(HWND_DESKTOP, msg, "Sample1 - eXPressor calls to set Expiration Date", MB_OK|MB_ICONINFORMATION);
}

DLL_CPP_EXP VOID __stdcall GetKeyStatus(DWORD dwKeyFlags)
{
	char msg[256];
	wsprintf(msg,"Stub sends us the key flags : 0x%X",dwKeyFlags);
	MessageBox(HWND_DESKTOP, msg, "Sample1 - we're receiving the key flag", MB_OK|MB_ICONINFORMATION);
	g_dwKeyFlags = dwKeyFlags;
}
