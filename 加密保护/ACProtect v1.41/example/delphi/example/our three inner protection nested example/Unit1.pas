Unit Unit1;

Interface

Uses
     Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ShellApi;

Type
     TForm1 = Class(TForm)
          Label1: TLabel;
          Label2: TLabel;
          lbtrialtime: TLabel;
          Label4: TLabel;
          Label5: TLabel;
          lbusername: TLabel;
          Ok: TButton;
          Label3: TLabel;
          Label6: TLabel;
          Memo1: TMemo;
          Procedure OkClick(Sender: TObject);
          Procedure Label6Click(Sender: TObject);
          Procedure FormCreate(Sender: TObject);
     private
          { Private declarations }
     public
          { Public declarations }
     End;

Var
     Form1: TForm1;
     KeyCorrect: boolean;
Implementation

{$R *.dfm}

Procedure TForm1.OkClick(Sender: TObject);
Begin
     Close;
End;

Procedure TForm1.Label6Click(Sender: TObject);
Begin
     ShellExecute(0, 'open', 'http://www.ultraprotect.com', Nil, Nil, SW_SHOW);
End;

Procedure TForm1.FormCreate(Sender: TObject);
Var usrname: Array[0..255] Of char;
     a: byte;
Begin
     memo1.clear;
     Memo1.Lines.Add('Status:'+#13+#10);
     {$I ..\..\include\critic_begin.inc} //dynamic lock begin
     Memo1.lines.add('Dynamic En/Decrypt here!');
     {$I ..\..\include\protect_begin.inc} //the embedded lock header and sapce
     Memo1.lines.add('EmbeddedProtection here!');
     fillchar(usrname, 256, #0);
     //Get User name from UltraProtect loader
     MessageBox($FFFFFFFF, @usrname[0], Nil, 0);
     If trim(usrname) <> '' Then
          lbusername.caption := usrname
     Else
     Begin
          lbusername.caption := 'unregistered user';
          //Get Trial UsageTime from UltraProtect loader if required
          MessageBox($FFFFFFFF, @a, Nil, 1);
          lbtrialtime.caption := inttostr(a);
     End;
     KeyCorrect := false;
     {$I ..\..\include\regonly_begin.inc} //RSA lock code begin
     KeyCorrect := true;
     {$I ..\..\include\regonly_end.inc} //RSA lock code end
     If keycorrect = false Then Begin
          showmessage('Only licensed user can use this function');
          Memo1.lines.add('RSA LOCK  here :-<');
     End Else Memo1.lines.add('RSA UnlOCK  here :-)');

     {$I ..\..\include\protect_end.inc} //the embedded lock tail and sapce
     {$I ..\..\include\critic_end.inc} //dynamic lock end
End;

End.

