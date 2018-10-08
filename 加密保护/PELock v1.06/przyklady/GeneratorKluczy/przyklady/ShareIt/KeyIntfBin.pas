unit KeyIntfBin;
{
  element 5 AG / ShareIt!
  key generator interface
  version 2.6

  DO NOT MODIFY THIS FILE!
}

interface

uses
  Windows, SysUtils, Classes;

const // error result codes supported by element 5
  ERC_SUCCESS = 0;
  ERC_SUCCESS_BIN = 1;  // for binary keys

  ERC_ERROR = 10;
  ERC_MEMORY = 11;
  ERC_FILE_IO = 12;
  ERC_BAD_ARGS = 13;
  ERC_BAD_INPUT = 14;
  ERC_EXPIRED = 15;
  ERC_INTERNAL = 16;

// use this function to get the value of input parameters
function Value(key: string): string;

// main entry point
procedure Main;

var
  gList: TStrings; // holds input parameters

implementation

uses
  KeyUser;

// use this function to get the value of input parameters
function Value(key: string): string;
begin
  try
    result := gList.Values[key];
  except
    result := '';
  end;
end;

// write a string to the given filename
procedure WriteFile(filename, value: string);
var
  fout: File of Byte;
  i: Integer;
begin
  if (filename = '') or (value = '') then exit; // happens only when writing exception file

  // write output data
  AssignFile(fout, filename);
{$I-}
  Rewrite(fout);

  for i := 1 to Length(value) do
    Write(fout, Byte(value[i]));

  CloseFile(fout);
{$I+}
  if IOResult <> 0 then
    raise Exception.Create('i/o error on write');
end;

// main function ** DO NOT CHANGE **
procedure Generate;
var
  name, mime, bin: string;
begin
  // check parameter count
  if (ParamCount <> 3) then begin
    ExitCode := ERC_BAD_INPUT;
    raise Exception.Create('bad args: ' + IntToStr(ParamCount));
  end;

  // see if input file supplied
  if not FileExists(ParamStr(1)) then begin
    ExitCode := ERC_FILE_IO;
    raise Exception.Create('file not found: ' + ParamStr(1));
  end;

  // load input values
  gList.LoadFromFile(ParamStr(1));

  // call key generator
  name := '';
  mime := 'application/octet-stream'; // default mime type
  SetLength(bin, 0);
  ExitCode := GenerateBinKey(name, mime, bin);

  // write output if successful
  WriteFile(ParamStr(2), mime + ':' + name);
  WriteFile(ParamStr(3), bin);
end;

procedure Main;
begin
  writeln(Title);
  gList := TStringList.Create;
  try
    Generate;

  except
    on E: Exception do begin
      // update exit code only if it does not yet report an error
      if ExitCode < ERC_ERROR then ExitCode := ERC_INTERNAL;
      writeln(E.Message);

      try // to write error to first output file
        WriteFile(ParamStr(2), 'ERROR: ' + E.Message);
      except // print to console
        on E: Exception do writeln(E.Message);
      end;
    end;
  end;

  gList.Free;
end;

end.
