Program example;

Uses Windows;

{$APPTYPE CONSOLE}


begin
 Writeln('Delphi sample');

 {$I '..\..\Code Markers SDK\Delphi\begin_hide.inc'}
 // file is protected?
 if GetProcAddress(0,PChar(2))=nil Then
  begin
   Writeln('Sorry, file not protected!');
   Readln;
   Halt;
  end;
 {$I '..\..\Code Markers SDK\Delphi\end_hide.inc'}


 // have key?
 If GetProcAddress(0,PChar(0))=Pointer(1) then
  begin
   {$I '..\..\Code Markers SDK\Delphi\begin_key.inc'}
   Writeln('Application has a valid key!');
   Writeln('Registered to: ', PAnsiChar(GetProcAddress(0,PChar(1))));
   {$I '..\..\Code Markers SDK\Delphi\end_key.inc'}
  end
 Else
  begin
   {$I '..\..\Code Markers SDK\Delphi\begin_vm.inc'}
   Writeln('Demo version =)');
   Writeln('LicenseID: ', PAnsiChar(GetProcAddress(0,PChar(3))));
   {$I '..\..\Code Markers SDK\Delphi\end_vm.inc'}
  end;

 Readln;
end.
