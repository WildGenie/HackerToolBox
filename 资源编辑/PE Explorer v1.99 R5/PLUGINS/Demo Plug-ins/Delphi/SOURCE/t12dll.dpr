//-----------------------------------------------------------------------------
// PE Explorer Demo Plug-In
// (c)2001 by Yuri Rai/Heaventools Software.
// http://www.heaventools.com
//
// Pascal (Delphi):  t12dll.dpr
//-----------------------------------------------------------------------------

library t12dll;

uses
 Windows,
 Messages;

{$R *.RES}

const
 IName = 'PE Explorer Demo PlugIn';


//-----------------------------------------------------------------------------
// Prototype of function which allocates memory.  
//
// Used only to return results to PEX.
// All other memory allocation should use standard library calls.
//
// Rather than being permanently loaded into memory, the plug-in uses this  
// function at run-time, to request a buffer of the necessary size from PE 
// Explorer where the plug-in can store the results of an operation. The 
// plug-in does not need to clear the input buffer, or de-allocate the space 
// after use, as these tasks are performed by PE Explorer.
//
// Input : Size - DWORD 
//              - Size of requested memory
// OutPut: Pointer
//              - The pointer to allocated memory. In case of failure 
//                when allocating memory returns nil.
 type
 PMemoryAllocator = ^TMemoryAllocator;
 TMemoryAllocator = function (Size: DWORD): Pointer; stdcall;


//-----------------------------------------------------------------------------
// CallBack Events
const
 evID_PostLogInfo = 0;

// The prototype of the function, used by Plug-in to inform PEX of various 
// events that have occurred at run time.
//
// IMPORTANT: Currently, only 'Post data to log' is supported.  
//            For compatibility with future versions of PE Explorer, use  
//            ONLY PREDEFINED EVENT TYPES.
//
// Input : None
// Output: dwPGIID   - DWORD
//              - Interface ID. It is used to uniquely specify a particular event  
//                issued by the plug-in if several functions are executing at 
//                the same time.
//
//                IMPORTANT: Only the Interface ID values received from PEX 
//                           should be used.              
//                 
//         dwEventID - DWORD
//              - Identifier of the occurred event.
//
//         pcMessage - Pointer
//              - Pointer to the data that is necessary to transmit to PEX.
//
type
 PPGICallBack = ^TPGICallBack;
 TPGICallBack = procedure (dwPGIID: DWORD; dwEventID: DWORD; pcMessage: PChar); stdcall;


//--------------------------------------------------------------------------------------
// The structure by which interaction with PEX is achieved. 
// ATTENTION! Under no circumstances should you modify the values marked as 
//            Read Only! Changing these values may adversely affect the operation 
//            of the program.            
type
 PPGIParamsBlock = ^TPGIParamsBlock;
 TPGIParamsBlock = record
  pMemAllocator       : PMemoryAllocator; // The address of the procedure
                                          // allocating memory. The procedure
                                          // is required for de-allocating
                                          // memory correctly after use. 
  pCallBack           : Pointer;          // Pointer to CallBack function.
  pInBuff             : Pointer;          // Pointer to input buffer.
  pOutBuff            : Pointer;          // Pointer to output buffer.
                                          // Filled by plug-in if execution of  
                                          // the function was successful.             
                                                   
  dwInSize            : DWORD;            // Size of input buffer.
  dwOutSize           : DWORD;            // Size of output buffer.
                                          // Filled by plug-in if execution of  
                                          // the function was successful.
  dwInterface         : DWORD;            // Interface ID. Read Only!
  dwIndex             : DWORD;            // Index. (For internal use by PEX). 
                                          // Read Only!
 end;



//-----------------------------------------------------------------------------
// The function executed prior to beginning data processing by PEX.
// This function provides a generic means to perform any startup processing.
// In the body of this function it is possible, for example, to place the code 
// to unpack any packed files, and transmit them to PEX for further processing. 
//
// Input:  - the function receives PPGIParamsBlock and uses values sent to it.
// Output: - returns True if execution was successful, otherwise it returns 
//           False.
//
function PexPreloadImage(pPGIPB: PPGIParamsBlock): Boolean; stdcall;
const
 DemoMessage1 = 'Emulating Execution...';
 DemoMessage2 = 'Allocating memory ...';
 DemoMessage3 = 'Copy InBuff to OutBuff...';
 DemoMessage4 = 'Runtime error: PexPreloadImage';

var MA : TMemoryAllocator;
    CB : TPGICallBack;
begin
 // We have to return True if success and False in all 
 // other cases (error occurred, haven't found data we can work with).
 Result := False;
 // Getting pointer to CallBack function
 @CB := pPGIPB.pCallBack;
 // Getting pointer to function that allocates memory
 @MA := pPGIPB.pMemAllocator;

 // Emulating execution of the function
 try
  // Posting an event to the log.
  if (@CB <> nil) then
     CB(pPGIPB.dwInterface, evID_PostLogInfo, PChar(DemoMessage1));

  // Place your code here. For example, we will move input buffer to
  // output buffer.
  //
  //***************************************************************************
  // Posting an event to the log.
  if (@CB <> nil) then
     CB(pPGIPB.dwInterface, evID_PostLogInfo, PChar(DemoMessage2));

  // Asking PEX for allocating memory, and filling out the required fields
  // in the structure. 
  pPGIPB.pOutBuff  := MA(pPGIPB.dwInSize);
  pPGIPB.dwOutSize := pPGIPB.dwInSize;

  // Moving data from one buffer to another.
  System.Move(pPGIPB.pInBuff^, pPGIPB.pOutBuff^, pPGIPB.dwInSize);

  // Posting an event to the log.
  if (@CB <> nil) then
     CB(pPGIPB.dwInterface, evID_PostLogInfo, PChar(DemoMessage3));

  // Everything is OK
  Result := True;
  //***************************************************************************
  //
 except
  // An error occurred while executing. Posting an event to the log.
  if (@CB <> nil) then
     CB(pPGIPB.dwInterface, evID_PostLogInfo, PChar(DemoMessage4));
 end;
end;


//---------------------------------------------------------------------------
// Optional procedure.
//
// If this procedure is present, PE Explorer adds an entry titled "Plug-ins - 
// About <Name>"  to the menu.  The name is obtained by PE Explorer when the 
// plug-in is registered.  This menu options allows infomormation about the 
// plug-in to be displayed to the user.
//
procedure PexAboutPlugIn; Export; StdCall;
var S : String;
begin
 // Place your code that displays 'About' info here.
 // We are just showing MessageBox.
 //***************************************************************************
 S := IName + '.' + #$0D#$0A +'Version 1.0';
 Windows.MessageBox(0, PChar(S), PChar('About'), MB_OK or MB_ICONINFORMATION);
end;


//---------------------------------------------------------------------------
// The procedure called at Plug-in registration.
//
//  This should return to PE Explorer a pointer to the line, which contains the 
//  plug-in name. PE Explorer uses this to associate the plug-in with any menu 
//  items and events it provides.
//
//  IMPORTANT: The line should not be empty. The plug-in will not be registered 
//             if an empty line is given.
//
procedure PexRegisterPlugIn(var N: PChar); Export; StdCall;
begin
 N := PChar(IName);
end;


//---------------------------------------------------------------------------
exports
  PexRegisterPlugIn   index 1,
  PexAboutPlugIn      index 2,
  PexPreloadImage     index 3;
//---------------------------------------------------------------------------

begin
end.

