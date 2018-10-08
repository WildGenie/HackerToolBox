// This example shows a way how protect some parts of code with encryption
uses Windows,Sysutils,Special;

function TraslateToHex(Buf:pchar; sz:integer):string;
var I:integer;
var D:integer;
var M:integer;
begin
  result:='';
  M:=0;
  for I:=0 to sz-1 do
  begin
        M:=I*4;
        for D:=3 downto 0 do result:=result+IntToHex(ord(Buf[D+M]),2);
  end;
end;

procedure CopyToClipboard(const s:string);
var m:dword;
begin
  m:=GlobalAlloc(GMEM_MOVEABLE or GMEM_DDESHARE,length(s)+1);
  lstrcpy(GlobalLock(m),pchar(s));
  GlobalUnlock(m);
  OpenClipboard(0);
  EmptyClipboard;
  SetClipboardData(cf_text,m);
  CloseClipboard;
end;

procedure Test;
var
  hardware_key,unregistered_msg:string;
  registration_info,HWInformation:array[0..255] of char;
begin
  messagebox(0,'Encryption blocks example!','',0);
  {$I .\include\delphi_svkp_block_begin.inc}  //Start of encrypted block

  //Code inside this block will be decrypted only for users with valid registration key
  messagebox(0,'Registered version!','',0);   //a message for registered users
  //Add here an useful code available only for registered users...

  {$I .\include\delphi_svkp_block_end.inc}    //End of encrypted block

  if SVKP_GetRegistrationInformation(registration_info)<>1 then begin
    //This is part for unregistered users
    SVKP_GetHWInfo(HWInformation); //Get Hardware ID
    hardware_key:=TraslateToHex(HWInformation,4);
    unregistered_msg:=
     'You can buy our product at www...'#10#10+
     'Please send us your Hardware ID:'#10+hardware_key+#10#10+
     'Your Hardware ID was copied to clipboard, please paste it to e-mail'#10#10+
     'Now try to create registration key for this project and Hardware ID in SVKP.';
    messagebox(0,pchar(unregistered_msg),'Unregistered version!',0);
    CopyToClipboard(hardware_key); //copy Hardware ID to clipboard
  end;
end;

begin
  Test;
end.

(*Note1: Never use encrypted blocks like this:

        {$I .\include\delphi_svkp_block_begin.inc}  //Start of encrypted block
                SaveProject(NameOfProjectFile);
        {$I .\include\delphi_svkp_block_end.inc}   //End of encrypted block

Because You will encrypt only call to function and function's code will be not
encrypted. Then is possible for cracker to find that function and to patch call.
*)

(* Note2: Please don't use flags, there are SVKP API functions. Please check examples
(SVKP_GetRegistrationInformation)
Don't use something like this:

        registered_flag := true;
        {$I .\include\delphi_svkp_block_begin.inc}  //Start of encrypted block
                SaveProject(NameOfProjectFile);
                registered_flag := false;
        {$I .\include\delphi_svkp_block_end.inc}   //End of encrypted block
        if registered_flag then begin
          ActionForUnregisteredUsers()
        end;
*)

(*Note3: Please don't use something like this -> goto skip_unregistered_part;

        {$I .\include\delphi_svkp_block_begin.inc}  //Start of encrypted block
                SaveProject(NameOfProjectFile);
                goto skip_unregistered_part;
        {$I .\include\delphi_svkp_block_end.inc}   //End of encrypted block
        ActionForUnregisteredUsers()
skip_unregistered_part:

*)
