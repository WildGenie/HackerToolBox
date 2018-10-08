unit KeygenDLL;

interface

uses
  Windows;



const
  KeygenDLLName = 'KeygenDLL.dll';
function ZP_GenKeyStringA( pPassword:PAnsiChar;						  	  //Master Key
                        pHardwareID:PAnsiChar;								  	//Hardware ID
                        pUsername:PAnsiChar;								      //Username for registration
                        pWatermark:PAnsiChar;											//Watermark String
                        pkDays:Integer;														//Validity days of KEY
                        pkdYear:Integer;													//KEY expiry date(Year); 0 means no limitation
                        pkdMonth:Integer;													//KEY expiry date(Month); 0 means no limitation
                        pkdDay:Integer;														//KEY expiry date(Day); 0 means no limitation
                        plTime:Integer;														//Software execution time(mins); 0 means no limitation
                        plDays:Integer;														//Software trial days; 0 means no limitation
                        pldYear:Integer;													//Software expiry date(Year); 0 means no limitation
                        pldMonth:Integer;													//Software expiry date(Month); 0 means no limitation
                        pldDay:Integer;														//Software expiry date(Day); 0 means no limitation
                        plTick:Integer;														//Software execution Times; 0 means no limitation
                        pcInt1:Integer;														//Custom Integer 1
                        pcInt2:Integer;														//Custom Integer 2
                        pcInt3:Integer;														//Custom Integer 3
                        pcStr1:PAnsiChar;													//Custom String 1
                        pcStr2:PAnsiChar;													//Custom String 2
                        pcStr3:PAnsiChar;													//Custom String 3
                        pbSec1:Boolean;														//To decode Section_A or not
                        pbSec2:Boolean;														//To decode Section_B or not
                        pbSec3:Boolean														//To decode Section_C or not
                        ): PAnsiChar; stdcall; external KeygenDLLName name 'ZP_GenKeyStringA';

function ZP_GenKeyStringW( pPassword:pWideChar;									
                        pHardwareID:pWideChar;										
                        pUsername:pWideChar;											
                        pWatermark:pWideChar;											
                        pkDays:Integer;														
                        pkdYear:Integer;													
                        pkdMonth:Integer;													
                        pkdDay:Integer;														
                        plTime:Integer;														
                        plDays:Integer;														
                        pldYear:Integer;													
                        pldMonth:Integer;													
                        pldDay:Integer;													
                        plTick:Integer;													
                        pcInt1:Integer;												
                        pcInt2:Integer;											
                        pcInt3:Integer;													
                        pcStr1:pWideChar;													
                        pcStr2:pWideChar;												
                        pcStr3:pWideChar;												
                        pbSec1:Boolean;														
                        pbSec2:Boolean;														
                        pbSec3:Boolean														
                        ): pWideChar; stdcall;  external KeygenDLLName name 'ZP_GenKeyStringW';

procedure ZP_KeygenFree(plpBuf:Pointer); stdcall; external KeygenDLLName name 'ZP_KeygenFree';

function ZP_BuildToFileA(plpFilePath:PAnsiChar;									//Path of keyfile
                        pPassword:PAnsiChar;										
                        pHardwareID:PAnsiChar;									
                        pUsername:PAnsiChar;										
                        pWatermark:PAnsiChar;										
                        pkDays:Integer;													
                        pkdYear:Integer;													
                        pkdMonth:Integer;													
                        pkdDay:Integer;														
                        plTime:Integer;										
                        plDays:Integer;														
                        pldYear:Integer;												
                        pldMonth:Integer;											
                        pldDay:Integer;														
                        plTick:Integer;														
                        pcInt1:Integer;														
                        pcInt2:Integer;													
                        pcInt3:Integer;													
                        pcStr1:PAnsiChar;												
                        pcStr2:PAnsiChar;												
                        pcStr3:PAnsiChar;													
                        pbSec1:Boolean;													
                        pbSec2:Boolean;														
                        pbSec3:Boolean														
                        ): Integer; stdcall;  external KeygenDLLName name 'ZP_BuildToFileA';

function ZP_BuildToFileW(plpFilePath:pWideChar;								
                        pPassword:pWideChar;										
                        pHardwareID:pWideChar;										
                        pUsername:pWideChar;											
                        pWatermark:pWideChar;											
                        pkDays:Integer;														
                        pkdYear:Integer;													
                        pkdMonth:Integer;												
                        pkdDay:Integer;														
                        plTime:Integer;											
                        plDays:Integer;														
                        pldYear:Integer;												
                        pldMonth:Integer;													
                        pldDay:Integer;														
                        plTick:Integer;														
                        pcInt1:Integer;														
                        pcInt2:Integer;														
                        pcInt3:Integer;														
                        pcStr1:pWideChar;												
                        pcStr2:pWideChar;													
                        pcStr3:pWideChar;												
                        pbSec1:Boolean;													
                        pbSec2:Boolean;														
                        pbSec3:Boolean														
                        ): Integer; stdcall;  external KeygenDLLName name 'ZP_BuildToFileW';


implementation

end.