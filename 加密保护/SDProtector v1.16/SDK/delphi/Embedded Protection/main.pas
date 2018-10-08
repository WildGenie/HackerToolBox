unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TDemo = class(TForm)
    btDemo: TButton;
    btLock: TButton;
    btClear: TButton;
    btEmbed: TButton;
    btExit: TButton;
    procedure btDemoClick(Sender: TObject);
    procedure btLockClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure btEmbedClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.DFM}

// IMPORTANT : Don't forget to protect examples before
// test in order to see how these marks work!

procedure TDemo.btDemoClick(Sender: TObject);
begin
      {$I ..\include\DEMO_BLOCK_START.INC}    //demo code begin
       MessageBox(Handle, 'Welcome, you are registered user!','',MB_OK);
      {$I ..\include\DEMO_BLOCK_END.INC}      //demo code end
       MessageBox(Handle, 'without correct key, you can only see this message.','Info',MB_OK);

end;

procedure TDemo.btLockClick(Sender: TObject);
begin
      {$I ..\include\LOCK_BLOCK_START.INC}
      MessageBox(Handle, 'The code executed will be encrypted after protection','Info',MB_OK);
      {$I ..\include\LOCK_BLOCK_END.INC}
end;

procedure TDemo.btClearClick(Sender: TObject);
begin
     {$I ..\include\CLEAR_BLOCK_START.INC}
       MessageBox(Handle,'After protection, You can only see this message once because the code between CLEAR_BLOCK_START.INC and CLEAR_BLOCK_END.INC will be destroyed after the first execution.','Info',MB_OK);
     {$I ..\include\CLEAR_BLOCK_END.INC}
end;

procedure TDemo.btEmbedClick(Sender: TObject);
begin
       {$I ..\include\EMBED_BLOCK_START.INC}
       MessageBox(Handle,'Code protected by embedded protector, which will defeat debuggers and other crack tools','Info',MB_OK);
       {$I ..\include\EMBED_BLOCK_END.INC}
end;

procedure TDemo.btExitClick(Sender: TObject);
begin
Close();
end;

end.
