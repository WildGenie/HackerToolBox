program loader;

uses
  Windows;

begin

  if LoadLibrary('test.dll') < 32 then
      MessageBox(0,'can''t load dll!','error',0);

end.