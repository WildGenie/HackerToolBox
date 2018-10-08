program test;

uses
  Windows,
  main in 'main.pas';

const
  MessageTitle = 'Information'; 
  MessageStr   = 'This example shows the way of using external registration scheme.'#13#10+
                 'It uses a constant located in file test.bin.'#13#10#13#10+
                 'Don''t  forget to protect the example in order to see the work of ASProtect API'; 
begin 
  MessageBox(0, MessageStr, MessageTitle, MB_ICONINFORMATION );
  Start;
end.
