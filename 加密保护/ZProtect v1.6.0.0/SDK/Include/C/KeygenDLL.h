

char* __stdcall ZP_GenKeyStringA(
								 char*	pPassword,			//Master Key
								 char*	pHardwareID,		//Hardware ID
								 char*	pUsername,			//Username for registration
								 char*	pWatermark,			//Watermark String
								 int pkDays		= 0,	  	//Validity days of KEY
								 int pkdYear	= 0,		  //KEY expiry date(Year); 0 means no limitation
								 int pkdMonth	= 0,		  //KEY expiry date(Month); 0 means no limitation
								 int pkdDay		= 0,		  //KEY expiry date(Day); 0 means no limitation
								 int plTime		= 0,		  //Software execution time(mins); 0 means no limitation
								 int plDays		= 0,		  //Software trial days; 0 means no limitation
								 int pldYear	= 0,		  //Software expiry date(Year); 0 means no limitation
								 int pldMonth	= 0,		  //Software expiry date(Month); 0 means no limitation
								 int pldDay		= 0,		  //Software expiry date(Day); 0 means no limitation
								 int plTick		= 0,		  //Software execution times; 0 means no limitation
								 int pcInt1		= 0,		  //Custom Integer 1
								 int pcInt2		= 0,		  //Custom Integer 2
								 int pcInt3		= 0,		  //Custom Integer 3
								 char* pcStr1	= NULL,		//Custom String 1
								 char* pcStr2	= NULL,		//Custom String 2
								 char* pcStr3	= NULL,		//Custom String 3
								 BOOL pbSec1	= FALSE,	//To decode Section_A or not
								 BOOL pbSec2	= FALSE,	//To decode Section_B or not
								 BOOL pbSec3	= FALSE		//To decode Section_C or not
						 );


wchar_t* __stdcall ZP_GenKeyStringW(
									wchar_t*	pPassword,		 
									wchar_t*	pHardwareID,	  
									wchar_t*	pUsername,		  
									wchar_t*	pWatermark,		  
									int pkDays		= 0,		    
									int pkdYear		= 0,		    
									int pkdMonth	= 0,		    
									int pkdDay		= 0,		    
									int plTime		= 0,		   
									int plDays		= 0,		    
									int pldYear		= 0,		      
									int pldMonth	= 0,		     
									int pldDay		= 0,		     
									int plTick		= 0,		     
									int pcInt1		= 0,		     
									int pcInt2		= 0,		     
									int pcInt3		= 0,		     
									wchar_t* pcStr1	= NULL,		
									wchar_t* pcStr2	= NULL,		
									wchar_t* pcStr3	= NULL,		
									BOOL pbSec1		= FALSE,	    
									BOOL pbSec2		= FALSE,	    
									BOOL pbSec3		= FALSE		    
						 );

void	__stdcall	ZP_KeygenFree(char* plpBuf);


int		__stdcall	ZP_BuildToFileA(
									char* plpFilePath,			    //Path of keyfile
									char* pPassword,		    
									char* pHardwareID,	    
									char* pUsername,		    
									char* pWatermark,		    
									int pkDays		= 0,		      
									int pkdYear		= 0,		      
									int pkdMonth	= 0,		      
									int pkdDay		= 0,		      
									int plTime		= 0,		      
									int plDays		= 0,		      
									int pldYear		= 0,		     
									int pldMonth	= 0,		      
									int pldDay		= 0,		      
									int plTick		= 0,		     
									int pcInt1		= 0,		      
									int pcInt2		= 0,		     
									int pcInt3		= 0,		      
									char* pcStr1	= NULL,		    
									char* pcStr2	= NULL,		    
									char* pcStr3	= NULL,		    
									BOOL pbSec1		= FALSE,	    
									BOOL pbSec2		= FALSE,	    
									BOOL pbSec3		= FALSE		    
									);

int		__stdcall	ZP_BuildToFileW(
									wchar_t* plpFilePath,		  
									wchar_t*	pPassword,		    
									wchar_t*	pHardwareID,	    
									wchar_t*	pUsername,		   
									wchar_t*	pWatermark,		    
									int pkDays		= 0,		   
									int pkdYear		= 0,		     
									int pkdMonth	= 0,		     
									int pkdDay		= 0,		    
									int plTime		= 0,		    
									int plDays		= 0,		    
									int pldYear		= 0,		    
									int pldMonth	= 0,		   
									int pldDay		= 0,		   
									int plTick		= 0,		     
									int pcInt1		= 0,		    
									int pcInt2		= 0,		     
									int pcInt3		= 0,		     
									wchar_t* pcStr1	= NULL,		
									wchar_t* pcStr2	= NULL,		
									wchar_t* pcStr3	= NULL,		
									BOOL pbSec1		= FALSE,	    
									BOOL pbSec2		= FALSE,	    
									BOOL pbSec3		= FALSE		   
									);