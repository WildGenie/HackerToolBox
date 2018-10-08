program ctc;

uses
  Forms,
  main in 'main.pas' {Main_Form},
  about in 'about.pas' {About_Form},
  crea in 'crea.pas' {Crea_Form},
  goji in 'goji.pas' {Gaoji_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TAbout_Form, About_Form);
  Application.CreateForm(TCrea_Form, Crea_Form);
  Application.CreateForm(TGaoji_Form, Gaoji_Form);
  Application.Run;
end.
