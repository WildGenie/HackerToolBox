program KeyGenDemo;

uses
  Forms,
  Main in 'Main.pas' {Form3},
  EXECryptorKeyGen in 'EXECryptorKeyGen.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
