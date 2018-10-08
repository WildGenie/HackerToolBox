program example;

uses
  Forms,
  main in 'main.pas' {Demo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDemo, Demo);
  Application.Run;
end.
