library plugin;

{$mode objfpc}{$H+}

uses
  Classes
  { you can add units after this };

{$R *.res}

function Enigma_Plugin_About : PWideChar;
begin
  // Function returns a wide string that will be shown in about column in Enigma Miscellaneous - Plugins
  Enigma_Plugin_About := 'Plugin short description';
end;

function Enigma_Plugin_Description : PWideChar;
begin
  // Function returns a wide string that will be shown after user clicks on the plugin in Enigma Miscellaneous - Plugins
  // It may contain, for example, usage instructions
  Enigma_Plugin_Description := 'Plugin wide description';
end;

procedure Enigma_Plugin_OnInit;
begin
  // This function is calling when the protected file is being initialized
  // when main program is not initialized yet
end;

procedure Enigma_Plugin_OnFinal;
begin
  // This function is calling when the protected file is initilized,
  // main program encrypted and ready for execution
end;

exports
  Enigma_Plugin_About,
  Enigma_Plugin_Description,
  Enigma_Plugin_OnInit,
  Enigma_Plugin_OnFinal;

begin
end.

